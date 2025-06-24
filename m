Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B8B274B3A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778831; cv=none; b=E+Vll11xMfieYLvWCGdFtMOZiV2BVlML+BEKATWWM2He7eAqbVYPTBYjymFxN1F4KHuNA6Ase/WuR9iQXeloVRLV9vDrq5FrL25JDyAE0wLzcz+xeZ1DW6sJ/234VydCQTF8BPzBG8pq4Zqncvt8AmTZUScnMGeHlPwtT5JksFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778831; c=relaxed/simple;
	bh=3m28dC1Ms4+kihcveknoxg1ih6AAhaHEJNOrDFWZUms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tj8FSF6LTnSqpYyNSC+J/XMa6GuQ6TXEaJ+i9AKZojabEOoEQJEg493/C7g7U9ov/4nxMeKJ0In+OvtcxfswyN8dCnx3XTXeiPOjjVB6Lg5k/6CdHaok2n7l6ed9wbamgQJydq2CvhRwoB2sPfwU+rtFRpy+4nH3iIeO9/yjRlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0QzZ3kI; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0QzZ3kI"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234b9dfb842so49999375ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750778829; x=1751383629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ihMu+w7nCoTSGq+4RZCJ2TmkBfciX1sr6w0E83yVPuA=;
        b=I0QzZ3kIZwqAhTOgjL19VVlQkuoLyXrwWYsMGcm5DwKBeaxVa3NpQNlLdfpzlfW7+A
         Vfjpa28kVGg/kFpCUWmpNLbcN7HJJdICAsS7mS0Qyo2qWS2tEyBI1OfykElq1hidduUc
         QP/H23GRv+4QR8MrWaublDZvv5GxDschzDvOmMzd/zPWr2lQxDNkysdKeign8a5iVhnD
         mLJA0I4VHY8BIiPR+r5GYDgQvpa3PulWkFJXM5JcYkBv9xij4LmdzFCziBle85yURyt0
         1fb4U/RNfwqnUnVdxdSgM08U9SP7EnPDkh5VGZ3GKo6lGq2iBI9fqNj48w0jYM6EAI5N
         pbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778829; x=1751383629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ihMu+w7nCoTSGq+4RZCJ2TmkBfciX1sr6w0E83yVPuA=;
        b=H37wOcX0HtvjMt0DPZHDchtTQDh6+UESfVdTAZ7SKzur+22GDZWu1XG8hSHfFKdLJa
         NkAd5M+3ymODITLFz1J7KTdLWidrLKFCoqiyrLSxi68iknGzgB0G0gh3tuh0Oubbs/v0
         AsDfVr+h7gA4kXzsD3gNd/tipwYyGcLjfWiWGa797EafebDjRhSt4TyBw5B4smAMvKiy
         7WkFOaVpYS+6A4d9sXOlzJGvsfjf3vLoAZSgvJM2Ww6qdDvXbVr4s5LxNtrUM0EkFdTA
         lA487SRmxligItAFZ36RxEm1konxICEhdRYWQqzuPPwq7vTfB+8/pOO33kfsEbVWxxLL
         hpVg==
X-Forwarded-Encrypted: i=1; AJvYcCX0+9HXOqdeqEcq+lSyJetT49+J4xzaHg99Fyk1hvOhXPyIQHjLrBvhtQY0MguWMhh38W7GEBzBB4U/IfA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz2LUu/FS8Mo41+ieH7ZINZ/M7nq59eg61aPMNjUrbZQHmavwz
	V9n66w9W7Gvl5d4eRD3DM8OtRRe9s6Tr93g2dJLIcnUcddmXEExrrsD5
X-Gm-Gg: ASbGncsEARKuzw1Z1wbAJ6vEZ8uKNcEjF6vwus+pVfs3CzcD2wpE44GOK+5s27nzu9L
	vqLWekJJpgsl9Um5PpbJrCmL7RrB/5BYHDgnEEuB+aDYHU0fOA7hPXL3bZKM2GZIWdZ/jHL8XuK
	n473UDoFn/C7ma9hNFuGzgPqTHup/QLshsoX39U7SXBkHsq67OiTK4gZs8cuzW0jkBEW3dJTtvD
	post9g+kJnBPsJMGlbrQp5ru1dNezOzOdP81qutwI0nck6kB6z5TgvzjHbT/sCdKkKIf2Sz5r3a
	FIKq0Y7dAmOTio8XOVZufhmVLIvn1/ewvy6INu7M7jI42Wj95/vsQC1sPvoJh3vX6nyDNHWY+rQ
	=
X-Google-Smtp-Source: AGHT+IGyXs9ccyO6PIDBnUQkvw3swafltIfKcPLYEq/f4dAu6qbdAkS+Hno5e1qdpaxNZhpT3FQfjQ==
X-Received: by 2002:a17:903:32c5:b0:234:c5c1:9b63 with SMTP id d9443c01a7336-237d9907243mr218353515ad.18.1750778828233;
        Tue, 24 Jun 2025 08:27:08 -0700 (PDT)
