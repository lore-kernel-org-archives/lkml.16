Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9AF51C5A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976476; cv=none; b=Tl8kYUgqKkZZIG1P+cSam0pl6fdVLxyWe4/UmV7V3RADTPcWeWMbtzvfBTcFC47846GLD81nkCMtezU/XIjBx1KdXR3R5Luychbto63VvPRfa8WE+tlI6GgUK+oZfO7TuL0SNwfq/o9+xgXo8hUWaYlZCw3HEG0JJv2fanU+zoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976476; c=relaxed/simple;
	bh=T1nJCLcmWXLOe6y4Ii4bdG1cnEHziBxfcWmNxILh2TA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z00MqiKPUZVyGPhc5p+OvWBcR2gbHSo0uQTBAqWRvF+T0tWCDeEDDm5cddklviHR7dg7HlukjRlgoeXqxb9oJqhf84wSiJhobGMvd3MAORZqh4FI1eCPyqCBU8nmwGR/bv0/fqytbvs+Z0D1BXyG2i4G1J5ngZbetO6PGfodbJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=EDNGC76R; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="EDNGC76R"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-742cabe1825so465114b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1748976474; x=1749581274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wleOKjFHw+cNcX4TN+jBCmGoOfaK4yhpbI0lui86FvI=;
        b=EDNGC76ROYG8mb6RidcHTxSwVsFWN9RJoPQGZQ7mu+uNEO+69BVw/5g9qRPeTAIwu5
         E4D5HJk9bUe5bz3UN0RNxjwsIMVSXB6yckQVl4X0qTrKU0AOrI2Fo9nmxLszlvGqoRLD
         eBBOSwyAnW95vkrtUjnNSx8YmWNrLWFm5YhMt5BKw2AYgt4pfDxiW1FlxmWH0HA4wB95
         +2eHfFBxeLgLf2JeZzmbN9N2lEfjQSYsTTbajALdqFJF8WY6yxz6V8bjqKtcRRX0Ca6g
         8U7jL3eS4bI1De7oh4KwZ5oSWkCpp/sNjQrKALuIFcOOp1St9NK6Xm3WXM4u5jB+WvDf
         21bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976474; x=1749581274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wleOKjFHw+cNcX4TN+jBCmGoOfaK4yhpbI0lui86FvI=;
        b=qczFkom820XUUyJzAPjvqMO0+Dgsh+R+sjMYH09EOOX7Kf8Kn1ttCl9eqOWpSgENMO
         kZXx9sC/O0PHowTIYh6gXddRe4rTsJ1V+pfBPtd5LW/B697DVpOIy5K/wpkeSmZbx7pG
         sC5G5/mlsDCHLPDrLUldoslS+Qdk1xwKcatUq8gTjicHfVm+q0q0fYXDjbrAr9X8Dv0j
         SuDfHduNS/C7A+DR4P3UAOXhE8P76J0VNMlfFpdW1Xd8WtFS1TwOzIOdLRGBKRUpqGoq
         z/EeZF4UnCYUMl0aTwSn8ebk/hv6fdPuqGOfpux3IRIjAK4xaNQAXgw3qfZdq83O7Xzf
         8Vig==
X-Forwarded-Encrypted: i=1; AJvYcCWMehsVXC13G3gr6L6o/wdw3eIXQZucwJfav8ZSaZ9sH6Gp04g/SqIuYwhzISdHvZo8MR4ovmyNJKMXl7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxFxGV24DkBbNWfDVCiMN1bRI2/larHNWMIuTJoCA2oYXZRkuA
	AP7SiEgRUgp3x8eccr3YsjH+vNvc8WRKAIdjDWRAeOyb7g/iEEIdasdEHKW9mPypNML7miIdt1U
	JPl2i4i61tw0FHjIIzX+htU3p2OYgzvWQIquC
X-Gm-Gg: ASbGnctcJvbuPuzLkaxy0Hiu61iReugIhS9R6eH5UDq2K81aExYQaWt+t5w9b3KEKGb
	fqkhkXSOPg496bTJTNnmxd7Id1BInPhM10gppqGiJXKRKFGFv5mmz7Gr9NFlcu1JvBOh8P4thuH
	7u50l02REQi8JMTg56ar+5ar+sNv/WM28yuuQtWS3YF0BRybPVjhAcf3wmdsJV8KUoldlh8Z3Mm
	f3YD1D2qDCUqzwg1FRaKD2QEOqYU0PXSSCkg6ItxLUOZJvXs+2CCMVkH5QcVsqym0Ym1Fkc8Mpk
	o2A2Jg5R1Ggk9fIKhXsUo/lpbhSCEd9N7XdWCbF0/Let
X-Google-Smtp-Source: AGHT+IF9o/kLaE/7tSmOjOj70ylD0L4dQmAqwISZaTT54uQrF1uMJGXZ/22CdVWSxkBTXdol5aFUQ6VoHoKD
X-Received: by 2002:a05:6a00:1815:b0:736:4d90:f9c0 with SMTP id d2e1a72fcca58-7480b20132dmr118819b3a.1.1748976474360;
        Tue, 03 Jun 2025 11:47:54 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-747afe98193sm743791b3a.1.2025.06.03.11.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:47:54 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 7EAF834027F;
	Tue,  3 Jun 2025 12:47:53 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 7B4C8E41D2E; Tue,  3 Jun 2025 12:47:53 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] block: flip iter directions in blk_rq_integrity_map_user()
Date: Tue,  3 Jun 2025 12:47:51 -0600
Message-ID: <20250603184752.1185676-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

blk_rq_integrity_map_user() creates the ubuf iter with ITER_DEST for
write-direction operations and ITER_SOURCE for read-direction ones.
This is backwards; writes use the user buffer as a source for metadata
and reads use it as a destination. Switch to the rq_data_dir() helper,
which maps writes to ITER_SOURCE (WRITE) and reads to ITER_DEST(READ).

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Fixes: fe8f4ca7107e ("block: modify bio_integrity_map_user to accept iov_iter as argument")
---
 block/blk-integrity.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/block/blk-integrity.c b/block/blk-integrity.c
index a1678f0a9f81..e4e2567061f9 100644
--- a/block/blk-integrity.c
+++ b/block/blk-integrity.c
@@ -115,17 +115,12 @@ EXPORT_SYMBOL(blk_rq_map_integrity_sg);
 int blk_rq_integrity_map_user(struct request *rq, void __user *ubuf,
 			      ssize_t bytes)
 {
 	int ret;
 	struct iov_iter iter;
-	unsigned int direction;
 
-	if (op_is_write(req_op(rq)))
-		direction = ITER_DEST;
-	else
-		direction = ITER_SOURCE;
-	iov_iter_ubuf(&iter, direction, ubuf, bytes);
+	iov_iter_ubuf(&iter, rq_data_dir(rq), ubuf, bytes);
 	ret = bio_integrity_map_user(rq->bio, &iter);
 	if (ret)
 		return ret;
 
 	rq->nr_integrity_segments = blk_rq_count_integrity_sg(rq->q, rq->bio);
-- 
2.45.2

