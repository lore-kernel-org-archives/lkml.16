Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C406175D50
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251849; cv=none; b=Roy2jVDtupvn3YatMDaaR3OT0QMAr50W35KT+wBbVQIxSuzhnu99sYnv2z7kddTtgkUJcChsIRXvftgJ2pN2PAlss4Sgcf5M+rEZoslNc579vFmwFxs4LjLCcSk3S+IVbwih39swRuoFjoBHqaGCBgvvSPD0a1XwdjbmgIfur2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251849; c=relaxed/simple;
	bh=lbGhFBjlbp3tEbEQdwcHCd9wSmJm0/C/5rwhGADFy2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=et4CKK4YMxvdEF0SZob2ddfGAKj+jV4rcO/ZswERLGJMCe+eUzaxt0ov5ajVVmCik1HCj2QPd+O+mcYBYpZ2+/RNaPQDVZ1Gil89cufhflneY5LAZYsjX7hJU9SQCWe+qXw8Qngn1FkPs2EN2uqO/aiIITwNStb29MJBfBXH4PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYkexaZM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYkexaZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739251847; x=1770787847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lbGhFBjlbp3tEbEQdwcHCd9wSmJm0/C/5rwhGADFy2I=;
  b=gYkexaZMcX+urd+lcKEMhK4dog4oUpNdzuh8dyDrBdJZ8iY0WmPgwcn8
   npi/bg3HpQuxEpzkcEaFP8WhEh3ds4eUN3V39djIHCeEI7lJ8+WSosHHT
   RRi4MoNcFNbRTfSVCe0so6etEez2Y8UqLDLmWVdjH6EUHpMcybo5TzPyg
   OyVp+oSrer5WZupU+rRTcNmszv41Gp1MIplsox08BRRSrgUx3bXiCf21d
   ltMrDcNv8JOLPsHryCEW2jY/cJKnHjQ6UOZUjmmOUKKHVj2TIND9CDoS/
   +yRT8iTmjS5VY5oqRYXGT0hjmK4LoGnWpVo9AwOnmMLe07RMO1Hp0w3xz
   Q==;
X-CSE-ConnectionGUID: 5vUNliW7S06bL3jkpU4A/A==
X-CSE-MsgGUID: VM4aWVI3TJ+eUGnN8cg+Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39720382"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="39720382"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 21:30:46 -0800
X-CSE-ConnectionGUID: sALMzK1tQUe/4rsbnLA7+Q==
X-CSE-MsgGUID: /9dNDJRoTKq8eMy56QiwaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117601764"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.161.23])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 21:30:43 -0800
Date: Tue, 11 Feb 2025 13:30:49 +0800
From: "Lai, Yi" <yi1.lai@linux.intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, yi1.lai@intel.com
Subject: Re: [PATCH 4/4] mm/madvise: remove redundant mmap_lock operations
 from process_madvise()
Message-ID: <Z6rgiVp7221r4JZ5@ly-workstation>
References: <20250206061517.2958-1-sj@kernel.org>
 <20250206061517.2958-5-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206061517.2958-5-sj@kernel.org>

