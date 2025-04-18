Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01791DFFD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745015204; cv=none; b=S/jR0pvAas38F7wY+udIcRssJj39I1QISGoXAUpiip9hmOwdkJK9sboSd2ISH0Th4lJ6sucMiHc/RSqqm80h6NkLR5oz5RRoSi9poFwcObzhI57u2ZtWB0oUETFkUsJHPH4JdOgD4t1R262Q8r2OnTN+J0dn4uSYRuNT3BLvJYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745015204; c=relaxed/simple;
	bh=WY/QyNk0mvDn2+vh0Cxy3oWUO5/CF8YdYYDkvW+pNcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dykh2UOFrxoLlBvajBupLV3lp9bk+VseTzJ830ddZI+U5pdR5YeQalnrqg/TbK4Fi/bdtRxOKAwE1jc9dBVqgSTImVHHa32huXSSuDBPF3NWnzsdrOFj8bVNedNUWICSd1eJyTmzHPB2XifWdM+5xoblJwnP/LkFlf+bgBKHN5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b=GlixU4vY; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b="GlixU4vY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1745015190; x=1745619990; i=quwenruo.btrfs@gmx.com;
	bh=jhFsH4UO1cQc2X/dLxkU6el04mox4i/LNBKHB8vsZK0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GlixU4vY2lVdQDt65fOt4pClFEmQOyO5QO+TTy5Z93HqkYABGeIDYBMw4HtZhHr3
	 bZe4njyWMf/lTULDwStwqX8GP+eoTyPEbC0b9vSNillD0P/7XU+jQdEaNIz4O5Ccv
	 IshoHUs9BHH+K1kLl7gV0w+EIOWpFKn5AVxAcxCeVivFUTFYCkTSsMyMK0/uQGEyi
	 2kq7pOKDo0jZpA9f3CTiVPBdcP6KmiUtQ0KJYu07lGn5Wex6DnWZXGy95QH+KA1bn
	 GJ1paolTAja0hvcUNhWHKiTT8VcvqJsX7CjpEb/o0Q8B3QS6yTrhQ5kdDMwBxH6ZB
	 UYJEraU3urQdgobxmQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.191] ([159.196.52.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MNsw4-1uU1gj1zE8-00Ntiy; Sat, 19
 Apr 2025 00:26:30 +0200
Message-ID: <2f206f8b-265a-4b14-a6cb-3253c0e3088e@gmx.com>
Date: Sat, 19 Apr 2025 07:56:21 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 6.15-rc2 unable to boot on 32bit x86 with PAE
To: Borislav Petkov <bp@alien8.de>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, x86-ml <x86@kernel.org>
References: <4599013d-bc74-4f81-9db7-070806ea9162@gmx.com>
 <20250418160515.GAaAJ4O2HnktVgmZ1v@fat_crate.local>
Content-Language: en-US
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <20250418160515.GAaAJ4O2HnktVgmZ1v@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/ovwVrUY7yn43StmC9YHvNSlHtHH0zDpvkJZMe70H3bg5ySaZ7t
 2Y8bsZFCB4mc5tIDBV3J1OoMS25TmSTZ5GF/vJbty/2tYnC4oa058otHSl5eXe4hELPBabF
 u7qPF1I4C1xCSSfuUo9VTvYgPT8K5qQIFZZeyhrL3t2St223nlfcBGRgYPj42smsfi/jttw
 pIFsqpHT07+3KwdIJesfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/2Bd9Vq9gao=;/QxB2GZOSdHPYUuIKA1cIG4OkSu
 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



=E5=9C=A8 2025/4/19 01:35, Borislav Petkov =E5=86=99=E9=81=93:
> On Fri, Apr 18, 2025 at 08:31:23PM +0930, Qu Wenruo wrote:
>> Hi,
>>
>> Recently I'm testing a situation where highmem is involved, thus I'm
>> building the latest 32bit x86 with HIGHMEM and PAE, and run it inside a=
 qemu
>> VM.
>=20
> Does that fix it:
>=20
> https://git.kernel.org/tip/1e07b9fad022e0e02215150ca1e20912e78e8ec1
>=20
> ?

Thanks a lot, that patch properly fixed the boot crash.

Thanks,
Qu

>=20
> Leaving in the rest for reference.
>=20
>> However the kernel just fails to boot with very early memory management
>> crash:
>>
>> [    0.064551] Built 1 zonelists, mobility grouping on.  Total pages: 7=
86297
>> [    0.065269] allocated 4198396 bytes of page_ext
>> [    0.065856] mem auto-init: stack:off, heap alloc:on, heap free:off
>> [    0.070213] BUG: Bad page state in process swapper  pfn:100001
>> [    0.070773] page: refcount:0 mapcount:1 mapping:(ptrval) index:0x0
>> pfn:0x100001
>> [    0.071451] aops:0x0 ino:850fc085 invalid dentry:2cc54702
>> [    0.071962] BUG: kernel NULL pointer dereference, address: 00000400
>> [    0.072609] #PF: supervisor read access in kernel mode
>> [    0.073135] #PF: error_code(0x0000) - not-present page
>> [    0.073621] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53
>> [    0.074269] Oops: Oops: 0000 [#1] SMP NOPTI
>> [    0.074666] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted
>> 6.15.0-rc2-custom+ #5 PREEMPT(undef)
>> a4004de2bdc11241c6afe44ab7f6bd7d8e98e3db
>> [    0.075828] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS
>> Arch Linux 1.16.3-1-1 04/01/2014
>> [    0.076706] EIP: get_pfnblock_flags_mask+0x40/0x50
>> [    0.077160] Code: 03 00 00 8b 8e 48 14 33 d7 8b 96 44 14 33 d7 81 e1=
 00
>> fe ff ff 29 c8 c1 e8 09 8d 0c 85 00 00 00 00 c1 e8 03 8d 04 82 83 e1 1f=
 <8b>
>> 00 d3 e8 21 d8 5b 5e 5d 31 d2 31 c9 c3 66 90 e8 e3 bf d6 ff 55
>> [    0.078954] EAX: 00000400 EBX: 00000007 ECX: 00000000 EDX: 00000000
>> [    0.079567] ESI: 00000a80 EDI: d70ebce5 EBP: d71fdd80 ESP: d71fdd78
>> [    0.080156] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 002=
10046
>> [    0.080796] CR0: 80050033 CR2: 00000400 CR3: 1749a000 CR4: 000000b0
>> [    0.081378] Call Trace:
>> [    0.081602]  __dump_page.cold+0x11d/0x23f
>> [    0.081977]  ? prb_read_valid+0x29/0x40
>> [    0.082334]  ? console_unlock+0x56/0x100
>> [    0.082701]  ? console_unlock+0x56/0x100
>> [    0.083070]  ? vprintk_emit+0x2d2/0x390
>> [    0.083458]  ? vprintk_default+0x15/0x20
>> [    0.083826]  dump_page+0x1b/0x30
>> [    0.084127]  ? dump_page+0x1b/0x30
>> [    0.084447]  bad_page.cold+0x62/0x84
>> [    0.084796]  free_tail_page_prepare+0x134/0x190
>> [    0.085232]  __free_pages_ok+0x318/0x3c0
>> [    0.085607]  __free_pages_core+0x4e/0x58
>> [    0.085982]  memblock_free_pages+0x11/0x34
>> [    0.086378]  memblock_free_all+0x149/0x1b4
>> [    0.086766]  mm_core_init+0x103/0x158
>> [    0.087121]  start_kernel+0x5d2/0x7f8
>> [    0.087462]  ? load_ucode_bsp+0x53/0xdc
>> [    0.087832]  i386_start_kernel+0x64/0x64
>> [    0.088195]  startup_32_smp+0x151/0x154
>> [    0.088561] Modules linked in:
>> [    0.088865] CR2: 0000000000000400
>> [    0.089185] ---[ end trace 0000000000000000 ]---
>> [    0.089624] EIP: get_pfnblock_flags_mask+0x40/0x50
>> [    0.090093] Code: 03 00 00 8b 8e 48 14 33 d7 8b 96 44 14 33 d7 81 e1=
 00
>> fe ff ff 29 c8 c1 e8 09 8d 0c 85 00 00 00 00 c1 e8 03 8d 04 82 83 e1 1f=
 <8b>
>> 00 d3 e8 21 d8 5b 5e 5d 31 d2 31 c9 c3 66 90 e8 e3 bf d6 ff 55
>> [    0.091910] EAX: 00000400 EBX: 00000007 ECX: 00000000 EDX: 00000000
>> [    0.092505] ESI: 00000a80 EDI: d70ebce5 EBP: d71fdd80 ESP: d71fdd78
>> [    0.093111] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 002=
10046
>> [    0.093788] CR0: 80050033 CR2: 00000400 CR3: 1749a000 CR4: 000000b0
>> [    0.094415] Kernel panic - not syncing: Attempted to kill the idle t=
ask!
>> [    0.095097] ---[ end Kernel panic - not syncing: Attempted to kill t=
he
>> idle task! ]---
>>
>> The full dmesg is attached (boot.txt).
>>
>> The crash only happens with PAE enabled. If only HIGHMEM enabled but no=
 PAE,
>> the kernel boots without any problem.
>>
>> Thanks,
>> Qu
>=20
>> [    0.000000] Linux version 6.15.0-rc2-custom+ (adam@arch32) (gcc (GCC=
) 14.1.1 20240507, GNU ld (GNU Binutils) 2.43.1) #5 SMP PREEMPT_DYNAMIC Fr=
i Apr 18 10:47:21 UTC 2025
>> [    0.000000] BIOS-provided physical RAM map:
>> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] u=
sable
>> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] r=
eserved
>> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] r=
eserved
>> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000bffdafff] u=
sable
>> [    0.000000] BIOS-e820: [mem 0x00000000bffdb000-0x00000000bfffffff] r=
eserved
>> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] r=
eserved
>> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] r=
eserved
>> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000001bfffffff] u=
sable
>> [    0.000000] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] r=
eserved
>> [    0.000000] earlycon: uart0 at I/O port 0x3f8 (options '')
>> [    0.000000] printk: legacy bootconsole [uart0] enabled
>> [    0.000000] NX (Execute Disable) protection: active
>> [    0.000000] APIC: Static calls initialized
>> [    0.000000] SMBIOS 2.8 present.
>> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Arch L=
inux 1.16.3-1-1 04/01/2014
>> [    0.000000] DMI: Memory slots populated: 1/1
>> [    0.000000] Hypervisor detected: KVM
>> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
>> [    0.000000] kvm-clock: using sched offset of 3090378331820 cycles
>> [    0.000562] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cyc=
les: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
>> [    0.002391] tsc: Detected 3992.500 MHz processor
>> [    0.003311] last_pfn =3D 0x1c0000 max_arch_pfn =3D 0x1000000
>> [    0.003924] MTRR map: 4 entries (3 fixed + 1 variable; max 19), buil=
t from 8 variable MTRRs
>> [    0.004847] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC=
- WT
>> [    0.005630] Warning: only 4GB will be used. Support for for CONFIG_H=
IGHMEM64G was removed!
>> [    0.008576] found SMP MP-table at [mem 0x000f6650-0x000f665f]
>> [    0.009239] RAMDISK: [mem 0x7f210000-0x7fffffff]
>> [    0.009755] Allocated new RAMDISK: [mem 0x3680e000-0x375fdd9e]
>> [    0.011541] Move RAMDISK from [mem 0x7f210000-0x7ffffd9e] to [mem 0x=
3680e000-0x375fdd9e]
>> [    0.012425] ACPI: Early table checksum verification disabled
>> [    0.013026] ACPI: RSDP 0x00000000000F6610 000014 (v00 BOCHS )
>> [    0.013656] ACPI: RSDT 0x00000000BFFE208E 000030 (v01 BOCHS  BXPC   =
  00000001 BXPC 00000001)
