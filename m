Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA69F15E96
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744769428; cv=none; b=uYEEQglBJAex1DvYvsx1xN3XBItCTjxXfGAYADW/LMieUOBBbRhNFqYYxPq/kXdv1MMoMytS4K5d+rP84kE4xSxYQS2/QtRT2gcEUbuCwjrrVPm/VB0AUOtwPX6MCX/Z8MXjZXBR6nIu8GyZEtOyL/6VfnbPt8NJnieWMy2LEqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744769428; c=relaxed/simple;
	bh=KCNACl7zufHX97jb7pv9K9FjOVnS0/vY8rxL+bG3RL8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Gr29KqV1T+sVnXR9lo1ULylzBLHmVI2UUUITo2jr1fEZnRNKbSdzoG7A3DIwQPfbprUQ9pV92qi8s1aLi8dPOePl8UY4Tqye+THqN6vCWvV9EGn4oWYQusFRHa5SiRrQsyJ8zXHicZzVg991z79YpqaCBnBkrVKwwaFp03SfFPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=mLGoTFbz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="mLGoTFbz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E9AC4CEE7;
	Wed, 16 Apr 2025 02:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1744769428;
	bh=KCNACl7zufHX97jb7pv9K9FjOVnS0/vY8rxL+bG3RL8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mLGoTFbzd0nqC8JIbKw4mk9tSnzHhBey0IVKolAJS+NzKw2C9mHEJ4sG7Fbf962BO
	 SywX8qE7FNe8OZ+TV2WN/OHHCCSl3+K8yHppf+VxBFSJmkcNOO/3kZAkSVJ5XMw2bK
	 uH1ZKy0lmlF8Wxrt83QJCQzr+94OKudopD6bgx/4=
Date: Tue, 15 Apr 2025 19:10:27 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Xavier <xavier_qy@163.com>
Cc: ryan.roberts@arm.com, dev.jain@arm.com, ioworker0@gmail.com,
 21cnbao@gmail.com, catalin.marinas@arm.com, david@redhat.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, willy@infradead.org,
 ziy@nvidia.com
Subject: Re: [mm/contpte v3 0/1] mm/contpte: Optimize loop to reduce
 redundant operations
Message-Id: <20250415191027.0fb3261d1ae58723c68731ae@linux-foundation.org>
In-Reply-To: <20250415082205.2249918-1-xavier_qy@163.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
	<20250415082205.2249918-1-xavier_qy@163.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Please try to avoid presentation of a [0/N] cover letter when N==1!  A
simple singleton patch is better.

On Tue, 15 Apr 2025 16:22:04 +0800 Xavier <xavier_qy@163.com> wrote:

> Patch V3 has changed the while loop to a for loop according to the suggestions
> of Dev. Meanwhile, to improve efficiency, the definition of local variables has
> been removed. This macro is only used within the current function and there

which function?

> will be no additional risks. In order to verify the optimization performance of
> Patch V3, a test function has been designed. By repeatedly calling mlock in a
> loop, the kernel is made to call contpte_ptep_get extensively to test the
> optimization effect of this function.
> The function's execution time and instruction statistics have been traced using
> perf, and the following are the operation results on a certain Qualcomm mobile
> phone chip:

All the words thus far appear to be discussing changes since v2.  For
the permanent kernel record, this isn't interesting or useful material.
So please present a standalone description which doesn't refer to
previous iterations.

It's great to present this what-i-changed-since-last-time material, but
that is better placed after the "^---$" separator, after the
Signed-off-by:, Reviewed-by: etc tags.

>
> ...
>


Below is what I came up with for a changelog.  Please check?

Optimize contpte_ptep_get() by adding early termination logic.  Check if
the dirty and young bits of orig_pte are already set and skip redundant
bit-setting operations during the loop.  This reduces unnecessary
iterations and improves performance.

The function's execution time and instruction statistics have been traced
using perf, and the following are the operation results on a certain
Qualcomm mobile phone chip:

