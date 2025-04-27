Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F420A228CB0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 04:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745729899; cv=none; b=W0eko2g4V4j+OouYg6IxfXarb/st9GhMv2441cKpV0oeLaT/T2IsYiC03anblWhDSI5a4p0rR75p6w49T7rFhyA7AM0HYj9cMpz5nT0zDQF2TTnkizzwwdiOxo4au9jgjYD0yRYI9/kxxwaHd+iYFK3OcB4CZvoVCmYAxYj1X00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745729899; c=relaxed/simple;
	bh=Yddx/b/XLifFgaO7M9pcSF5tFH4TSSpS5U9UUhl2Gro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BKjzzWidUdfdWj6AnrQXOZ+drF8zmAADHaAkboDXVndykV29ntopiqMJHxN8S16+yi6jLgIpGiK+yD1+htfqElAP6LgYlUuBJ6UOc8D55kFyzRwKyJtBalTGQoC4V18fyH2ch+y1V4JhIZTfVvyV/kF7fIdTA+jMqy3mK4ohHR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=JTy8hNJz; arc=none smtp.client-ip=209.85.221.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="JTy8hNJz"
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5245e9a0628so103813e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745729896; x=1746334696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytSjcOrjW6yVMNgL4en3Ee4QjHFYgZn3+Z4PMl0t05Q=;
        b=JTy8hNJziupGwXHlgIimOajX+ysYZmC9dQVCo0/sR7Tj677WK2Ss9TQ9XsC8LxswAl
         axF7TweLvfVcknhmnTn6d2AtkRYK9lIGmZHN7qaf7v3RNkWAOo82Ja6z5dVrf5LaOoz1
         gdxVNkC5BXwcBYwBVt6sQwj/curcz95DASrL2bgG+DhT+M+LUA3PDRdbhABimLiqx3di
         B0tYmDZ15jXFrMHNSMZMJAb4MRWk51anlb+IVKuXoVEqmjVpzDVUXAvIHEpbKAT+dbi6
         7rxuEh/ivwD3SU/lXcZrqFow3xEC7dQPRCsp+Oeo3uywCAonl6kSPmRiUOUMYegiLTB6
         nPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745729896; x=1746334696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytSjcOrjW6yVMNgL4en3Ee4QjHFYgZn3+Z4PMl0t05Q=;
        b=ll9bhJa6HpmuPuQYGyEq7LV75fkwJNiAHHKGplmnMGODre3ljvGcvXRBCe/AyHMyif
         rtVwpA7MwitTIodjLN0PLgjWXmUZpnOu/gQLA1oiGk0xgguLlLHr9iF35YaXm2gneWY+
         r1W00DYh+YRJV9LIHEOw43hkEmnttp0hKFW4BRy6B3G702/M1+ql+6VCnl30z7X/DH7d
         l/LjM0ZP0Cy9sJtGOY7JuZQNs/VKMovToMuhQ+K5pE+MJu17cmMxdsEV2ykH6Bjz9bqd
         nutTdaLfiM9nMoe1jsjoXRbJH4A0DNbzXOPypjnvZqKdbqII35BReQQVXbtzBFgYLKvG
         HO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpxyr1i5xjYJTd0tqG5TDl8JtjvAz2OYCr+cEjLqXIN2X+wWt443w8w2Br53jQShLDZjT35AvuJ2bZots=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5RVVwLIm3Gty6guWQ3aLFOUIYrx+N5vNbq7GTQbGjg5MfmzBc
	5QAu1d5G8Z4uDIsWA7MxD+WFItHizqHqE8umrWFRHyxTAF1usFy/2epVIbO0e8RUPXXEGqkV+Sr
	HjXfo6Ynv+RUO+6lETjx5PLGt7Y9T90m+UVTHEQSeYGxBgkz3
