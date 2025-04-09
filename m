Received: from mail-oa1-f99.google.com (mail-oa1-f99.google.com [209.85.160.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F0B524B0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 01:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744162223; cv=none; b=sZ5P/e9eBHBxXfMUzTW7w3QwWGoJWi8sveP7MjqJkG8h5r0TtFetbeNA7jOkId4IKTSY27zpmLL3GTELga77UIgV9O4qMnHFu2zmM/hYC5LZmuPa/nsMDKeAeHKq2igK54EX/RpvJo2WrMVxT4fTS+gQM0afjG9fOPD9nmm0bEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744162223; c=relaxed/simple;
	bh=Rdcb0GogebvJxZRIcQlv/wm5AKd2Fkzj7KyrWVFxujg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5Y5pVtQXDQ2yBqYkw5tsiv8yvvSgsE7Ic6I00V7w8DesydpasVbHrECNmBY0b1oiNMgiSKgU/JwjtGteu0yTtW8ZaItMFc3iqluzpYKhz9dlIzhzNX65u+9vIlNMfylXnXOwiPf8pigZojx5/QKGKgc91n6G4DPhj03ZyOCLec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=UZHZsbJz; arc=none smtp.client-ip=209.85.160.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="UZHZsbJz"
Received: by mail-oa1-f99.google.com with SMTP id 586e51a60fabf-2c2e65d48f9so185338fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 18:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744162218; x=1744767018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UoAZVfMh78fdMAaVuJfVVhoNTxJBEDHiLAqFLJmW4D8=;
        b=UZHZsbJzCX/dHjjmGesiW2NeYB3PUNfYM1gOsneZrVO0F+TP5Qb3rnQc49a2/o6/IH
         5aAqca7YCEU0phnck2p7aSVJ3PNoSkL7mEfg1Jk0WdONjoS1FiOWSL3m5tdVFl34ZoKO
         NdbtsZPe2NwxGXDu2ISwFxhAKqnRfbl+FG+QObRafW/vJkVI6k33wPN37WR5I5SGsPHi
         se7Jdqu6Tv8Ppg3rPzz7CB5xT8XpZIBvinruEijGi0DBIvm8Ma9NUZBLqeiS4cjISf2V
         cDlvhX+8sR882s4a9KMOq7eQ2rsOgjIRCNXjkLa9IKNV3nvQ5RwkQCD0PZawg/O54v3q
         TCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744162218; x=1744767018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoAZVfMh78fdMAaVuJfVVhoNTxJBEDHiLAqFLJmW4D8=;
        b=Ag65QTuZuD9uBXV31Ya5nMh0yw00NzrHJ9Woy2h7MLDdY8Mx5qJ9ZGcmGrzZr3asRt
         LKxiYYZTfB8e44WhI2xAPtIEK2KVHIhnP767INKTD7S5rahA1MXuMSWJ0TXXa0UtmsGs
         he2R9NuoXvlGTk0IhkLdle17zaQtpiKhfE3Iuxq9jVHfFCuD4Iys32Y+MxYTZXz5YV4P
         JEJV524BVvTBNxup8HpvRHjo6FrP0EROfNDI3RdwfvYS47dIpoYSNQSdJT38MFnW35y4
         IIKTzvMiX9Ie9LjBLbNqP/3+H/c2o0UpaPrxt48cKEJZyA5hgAsWJGYbU00zsPvD81H5
         aUhg==
X-Forwarded-Encrypted: i=1; AJvYcCVzgnwmFdxNqkqel0QcX+gUvgSjw4wR/QYfgjXHqo/EJz8ajjxYS/3x9LlasNc1MFRaery5gaEK7iTsSqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiEGQggM4h7su9Y8eZRQ5pGgL4Mrr69ibggLWFVdu17jgDQnQn
	re/4NtLkzv/sfUGzi9wG5h05cByJR5Ye3W2NpgQpGF4/fbSCtkjiK7DhkUg9QMkEWtOwpvcUabK
	Hq/lL65ezz4oNJ2UYilD60vpp0Yge2DTA
X-Gm-Gg: ASbGnctJ9tENu8r6M8FXl9B+glLo4KtEcZ9TNMvYnhXDvVZPtHyX9iUcYfHgpaVfxUn
	nGpbGBxEmEIm4DAkLzTyEtl6ZfTtk+Cs/m3/9w+sG7GwFQaFErJA4OwKgXbDBJrgD1+qbUKXnxG
	7HoeDkxAGg7/AxOdHnaZBLrMEJdG7gS9goXsIFx5CHhu4CthVv/FCw0DXVIROl7mRn4SEtNqLdZ
	2v+o2bSRDK1eLR659ROsKRSsT2sA3xGTzkZSJ4so6cIDc847x3yYQqtc98QlKfqYtqxiVFhSBsR
	GVEK4A3pCxUbka4ou0xpPWgNhJ1iPEaqcOc/TM6JcT9P2fb+
X-Google-Smtp-Source: AGHT+IH20CvIVPG04MXbUmEM85UBo0DuvuUKKHtkJ4vHuHI2/n9rQvIrCe7huQIao4JVNSTYx+bl8r3DYFqJ
X-Received: by 2002:a05:6871:d305:b0:2c2:5b15:e61 with SMTP id 586e51a60fabf-2d0916c3a56mr154328fac.1.1744162218078;
        Tue, 08 Apr 2025 18:30:18 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-2d09695f8b3sm17098fac.14.2025.04.08.18.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 18:30:18 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 3967B3401C9;
	Tue,  8 Apr 2025 19:30:17 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 31ECFE41DE8; Tue,  8 Apr 2025 19:30:17 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ublk: pass ublksrv_ctrl_cmd * instead of io_uring_cmd *
Date: Tue,  8 Apr 2025 19:29:26 -0600
Message-ID: <20250409012928.3527198-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ublk_ctrl_*() handlers all take struct io_uring_cmd *cmd but only
use it to get struct ublksrv_ctrl_cmd *header from the io_uring SQE.
Since the caller ublk_ctrl_uring_cmd() has already computed header, pass
it instead of cmd.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 46 +++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 2fd05c1bd30b..61d94e84f2af 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2411,13 +2411,13 @@ static struct ublk_device *ublk_get_device_from_id(int idx)
 	spin_unlock(&ublk_idr_lock);
 
 	return ub;
 }
 
-static int ublk_ctrl_start_dev(struct ublk_device *ub, struct io_uring_cmd *cmd)
+static int ublk_ctrl_start_dev(struct ublk_device *ub,
+		const struct ublksrv_ctrl_cmd *header)
 {
-	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	const struct ublk_param_basic *p = &ub->params.basic;
 	int ublksrv_pid = (int)header->data[0];
 	struct queue_limits lim = {
 		.logical_block_size	= 1 << p->logical_bs_shift,
 		.physical_block_size	= 1 << p->physical_bs_shift,
@@ -2532,13 +2532,12 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub, struct io_uring_cmd *cmd)
 	mutex_unlock(&ub->mutex);
 	return ret;
 }
 
 static int ublk_ctrl_get_queue_affinity(struct ublk_device *ub,
-		struct io_uring_cmd *cmd)
+		const struct ublksrv_ctrl_cmd *header)
 {
-	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	void __user *argp = (void __user *)(unsigned long)header->addr;
 	cpumask_var_t cpumask;
 	unsigned long queue;
 	unsigned int retlen;
 	unsigned int i;
@@ -2583,13 +2582,12 @@ static inline void ublk_dump_dev_info(struct ublksrv_ctrl_dev_info *info)
 			info->dev_id, info->flags);
 	pr_devel("\t nr_hw_queues %d queue_depth %d\n",
 			info->nr_hw_queues, info->queue_depth);
 }
 
