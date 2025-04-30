Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB3122A813
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053570; cv=none; b=Wr5R4lBMpGU5RZ57VQ4dCRR7CYPktRsGWFW6b3eQA52oFIXGTeRuuFsiImXWxlga4DAxs5JelgnF/mekAEgE8Ke+ie5MUudZZWGx7DS8vle0ONtKYPqBqrzwv4s81ML9VEZ3+eFZSzeeDxGxQsOhzk9SAWQJSixi/Ne45nPasl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053570; c=relaxed/simple;
	bh=feVv8f7d0KgVnnhw1uFkQnOAw5OAMYzup6QnL1O24ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qr5Ap+DN1G0eXlOR/7S4YGYE4Th2HB4CvZBs+YIFhSU03nWooRfE8cWhW6Yv0ZiBQR+n1EkXm7zuRWduhQV1UGqgmwJ1NyjDkEOLVxcJ7Iahp9yE8shCSvgoW9tiFvscCpAdWb+WcgQXXrZZQrKFm6N0tQa0UXplraWOlpiGiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=L8gfYkoF; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="L8gfYkoF"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-6e8fa1f99a6so544276d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746053565; x=1746658365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kb0AiFPk4f9Yg8x1AOb62HbUM9uzpcieXEg0cQHgsk4=;
        b=L8gfYkoFGZ+FQVFn8J62bfM27dr7Su+Ia22XDJmwQ51/OHwMTRypiezTPPPwToh2au
         KZyC7C3uUrh/gGs58IRoT6krnxhmlh2bVFzcGABXZDrBQw2TNPvngF41kINpjKinuWiV
         fZy+d8NnGkKB2idTHtMhqDvynUney2o7pgA360QaJAYDmwl7EPOoz3WD4YuhAcL9E29Q
         wbEIcKLE19novtqRZ7WF/59OD830VoJiZku/wacWxh4Q++DzjtSEr99Ghu0ce5QBiHYZ
         y6p2AGh5iG0K0DTnjbRTTbo/4Ck+ucjkef9Y666raxA/ZYquirgi6eW4kSooW2tCWl4X
         Mvfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053565; x=1746658365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kb0AiFPk4f9Yg8x1AOb62HbUM9uzpcieXEg0cQHgsk4=;
        b=tRjYIGO2i9HjaoEvxbPKnbo8YzmDAVeXP8J5tz/V13+SK4RWPxL4uhxI6NgnetqWzE
         mb/3MtCI/y62IlAc5tUwmusHJkJ/97PIncBd3GtqLuNY9MFhMYw5qn3EQ2gRMAqhJYRd
         4hFH50CuUIhYHv7u7iZsGvaEoLddY3u630zh+Tn1mo3tDD92FzcBPUY3ul92xPvSrQLi
         4gE7rC6Ip8pRcS5OEcNjlASP+sA77XsLU+ZR7XPTM2U5wd3jA5/e78Ll6MAjrtBI6BcU
         5D+5IjY5O7hNugASaMe8yCx61rTNheEdoO8e85MXBlzm2O6PLyDDz11S07GLhqtHoget
         pxcw==
X-Forwarded-Encrypted: i=1; AJvYcCUYp2aeiz0MLxR/NqnoznUN7fMIYD+6GwX15wPSMTfRSSDSyPxeHzAHcEUPG9mi4LjVT3X0k+OPQda9VlY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSBxfcrSkQzsePJttn6wcB3cJNWW7mzgctqDmTL+0ghCFbGwQL
	/40F6GnkZSTVewGBc17fKGCNETT0p48qdiLB0p3qX8WJ0bWLrPbxsqkFdr4PyuYXff7t8/EgmZV
	o3nHzxjVJxDn9ddJf8vIZVh4zEXw1smAs1kYytltriRLx8UeK
X-Gm-Gg: ASbGncthlErVL6Xc1bVUOI9uH1en2gjSGpXfVaGk+TejD6qRkv3bggudJ03+I4jw55+
	qmkQ0ktk/UnHkzQcdPBU2dSZAdAFFyHBS4EI1Vm1lFjDbY8B/cXbMNyPGbOk0k5sqp4c6I+4zXt
	/f3qdvAXLgilvtRlMZAVC6epBfHIko1IYYHhAQgf/IQQW1jqK8uwytcvvlHo5DNrGMnb3tA1oJt
	7tLSJ5wb6ANkLKwzMcagU0EIcuKs/pSfJxDIrthqHVMbedI+bQxx0rEoiu98F035WLYHup1A8eh
	314DJQafwTgWsvGo4Me6atcxkQ2QDg==
X-Google-Smtp-Source: AGHT+IGj4pUNY527LNbrQYpNEH5IuUSjm8Ld9l2T6zD8Q/PzI+Wm7Jp3b1JOVJB4XF+D8vVf9wlO/OuBOs7f
X-Received: by 2002:a05:6214:400d:b0:6f4:c603:588c with SMTP id 6a1803df08f44-6f4ff5f60cfmr21770926d6.7.1746053565642;
        Wed, 30 Apr 2025 15:52:45 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f4fe82291bsm1233686d6.69.2025.04.30.15.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:52:45 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 06CE8340199;
	Wed, 30 Apr 2025 16:52:45 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 05136E41CC0; Wed, 30 Apr 2025 16:52:45 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 6/9] ublk: factor out ublk_start_io() helper
Date: Wed, 30 Apr 2025 16:52:31 -0600
Message-ID: <20250430225234.2676781-7-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250430225234.2676781-1-csander@purestorage.com>
References: <20250430225234.2676781-1-csander@purestorage.com>
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
 drivers/block/ublk_drv.c | 54 +++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index dcde38b39a82..b4c64779c4fd 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1150,17 +1150,45 @@ static inline void __ublk_abort_rq(struct ublk_queue *ubq,
 		blk_mq_requeue_request(rq, false);
 	else
 		blk_mq_end_request(rq, BLK_STS_IOERR);
 }
 
+static bool ublk_start_io(const struct ublk_queue *ubq, struct request *req,
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
+			return false;
+		}
+
+		ublk_get_iod(ubq, req->tag)->nr_sectors =
+			mapped_bytes >> 9;
+	}
+
+	ublk_init_req_ref(ubq, req);
+	return true;
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
 
@@ -1203,33 +1231,13 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
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
+	if (!ublk_start_io(ubq, req, io))
+		return;
 
-	ublk_init_req_ref(ubq, req);
 	ublk_complete_io_cmd(io, UBLK_IO_RES_OK, issue_flags);
 }
 
 static void ublk_cmd_tw_cb(struct io_uring_cmd *cmd,
 			   unsigned int issue_flags)
-- 
2.45.2