X-Gm-Gg: ASbGncvVu6FJkcgNfZfVmaEYrGbtKuIxr22f82MBxl4RBrZ5drTomgg+ksFzQJKXpKR
	9YMYvnP9g1VTlg6w8E8rmH962E0/0WqXEFiDy9vh4Dey2Gz+7/gv9pd/4eml/JSrZhJ6qows6jS
	SOuaHHhWHKqQFGLUfKTNxJtwq96QfJ7jSaUEf22H8xsmJmdbhspIJMAG3yDvbxuYa0IhYZ6iZr8
	YNmiaUgxQgWcExUiArlSZOsNkWGt56lmC6bpMTkOAiNmMTyyhl+qVFnyT+YKYMjj/5q8reGbswE
	pCWD2l4Ly7tQYP5K3StkKxN2aSN5iA==
X-Google-Smtp-Source: AGHT+IHoLpNHmupUBvpZTdwrVhBb64jDbVe8o7JFOrNypTGplRppNwOstdfnmpLrihKVCgFjc8cg5G+8seE6
X-Received: by 2002:ac5:cde4:0:b0:523:e1cf:5aef with SMTP id 71dfb90a1353d-52a89eb065fmr1612097e0c.2.1745729895693;
        Sat, 26 Apr 2025 21:58:15 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-52a9924306dsm341210e0c.5.2025.04.26.21.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 21:58:15 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 9A18A340615;
	Sat, 26 Apr 2025 22:58:14 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 97946E40C3E; Sat, 26 Apr 2025 22:58:14 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH 8/8] ublk: store request pointer in ublk_io
Date: Sat, 26 Apr 2025 22:58:03 -0600
Message-ID: <20250427045803.772972-9-csander@purestorage.com>
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

A ublk_io is converted to a request in several places in the I/O path by
looking up the (qid, tag) on the ublk device's tagset. This involves a
bunch of pointer dereferences and a bounds check of the tag.

To make this conversion cheaper, store the request pointer in ublk_io.
Overlap this storage with the io_uring_cmd pointer. This is safe because
the io_uring_cmd pointer is only valid if UBLK_IO_FLAG_ACTIVE is set on
the ublk_io, the request pointer is valid if UBLK_IO_FLAG_OWNED_BY_SRV,
and these flags are mutually exclusive.

Suggested-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 43 ++++++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 2296fa677d0d..c69c234adb4e 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -140,11 +140,16 @@ struct ublk_io {
 	/* userspace buffer address from io cmd */
 	__u64	addr;
 	unsigned int flags;
 	int res;
 
-	struct io_uring_cmd *cmd;
+	union {
+		/* valid if UBLK_IO_FLAG_ACTIVE is set */
+		struct io_uring_cmd *cmd;
+		/* valid if UBLK_IO_FLAG_OWNED_BY_SRV is set */
+		struct request *req;
+	};
 };
 
 struct ublk_queue {
 	int q_id;
 	int q_depth;
@@ -1123,24 +1128,29 @@ static void ublk_complete_rq(struct kref *ref)
 	struct request *req = blk_mq_rq_from_pdu(data);
 
 	__ublk_complete_rq(req);
 }
 
