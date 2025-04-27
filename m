Received: from mail-qv1-f100.google.com (mail-qv1-f100.google.com [209.85.219.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943222687B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745729898; cv=none; b=p11SqWMBLO3wBv0puQZcuHXnN0C1uyE8lDgUgWeSPGC+6oHaxUJnjUkbzqXaQBqUu3eL5yZ6NA+jtd9qek/xJTIGZGsAfFSPRGpE4+PW5GTfWdVtvf0DQTDOY8Gq0AvhhoJuPEk2+klIIFNcMePfZcQIrRBqm9KvSE4j8yWPt7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745729898; c=relaxed/simple;
	bh=7L5+zOpF8ahe7cs/hC3e96qjy87KxJTWWpkYIDExmZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OPs6m6llcvZsqS0kBwF1A0rkVdsX3vSrpGqAVirH7uxfANtUfEnFX5QtRpPe7Sz2zn395FyabcDt93n1Wt+yrIiY0VKQXm4PgLPdiCKYk7Mj2aptVauxGx3ar3DQ7lTVqHTbXF5HgtK6JAWcXdMk10vlwhofBqxuGad6i7Nfh/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Q+19wonE; arc=none smtp.client-ip=209.85.219.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Q+19wonE"
Received: by mail-qv1-f100.google.com with SMTP id 6a1803df08f44-6eeceb05894so7669936d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745729895; x=1746334695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihW8bbWdzMKn2j2SpPS0FZj6fcM4rGVPgEUGPjWkNzs=;
        b=Q+19wonEfzStnXKykeU1kjFr5Rrzbb3p0eyAsdCPmizls1oQoVjMwlIisqp0JQ7wQl
         naGMgtxxx//vdrD/2lMBXLRA/sjD38Zo7qvjn+YPOBQiYBl5/eTIlhjiEVZzS3rxwXn1
         pzhyiXMumM9DJ1Tv26BDC1v8Zqw3H9LbfVMk7CTME/HjG8r+smrJFJa1t+nI++fGI2zk
         57xpqnELN9j05Uw2SIaKzyKkGzpdfV4Bsw9lGTnu+of4dPjQqG2wlTPg1ZLw97yTaezg
         PBC2Z6VqJQoGiX5t2CBMlZ06GogT7y1mRC4fUD9tJ96TtS7x81GQlww7K6k6i267j7xA
         1h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745729895; x=1746334695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihW8bbWdzMKn2j2SpPS0FZj6fcM4rGVPgEUGPjWkNzs=;
        b=CsLxQoKMf+f3W5gV5nfwKSa0wJ+rMHIeYcTmU5wzYJTZRYYNHiGMH7go8sON58Xmhu
         0Oa6SEyyi2yV8+M3B0Jxp4uIIMF5aLA+mm4l+tDo5EuIYHMCuRly97UE4Kdboy/dVWZ8
         y6OdhBN51dCV3/fyUu3rxa6a+1cUS40pALTXVhNCmP7KxyFOMv2XEpVFCSO3BST6ccrK
         7ah5Vgh++XlKGAbyiadj3lo+Vay8EYS6Ff4CJZACQv2K46TXfadpEHF1etIv/9vzsHvi
         nRTHp4cBkHnPJTPG0n1wRkrI0X9N0iz2B5cjBIodFR7brisxSAMQJy2Gk0DbfeuMUG/E
         Z0rQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1i+kjumLUfEC4zR8v8lGAf0YybGwThKdC8WQK1TEKJtKY/icHfulrddxiQFGRMuIWVqTHlGhsfKAbDX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YygYcMozdGVSqWQt0NINqti7Qf2E6wKvcjnyOdQSSgIZgCBgZ+i
	na98o/g0QmtH2EevgVXCnrd3eK+ui3va8QGxKYE3cXAooSV0c+uuIRwqTg/09yROK06oWGcixN1
	9CV3fQ+Z1jMgLsJb8zW0cZOt3oFuQMN81
X-Gm-Gg: ASbGnctIN63EvUPM2s1JxAbZ7H1nVO5toRgECFCN+bzmcRe6i0Y6DqKiV9NiZTt6bUc
	70crI2yw0WkbkkjxNfnSaGPAmVAi9p5bgz0zXeLE8kUhu9ReuuXT+9f+1Xy22/+ilagPgPzMxaS
	xTSoqglVh8i6poesuanZKAB2hpHIIMknaZ4V847iOP7hTFVLeHXefpfcgF7KQ8uOtrBiDq3qodU
	tUhoC4wBp41khCQCmyPXqd2YVGzDzMJf9gVbk4+HeBbBrNOZcfD4I6SmMckAuXu6I9GsMvbJNc7
	sCv/rSCKfkK/uW5hEEvdGubSCmfc3OyttD5GMxrpd1wk
X-Google-Smtp-Source: AGHT+IEcHXZpNwQzJPScf/UiavXlm9oxOiVccKkhku6M+O9Mj2bwyHSSUuB0a+9hiBCymV60jlk0S7I8nWKA
X-Received: by 2002:a05:6214:27ec:b0:6d8:ae2c:5053 with SMTP id 6a1803df08f44-6f4cba5f634mr44134706d6.9.1745729894678;
        Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f4c0963980sm5971356d6.40.2025.04.26.21.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 21:58:14 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 1353C3404B9;
	Sat, 26 Apr 2025 22:58:14 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 11418E40C3E; Sat, 26 Apr 2025 22:58:14 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 6/8] ublk: don't call ublk_dispatch_req() for NEED_GET_DATA
Date: Sat, 26 Apr 2025 22:58:01 -0600
Message-ID: <20250427045803.772972-7-csander@purestorage.com>
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

ublk_dispatch_req() currently handles 3 different cases: incoming ublk
requests that don't need to wait for a data buffer, incoming requests
that do need to wait for a buffer, and resuming those requests once the
buffer is provided. But the call site that provides a data buffer
(UBLK_IO_NEED_GET_DATA) is separate from those for incoming requests.

So simplify the function by splitting the UBLK_IO_NEED_GET_DATA case
into its own function ublk_get_data(). This avoids several redundant
checks in the UBLK_IO_NEED_GET_DATA case, and streamlines the incoming
request cases.

Don't call ublk_fill_io_cmd() for UBLK_IO_NEED_GET_DATA, as it's no
longer necessary to set io->cmd or the UBLK_IO_FLAG_ACTIVE flag for
ublk_dispatch_req().

Since UBLK_IO_NEED_GET_DATA no longer relies on ublk_dispatch_req()
calling io_uring_cmd_done(), return the UBLK_IO_RES_OK status directly
from the ->uring_cmd() handler.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 49 ++++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 90a38a82f8cc..ea63cee1786e 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1210,29 +1210,16 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 		/*
 		 * We have not handled UBLK_IO_NEED_GET_DATA command yet,
 		 * so immediately pass UBLK_IO_RES_NEED_GET_DATA to ublksrv
 		 * and notify it.
 		 */
-		if (!(io->flags & UBLK_IO_FLAG_NEED_GET_DATA)) {
-			io->flags |= UBLK_IO_FLAG_NEED_GET_DATA;
-			pr_devel("%s: need get data. qid %d tag %d io_flags %x\n",
-					__func__, ubq->q_id, req->tag, io->flags);
-			ublk_complete_io_cmd(io, UBLK_IO_RES_NEED_GET_DATA,
-					     issue_flags);
-			return;
-		}
-		/*
-		 * We have handled UBLK_IO_NEED_GET_DATA command,
-		 * so clear UBLK_IO_FLAG_NEED_GET_DATA now and just
-		 * do the copy work.
-		 */
-		io->flags &= ~UBLK_IO_FLAG_NEED_GET_DATA;
-		/* update iod->addr because ublksrv may have passed a new io buffer */
-		ublk_get_iod(ubq, req->tag)->addr = io->addr;
-		pr_devel("%s: update iod->addr: qid %d tag %d io_flags %x addr %llx\n",
-				__func__, ubq->q_id, req->tag, io->flags,
-				ublk_get_iod(ubq, req->tag)->addr);
+		io->flags |= UBLK_IO_FLAG_NEED_GET_DATA;
+		pr_devel("%s: need get data. qid %d tag %d io_flags %x\n",
+				__func__, ubq->q_id, req->tag, io->flags);
+		ublk_complete_io_cmd(io, UBLK_IO_RES_NEED_GET_DATA,
+				     issue_flags);
+		return;
 	}
 
 	ublk_start_io(ubq, req, io);
 	ublk_complete_io_cmd(io, UBLK_IO_RES_OK, issue_flags);
 }
