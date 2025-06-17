Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345E23AE84
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 18:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750185323; cv=none; b=OFgE5IvFq5XkfsjYzCBNAISwyIG859vUDVCXCXUanfd/vNwQJ2+Xb9eQwma6QKfamS8RvvBtGgMMyk8aAVCOldPWP+EhraiyyMBLClhEv3oABd43oiNM7OdjNH2k+3LTrz7c9qfaqarDDAqC6ubDxEfQBiAgU1MU3iIijSOQCXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750185323; c=relaxed/simple;
	bh=xoRUEZzV6ZQIcKoj181mxwlh5/Ju67llXZhsYplOOxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xrph8cofBPd55zVB6ZBLgarBZha4jjCW0CIpSveHy66BqzXTFPOF0mILPNjFZL6vi/4Ot+zteJ1BGuPG+MHttlwCQR0gWgxfk93flcqgxPNs1jJFl2xEAd8ppdJTNTTripISa1+FoKxvU6QeiKbZoa73Uc4brQSqhCqeESqT6pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8jMSRgH; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8jMSRgH"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235f9e87f78so63604935ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750185321; x=1750790121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7djLTOtEoUl9hyAVxr+uOJrVUsIiPRKfKPff6GsCZXY=;
        b=c8jMSRgHW+lJ/rOvSMMw36zOTlGk1TgNrCbxkknTRJydkti8EcES5EDUYSeNeG01o1
         5a6jfzLTHKxZaMdqeTarEJU5b1pWuRkUVsduuZc4RH4Zw8NqXct4LZUcLjLhkpTufRFs
         msDkKGcdhmy2cWejt9lK2IRWB0jPOAJoXEuDRzkYc1mNXe7Rmha51k76hi9qPPGsZ8+4
         XPPU+xBNFRSL49wlegKHERaldq2TM5hV0hoxAfulMOH6Qf9P68nt/G5d0ijXljqr300t
         tXmKmfEan20s8fLQL5l2PIHeSNLzndwAqddfc6p4sqa4w8uywl/yuxZFCkebOUvKgaTz
         Xa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750185321; x=1750790121;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7djLTOtEoUl9hyAVxr+uOJrVUsIiPRKfKPff6GsCZXY=;
        b=t0KCEVeSxyGtfzfawdLpR8CRpg7swrqEWNQJ31Q4xkWFfmOkjyqMylvS3GvV9k0l3i
         FflyBjlYd2Ed9I2XZqbRODHBEgiMuLVP6zDZowtO6fTBo5mTv1uqztShlwlrZlR8Euac
         DZuqiRrMkHUKtU5yFDNIq5SZSpMn6uK1kmf9T0QqQ86GxyPSjhhmGqqosfyfkFykiXyJ
         bgBO/nkfDBND69Zvd/KLN0vywFbEDg6oVuopDGpMvw6w1Gidu90d07Rxt/7keMy6B0H5
         tHPSAKYV5rVfX552EIf9k8rXGoW6garca6qohY5nAd1sHnhb6OMJunLgVV38ba5nB8lb
         cdfA==
X-Forwarded-Encrypted: i=1; AJvYcCUAdh9Nnb3DWJGXsqdKTKHMlmDBqVZ2Hn0RLEaqejWGRNIHFQm1azxLkzOIpk8uuXFaEUHUzNJfrl8Sa1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrCnXvttcwlqXEMuinTnYjk207bhKC5PvMhVQV8mnrbnSQnDCn
	F7Uw5UqFXvuMlzs0uyNOjOHJe9/Nx+ER9RJPhvc4BpFDtB6C4L4tCWIZn+p1B0ni8B4=
X-Gm-Gg: ASbGncttKPFV7clli2Mu4sS1vVGq7xy7pnPbvvf5mzMJh4sfnCV2T2St24BNHmlRYVs
	B9TjPcrNWyJ6+ppOvAMccNB4P121hmfg944e1fSQ/Y/wdLfUgeWBQ73sQvPqsh/dSBUX7J2WhCJ
	wqDsxh0VRt4X4sR4o2rOVMK5mo+OmZK+xbk1cvq3hdeWDVHfhnFkkRomKktTBpK17622gdpkUZT
	CpGqb0tQu2e49LSGu7yWWW1m7WLGDitKS9biqr9jyzXItj/hb6fELII81mlwTDrsudn38sisobI
	aD81mC2Y5wZSlxmvkWetrkKR/lsSdetvTWq2xtus9YSw98/nEiYX0K9V63lqw+rlDFgM8HVG2F3
	BR9ObaKZcqPpFPvnFXg==
X-Google-Smtp-Source: AGHT+IH/fhCnjvjyePjXry73lNt5hxWzhjJkG1DFqaSWhRwCDAVL4uXMyva6j3FGR4B0I7uhRFXz2A==
X-Received: by 2002:a17:902:f544:b0:235:a9b:21e0 with SMTP id d9443c01a7336-2366aef565amr226952075ad.0.1750185320716;
        Tue, 17 Jun 2025 11:35:20 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([106.37.123.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781c7sm83753715ad.128.2025.06.17.11.35.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 11:35:20 -0700 (PDT)
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
Subject: [PATCH 0/4] mm/shmem, swap: bugfix and improvement of mTHP swap in
Date: Wed, 18 Jun 2025 02:34:59 +0800
Message-ID: <20250617183503.10527-1-ryncsn@gmail.com>
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

The current mTHP swapin path have several problems. It may potentially
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
24G data from ZRAM, using transparent_hugepage_tmpfs=always (36 samples each):

Before:        avg: 11.23s, stddev: 0.06
After patch 1: avg: 10.92s, stddev: 0.05
After patch 2: avg: 10.93s, stddev: 0.15
After patch 3: avg: 10.07s, stddev: 0.09
After patch 4: avg: 10.09s, stddev: 0.08

Each patch improves the performance by a little, which is about ~10%
faster in total.

Build kernel test showed very slightly improvement, testing with make -j24
with defconfig in a 256M memcg also using ZRAM as swap, and
transparent_hugepage_tmpfs=always (6 samples each):

Before:        system time avg: 3945.25s
After patch 1: system time avg: 3903.21s
After patch 2: system time avg: 3914.76s
After patch 3: system time avg: 3907.41s
After patch 4: system time avg: 3876.24s

Slightly better than noise level given the number of samples.

---

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

Kairui Song (4):
  mm/shmem, swap: improve cached mTHP handling and fix potential hung
  mm/shmem, swap: avoid redundant Xarray lookup during swapin
  mm/shmem, swap: improve mthp swapin process
  mm/shmem, swap: avoid false positive swap cache lookup

 mm/shmem.c | 247 +++++++++++++++++++++++++++--------------------------
 1 file changed, 126 insertions(+), 121 deletions(-)

-- 
2.50.0

