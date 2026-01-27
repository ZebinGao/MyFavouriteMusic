#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script to remove spaces from MP3 and audio file names in the music folder.
"""
import os
import sys

def remove_spaces_from_filenames(music_dir):
    """
    Remove spaces from all audio file names in the specified directory.
    
    Args:
        music_dir: Path to the music directory
    """
    # Audio file extensions to process
    audio_extensions = ['.mp3', '.m4a', '.wav', '.flac', '.ogg']
    
    # Get all audio files
    audio_files = []
    for filename in os.listdir(music_dir):
        # Check if it's an audio file
        if any(filename.lower().endswith(ext) for ext in audio_extensions):
            if ' ' in filename:
                audio_files.append(filename)
    
    print(f"Found {len(audio_files)} audio files with spaces in their names.")
    
    # Rename files
    renamed_count = 0
    for old_name in audio_files:
        old_path = os.path.join(music_dir, old_name)
        
        # Remove spaces from filename (keep extension)
        name_part = os.path.splitext(old_name)[0]
        ext = os.path.splitext(old_name)[1]
        new_name = name_part.replace(' ', '') + ext
        new_path = os.path.join(music_dir, new_name)
        
        # Check if new name already exists
        if os.path.exists(new_path):
            print(f"⚠️  Skipped: '{old_name}' -> '{new_name}' (file already exists)")
            continue
        
        try:
            os.rename(old_path, new_path)
            print(f"✓ Renamed: '{old_name}' -> '{new_name}'")
            renamed_count += 1
        except Exception as e:
            print(f"✗ Error renaming '{old_name}': {e}")
    
    print(f"\n✓ Successfully renamed {renamed_count} out of {len(audio_files)} files.")

if __name__ == "__main__":
    # Music directory path
    music_dir = os.path.join(os.path.dirname(__file__), '音乐')
    
    # Check if music directory exists
    if not os.path.exists(music_dir):
        print(f"Error: Music directory not found: {music_dir}")
        sys.exit(1)
    
    print("=" * 60)
    print("Removing spaces from audio file names...")
    print("=" * 60)
    print(f"Music directory: {music_dir}\n")
    
    remove_spaces_from_filenames(music_dir)
    
    print("\n" + "=" * 60)
    print("Done!")
    print("=" * 60)