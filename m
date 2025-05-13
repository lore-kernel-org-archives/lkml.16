Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAB91A83E8
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747147716; cv=none; b=nzL+Cl1UWKZA8Sh4sBvn/VHb2eFZPkx/UM7jx3n236CNiArgMya/5trK3W7fJ29VqZ15p7vA4wk3fIRCABJizRfHjK/FJ/jZOGnDHhu+YFQ+jydbR12Eq7SKLGvCEfIKsnHy1xpqPPB5f6D5Zmrt7TGfSchFow6+QhZPBtVlGCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747147716; c=relaxed/simple;
	bh=YT5xNS4r8xP8EivUfdR7P7lQuV3FIsANyZZmY8R7e5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qm171Gen4ClbSt66r+D6HVF7B5aX3qP8fqb2rKna/yLyR3ODhrWdL+xM4S5g+cSw1iLxZOKBxnoeiwJ2Pz5lDP/6Zs3Op4j807S3w39V7wFoQPBknd1W/Y8r89sEYw/wydccAzoX9Nb3yyjPS4PlmQ4VSP/tWpFThRzIjljYvQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=VyDMt458; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="VyDMt458"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so58168405e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1747147711; x=1747752511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbBexokf21nG+m5XXQimUxHbfdz/gKFEIaDFzU/LUE8=;
        b=VyDMt4586Kiam+CQ+nxINCkTZZ1y3j+vw4Uy31bqP0ddJeGzEj14o3K5OzY3q8F+gc
         0VJZksAzuBEJrm7As4lZmB9t27KnWoA6B0wLObYpSgW0C27MdRVqa/7mXsYcI98N8qeN
         advqiI+XyQ9Fmk7ClxhXC6d84uU9RY6RhiR5aMswaRRuwij6rT8k63OIucuV8njM1uGY
         rINgaTDDDglSkAH0x9sKCg0UhbZA9gGeKxNvY0gMrN75uzBeQXSrg2pFq1geTxtOr8NR
         aMlawg+WgfrREY6gOTc9b70Hfv9tMFJtgWkN76DtLvUA//aQE8okj04Se20dAMJ2GM8c
         LufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147711; x=1747752511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbBexokf21nG+m5XXQimUxHbfdz/gKFEIaDFzU/LUE8=;
        b=nwXFM9wgH3F6+Xi9Ssmnip9KK3laKreZAM2DXNi12bC5nQIjx+Y6DixYzqD8JxBAh1
         DsAJEjLfoPav8nd91sOMut3uM1U3qnTDedqal6P6Wt7UI3eQVSm06fiqvKgk8vsAdmkD
         MznfYIID59yN64iMUzqveU1BDtMEmoOwUDZNHgll1VxUcKj1zNJktlLrPAXsfDwh8XQl
         z02s6FqhlilzBPp0vMmJNh/Muxv/3If55r6DvcS/6UBYA93+o+YHUTvhNyfH0W+0PBoo
         YAUf3DAeHt6cg8T4KGX3P8zmwDZywLkoYJPyzBVHHBDTtVhQZGajiG+TlWYr94iDtAVj
         mOFA==
X-Forwarded-Encrypted: i=1; AJvYcCW/p3RyX8zCHNRBNSuusRAIusFODE7yUVFAmIV1qxfMFMnFcyDjFHlM0wwuBqlWsiYKwn8mSYCzo4GYKrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykt1WIkRmmK/y630wlHxaXm9jvhrTUpGjCjhjN3n1dxmKMOApC
	OPPCssb789t+IHhOWEX78s5E6I/YbIAAS6ki1O/BI2VPl15PHUQjVaOuwBWvwxM=
X-Gm-Gg: ASbGncsm2bvU3+eYS0L4BuQ0dpapbVnyZ2p76B2KB7zkyaNOPgS/yxIDOF48mAyu1Lr
	s4Zem+ygnErpPubvtzotk2skcrPimVl46e/chsxhmgkGqSwXmQkpC0hu2ft1tjbw20ZCZltLZFM
	wfWRAmBjvZU+FgYj71rLP9NOfNdWHuTxtndcWrQhvotTZpHi8UuLhvid+b/IgpcX8M5PvVrS4EV
	9fVYe69F2jryO7ECDpB3vNcTmX5XOjlhrEGte0hGTyeh2R/YnQUV3vkKA9z/XrhhUaWQdTTLSzy
	9oMJLlmbB9WNLEnw8Sjb+XQmpnLGty3QIdg8cJEN8azCGRcWC3XhQ8+p457IW9jzuUo/lRX7H0b
	0+GL8BA/bn+eti9WY1QtGD/ap7T4YUQ==
X-Google-Smtp-Source: AGHT+IFB3vwfvifBjKb4BRvj9BZyF3VmALZPU5U77ivyr56FeegCa9igR2q57C2VuHPX0hdhYeEJpg==
X-Received: by 2002:a05:600c:6612:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442e17571f9mr97496445e9.11.1747147710206;
        Tue, 13 May 2025 07:48:30 -0700 (PDT)
Received: from pop-os.. (178-116-3-140.access.telenet.be. [178.116.3.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm172837185e9.4.2025.05.13.07.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:48:29 -0700 (PDT)
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Subject: [PATCH] selftests: fix "memebers" typo in filesystems/mount-notify
Date: Tue, 13 May 2025 16:48:16 +0200
Message-ID: <20250513144816.72566-1-hendrik.hamerlinck@hammernet.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects a spelling mistake "memebers" instead of "members" in 
tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c 

Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
---
 .../selftests/filesystems/mount-notify/mount-notify_test.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
index 59a71f22fb11..af2b61224a61 100644
--- a/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
+++ b/tools/testing/selftests/filesystems/mount-notify/mount-notify_test.c
@@ -230,7 +230,7 @@ static void verify_mount_ids(struct __test_metadata *const _metadata,
 			}
 		}
 	}
-	// Check that all list1 memebers can be found in list2. Together with
+	// Check that all list1 members can be found in list2. Together with
 	// the above it means that the list1 and list2 represent the same sets.
 	for (i = 0; i < num; i++) {
 		for (j = 0; j < num; j++) {
-- 
2.43.0

