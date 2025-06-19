Received: from mail-yb1-f227.google.com (mail-yb1-f227.google.com [209.85.219.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25ED17E0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343686; cv=none; b=PC7eTtrlw8M5w8HbmkDI8mWL6bW4a3CaCtEbT1QPuR0p/EUu/JeLj7bwn8aSW92uHYEsPS3A0bnC41ocnPj98jxho0f96n2IPulIsGTtJl/Jm2chBgQuLuzh5fyC4+qgpkRWDvnHKy+PJyHcgvAwZWepfp7EFs2njX8X6Jd95nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343686; c=relaxed/simple;
	bh=Gr39rdqrLsxp6lFbj8mgr6Hb47LbYzbNx2IISdyK5IA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QC7IZHkpXPd6Jb7W5jMfoSceXBG/V+QyvXiShlXH9yrn6t9Ym7QOtIrTHJyGzJaBB1cHIn10yyUQfKfZlD4Dwz+ENvfkD+UCG38VOqOTNbDBI8M9zv9K7CusRcPG37JYPfWDPLnCsBLLMTIaW56BmSVs9t9ve0sqMHglFuqDsUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=JYAmYu0l; arc=none smtp.client-ip=209.85.219.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="JYAmYu0l"
Received: by mail-yb1-f227.google.com with SMTP id 3f1490d57ef6-e81881bdd55so148076276.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1750343683; x=1750948483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+DUhAWHkst0c7X0/9eUUU0KjzIQKkZSCUQQd7zskFc=;
        b=JYAmYu0l59mn2+TONad2hnSOafQ+dmZ3B2yhH5Fp5P/lNzScofVPJYb7hxvRljt+Gk
         vbbAz6fLvb1nIXuiZex1T9eIFraTNjxl1iObJtNxR5ZysIfYZj7SUy9oTK5N3WO2zHR6
         PosNGz427nrewO7N3ghEFOmXc2e5Ld0YTi5F/nl22Ex2EkiYyDKj6Z1Oj1Ew9sqSVFVI
         0ur7lv+wrm3QvXPAmJ8j0WwL585Vw+P1NpcJkBesI3HcrqQ0FYTdd6TgWfPI6Nxd/MlU
         UTrsh6Em4OsmWq9M+PtaU8x9UMKwM3IpkSf/RTTwHHkH3TO354/H8oe3+pBuc8SJ1LPc
         MBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343683; x=1750948483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+DUhAWHkst0c7X0/9eUUU0KjzIQKkZSCUQQd7zskFc=;
        b=PAW6tPOoHtSPvbqLnn2llCkaDcib/Igv5YzT7rpPDnpkdi99mYZXGaWi+pqwnHxgVL
         Hf87e8uEGHhdPEHaVmecvY8LwL7UOzMi1GdiI0X9hRCc3bJqdJ326sitlsrm6r6mt1E3
         MwmpMlzeXrkicS7Um6JUbVEUzz4tIQ99AYtMeLk36PwaRXFRNg/va/BPHU5FxnD6XQ2E
         8Mk4vq1T3Qm+dfZIDzrutGEAIDtcu/JHbbWB0v6ennAz7ZuzvrMUi3cWKmqd0F+qSvH9
         I7YuDbpDE+NP41wSY56miC2yAeu6JQQ2dTJ2jDCvv0ZY0+OTj6glFrwkMWk4q6vBGuN7
         eXEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs33/Apj33e9T5W8u/R7hjo/Ibx0iwqqeNIaJX0W9KL+X1v8ktMYNlO61pGkqILNWbgWSQTIdlM7NSt8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFzoApJxfH69sU/RSDUXfzPaTQnd26JYAcZAax0fJNk24r2ZR
	EKI+L5wtviWI8ipGBJQ+mc0gt1qAMwKez2PUCCsKX5zRN64WyKGVe8sCCj/zCobWvT2H/4tVofm
	Kdlg5S0GgDcXK7qz/wZqJ74M/rfLvGKkGqghO
X-Gm-Gg: ASbGnctrJWriv46blPEnncZuYagukrSgcLGAZ/0G0XUS5UFpA+we+8ZCx06SnuTzUKI
	sSrg80HEdvOrvfep8cmCrm/dZ5H8U2J4FFSN6F2m6RKSxrDVRYHkaTg5l6CJDbXqxHuydXe9h0c
	TtbdL78GmCQuGXs8zVJwTlsI0efxGvkgyTQkZwtpVQ7ZTlvxO8nFKHkddWisl8APYfs5QUahsg9
	wMC3ELVC1WN1wxUfrAKtvwXt2cVmXLqdQD6uBKUaDV6gYmEsRw27Re+hena2v2RRblGhjDjEDRL
	5pRCsYW1ba6bK/TMpSO3p9gdAU0sNjbjax0VNvS8265R58W2/dikr/Q=
X-Google-Smtp-Source: AGHT+IFt6DSlakYJqe8fTMglwxYonTqU4ViPVwUFUnerbH/PRofhRZFUP0LbiTS2m5Lyqu0Zhh99vdkuPNJj
X-Received: by 2002:a05:690c:7485:b0:711:457a:401f with SMTP id 00721157ae682-712b520498cmr22328167b3.4.1750343683581;
        Thu, 19 Jun 2025 07:34:43 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-712b7b565a5sm528877b3.50.2025.06.19.07.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:34:43 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id EB796340278;
	Thu, 19 Jun 2025 08:34:42 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 8E20EE44094; Thu, 19 Jun 2025 08:34:42 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] io_uring/rsrc: skip atomic refcount for uncloned buffers
Date: Thu, 19 Jun 2025 08:34:34 -0600
Message-ID: <20250619143435.3474028-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

io_buffer_unmap() performs an atomic decrement of the io_mapped_ubuf's
reference count in case it has been cloned into another io_ring_ctx's
registered buffer table. This is an expensive operation and unnecessary
in the common case that the io_mapped_ubuf is only registered once.
Load the reference count first and check whether it's 1. In that case,
skip the atomic decrement and immediately free the io_mapped_ubuf.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 io_uring/rsrc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/io_uring/rsrc.c b/io_uring/rsrc.c
index 94a9db030e0e..9a1f24a43035 100644
--- a/io_uring/rsrc.c
+++ b/io_uring/rsrc.c
@@ -133,12 +133,14 @@ static void io_free_imu(struct io_ring_ctx *ctx, struct io_mapped_ubuf *imu)
 		kvfree(imu);
 }
 
 static void io_buffer_unmap(struct io_ring_ctx *ctx, struct io_mapped_ubuf *imu)
 {
-	if (!refcount_dec_and_test(&imu->refs))
-		return;
+	if (unlikely(refcount_read(&imu->refs) > 1)) {
+		if (!refcount_dec_and_test(&imu->refs))
+			return;
+	}
 
 	if (imu->acct_pages)
 		io_unaccount_mem(ctx, imu->acct_pages);
 	imu->release(imu->priv);
 	io_free_imu(ctx, imu);
-- 
2.45.2

