Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A0F275B19
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751378344; cv=none; b=MKhUXNu3Esp5l+7HJ2IovcOCZRDhZABjf0zJ6BHPq/jGNHj07tKmPPbnUcGid0Ghn1Ym7WeQ4VGTU1IdoffyntoSK2ulLHejzOYuJeWEdD30uFHs9VBtISIeBFl593n6njpapTgXtJd+7h2GbUuZIjnot/x7zxuFiseH5UnllR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751378344; c=relaxed/simple;
	bh=Ka6lHO9hJib2IPlg85UPBcc5Dug56W2Uecb5XOvYP+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQC+bK2y6QUcZ0D7G36k6W4+94MqcfGjPAs7ItHxsOHHBvrOx4TQ+erXMRF4gPzI/c0VxQvBfAuwwrPvKDdjLIjaOqbTJp27ytYIF238Btk4i6PbSP2i+uwoAs0yX/NPLYWwPLXC/xf+UgCW2TXBcn7AAlj7Vne8CawglOBo+q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191FAC4CEEB;
	Tue,  1 Jul 2025 13:59:00 +0000 (UTC)
Date: Tue, 1 Jul 2025 14:58:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Xavier Xia <xavier.qyxia@gmail.com>
Cc: ryan.roberts@arm.com, will@kernel.org, 21cnbao@gmail.com,
	ioworker0@gmail.com, dev.jain@arm.com, akpm@linux-foundation.org,
	david@redhat.com, gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, willy@infradead.org, xavier_qy@163.com,
	ziy@nvidia.com, Barry Song <baohua@kernel.org>
Subject: Re: [PATCH v7] arm64/mm: Optimize loop to reduce redundant
 operations of  contpte_ptep_get
Message-ID: <aGPpohrc8APQad-v@arm.com>
References: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624152549.2647828-1-xavier.qyxia@gmail.com>

On Tue, Jun 24, 2025 at 11:25:49PM +0800, Xavier Xia wrote:
> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.
> 
> In order to verify the optimization performance, a test function has been
> designed. The function's execution time and instruction statistics have
> been traced using perf, and the following are the operation results on a
> certain Qualcomm mobile phone chip:
> 
> Test Code:
> 	#include <stdlib.h>
> 	#include <sys/mman.h>
> 	#include <stdio.h>
> 
> 	#define PAGE_SIZE 4096
> 	#define CONT_PTES 16
> 	#define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
> 	#define YOUNG_BIT 8
> 	void rwdata(char *buf)
> 	{
> 		for (size_t i = 0; i < TEST_SIZE; i += PAGE_SIZE) {
> 			buf[i] = 'a';
> 			volatile char c = buf[i];
> 		}
> 	}
> 	void clear_young_dirty(char *buf)
> 	{
> 		if (madvise(buf, TEST_SIZE, MADV_FREE) == -1) {
> 			perror("madvise free failed");
> 			free(buf);
> 			exit(EXIT_FAILURE);
> 		}
> 		if (madvise(buf, TEST_SIZE, MADV_COLD) == -1) {
> 			perror("madvise free failed");
> 			free(buf);
> 			exit(EXIT_FAILURE);
> 		}
> 	}
> 	void set_one_young(char *buf)
> 	{
> 		for (size_t i = 0; i < TEST_SIZE; i += CONT_PTES * PAGE_SIZE) {
> 			volatile char c = buf[i + YOUNG_BIT * PAGE_SIZE];
> 		}
> 	}
> 
> 	void test_contpte_perf() {
> 		char *buf;
> 		int ret = posix_memalign((void **)&buf, CONT_PTES * PAGE_SIZE,
> 				TEST_SIZE);
> 		if ((ret != 0) || ((unsigned long)buf % CONT_PTES * PAGE_SIZE)) {
> 			perror("posix_memalign failed");
> 			exit(EXIT_FAILURE);
> 		}
> 
> 		rwdata(buf);
> 	#if TEST_CASE2 || TEST_CASE3
> 		clear_young_dirty(buf);
> 	#endif
> 	#if TEST_CASE2
> 		set_one_young(buf);
> 	#endif
> 
> 		for (int j = 0; j < 500; j++) {
> 			mlock(buf, TEST_SIZE);
> 
> 			munlock(buf, TEST_SIZE);
> 		}
> 		free(buf);
> 	}
> 
> 	int main(void) 
> 	{
> 		test_contpte_perf();
> 		return 0;
> 	}
> 
> 	Descriptions of three test scenarios
> 
> Scenario 1
> 	The data of all 16 PTEs are both dirty and young.
> 	#define TEST_CASE2 0
> 	#define TEST_CASE3 0
> 
> Scenario 2
> 	Among the 16 PTEs, only the 8th one is young, and there are no dirty ones.
> 	#define TEST_CASE2 1
> 	#define TEST_CASE3 0
> 
> Scenario 3
> 	Among the 16 PTEs, there are neither young nor dirty ones.
> 	#define TEST_CASE2 0
> 	#define TEST_CASE3 1
> 
> Test results
> 
> |Scenario 1         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    37912436160|     18731580031|
> |test time          |         4.2797|          2.2949|
> |overhead of        |               |                |
> |contpte_ptep_get() |         21.31%|           4.80%|
> 
> |Scenario 2         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36701270862|     36115790086|
> |test time          |         3.2335|          3.0874|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         32.26%|          33.57%|
> 
> |Scenario 3         |       Original|       Optimized|
> |-------------------|---------------|----------------|
> |instructions       |    36706279735|     36750881878|
> |test time          |         3.2008|          3.1249|
> |Overhead of        |               |                |
> |contpte_ptep_get() |         31.94%|          34.59%|
> 
> For Scenario 1, optimized code can achieve an instruction benefit of 50.59%
> and a time benefit of 46.38%.
> For Scenario 2, optimized code can achieve an instruction count benefit of
> 1.6% and a time benefit of 4.5%.
> For Scenario 3, since all the PTEs have neither the young nor the dirty
> flag, the branches taken by optimized code should be the same as those of
> the original code. In fact, the test results of optimized code seem to be
> closer to those of the original code.
> 
> Ryan re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.
> 
> Scenario 1: reduced to 56% of baseline execution time
> Scenario 2: reduced to 89% of baseline execution time
> Scenario 3: reduced to 91% of baseline execution time

Still not keen on microbenchmarks to justify such change but at least
the code is more readable than the macro approach in some earlier
version.

Do you have any numbers to see how it compares with your v1:

https://lore.kernel.org/all/20250407092243.2207837-1-xavier_qy@163.com/

That patch was a lot simpler.

Thanks.

-- 
Catalin
