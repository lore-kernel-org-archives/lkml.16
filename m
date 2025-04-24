Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D31DBB03
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745459750; cv=none; b=BxVYOaBnHBcnc3D7lGVQqnLNyacpaIhncsM2ewf0yg3zfh0iHUIRwpk5w0PCnO03BO5rmEPqyQPCyCJLFRXR6SIKRa5hZUhT2qY9Vm5/dY3ElQ0OEysE/2g83n7bKbkmuD3rXqL8P1YewT/0LR4ncww5zw4caAGtmDHijC7EDlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745459750; c=relaxed/simple;
	bh=ua0D3xjnuZCg3RsgqzMC0bGtVSYtqZ+fpmSTlNekOUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bQ+bU2kitmG4V172YdVAKV56JGfIzomnsVH538XqieuUYK0GLvQSF0iaIQcUoU3XIlPcBqLVGLcaGHc65/hkbcVxYBlAvD3itzNTb+dxFGzkcPkG0bbEqNmEexEdnCtTLtmj3DKTu/2yCDXq4PC1lBAh4inbX7cWcjGN2V8t+oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WMmbcJVS; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WMmbcJVS"
Message-ID: <758b1d83-f1b3-43d2-8c37-324cc89c78f7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745459735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=osPFFvNjtTk96vp1U5EovQpHJ4GgVBpRetuRN4Tu+Bo=;
	b=WMmbcJVSXU0ksgnxx5DiJ+wdYNCDeNBHTMSD5u1azcz9nw1Jrd4nHkOtC+8SaBTw8hxCC4
	LIDQRqvnyBUVONzyBLIUy5z/Vcx1RO++qwr6YVCjRJuqtG0aSbuUzpvyVvvG5VsZIdBP+w
	9xYlv1cJD9iNmtmsjdCaPq7BKLQOjIM=
Date: Thu, 24 Apr 2025 09:55:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] tools/mm: Add script to display page state for a given
 PID and VADDR
To: SeongJae Park <sj@kernel.org>
Cc: akpm@linux-foundation.org, linux-debuggers@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-toolchains@vger.kernel.org, osandov@osandov.com, paulmck@kernel.org,
 sweettea-kernel@dorminy.me, liuye@kylinos.cn
References: <20250423220018.45789-1-sj@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ye Liu <ye.liu@linux.dev>
In-Reply-To: <20250423220018.45789-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/4/24 06:00, SeongJae Park 写道:
> On Wed, 23 Apr 2025 09:48:50 +0800 Ye Liu <ye.liu@linux.dev> wrote:
>
>> From: Ye Liu <liuye@kylinos.cn>
>>
>> Introduces a new drgn script, `show_page_info.py`, which allows users
>> to analyze the state of a page given a process ID (PID) and a virtual
>> address (VADDR). This can help kernel developers or debuggers easily
>> inspect page-related information in a live kernel or vmcore.
>>
>> The script extracts information such as the page flags, mapping, and
>> other metadata relevant to diagnosing memory issues.
>>
>> Output example:
>> sudo ./show_page_info.py 1 0x7f43df5acf00
>> PID: 1 Comm: systemd mm: 0xffff8881273bbc40
>> Raw: 0017ffffc000416c ffffea00043a4508 ffffea0004381e08 ffff88810f086a70
>> Raw: 0000000000000000 ffff888120c9b0c0 0000002500000007 ffff88812642c000
>> User Virtual Address: 0x7f43df5acf00
>> Page Address:         0xffffea00049a0b00
>> Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
>> 		      PG_private|PG_reported
>> Page Size:            16384
> Should this be called folio size?  Or, could this simply removed since Compound
> Order is given below?


Page size refers to the base page size, which equals PAGESIZE.
Folio size can be calculated using the Compound Order, but of course,
it can also be shown directly as a result.

