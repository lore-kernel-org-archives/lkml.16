Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B496733FD
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 07:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746687890; cv=none; b=VDmT+TpwbjGjaAJvDwsqUlIz4leJ2iDH+kRLSClW2rqpsYpmqTxlY7loT/2izSkog/cZD/x9C5WJpjxZrbK2RrW0X4h/IMChwiaV6zhA5ANcf9MbUFSOq2cl5u7MMxMeUYmK05HahqrVPltsvPe+BiYXqjOpdDUrFBAZ4kHgwjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746687890; c=relaxed/simple;
	bh=nLI1DqRIG3lL0HaEQrt/UiYKgnlVUBficT1GylWRTH4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u3H7JgHPwLYbJPUN7N3o4sgZEgdZG60iu2ZPNpu76Q465etHrYgZBYPXsqy1vdmXCobgjAYFSwbV9/Wqe+sfMNmz5nuwP/1NsbLNT7uZfiKvC5LFp95qDYBHhoRawKbc/vz06LGfXTrDcvU6SftU0tAEHn2B0pAGhvmMyFOxTZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XI75sKNp; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XI75sKNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Kr8e6
	qUDT+mw8m3JteOIIO9UbKp7+NjM1uRCI/12CMU=; b=XI75sKNp7ZCRzK75t3jy+
	nH+cPQTrE1LUP/yhiM0BvESOyHHulhvq84nHbo11zEIyILy5jJKUoLpfg1KUqATK
	yjTv+iQy+uL/lC+hsvOoxphbWJ3+o/s1xJAgWy282usV+NRUeWDueHlS5VHNjCTP
	4MMr8gN9JAC3BH+leMVl7A=
