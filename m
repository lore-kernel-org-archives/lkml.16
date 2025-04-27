Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0478224B0F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745729897; cv=none; b=mJBKlDkN0GBYUImtRKkQPnxM6k/SkUA9Mrp6fM/FQGLD2e3qPR80o7ppdu8k91HjyXnRgFPe6S+V8EI1M+nDdF+kIkpWQZ7X8hHx4ZQC3LEJ/Teh7uPA/1ADSfwlOgRdEymnSgZ24EByGeCnZzHLxZ4UyLYr0sHM4zpiJsPmvVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745729897; c=relaxed/simple;
	bh=fSrQ31TL4AzH+H4LIKFWmsSEyKGj0KbMd3Gx1whPjEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkB/VKM8ZY0EAiT/dU1SRT6iC2qw0wkkiJVyjX67H/vG4Hn3aneoGu9Nj60bhQL9+Y9HUvsDbjoNee7brVypmLmtoOGuAWvEYlyN5IlzP7wXRL3BzLbRvkFIW8+r6Av1oZmqYxx2jFme08uHs73eDixj880AnYXj3zYYQUcJo38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cveZO39r; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cveZO39r"
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-6ef5ae6e7ddso1482337b3.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745729894; x=1746334694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPoBc+TiZg4nB9SBpZLnvMYWJGBPtb5HEuBhiraNEis=;
        b=cveZO39rcoLAyct0uM0Vs83cdLZJjkuZaO9crTlD1Uyts8c1YuWMZ8ObNkGd6XtcLe
         R7BHUEp1csNTeVl5WC4YZf1ITpN1M19RNcMNM/E4rXP0gZODkHO4rQAxYQE6MzZYHxzM
         67Sc9ZgDll/ttl2ueHOj0bxzvB7kqIce/cNYhVHm8OU6XMXd4XeDUyztQC5UiqS3L78/
         QPYOSfmqKJEqbED2oRJahqiFJEInXEE1G0o1DuPhDFp7DR1ZAfX2AT5RmrUvvIP0iRkh
         2J1z4HFpRSX5NVyYWxalbLe9yIRXPn8ZrE8tS2kw9nOUrvHmZqOGV+0uPxh/uC9Z1fn2
         XESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745729894; x=1746334694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MPoBc+TiZg4nB9SBpZLnvMYWJGBPtb5HEuBhiraNEis=;
        b=th7iAb0t0pCpawFXZgM+inRErYLNxdAYuiuYGUOTXqc9T5NhtPLxP20L9//DslYCWP
         dikbXZYhOw0OZOtXZbXbY5LXPtcNlFUb/H9lKYcMH6Bskdi5yFh5aOquvyhe0wZVPdLf
         FSanndfZlnOh5ss/N0gfUoRF36scLoU2OIzj1iASAr99R2UqemNzLCaE8WP/9NEyWXjf
         RU+Drt3O/Ee1QXAR8Mk/oaZbJGUtQShCaYt9CfYKV6EOYfnJ4+1lT2JxSEw3vSVC6pt+
         OVC+K3mU6ZYU0u3dllFdqBgdk7Vh9mqsndk4nP6qe2SapKV+soFHWYYGslMD+Qpj0X1r
         lQFA==
X-Forwarded-Encrypted: i=1; AJvYcCX61DwG1sPxrSI9XVTuNmW5huDeV3fPTPCredXEGyKcY44olyS4crcnXs7/7EUFYOu2Z4XyLWp6EhpyrEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLkNZe6rZwSziQOJiJGAVQxuZoXFHKzaJBuVOOUZW9m4E1m+WD
	snRaORdOI89g3IjwM3O9OcJORzC+rSy0+9ufIgCVP6Gnu29rKvGU/rjVp9b1AquT64kHugCMzl6
	xz8K3yExJcOHpEZlEkD86BauQLW364ixN
X-Gm-Gg: ASbGncvmCRzLT+4G1W+E57SMwSts+w/GQwaCawjFF1sezBj2zf5qTNDtwjVekH2ORbw
	tm8gc7LX9+xMPUE1+GPaksQklnzNQjWqg4q/Xd5NNLY6+c4su9uXfwYrJow7DFLoPcEkTEJH2/N
	riIhTF16sgxOC6Y3t+JzXwQqxblGjc6yGf0yPNol/FTUmjsxqXWqAiMAHRQh2vhLkatMaRR4e3H
	Dvql4Z8uMVz+9QjGbJuoWiCs9wc9muVj7C3vuL/ejeqissAaKXFOrZfp5IGq8x6hMdGNP0/Y4yY
	bIKrEo7a67WXm3H4AvxGyE7vcgrKnWhHRaPoykpVqL8D
