Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B4C23C8DE
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744182433; cv=none; b=lxni+SR/beNl2aeeslJbrH3L61Sf0alb/BeTOEXjiBPUvc9imDG//jf/tsggKeDgoGATZq743EsyY//QcF5TT41eetOQnZVRw1JzeLc+wlkdHcWVPvQMXjPr4lQRnqZ73E73kOQa4xB4XIjl3ZMk/AesFwf4qybmBpW5HOPXoZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744182433; c=relaxed/simple;
	bh=ei/9/KPIdSi/8sqBc1Quyqif2E/oITd4xLpDd3awcdE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FzhUTUpqfuZFXHZAX/Tkx5kQuO6yEomThko8uKHSOA1nEpR0Gi+5WFByLVPhkd7aCnDXxGe+NHdi/3zrY5xHOgRNpMCLVkaHlH6Mtmfsgmb0k7ic44QaZcrf8Sx0apa1jl2hjQnWJK/rJjMhv+O0r/PUlInrs4Jw4di29+3iLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=G/tyqTE1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="G/tyqTE1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223f4c06e9fso4155305ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744182431; x=1744787231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGgz6xKguZo73gIegFHe3380kA1CkAroxTUvqvSKdkU=;
        b=G/tyqTE1uMfagZhtYMHzz2HR0mEv1o/H/UOBs3tAmSDHGoWoja0O6jFA2t3Th1ukjW
         r/DhkCK6GGfUVfd5Z51QEgfD6c6tD2QXE3fcKAskdK+sOKxF+fQPS5gI5LjXnAxAKbO3
         c0ZOXF++h96wykKYGTC6L98slxk6arMMSAuKMrKPGC9T2KE2BX7EONDm8YwVKyMPUJjG
         OCic1Nt8xyNe8k7O+NOctAddwCf0cs6hGyQ1xFGtPJffScex7a+vBCbN9AAcMik/QmLo
         a11dOQ9v0zbpsHIMGDwxWK97b36RTCDi9kg7Je/CPyV0SlYVRTckn8sSsSgTNS+Gjkyv
         Y+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744182431; x=1744787231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZGgz6xKguZo73gIegFHe3380kA1CkAroxTUvqvSKdkU=;
        b=H+vPXUOXCpUT0Wx9DSGax27nEGNInfqJ4WSsO095YhTTQeqnWVqvowOlonZF4WDKG6
         FGDmpPUlPHpDwQwOq1igS7AgasVNuZ2baUV4CscMq66nZA/eVSoYkC6xHyS/0aUM5dLK
         wiLRjJYqjJQRgpUOyWAP0RWxmqpys7s757thQ3L3Co14eRGqA3k1xndrv9t8oJuZf8x9
         pm84xCzQV96bmwh+/ZDppHaQOhK+SG603G3H4JFpxN6ZfHXvQnjeT0EPK45AHSCb2SF4
         xhLoOPUcKHHrBAR7HCY3q2+j4zD+K8LjVDCP/AySrUNSvoqjBbnbTrsDF5HWdedv9brd
         VsjA==
X-Forwarded-Encrypted: i=1; AJvYcCVoH1JDyQo9jdvTebfQpNy1gEpV1CJ/fwuzjvoaK5oAeN7QEgsyyK8uHH/5egqz04ROWOrBn9JtFk4vpzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeELZ3XZ/bj6kp3V3hMvDUUkj6SDpc18PF11RcloIG/qRWZtW5
	DiyEf7w5nTnMDuyZ2bfLvRDmk4/n1vWH5EqTsXiEJt/lbe1O1iq+Bn6WPF81ziE=
X-Gm-Gg: ASbGnctJMvEeMJ6zk4fZ3fIw7QIiz2dtW+m92T/2Pk4OT2lcvd2MhmjwDoXi4d/1U+Y
	RI7SdH7VYkwv+hViB96x4D8P7F/fiwL2zhajyDxRAUquix1Q/Ze5bqWYWpNAo8LTUH66HLSYBeZ
	pXOnHhCWSYb8ghnYWaGhww9pR+6JlEF5ArWZumZhU0RlnecHbdi5Dfa1jYI6pfhKw99v5nY60FN
	2yjluZQ44yzPW6YP2UXL6LW46T+/uOFDF+32Nw116e/jyrNTL46Xn5/wjbx66EhhVV2r3ANRZZt
	IuUtloQZ4WKpe8ll0DGLawNN5BT+k+C2V7K9OwOkkcd7Btq3SvGyE4BDT0s1mP6BhQ==
X-Google-Smtp-Source: AGHT+IHABMwtjqmmieKI3RgcYrIM7iJvexJ35Gwmv62BjCpUbJQAiujfgxfk+8VnN0ON/EEnhjbz0Q==
X-Received: by 2002:a17:902:ef12:b0:21f:53a5:19e0 with SMTP id d9443c01a7336-22ab5e28003mr95050925ad.12.1744182430953;
        Wed, 09 Apr 2025 00:07:10 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.13])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d44800sm565754b3a.37.2025.04.09.00.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:07:10 -0700 (PDT)
From: Zhongkun He <hezhongkun.hzk@bytedance.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	mhocko@suse.com,
	yosry.ahmed@linux.dev,
	muchun.song@linux.dev,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Zhongkun He <hezhongkun.hzk@bytedance.com>
Subject: [PATCH V3 3/3] mm: vmscan: add more comments about cache_trim_mode
Date: Wed,  9 Apr 2025 15:06:20 +0800
Message-Id: <6a27dbcfe0c3014261380baa111adf3a7aa15847.1744169302.git.hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
References: <cover.1744169302.git.hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add more comments for cache_trim_mode, and the annotations
provided by Johannes Weiner in [1].

[1]:
https://lore.kernel.org/all/20250314141833.GA1316033@cmpxchg.org/

Signed-off-by: Zhongkun He <hezhongkun.hzk@bytedance.com>
---
 mm/vmscan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 18a175752b57..ffa8a7a97c8f 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2530,7 +2530,8 @@ static void get_scan_count(struct lruvec *lruvec, struct scan_control *sc,
 
 	/*
 	 * If there is enough inactive page cache, we do not reclaim
-	 * anything from the anonymous working right now.
+	 * anything from the anonymous working right now to make sure
+         * a streaming file access pattern doesn't cause swapping.
 	 */
 	if (sc->cache_trim_mode) {
 		scan_balance = SCAN_FILE;
-- 
2.39.5

