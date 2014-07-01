require "ar"
require "zlib"
require "stringio"
require "rubygems/package"

class Deb
  VERSION="0.1"

  attr_reader :archive
  def initialize(filename, options = {})
    @sourcefile = filename
    @archive = Ar.new(filename)
    @archive.load
    @control_archive = nil

    nil
  end

  def control
    control = Hash.new
    if @control_archive.nil?
      get_control_archive()
    end

    lastfield = nil
    @control_archive["control"].lines.each do |l|
      m = l.match(/(?<field>\w+-*\w*):\ (?<value>.*)/)
      # standard "key: value"
      if m
        control[m["field"]] = m["value"].strip
        lastfield = m["field"]
      else # previous field was multilined, aggregate
        control[lastfield] += l.strip
      end
    end

    control
  end

  def control_files
    if @control_archive.nil?
      get_control_archive()
    end

    @control_archive.keys
  end

  # allow to access any file in control_archive
  def method_missing(m)
    if @control_archive.nil?
      get_control_archive()
    end

    if control_files.include?(m.to_s)
      @control_archive[m.to_s]
    end
  end

  private

  def get_control_archive()
    entries = Hash.new
    ca_payload = @archive.get_payload("control.tar.gz")
    gz = Zlib::GzipReader.new(StringIO.new(ca_payload))
    Gem::Package::TarReader.new(StringIO.new(gz.read)) do |tar|
      tar.each do |tarfile|
        filename = tarfile.full_name
        filename.gsub!(/^\.\//, "")
        entries[filename] = tarfile.read
      end
    end

    entries.delete("")
    @control_archive = entries
  end

end