-static int ublk_ctrl_add_dev(struct io_uring_cmd *cmd)
+static int ublk_ctrl_add_dev(const struct ublksrv_ctrl_cmd *header)
 {
-	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	void __user *argp = (void __user *)(unsigned long)header->addr;
 	struct ublksrv_ctrl_dev_info info;
 	struct ublk_device *ub;
 	int ret = -EINVAL;
 
@@ -2810,13 +2808,12 @@ static int ublk_ctrl_stop_dev(struct ublk_device *ub)
 	cancel_work_sync(&ub->nosrv_work);
 	return 0;
 }
 
 static int ublk_ctrl_get_dev_info(struct ublk_device *ub,
-		struct io_uring_cmd *cmd)
+		const struct ublksrv_ctrl_cmd *header)
 {
-	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	void __user *argp = (void __user *)(unsigned long)header->addr;
 
 	if (header->len < sizeof(struct ublksrv_ctrl_dev_info) || !header->addr)
 		return -EINVAL;
 
@@ -2841,13 +2838,12 @@ static void ublk_ctrl_fill_params_devt(struct ublk_device *ub)
 	}
 	ub->params.types |= UBLK_PARAM_TYPE_DEVT;
 }
 
 static int ublk_ctrl_get_params(struct ublk_device *ub,
-		struct io_uring_cmd *cmd)
+		const struct ublksrv_ctrl_cmd *header)
 {
-	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	void __user *argp = (void __user *)(unsigned long)header->addr;
 	struct ublk_params_header ph;
 	int ret;
 
 	if (header->len <= sizeof(ph) || !header->addr)
@@ -2872,13 +2868,12 @@ static int ublk_ctrl_get_params(struct ublk_device *ub,
 
 	return ret;
 }
 
 static int ublk_ctrl_set_params(struct ublk_device *ub,
-		struct io_uring_cmd *cmd)
+		const struct ublksrv_ctrl_cmd *header)
 {
-	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	void __user *argp = (void __user *)(unsigned long)header->addr;
 	struct ublk_params_header ph;
 	int ret = -EFAULT;
 
 	if (header->len <= sizeof(ph) || !header->addr)
@@ -2938,13 +2933,12 @@ static void ublk_queue_reinit(struct ublk_device *ub, struct ublk_queue *ubq)
 		io->addr = 0;
 	}
 }
 
 static int ublk_ctrl_start_recovery(struct ublk_device *ub,
-		struct io_uring_cmd *cmd)
+		const struct ublksrv_ctrl_cmd *header)
 {
-	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	int ret = -EINVAL;
 	int i;
 
 	mutex_lock(&ub->mutex);
 	if (ublk_nosrv_should_stop_dev(ub))
@@ -2986,13 +2980,12 @@ static int ublk_ctrl_start_recovery(struct ublk_device *ub,
 	mutex_unlock(&ub->mutex);
 	return ret;
 }
 
 static int ublk_ctrl_end_recovery(struct ublk_device *ub,
-		struct io_uring_cmd *cmd)
+		const struct ublksrv_ctrl_cmd *header)
 {
-	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	int ublksrv_pid = (int)header->data[0];
 	int ret = -EINVAL;
 	int i;
 
 	pr_devel("%s: Waiting for new ubq_daemons(nr: %d) are ready, dev id %d...\n",
@@ -3035,13 +3028,12 @@ static int ublk_ctrl_end_recovery(struct ublk_device *ub,
  out_unlock:
 	mutex_unlock(&ub->mutex);
 	return ret;
 }
 
-static int ublk_ctrl_get_features(struct io_uring_cmd *cmd)
+static int ublk_ctrl_get_features(const struct ublksrv_ctrl_cmd *header)
 {
-	const struct ublksrv_ctrl_cmd *header = io_uring_sqe_cmd(cmd->sqe);
 	void __user *argp = (void __user *)(unsigned long)header->addr;
 	u64 features = UBLK_F_ALL;
 
 	if (header->len != UBLK_FEATURES_LEN || !header->addr)
 		return -EINVAL;
@@ -3176,11 +3168,11 @@ static int ublk_ctrl_uring_cmd(struct io_uring_cmd *cmd,
 	ret = ublk_check_cmd_op(cmd_op);
 	if (ret)
 		goto out;
 
 	if (cmd_op == UBLK_U_CMD_GET_FEATURES) {
-		ret = ublk_ctrl_get_features(cmd);
+		ret = ublk_ctrl_get_features(header);
 		goto out;
 	}
 
 	if (_IOC_NR(cmd_op) != UBLK_CMD_ADD_DEV) {
 		ret = -ENODEV;
@@ -3193,42 +3185,42 @@ static int ublk_ctrl_uring_cmd(struct io_uring_cmd *cmd,
 			goto put_dev;
 	}
 
 	switch (_IOC_NR(cmd_op)) {
 	case UBLK_CMD_START_DEV:
-		ret = ublk_ctrl_start_dev(ub, cmd);
+		ret = ublk_ctrl_start_dev(ub, header);
 		break;
 	case UBLK_CMD_STOP_DEV:
 		ret = ublk_ctrl_stop_dev(ub);
 		break;
 	case UBLK_CMD_GET_DEV_INFO:
 	case UBLK_CMD_GET_DEV_INFO2:
-		ret = ublk_ctrl_get_dev_info(ub, cmd);
+		ret = ublk_ctrl_get_dev_info(ub, header);
 		break;
 	case UBLK_CMD_ADD_DEV:
-		ret = ublk_ctrl_add_dev(cmd);
+		ret = ublk_ctrl_add_dev(header);
 		break;
 	case UBLK_CMD_DEL_DEV:
 		ret = ublk_ctrl_del_dev(&ub, true);
 		break;
 	case UBLK_CMD_DEL_DEV_ASYNC:
 		ret = ublk_ctrl_del_dev(&ub, false);
 		break;
 	case UBLK_CMD_GET_QUEUE_AFFINITY:
-		ret = ublk_ctrl_get_queue_affinity(ub, cmd);
+		ret = ublk_ctrl_get_queue_affinity(ub, header);
 		break;
 	case UBLK_CMD_GET_PARAMS:
-		ret = ublk_ctrl_get_params(ub, cmd);
+		ret = ublk_ctrl_get_params(ub, header);
 		break;
 	case UBLK_CMD_SET_PARAMS:
-		ret = ublk_ctrl_set_params(ub, cmd);
+		ret = ublk_ctrl_set_params(ub, header);
 		break;
 	case UBLK_CMD_START_USER_RECOVERY:
-		ret = ublk_ctrl_start_recovery(ub, cmd);
+		ret = ublk_ctrl_start_recovery(ub, header);
 		break;
 	case UBLK_CMD_END_USER_RECOVERY:
-		ret = ublk_ctrl_end_recovery(ub, cmd);
+		ret = ublk_ctrl_end_recovery(ub, header);
 		break;
 	default:
 		ret = -EOPNOTSUPP;
 		break;
 	}
-- 
2.45.2

