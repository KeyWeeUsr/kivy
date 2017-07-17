Files for building manylinux wheels with custom CentOS 7 image - missing deps,
too old packages, etc.

* build_wheels.sh
    * the whole building of our-only stuff is here

* custom_policy.json
    * edited policy, so that it accepted GLIBC 2.17 (and 2.14 for some reason,
      although the version in the OS is 2.17)

* custom_elfutils.py
    * edited elf_read_dt_needed, so that it doesn't catapults itself because
      of a missing attribute that means we can return the empty list anyway
      (maybe bug)

        def elf_read_dt_needed(fn : str) -> List[str]:
            needed = []
            with open(fn, 'rb') as f:
                elf = ELFFile(f)
                section = elf.get_section_by_name('.dynamic')
                if section is None:
                    raise ValueError('Could not find soname in %s' % fn)

                if not hasattr(section, 'iter_tags'):
                    return needed

                for t in section.iter_tags():
                    if t.entry.d_tag == 'DT_NEEDED':
                        needed.append(t.needed)

            return needed

* libs_wheel.py
    * basically take the template setup.py and make a custom one for kivy.deps

* test_wheels.sh
    * install and run test cases out of the Docker image. If passes, the wheels
      should work on other distros without problems

* Dockerfile-i686.txt
    * old attempt for using official PyPA instructions, hopefully will be
      useful for manylinux2