>> Page PFN:             0x12682c
>> Page Physical:        0x12682c000
>> Page Virtual:         0xffff88812682c000
>> Page Refcount:        37
>> Page Mapcount:        7
>> Page Index:           0x0
>> Page Memcg Data:      0xffff88812642c000
>> Memcg Name:           init.scope
>> Memcg Path:           /sys/fs/cgroup/memory/init.scope
>> Page Mapping:         0xffff88810f086a70
>> Page Anon/File:       File
>> Page VMA:             0xffff88810e4af3b8
>> VMA Start:            0x7f43df5ac000
>> VMA End:              0x7f43df5b0000
>> This page is part of a compound page.
>> This page is the head page of a compound page.
>> Head Page:            0xffffea00049a0b00
>> Compound Order:       2
>> Number of Pages:      4
>>
>> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>>
>> Changes in v3:
>> - Adjust display style.
>> - Link to v2:https://lore.kernel.org/all/20250421080748.114750-1-ye.liu@linux.dev/
>>
>> Changes in v2:
>> - Move the show_page_info.py file to tools/mm.
>> - Link to v1: https://lore.kernel.org/all/20250415075024.248232-1-ye.liu@linux.dev/
>> ---
>>  MAINTAINERS                |   5 ++
>>  tools/mm/show_page_info.py | 120 +++++++++++++++++++++++++++++++++++++
>>  2 files changed, 125 insertions(+)
>>  create mode 100755 tools/mm/show_page_info.py
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 17ed0b5ffdd2..85686a30dc72 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18351,6 +18351,11 @@ F:	Documentation/mm/page_table_check.rst
>>  F:	include/linux/page_table_check.h
>>  F:	mm/page_table_check.c
>>  
>> +PAGE STATE DEBUG SCRIPT
>> +M:	Ye Liu <liuye@kylinos.cn>
>> +S:	Maintained
>> +F:	tools/mm/show_page_info.py
>> +
>>  PANASONIC LAPTOP ACPI EXTRAS DRIVER
>>  M:	Kenneth Chan <kenneth.t.chan@gmail.com>
>>  L:	platform-driver-x86@vger.kernel.org
>> diff --git a/tools/mm/show_page_info.py b/tools/mm/show_page_info.py
>> new file mode 100755
>> index 000000000000..8622c5499dfe
>> --- /dev/null
>> +++ b/tools/mm/show_page_info.py
> [...]
>> +def main():
>> +    """Main function to parse arguments and display page state."""
>> +    parser = argparse.ArgumentParser(description=DESC, formatter_class=argparse.RawTextHelpFormatter)
>> +    parser.add_argument('pid', metavar='PID', type=int, help='Target process ID (PID)')
>> +    parser.add_argument('vaddr', metavar='VADDR', type=str, help='Target virtual address in hexadecimal format (e.g., 0x7fff1234abcd)')
>> +    args = parser.parse_args()
>> +
>> +    try:
>> +        vaddr = int(args.vaddr, 16)
>> +    except ValueError:
>> +        print(f"Error: Invalid virtual address format: {args.vaddr}")
>> +        return
>> +
>> +    task = find_task(args.pid)
>> +    mm = task.mm
>> +    page = follow_page(mm, vaddr)
> I tried this script on my test machine and got the below error:
>
> $ cat ./a.c
> #include <stdio.h>
>
> int main(void)
> {
>         int foo;
>         printf("hello\n");
>         printf("%x\n", &foo);

To avoid address truncation, you can use the %p format specifier
instead of %x or %lx when printing a pointer (memory address).  

Thanks,
Ye Liu 

>         scanf("%d\n", &foo);
>         return 0;
> }
> $ gcc ./a.c
> $ ./a.out &
> [2] 45666
> hello
> f7eb7c0c
>
> $ sudo ./tools/mm/show_page_info.py 45666 0xf7eb7c0c
> Traceback (most recent call last):
>   File "/usr/local/bin/drgn", line 33, in <module>
>     sys.exit(load_entry_point('drgn==0.0.30+82.ge2b60e4b', 'console_scripts', 'drgn')())
>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.11/dist-packages/drgn-0.0.30+82.ge2b60e4b-py3.11-linux-x86_64.egg/drgn/cli.py", line 461, in _main
>     runpy.run_path(script, init_globals={"prog": prog}, run_name="__main__")
>   File "<frozen runpy>", line 291, in run_path
>   File "<frozen runpy>", line 98, in _run_module_code
>   File "<frozen runpy>", line 88, in _run_code
>   File "./tools/mm/show_page_info.py", line 120, in <module>
>     main()
>   File "./tools/mm/show_page_info.py", line 112, in main
>     page = follow_page(mm, vaddr)
>            ^^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.11/dist-packages/drgn-0.0.30+82.ge2b60e4b-py3.11-linux-x86_64.egg/drgn/helpers/linux/mm.py", line 1068, in follow_page
>     return phys_to_page(follow_phys(mm, addr))
>                         ^^^^^^^^^^^^^^^^^^^^^
>   File "/usr/local/lib/python3.11/dist-packages/drgn-0.0.30+82.ge2b60e4b-py3.11-linux-x86_64.egg/drgn/helpers/linux/mm.py", line 1109, in follow_phys
>     return Object(prog, "phys_addr_t", _linux_helper_follow_phys(prog, mm.pgd, addr))
>                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> _drgn.FaultError: address is not mapped: 0xf7eb7c0c
>
> Am I doing something wrong?
>
>
> Thanks,
> SJ
>
> [...]
