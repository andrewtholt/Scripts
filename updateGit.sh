#!/usr/bin/ruby

def main

    ok = "nothing to commit, working directory clean\n"

    home = ENV["HOME"]

    rd = home + "/Source"

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

main