-static void ublk_complete_io_cmd(struct ublk_io *io, int res,
-				 unsigned issue_flags)
+static void ublk_complete_io_cmd(struct ublk_io *io, struct request *req,
+				 int res, unsigned issue_flags)
 {
+	/* read cmd first because req will overwrite it */
+	struct io_uring_cmd *cmd = io->cmd;
+
 	/* mark this cmd owned by ublksrv */
 	io->flags |= UBLK_IO_FLAG_OWNED_BY_SRV;
 
 	/*
 	 * clear ACTIVE since we are done with this sqe/cmd slot
 	 * We can only accept io cmd in case of being not active.
 	 */
 	io->flags &= ~UBLK_IO_FLAG_ACTIVE;
 
+	io->req = req;
+
 	/* tell ublksrv one io request is coming */
-	io_uring_cmd_done(io->cmd, res, 0, issue_flags);
+	io_uring_cmd_done(cmd, res, 0, issue_flags);
 }
 
 #define UBLK_REQUEUE_DELAY_MS	3
 
 static inline void __ublk_abort_rq(struct ublk_queue *ubq,
@@ -1213,17 +1223,17 @@ static void ublk_dispatch_req(struct ublk_queue *ubq,
 		 * and notify it.
 		 */
 		io->flags |= UBLK_IO_FLAG_NEED_GET_DATA;
 		pr_devel("%s: need get data. qid %d tag %d io_flags %x\n",
 				__func__, ubq->q_id, req->tag, io->flags);
-		ublk_complete_io_cmd(io, UBLK_IO_RES_NEED_GET_DATA,
+		ublk_complete_io_cmd(io, req, UBLK_IO_RES_NEED_GET_DATA,
 				     issue_flags);
 		return;
 	}
 
 	ublk_start_io(ubq, req, io);
-	ublk_complete_io_cmd(io, UBLK_IO_RES_OK, issue_flags);
+	ublk_complete_io_cmd(io, req, UBLK_IO_RES_OK, issue_flags);
 }
 
 static void ublk_cmd_tw_cb(struct io_uring_cmd *cmd,
 			   unsigned int issue_flags)
 {
@@ -1607,16 +1617,12 @@ static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *ubq)
 	int i;
 
 	for (i = 0; i < ubq->q_depth; i++) {
 		struct ublk_io *io = &ubq->ios[i];
 
-		if (io->flags & UBLK_IO_FLAG_OWNED_BY_SRV) {
-			struct request *rq;
-
-			rq = blk_mq_tag_to_rq(ub->tag_set.tags[ubq->q_id], i);
-			__ublk_fail_req(ubq, io, rq);
-		}
+		if (io->flags & UBLK_IO_FLAG_OWNED_BY_SRV)
+			__ublk_fail_req(ubq, io, io->req);
 	}
 }
 
 /* Must be called when queue is frozen */
 static void ublk_mark_queue_canceling(struct ublk_queue *ubq)
@@ -1986,16 +1992,16 @@ static int ublk_fetch(struct io_uring_cmd *cmd, struct ublk_queue *ubq,
 
 static int ublk_commit_and_fetch(const struct ublk_queue *ubq,
 				 struct ublk_io *io, struct io_uring_cmd *cmd,
 				 const struct ublksrv_io_cmd *ub_cmd)
 {
-	struct blk_mq_tags *tags = ubq->dev->tag_set.tags[ub_cmd->q_id];
-	struct request *req = blk_mq_tag_to_rq(tags, ub_cmd->tag);
+	struct request *req;
 
 	if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV))
 		return -EINVAL;
 
+	req = io->req;
 	if (ublk_need_map_io(ubq)) {
 		/*
 		 * COMMIT_AND_FETCH_REQ has to provide IO buffer if
 		 * NEED GET DATA is not enabled or it is Read IO.
 		 */
@@ -2023,13 +2029,14 @@ static int ublk_commit_and_fetch(const struct ublk_queue *ubq,
 		ublk_put_req_ref(ubq, req);
 
 	return 0;
 }
 
-static void ublk_get_data(struct ublk_queue *ubq, struct ublk_io *io,
-			  struct request *req)
+static void ublk_get_data(struct ublk_queue *ubq, struct ublk_io *io)
 {
+	struct request *req = io->req;
+
 	/*
 	 * We have handled UBLK_IO_NEED_GET_DATA command,
 	 * so clear UBLK_IO_FLAG_NEED_GET_DATA now and just
 	 * do the copy work.
 	 */
@@ -2051,11 +2058,10 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 	struct ublk_queue *ubq;
 	struct ublk_io *io;
 	u32 cmd_op = cmd->cmd_op;
 	unsigned tag = ub_cmd->tag;
 	int ret = -EINVAL;
-	struct request *req;
 
 	pr_devel("%s: received: cmd op %d queue %d tag %d result %d\n",
 			__func__, cmd->cmd_op, ub_cmd->q_id, tag,
 			ub_cmd->result);
 
@@ -2107,12 +2113,11 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 		break;
 	case UBLK_IO_NEED_GET_DATA:
 		if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV))
 			goto out;
 		io->addr = ub_cmd->addr;
-		req = blk_mq_tag_to_rq(ub->tag_set.tags[ub_cmd->q_id], tag);
-		ublk_get_data(ubq, io, req);
+		ublk_get_data(ubq, io);
 		return UBLK_IO_RES_OK;
 	default:
 		goto out;
 	}
 	ublk_prep_cancel(cmd, issue_flags, ubq, tag);
-- 
2.45.2

