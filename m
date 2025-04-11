Received: from mail-yb1-f226.google.com (mail-yb1-f226.google.com [209.85.219.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B5823A9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744330692; cv=none; b=ndYYchbKKYFCBnUrqGRt7Z5J7b6K4r780sL4MpG4key6qm1xSqlGNYyUPZetQXKQiDA7qYmOkm5kVykLb3907xSJVxrRB2tyP+9HYyCJ5vCHSfRgIth9dUGswMRqcw9+zbYcE7Zg39RDxjy2VgmbpyL6UC8wNK61jyYJawlrhPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744330692; c=relaxed/simple;
	bh=1bbPk4nVXbYSm5TyEHMtONnL4+3dFePnH4zVplRm4eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdN9FJgUaPwYpT/Yf7AwpM3N/u4pN7cUd20VaHJ6mOf4jvxcwH86pNKl1dWipcCueMaXPMSJ49vYFLjZq0zsD3pgke8+ik0l3brAscXhOqLjrx1QB88PtXqDGBXS+QcNmzQK2BdnqfBlE250zYPmodES+NrS/vL2YLQhOBghu2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=HSdslIH1; arc=none smtp.client-ip=209.85.219.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="HSdslIH1"
Received: by mail-yb1-f226.google.com with SMTP id 3f1490d57ef6-e6a8aa771e8so1194354276.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 17:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744330689; x=1744935489; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1pEANpTFfOrSvpkXaufSvJPRX8F1QDAo8Dwnj8gdwI=;
        b=HSdslIH1hb4mOOSdJHH4H31WiGBNL3S+7VOElruChUCzcIMlBD5ek4dUQ3GwSBQd1o
         9Zaeap7bsqKb058ULDWOWl5xdnuQF9Lcm9hA2DxB8VEwcEo1Nk2UrBR9Ei89oNKCRD8/
         4RJG68La+31dECVRachXfo0F9nFMMLcmUTYNrHsWicbuErTU5qGo2LJ77w8Wrdwz4W0p
         16OEepGQrHg3MA1RarpZAsPoUyZdOFYsXYocJoS/AAxMFs5mE4bOUrjrGJH6wQGz8pkY
         6aDvlekBnvEdsrOjp4wFNaVXO46N4sz/QIFEOM8pXUhGB3CXWnh44yyATk4Gh9EgkCaq
         KrSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744330689; x=1744935489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1pEANpTFfOrSvpkXaufSvJPRX8F1QDAo8Dwnj8gdwI=;
        b=Do2+ABLwCavEu+0tfEe61A/bxBQNIM7ahRCmiJXTQc8K8waSej1NXeMil9Ddssbhah
         bDnBhi3noUbd6YRTMQ7gLYRm65CpSiLQrhl/pLWUlIZD4qJ785KwPmbpCfdy8gPvpS12
         YNTKO1G/k0QfkLb0LgyHTjsycr+g77m1Ei3hyeOmQnR4roy8kRKEAC958lHz59rODnbg
         kVoCHm8t2zldebqBTnEb08rz1As/e/31lD2nYUfG/WqWq9RrN3Ig231BQS2BkBDN1I3n
         EYnoGoLMjAoOHDS0vkDiVTYtkKsbo24SZEalaijh8ntK+Fs1Bnt4pH7DfyuLAEzVAg5O
         mKBw==
X-Forwarded-Encrypted: i=1; AJvYcCWKtFAAiV4+82KvSM8+xmE11jL6j196RaMuJNCNiKGC0NnN6mzOjoEyxotizNL8mFS7/d9e5VCEW25Q1Hs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj0iEZlENAxaUA9+gPn+UrNIqm6jsYnKGT+TkUpi1o9s3Ua/zP
	/0AKXyap7ruoTPe8RQsDHd2at9+GkYHJtd9RM7vFf6FoBzC19l44OEY9rTu3hTSBYXfEwFQJG8z
	cUqE78xJPSTm2Qigz7ANs4Q9K+Cqdzd5+
X-Gm-Gg: ASbGncs4BcqPDWtHTRYYMNmZ2ur3IW0bd8ut2QVgSlwEuNdSOqWRgnLDipqIWztfxSi
	73jmuGGt2GVo9ylgBG8R8BbiyUZb+OMrJ5AFsWHGnPWYzLBdxDFBoaIHrkFYByIkI+kBBTtte5w
	NPy9dZy3o/IRxE0kFhfTkyxNuuv8RrndZUJLam+jWZs1fzPVokQOJ4sRVjnlz3Z3N6EJBcpnUHx
	m7eEn3nDQeMJ+H5NxThG6MnmcVB2yz/QGeAMqb/NEn4A8vPLQm67QvLEVlpPjMLWsXNxPMJfQby
	xrnvzNh6RCNzIGWobG3QvlV3bHDnc/d0JPO9ktmDSRN6ng==
X-Google-Smtp-Source: AGHT+IHDCddYSn9Z3YDHDroSQbsXGr5+M9ESeMT8G112Xnc9Bogsb1I8tuT7iew7Or2Cc/2KbfFi0jjlmACE
X-Received: by 2002:a05:6902:cc6:b0:e5b:3823:4176 with SMTP id 3f1490d57ef6-e704de9bf92mr1781004276.13.1744330688844;
        Thu, 10 Apr 2025 17:18:08 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 3f1490d57ef6-e7032479f34sm340868276.15.2025.04.10.17.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:18:08 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id D55D3340971;
	Thu, 10 Apr 2025 18:18:07 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id D3145E40E5F; Thu, 10 Apr 2025 18:18:07 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Thu, 10 Apr 2025 18:17:50 -0600
Subject: [PATCH v3 1/2] ublk: properly serialize all FETCH_REQs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-ublk_task_per_io-v3-1-b811e8f4554a@purestorage.com>
References: <20250410-ublk_task_per_io-v3-0-b811e8f4554a@purestorage.com>
In-Reply-To: <20250410-ublk_task_per_io-v3-0-b811e8f4554a@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
X-Mailer: b4 0.14.2

Most uring_cmds issued against ublk character devices are serialized
because each command affects only one queue, and there is an early check
which only allows a single task (the queue's ubq_daemon) to issue
uring_cmds against that queue. However, this mechanism does not work for
FETCH_REQs, since they are expected before ubq_daemon is set. Since
FETCH_REQs are only used at initialization and not in the fast path,
serialize them using the per-ublk-device mutex. This fixes a number of
data races that were previously possible if a badly behaved ublk server
decided to issue multiple FETCH_REQs against the same qid/tag
concurrently.

Reported-by: Caleb Sander Mateos <csander@purestorage.com>
Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 drivers/block/ublk_drv.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 2fd05c1bd30b03343cb6f357f8c08dd92ff47af9..812789f58704cece9b661713cd0107807c789531 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1809,8 +1809,8 @@ static void ublk_nosrv_work(struct work_struct *work)
 
 /* device can only be started after all IOs are ready */
 static void ublk_mark_io_ready(struct ublk_device *ub, struct ublk_queue *ubq)
+	__must_hold(&ub->mutex)
 {
-	mutex_lock(&ub->mutex);
 	ubq->nr_io_ready++;
 	if (ublk_queue_ready(ubq)) {
 		ubq->ubq_daemon = current;
@@ -1822,7 +1822,6 @@ static void ublk_mark_io_ready(struct ublk_device *ub, struct ublk_queue *ubq)
 	}
 	if (ub->nr_queues_ready == ub->dev_info.nr_hw_queues)
 		complete_all(&ub->completion);
-	mutex_unlock(&ub->mutex);
 }
 
 static void ublk_handle_need_get_data(struct ublk_device *ub, int q_id,
@@ -1962,17 +1961,25 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 	case UBLK_IO_UNREGISTER_IO_BUF:
 		return ublk_unregister_io_buf(cmd, ub_cmd->addr, issue_flags);
 	case UBLK_IO_FETCH_REQ:
+		mutex_lock(&ub->mutex);
 		/* UBLK_IO_FETCH_REQ is only allowed before queue is setup */
 		if (ublk_queue_ready(ubq)) {
 			ret = -EBUSY;
-			goto out;
+			goto out_unlock;
 		}
 		/*
 		 * The io is being handled by server, so COMMIT_RQ is expected
 		 * instead of FETCH_REQ
 		 */
 		if (io->flags & UBLK_IO_FLAG_OWNED_BY_SRV)
-			goto out;
+			goto out_unlock;
+
+		/*
+		 * Check again (with mutex held) that the I/O is not
+		 * active - if so, someone may have already fetched it
+		 */
+		if (io->flags & UBLK_IO_FLAG_ACTIVE)
+			goto out_unlock;
 
 		if (ublk_need_map_io(ubq)) {
 			/*
@@ -1980,15 +1987,16 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 			 * DATA is not enabled
 			 */
 			if (!ub_cmd->addr && !ublk_need_get_data(ubq))
-				goto out;
+				goto out_unlock;
 		} else if (ub_cmd->addr) {
 			/* User copy requires addr to be unset */
 			ret = -EINVAL;
-			goto out;
+			goto out_unlock;
 		}
 
 		ublk_fill_io_cmd(io, cmd, ub_cmd->addr);
 		ublk_mark_io_ready(ub, ubq);
+		mutex_unlock(&ub->mutex);
 		break;
 	case UBLK_IO_COMMIT_AND_FETCH_REQ:
 		req = blk_mq_tag_to_rq(ub->tag_set.tags[ub_cmd->q_id], tag);
@@ -2028,7 +2036,9 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 	ublk_prep_cancel(cmd, issue_flags, ubq, tag);
 	return -EIOCBQUEUED;
 
- out:
+out_unlock:
+	mutex_unlock(&ub->mutex);
+out:
 	pr_devel("%s: complete: cmd op %d, tag %d ret %x io_flags %x\n",
 			__func__, cmd_op, tag, ret, io->flags);
 	return ret;

-- 
2.34.1

