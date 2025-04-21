Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6A256C97
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745226850; cv=none; b=Bayk0z3A8Zxpg0SMDVQ6jHgmucqhBq2t5Qb6W7qbN0yfdU/go6L3dQgb3JaDMKOfgORMbez9m13m01GjYLh2jl8cz4F/PUWNJf4A8/8frF67rbX9CLef/9MKIi1sFt+wdOWWLb3FH1q8BQ/e+GJgwV4Y9n1ZkcG1lzCTPXxwWew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745226850; c=relaxed/simple;
	bh=Yy9sZgdklGFmFaDuSPWUdtOoXvrQDwdmrdaX+WxA0nI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZuyiFUx/7APlNUKngulKvzzUt1JjdWEVnPpl00dxsIrRbzWWeJnbfSnK6uKiJV5VstoL3oliAxv0TDKDB/VbBcEf8Acm88sNQVR4V/RRBrXtPjAH+gIDdqXGKYSqFvU4Zw0ZOPPBusapRIhkUKFesaxL8O08TxmmZ5dFEQF/CiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WIRqwg3d; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WIRqwg3d"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736aaeed234so3085463b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1745226848; x=1745831648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AsJEbSZvZdA9M9xR3JLAkzpH6h6tuBABgV3Gz0g2ACA=;
        b=WIRqwg3dUFnM45O22HOC3DSegKLMaJTLRHw5oUrZ58Jlty4JvR2hiASxnHE1iplYiv
         AWALNNJu24TcPyzy1X6lFtg12EPOctp7a6YdL1DLHq1P6pHyj5gMHyg7kHdt2IQCjEAh
         jC0H02+fyxOeBxzrgm/W4FvrX105sN0GBepgs6rN8tsbwvzKvDiWhfCSQBH+NcK6u0sU
         IeToDjVPMwNc9sDXK6F6Bp9GqXDD0Fvz1mkcaR5zq+y+m9KehMvnKSXkdFAD/x/jFPNM
         mRwoFNz6Sbum1J3wvPdtpLVqZnl4TNC0q7Yj4z8IPgYY90d1cXvJWbmYpNhehPovoRcW
         dmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745226848; x=1745831648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AsJEbSZvZdA9M9xR3JLAkzpH6h6tuBABgV3Gz0g2ACA=;
        b=uxYlUGyBVjuRtpD2+2S5lzJGrLKsxJwFYLMVWC4bfYe/mrOH7NSnQkIEJlggkO5j1v
         Prx7Pl3qhzysAsGt67W7mom1qDv6yTsBQnDtt8e8tVh3r3W0dybdG/GcfCo/YGqn9r7S
         H+6zGJBAbsvhJt4q/qJ7dEqQyy4S5N1NtJyd332YdK8edcfoPHgf2NLvrIJZoRhFALzV
         N023H1zhNcmyaBDOqrkTpv4OrkH2N6IX640pQcbnBnmELlpECCzrubGPVL71qQT7abRa
         B40tFprcVXog2HFnELwdUJ+/0pP9a+wyH0TqfdycUnrmlxSGnMWAYX8PVNJG+3QhyR0P
         1l8g==
X-Forwarded-Encrypted: i=1; AJvYcCUyBlh1gUiGoI7UTZV9md7G1cvqI3Bi0aDMeY1X1ceP7EcpGSsmP9a/izpW9kvCLg/MUMtwhLOPehQZXtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWZ5sqzR+QaXT29LNqBQL7f8us72dYkNp9UDJRzycdIVPXoz5j
	YxgjkAydwTTSX0BUZQ4bpNwMNMZ8iLB8D+cdYyY4dFx2t/UdHmpGhXY2Vb+Qew4=
X-Gm-Gg: ASbGncuOTfxBG5m2jlNSNWAUaOTzdiKLynYIGT3I+QgFbYNWPvwlNwb0hWGHIR1//k9
	OdfMapjYx0KxjWNtkvUuAfXWuGOdlhX0wLmGukJyRsLcUSEqet0fYlrVV2Aa3eFmAlWySwCsOMr
	zv6uoOcPJPKmRfLZFm4PKFcUnSgYbx5IgVhDiJ6C9X/1r0wcaGNNeQTHvmdx97ZC41Zlh2vxOdJ
	5FTCH6JywkFj/3rgBmnJHFTi861X3wxiAcZPO1+fxlSUkbz2LlJx6vzs7QsQ/eZvqTdVT714Xih
	ydZnIDe+cYmKIftJy+b0qFg6Hg2U3u6ER1HXdv4tUwbqcjS1I2WAE/HSILr3GclBZUeLrcH54Fs
	e
X-Google-Smtp-Source: AGHT+IHueA1196GNLskkec36YuY6fc1vKwEyqs5bJkXUqE3Keaq4gAYLH3kEP+dsJDbTfxHzr5P94w==
X-Received: by 2002:a05:6a20:c6cb:b0:1f5:8da5:ffe9 with SMTP id adf61e73a8af0-203cbc55037mr16154792637.12.1745226847909;
        Mon, 21 Apr 2025 02:14:07 -0700 (PDT)
Received: from n37-069-081.byted.org ([115.190.40.15])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db157be12sm5246285a12.64.2025.04.21.02.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 02:14:07 -0700 (PDT)
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
Subject: [PATCH V4 2/4] mm: vmscan: add more comments about cache_trim_mode
Date: Mon, 21 Apr 2025 17:13:29 +0800
Message-Id: <4baad87ba637f1e6f666e9b99b3fdcb7ab39171b.1745225696.git.hezhongkun.hzk@bytedance.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
References: <cover.1745225696.git.hezhongkun.hzk@bytedance.com>
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
index ebe1407f6741..49eb2a4e490d 100644
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

