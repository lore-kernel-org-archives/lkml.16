Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DAA20297B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 23:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745279205; cv=none; b=FtTxajWkiFhVw1xJpo3EwJYOiXAiMZ2smZKCtUc5hJWRRl0XEai+TmAkM827SVaiBLNHj13hrI4AFzWJ72vOeruxhdILc+vHg26cOat2CVGPhxUWMORcqOlAPrrhHVQoB3GSJft7Fv6WgiyW9qQYM4yAvnugtt1VRM9J9ym7RMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745279205; c=relaxed/simple;
	bh=rlM5Puc742ThpcgQ067dYu6MUOsHaKZ5wRazdAOJ7Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LTvoPfYALsNEn8jwXFeguXCZWrTHublQnkB+DP2wPRxJkXULOQfZVsl041aX4E9kDUfdkcsgUniymotz9iq3ixCCFXf7KftpSRCBRC2S5H44h9VS80UVwgitHJnCu7Oc2yGEo6uXayBIB/+iFG4WlJZStKtgXMGZHje6rCh6cPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=fpkIYJ8F; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="fpkIYJ8F"
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-7023843e467so36604507b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 16:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745279201; x=1745884001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dixiQ7kYDqakidw0Gdvn1/XcoLDGmQ+tbTNuOpmWRKU=;
        b=fpkIYJ8FhBh21KrfNybmlB8wyqccjr2Pr2mG+AVjVZTzOoX7F5B0rr6nzg1Dn/xtXj
         m3mQMV/E4+VTtOa3fD0s+agtk18tHps5a/04bwGSmDNHEsma6Uv8tUswxzdd3k5Xnsxo
         YEnrOUGozPSFMimp2SQbYHpwXd4pZJdEf56yuBIOq8NYxdA4Zx0RuwF0jaVHs3frmkBx
         7hfd5Zoj++z2OFDGnthx8406gwOLCgSSSsu85qO1/PcJTJigiTwz7Uf0hGTL18infDHZ
         66TAKB/70JnBhD1AYM+2VWBqcZpYGdROVQwsYs1MydeMrMFd1BGcl0zy0sLupgsIphKZ
         akIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745279201; x=1745884001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dixiQ7kYDqakidw0Gdvn1/XcoLDGmQ+tbTNuOpmWRKU=;
        b=hjqTivBjxeqvtcrUm1vlJGU4GjYX/KwjWfHgre5EqRombxI1w3ErZ/2eG7+86o5idh
         5S8fopani2zksZ6t0epNKwgB6PpHnf/3UNn3FBEUecQ64OKKhJPc0oOKsP7RoDTPajQE
         0eaxzvLI8ymgdcgLFVc0PXu5g9y6G+11HdKnCauWiH0J4jdjjJv8znAhdNnooiIZd3oD
         dBaX2vqKxWZcfHrVR+Vs5By7Uk07TcjrAVXgrNZTnvdCHv8we9V/jDQHQYy01UtXFSnx
         9zjwhXurDJOy40N5lb8d3d1HnyKKR2mCdTFOzUOXQkDjdoMdU495HCp9hyHKkO2YjF1j
         sIww==
X-Forwarded-Encrypted: i=1; AJvYcCVDcEfbUidIvqWxy9WtbibDw/rn/5iUHFXQvlwTAm4SxLYQjaCA3adJPhTFBmG+J6+bsRs/4TrLjHP7KUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdZCrNk2NFua81kroUpQMZaxz70i8FIGCBSzUJb4hHuloqPk7C
	syUVg/g564WFhiDG+OClH3URz0TCpEORZrzqHcPR1ynq9/IwYUgJ6WngE7Jz/MqEsv3ijxau1dZ
	WkEzALv5/oDy9Jjuf1f1SttoyUn0vvEHiL1dv+eh9blf/To0S
X-Gm-Gg: ASbGnctz6Eq0eDOcGEA2E/BgL1FcbPE5FqSKppklvxjJJqh9A1vjslJ1JG8cHU7wqtr
	PlGt7x7/tQtrIfdxM7JvoZfXFomGy+FSGHXsTaey+BNmxvel/WB7rMaKcWQZlYbty0NHTZzRVSe
	bGaar0V+Q+ZVG/9Ut1FpzOmbKVACUiofDM0j22boLdM7SMfSyTbS3YMjJAfkgdEIvmGaLbnDFhY
	MVNUqKN6U7k6TiiXt33oSNGsWOMYYh0B6Km/PO3nV+FYFGXtfszB0VSHAOtu7azJNUePJJC
X-Google-Smtp-Source: AGHT+IH/+2sl4eo/naMKs4X1CL86m5auDGUTr33kZ4p/FOCGe/jmKGV6fWxG9h3Xm6BheqPBSpO492YMAHHh
X-Received: by 2002:a05:6902:240a:b0:e58:3209:bdb6 with SMTP id 3f1490d57ef6-e7297db64aamr17178307276.16.1745279201577;
        Mon, 21 Apr 2025 16:46:41 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 3f1490d57ef6-e7295877fd8sm206033276.13.2025.04.21.16.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 16:46:41 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id EA3983404CA;
	Mon, 21 Apr 2025 17:46:40 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id E44CDE4055F; Mon, 21 Apr 2025 17:46:40 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Mon, 21 Apr 2025 17:46:41 -0600
Subject: [PATCH 2/4] ublk: mark ublk_queue as const for
 ublk_register_io_buf
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-ublk_constify-v1-2-3371f9e9f73c@purestorage.com>
References: <20250421-ublk_constify-v1-0-3371f9e9f73c@purestorage.com>
In-Reply-To: <20250421-ublk_constify-v1-0-3371f9e9f73c@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
X-Mailer: b4 0.14.2

In the future, we may allow multiple tasks to operate on one ublk_queue
concurrently. Any writes to ublk_queue in ublk_register_io_buf, which
has no synchronization, would then become data races. Try to ensure that
such writes do not exist by marking ublk_queue pointers as const in
ublk_register_io_buf.

Suggested-by: Ming Lei <ming.lei@redhat.com>
Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 drivers/block/ublk_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 57b8625ae64232a750d4f94e76aaf119c28f9450..a617ffde412936d3c37a3ded08a79e3557f4f56f 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -203,7 +203,7 @@ struct ublk_params_header {
 static void ublk_stop_dev_unlocked(struct ublk_device *ub);
 static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *ubq);
 static inline struct request *__ublk_check_and_get_req(struct ublk_device *ub,
-		struct ublk_queue *ubq, int tag, size_t offset);
+		const struct ublk_queue *ubq, int tag, size_t offset);
 static inline unsigned int ublk_req_build_flags(struct request *req);
 static inline struct ublksrv_io_desc *ublk_get_iod(struct ublk_queue *ubq,
 						   int tag);
@@ -1918,7 +1918,7 @@ static void ublk_io_release(void *priv)
 }
 
 static int ublk_register_io_buf(struct io_uring_cmd *cmd,
-				struct ublk_queue *ubq, unsigned int tag,
+				const struct ublk_queue *ubq, unsigned int tag,
 				unsigned int index, unsigned int issue_flags)
 {
 	struct ublk_device *ub = cmd->file->private_data;
@@ -2115,7 +2115,7 @@ static int __ublk_ch_uring_cmd(struct io_uring_cmd *cmd,
 }
 
 static inline struct request *__ublk_check_and_get_req(struct ublk_device *ub,
-		struct ublk_queue *ubq, int tag, size_t offset)
+		const struct ublk_queue *ubq, int tag, size_t offset)
 {
 	struct request *req;
 

-- 
2.34.1

