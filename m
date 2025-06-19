Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B334119D8BE
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 17:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750355748; cv=none; b=d9dQqZ9bNIItMr6qw8RzZ8Yfo+Ng2cuAQdaoIEhzvYhM6qIzmrgjNTIo7sD945MgE+YHFluoFGYRD3AbY4cpeLP7VteQaAVOrTaAMpn/ovQF1TmMj0BYfw4hXz1kCyK+0yzrVAzRV3dHe7nuhkogNkxHTm3Vbw9AvG36IEQAIdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750355748; c=relaxed/simple;
	bh=ho1lq4B6I8zWFnIUTx/N0/1+aoeWM5vh1pkTyikAUJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=olR1RMXBCLMJrma/XAOPaPkTuNOuyaKE5U/WbFVSZAyoDUhRYlohFksSiTO/1Vw/jF/E7PVGapAszx4iFK9NAW1a8FINcyMBgWTuzsIdlsHtXCH96CNMP70M/RVnWFnte7uCROd+5YtLk3Hoq2pVRbRIiz2Pji3REDAxydE/n5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boIRf6pJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boIRf6pJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22c33677183so9255165ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 10:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750355746; x=1750960546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFPkl141gY0e+eTLDBsaY8gxEuG35+5FTBscLDZNXqs=;
        b=boIRf6pJQIveGLjlhCgUJstUZEez63g/HzI1rncHBSX29cnzSPV6+FaY7myK+Ir59Z
         JWbqgfeC/65BE8C6PI/FeafpphU+YYTRvhvyEgNjZAoz6pMV7e8th3HdC7YX4i8NwQCr
         Xvbj4jPKMvch6F12J0BHo3yH4xAK7CfH0PY4RqFUFVnAgtB61cDD2Vd7Vg5Ov4lIBckv
         TX0LWC0oSYWoGS1/lWtAMcCMACRVfj4BfcK/4PsSn8oyQghyliGzLxzvipXbHE955eW2
         bL1FuZt7BvMKMhwn/T4ldUhDdsj0tiw5rZSt/ui+MRFlfxIIJI3FdYs3TcZXJAQGLlNy
         mItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750355746; x=1750960546;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFPkl141gY0e+eTLDBsaY8gxEuG35+5FTBscLDZNXqs=;
        b=ayuxIz4NuOiyW2RVxTDSrYzCRjUFsZy4/nnBeLBw/Li/VJDix/sFQPJVXb97wROOZ5
         Y2NTqFglVovwQLG4Yo9IFutALOQp030/mZ3vlDpxk9LnIQ8NZp329QptxpkS8g0uQ6gh
         azzzv7kt+uamQ8m6lNdY/dmm2OwM9f+bjKuaO7u7JQXMKMG8Vka27XuV2xGcHd/vNpgO
         PEI8AoXO/Yt+BMG4m0RqqKScVBvXdkY6gzVtuikcejMeBpk0INxpxeA0z9rzEzsLhtkl
         gS80YFlhd5vhFIGiOj6zpcH9DjAyALamxIv2K3BuQfARpCnG+TB69ol4iWACSvVTYiUv
         FXNw==
X-Forwarded-Encrypted: i=1; AJvYcCUxmygIlQmrmrY/IHaREl16nxaYzB9cHvFHDEJbDFq8a/pcbcCMqsGQ7IF71URqyemHfmEE/mXQKLzBwV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZhwW6cWX4i55ISBPKGvZ/FLY0Bt9vRtogx/TEjf43okEcUvUX
	NK+ncp4T/7M6bQEw/35GMEMFF9gxkI6ltjA8igQaEQeFLTrKigQRxa4DWlYlkOQnXxg=
X-Gm-Gg: ASbGncvtaWU9SyTQxC9zwvWn+DTOVr6+BbddUs/4lhKBB5ca/CV/ExtBxDm+DKgEXSj
	8K1PafuIHkRS63g8jS8WHqRlXcAD7ZNVcB+l11Lv1FFLvyfSgCask7vcSQjcZX49bQ+KwgyNf5L
	O8b9xdBSshbiS83boJUj871p2nzPHg3PRgq1Lbdb6Varg8jRrPbk6ztHNErO9vg0IRg4iy0TMKc
	lpIg7nbW676EzXLPw8TQX6IsVKDEGyWPNuRIFieZVlTr7YLT35DgpQypfSyJFuMNkkoLR7zkk+E
	xIrDUZnkoP9hj/XGVfpXfWHy23KJDLfI+NWYlwDT67ZFCSdLdH8ojARp3KI5y5P8b+DbuTJx16b
	f/A3fPOY=
X-Google-Smtp-Source: AGHT+IHZG2DsQE7KI7a0qG8bvIP1lFFEqaDMNKiSef79DOmEDLMlC2VDLDNE2Aj/g+ItUbW6KkURsw==
X-Received: by 2002:a17:903:19cc:b0:234:ef42:5d75 with SMTP id d9443c01a7336-2366b00ee6bmr315670375ad.20.1750355745820;
        Thu, 19 Jun 2025 10:55:45 -0700 (PDT)
Received: from KASONG-MC4.tencent.com ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83efa44sm255215ad.77.2025.06.19.10.55.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 10:55:45 -0700 (PDT)
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
Subject: [PATCH v2 0/4] mm/shmem, swap: bugfix and improvement of mTHP swap in
Date: Fri, 20 Jun 2025 01:55:34 +0800
Message-ID: <20250619175538.15799-1-ryncsn@gmail.com>
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

V1: https://lore.kernel.org/linux-mm/20250617183503.10527-1-ryncsn@gmail.com/
Updates:
- Improve of funtion name and variable names, also commit message [ Kemeng Shi,
  Dev Jain ]
- Correct Fixes: tag [ Andrew Morton ]
- Collect Reviewed-by.

Two of the patches in this series comes from the swap table series [1],
and worth noting that the performance gain of this series is independent
to the swap table series, we'll see another bigger performance gain and
reduce of memory usage with the swap table series.

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

