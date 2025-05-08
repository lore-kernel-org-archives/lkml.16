Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3301B21859D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 06:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746684001; cv=none; b=pH1yyLtvlUDg5uXy/foyJsTpgpSdKIGwe/wFGPvAGucuCdu6qUy3iwSnCrgU8XRSq+Q5q7ppM7u9eCbH5YtdJ2MmAkF+snVMyxhxUn8JixfHqsROE2hHlMzIoyOaaRDEMsWnak7tyllIlELT/89qhqLqW7zm0cjPJ2arVH2ADt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746684001; c=relaxed/simple;
	bh=E5d+duO3ltOVFlc1q4h4MDAptrCchoZERkvmIbudXno=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EBem9jRyUQBhmoOiaPAUcyM8iJkPIMut7MOltE8U7sthCkX1U34LxOkFpcvAMOVT43nYPPmIPFLc97H7FlSeeM/npW6elV33s7Z4wt49HbJHhM1tX2e20v53zVU+kTWImWs6c38pztIwgmn0y17qggvjJhTSjaja8CezPBhOV/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NshznGsu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NshznGsu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C722C4CEEB;
	Thu,  8 May 2025 06:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746684000;
	bh=E5d+duO3ltOVFlc1q4h4MDAptrCchoZERkvmIbudXno=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NshznGsuXnibeSmBtW+iybU3woiG100W7Gi8mM/4nuiZW2sA7gnjrMaN3n7E3BtlN
	 tMvEMijLcoToGeA6+EKJg2y8aGdpC1ct6+B9JucckvWMcbe216UswGM62FPsSsfKBo
	 R5IM44bxnzo0v8lVq/762HU3DhC23oN3fyz/gsys=
Date: Wed, 7 May 2025 22:59:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Coiby Xu <coxu@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, fuqiang wang <fuqiang.wang@easystack.cn>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-Id: <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
In-Reply-To: <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
	<ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
	<4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 8 May 2025 12:25:15 +0800 Coiby Xu <coxu@redhat.com> wrote:

> >
> >Acked-by: Baoquan He <bhe@redhat.com>
> 
> Hi Andrew,
> 
> It seems this patch was missed.

January 2024.  Yes, it's fair to assume that it was missed ;)

> Will you pick it up?

Sure.

> Without this patch,
> kdump kernel will fail to be loaded by the kexec_file_load,
> 
>   [  139.736948] UBSAN: array-index-out-of-bounds in arch/x86/kernel/crash.c:350:25
>   [  139.742360] index 0 is out of range for type 'range [*]'
>   [  139.745695] CPU: 0 UID: 0 PID: 5778 Comm: kexec Not tainted 6.15.0-0.rc3.20250425git02ddfb981de8.32.fc43.x86_64 #1 PREEMPT(lazy) 
>   [  139.745698] Hardware name: Amazon EC2 c5.large/, BIOS 1.0 10/16/2017
>   [  139.745699] Call Trace:
>   [  139.745700]  <TASK>
>   [  139.745701]  dump_stack_lvl+0x5d/0x80
>   [  139.745706]  ubsan_epilogue+0x5/0x2b
>   [  139.745709]  __ubsan_handle_out_of_bounds.cold+0x54/0x59
>   [  139.745711]  crash_setup_memmap_entries+0x2d9/0x330
>   [  139.745716]  setup_boot_parameters+0xf8/0x6a0
>   [  139.745720]  bzImage64_load+0x41b/0x4e0
>   [  139.745722]  ? find_next_iomem_res+0x109/0x140
>   [  139.745727]  ? locate_mem_hole_callback+0x109/0x170
>   [  139.745737]  kimage_file_alloc_init+0x1ef/0x3e0
>   [  139.745740]  __do_sys_kexec_file_load+0x180/0x2f0
>   [  139.745742]  do_syscall_64+0x7b/0x160
>   [  139.745745]  ? do_user_addr_fault+0x21a/0x690
>   [  139.745747]  ? exc_page_fault+0x7e/0x1a0
>   [  139.745749]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>   [  139.745751] RIP: 0033:0x7f7712c84e4d
> 

Do we know why this has appeared at such a late date?  The reporter
must be doing something rare.

Baoquan, please re-review this?

A -stable backport is clearly required.  A Fixes: would be nice, but I
assume this goes back a long time so it isn't worth spending a lot of
time working out when this was introduced.

The patch needed a bit of work to apply to current code.  I did the
below.  It compiles.

--- a/arch/x86/kernel/crash.c~x86-kexec-fix-potential-cmem-ranges-out-of-bounds
+++ a/arch/x86/kernel/crash.c
@@ -165,8 +165,18 @@ static struct crash_mem *fill_up_crash_e
 	/*
 	 * Exclusion of crash region and/or crashk_low_res may cause
 	 * another range split. So add extra two slots here.
+	 *
+	 * Exclusion of low 1M may not cause another range split, because the
+	 * range of exclude is [0, 1M] and the condition for splitting a new
+	 * region is that the start, end parameters are both in a certain
+	 * existing region in cmem and cannot be equal to existing region's
+	 * start or end. Obviously, the start of [0, 1M] cannot meet this
+	 * condition.
+	 *
+	 * But in order to lest the low 1M could be changed in the future,
+	 * (e.g. [stare, 1M]), add a extra slot.
 	 */
-	nr_ranges += 2;
+	nr_ranges += 3;
 	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
 	if (!cmem)
 		return NULL;
@@ -317,9 +327,16 @@ int crash_setup_memmap_entries(struct ki
 	 * split. So use two slots here.
 	 */
 	nr_ranges = 2;
-	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
+	/*
+	 * In the current x86 architecture code, the elfheader is always
+	 * allocated at crashk_res.start. But it depends on the allocation
+	 * position of elfheader in crashk_res. To avoid potential out of
+	 * bounds in future, add a extra slot.
+	 */
+	cmem = vzalloc(struct_size(cmem, ranges, 2));
 	if (!cmem)
 		return -ENOMEM;
+	cmem->max_nr_ranges = 2;
 
 	cmem->max_nr_ranges = nr_ranges;
 	cmem->nr_ranges = 0;
_