Received: from localhost (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBXNg9aVxxobiX7CA--.61632S2;
	Thu, 08 May 2025 15:03:54 +0800 (CST)
From: Xavier Xia <xavier_qy@163.com>
To: 21cnbao@gmail.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	ioworker0@gmail.com
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
Subject: [PATCH v4] arm64/mm: Optimize loop to reduce redundant operations of contpte_ptep_get
Date: Thu,  8 May 2025 15:03:53 +0800
Message-Id: <20250508070353.2370826-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
References: <CAGsJ_4xVFDioe4G9wtjfRCKZMLBu94GaFG1z5j0YrHs3j1PkAw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgBXNg9aVxxobiX7CA--.61632S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3GF1UCr47Cw1fWry7tF1rCrg_yoW7KrWDpF
	WfCF1aqr97JFn3Gw4fJw1Dtr45J3s3Jay7XrnIka18Aa4DurZY9FW2kryFyryxGrWkX3y8
	Ar18Wr4DWFyDCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piJUUUUUUUU=
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiThJHEGgcUbqw8wAAsX

This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
function by adding early termination logic. It checks if the dirty and
young bits of orig_pte are already set and skips redundant bit-setting
operations during the loop. This reduces unnecessary iterations and
improves performance.

In order to verify the optimization performance, a test function has been
designed. The function's execution time and instruction statistics have
been traced using perf, and the following are the operation results on a
certain Qualcomm mobile phone chip:

Test Code:

	#define PAGE_SIZE 4096
	#define CONT_PTES 16
	#define TEST_SIZE (4096* CONT_PTES * PAGE_SIZE)
	#define YOUNG_BIT 8
	void rwdata(char *buf)
	{
		for (size_t i = 0; i < TEST_SIZE; i += PAGE_SIZE) {
			buf[i] = 'a';
			volatile char c = buf[i];
		}
	}
	void clear_young_dirty(char *buf)
	{
		if (madvise(buf, TEST_SIZE, MADV_FREE) == -1) {
			perror("madvise free failed");
			free(buf);
			exit(EXIT_FAILURE);
		}
		if (madvise(buf, TEST_SIZE, MADV_COLD) == -1) {
			perror("madvise free failed");
			free(buf);
			exit(EXIT_FAILURE);
		}
	}
	void set_one_young(char *buf)
	{
		for (size_t i = 0; i < TEST_SIZE; i += CONT_PTES * PAGE_SIZE) {
			volatile char c = buf[i + YOUNG_BIT * PAGE_SIZE];
		}
	}

	void test_contpte_perf() {
		char *buf;
		int ret = posix_memalign((void **)&buf, CONT_PTES * PAGE_SIZE,
				TEST_SIZE);
		if ((ret != 0) || ((unsigned long)buf % CONT_PTES * PAGE_SIZE)) {
			perror("posix_memalign failed");
			exit(EXIT_FAILURE);
		}

		rwdata(buf);
	#if TEST_CASE2 || TEST_CASE3
		clear_young_dirty(buf);
	#endif
	#if TEST_CASE2
		set_one_young(buf);
	#endif

		for (int j = 0; j < 500; j++) {
			mlock(buf, TEST_SIZE);

			munlock(buf, TEST_SIZE);
		}
		free(buf);
	}

	Descriptions of three test scenarios

Scenario 1
	The data of all 16 PTEs are both dirty and young.
	#define TEST_CASE2 0
	#define TEST_CASE3 0

Scenario 2
	Among the 16 PTEs, only the 8th one is young, and there are no dirty ones.
	#define TEST_CASE2 1
	#define TEST_CASE3 0

Scenario 3
	Among the 16 PTEs, there are neither young nor dirty ones.
	#define TEST_CASE2 0
	#define TEST_CASE3 1

Test results

|Scenario 1         |       Original|       Optimized|
|-------------------|---------------|----------------|
|instructions       |    37912436160|     18731580031|
|test time          |         4.2797|          2.2949|
|overhead of        |               |                |
|contpte_ptep_get() |         21.31%|           4.80%|

|Scenario 2         |       Original|       Optimized|
|-------------------|---------------|----------------|
|instructions       |    36701270862|     36115790086|
|test time          |         3.2335|          3.0874|
|Overhead of        |               |                |
|contpte_ptep_get() |         32.26%|          33.57%|

|Scenario 3         |       Original|       Optimized|
|-------------------|---------------|----------------|
|instructions       |    36706279735|     36750881878|
|test time          |         3.2008|          3.1249|
|Overhead of        |               |                |
|contpte_ptep_get() |         31.94%|          34.59%|

For Scenario 1, optimized code can achieve an instruction benefit of 50.59%
and a time benefit of 46.38%.
For Scenario 2, optimized code can achieve an instruction count benefit of
1.6% and a time benefit of 4.5%.
For Scenario 3, since all the PTEs have neither the young nor the dirty
flag, the branches taken by optimized code should be the same as those of
the original code. In fact, the test results of optimized code seem to be
closer to those of the original code.

It can be proven through test function that the optimization for
contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lockless
is similar to that of contpte_ptep_get, the same optimization scheme is
also adopted for it.

Signed-off-by: Xavier Xia <xavier_qy@163.com>
---
 arch/arm64/mm/contpte.c | 71 +++++++++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..e9882ec782fc 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -169,17 +169,41 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
 	for (i = 0; i < CONT_PTES; i++, ptep++) {
 		pte = __ptep_get(ptep);
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
+			for (; i < CONT_PTES; i++, ptep++) {
+				pte = __ptep_get(ptep);
+				if (pte_young(pte)) {
+					orig_pte = pte_mkyoung(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			i++;
+			ptep++;
+			for (; i < CONT_PTES; i++, ptep++) {
+				pte = __ptep_get(ptep);
+				if (pte_dirty(pte)) {
+					orig_pte = pte_mkdirty(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return orig_pte;
 }
 EXPORT_SYMBOL_GPL(contpte_ptep_get);
 
+#define CHECK_CONTPTE_CONSISTENCY(pte, pfn, prot, orig_prot) \
+	(!pte_valid_cont(pte) || pte_pfn(pte) != pfn || \
+		pgprot_val(prot) != pgprot_val(orig_prot))
+
 pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 {
 	/*
@@ -221,16 +245,45 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 		pte = __ptep_get(ptep);
 		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
 
-		if (!pte_valid_cont(pte) ||
-		   pte_pfn(pte) != pfn ||
-		   pgprot_val(prot) != pgprot_val(orig_prot))
+		if (CHECK_CONTPTE_CONSISTENCY(pte, pfn, prot, orig_prot))
 			goto retry;
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = pte_mkdirty(orig_pte);
-
-		if (pte_young(pte))
+			for (; i < CONT_PTES; i++, ptep++, pfn++) {
+				pte = __ptep_get(ptep);
+				prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+
+				if (CHECK_CONTPTE_CONSISTENCY(pte, pfn, prot, orig_prot))
+					goto retry;
+
+				if (pte_young(pte)) {
+					orig_pte = pte_mkyoung(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
+
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			i++;
+			ptep++;
+			pfn++;
+			for (; i < CONT_PTES; i++, ptep++, pfn++) {
+				pte = __ptep_get(ptep);
+				prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+
+				if (CHECK_CONTPTE_CONSISTENCY(pte, pfn, prot, orig_prot))
+					goto retry;
+
+				if (pte_dirty(pte)) {
+					orig_pte = pte_mkdirty(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
 	}
 
 	return orig_pte;
-- 
2.34.1

