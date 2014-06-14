#!/usr/bin/ruby

def updateDirs(rd)

    ok = "nothing to commit, working directory clean\n"


    if File.exists?( rd ) then

        Dir.entries( rd ).each do | d | 
        if not (d == "." or d == "..") then
                t = rd + "/" + d
                puts t
                Dir.chdir( t )

                if File.exists?( ".git" ) then
                    puts ".git exists"

                    f = IO.popen( "git pull") 
                    data = f.readlines
                    puts data[1]

                    if data[1] == ok then
                        puts "Nothing to do."
                    end
                else
                    puts "No .git exists"
                end
                puts "========="
            end
        end
    end
end

def main
    home = ENV["HOME"]

    if ARGV.length == 0
        folder = home + "/Source"
    else
        folder = ARGV[0]
    end

    puts folder

    updateDirs(folder)

end

main