>> [    0.014690] ACPI: FACP 0x00000000BFFE1F52 000074 (v01 BOCHS  BXPC   =
  00000001 BXPC 00000001)
>> [    0.015604] ACPI: DSDT 0x00000000BFFDFD40 002212 (v01 BOCHS  BXPC   =
  00000001 BXPC 00000001)
>> [    0.016517] ACPI: FACS 0x00000000BFFDFD00 000040
>> [    0.017021] ACPI: APIC 0x00000000BFFE1FC6 0000A0 (v03 BOCHS  BXPC   =
  00000001 BXPC 00000001)
>> [    0.017951] ACPI: WAET 0x00000000BFFE2066 000028 (v01 BOCHS  BXPC   =
  00000001 BXPC 00000001)
>> [    0.018874] ACPI: Reserving FACP table memory at [mem 0xbffe1f52-0xb=
ffe1fc5]
>> [    0.019631] ACPI: Reserving DSDT table memory at [mem 0xbffdfd40-0xb=
ffe1f51]
>> [    0.020391] ACPI: Reserving FACS table memory at [mem 0xbffdfd00-0xb=
ffdfd3f]
>> [    0.021153] ACPI: Reserving APIC table memory at [mem 0xbffe1fc6-0xb=
ffe2065]
>> [    0.021896] ACPI: Reserving WAET table memory at [mem 0xbffe2066-0xb=
ffe208d]
>> [    0.022763] 3210MB HIGHMEM available.
>> [    0.023178] 885MB LOWMEM available.
>> [    0.023581]   mapped low ram: 0 - 375fe000
>> [    0.024073]   low ram: 0 - 375fe000
>> [    0.024504] Zone ranges:
>> [    0.024805]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
>> [    0.025516]   Normal   [mem 0x0000000001000000-0x00000000375fdfff]
>> [    0.026224]   HighMem  [mem 0x00000000375fe000-0x00000000ffffffff]
>> [    0.026938] Movable zone start for each node
>> [    0.027433] Early memory node ranges
>> [    0.027852]   node   0: [mem 0x0000000000001000-0x000000000009efff]
>> [    0.028565]   node   0: [mem 0x0000000000100000-0x00000000bffdafff]
>> [    0.029279]   node   0: [mem 0x0000000100000000-0x00000001bfffffff]
>> [    0.029998] Initmem setup node 0 [mem 0x0000000000001000-0x00000001b=
fffffff]
>> [    0.030820] On node 0, zone DMA: 1 pages in unavailable ranges
>> [    0.031521] On node 0, zone DMA: 97 pages in unavailable ranges
>> [    0.039994] On node 0, zone HighMem: 262181 pages in unavailable ran=
ges
>> [    0.041125] ACPI: PM-Timer IO Port: 0x608
>> [    0.041595] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
>> [    0.042231] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GS=
I 0-23
>> [    0.042865] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
>> [    0.043435] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high lev=
el)
>> [    0.044115] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high lev=
el)
>> [    0.044722] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high l=
evel)
>> [    0.045350] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high l=
evel)
>> [    0.046018] ACPI: Using ACPI (MADT) for SMP configuration informatio=
n
>> [    0.046638] TSC deadline timer available
>> [    0.047004] CPU topo: Max. logical packages:   6
>> [    0.047442] CPU topo: Max. logical dies:       6
>> [    0.047867] CPU topo: Max. dies per package:   1
>> [    0.048286] CPU topo: Max. threads per core:   1
>> [    0.048706] CPU topo: Num. cores per package:     1
>> [    0.049162] CPU topo: Num. threads per package:   1
>> [    0.049599] CPU topo: Allowing 6 present CPUs plus 0 hotplug CPUs
>> [    0.050164] kvm-guest: APIC: eoi() replaced with kvm_guest_apic_eoi_=
write()
>> [    0.050813] kvm-guest: KVM setup pv remote TLB flush
>> [    0.051328] kvm-guest: setup PV sched yield
>> [    0.051739] PM: hibernation: Registered nosave memory: [mem 0x000000=
00-0x00000fff]
>> [    0.052441] PM: hibernation: Registered nosave memory: [mem 0x0009f0=
00-0x000fffff]
>> [    0.053150] PM: hibernation: Registered nosave memory: [mem 0xbffdb0=
00-0xffffffff]
>> [    0.053841] [mem 0xc0000000-0xfeffbfff] available for PCI devices
>> [    0.054398] Booting paravirtualized kernel on KVM
>> [    0.054843] clocksource: refined-jiffies: mask: 0xffffffff max_cycle=
s: 0xffffffff, max_idle_ns: 6370452778343963 ns
>> [    0.055846] setup_percpu: NR_CPUS:8 nr_cpumask_bits:6 nr_cpu_ids:6 n=
r_node_ids:1
>> [    0.056628] percpu: Embedded 33 pages/cpu s102476 r0 d32692 u135168
>> [    0.057257] kvm-guest: PV spinlocks enabled
>> [    0.057646] PV qspinlock hash table entries: 512 (order: 0, 4096 byt=
es, linear)
>> [    0.058318] Kernel command line: root=3D/dev/sys/root rw console=3Dt=
tyS0 loglevel=3D7 earlycon=3Duart,io,0x3f8
>> [    0.059439] random: crng init done
>> [    0.059750] printk: log buffer data + meta data: 131072 + 409600 =3D=
 540672 bytes