On Wed, Feb 05, 2025 at 10:15:17PM -0800, SeongJae Park wrote:
> Optimize redundant mmap lock operations from process_madvise() by
> directly doing the mmap locking first, and then the remaining works for
> all ranges in the loop.
> 
> Reviewed-by: Shakeel Butt <shakeel.butt@linux.dev>
> Signed-off-by: SeongJae Park <sj@kernel.org>
> ---
>  mm/madvise.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 31e5df75b926..5a0a1fc99d27 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1754,9 +1754,26 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  
>  	total_len = iov_iter_count(iter);
>  
> +	ret = madvise_lock(mm, behavior);
> +	if (ret)
> +		return ret;
> +
>  	while (iov_iter_count(iter)) {
> -		ret = do_madvise(mm, (unsigned long)iter_iov_addr(iter),
> -				 iter_iov_len(iter), behavior);
> +		unsigned long start = (unsigned long)iter_iov_addr(iter);
> +		size_t len_in = iter_iov_len(iter);
> +		size_t len;
> +
> +		if (!is_valid_madvise(start, len_in, behavior)) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
> +		len = PAGE_ALIGN(len_in);
> +		if (start + len == start)
> +			ret = 0;
> +		else
> +			ret = madvise_do_behavior(mm, start, len_in, len,
> +					behavior);
>  		/*
>  		 * An madvise operation is attempting to restart the syscall,
>  		 * but we cannot proceed as it would not be correct to repeat
> @@ -1772,12 +1789,17 @@ static ssize_t vector_madvise(struct mm_struct *mm, struct iov_iter *iter,
>  				ret = -EINTR;
>  				break;
>  			}
> +
> +			/* Drop and reacquire lock to unwind race. */
> +			madvise_unlock(mm, behavior);
> +			madvise_lock(mm, behavior);
>  			continue;
>  		}
>  		if (ret < 0)
>  			break;
>  		iov_iter_advance(iter, iter_iov_len(iter));
>  	}
> +	madvise_unlock(mm, behavior);
>  
>  	ret = (total_len - iov_iter_count(iter)) ? : ret;
> 

Hi SeongJae Park,

Greetings!

I used Syzkaller and found that there is WARNING in madvise_unlock in linux-next tag - next-20250210.

After bisection and the first bad commit is:
"
ec68fbd9e99f mm/madvise: remove redundant mmap_lock operations from process_madvise()
"

All detailed into can be found at:
https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock
Syzkaller repro code:
https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/repro.c
Syzkaller repro syscall steps:
https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/repro.prog
Syzkaller report:
https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/repro.report
Kconfig(make olddefconfig):
https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/kconfig_origin
Bisect info:
https://github.com/laifryiee/syzkaller_logs/tree/main/250210_144836_madvise_unlock/bisect_info.log
bzImage:
https://github.com/laifryiee/syzkaller_logs/raw/refs/heads/main/250210_144836_madvise_unlock/bzImage_df5d6180169ae06a2eac57e33b077ad6f6252440
Issue dmesg:
https://github.com/laifryiee/syzkaller_logs/blob/main/250210_144836_madvise_unlock/df5d6180169ae06a2eac57e33b077ad6f6252440_dmesg.log

