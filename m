Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD19F1EB18A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178365; cv=none; b=aq0wIN/j4yzUFmKNf7ozXyXL1fccokLfiun0MQmLvb9A8R4rep/CStbrnJXX7QPZGSJGsfVtReq55w5tCt0ZyWeh1yADf0aDQY7+DiNRceobsOfAE8vSFxdpHzIGlXxTKdKanwRSbRGo4dIg08z+7KXYCKKgky+UzyB38q4BhUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178365; c=relaxed/simple;
	bh=ZmzFQ/xDAYCtwqpaLt+46DJGxSnTDxWoxUjN5RavIDc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ny55L2SlwTljjMipELm1bb91E6K8CHn+sNknB59pO8mh9RpeAuCAuLbLEsVNP79/P/ziJCXworkForLC2K6YqpPgF89QObXgkfYrxoxgEuLsnE8S/rGjE0mkCHkH13BXUpbwxjv5hPCLDhFxbOby7o4LQwZRmogCWh9GpzAgNEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=IpGX6D2w; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="IpGX6D2w"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af51596da56so5203262a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178363; x=1744783163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5h5ovOyfAn7yPEFX4yOHA/j00T0uqSAm1ZLyzSebNBQ=;
        b=IpGX6D2wg1YCy9LbSz4MayygYxD9UuwhzaL7fKiFCOY+ijy75ghYrH30ZktyI4w4xI
         8hEQtlJrUAB8OID5hZXVtHJVbd3l0LkyrDsR4gfQmgCkPqY6tMFN6TUEIDX0LQ68Ira4
         kQefTlxo5jW2Ace7ERuP7O7+1s+Jm1ok2+fFJdkFDPecW+BHzJDlbkL/lgqzmB1omv6F
         CL7dzNx29OA1RWcd3wKh7kvnzW/LxYfD1Io7mDK0QSSL2TmO6Qa8ad5ZXrSs+XqLqAbW
         xRpdbot8AajXupKuqNb9KEibt+gx5TWO5I8bnRnRxt6kqrwEvwI2pwDSqhf4f2dLq1H0
         /0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178363; x=1744783163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h5ovOyfAn7yPEFX4yOHA/j00T0uqSAm1ZLyzSebNBQ=;
        b=Is0EY+2OYVMPveQqi4i1JFFYbUJWH/bzM3N0almq7lFPVWUDzuxvgIs9qNCOqmyXNb
         1l5/czy3dzo/W5VM4xiOCl+bCiS6EBGZQUxpDO9Xpoa85PlhmnPqo+sXUqaAlk/SnjBa
         QF8eiC6H0Mv0y5s/rc7ly2Hl+cO09LDKWTZFRJaHJerxM5GJJVCYJWkJ4Ij6alvDFbZu
         Dgda/4YQRXqnTQXaVNH+ggGJyKDyXuMUUKX3yUrA2NVQOUcygvQUehdangyDBsmePf+B
         i7Vj2Nm9z1lvl7Vvr3DwYDkjdKA85cHgJwmiJwx5dE8vSeieKI0lLib/hB/jyQqfmNYV
         GzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUmD5fCSWSa/MUrPc6VGdpVseRh29FpYydKnXGEBHXQVupnBCjTGxnwnEndYvGcjMDWFmC4goG2DtHyH4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9wgQdniQwk19HQHN478ZI/YplyUC8N4rb3pbdNYlcJqAYPB8W
	17mifsu2FZ/9x98lo8jDgqRuQJOV/mTygOQvFQpq/a619VPrdTBiXAqNJZ+8rA==
X-Gm-Gg: ASbGncseCm7IUBDU+6pM00s6DevpxLnSR+EHdefqdfzktLwIsSpeX7bFrTWp/pR57qR
	nP/iMO+TwnopFN9vwvOfOO0DiYKh5bVOwQuGTro1xVhgcbictHLLcG9vd8nhJf8En5m6gv1dqbt
	MIENK1JoUGOdu3jy1e4M4huC1Iu3d1SlM7eC1yePFTYYFRThTzR6/6ouorqccDSaga7HNqRMXgZ
	R7D4o7F5AIAHQWmb35Mw83Ppe1vFUmqkNCeVTGz+ve/iAQ4Fuq/V41uoCVzx/W9doPWBxA4gYIA
	kPW/ozViODYDNkPQm+cMu3oX5BBrWSklgP14GO4jtQweYa2it4vxf1OV0qxTpl5+I/ffbyOFH2I
	22mKFSw==
X-Google-Smtp-Source: AGHT+IHc7Q1kV8Kaz6yYTOBNqLkhj3FRON/2uBgtut0lF8Myn3iTAsf49vRKnNZyYcvyzb+7zZyJWw==
X-Received: by 2002:a17:902:e750:b0:224:256e:5e4e with SMTP id d9443c01a7336-22ac2991b3dmr21506375ad.16.1744178363105;
        Tue, 08 Apr 2025 22:59:23 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b2absm3486745ad.83.2025.04.08.22.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 14/21] staging: gpib: Using struct gpib_sad_ioctl
Date: Wed,  9 Apr 2025 05:58:56 +0000
Message-ID: <20250409055903.321438-15-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_sad_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 2fc93a3c4b00..8febd683fe0b 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1474,7 +1474,7 @@ static int pad_ioctl(struct gpib_board *board, struct gpib_file_private *file_pr
 static int sad_ioctl(struct gpib_board *board, struct gpib_file_private *file_priv,
 		     unsigned long arg)
 {
-	sad_ioctl_t cmd;
+	struct gpib_sad_ioctl cmd;
 	int retval;
 	struct gpib_descriptor *desc;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 7cb09cac6cd0..a0fbc660ab99 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -97,10 +97,10 @@ struct gpib_pad_ioctl {
 	unsigned int pad;
 };
 
-typedef struct {
+struct gpib_sad_ioctl {
 	unsigned int handle;
 	int sad;
-} sad_ioctl_t;
+};
 
 // select a piece of hardware to attach by its sysfs device path
 typedef struct {
@@ -135,7 +135,7 @@ enum gpib_ioctl {
 	IBCAC = _IOW(GPIB_CODE, 12, int),
 	IBLINES = _IOR(GPIB_CODE, 14, short),
 	IBPAD = _IOW(GPIB_CODE, 15, struct gpib_pad_ioctl),
-	IBSAD = _IOW(GPIB_CODE, 16, sad_ioctl_t),
+	IBSAD = _IOW(GPIB_CODE, 16, struct gpib_sad_ioctl),
 	IBTMO = _IOW(GPIB_CODE, 17, unsigned int),
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
-- 
2.43.0