X-Google-Smtp-Source: AGHT+IHPx4oUP4OgdRQho0yiWF6/WSdZRd1uXdseJU2Ldj7lWavP3/uk4w2qTSfcD83l8uIyadV4gzE1i8+1
X-Received: by 2002:a05:690c:d90:b0:6f2:851e:7c82 with SMTP id 00721157ae682-70854225a19mr49563997b3.8.1745729894626;
        Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-708417e4bf4sm4174637b3.0.2025.04.26.21.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id CC8B534031E;
	Sat, 26 Apr 2025 22:58:13 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id CA77DE40C3E; Sat, 26 Apr 2025 22:58:13 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 5/8] ublk: factor out ublk_start_io() helper
Date: Sat, 26 Apr 2025 22:58:00 -0600
Message-ID: <20250427045803.772972-6-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250427045803.772972-1-csander@purestorage.com>
References: <20250427045803.772972-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for calling it from outside ublk_dispatch_req(), factor
out the code responsible for setting up an incoming ublk I/O request.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 53 ++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 01fc92051754..90a38a82f8cc 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1151,17 +1151,44 @@ static inline void __ublk_abort_rq(struct ublk_queue *ubq,
 		blk_mq_requeue_request(rq, false);
 	else
 		blk_mq_end_request(rq, BLK_STS_IOERR);
 }
 
+static void ublk_start_io(struct ublk_queue *ubq, struct request *req,
+			  struct ublk_io *io)
+{
+	unsigned mapped_bytes = ublk_map_io(ubq, req, io);
+
+	/* partially mapped, update io descriptor */
+	if (unlikely(mapped_bytes != blk_rq_bytes(req))) {
+		/*
+		 * Nothing mapped, retry until we succeed.
+		 *
+		 * We may never succeed in mapping any bytes here because
+		 * of OOM. TODO: reserve one buffer with single page pinned
+		 * for providing forward progress guarantee.
+		 */
+		if (unlikely(!mapped_bytes)) {
+			blk_mq_requeue_request(req, false);
+			blk_mq_delay_kick_requeue_list(req->q,
+					UBLK_REQUEUE_DELAY_MS);
+			return;
+		}
+
+		ublk_get_iod(ubq, req->tag)->nr_sectors =
+			mapped_bytes >> 9;
+	}
+
+	ublk_init_req_ref(ubq, req);
+}
+
 static void ublk_dispatch_req(struct ublk_queue *ubq,
 			      struct request *req,
 			      unsigned int issue_flags)
 {
 	int tag = req->tag;
 	struct ublk_io *io = &ubq->ios[tag];
-	unsigned int mapped_bytes;
 
 	pr_devel("%s: complete: qid %d tag %d io_flags %x addr %llx\n",
 			__func__, ubq->q_id, req->tag, io->flags,
 			ublk_get_iod(ubq, req->tag)->addr);
 
@@ -1204,33 +1231,11 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 		pr_devel("%s: update iod->addr: qid %d tag %d io_flags %x addr %llx\n",
 				__func__, ubq->q_id, req->tag, io->flags,
 				ublk_get_iod(ubq, req->tag)->addr);
 	}
 
-	mapped_bytes = ublk_map_io(ubq, req, io);
-
-	/* partially mapped, update io descriptor */
-	if (unlikely(mapped_bytes != blk_rq_bytes(req))) {
-		/*
-		 * Nothing mapped, retry until we succeed.
-		 *
-		 * We may never succeed in mapping any bytes here because
-		 * of OOM. TODO: reserve one buffer with single page pinned
-		 * for providing forward progress guarantee.
-		 */
-		if (unlikely(!mapped_bytes)) {
-			blk_mq_requeue_request(req, false);
-			blk_mq_delay_kick_requeue_list(req->q,
-					UBLK_REQUEUE_DELAY_MS);
-			return;
-		}
-
-		ublk_get_iod(ubq, req->tag)->nr_sectors =
-			mapped_bytes >> 9;
-	}
-
-	ublk_init_req_ref(ubq, req);
+	ublk_start_io(ubq, req, io);
 	ublk_complete_io_cmd(io, UBLK_IO_RES_OK, issue_flags);
 }
 
 static void ublk_cmd_tw_cb(struct io_uring_cmd *cmd,
 			   unsigned int issue_flags)
-- 
2.45.2

