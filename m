Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C98EF9D9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744807744; cv=none; b=M1eTNodY0QtBNaY/5GhNtbnwZLZZw3GnydM8V/GMIyfB4E4cDT0uoscVE7jHi5L2MKVL1hl94biHETBY+4EkwdEfsl9Fmhh7f+C4o2EBZ8XkViyKvOgJGWl9KM0GNl/mZNg0P4YXRywomUa+9wesE8bIv1SwNACKHpRscRTutcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744807744; c=relaxed/simple;
	bh=vYnoukn4CMoGYgoRR1OAgW+0q0A0Qkc0pxf+G5WqoXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zv+7irn/87a0iSlpEOGG9ogV7Z1u06AtbgE9Ogz7BSb1W/sUbcDVHZ6tDs6CIsQuutLJH41KNoxw01OFUH8IK4IZKC3bhb9w9zw3fh+/wmfrvwiTB8UX1Ks7V6TJfPEqrUfUJfxH9Wvt5z+WU3fDuJLbs8HaamlQWL6MbJ8/aOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35D461595;
	Wed, 16 Apr 2025 05:48:59 -0700 (PDT)
Received: from [10.57.90.106] (unknown [10.57.90.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35E0D3F694;
	Wed, 16 Apr 2025 05:48:59 -0700 (PDT)
Message-ID: <ad57ec62-00a8-4f7e-aad1-f28cc14d6af4@arm.com>
Date: Wed, 16 Apr 2025 13:48:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mm/contpte v3 0/1] mm/contpte: Optimize loop to reduce redundant
 operations
Content-Language: en-GB
To: Xavier <xavier_qy@163.com>, dev.jain@arm.com, ioworker0@gmail.com,
 21cnbao@gmail.com
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, david@redhat.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
 <20250415082205.2249918-1-xavier_qy@163.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250415082205.2249918-1-xavier_qy@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2025 09:22, Xavier wrote:
> Patch V3 has changed the while loop to a for loop according to the suggestions
> of Dev. Meanwhile, to improve efficiency, the definition of local variables has
> been removed. This macro is only used within the current function and there
> will be no additional risks. In order to verify the optimization performance of
> Patch V3, a test function has been designed. By repeatedly calling mlock in a
> loop, the kernel is made to call contpte_ptep_get extensively to test the
> optimization effect of this function.
> The function's execution time and instruction statistics have been traced using
> perf, and the following are the operation results on a certain Qualcomm mobile
> phone chip:

Xavier, for some reason your emails aren't hitting my inbox - I'm only seeing
the replies from others. I'll monitor lore but appologies if I'm slow to respond
- that's the reason.

Please start the first line of the commit with "arm64/mm" instead of "mm/contpte".

Also I noticed that Andrew put this into mm-new last night. I'd prefer that this
go via the arm64 tree, if we decide we want it.


> 
> Instruction Statistics - Before Optimization
> #          count  event_name              # count / runtime
>       20,814,352  branch-load-misses      # 662.244 K/sec
>   41,894,986,323  branch-loads            # 1.333 G/sec
>        1,957,415  iTLB-load-misses        # 62.278 K/sec
>   49,872,282,100  iTLB-loads              # 1.587 G/sec
>      302,808,096  L1-icache-load-misses   # 9.634 M/sec
>   49,872,282,100  L1-icache-loads         # 1.587 G/sec
> 
> Total test time: 31.485237 seconds.
> 
> Instruction Statistics - After Optimization
> #          count  event_name              # count / runtime
>       19,340,524  branch-load-misses      # 688.753 K/sec
>   38,510,185,183  branch-loads            # 1.371 G/sec
>        1,812,716  iTLB-load-misses        # 64.554 K/sec
>   47,673,923,151  iTLB-loads              # 1.698 G/sec
>      675,853,661  L1-icache-load-misses   # 24.068 M/sec
>   47,673,923,151  L1-icache-loads         # 1.698 G/sec
> 
> Total test time: 28.108048 seconds.
> 
> Function Statistics - Before Optimization
> Arch: arm64
> Event: cpu-cycles (type 0, config 0)
> Samples: 1419716
> Event count: 99618088900
> 
> Overhead   Symbol
> 21.42%     lock_release
> 21.26%     lock_acquire
> 20.88%     arch_counter_get_cntvct
> 14.32%     _raw_spin_unlock_irq
> 6.79%      contpte_ptep_get
> 2.20%      test_contpte_perf
> 1.82%      follow_page_pte
> 0.97%      lock_acquired
> 0.97%      rcu_is_watching
> 0.89%      mlock_pte_range
> 0.84%      sched_clock_noinstr
> 0.70%      handle_softirqs.llvm.8218488130471452153
> 0.58%      test_preempt_disable_long
> 0.57%      _raw_spin_unlock_irqrestore
> 0.54%      arch_stack_walk
> 0.51%      vm_normal_folio
> 0.48%      check_preemption_disabled
> 0.47%      stackinfo_get_task
> 0.36%      try_grab_folio
> 0.34%      preempt_count
> 0.32%      trace_preempt_on
> 0.29%      trace_preempt_off
> 0.24%      debug_smp_processor_id
> 
> Function Statistics - After Optimization
> Arch: arm64
> Event: cpu-cycles (type 0, config 0)
> Samples: 1431006
> Event count: 118856425042
> 
> Overhead   Symbol
> 22.59%     lock_release
> 22.13%     arch_counter_get_cntvct
> 22.08%     lock_acquire
> 15.32%     _raw_spin_unlock_irq
> 2.26%      test_contpte_perf
> 1.50%      follow_page_pte
> 1.49%      arch_stack_walk
> 1.30%      rcu_is_watching
> 1.09%      lock_acquired
> 1.07%      sched_clock_noinstr
> 0.88%      handle_softirqs.llvm.12507768597002095717
> 0.88%      trace_preempt_off
> 0.76%      _raw_spin_unlock_irqrestore
> 0.61%      check_preemption_disabled
> 0.52%      trace_preempt_on
> 0.50%      mlock_pte_range
> 0.43%      try_grab_folio
> 0.41%      folio_mark_accessed
> 0.40%      vm_normal_folio
> 0.38%      test_preempt_disable_long
> 0.28%      contpte_ptep_get
> 0.27%      __traceiter_android_rvh_preempt_disable
> 0.26%      debug_smp_processor_id
> 0.24%      return_address
> 0.20%      __pte_offset_map_lock
> 0.19%      unwind_next_frame_record
> 
> If there is no problem with my test program, it can be seen that there is a
> significant performance improvement both in the overall number of instructions
> and the execution time of contpte_ptep_get.
> 
> If any reviewers have time, you can also test it on your machines for comparison.
> I have enabled THP and hugepages-64kB.
> 
> Test Function:
> ---
> #define PAGE_SIZE 4096
> #define CONT_PTES 16
> #define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> 
> void rwdata(char *buf)
> {
> 	for (size_t i = 0; i < TEST_SIZE; i += PAGE_SIZE) {
> 		buf[i] = 'a';
> 		volatile char c = buf[i];
> 	}
> }
> void test_contpte_perf()
> {
> 	char *buf;
> 	int ret = posix_memalign((void **)&buf, PAGE_SIZE, TEST_SIZE);
> 	if (ret != 0) {
> 		perror("posix_memalign failed");
> 		exit(EXIT_FAILURE);
> 	}
> 
> 	rwdata(buf);
> 
> 	for (int j = 0; j < 500; j++) {
> 		mlock(buf, TEST_SIZE);
> 
> 		rwdata(buf);
> 
> 		munlock(buf, TEST_SIZE);

This is a microbenchmark in a pathological case and it's showing ~11%
improvement. But in principle I'm ok with it. I have some comments on the actual
change though, which I'll send through against email.

Thanks,
Ryan

> 	}
> 	
> 	free(buf);
> }
> ---
> 
> Xavier (1):
>   mm/contpte: Optimize loop to reduce redundant operations
> 
>  arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 