Instruction Statistics - Before Optimization
#          count  event_name              # count / runtime
      20,814,352  branch-load-misses      # 662.244 K/sec
  41,894,986,323  branch-loads            # 1.333 G/sec
       1,957,415  iTLB-load-misses        # 62.278 K/sec
  49,872,282,100  iTLB-loads              # 1.587 G/sec
     302,808,096  L1-icache-load-misses   # 9.634 M/sec
  49,872,282,100  L1-icache-loads         # 1.587 G/sec

Total test time: 31.485237 seconds.

Instruction Statistics - After Optimization
#          count  event_name              # count / runtime
      19,340,524  branch-load-misses      # 688.753 K/sec
  38,510,185,183  branch-loads            # 1.371 G/sec
       1,812,716  iTLB-load-misses        # 64.554 K/sec
  47,673,923,151  iTLB-loads              # 1.698 G/sec
     675,853,661  L1-icache-load-misses   # 24.068 M/sec
  47,673,923,151  L1-icache-loads         # 1.698 G/sec

Total test time: 28.108048 seconds.

Function Statistics - Before Optimization
Arch: arm64
Event: cpu-cycles (type 0, config 0)
Samples: 1419716
Event count: 99618088900

Overhead   Symbol
21.42%     lock_release
21.26%     lock_acquire
20.88%     arch_counter_get_cntvct
14.32%     _raw_spin_unlock_irq
6.79%      contpte_ptep_get
2.20%      test_contpte_perf
1.82%      follow_page_pte
0.97%      lock_acquired
0.97%      rcu_is_watching
0.89%      mlock_pte_range
0.84%      sched_clock_noinstr
0.70%      handle_softirqs.llvm.8218488130471452153
0.58%      test_preempt_disable_long
0.57%      _raw_spin_unlock_irqrestore
0.54%      arch_stack_walk
0.51%      vm_normal_folio
0.48%      check_preemption_disabled
0.47%      stackinfo_get_task
0.36%      try_grab_folio
0.34%      preempt_count
0.32%      trace_preempt_on
0.29%      trace_preempt_off
0.24%      debug_smp_processor_id

Function Statistics - After Optimization
Arch: arm64
Event: cpu-cycles (type 0, config 0)
Samples: 1431006
Event count: 118856425042

Overhead   Symbol
22.59%     lock_release
22.13%     arch_counter_get_cntvct
22.08%     lock_acquire
15.32%     _raw_spin_unlock_irq
2.26%      test_contpte_perf
1.50%      follow_page_pte
1.49%      arch_stack_walk
1.30%      rcu_is_watching
1.09%      lock_acquired
1.07%      sched_clock_noinstr
0.88%      handle_softirqs.llvm.12507768597002095717
0.88%      trace_preempt_off
0.76%      _raw_spin_unlock_irqrestore
0.61%      check_preemption_disabled
0.52%      trace_preempt_on
0.50%      mlock_pte_range
0.43%      try_grab_folio
0.41%      folio_mark_accessed
0.40%      vm_normal_folio
0.38%      test_preempt_disable_long
0.28%      contpte_ptep_get
0.27%      __traceiter_android_rvh_preempt_disable
0.26%      debug_smp_processor_id
0.24%      return_address
0.20%      __pte_offset_map_lock
0.19%      unwind_next_frame_record

If there is no problem with my test program, it can be seen that there is a
significant performance improvement both in the overall number of instructions
and the execution time of contpte_ptep_get.

If any reviewers have time, you can also test it on your machines for comparison.
I have enabled THP and hugepages-64kB.

Test function:

#define PAGE_SIZE 4096
#define CONT_PTES 16
#define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)

void rwdata(char *buf)
{
	for (size_t i = 0; i < TEST_SIZE; i += PAGE_SIZE) {
		buf[i] = 'a';
		volatile char c = buf[i];
	}
}
void test_contpte_perf()
{
	char *buf;
	int ret = posix_memalign((void **)&buf, PAGE_SIZE, TEST_SIZE);
	if (ret != 0) {
		perror("posix_memalign failed");
		exit(EXIT_FAILURE);
	}

	rwdata(buf);

	for (int j = 0; j < 500; j++) {
		mlock(buf, TEST_SIZE);

		rwdata(buf);

		munlock(buf, TEST_SIZE);
	}
	
	free(buf);
}

