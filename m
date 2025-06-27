Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31C742AA6
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751005363; cv=none; b=rDQ7ohCTGr4VOCvJ9vk0lbboggXHuP27CqNQFsyEo6N8oyTQ0WofJ1hXDvacJ2DByHebdXoO99MTXLIHzcmnfqHaocEpKBqcDq/V9/YXHq4hHDEnpopjOQmEIWGlshT3q/Wud55RIRisxZ0EmKDNF616U2aHP45LJjVUhNDRGhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751005363; c=relaxed/simple;
	bh=XLbSCLwmOZ+ynozfav07s5mU9GWUSAyYTB0vg4t9Q54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHHYQANvS5UwLQd0vF0oWBphZJesjxhbU4DkLm2wjk2nBP94ixqQ9a42VaFeFFBCrfwTaQGj6jxH8MF2z3xsEyyWvXFXIo4NF4Yd8tdyMVNQBIOx8s1O/ibYVshsIfNy2UV8mZ7cIDbDsmBcEYkX+OBro1u+rTudmxp1UL2P8Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muU4uG9B; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muU4uG9B"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-748feca4a61so1161406b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005361; x=1751610161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJL93/WUy3VLLpG0Rd82iVgAz50hmnMPx17qiGzyaUE=;
        b=muU4uG9Bo8H7xgj6xuRS3l05gN/oRSA9ug0ggLLntG31H8I29bOPEgV50NWKGfkPsn
         DbDsSzfWVXFuRovLtIJLb9uxV8qA2M+zwd6XG2VoVRvrfSdEje5/n6xPhXXD2HHkSpeT
         rUD9xL2SXyb0xuzNO9MlB+WFfYH8LcYhccWw8gqsx8NopdE2YWr3HZhTIxUAfF9XC6j6
         0UMjgpTBXeNlvcpKN89JD1Od1RmGWZ/tcnGnwIfBxG14YBjqVKfrR6GoOEa/qaBaTBLQ
         Ex/JL+6y6ji8cKE6GfCaTc8FMJuKc7tiwdfx1YupUrKA3SHD6bNucmGsSPE0//EhgMVs
         uwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005361; x=1751610161;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJL93/WUy3VLLpG0Rd82iVgAz50hmnMPx17qiGzyaUE=;
        b=Jxh2G4vPhwXfedEuOAbTVG5NDVXpHBY+B746XyfYQagwf5AsEEPIVKgIowsNTsgO4J
         oAEPXSB0i/E7MiOvsjXFtpzQOI9Lp2zbj831KwK/K6fUhz4+ALAsogN9O0Z/2lDacH8/
         xAL+qnMvgCG1D7SbaRR1EvluwAfDkmEpbGkKHV28AqWX75DWbD/dIIVitoknswDE1KTv
         erOSRESfGOniBksVEm/CAzz5hc6vtU6IDlsPNgmlOZbZne28yXiw1nlGTMR3qSPQbmjZ
         ctvCBqsqidA2Zxv0/D1dS/bzUr7LMU1agFF0598eVY0v2+vIXtLKn8fp21gkwUN3/ecf
         fcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH8r6/N+7FSE27LRisf+Sci327pqOAH2CtFB3V4PqrZDlKRiqGH7eZsBZI4TUrSC4gK7IOa/cG3kx430w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYE1kfW7ECO6tMPsvlM0JL142kZn2Lrw9D1CESeqfkg1FxKdso
	o0r97psKOKKCBMxJ7SjWbdi14vzaUV1sPHh77FbNHHdft31RuZxBpuAl
X-Gm-Gg: ASbGncvdT2OzXdnGHyl5IU6Wdg49DvcEZxpRnWGfJSCLEzKPBffUPLMpPL33q5b4OeJ
	2oVkcQzuat4F+lhFq8KLgnPtPLluhvSowYdV6RkgM5ZRstmXK/baNGQB7Sn3o8bdumsOIV5UwYx
	qXyA+5CJMcb2/34UD9cgEquH/ghpoRjPksWBK8KGJpP8JneuoAwz8sqdDeGwNLXEUxDDXjpgpmG
	dcmttvIZEpPLWyiJyEFqteCrw72qw3bD6svhTdAtBzwnuLA4vYfZOI17ekCb6gWfZ90DRE05MNG
	cgDXeMiWW+MiSvjUQpNEB014XNJXKxYeYjLrDKY/VSaYTHFGl3dVN8FQYPEAP1LRLZe+t5EJjww
	O
