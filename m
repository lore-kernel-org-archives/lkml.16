Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C23213E71
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048710; cv=none; b=V8XS4z8+sBnBRzqFtZcZykrYx21pRY/1kxrs6hInnATGmwU1pKsEbZtjyZkdaKGQnDlWwoPgG1uomojrsN4vApHURxXeoc8fDeumvQL2OSlMO8ZEhajJxbQ1SzKOFl5wR9gdvpCe91iMhgXXD6yme+uEFeb3TdLh/j6SWzA1dJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048710; c=relaxed/simple;
	bh=13Lb1ENEytkmOyjRQhWQw++cdiq7YvJSKwVsRLTVCmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V7Qrz9iso1sjLuYRaaa0/Qvho3rkgC23CVnrL+7Odi1fxbstCDhIEajEZjCBUS1+okoFkxR+5JhNfA3n0ckTLQGL06gET0YKQ43G343KSYSiTfN029chf+4iNTa3VFKB+ABLnA2oF6EQm0G591S6YKiru2VEnVfCUqXRJIj9ZDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=FWHMJmhc; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="FWHMJmhc"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-223fd44daf8so459535ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746048707; x=1746653507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AowIOLsR5bCOYMWlibArmMsMF726MWG71cvx56FgS1U=;
        b=FWHMJmhcv2aPsb86mFE6XVJ1dR8LPtZA50SOj/1jkZ2Z051yWCtO3mi1Pkqb7NUnhX
         ZNg6EJBwrEDqn0bB600jtZjPiy3CKGq3Jqg022e3ViAL8L7RHCloOMgDSu7mRdvT5uCZ
         BXCk2HRReTbccYWgfKXaDRdQA1HJt3XW7qij0Y4jnZ/gkTLR8+1NnjXVGn3LEyjO2K8b
         A4+4Jrut9rweF8dDpBeQwYrew9B4AIja8duHRzChx8SGdg3MxlDKWWxr2pcVXTDtKCqv
         vqrpnwpRiIg1O2PgotvAzKxGmSNdQiyCIdMuAOZ/vSsgj5FoSDrGM1sYk+4UHHX+C1rf
         9qYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746048707; x=1746653507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AowIOLsR5bCOYMWlibArmMsMF726MWG71cvx56FgS1U=;
        b=SwI+vfKhMJrsax8spyapO6vsk1RV3SNE/WNK1FoxYAXrxUsitFP2UDxlKdTPawT9GL
         zP2ugkUi1dLFf1mAoGigeihuTK6N2RO2v1VSvxRLhpvfOrBosNiPJCjd8cvePDu3aXdF
         q/akOg87rEWtYxg84SIjxcrKAq+NElOFTNiW1N93Cvmhq/Mdm+UX8N5LPaqv9dMeXdON
         oDurPU9wAPm/ZCFTeRv3j7P23rx9HxwTEdNqV7NwqKRkBDZYdXh4AfWr5QYCDBqU1ikO
         ZRoULoEI6LehGQ/LIaJskmEsJzch6Y2OEEpM/WFOHXiM+++X8vWLYBrnfRfxC2Z8m4Ok
         yIQA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ88icAZ7k92IseK4pj5vFhV7Q36+fw3AhMGcIkIAKUH4dt8J9khRw6m1A3JhuHjrX37U+jayj1CQRJpA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5mfe4zJpEM7k+aYA170oykww2CqVCaRZ1gEy7+E1zWhnh6cj3
	3JJy5ZIGVSOn0UZYaegZTWtClepO03rhVByJ8Nnd33z3tx1QWCARXtvJQ16QBBoIQRH5C/vUNOT
	X6EMj+TJasLprh6McwDs25ChlT8u+o0GANqKUkdCQy/mKSFXC
X-Gm-Gg: ASbGncv9L+OvJmhPf+ph0dz2mxp1B251l/630rc9z9z2uFN46e29t7tR9iOkbWWYZT1
	R1jeOEU/2jrpsghwEIKnG5yhxVimEcHdHhIevlNEeRvCCSJhptNUf+Ef43dni1BZyJmdt164OkI
	Bih7K++tEB0hD2GYK1o4ce5V+uoFFS0tCUl0G99yeJey04g9mwWuFMg1E24eHx59E387K0xMTwH
	7dXYQmTcD7FpKj2U5bos+r8V1nEXjmj81hjzT93cmJyM2QnBaXo8Twkq08BGDsJarXH0mGdXy+P
	XoCnxr+HwaZ4vkPE+3Aifx1gthOkmg==
X-Google-Smtp-Source: AGHT+IEMz8JKMg0IjBz2In3YtU1v2RE7FTghMie4XT2Fs6EgCtrCNUHUNw7hVYhLHl5Z9YvcSiYBYtpOoL4O
X-Received: by 2002:a17:902:d2cb:b0:224:88c:9253 with SMTP id d9443c01a7336-22df578c625mr24120655ad.6.1746048707346;
        Wed, 30 Apr 2025 14:31:47 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-22db5216c1fsm14989235ad.106.2025.04.30.14.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 14:31:47 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 9DA113400C9;
	Wed, 30 Apr 2025 15:31:46 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 97F8BE41981; Wed, 30 Apr 2025 15:31:46 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ublk: consolidate UBLK_IO_FLAG_OWNED_BY_SRV checks
