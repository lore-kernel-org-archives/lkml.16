Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048C1E502;
	Thu, 24 Apr 2025 02:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745463091; cv=none; b=fEIrrBoiMtH4vanigvKuwzYpUZOG0YXPFJkppdg6ile++/eUMSq+4AOBcsIlnxezETnLIpAeF9jc9P2qLcyGxoEMOWIF2yjatEhWmyu9KIYtqwoZfFl6+lpNacQh7y4tcMkkcpi/CjSHn/Tyixf4RLsTaWDJG2VYax09bertsJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745463091; c=relaxed/simple;
	bh=5eLimYjAs9IUgV4p8sHo53fodXOGP+VyuSVvK8Jm/hM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TwsC25BOplcZMcZcDITDY+gHA9U9SHdF8czWsPfSnrQ0vuqFkKrL4SRBWCBDYlZEzjO2ZgIo0nyuh2D8YyKxlrysOnkNFkF4ClLhl1wBHomf3wMrogvd00Ye51g/bjGEwc7EOvR677aR6VWWW7liCWqE+wB0GCQYaxh6nfdpUpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLGctXxc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLGctXxc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2D7C4CEE2;
	Thu, 24 Apr 2025 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745463090;
	bh=5eLimYjAs9IUgV4p8sHo53fodXOGP+VyuSVvK8Jm/hM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aLGctXxcQyYMWbhmm0iRzI0ZJj/r44OWLqzwD/UgzAgwNANRjm3bqG3y/spF0ccR0
	 KxojT4Gsfxa1GbJA0y7SKKlQTnP+MLldDot9Ikcy6s2lzNnLVPI0ySHWiFtAlgnqSj
	 wmnRa33KIQ9YsGjHF9BtKFDow6WADGnnB3EhdnJD/0NvJGdyRyatqkG+gJmwqCks55
	 LfJUjz40QFYR02eYAt+hrSqq1ltKAYEsYJdLgbbAO5wtv7kIi9py2UJUUa8vKh1ckS
	 lJsFhqrXZjdUj2L1fbPQgorZK9m5Df9KsyGjUW6PoB21RM2n7artmLLHJVpaCrqJ98
	 edXvZm48o2Gmw==
From: SeongJae Park <sj@kernel.org>
To: Ye Liu <ye.liu@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	linux-debuggers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-toolchains@vger.kernel.org,
	osandov@osandov.com,
	paulmck@kernel.org,
	sweettea-kernel@dorminy.me,
	liuye@kylinos.cn
Subject: Re: [PATCH v3] tools/mm: Add script to display page state for a given PID and VADDR
Date: Wed, 23 Apr 2025 19:51:28 -0700
Message-Id: <20250424025128.48038-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <758b1d83-f1b3-43d2-8c37-324cc89c78f7@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 24 Apr 2025 09:55:22 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> 
> 在 2025/4/24 06:00, SeongJae Park 写道:
> > On Wed, 23 Apr 2025 09:48:50 +0800 Ye Liu <ye.liu@linux.dev> wrote:
> >
> >> From: Ye Liu <liuye@kylinos.cn>
> >>
> >> Introduces a new drgn script, `show_page_info.py`, which allows users
> >> to analyze the state of a page given a process ID (PID) and a virtual
> >> address (VADDR). This can help kernel developers or debuggers easily
> >> inspect page-related information in a live kernel or vmcore.
> >>
> >> The script extracts information such as the page flags, mapping, and
> >> other metadata relevant to diagnosing memory issues.
> >>
> >> Output example:
> >> sudo ./show_page_info.py 1 0x7f43df5acf00
> >> PID: 1 Comm: systemd mm: 0xffff8881273bbc40
> >> Raw: 0017ffffc000416c ffffea00043a4508 ffffea0004381e08 ffff88810f086a70
> >> Raw: 0000000000000000 ffff888120c9b0c0 0000002500000007 ffff88812642c000
> >> User Virtual Address: 0x7f43df5acf00
> >> Page Address:         0xffffea00049a0b00
> >> Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
> >> 		      PG_private|PG_reported
> >> Page Size:            16384
> > Should this be called folio size?  Or, could this simply removed since Compound
> > Order is given below?
> 
> 
> Page size refers to the base page size, which equals PAGESIZE.

