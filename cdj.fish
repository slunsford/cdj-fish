function cdj
    # Update with your document root folder
    set jd_root ~/Documents/JD

    if test (count $argv) -eq 1
        # Single argument: navigate to ID folder
        set matches $jd_root/*/*/$argv[1]*/
        if test (count $matches) -eq 1
            cd $matches[1]
        else if test (count $matches) -gt 1
            echo "Multiple matches found:"
            printf '%s\n' $matches
            return 1
        else
            echo "No matches found for: $argv[1]"
            return 1
        end
    else if test (count $argv) -eq 2
        # Two arguments: navigate to specific subfolder (case-insensitive)
        # Fish doesn't have native case-insensitive globbing, so we'll use find
        set id_match $jd_root/*/*/$argv[1]*/
        if test (count $id_match) -eq 0
            echo "No ID matches found for: $argv[1]"
            return 1
        end

        set matches (find $id_match[1] -maxdepth 2 -type d -iname "*$argv[2]*" 2>/dev/null | head -n 1)
        if test -n "$matches"
            cd $matches
        else
            echo "No subfolder matches found for: $argv[2]"
            return 1
        end
    else
        echo "Usage: cdj <ID> [subfolder]"
        return 1
    end
end