@@ -2041,10 +2028,28 @@ static int ublk_commit_and_fetch(const struct ublk_queue *ubq,
 		ublk_put_req_ref(ubq, req);
 
 	return 0;
 }
 
+static void ublk_get_data(struct ublk_queue *ubq, struct ublk_io *io,
+			  struct request *req)
+{
+	/*
+	 * We have handled UBLK_IO_NEED_GET_DATA command,
+	 * so clear UBLK_IO_FLAG_NEED_GET_DATA now and just
+	 * do the copy work.
+	 */
+	io->flags &= ~UBLK_IO_FLAG_NEED_GET_DATA;
+	/* update iod->addr because ublksrv may have passed a new io buffer */
+	ublk_get_iod(ubq, req->tag)->addr = io->addr;
+	pr_devel("%s: update iod->addr: qid %d tag %d io_flags %x addr %llx\n",
+			__func__, ubq->q_id, req->tag, io->flags,
+			ublk_get_iod(ubq, req->tag)->addr);
+
+	ublk_start_io(ubq, req, io);
+}
+
 static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 			       unsigned int issue_flags,
 			       const struct ublksrv_io_cmd *ub_cmd)
 {
 	struct ublk_device *ub = cmd->file->private_data;
@@ -2106,14 +2111,14 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 			goto out;
 		break;
 	case UBLK_IO_NEED_GET_DATA:
 		if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV))
 			goto out;
-		ublk_fill_io_cmd(io, cmd, ub_cmd->addr);
+		io->addr = ub_cmd->addr;
 		req = blk_mq_tag_to_rq(ub->tag_set.tags[ub_cmd->q_id], tag);
-		ublk_dispatch_req(ubq, req, issue_flags);
-		return -EIOCBQUEUED;
+		ublk_get_data(ubq, io, req);
+		return UBLK_IO_RES_OK;
 	default:
 		goto out;
 	}
 	ublk_prep_cancel(cmd, issue_flags, ubq, tag);
 	return -EIOCBQUEUED;
-- 
2.45.2

