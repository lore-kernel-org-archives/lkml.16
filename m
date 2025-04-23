Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393582AD2F;
	Wed, 23 Apr 2025 22:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745445621; cv=none; b=M4Zkfcm1H6xMEfKUzz7sP552DK+hkl8sugU6IyhqMdwoC34UIfkyQEpKgwRC1uY4HjYFKTMH9i2ddpKZO5kfgVKmQJq85I9+5AvS/TK8eqaQN3ubzuNTKj5WKpKRBJKGpGwt5L2LlmIKbS5/iSOj8v815Gj9DllOK9bl/P0hKig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745445621; c=relaxed/simple;
	bh=xld+VoV53U8iJEngkFS9wdEIMdzNHJgri52xFjZ3HQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PgURf7NLch5fofTMmTd6Pj7spTU4/D5dQPXnV7bK9grOMcu3BQVJSUf7TTc+R6gpbDEzgeUAvMUZupBzOMfez+lkmjUadgFlJ58khgmL+sPAQkvqDGoscDFqaK1GC98RdEDja+UmzcEzxum1kShpa3tNIeF/HpWjotJXu7VpMMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLrPW9ai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLrPW9ai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E09FEC4CEE2;
	Wed, 23 Apr 2025 22:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745445621;
	bh=xld+VoV53U8iJEngkFS9wdEIMdzNHJgri52xFjZ3HQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vLrPW9aitySK4LgFfX0+RXjm26Jmxh+5O2meoV4ozpE8mz6M6rr1HQHJ52/Ho4XLg
	 KHAJNOsqigFLF0xzq7BEH/1PCQ+uzt1Un/LblgGltmbXWVG6NgHWeAEGoJJ4XneJpU
	 JEo/c2r2WsK8/B9RiDUxhHBXCw+CqsOEwUfZZ7/2ux2sDwGG1VuC1NzWVjVoTAwTuZ
	 6EORJy0ld139oY8LS12i8nB36Ht2igPgv2Cf65nJdkYdwgBPBN+iaCSBd7dw8dZuXC
	 AnjIb485TkknSOONevxhrCmSbppxemmS3mAExQOrzVZDRijm2ApQ+pP5lB1eG9rK5n
	 HRF58FkLfvP6g==
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
Date: Wed, 23 Apr 2025 15:00:18 -0700
Message-Id: <20250423220018.45789-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423014850.344501-1-ye.liu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 23 Apr 2025 09:48:50 +0800 Ye Liu <ye.liu@linux.dev> wrote:

> From: Ye Liu <liuye@kylinos.cn>
> 
> Introduces a new drgn script, `show_page_info.py`, which allows users
> to analyze the state of a page given a process ID (PID) and a virtual
> address (VADDR). This can help kernel developers or debuggers easily
> inspect page-related information in a live kernel or vmcore.
> 
> The script extracts information such as the page flags, mapping, and
> other metadata relevant to diagnosing memory issues.
> 
> Output example:
> sudo ./show_page_info.py 1 0x7f43df5acf00
> PID: 1 Comm: systemd mm: 0xffff8881273bbc40
> Raw: 0017ffffc000416c ffffea00043a4508 ffffea0004381e08 ffff88810f086a70
> Raw: 0000000000000000 ffff888120c9b0c0 0000002500000007 ffff88812642c000
> User Virtual Address: 0x7f43df5acf00
> Page Address:         0xffffea00049a0b00
> Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
> 		      PG_private|PG_reported
> Page Size:            16384

Should this be called folio size?  Or, could this simply removed since Compound
Order is given below?

> Page PFN:             0x12682c
> Page Physical:        0x12682c000
> Page Virtual:         0xffff88812682c000
> Page Refcount:        37
> Page Mapcount:        7
> Page Index:           0x0
> Page Memcg Data:      0xffff88812642c000
> Memcg Name:           init.scope
> Memcg Path:           /sys/fs/cgroup/memory/init.scope
> Page Mapping:         0xffff88810f086a70
> Page Anon/File:       File
> Page VMA:             0xffff88810e4af3b8
> VMA Start:            0x7f43df5ac000
> VMA End:              0x7f43df5b0000
> This page is part of a compound page.
> This page is the head page of a compound page.
> Head Page:            0xffffea00049a0b00
> Compound Order:       2
> Number of Pages:      4
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> 
> Changes in v3:
> - Adjust display style.
> - Link to v2:https://lore.kernel.org/all/20250421080748.114750-1-ye.liu@linux.dev/
> 
> Changes in v2:
> - Move the show_page_info.py file to tools/mm.
> - Link to v1: https://lore.kernel.org/all/20250415075024.248232-1-ye.liu@linux.dev/
> ---
>  MAINTAINERS                |   5 ++
>  tools/mm/show_page_info.py | 120 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 125 insertions(+)
>  create mode 100755 tools/mm/show_page_info.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 17ed0b5ffdd2..85686a30dc72 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18351,6 +18351,11 @@ F:	Documentation/mm/page_table_check.rst
>  F:	include/linux/page_table_check.h
>  F:	mm/page_table_check.c
>  
> +PAGE STATE DEBUG SCRIPT
> +M:	Ye Liu <liuye@kylinos.cn>
> +S:	Maintained
> +F:	tools/mm/show_page_info.py
> +
>  PANASONIC LAPTOP ACPI EXTRAS DRIVER
>  M:	Kenneth Chan <kenneth.t.chan@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/tools/mm/show_page_info.py b/tools/mm/show_page_info.py
> new file mode 100755
> index 000000000000..8622c5499dfe
> --- /dev/null
> +++ b/tools/mm/show_page_info.py
[...]
> +def main():
> +    """Main function to parse arguments and display page state."""
> +    parser = argparse.ArgumentParser(description=DESC, formatter_class=argparse.RawTextHelpFormatter)
> +    parser.add_argument('pid', metavar='PID', type=int, help='Target process ID (PID)')
> +    parser.add_argument('vaddr', metavar='VADDR', type=str, help='Target virtual address in hexadecimal format (e.g., 0x7fff1234abcd)')
> +    args = parser.parse_args()
> +
> +    try:
> +        vaddr = int(args.vaddr, 16)
> +    except ValueError:
> +        print(f"Error: Invalid virtual address format: {args.vaddr}")
> +        return
> +
> +    task = find_task(args.pid)
> +    mm = task.mm
> +    page = follow_page(mm, vaddr)

I tried this script on my test machine and got the below error:

$ cat ./a.c
#include <stdio.h>

int main(void)
{
        int foo;
        printf("hello\n");
        printf("%x\n", &foo);
        scanf("%d\n", &foo);
        return 0;
}
$ gcc ./a.c
$ ./a.out &
[2] 45666
hello
f7eb7c0c

$ sudo ./tools/mm/show_page_info.py 45666 0xf7eb7c0c
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
  File "./tools/mm/show_page_info.py", line 112, in main
    page = follow_page(mm, vaddr)
           ^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/drgn-0.0.30+82.ge2b60e4b-py3.11-linux-x86_64.egg/drgn/helpers/linux/mm.py", line 1068, in follow_page
    return phys_to_page(follow_phys(mm, addr))
                        ^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.11/dist-packages/drgn-0.0.30+82.ge2b60e4b-py3.11-linux-x86_64.egg/drgn/helpers/linux/mm.py", line 1109, in follow_phys
    return Object(prog, "phys_addr_t", _linux_helper_follow_phys(prog, mm.pgd, addr))
                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
_drgn.FaultError: address is not mapped: 0xf7eb7c0c

Am I doing something wrong?


Thanks,
SJ

[...]
