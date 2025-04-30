Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C2522A4DA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053567; cv=none; b=lcNn1yDHYloTibqJACHKd5iionyo+ZQoP+pWQCle2W0Nw4O8Mj0a350ZtLpfI950OJS0+vfWefSSGQeyymsaruH6DIUKPg44gag4kb0mD3DyzsizHNu2q+A8jjPGsCJJYPeJFmyICDKSXEhCVLKGoW6vw9z3Ltwk3YtY9R06fzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053567; c=relaxed/simple;
	bh=9fU1rtCDfsVqZXi5FSilsw1eDf7t0GGmJ7NnZka2gTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SzaSQgAA1LlT8iSRaAY5sgjKYYOGUE6/DVBlFv6Skl+jOpWCXVt1386+VROY78X4KwQPuBl4BiJ9WXC6oI5oBOoYa2Gt1vFDU10A90LGu75kGw75VIfu6qdERJqUJA9ITUyKY+Qs4qES8CQeO1lboDUzRH+2JaOIoBBp0pm7pO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cmXgbfgP; arc=none smtp.client-ip=209.85.161.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cmXgbfgP"
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-6026be5e965so8083eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746053565; x=1746658365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WQ1ZXK7XatesI0CcgEIc6/EJN0etVspsXi6q9o6GnHQ=;
        b=cmXgbfgP/YKee+lXLMl7iwuGl56Vv9MeY46VG3DU7FDWVDfnSoNIUCGrqxoyVkfLDy
         1HSNmZ6gnAGsSjlOgnnOj/PkhRO7S+xinjyQ5W0H/Z5B1k6EE2k/XrcQBSi9kMNrDu/w
         XUCo7OJmnJgdxcNHiBhzkvjdhvIEowGlzo9nNUJkJwQ0ZLqQDMue7ShhU7tIT1LWMIbE
         0AtUStIx+b0fmA7zaf/0nSk211MkGkt1IF3mswKvN091pQFL0ei3vIq32KJ0R11ZbcYQ
         Fuy8h+28BBriFd6PBQ/g7nKlmyoSwOs06Y9TEFNsuBYJMrrEgOHq9yZp66oNuz0a3zht
         RKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053565; x=1746658365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQ1ZXK7XatesI0CcgEIc6/EJN0etVspsXi6q9o6GnHQ=;
        b=nIsBqdLJ4QBUU/yrHY1FcKFCXKcc0CbQ6+hhQeihtiKLHbwEKWBaaybFw6ZlQIlSB9
         Z8g3GBpPopYaeQO+RBNQix0MOv2jYNSsLZ0CZ4QXxP6GB5Q/8CThPfu1bfYOE+C0cfNR
         rcfipAPxwwhMgSq3k8eyRFqB8dLMwss+N//ibqkGvz+M6Jo4pXtoYSFZxJ3TI0TW4mgJ
         KrO8C246ak0WFakel3IIgnlNCk9f1OZUDZJ5MMOk5mtLukFchwQkv2tp7QgBTIz+mwc2
         Qh0KJtntZZ3OknBbFHnN4VUOEZOE+5SoaBAbgvZDiiT8WjO30UDFcHX+4m1QRH6zJ9XQ
         w1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCU3o3Wo95/oWHgrDXSmiiOhT4De3MXcy+J0cz4YzopscvR7OP4CjxZyqQKJNWd/BLBv22Qpu6XCkwAJljw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuWkzijn4sroa2We0i4wfbq91vTbsyR0w3EidCsWdorE5htImx
	u9ZOnLknHsnoObWIfj0iPmdA+BNzoC8tYez6GDjRUMtRJmKUe2g/djMiTQldaYVtteKlvJZTMNg
	uPV88Qe5mfyF/kYOAjfaO+PMGkAlR9aa6s96+Yng/jI9uKI56