X-Google-Smtp-Source: AGHT+IHwbnmMhgqSTH/wSgQ4pCztKSBvv9lZlzowf10chmClNGllYjs7kOfUTi6qNk2axoi9C1sdEQ==
X-Received: by 2002:a05:6a00:b8d:b0:742:3cc1:9485 with SMTP id d2e1a72fcca58-74af6fb9c61mr2758803b3a.12.1751005360817;
        Thu, 26 Jun 2025 23:22:40 -0700 (PDT)
Received: from KASONG-MC4 ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5409cb6sm1456212b3a.23.2025.06.26.23.22.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 23:22:40 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v3 0/7] mm/shmem, swap: bugfix and improvement of mTHP swap in
Date: Fri, 27 Jun 2025 14:20:13 +0800
Message-ID: <20250627062020.534-1-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

The current mTHP swapin path have some problems. It may potentially
hang, may cause redundant faults due to false positive swap cache lookup,
and it will involve at least 4 Xarray tree walks (get order, get order
again, confirm swap, insert folio). And for !CONFIG_TRANSPARENT_HUGEPAGE
builds, it will performs some mTHP related checks.

This series fixes all of the mentioned issues, and the code should be more
robust and prepared for the swap table series. Now tree walks is reduced
to twice (get order & confirm, insert folio) and added more sanity checks
and comments. !CONFIG_TRANSPARENT_HUGEPAGE build overhead is also
minimized, and comes with a sanity check now.

The performance is slightly better after this series, sequential swap in of
24G data from ZRAM, using transparent_hugepage_tmpfs=always (24 samples each):

Before:        11.17, Standard Deviation: 0.02
After patch 1: 10.89, Standard Deviation: 0.05
After patch 2: 10.84, Standard Deviation: 0.03
After patch 3: 10.91, Standard Deviation: 0.03
After patch 4: 10.86, Standard Deviation: 0.03
After patch 5: 10.07, Standard Deviation: 0.04
After patch 7: 10.09, Standard Deviation: 0.03

Each patch improves the performance by a little, which is about ~10%
faster in total.

Build kernel test showed very slightly improvement, testing with make -j24
with defconfig in a 256M memcg also using ZRAM as swap, and
transparent_hugepage_tmpfs=always (6 test runs):

Before:      system time avg: 3911.80s
After:       system time avg: 3863.76s

---

V2: https://lore.kernel.org/linux-mm/20250619175538.15799-1-ryncsn@gmail.com/
Updates:
- Split the clean up patch into 3 individual patches [ Baolin Wang ]
- Fix a code error in the first patch [ Baolin Wang ]
- I found there are some other remaining issue that can be fixed easily
  after the cleanups so includes these too: fix major fault counter, and
  clean up the goto labels.

V1: https://lore.kernel.org/linux-mm/20250617183503.10527-1-ryncsn@gmail.com/
Updates:
- Improve of funtion name and variable names, also commit message [ Kemeng Shi,
  Dev Jain ]
- Correct Fixes: tag [ Andrew Morton ]
- Collect Reviewed-by.

Two of the patches in this series comes from the swap table series [1],
and worth noting that the performance gain of this series is independent
to the swap table series, we'll see another bigger performance gain and
reduce of memory usage after the swap table series.

I found these issues while trying to split the shmem changes out of the
swap table series for easier reviewing, and found several more issues
while doing stress tests for performance comparision. Barry also mentioned
that CONFIG_TRANSPARENT_HUGEPAGE may have redundant checks [2] and I
managed to clean them up properly too.

No issue is found with a few days of stress testing.

Link: https://lore.kernel.org/linux-mm/20250514201729.48420-1-ryncsn@gmail.com/ [1]
Link: https://lore.kernel.org/linux-mm/CAMgjq7AsKFz7UN+seR5atznE_RBTDC9qjDmwN5saMe+KL3b1mQ@mail.gmail.com/ [2]

Kairui Song (7):
  mm/shmem, swap: improve cached mTHP handling and fix potential hung
  mm/shmem, swap: avoid redundant Xarray lookup during swapin
  mm/shmem, swap: tidy up THP swapin checks
  mm/shmem, swap: clean up swap entry splitting
  mm/shmem, swap: never use swap cache and readahead for
    SWP_SYNCHRONOUS_IO
  mm/shmem, swap: fix major fault counting
  mm/shmem, swap: avoid false positive swap cache lookup

 mm/shmem.c | 283 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 149 insertions(+), 134 deletions(-)

-- 
2.50.0

