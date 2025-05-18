Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86AE78F34
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747584429; cv=none; b=ejUY/kHz+TOxgd1jGz4rGK67z77fDsHVfEewvK8Jv8MNUhcUu4ImcwdgKPuvBowNy8ovs569BClLbP5EA/kW3/m9YFqHpBQlwJYxlUBOaho0GvGKIPfXIN/7fCSd0QOI2u45Eh9e+zFBm9iPAU6JlJTV3mQWlZm0uXyaeURiL84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747584429; c=relaxed/simple;
	bh=8K7Z8/yRBpx8ywMbBxpZ+kSz2JhWxBrGfTWkotiCl4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZ4NEpp8/aGeD5aWuDDJRPnAzaQ1HnyNWd/oWPeLMITHf3GdxptKLHcn7ws/fqH8lUhEF8ONxRVqJEUO21BDBWLuYxb05PVawQmk8lK7o44xOdxarLaSLk9dsSPGeO7j1V4rFhSbu84HYOg9xK5pwMaGHMIAo03NasmN7Jy7IbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCZIBrwP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCZIBrwP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045DEC4CEE7;
	Sun, 18 May 2025 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747584429;
	bh=8K7Z8/yRBpx8ywMbBxpZ+kSz2JhWxBrGfTWkotiCl4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UCZIBrwPt5e5KyIa4ikoH6lFHF77tZrJq9Ug0TgWq+aO62WbpoLkvCpHvmOhy4M1G
	 SOsp4jKKSyFycj7PbdTkqbJUGUOa0iXyIR4yjge3NSYgTYVn+ywkgtxNd8uOOrkg0K
	 IBSCzHooJ5z3oiM6kynKKda4SqlvEOhzopKMC7uGx5pBZ2zxwxblXmTUvofjtVemX7
	 7Ag9+8E7rlCw+vr7Yw5Ti0YQAZoyp1hQ0pXw/0BY7Rz3aU4HFZahCSolAZicY4STM2
	 GeJLDY7JutM3ZcHaWE0xV34BkoEpqRvISb+xkSp42IQBh58PSliNaetcah7rglsZgV
	 gaK7WCA2z5HRA==
Date: Sun, 18 May 2025 19:07:02 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Changyuan Lyu <changyuanl@google.com>
Cc: akpm@linux-foundation.org, graf@amazon.com, bhe@redhat.com,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, chrisl@kernel.org, pasha.tatashin@soleen.com,
	jasonmiu@google.com
Subject: Re: [PATCH 1/2] memblock: show a warning if allocation in KHO
 scratch fails
Message-ID: <aCoFphqeZAMkhq51@kernel.org>
References: <20250518142315.241670-1-changyuanl@google.com>
 <20250518142315.241670-2-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250518142315.241670-2-changyuanl@google.com>