X-Gm-Gg: ASbGncsIQDK1ProQRKdUeZx9fFaetDpe43dIGi72EMr4/euAsM++GH7u8ZhrRBsK/P2
	NLsY97xsvWRvWUdNQ2elZUiJCfJLTOQO9VWViqWIJbfwflhoGqH3b+KPWBnU6/lzwii0MCFTCVe
	wWGhU+uMkcbZW4tJ8zSDXgIy3HA+LtxlWvlC2rQdcjALhqOtmzbQrk1VtWGy2QseUKVXSy8gVns
	N42Cx8qFAzuLdFK80Fz3LmLMoiqt3YwMoyFPdVnbSpqlMNIBZh7BpiLtE4io5TCPuWKPtFYeSnA
	+ep31ANS7VY2KjVHFPRChDwcKnBCMA==
X-Google-Smtp-Source: AGHT+IHZ2g+eTcTVTYrG1MAIf5e1XqBmlyvRecn0/BClSdShvHmVPo8kX6qxwPRQchH9u4jTLqE69oDVHD7u
X-Received: by 2002:a05:6871:a506:b0:29a:ec04:aa18 with SMTP id 586e51a60fabf-2da70c68dc2mr835625fac.5.1746053564977;
        Wed, 30 Apr 2025 15:52:44 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-2da6e0fb455sm115729fac.14.2025.04.30.15.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:52:44 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 8F47B34022D;
	Wed, 30 Apr 2025 16:52:44 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 8D7A6E41CC0; Wed, 30 Apr 2025 16:52:44 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 5/9] ublk: don't log uring_cmd cmd_op in ublk_dispatch_req()
Date: Wed, 30 Apr 2025 16:52:30 -0600
Message-ID: <20250430225234.2676781-6-csander@purestorage.com>
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

cmd_op is either UBLK_U_IO_FETCH_REQ, UBLK_U_IO_COMMIT_AND_FETCH_REQ,
or UBLK_U_IO_NEED_GET_DATA. Which one isn't particularly interesting
and is already recorded by the log line in __ublk_ch_uring_cmd().

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/block/ublk_drv.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index f4c1db2e7f54..dcde38b39a82 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1158,12 +1158,12 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 {
 	int tag = req->tag;
 	struct ublk_io *io = &ubq->ios[tag];
 	unsigned int mapped_bytes;
 
-	pr_devel("%s: complete: op %d, qid %d tag %d io_flags %x addr %llx\n",
-			__func__, io->cmd->cmd_op, ubq->q_id, req->tag, io->flags,
+	pr_devel("%s: complete: qid %d tag %d io_flags %x addr %llx\n",
+			__func__, ubq->q_id, req->tag, io->flags,
 			ublk_get_iod(ubq, req->tag)->addr);
 
 	/*
 	 * Task is exiting if either:
 	 *
@@ -1184,13 +1184,12 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 		 * so immediately pass UBLK_IO_RES_NEED_GET_DATA to ublksrv
 		 * and notify it.
 		 */
 		if (!(io->flags & UBLK_IO_FLAG_NEED_GET_DATA)) {
 			io->flags |= UBLK_IO_FLAG_NEED_GET_DATA;
-			pr_devel("%s: need get data. op %d, qid %d tag %d io_flags %x\n",
-					__func__, io->cmd->cmd_op, ubq->q_id,
-					req->tag, io->flags);
+			pr_devel("%s: need get data. qid %d tag %d io_flags %x\n",
+					__func__, ubq->q_id, req->tag, io->flags);
 			ublk_complete_io_cmd(io, UBLK_IO_RES_NEED_GET_DATA,
 					     issue_flags);
 			return;
 		}
 		/*
@@ -1199,12 +1198,12 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 		 * do the copy work.
 		 */
 		io->flags &= ~UBLK_IO_FLAG_NEED_GET_DATA;
 		/* update iod->addr because ublksrv may have passed a new io buffer */
 		ublk_get_iod(ubq, req->tag)->addr = io->addr;
-		pr_devel("%s: update iod->addr: op %d, qid %d tag %d io_flags %x addr %llx\n",
-				__func__, io->cmd->cmd_op, ubq->q_id, req->tag, io->flags,
+		pr_devel("%s: update iod->addr: qid %d tag %d io_flags %x addr %llx\n",
+				__func__, ubq->q_id, req->tag, io->flags,
 				ublk_get_iod(ubq, req->tag)->addr);
 	}
 
 	mapped_bytes = ublk_map_io(ubq, req, io);
 
-- 
2.45.2