Date: Wed, 30 Apr 2025 15:31:43 -0600
Message-ID: <20250430213144.2625274-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every ublk I/O command except UBLK_IO_FETCH_REQ checks that the ublk_io
has UBLK_IO_FLAG_OWNED_BY_SRV set. Consolidate the separate checks into
a single one in __ublk_ch_uring_cmd(), analogous to those for
UBLK_IO_FLAG_ACTIVE and UBLK_IO_FLAG_NEED_GET_DATA.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
This is targeted at for-6.16/block, but depends on a recent commit that's only
on block-6.15.

 drivers/block/ublk_drv.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index f9032076bc06..692590fcd967 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1951,20 +1951,16 @@ static void ublk_io_release(void *priv)
 static int ublk_register_io_buf(struct io_uring_cmd *cmd,
 				const struct ublk_queue *ubq, unsigned int tag,
 				unsigned int index, unsigned int issue_flags)
 {
 	struct ublk_device *ub = cmd->file->private_data;
-	const struct ublk_io *io = &ubq->ios[tag];
 	struct request *req;
 	int ret;
 
 	if (!ublk_support_zero_copy(ubq))
 		return -EINVAL;
 
-	if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV))
-		return -EINVAL;
-
 	req = __ublk_check_and_get_req(ub, ubq, tag, 0);
 	if (!req)
 		return -EINVAL;
 
 	ret = io_buffer_register_bvec(cmd, req, ublk_io_release, index,
@@ -1976,21 +1972,16 @@ static int ublk_register_io_buf(struct io_uring_cmd *cmd,
 
 	return 0;
 }
 
 static int ublk_unregister_io_buf(struct io_uring_cmd *cmd,
-				  const struct ublk_queue *ubq, unsigned int tag,
+				  const struct ublk_queue *ubq,
 				  unsigned int index, unsigned int issue_flags)
 {
-	const struct ublk_io *io = &ubq->ios[tag];
-
 	if (!ublk_support_zero_copy(ubq))
 		return -EINVAL;
 
-	if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV))
-		return -EINVAL;
-
 	return io_buffer_unregister_bvec(cmd, index, issue_flags);
 }
 
 static int ublk_fetch(struct io_uring_cmd *cmd, struct ublk_queue *ubq,
 		      struct ublk_io *io, __u64 buf_addr)
@@ -2072,10 +2063,15 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 	/* there is pending io cmd, something must be wrong */
 	if (io->flags & UBLK_IO_FLAG_ACTIVE) {
 		ret = -EBUSY;
 		goto out;
 	}
+ 
+	/* only UBLK_IO_FETCH_REQ is allowed if io is not OWNED_BY_SRV */
+	if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV) &&
+	    _IOC_NR(cmd_op) != UBLK_IO_FETCH_REQ)
+		goto out;
 
 	/*
 	 * ensure that the user issues UBLK_IO_NEED_GET_DATA
 	 * iff the driver have set the UBLK_IO_FLAG_NEED_GET_DATA.
 	 */
@@ -2090,22 +2086,18 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 	ret = -EINVAL;
 	switch (_IOC_NR(cmd_op)) {
 	case UBLK_IO_REGISTER_IO_BUF:
 		return ublk_register_io_buf(cmd, ubq, tag, ub_cmd->addr, issue_flags);
 	case UBLK_IO_UNREGISTER_IO_BUF:
-		return ublk_unregister_io_buf(cmd, ubq, tag, ub_cmd->addr, issue_flags);
+		return ublk_unregister_io_buf(cmd, ubq, ub_cmd->addr, issue_flags);
 	case UBLK_IO_FETCH_REQ:
 		ret = ublk_fetch(cmd, ubq, io, ub_cmd->addr);
 		if (ret)
 			goto out;
 		break;
 	case UBLK_IO_COMMIT_AND_FETCH_REQ:
 		req = blk_mq_tag_to_rq(ub->tag_set.tags[ub_cmd->q_id], tag);
-
-		if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV))
-			goto out;
-
 		if (ublk_need_map_io(ubq)) {
 			/*
 			 * COMMIT_AND_FETCH_REQ has to provide IO buffer if
 			 * NEED GET DATA is not enabled or it is Read IO.
 			 */
@@ -2123,12 +2115,10 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 
 		ublk_fill_io_cmd(io, cmd, ub_cmd->addr);
 		ublk_commit_completion(ub, ub_cmd);
 		break;
 	case UBLK_IO_NEED_GET_DATA:
-		if (!(io->flags & UBLK_IO_FLAG_OWNED_BY_SRV))
-			goto out;
 		ublk_fill_io_cmd(io, cmd, ub_cmd->addr);
 		req = blk_mq_tag_to_rq(ub->tag_set.tags[ub_cmd->q_id], tag);
 		ublk_dispatch_req(ubq, req, issue_flags);
 		return -EIOCBQUEUED;
 	default:
-- 
2.45.2

