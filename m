Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762198248C;
	Sat, 17 May 2025 16:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747498856; cv=none; b=nASIBYdQg1dI4LoNATUb/2skT4/BK3ef/fYtwgJSEsNY0QgHO95Cpso/qiHenSvxqw8GxHUIjItXlUROo0pe3KXV/zShj36KRau8h6UneqA61Dn9UOAM+43b/XRNBtY69c1PTDVqUsG9fxbzCeUbdpMRhOvDDEa5TnzldTeHWAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747498856; c=relaxed/simple;
	bh=GHDZJ1uuaBxwqH16gslmLd0P/tpgd2EgjPAEvjkwuAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TzxICXi8ri5miiupycnNAlBly0PLk64m0ZK8rCAT5/e/HIkHvMmUIPoIr0wyAuDIMBuft9OQtmcKgzLVkXOFZ5eBpwWmhiDhM3xyXAUNCDL5TE1Nd3UTlO7uOGay0eYV4B3dloj4wJKYY7u83wow5zSqFu9+6VAVqNCLAli7oSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FHiwGbKR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FHiwGbKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD3ECC4CEE3;
	Sat, 17 May 2025 16:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747498855;
	bh=GHDZJ1uuaBxwqH16gslmLd0P/tpgd2EgjPAEvjkwuAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FHiwGbKRX1aEb1keMr1efkCOl0cX+2+d9G34DoywXf9R2wPoNRlTUPAjaS70phMyg
	 5jcmLR0m2ivEwDLF28P3tWipqbKMG78FU0MYI+UazujlrbMJvMQHjo3r7FRYIgWLj+
	 Y+RfvkuSJWSItjedaw/XP6oGEf/gM61GfuRRBB+igfRlYLd6XuLzoGSCUsM8uElApG
	 us3RKLty01MAlJIWH82UANfVOBPNALmr3OrYlVLTv73BxiARYPE/xYKPoIRPhwAmJF
	 OAJZsUF0kIfI76BtepqHRc3FQ1q0YdrzF0iRTy+e80BZ1PBGXUiEAFJaVeFAr9qS84
	 p6D4xfyLOSvyw==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Usama Arif <usamaarif642@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	laoar.shao@gmail.com,
	baolin.wang@linux.alibaba.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com
Subject: Is number of process_madvise()-able ranges limited to 8? (was Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the process)
Date: Sat, 17 May 2025 09:20:48 -0700
Message-Id: <20250517162048.36347-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <c390dd7e-0770-4d29-bb0e-f410ff6678e3@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

On Fri, 16 May 2025 13:57:18 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
[...]
> Right now madvise() has limited utility because:
[...]
> - While you can perform multiple operations at once via process_madvise(),
>   even to the current process (after my changes to extend it), it's limited
>   to a single advice over 8 ranges.

I'm bit confused by the last part, since I'm understanding your point as 'vlen'
parameter of process_madvise() is limited to 8, but my test code below succeeds
with 'vlen' parameter value 512.  Could you please enlighten me?

Attaching my test code below.  You could simply run it as below.

    gcc test.c && ./a.out

==== Attachment 0 (test.c) ====
#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <sys/uio.h>
#include <unistd.h>

#define SZ_PAGE (4096)
#define NR_PAGES (512)
#define MMAP_SZ	(SZ_PAGE * NR_PAGES)

int main(void)
{
	char *buf;
	unsigned int i;
	int ret;
	pid_t pid = getpid();
	int pidfd = syscall(SYS_pidfd_open, pid, 0);
	struct iovec *vec;

	buf = mmap(NULL, MMAP_SZ, PROT_READ | PROT_WRITE, MAP_PRIVATE |
			MAP_ANON, -1, 0);
	if (buf == MAP_FAILED) {
		printf("mmap fail\n");
		return -1;
	}

	for (i = 0; i < MMAP_SZ; i++)
		buf[i] = 123;

	vec = malloc(sizeof(*vec) * NR_PAGES);
	for (i = 0; i < NR_PAGES; i++) {
		vec[i].iov_base = &buf[i * SZ_PAGE];
		vec[i].iov_len = SZ_PAGE;
	}

	ret = syscall(SYS_process_madvise, pidfd, vec, NR_PAGES,
			MADV_DONTNEED, 0);
	if (ret != MMAP_SZ) {
		printf("process_madvise fail\n");
		return -1;
	}

	ret = munmap(buf, MMAP_SZ);
	if (ret) {
		printf("munmap failed\n");
		return -1;
	}

	close(pidfd);
	printf("good\n");
	return 0;
}