"
[  135.191347] Injecting memory failure for pfn 0x8ea0 at process virtual address 0x20e7f000
[  135.194964] Memory failure: 0x8ea0: recovery action for reserved kernel page: Ignored
[  135.195584] ------------[ cut here ]------------
[  135.195863] WARNING: CPU: 1 PID: 680 at ./include/linux/rwsem.h:203 madvise_unlock+0x17e/0x1a0
[  135.196395] Modules linked in:
[  135.196612] CPU: 1 UID: 0 PID: 680 Comm: repro Not tainted 6.14.0-rc2-next-20250210-df5d6180169a #1
[  135.197135] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[  135.197818] RIP: 0010:madvise_unlock+0x17e/0x1a0
[  135.198108] Code: a1 9f ff 31 f6 49 8d bc 24 e0 01 00 00 e8 fa 80 d5 03 31 ff 89 c3 89 c6 e8 9f 9b 9f ff 85 db 0f 85 1c ff ff ffe
[  135.199154] RSP: 0018:ffff888022647e88 EFLAGS: 00010293
[  135.199468] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff81e878f1
[  135.199876] RDX: ffff88802264a540 RSI: ffffffff81e878fe RDI: 0000000000000005
[  135.200285] RBP: ffff888022647ea0 R08: 0000000000000001 R09: ffffed10044c8f25
[  135.200692] R10: 0000000000000000 R11: 0000000000000001 R12: ffff888021116180
[  135.201100] R13: ffff8880211162f0 R14: 0000000000004000 R15: ffff888021116180
[  135.201531] FS:  00007f0327a07600(0000) GS:ffff88806c500000(0000) knlGS:0000000000000000
[  135.201996] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  135.202329] CR2: 00007f032773e7f0 CR3: 0000000021bd4003 CR4: 0000000000770ef0
[  135.202737] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  135.203155] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[  135.203563] PKRU: 55555554
[  135.203731] Call Trace:
[  135.203883]  <TASK>
[  135.204020]  ? show_regs+0x6d/0x80
[  135.204240]  ? __warn+0xf3/0x390
[  135.204447]  ? report_bug+0x25e/0x4b0
[  135.204692]  ? madvise_unlock+0x17e/0x1a0
[  135.204937]  ? report_bug+0x2cb/0x4b0
[  135.205167]  ? madvise_unlock+0x17e/0x1a0
[  135.205413]  ? madvise_unlock+0x17f/0x1a0
[  135.205706]  ? handle_bug+0xf1/0x190
[  135.206188]  ? exc_invalid_op+0x3c/0x80
[  135.206423]  ? asm_exc_invalid_op+0x1f/0x30
[  135.206678]  ? madvise_unlock+0x171/0x1a0
[  135.206919]  ? madvise_unlock+0x17e/0x1a0
[  135.207156]  ? madvise_unlock+0x17e/0x1a0
[  135.207388]  ? madvise_unlock+0x17e/0x1a0
[  135.207623]  do_madvise+0x14f/0x1a0
[  135.207836]  __x64_sys_madvise+0xb2/0x120
[  135.208067]  ? syscall_trace_enter+0x14f/0x280
[  135.208328]  x64_sys_call+0x19b1/0x2150
[  135.208552]  do_syscall_64+0x6d/0x140
[  135.208766]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  135.209050] RIP: 0033:0x7f032763ee5d
[  135.209261] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b8
[  135.210261] RSP: 002b:00007ffcaafd26c8 EFLAGS: 00000207 ORIG_RAX: 000000000000001c
[  135.210678] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f032763ee5d
[  135.211069] RDX: 0000000000000064 RSI: 0000000000004000 RDI: 0000000020e7f000
[  135.211458] RBP: 00007ffcaafd26d0 R08: 00007ffcaafd2140 R09: 00007ffcaafd2700
[  135.211851] R10: 0000000000000000 R11: 0000000000000207 R12: 00007ffcaafd2828
[  135.212248] R13: 00000000004016da R14: 0000000000403e08 R15: 00007f0327a4e000
[  135.212656]  </TASK>
[  135.212794] irq event stamp: 807
[  135.212987] hardirqs last  enabled at (815): [<ffffffff81663b55>] __up_console_sem+0x95/0xb0
[  135.213477] hardirqs last disabled at (824): [<ffffffff81663b3a>] __up_console_sem+0x7a/0xb0
[  135.213951] softirqs last  enabled at (628): [<ffffffff8148c40e>] __irq_exit_rcu+0x10e/0x170
[  135.214426] softirqs last disabled at (623): [<ffffffff8148c40e>] __irq_exit_rcu+0x10e/0x170
[  135.214910] ---[ end trace 0000000000000000 ]---
[  135.215182]
[  135.215283] =====================================
[  135.215550] WARNING: bad unlock balance detected!
[  135.215817] 6.14.0-rc2-next-20250210-df5d6180169a #1 Tainted: G        W
[  135.216234] -------------------------------------
[  135.216502] repro/680 is trying to release lock (&mm->mmap_lock) at:
[  135.216863] [<ffffffff81e87854>] madvise_unlock+0xd4/0x1a0
[  135.217179] but there are no more locks to release!
[  135.217457]
[  135.217457] other info that might help us debug this:
[  135.217819] no locks held by repro/680.
[  135.218046]
[  135.218046] stack backtrace:
[  135.218296] CPU: 1 UID: 0 PID: 680 Comm: repro Tainted: G        W          6.14.0-rc2-next-20250210-df5d6180169a #1
[  135.218308] Tainted: [W]=WARN
[  135.218310] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[  135.218315] Call Trace:
[  135.218317]  <TASK>
[  135.218320]  dump_stack_lvl+0xea/0x150
[  135.218330]  ? madvise_unlock+0xd4/0x1a0
[  135.218341]  dump_stack+0x19/0x20
[  135.218349]  print_unlock_imbalance_bug+0x1b5/0x200
[  135.218368]  ? madvise_unlock+0xd4/0x1a0
[  135.218379]  lock_release+0x5bc/0x870
[  135.218386]  ? madvise_unlock+0x17f/0x1a0
[  135.218397]  ? handle_bug+0xf1/0x190
[  135.218407]  ? __pfx_lock_release+0x10/0x10
[  135.218415]  ? exc_invalid_op+0x3c/0x80
[  135.218426]  ? asm_exc_invalid_op+0x1f/0x30
[  135.218441]  up_write+0x31/0x550
[  135.218449]  ? madvise_unlock+0x17e/0x1a0
[  135.218462]  madvise_unlock+0xd4/0x1a0
[  135.218474]  do_madvise+0x14f/0x1a0
[  135.218487]  __x64_sys_madvise+0xb2/0x120
[  135.218500]  ? syscall_trace_enter+0x14f/0x280
[  135.218511]  x64_sys_call+0x19b1/0x2150
[  135.218522]  do_syscall_64+0x6d/0x140
[  135.218531]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  135.218542] RIP: 0033:0x7f032763ee5d
[  135.218548] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b8
[  135.218556] RSP: 002b:00007ffcaafd26c8 EFLAGS: 00000207 ORIG_RAX: 000000000000001c
[  135.218562] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f032763ee5d
[  135.218569] RDX: 0000000000000064 RSI: 0000000000004000 RDI: 0000000020e7f000
[  135.218573] RBP: 00007ffcaafd26d0 R08: 00007ffcaafd2140 R09: 00007ffcaafd2700
[  135.218578] R10: 0000000000000000 R11: 0000000000000207 R12: 00007ffcaafd2828
[  135.218582] R13: 00000000004016da R14: 0000000000403e08 R15: 00007f0327a4e000
[  135.218594]  </TASK>
[  135.228272] ------------[ cut here ]------------
[  135.228541] DEBUG_RWSEMS_WARN_ON((rwsem_owner(sem) != current) && !rwsem_test_oflags(sem, RWSEM_NONSPINNABLE)): count = 0x0, magy
[  135.229541] WARNING: CPU: 1 PID: 680 at kernel/locking/rwsem.c:1367 up_write+0x451/0x550
[  135.229997] Modules linked in:
[  135.230182] CPU: 1 UID: 0 PID: 680 Comm: repro Tainted: G        W          6.14.0-rc2-next-20250210-df5d6180169a #1
[  135.230758] Tainted: [W]=WARN
[  135.230940] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[  135.231565] RIP: 0010:up_write+0x451/0x550
[  135.231806] Code: ea 03 80 3c 02 00 0f 85 d5 00 00 00 49 8b 14 24 53 4d 89 f9 4c 89 f1 48 c7 c6 40 bd eb 85 48 c7 c7 60 bc eb 858
[  135.232814] RSP: 0018:ffff888022647e30 EFLAGS: 00010282
[  135.233113] RAX: 0000000000000000 RBX: ffffffff85ebbba0 RCX: ffffffff8146cfd3
[  135.233528] RDX: ffff88802264a540 RSI: ffffffff8146cfe0 RDI: 0000000000000001
[  135.233929] RBP: ffff888022647e78 R08: 0000000000000001 R09: ffffed10044c8f66
[  135.234325] R10: 0000000000000001 R11: 57525f4755424544 R12: ffff8880211162f0
[  135.234722] R13: ffff8880211162f8 R14: ffff8880211162f0 R15: ffff88802264a540
[  135.235122] FS:  00007f0327a07600(0000) GS:ffff88806c500000(0000) knlGS:0000000000000000
[  135.235584] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  135.235912] CR2: 00007f032773e7f0 CR3: 0000000021bd4003 CR4: 0000000000770ef0
[  135.236314] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  135.236713] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[  135.237114] PKRU: 55555554
[  135.237276] Call Trace:
[  135.237445]  <TASK>
[  135.237580]  ? show_regs+0x6d/0x80
[  135.237789]  ? __warn+0xf3/0x390
[  135.237987]  ? find_bug+0x310/0x490
[  135.238199]  ? up_write+0x451/0x550
[  135.238412]  ? report_bug+0x2cb/0x4b0
[  135.238636]  ? up_write+0x451/0x550
[  135.238853]  ? up_write+0x452/0x550
[  135.239065]  ? handle_bug+0xf1/0x190
[  135.239285]  ? exc_invalid_op+0x3c/0x80
[  135.239515]  ? asm_exc_invalid_op+0x1f/0x30
[  135.239768]  ? __warn_printk+0x173/0x2e0
[  135.240001]  ? __warn_printk+0x180/0x2e0
[  135.240235]  ? up_write+0x451/0x550
[  135.240445]  ? madvise_unlock+0x17e/0x1a0
[  135.240686]  madvise_unlock+0xd4/0x1a0
[  135.240913]  do_madvise+0x14f/0x1a0
[  135.241126]  __x64_sys_madvise+0xb2/0x120
[  135.241364]  ? syscall_trace_enter+0x14f/0x280
[  135.241647]  x64_sys_call+0x19b1/0x2150
[  135.241887]  do_syscall_64+0x6d/0x140
[  135.242113]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  135.242407] RIP: 0033:0x7f032763ee5d
[  135.242619] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b8
[  135.243646] RSP: 002b:00007ffcaafd26c8 EFLAGS: 00000207 ORIG_RAX: 000000000000001c
[  135.244075] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f032763ee5d
[  135.244476] RDX: 0000000000000064 RSI: 0000000000004000 RDI: 0000000020e7f000
[  135.244877] RBP: 00007ffcaafd26d0 R08: 00007ffcaafd2140 R09: 00007ffcaafd2700
[  135.245279] R10: 0000000000000000 R11: 0000000000000207 R12: 00007ffcaafd2828
[  135.245696] R13: 00000000004016da R14: 0000000000403e08 R15: 00007f0327a4e000
[  135.246106]  </TASK>
[  135.246242] irq event stamp: 857
[  135.246434] hardirqs last  enabled at (857): [<ffffffff81663b55>] __up_console_sem+0x95/0xb0
[  135.246915] hardirqs last disabled at (856): [<ffffffff81663b3a>] __up_console_sem+0x7a/0xb0
[  135.247392] softirqs last  enabled at (628): [<ffffffff8148c40e>] __irq_exit_rcu+0x10e/0x170
[  135.247871] softirqs last disabled at (623): [<ffffffff8148c40e>] __irq_exit_rcu+0x10e/0x170
[  135.248347] ---[ end trace 0000000000000000 ]---
"

