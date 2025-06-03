Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6D19AD8C;
	Tue,  3 Jun 2025 17:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748971897; cv=none; b=UOX3IimZ6vOorSmiNMz4zcQNwlOjcX88U2RVI1uxtUOHVdZT8WaOUh0V9dN4fJPB0Ycj0ySh0UT5ukBY7Yk8urO8sKix4HCpYWA1ksocrQG6QaoAKL0VJk/pLQwbrw2yNEaNMHXG9I6bfR4UvvFNLVOkbT6zIY2Ud8UOqb0CksA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748971897; c=relaxed/simple;
	bh=Bpowdy1/AdPIRRxrGYTj4hCKWKSHf6uOY0NOd9jzAHo=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=R9NuIsbL9sYJC9K1wUSM4d1mp1vcaTBqE1Hi4PdAAPP4u+1Tn0FEAGTaM7aNjjL1XXp+LiYw4fpDGzfqrE+Niz2VglGz7CL21cNvl8+qVjMqg3RyRdQ82F4YO95oH8Apb6UK5JmtSEKR060k3uW5UTmFV1D0OKmn7hxVF0kKKLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=bFG7j82F; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="bFG7j82F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1748971887; x=1749576687; i=deller@gmx.de;
	bh=Zi1kkCZUHLyxvrCAenT580HTqjhdw5p2wbpWZRG5/to=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bFG7j82F6hZtmKPSAj9xv9p3A4xaCFBRpvbteU9h1eVl/UE1wqssHZES2TqOe383
	 dubXCWMwgitbLMc9eg1nGxatnCvF/JSsz3VtBmUyg9K96tvhzg/1XFNWHYll9PnD3
	 HI5yEMx4l7Nt9Qbq3djxviscWbqbPti/xShVT1UA9BVYV+bCy+Tx1SJAls2/pumVW
	 YmdoZTqWpeQvcboev8bLCxXhfMg+vXiwlGt2CduseOsgao0xMhBHjvmCPcMVN+hy9
	 EccwBV6WdFRIXgq2T3EDjvocRMiWQwLGwGfapwpQ0Vo5MO0EX3lF6DftIbDXr4inx
	 Y15WPwgvNDfRGTPY8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.171]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N63VY-1uy4Gd2EO0-00vDQ7; Tue, 03
 Jun 2025 19:31:27 +0200
Message-ID: <5a004aef-9df1-4126-b167-1aae27d4240d@gmx.de>
Date: Tue, 3 Jun 2025 19:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Linux Kernel Development <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-parisc <linux-parisc@vger.kernel.org>
From: Helge Deller <deller@gmx.de>
Subject: 6.16-pre-rc1: BUG: Bad page state in process swapper on parisc
Autocrypt: addr=deller@gmx.de; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:nOwvrqPlxG2WqUziiA+YmbEmYawR9sNzpRPEPrvd3pv/OV8/Zu3
 zh+Z01shXCN32kX5OaRz5w0nsojN3SNnTKevyhuD2OxEqpaQ7yWyhjI4veoSCWrJaYDdsOR
 ruJjZOyqa0JfhkmZ1uUgWtZ3BR0IKxv8qZR7l+BOB2qzXFMUGBdJCXtZEm/KbTCmWrvDXl/
 OzEwdfiNRSDXD5nmPZyPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TPDVqZZl2Ww=;bsHuH8sr3/h9nVhCNTpXnDA4dcZ
 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

I'm facing a kernel crash on the 32-bit parisc platform with git head.

git bisecting leads to this patch which triggers the crash:
commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them when destroying the pool")

Syslog:...
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 131072
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] stackdepot: allocating hash table via alloc_large_system_hash
[    0.000000] stackdepot hash table entries: 32768 (order: 6, 262144 bytes, linear)
..
[    0.000000] MEMBLOCK configuration: (I added this output during debugging:)
[    0.000000]  memory size = 0x20000000 reserved size = 0x01f0ed2a
[    0.000000]  memory.cnt  = 0x1
[    0.000000]  memory[0x0]     [0x00000000-0x1fffffff], 0x20000000 bytes flags: 0x0
[    0.000000]  reserved.cnt  = 0xa
[    0.000000]  reserved[0x0]   [0x00000000-0x0008a0b0], 0x0008a0b1 bytes flags: 0x0
[    0.000000]  reserved[0x1]   [0x0008a0c0-0x0008a130], 0x00000071 bytes flags: 0x0
[    0.000000]  reserved[0x2]   [0x0008a140-0x0008a143], 0x00000004 bytes flags: 0x0
[    0.000000]  reserved[0x3]   [0x0008a150-0x0008a153], 0x00000004 bytes flags: 0x0
[    0.000000]  reserved[0x4]   [0x0008a160-0x0008a2d3], 0x00000174 bytes flags: 0x0
[    0.000000]  reserved[0x5]   [0x0008a2e0-0x0008a5e3], 0x00000304 bytes flags: 0x0
[    0.000000]  reserved[0x6]   [0x0008a5f0-0x0008a6b3], 0x000000c4 bytes flags: 0x0
[    0.000000]  reserved[0x7]   [0x0008a6c0-0x0008acc3], 0x00000604 bytes flags: 0x0
[    0.000000]  reserved[0x8]   [0x0008acd0-0x000f6d8f], 0x0006c0c0 bytes flags: 0x0
[    0.000000]  reserved[0x9]   [0x00100000-0x01f17fff], 0x01e18000 bytes flags: 0x0
[    0.000000] BUG: Bad page state in process swapper  pfn:000f7
[    0.000000] page: refcount:0 mapcount:0 mapping:00000000 index:0x0 pfn:0xf7
[    0.000000] flags: 0x0(zone=0)
[    0.000000] raw: 00000000 118022c0 118022c0 00000000 00000000 00000000 ffffffff 00000000
[    0.000000] raw: 00000000
[    0.000000] page dumped because: page_pool leak
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc1-32bit+ #2730 NONE
[    0.000000] Hardware name: 9000/778/B160L
[    0.000000] Backtrace:
[    0.000000]  [<1041d1f4>] show_stack+0x34/0x48
[    0.000000]  [<10412dd8>] dump_stack_lvl+0x80/0xc8
[    0.000000]  [<10412e3c>] dump_stack+0x1c/0x2c
[    0.000000]  [<106ece88>] bad_page+0x14c/0x17c
[    0.000000]  [<10406c50>] free_page_is_bad.part.0+0xd4/0xec
[    0.000000]  [<106ed180>] free_page_is_bad+0x80/0x88
[    0.000000]  [<106ef05c>] __free_pages_ok+0x374/0x508
[    0.000000]  [<1011d34c>] __free_pages_core+0x1f0/0x218
[    0.000000]  [<1011a2f0>] memblock_free_pages+0x68/0x94
[    0.000000]  [<10120324>] memblock_free_all+0x26c/0x310
[    0.000000]  [<1011a4d8>] mm_core_init+0x18c/0x208
[    0.000000]  [<10100e88>] start_kernel+0x4ec/0x7a0
[    0.000000]  [<101054d0>] start_parisc+0xb4/0xc4

When it crashes, __free_pages_ok is called with page=0x118022bc  pfn=f7  order=0.

Other maybe relevant values:
page->pp_magic 0x118022c0, PP_MAGIC_MASK = 0xc000007c,
PP_SIGNATURE=0x40, PP_DMA_INDEX_BITS=23, PP_DMA_INDEX_MASK=0x3fffff80

I'm not convinced that Toke's patch is actually the culprit, but
it somehow changes the behaviour.
Any idea what I could test or check to narrow down the issue?

Helge