On Sun, May 18, 2025 at 07:23:14AM -0700, Changyuan Lyu wrote:
> When we kexec into a new kernel from an old kernel with KHO
> enabled, the new kernel allocates vmemmap in the scratch area.
> If the KHO scratch size is too small, vmemmap allocation would
> fail and cause kernel panic, like the following,
> 
> [    0.027133] Faking a node at [mem 0x0000000000000000-0x00000004ffffffff]
> [    0.027877] NODE_DATA(0) allocated [mem 0x4e4bd5a00-0x4e4bfffff]
> [    0.029696] sparse_init_nid: node[0] memory map backing failed. Some memory will not be available.
> [    0.029698] Zone ranges:
> [    0.030974]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.031627]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.032281]   Normal   [mem 0x0000000100000000-0x00000004ffffffff]
> [    0.032930]   Device   empty
> [    0.033251] Movable zone start for each node
> [    0.033710] Early memory node ranges
> [    0.034108]   node   0: [mem 0x0000000000001000-0x000000000007ffff]
> [    0.034801]   node   0: [mem 0x0000000000100000-0x00000000773fffff]
> [    0.035461]   node   0: [mem 0x0000000077400000-0x00000000775fffff]
> [    0.036116]   node   0: [mem 0x0000000077600000-0x000000007fffffff]
> [    0.036768]   node   0: [mem 0x0000000100000000-0x00000004ccbfffff]
> [    0.037423]   node   0: [mem 0x00000004ccc00000-0x00000004e4bfffff]
> [    0.038111] BUG: kernel NULL pointer dereference, address: 0000000000000010
> [    0.038880] #PF: supervisor write access in kernel mode
> [    0.039474] #PF: error_code(0x0002) - not-present page
> [    0.040056] PGD 0 P4D 0
> [    0.040335] Oops: Oops: 0002 [#1] SMP
> [    0.040745] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.15.0-rc4+ #275 NONE
> [    0.041541] RIP: 0010:__bitmap_set+0x2b/0x80
> [    0.041992] Code: 0f 1e fa 55 48 89 e5 89 f1 89 f0 c1 e8 06 48 8d 04 c7 48 c7 c7 ff ff ff ff 48 d3 e7 41 89 f0 41 83 c8 c0 44 89 c6 01 d6 78 43 <48> 09 38 48 83 c0 08 83 fe 40 72 1a 41 8d 3c 10 83 c7 40 48 c7 00
> [    0.043986] RSP: 0000:ffffffff96203df0 EFLAGS: 00010047
> [    0.044546] RAX: 0000000000000010 RBX: 000000000000cc00 RCX: 0000000000000000
> [    0.045311] RDX: 0000000000000040 RSI: 0000000000000000 RDI: ffffffffffffffff
> [    0.046075] RBP: ffffffff96203df0 R08: 00000000ffffffc0 R09: ffffffff9626c950
> [    0.046830] R10: 000000000002fffd R11: 0000000000000004 R12: 0000000000008000
> [    0.047574] R13: 0000000000000000 R14: 000000000000003f R15: 000000000000009b
> [    0.048313] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.049151] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.049751] CR2: 0000000000000010 CR3: 00000004d123e000 CR4: 00000000000200b0
> [    0.050494] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    0.051238] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    0.051978] Call Trace:
> [    0.052235]  <TASK>
> [    0.052455]  subsection_map_init+0xe4/0x130
> [    0.052891]  free_area_init+0x217/0x3d0
> [    0.053290]  zone_sizes_init+0x5e/0x80
> [    0.053682]  paging_init+0x27/0x30
> [    0.054046]  setup_arch+0x307/0x3e0
> [    0.054422]  start_kernel+0x59/0x390
> [    0.054820]  x86_64_start_reservations+0x28/0x30
> [    0.055307]  x86_64_start_kernel+0x70/0x80
> [    0.055736]  common_startup_64+0x13b/0x140
> [    0.056165]  </TASK>
> [    0.056392] CR2: 0000000000000010
> [    0.056737] ---[ end trace 0000000000000000 ]---
> [    0.057218] RIP: 0010:__bitmap_set+0x2b/0x80
> [    0.057667] Code: 0f 1e fa 55 48 89 e5 89 f1 89 f0 c1 e8 06 48 8d 04 c7 48 c7 c7 ff ff ff ff 48 d3 e7 41 89 f0 41 83 c8 c0 44 89 c6 01 d6 78 43 <48> 09 38 48 83 c0 08 83 fe 40 72 1a 41 8d 3c 10 83 c7 40 48 c7 00
> [    0.059650] RSP: 0000:ffffffff96203df0 EFLAGS: 00010047
> [    0.060218] RAX: 0000000000000010 RBX: 000000000000cc00 RCX: 0000000000000000
> [    0.060985] RDX: 0000000000000040 RSI: 0000000000000000 RDI: ffffffffffffffff
> [    0.061728] RBP: ffffffff96203df0 R08: 00000000ffffffc0 R09: ffffffff9626c950
> [    0.062486] R10: 000000000002fffd R11: 0000000000000004 R12: 0000000000008000
> [    0.063228] R13: 0000000000000000 R14: 000000000000003f R15: 000000000000009b
> [    0.063968] FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> [    0.064812] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.065423] CR2: 0000000000000010 CR3: 00000004d123e000 CR4: 00000000000200b0
> [    0.066175] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [    0.066926] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [    0.067678] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.068403] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
> 
> The panic above can be easily reproduced by the following steps,
> 
> 1.  boot a VM with 20GiB physical memory (or larger) and kernel command
>     line "kho=on kho_scratch=2m,256m,128m"
> 2.  echo 1 > /sys/kernel/debug/kho/out/finalize
> 3.  kexec to a new kernel

This can be reproduced without KHO, just squeeze the RAM size, boot with a huge
kernel and initrd and you'll get the same panic.

The issue is that sparse_init_nid() does not treat allocation failures as
fatal and just continues with some sections being unpopulated and then
subsection_map_init() presumes all the sections are valid.

This should be fixed in mm/sparse.c regardless of KHO, maybe as simple as 

diff --git a/mm/sparse.c b/mm/sparse.c
index 3c012cf83cc2..64d071f9f037 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -197,6 +197,10 @@ void __init subsection_map_init(unsigned long pfn, unsigned long nr_pages)
 		pfns = min(nr_pages, PAGES_PER_SECTION
 				- (pfn & ~PAGE_SECTION_MASK));
 		ms = __nr_to_section(nr);
+
+		if (!ms->section_mem_map)
+			continue;
+
 		subsection_mask_set(ms->usage->subsection_map, pfn, pfns);
 
 		pr_debug("%s: sec: %lu pfns: %lu set(%d, %d)\n", __func__, nr,
 
> The current panic log above is confusing and it's hard to find the
> root cause.
> 
> Add an error log to make it easier to debug such kind of panics.
> 
> Fixes: d59f43b57480 ("memblock: add support for scratch memory")
> Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> ---
>  mm/memblock.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 154f1d73b61f..ed886bfd3de7 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -1573,6 +1573,9 @@ phys_addr_t __init memblock_alloc_range_nid(phys_addr_t size,
>  		goto again;
>  	}
> 
> +	if (flags & MEMBLOCK_KHO_SCRATCH)
> +		pr_err_once("Could not allocate %pap bytes in KHO scratch\n", &size);
> +
>  	return 0;
> 
>  done:
> --
> 2.49.0.1101.gccaa498523-goog

-- 
Sincerely yours,
Mike.
