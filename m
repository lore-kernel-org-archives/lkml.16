Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F0C2046B1
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 20:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738699989; cv=none; b=RAoJu3GWG/+SOZeOCTesrFClyX5CvTGImE8tMNQPvpHTHj0+IMJQt2d0pQ6/CtLQ+KS685axqm4adHCbsTnEBjbFHUhJYYEBI2yY9QW2GxO6KBT2jV3CbZA+LSZ0HkI/xPMl+Eu1UxmG2l4cXP8rtTh2V81gGTsFLrT0kmEfTZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738699989; c=relaxed/simple;
	bh=1Fz1RtUXPFobVz87/yFbKQq+ysQWBDo8vvhwHHfaRrs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pzAgN5N0S167gb83F3Z+BVkNDjhDsu9WAq7jOqVziKK6ueQ+oLdi5YaUspiFOQbYYYkWIrt9UQdAhbpnN2yqhiusLb3WUP0YbXllwFISAEZtSIqrwqB1u7upKwRT0eCNkcGv+RbYqX19HRQVcAEsSL/V9OE2EXVYFy5UGczRBx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6Wzsh+W; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6Wzsh+W"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso41778915e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 12:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738699986; x=1739304786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HcGHwBHCshi0yz2RQGryrnPpLkVHnABt1yCMpCIlUPI=;
        b=M6Wzsh+WTRF587qP8GdT+2iwOBJvtRvEo6z79F+TUYHT8kzrGU8rmrI+zuMBRQjjf6
         +47lTooyP3f61p6NqyaQ/f1dplSvin31R62Q+C/D9uL/9d+XhVkNkBYnmMaDRtB2x1jQ
         RgwMcltEU6vSvCXuMKyvYJn+nM8mnFYoPGTCmRYWBQyoMxsCGay4MWGKV9a/2jwoZFOA
         pp7nlXvMDDdPJQEEzvUKVXb1aVL1QwioVQrPUiYRMas9ispHjNmYkd8Ay+r8PHGpO8xh
         FhfU2w5DG3U/Ro00JK28qWVYStzXYi5Xs1CdD93ZLjjfU6zwTViK61MT5js27SeZMYXV
         IkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738699986; x=1739304786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HcGHwBHCshi0yz2RQGryrnPpLkVHnABt1yCMpCIlUPI=;
        b=f4yzApzGyCXHLwdGH/C1k2JGvDSwCxl8sbB36gXeWweHoz1eQKfc4kbUHY6yKmYFZG
         syC1jilrmZZx9T26/zMH7V0FGSD6Xt+fHjCTdowy3Unq8FWbEPQAUxKyvXTYMbBasO6s
         PUEjmWKYl1rtetVl/tFmWXi4lKmKtZljZM5zXdjNX0oQpX1z502CeRP732MaGzhTfWw/
         X0F5cOeKw5T6PupFrN941paDh1FivXIgvqBsYVcBTxTQUnnmsk18dNtMuT5egUNetr0j
         MaYNfJ2sbxIhzi+PZhLN5ulE/4oGyGKvyQ6qRmMI+M649dBvWmTi1lJ4mCen29ivnCOn
         DLNg==
X-Forwarded-Encrypted: i=1; AJvYcCUegqKf4spCNvkvujS0SASmSfdCUBKzydwPvvfnHTUyvrJNZO2x1J8HJbb2sYPjvRruKMPtIOq92p1S5SA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBtF2Dil+WirwyaXsjHSZI/9ERe+3H2IP8aUiOsYT5VuD6GURH
	HKHgQZfgNkfdT5QDotNL5jLIDi2IH+PrxCtUcAFRiO/hS2ojqHg5
X-Gm-Gg: ASbGncuz4mIwa/AfghXChk9u5J/jfxzAuUsQbhPSuE2saPYuG2e6DTjwczeLK3+7scS
	qLVPgZn/wU/v28kRN+kuVJ8J3zRQb7c49D+Nea5fuS8QZbB+98qvTesBtCX8EuQHe5m8ffydazB
	1i0F2ZGPt1Hw1q1GVqny/+4ynxjcHpsZFRN4pk+W8+5n9adD28FO83osG3aR/KZCiQSQiel7qWd
	8joR1tfTuyYqfcZmkMpIsOljr1CzinKJAl9M703kNG8IBt/5NPTdDH0KHRtsrBFrLHbQxnjKNYE
	Ypol3JLNLLEMthW8
X-Google-Smtp-Source: AGHT+IF+VeTop4aATnyPfAkPdoHSxOw+0vdvZweY1tHe4D5i9kBHxnC20VPCDG2dWEByOUtt71EIaA==
X-Received: by 2002:a5d:4e4c:0:b0:38a:615b:9ec0 with SMTP id ffacd0b85a97d-38db4966770mr74032f8f.54.1738699986048;
        Tue, 04 Feb 2025 12:13:06 -0800 (PST)
Received: from qasdev.Home ([2a02:c7c:6696:8300:f765:48ca:214d:7a05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102ac9sm16465093f8f.29.2025.02.04.12.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 12:13:05 -0800 (PST)
From: Qasim Ijaz <qasdev00@gmail.com>
To: james.smart@broadcom.com,
	kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nvme-fc: Utilise min3() to simplify queue count calculation
Date: Tue,  4 Feb 2025 20:12:56 +0000
Message-Id: <20250204201256.117194-1-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor nvme_fc_create_io_queues() and nvme_fc_recreate_io_queues() to
use the min3() macro to find the minimum between 3 values instead of
multiple min()'s. This shortens the code and makes it easier to read.

Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
---
 drivers/nvme/host/fc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/host/fc.c b/drivers/nvme/host/fc.c
index 094be164ffdc..4fd1669231fd 100644
--- a/drivers/nvme/host/fc.c
+++ b/drivers/nvme/host/fc.c
@@ -2897,7 +2897,7 @@ nvme_fc_create_io_queues(struct nvme_fc_ctrl *ctrl)
 	unsigned int nr_io_queues;
 	int ret;
 
-	nr_io_queues = min(min(opts->nr_io_queues, num_online_cpus()),
+	nr_io_queues = min3(opts->nr_io_queues, num_online_cpus(),
 				ctrl->lport->ops->max_hw_queues);
 	ret = nvme_set_queue_count(&ctrl->ctrl, &nr_io_queues);
 	if (ret) {
@@ -2951,7 +2951,7 @@ nvme_fc_recreate_io_queues(struct nvme_fc_ctrl *ctrl)
 	unsigned int nr_io_queues;
 	int ret;
 
-	nr_io_queues = min(min(opts->nr_io_queues, num_online_cpus()),
+	nr_io_queues = min3(opts->nr_io_queues, num_online_cpus(),
 				ctrl->lport->ops->max_hw_queues);
 	ret = nvme_set_queue_count(&ctrl->ctrl, &nr_io_queues);
 	if (ret) {
-- 
2.39.5