Hope this cound be insightful to you.

Regards,
Yi Lai

---

If you don't need the following environment to reproduce the problem or if you
already have one reproduced environment, please ignore the following information.

How to reproduce:
git clone https://gitlab.com/xupengfe/repro_vm_env.git
cd repro_vm_env
tar -xvf repro_vm_env.tar.gz
cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
  // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
  // You could change the bzImage_xxx as you want
  // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
You could use below command to log in, there is no password for root.
ssh -p 10023 root@localhost

After login vm(virtual machine) successfully, you could transfer reproduced
binary to the vm by below way, and reproduce the problem in vm:
gcc -pthread -o repro repro.c
scp -P 10023 repro root@localhost:/root/

Get the bzImage for target kernel:
Please use target kconfig and copy it to kernel_src/.config
make olddefconfig
make -jx bzImage           //x should equal or less than cpu num your pc has

Fill the bzImage file into above start3.sh to load the target kernel in vm.


Tips:
If you already have qemu-system-x86_64, please ignore below info.
If you want to install qemu v7.1.0 version:
git clone https://github.com/qemu/qemu.git
cd qemu
git checkout -f v7.1.0
mkdir build
cd build
yum install -y ninja-build.x86_64
yum -y install libslirp-devel.x86_64
../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
make
make install 

> -- 
> 2.39.5
