Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C81EF38C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653081; cv=none; b=eLLdzOiQCP8R4ZFXXDAlvWnXi/N8WSNDh3+v1KKZc/3UUSsOb4cOm+NiyZseW20ayUTPEsx+eECtTfBXPEk0f5jErD1U/6MItwubOsEPIdvX1gBV3cu4WzjK0jXc8DnMvYMkRbQIQgQhZ1TrCICA/nfvEbRW1FpPh4OwhH3nj4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653081; c=relaxed/simple;
	bh=nPhNVoV6+80LSeMROMisZWqk/CFBUupRJ0n6PMLQ7/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MFDHQOG49J0PL2qVMIPfRBn6koj/lERX61Z64dPVsR9Ypn/cqhNTKpLTuB/Mt56PnGOZhE652ub/xracsqA8YsyZfXP6zUMK3mNFpXCYl931wHM2FFdrK/FpFH9i+GDBbqRn3SgpHXDHb51OWwyrWmNoKddxHdqMr4BUDgCU4UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hr1NaeVR; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr1NaeVR"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d5d0ea6c8dso86445085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653078; x=1752257878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19gtuz8pyibEGno6XM6sOP9Gh4Tb0Vhhx5W2BjE5J9g=;
        b=Hr1NaeVRpTuikIbowZjmyY8z/hyz7LtlhgmZOxysugjFxb0CyTH8nL/YLMfOXTHqgO
         10hfe+LBxV/PpXUhvW2aa5OYF6xjVCvAF8WknFROELZzDXRMK5szx1ZDnDalk3O71jtB
         rwoRUjSulGVWrxww/jvtu55uTQzJS+j6WXxPydeOeckjXupZyF2t2Z2m1Woax/8IDFQ6
         nuKTiLlpEmPzrkpvprZSnWzqETURYWDQhjHwnqpnHbnRiFJgCULl3x0CVH/kCYWfWwU6
         MjUoId1i84wWHuK7YA758C2wA3E0H8857HVApw46YKp7sjzCiB5szof59sZ1fo/mntXB
         Zsmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653078; x=1752257878;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19gtuz8pyibEGno6XM6sOP9Gh4Tb0Vhhx5W2BjE5J9g=;
        b=on7vsCvngnIIYHYWV7UXWs1zb9P27hMK1vhW6mfmLcBafDldLL0aaRZvc6+malyA6b
         xcl1NQRZjgbbEfg/hx6YxYXKodp2RBl0+eSo93v1XRqEYiTxxu7ZG3Z6Baoy5SzI9BZe
         3xqZYenMvitxpaFN3iKAst45Iml9CeKmfj9GBDGPxtZkkTUBw/amzpglCfNSOVH7kvYR
         zWa2L9JFy+l/GyNQVPFZtosfX9REjnVKactToZGIgTEZS9aIrMc1R9SLFcUqMnTeHJQe
         gXFnmbh+2GdaeRWEhHfkhtb/rgZMk/6MCZ/zkzUsbNhBvIF3pmdjAmICCs1l/hxhczHI
         QF5A==
X-Forwarded-Encrypted: i=1; AJvYcCURIuW+Ulau4blbRlxv4QEbhHSzT7B63HSszStZSROsohKRxPkKDSyjeN90hUIpclFH6EBxRDpNx9JpAMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAsFZdV56DKsq2BJoLbdiPH9dhxMtdpEtiNV4E30aGjf7xI012
	2kMsukd144leM+XSW/J33BzXDfRV+c2khUGFOdRrY5PyVxwptvejGcaL
