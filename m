Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11C226CE5
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745729897; cv=none; b=XbrNwPl7BqBKZ5KAW8jc7xTJDe8e2fJfg8GhGqwcxsE/DSP3yk8TLgL/AdoC6MNjWjLDJO45c2vNLeBWIJQ/+xjASFJoFedwH3nTpfSoRpKxQ9RiTfVNi4hmMo5+X8G5K0vpeQNGX2HzgTYa00E43ISD4XhY1fXpPgpK9rU7kJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745729897; c=relaxed/simple;
	bh=NUn9SVb+MfY5dmkHh3fBVg0g26DzHRJ0u156ZDbCEB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ld/psgC1zDmVFsu1jfs2d5oIEC4idbcZd+Z3MdggL2wT5iv5rEe89TJ/+EwhMpDz1oDf8e1awmi6yxEKRclrrKremkuvVxIgCa3InLvUsjSaPkeh3+lTqdxP7NxnJ5il6amqHTsnEgThl3oIYrEB2Itzf+bnE8Os6KYGUEklzmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=KRvV6mWF; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="KRvV6mWF"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-6e8fa1f99a6so5495486d6.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745729894; x=1746334694; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+5Yd+HilBazEXqtS76hks4RkYeuhgaTEWRoHSLa00A=;
        b=KRvV6mWF/aMmDXo/Y0LPTVWAJnsPDoD4OZFAAUqEc/SJrjJPP7CQOkC9Ng1qObsgC1
         IwV9mOeoml7qcjUX5G3TpjSeN/SxbjgKA0bSuJDrUN/oIB7/7UTTspkjiZUUPJo/ee5M
         1pT1SB6bV3jDk5OTGPL81AETyS9BYIQ1z+NZuY+Bf5AR89qtcIiceS4kPQSPD8HUfTRq
         9nZ+WuYNgNNqoTfHtKzHWYrX4sC4LrXslscJ3dQ2/JyKdXgabA+xgYZNef9XKKNefvyN
         rOxx4e8ArxkRAMwZYBt916dqt959GBbcKpSVxp/SrZoOAM9hZReQIiIp+MkuZ0C6WA2b
         Qoew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745729894; x=1746334694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+5Yd+HilBazEXqtS76hks4RkYeuhgaTEWRoHSLa00A=;
        b=vMWQbBtBpljZeoLLhriUPI3VvmPx/10AHZ4mlp5Mvo0i60buNRggZRDMC/whFb7Byq
         Vp64OXpYreG5/3j5Pi+qxv019yrCVMQKNQr/qJr7lKwYZrzxzZObDJD9jYBaXnKKWgqT
         wFaqbEIAhwR/FJ4+IZsacApeHJI4H2MQwuuG09iwHw0aASs9RntiyoPRyX/fRGC4RGuD
         CUljkU+j9CdGGxV4pncfTR6o4h9BE4qz6PbMDoTk4Ac1saZMYzwZnGtzMqKOSqLL5Ss2
         g0BseZVhOE3dsBNiDarnNCZOpJOqItek/5WsR2gTxgHGMbB2+cpKaVr/NBBaSBDaEHMm
         nDxg==
X-Forwarded-Encrypted: i=1; AJvYcCXs7d7yIV7uBLmn0iyDj6aoIeoHzNeWQebd/ia26MPmRMJYiY0BtHHFE3Pjx05oSU8HXcGcicnVagh/2qM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6PtI+7mGouKPJIZkYQCdj0ZUj/XVhWCm5BFPI5jJnJqhuWHiN
	t5gsxb8R8Oou88vh8L+FviFCA5ZtLQr4ozt+l8zOBbHV4f9kglr6JivQfLNGr4q6s98fD3FlnIf
	PCH7I8NNyO931B5RwubC5eFcMfFmTU/Ne
X-Gm-Gg: ASbGncte+isXhnaOAI0PNtmDJmnmWs50lWmiV7Y2s9NLSa03bge+DANuUZj0qTnyDuY
	+9kRGFvteFtIEiYYmlYx2ZDZZswKvqPKLi0LQZe+xy5wDeXXK8xg+Bf3eyG8cqh31DJOu/gUcEp
	qdD1x3cMcMxYi6Udq/mHraVAhgw3+xwI9qmDMIKhMDZ7LccjvwJDE/LKZvdot60piKwDNI4fMm/
	FIBfYV2PAMdT+gW1AlaL0EBU4wB1FD5GFsWouga5Z6n0n/FUjYYpfqfRLWM+trIOUlNJGtympaz
	Ha9EJRVavG6mn8JX7ycuyB01k120RQuHG17PJyohwCul
X-Google-Smtp-Source: AGHT+IH0phaIAkFYXXMRFvPg6N27jqz6RX1/nP+p9VaX+8zHkdFDK5BtLmogDwAIYmOxVq8f5tI7lOYY1Vwq
X-Received: by 2002:a05:6214:2424:b0:6f2:af37:d877 with SMTP id 6a1803df08f44-6f4cb9d0096mr54637936d6.3.1745729894113;
        Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f4c092c65csm6106456d6.24.2025.04.26.21.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 7D9F434042F;
	Sat, 26 Apr 2025 22:58:13 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 7B8B8E40C3E; Sat, 26 Apr 2025 22:58:13 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 4/8] ublk: don't log uring_cmd cmd_op in ublk_dispatch_req()
Date: Sat, 26 Apr 2025 22:57:59 -0600
Message-ID: <20250427045803.772972-5-csander@purestorage.com>
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

cmd_op is either UBLK_U_IO_FETCH_REQ, UBLK_U_IO_COMMIT_AND_FETCH_REQ,
or UBLK_U_IO_NEED_GET_DATA. Which one isn't particularly interesting
is already recorded by the log line in __ublk_ch_uring_cmd().

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 4967a5d72029..01fc92051754 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1159,12 +1159,12 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
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
@@ -1185,13 +1185,12 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
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
@@ -1200,12 +1199,12 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
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