>> [    0.060446] Dentry cache hash table entries: 131072 (order: 7, 52428=
8 bytes, linear)
>> [    0.061185] Inode-cache hash table entries: 65536 (order: 6, 262144 =
bytes, linear)
>> [    0.061972] software IO TLB: area num 8.
>> [    0.064551] Built 1 zonelists, mobility grouping on.  Total pages: 7=
86297
>> [    0.065269] allocated 4198396 bytes of page_ext
>> [    0.065856] mem auto-init: stack:off, heap alloc:on, heap free:off
>> [    0.070213] BUG: Bad page state in process swapper  pfn:100001
>> [    0.070773] page: refcount:0 mapcount:1 mapping:(ptrval) index:0x0 p=
fn:0x100001
>> [    0.071451] aops:0x0 ino:850fc085 invalid dentry:2cc54702
>> [    0.071962] BUG: kernel NULL pointer dereference, address: 00000400
>> [    0.072609] #PF: supervisor read access in kernel mode
>> [    0.073135] #PF: error_code(0x0000) - not-present page
>> [    0.073621] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53
>> [    0.074269] Oops: Oops: 0000 [#1] SMP NOPTI
>> [    0.074666] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc=
2-custom+ #5 PREEMPT(undef)  a4004de2bdc11241c6afe44ab7f6bd7d8e98e3db
>> [    0.075828] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS Arch Linux 1.16.3-1-1 04/01/2014
>> [    0.076706] EIP: get_pfnblock_flags_mask+0x40/0x50
>> [    0.077160] Code: 03 00 00 8b 8e 48 14 33 d7 8b 96 44 14 33 d7 81 e1=
 00 fe ff ff 29 c8 c1 e8 09 8d 0c 85 00 00 00 00 c1 e8 03 8d 04 82 83 e1 1=
f <8b> 00 d3 e8 21 d8 5b 5e 5d 31 d2 31 c9 c3 66 90 e8 e3 bf d6 ff 55
>> [    0.078954] EAX: 00000400 EBX: 00000007 ECX: 00000000 EDX: 00000000
>> [    0.079567] ESI: 00000a80 EDI: d70ebce5 EBP: d71fdd80 ESP: d71fdd78
>> [    0.080156] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 002=
10046
>> [    0.080796] CR0: 80050033 CR2: 00000400 CR3: 1749a000 CR4: 000000b0
>> [    0.081378] Call Trace:
>> [    0.081602]  __dump_page.cold+0x11d/0x23f
>> [    0.081977]  ? prb_read_valid+0x29/0x40
>> [    0.082334]  ? console_unlock+0x56/0x100
>> [    0.082701]  ? console_unlock+0x56/0x100
>> [    0.083070]  ? vprintk_emit+0x2d2/0x390
>> [    0.083458]  ? vprintk_default+0x15/0x20
>> [    0.083826]  dump_page+0x1b/0x30
>> [    0.084127]  ? dump_page+0x1b/0x30
>> [    0.084447]  bad_page.cold+0x62/0x84
>> [    0.084796]  free_tail_page_prepare+0x134/0x190
>> [    0.085232]  __free_pages_ok+0x318/0x3c0
>> [    0.085607]  __free_pages_core+0x4e/0x58
>> [    0.085982]  memblock_free_pages+0x11/0x34
>> [    0.086378]  memblock_free_all+0x149/0x1b4
>> [    0.086766]  mm_core_init+0x103/0x158
>> [    0.087121]  start_kernel+0x5d2/0x7f8
>> [    0.087462]  ? load_ucode_bsp+0x53/0xdc
>> [    0.087832]  i386_start_kernel+0x64/0x64
>> [    0.088195]  startup_32_smp+0x151/0x154
>> [    0.088561] Modules linked in:
>> [    0.088865] CR2: 0000000000000400
>> [    0.089185] ---[ end trace 0000000000000000 ]---
>> [    0.089624] EIP: get_pfnblock_flags_mask+0x40/0x50
>> [    0.090093] Code: 03 00 00 8b 8e 48 14 33 d7 8b 96 44 14 33 d7 81 e1=
 00 fe ff ff 29 c8 c1 e8 09 8d 0c 85 00 00 00 00 c1 e8 03 8d 04 82 83 e1 1=
f <8b> 00 d3 e8 21 d8 5b 5e 5d 31 d2 31 c9 c3 66 90 e8 e3 bf d6 ff 55
>> [    0.091910] EAX: 00000400 EBX: 00000007 ECX: 00000000 EDX: 00000000
>> [    0.092505] ESI: 00000a80 EDI: d70ebce5 EBP: d71fdd80 ESP: d71fdd78
>> [    0.093111] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 002=
10046
>> [    0.093788] CR0: 80050033 CR2: 00000400 CR3: 1749a000 CR4: 000000b0
>> [    0.094415] Kernel panic - not syncing: Attempted to kill the idle t=
ask!
>> [    0.095097] ---[ end Kernel panic - not syncing: Attempted to kill t=
he idle task! ]---
>=20
>=20