Received: from localhost ([101.132.132.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2380655376esm15369475ad.26.2025.06.24.08.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 08:27:07 -0700 (PDT)
From: Xavier Xia <xavier.qyxia@gmail.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	21cnbao@gmail.com,
	ioworker0@gmail.com,
	dev.jain@arm.com
Cc: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	david@redhat.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	willy@infradead.org,
	xavier_qy@163.com,
	ziy@nvidia.com,
	Xavier Xia <xavier.qyxia@gmail.com>,
	Barry Song <baohua@kernel.org>
Subject: [PATCH v7] arm64/mm: Optimize loop to reduce redundant operations of  contpte_ptep_get
Date: Tue, 24 Jun 2025 23:25:49 +0800
Message-Id: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
	#include <stdlib.h>
	#include <sys/mman.h>
	#include <stdio.h>

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

	int main(void) 
	{
		test_contpte_perf();
		return 0;
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

Ryan re-ran these tests on Apple M2 with 4K base pages + 64K mTHP.

Scenario 1: reduced to 56% of baseline execution time
Scenario 2: reduced to 89% of baseline execution time
Scenario 3: reduced to 91% of baseline execution time

It can be proven through test function that the optimization for
contpte_ptep_get is effective. Since the logic of contpte_ptep_get_lockless
is similar to that of contpte_ptep_get, the same optimization scheme is
also adopted for it.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Tested-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Signed-off-by: Xavier Xia <xavier.qyxia@gmail.com>
---
Changes in v7:
- Update the header files and main function of the test program, as well as Ryan's validation data.
- Link to v6: https://lore.kernel.org/all/20250510125948.2383778-1-xavier_qy@163.com/

Changes in v6:
- Move prot = pte_pgprot(pte_mkold(pte_mkclean(pte))) into the contpte_is_consistent(),
  as suggested by Barry.
- Link to v5: https://lore.kernel.org/all/20250509122728.2379466-1-xavier_qy@163.com/

Changes in v5:
- Replace macro CHECK_CONTPTE_CONSISTENCY with inline function contpte_is_consistent
  for improved readability and clarity, as suggested by Barry.
- Link to v4: https://lore.kernel.org/all/20250508070353.2370826-1-xavier_qy@163.com/

Changes in v4:
- Convert macro CHECK_CONTPTE_FLAG to an internal loop for better readability.
- Refactor contpte_ptep_get_lockless using the same optimization logic, as suggested by Ryan.
- Link to v3: https://lore.kernel.org/all/3d338f91.8c71.1965cd8b1b8.Coremail.xavier_qy@163.com/
---
 arch/arm64/mm/contpte.c | 74 +++++++++++++++++++++++++++++++++++------
 1 file changed, 64 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index bcac4f55f9c1..71efe7dff0ad 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -169,17 +169,46 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
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
 
+static inline bool contpte_is_consistent(pte_t pte, unsigned long pfn,
+					pgprot_t orig_prot)
+{
+	pgprot_t prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
+
+	return pte_valid_cont(pte) && pte_pfn(pte) == pfn &&
+			pgprot_val(prot) == pgprot_val(orig_prot);
+}
+
 pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 {
 	/*
@@ -202,7 +231,6 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 	pgprot_t orig_prot;
 	unsigned long pfn;
 	pte_t orig_pte;
-	pgprot_t prot;
 	pte_t *ptep;
 	pte_t pte;
 	int i;
@@ -219,18 +247,44 @@ pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
 
 	for (i = 0; i < CONT_PTES; i++, ptep++, pfn++) {
 		pte = __ptep_get(ptep);
-		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
 
-		if (!pte_valid_cont(pte) ||
-		   pte_pfn(pte) != pfn ||
-		   pgprot_val(prot) != pgprot_val(orig_prot))
+		if (!contpte_is_consistent(pte, pfn, orig_prot))
 			goto retry;
 
-		if (pte_dirty(pte))
+		if (pte_dirty(pte)) {
 			orig_pte = pte_mkdirty(orig_pte);
+			for (; i < CONT_PTES; i++, ptep++, pfn++) {
+				pte = __ptep_get(ptep);
+
+				if (!contpte_is_consistent(pte, pfn, orig_prot))
+					goto retry;
+
+				if (pte_young(pte)) {
+					orig_pte = pte_mkyoung(orig_pte);
+					break;
+				}
+			}
+			break;
+		}
 
-		if (pte_young(pte))
+		if (pte_young(pte)) {
 			orig_pte = pte_mkyoung(orig_pte);
+			i++;
+			ptep++;
+			pfn++;
+			for (; i < CONT_PTES; i++, ptep++, pfn++) {
+				pte = __ptep_get(ptep);
+
+				if (!contpte_is_consistent(pte, pfn, orig_prot))
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

