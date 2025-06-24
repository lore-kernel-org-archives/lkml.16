Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D708307499
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778945; cv=none; b=XK/jeORslkfABolIBqcej6DxKr/yCmFmU8SvUqVHNL/tF5Gzmu/ktXxIrTH2/JkUB0bGCP/SFJ5eZnprAUUW58yYImXZqUaZSogUWva68rqnVmFHEX0Xv+cZyMnR/S+vdrrJ5FxdijAlASHnFS/ywce/pA0qTMHnkgrRzWNKFJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778945; c=relaxed/simple;
	bh=oIGt1YC9iJlRo9lr3kCgdE2f+vO/tA4yKFy3VgCt9rI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+4hcvR5POH4TFztsoYJ6b+budSajIXZKNakveX/yjkDDJJhWuYgFROBUTuSJkKKPmB+4ITh+M13OUtPbs6bjm+6+Xx0C0xHbdjBSGFCUEUqvGOn8qV/KVqrmg7N7WxQpLIILN311t3zcpr3JoabGYFHQw/N74Hx4ZidTMU11Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmxUuvGP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmxUuvGP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a582e09144so3387327f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750778942; x=1751383742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HKZOMizjC+LML2kgDOmX49x7zP8t7J7YW3XavcrCNs=;
        b=jmxUuvGPGynO2JzvaCK5fBIuR2I/smVLf8KqEbhMo+8alfKFYVJsnZkTa8nVVU3rtg
         s7IWDFpAC5PmgLpM51nvQO+mtYK7p2dMDgBpiPk9opXgT/efEd1jv+NQbETiGpECBN3f
         z7dDUJLtLoiLs239cdiDxxVbk7oxgrID8KWWde6kv7Qj1XU9ssFApias2v3TtE3O2aOp
         g6zOMf9AaTLbI90qsVyMSLLXATRRU0JKnBNKeW3B7yeEmFAv9IpMrhsQptqleKkQbQnN
         BQWp1e/9Nu8qPitBbjRPt7gGqgBld1aeO8RwfY9YQjRuBTCt51KuPod/4ovLoOpW8kAk
         7fnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778942; x=1751383742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HKZOMizjC+LML2kgDOmX49x7zP8t7J7YW3XavcrCNs=;
        b=xKTmKhMgISObU+CKFzs84pOWH8joe6WRhbHGGvgmRj0yVxI7HdLw//CUG2i3HM9y5X
         lW7qt4w/mUE/19fSb71WSfaz8WbB3T/kPi/t1bBwlfkTmwMljr6luvrl/uMDu5X//1c5
         5vjXgQrS8M+yxBO1y3dd2ndpua4UCybQs/JawJABuPl0l1kcZ2F077WBtPhu667oDSjn
         XKfpqdwnS6MpXArrMT1pkLplZmGOt5pwI1+3yroGs6yz0IOImyXkNrbgz3+3EZrzrQJ5
         ENaNUSu7LJNldxvm/Mwhl4BWgSzxtSNAZsC+tu+mBNMVhyWJWmgsPfEvqCNw6SyHt5sN
         N8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVE7vDlTd1irzt92HWzhsb0sGJGuF/tXWImTcdOg33YMHx1A92ORzvTdH5cTn30JZ90fgWCXw2vvGsaVlg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV/T4mpaKjqtHuE6xylaBq2JZLG1MLSFneMwyAjHK+qmjzvseA
	USShZ9iN+RjEXgLlPxC5DW9EHmbu7QiRohiv+ECEXtsz/MMRO16i+snb
X-Gm-Gg: ASbGncsmHZKTrRpYdgA72eGzIH1nQiCHfGQjq06IFjTAQIpwTeTCOBN0/GB8bTtdkKo
	bNdgRM+BrNh/UIZq9ZTvVbFNF4040eZVFCZXvtZjdU5J2UtXQA5ENGK8tKsSatACi3eVsd2Y8cN
	LrhjScofan5Hr/kH0/Dq8GtoJt08Q4OxIqxQSAMZVkcnX7rDnJ4NAK+2q5CVDMvrZYTNwNhQl20
	H6CG8oJVF95CStI28t6zMJUeQ06QVV7sjWNB3Dud9oRU6MV3Rvg1Tnhbrk75l8LUZbwjSBL/Lrb
	20FigSLqwQQdvS4T5bZDhgSto5ygHAOHr7tNVuGuUaPkwNC83KlDT94dgTz6
X-Google-Smtp-Source: AGHT+IGcrYUCG4zfszj6fg/blm8ReRuQCCQCBeOsqMPtqwdTWUylx1xgbwj//MHlp30gYyOjSUtesw==
X-Received: by 2002:a05:6000:178f:b0:3a5:2257:17b4 with SMTP id ffacd0b85a97d-3a6d1319d72mr16109499f8f.55.1750778942035;
        Tue, 24 Jun 2025 08:29:02 -0700 (PDT)
Received: from localhost.localdomain ([2a09:0:1:2::305a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2977sm2272345f8f.63.2025.06.24.08.28.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Jun 2025 08:29:01 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: david@redhat.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Tue, 24 Jun 2025 23:26:54 +0800
Message-ID: <20250624152654.38145-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com>
References: <a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 2025/6/24 20:55, David Hildenbrand wrote:
> On 14.02.25 10:30, Barry Song wrote:
>> From: Barry Song <v-songbaohua@oppo.com>
[...]
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 89e51a7a9509..8786704bd466 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *folio, 
>> struct page *page,
>>   #endif
>>   }
>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>> +            struct folio *folio, pte_t *ptep)
>> +{
>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +    int max_nr = folio_nr_pages(folio);
> 
> Let's assume we have the first page of a folio mapped at the last page 
> table entry in our page table.

Good point. I'm curious if it is something we've seen in practice ;)

> 
> What prevents folio_pte_batch() from reading outside the page table?

Assuming such a scenario is possible, to prevent any chance of an
out-of-bounds read, how about this change:

diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..9aeae811a38b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1852,6 +1852,25 @@ static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	int max_nr = folio_nr_pages(folio);
 	pte_t pte = ptep_get(ptep);
+	unsigned long end_addr;
+
+	/*
+	 * To batch unmap, the entire folio's PTEs must be contiguous
+	 * and mapped within the same PTE page table, which corresponds to
+	 * a single PMD entry. Before calling folio_pte_batch(), which does
+	 * not perform boundary checks itself, we must verify that the
+	 * address range covered by the folio does not cross a PMD boundary.
+	 */
+	end_addr = addr + (max_nr * PAGE_SIZE) - 1;
+
+	/*
+	 * A fast way to check for a PMD boundary cross is to align both
+	 * the start and end addresses to the PMD boundary and see if they
+	 * are different. If they are, the range spans across at least two
+	 * different PMD-managed regions.
+	 */
+	if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
+		return false;
 
 	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
 		return false;
--
Thanks,
Lance