X-Gm-Gg: ASbGnctzTV74djMP8sVAzW6PfRYQNKVVostMl8MXASoiwD/Mxkn3+Ub4+rNWS7E0ktU
	6vUtIz436FX3DhMCLosbv4ykSDEHT5BT6qFIZTPBh3JOnKrFrKXGKpWP6NnXd5GIsd94HiJIRRm
	1dBKkOF8z3jzSlfO01fIAEC70zELHNgtJIwe5cygoa2mxIRTkWQ4HCowdYrnG40mzSbJ9SVWCaZ
	/pRt2frBU7DUuRV71JJFdEkN8hmoRXifG5nHFu4T4T7rMQlZjKXIQDm3ql6ZiF/0IWy1tXHg1+D
	mjYp+j6BxmS/xmXE2FhgkmoIwQKZdj0tooiYhabiyqKuRW4YGRxPzxA0wjw92eGvkbuRgAWu+T7
	htg==
X-Google-Smtp-Source: AGHT+IETRsUHYAYc8lzzi3bO80ku17RkglPp6be9hVQZnrswNO8fKXEdte/rmYzGhfcYJimIPz8Pzg==
X-Received: by 2002:a05:620a:708e:b0:7d3:c68e:fcf6 with SMTP id af79cd13be357-7d5df10927emr412754585a.9.1751653077920;
        Fri, 04 Jul 2025 11:17:57 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm183300585a.59.2025.07.04.11.17.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 11:17:57 -0700 (PDT)
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
Subject: [PATCH v4 0/9] mm/shmem, swap: bugfix and improvement of mTHP swap-in
Date: Sat,  5 Jul 2025 02:17:39 +0800
Message-ID: <20250704181748.63181-1-ryncsn@gmail.com>
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
to twice (get order & confirm, insert folio), !CONFIG_TRANSPARENT_HUGEPAGE
build overhead is also minimized, and comes with a sanity check now.

The performance is slightly better after this series, sequential swap in of
24G data from ZRAM, using transparent_hugepage_tmpfs=always (24 samples each):

Before:        11.02,  stddev: 0.06
After patch 1: 10.74,  stddev: 0.03
After patch 2: 10.72,  stddev: 0.01
After patch 3: 10.73,  stddev: 0.04
After patch 4: 10.72,  stddev: 0.02
After patch 5: 10.74,  stddev: 0.01
After patch 6: 10.13,  stddev: 0.09
After patch 7: 9.95,   stddev: 0.02
After patch 8: 9.88,   stddev: 0.04

Each patch improves the performance by a little, which is about ~10%
faster in total.

Build kernel test showed very slightly improvement, testing with make -j24
with defconfig in a 256M memcg also using ZRAM as swap, and
transparent_hugepage_tmpfs=always (6 test runs):

Before:      system time avg: 3911.80s
After:       system time avg: 3863.76s

--

V3: https://lore.kernel.org/linux-mm/20250627062020.534-1-ryncsn@gmail.com/
Updates:
- Split and reorganize a few intermediate patches [ Baolin Wang ]
- Fix a duplicated fault issue that may occur in one intermediate patch
  [ Baolin Wang ]
- Improve variable naming [ Baolin Wang ]
- Fix a wrong error value problem, return proper error value when
  swapin failed.
- No major code change from V3.

V2: https://lore.kernel.org/linux-mm/20250619175538.15799-1-ryncsn@gmail.com/
Updates:
- Split the clean up patch into 3 individual patches [ Baolin Wang ]
- Fix a code error in the first patch [ Baolin Wang ]
- I found there are some other remaining issue that can be fixed after
  the clean up so includes these too: fix major fault counter, and clean
  up the goto labels.

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
Kairui Song (9):
  mm/shmem, swap: improve cached mTHP handling and fix potential hung
  mm/shmem, swap: avoid redundant Xarray lookup during swapin
  mm/shmem, swap: tidy up THP swapin checks
  mm/shmem, swap: tidy up swap entry splitting
  mm/shmem, swap: avoid false positive swap cache lookup
  mm/shmem, swap: never use swap cache and readahead for
    SWP_SYNCHRONOUS_IO
  mm/shmem, swap: simplify swapin path and result handling
  mm/shmem, swap: simplify swap entry and index calculation of large
    swapin
  mm/shmem, swap: fix major fault counting

 mm/shmem.c | 273 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 147 insertions(+), 126 deletions(-)

-- 
2.50.0