Shouldn't 'prog["PAGE_SIZE"]' is used for what you are saying?  This tool is
using drgn.helpers.linux.page_size()[1] to print this, though?

    +def show_page_state(page, addr, mm, pid, task):
    +    """Display detailed information about a page."""
    +    print(f'PID: {pid} Comm: {task.comm.string_().decode()} mm: {hex(mm)}')
    +    print(format_page_data(prog.read(page.value_(), 64)))
    +    fields = {
    +        "User Virtual Address": hex(addr),
    +        "Page Address": hex(page.value_()),
    +        "Page Flags": decode_page_flags(page),
    +        "Page Size": page_size(page).value_(),

[1] https://drgn.readthedocs.io/en/stable/helpers.html#drgn.helpers.linux.mm.page_size

> Folio size can be calculated using the Compound Order, but of course,
> it can also be shown directly as a result.
> 
> >> Page PFN:             0x12682c
> >> Page Physical:        0x12682c000
> >> Page Virtual:         0xffff88812682c000
> >> Page Refcount:        37
> >> Page Mapcount:        7
> >> Page Index:           0x0
> >> Page Memcg Data:      0xffff88812642c000
> >> Memcg Name:           init.scope
> >> Memcg Path:           /sys/fs/cgroup/memory/init.scope
> >> Page Mapping:         0xffff88810f086a70
> >> Page Anon/File:       File
> >> Page VMA:             0xffff88810e4af3b8
> >> VMA Start:            0x7f43df5ac000
> >> VMA End:              0x7f43df5b0000
> >> This page is part of a compound page.
> >> This page is the head page of a compound page.
> >> Head Page:            0xffffea00049a0b00
> >> Compound Order:       2
> >> Number of Pages:      4
> >>
> >> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> >>
> >> Changes in v3:
> >> - Adjust display style.
> >> - Link to v2:https://lore.kernel.org/all/20250421080748.114750-1-ye.liu@linux.dev/
> >>
> >> Changes in v2:
> >> - Move the show_page_info.py file to tools/mm.
> >> - Link to v1: https://lore.kernel.org/all/20250415075024.248232-1-ye.liu@linux.dev/
> >> ---
> >>  MAINTAINERS                |   5 ++
> >>  tools/mm/show_page_info.py | 120 +++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 125 insertions(+)
> >>  create mode 100755 tools/mm/show_page_info.py
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index 17ed0b5ffdd2..85686a30dc72 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -18351,6 +18351,11 @@ F:	Documentation/mm/page_table_check.rst
> >>  F:	include/linux/page_table_check.h
> >>  F:	mm/page_table_check.c
> >>  
> >> +PAGE STATE DEBUG SCRIPT
> >> +M:	Ye Liu <liuye@kylinos.cn>
> >> +S:	Maintained
> >> +F:	tools/mm/show_page_info.py
> >> +
> >>  PANASONIC LAPTOP ACPI EXTRAS DRIVER
> >>  M:	Kenneth Chan <kenneth.t.chan@gmail.com>
> >>  L:	platform-driver-x86@vger.kernel.org
> >> diff --git a/tools/mm/show_page_info.py b/tools/mm/show_page_info.py
> >> new file mode 100755
> >> index 000000000000..8622c5499dfe
> >> --- /dev/null
> >> +++ b/tools/mm/show_page_info.py
> > [...]
> >> +def main():
> >> +    """Main function to parse arguments and display page state."""
> >> +    parser = argparse.ArgumentParser(description=DESC, formatter_class=argparse.RawTextHelpFormatter)
> >> +    parser.add_argument('pid', metavar='PID', type=int, help='Target process ID (PID)')
> >> +    parser.add_argument('vaddr', metavar='VADDR', type=str, help='Target virtual address in hexadecimal format (e.g., 0x7fff1234abcd)')
> >> +    args = parser.parse_args()
> >> +
> >> +    try:
> >> +        vaddr = int(args.vaddr, 16)
> >> +    except ValueError:
> >> +        print(f"Error: Invalid virtual address format: {args.vaddr}")
> >> +        return
> >> +
> >> +    task = find_task(args.pid)
> >> +    mm = task.mm
> >> +    page = follow_page(mm, vaddr)
> > I tried this script on my test machine and got the below error:
> >
> > $ cat ./a.c
> > #include <stdio.h>
> >
> > int main(void)
> > {
> >         int foo;
> >         printf("hello\n");
> >         printf("%x\n", &foo);
> 
> To avoid address truncation, you can use the %p format specifier
> instead of %x or %lx when printing a pointer (memory address).  

Ah, you're correct, thank you.  After fixing my test, the error I reported
before is disappeared.  But I think the follow_page() error handling would
better to be updated to catch the exception and provide a better error message?

Also, I'm getting below new error:

    $ sudo ./tools/mm/show_page_info.py 47657 0x7fffaf925b6c
    PID: 47657 Comm: a.out mm: 0xffff959c8a022100
    Raw: 0017ffffc0020828 ffffea6b0c201408 ffffea6b0fc65648 ffff959d32bec9c1
    Raw: 00000007fffffffc 0000000000000000 0000000100000000 ffff959cba058000
    Traceback (most recent call last):
      File "/usr/local/bin/drgn", line 33, in <module>
        sys.exit(load_entry_point('drgn==0.0.30+82.ge2b60e4b', 'console_scripts', 'drgn')())
                 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
      File "/usr/local/lib/python3.11/dist-packages/drgn-0.0.30+82.ge2b60e4b-py3.11-linux-x86_64.egg/drgn/cli.py", line 461, in _main
        runpy.run_path(script, init_globals={"prog": prog}, run_name="__main__")
      File "<frozen runpy>", line 291, in run_path
      File "<frozen runpy>", line 98, in _run_module_code
      File "<frozen runpy>", line 88, in _run_code
      File "./tools/mm/show_page_info.py", line 120, in <module>
        main()
      File "./tools/mm/show_page_info.py", line 115, in main
        show_page_state(page, vaddr, mm, args.pid, task)
      File "./tools/mm/show_page_info.py", line 63, in show_page_state
        memcg_name, memcg_path = get_memcg_info(page)
                                 ^^^^^^^^^^^^^^^^^^^^
      File "./tools/mm/show_page_info.py", line 43, in get_memcg_info
        return cgroup_name(cgrp).decode(), f"/sys/fs/cgroup/memory{cgroup_path(cgrp).decode()}"
               ^^^^^^^^^^^^^^^^^
      File "/usr/local/lib/python3.11/dist-packages/drgn-0.0.30+82.ge2b60e4b-py3.11-linux-x86_64.egg/drgn/helpers/linux/cgroup.py", line 71, in cgroup_name
        return kernfs_name(cgrp.kn)
               ^^^^^^^^^^^^^^^^^^^^
      File "/usr/local/lib/python3.11/dist-packages/drgn-0.0.30+82.ge2b60e4b-py3.11-linux-x86_64.egg/drgn/helpers/linux/kernfs.py", line 32, in kernfs_name
        return kn.name.string_() if kn.parent else b"/"
                                    ^^^^^^^^^
    AttributeError: 'struct kernfs_node' has no member 'parent'. Did you mean: '__parent'?

Seems not entirely this script's fault but due to the recent 'struct
kernfs_node' change or my old version of drgn?  But anyway, I think it is
better to provide a better error message to users.  I'm also curious if you
have a plan for finding and fixing or avoiding this kind of future breakages.


Thanks,
SJ

[...]
