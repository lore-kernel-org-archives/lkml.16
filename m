Received: from mail-il1-f225.google.com (mail-il1-f225.google.com [209.85.166.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5033214D2A0
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744822920; cv=none; b=pHhs0FUNpGOafrh8+fmrssipkq5ttWJnENXtVS5DNPIFRmKARtTRv68GDrzC519rkFarBDXaGTjRPQ2nA4thrrVMxyJwnl/+/b3eTj6u07+rFET6UTkWcA4ZBMZGMv3NLls9q33sIdhHLEqT3F2uVf1FMLO/w7lzvXmOF4eyWC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744822920; c=relaxed/simple;
	bh=xvt7mkErFuONSX+tCCunZGZoKjOa8enrW5ZiNxcJS7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A76eCCODpOZatRPPPL5S54mSIcRrOWsNJ2b26BwAdlXzJTpUpH5Zdn/n7FJPH9tAdBOhBksJzrEBiO4QzupO4rvc86JKsqRWMBW3s7n+OgDQbPoGNczOh47QU3NVewGEL61TYviCfPp8BdF27r3DbowdBHzs6GUURvem5nAHyrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=NvhCoNeo; arc=none smtp.client-ip=209.85.166.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="NvhCoNeo"
Received: by mail-il1-f225.google.com with SMTP id e9e14a558f8ab-3d5d6c64c7dso2467745ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 10:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744822917; x=1745427717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X93KK/EBx3xkQrTJSrr3qWLXKicRx3TEVqRJ2C7Tqgw=;
        b=NvhCoNeoCpABaUXP0g3Nlh0I32tvb0yE8gh/ufVOsEHv1hNOwY91Ky9OYqkvvO0ggu
         iHFG5GpiYlpPU+xVJklOQQ9+Fl5EWZQ133vpNcNkkB6tbqP0MuHU3qN8NgOcuWpHTCzD
         aN1HrzRsd8N501RztkWIRMwgweC9QL3NyPZMf9xyFo6QmY2b5wMJwMoCE47+dmzerGH+
         ZVWbsiJ5Bh6m5GW25Av9eyOMgIr84NVtTN1cwOgCLtcv5td5Xt/ELBhygb4dY2IwT+yv
         ZwMLG599KQuh0qjsMIETdZUnqgd4WbzgXR2rd5jPZ/NpJUzsILlF53COY1vjE4DwS8lD
         opeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744822917; x=1745427717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X93KK/EBx3xkQrTJSrr3qWLXKicRx3TEVqRJ2C7Tqgw=;
        b=pWX4kNj4gsUSKHHAgHRV/EXwENVCHvG8lR2s6PktDNIeF0pnq8+ty//fb/KZaCHgh+
         YdY3sgIP3WgNh+RBtZIAfURmsorHHdFQb0D0HvAfYFH3ejrSROFjH5wHU5WVJJRGqSnb
         dUZTikh3ICWzLHNDlH/yQgoEl1OLZFdBoxx7bu2K/b3rHNWsoxV3h3kcEiFAQ5O5evuS
         eJy5yloZGbEufR0h3EhUHCLgQRRAJrLdsAI9YEb9DQAaKgjReQPcvMGm5F5qk4SnDoIt
         cBEPpo9mYaLRAe1BpqCM3XPm14yN+k9BP7R56gxWbsUlkFw7QTkKf+g8D3iURW77IKyE
         ogdw==
X-Forwarded-Encrypted: i=1; AJvYcCVOU4QzycmpZRpUVjC8PVxwLRB/PaAKTFHQDs6SKdQEsxfapEs4rO7klWY5AnEs3BgJ8Bbq5YMoPInUuZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlS9Oe6IScx4IyUs9LQ3UDUEe9q9zBbfnFCtPipnZ1ZpCV9L43
	1gVI3WKUMBEpcPN6UOL1gjLtvD7dLeCT3tntJ34oLiLAEHlm0XIgrjq6GZW5nzAYsaoxoUjVx8j
	sCcev6M7dpZZt/4hFbsCOvwQER/2tLoRf
X-Gm-Gg: ASbGnctQQyymaDq6Fm2StaPEviPIh6J/6gSfM0aWx+iKgz0+XFNdbd4Df2UOJTdwMCw
	vNZMjjE3aj2GIZrNXEgMEgwkKLe0AnBnZmjd73MDwJYDcLc9QF2LhFkFXMZKoo+O/elWiQI6y1j
	Y1L3iJr3yEAzxuEDGkxTrqEUxutImgMEFiDtEIHWoZaWk1S6OrQxaK1AVLrIKBG3A0WNZD36rD0
	QwUs46bSqfSvphIk/yG0FFrChJ9nGTnZ0yGyB+RSo/+N4Agz4OvDkQaaO02PAcnPOpDXwRVFBGI
	V+A2PICDWsgZ8EAFzKbhFkoToP3Sl32/mKcxm33CLIel
X-Google-Smtp-Source: AGHT+IEMwChMTrFsJbIR+NzVu1qi3AbVfkIbTVHKXlg6eAmELyeojUxXwDmFGO1AiMsny8dn1Q8UYBo6UL6r
X-Received: by 2002:a05:6e02:3485:b0:3d3:f4fc:a2a6 with SMTP id e9e14a558f8ab-3d81a3891a0mr1565925ab.1.1744822917303;
        Wed, 16 Apr 2025 10:01:57 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3d7dba78434sm8413445ab.12.2025.04.16.10.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:01:57 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 7634C34014E;
	Wed, 16 Apr 2025 11:01:56 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 6DE98E418D9; Wed, 16 Apr 2025 11:01:56 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ublk: remove unnecessary ubq checks
Date: Wed, 16 Apr 2025 11:01:53 -0600
Message-ID: <20250416170154.3621609-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ublk_init_queues() ensures that all nr_hw_queues queues are initialized,
with each ublk_queue's q_id set to its index. And ublk_init_queues() is
called before ublk_add_chdev(), which creates the cdev. Is is therefore
impossible for the !ubq || ub_cmd->q_id != ubq->q_id condition to hit in
__ublk_ch_uring_cmd(). Remove it to avoids some branches in the I/O path.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index cdb1543fa4a9..bc86231f5e27 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1947,13 +1947,10 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 
 	if (ub_cmd->q_id >= ub->dev_info.nr_hw_queues)
 		goto out;
 
 	ubq = ublk_get_queue(ub, ub_cmd->q_id);
-	if (!ubq || ub_cmd->q_id != ubq->q_id)
-		goto out;
-
 	if (ubq->ubq_daemon && ubq->ubq_daemon != current)
 		goto out;
 
 	if (tag >= ubq->q_depth)
 		goto out;
-- 
2.45.2

