Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94C727A133
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705386; cv=none; b=UZV7bPxr63CYwCirc1xKHyfW1lOJfirZRB/qrugpmi3k23Q1JR3MKZotbsqimjPd2UglFHU4Th98bh338imUsWymdYGwd7Kyj0Z9NlA/DAmhlpM+fcg9HspwGtFCWfLOnB+9WGMcTxbX9XK/+n2i4pakQkj10AuD510Fr2WrbVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705386; c=relaxed/simple;
	bh=hBQGz68EAhUUoaphffKST7oNpN2SLRd9BgK7z10XIzw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P62kSEQJgQdmZYU2vABrRhaHWz9axSMYZYUpdH3A/v6azx3Dn/z5NwEFm24lQUubU3FOi7VZTnImlV4afSOTsagt/JrJAkQDSVzr6j/mN+LD0UsvBhsGZWMhq5PmCzk4OKk7B9pYJFNEk2md2B67iJR45lbmHflkMu8v45iBYrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I8GZSVT1; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I8GZSVT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=s1pdI
	+qWLMdWvmOJhkNxJK7/x/XjeO8jfm8Kt43rM84=; b=I8GZSVT1d//0q4O5ajzNv
	kSUx7iQH51Fo1rpim/DDXykkH7hOb+qG7abm7fWerL1p/QgDVhiBOmll3+/ePMzd
	JhYWqsdg8xab+317ijmBrUNcLLT6JUssavtscVtrICIamHD1hUuLEaau9ulREKRp
	/crVyqGRUCI2RKZZwL5HJQ=
Received: from localhost (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgD31wgvF_5nMzQKAg--.53883S2;
	Tue, 15 Apr 2025 16:22:07 +0800 (CST)
From: Xavier <xavier_qy@163.com>
To: ryan.roberts@arm.com,
	dev.jain@arm.com,
	ioworker0@gmail.com,
	21cnbao@gmail.com
Cc: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	david@redhat.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	will@kernel.org,
	willy@infradead.org,
	xavier_qy@163.com,
	ziy@nvidia.com
Subject: [mm/contpte v3 0/1] mm/contpte: Optimize loop to reduce redundant operations
Date: Tue, 15 Apr 2025 16:22:04 +0800
Message-Id: <20250415082205.2249918-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
References: <f0e109c7-6bb2-4218-bc76-c5de39184064@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgD31wgvF_5nMzQKAg--.53883S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWrWDWw48GFW3AFy3Kw17KFg_yoWrCF1kpa
	y7GF9I9r18GF9I93y7Cw1v9r1rAa95J343Jrs7Xa1fAas8Xr9YgryIkr4YyFyUGr1qq3yf
	ZF4j9rWDuFyvya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piQJ57UUUUU=
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiTgMwEGf+CY+r+QACsi

Patch V3 has changed the while loop to a for loop according to the suggestions
of Dev. Meanwhile, to improve efficiency, the definition of local variables has
been removed. This macro is only used within the current function and there
will be no additional risks. In order to verify the optimization performance of
Patch V3, a test function has been designed. By repeatedly calling mlock in a
loop, the kernel is made to call contpte_ptep_get extensively to test the
optimization effect of this function.
The function's execution time and instruction statistics have been traced using
perf, and the following are the operation results on a certain Qualcomm mobile
phone chip:

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

Test Function:
---
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
---

Xavier (1):
  mm/contpte: Optimize loop to reduce redundant operations

 arch/arm64/mm/contpte.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.34.1

