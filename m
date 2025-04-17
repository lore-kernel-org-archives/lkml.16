Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296931DE4C5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850753; cv=none; b=dM75NdLmSeJcCPDmM3xXguPaJjdmNtuQotGACbpAbWJHMjIL4uANNvthu/6u9H0jZ2q9caLao6lcHKKppkh3nnIgz8BP9cQsvhoiuMVoiZaSQwqgdWZArxJX2YpqjmqWZuWcHmVRjv/zzPR6nXe0nUDCQV0fQtyXq0V8zfDqT2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850753; c=relaxed/simple;
	bh=3Tspjz7wxGyMD0ERoZ4OefpIVgysaEDnq71Z9+37JeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LibaPyLJOQuwcflftItC7MgPpffuDq7gLvplwD4xDKVWvJSahzRMxkK28HKuHUV3SuQLwngJ2Lgkqb40eL/YedVx51l51yPHqFTT74DxS7VU2g6AHgx1BX3LrBkTDaMFt5NrRzLXlREBi9Tqg9i9yd0eVEuwTYbJ3bwDdTjfSYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=JCQRkk5h; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="JCQRkk5h"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-226185948ffso2660755ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850751; x=1745455551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx5EY5NNpPB6MvS87zqGMc+jEI/M9Fei5OKN+WHLkj4=;
        b=JCQRkk5h7EacTtl6l5xEboPfEdSC8FbAy6pCyarPIoMokxh+keGXcCm9W4bejWmYa0
         aMyHOGpaLvdwdplxKS/W2doh+9xiJdyVaqRPp9mYCRhKX30L0o0WKW8EdRrYhvcmpw3Q
         632bEt9vGsx6ZIzm6AFJkCC8ASW4tcDrJk+8ZOacYk+ckbiWGR5lM7SOj1CyEhQx3f6z
         xVFH/KFl3or8h2qveTcopL7GzfbD7+aBeKaLLKinl+VL8EpfWInokN04bI8QgGtLCXZo
         qJLzcGRDEKyauWJDKSg9cmFOivFSOlUVUWo5Y9nbP0OjI48U9u+wp2E/fOLRNabq/6tA
         Aqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850751; x=1745455551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kx5EY5NNpPB6MvS87zqGMc+jEI/M9Fei5OKN+WHLkj4=;
        b=e9g2VSa9jusRS0Km8r61buqxHD9rLix57S8pJHRYS9sEYjPKPuO5usJ59EgFoLFpi8
         /i6DKifge6s/5r8RTlmaCLsPanuORLYoPBHjhuquMjuOZV2HBOQzAafSmHuxNrKNVsN/
         upTDUUMmqPP/rpuzGjHaKS5K+o8TCpZjxGGDB+A7yXvv/7oulV6pMJIsMy46mVYELISs
         Su+NhK2vScoK8PsnlYakAVtWzGTO2iP/dBe48rx03QSMizYAVzCDhbE3/LYbzXkftwek
         ZOfixK/SBk7b7HUenplyd1b34PdBrO+Weo8rmsnGXutBM0pSZtTdRq+dZS9DlIz2GVRM
         9CFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVonvIQLRoy8Gn+Fb/vS4iWZuxFohNyunIWLYbwkD8IMonr2oA7EGwnfa2uEDlr5bJaTT/BmKbb+6cqPbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEFHWPQ8UvIlzioicFY/e4fV5MMBi2QnLxBfArbXTkgx7DrPRZ
	pdfCcaonlCNSUk+cfpt21k+oYSfSMVz/XO2QAtakwnRWwaDTCuGTuvnLhnbbnw==
X-Gm-Gg: ASbGncvXW8AmwGVvKmpiC1Ej/fMbYFd9aHRp23ybkp0TvoRahm1JARqauMNOTrhojtH
	Jeid/4c2C7AfphmqCWK5nhEwvlCUwjC6k7MRelkcd/ajmUsvhKZoG4BG+GlXU3gFUUYmbwSegCz
	wx20TMBf79/fIAY/CtMdRapr/mze1p7QVJHgqc9ylNebK0JaRjYeI8mAeIvXqzSh+CLXCht4Jze
	y1GaHIvyY3QOAPTGSTUsCmpO2VFO0ZQ+ZIzUkpo18Cx7waC4qIEspmtiuLe23FiD8k554MzoiYm
	8iPjcuiXIXlEpmtD0sSFvK8Okj5o2VmIF+0/8E6Gp6ZHD3RENUDuhQ+/4/aL+dBP3auvH8dwuL5
	ikq6HvA==
X-Google-Smtp-Source: AGHT+IFVMDhBoKUlfjJRZUEokbTKsReFRGjGofLVuPnfwfSJ0jFbSb45nYAchbm7ksrY+mhhiMn0wA==
X-Received: by 2002:a17:902:e848:b0:220:ce37:e31f with SMTP id d9443c01a7336-22c358d9b59mr57562575ad.17.1744850751704;
        Wed, 16 Apr 2025 17:45:51 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe4cb9sm20938975ad.211.2025.04.16.17.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:51 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 12/14] staging: gpib: gpib_ioctl: u64 over uint64_t
Date: Thu, 17 Apr 2025 00:45:31 +0000
Message-ID: <20250417004533.86765-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u64' over 'uint64_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 2d2a268d8573..0fed5c0fa7f2 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -18,7 +18,7 @@ struct gpib_board_type_ioctl {
 
 /* argument for read/write/command ioctls */
 struct gpib_read_write_ioctl {
-	uint64_t buffer_ptr;
+	__u64 buffer_ptr;
 	unsigned int requested_transfer_count;
 	unsigned int completed_transfer_count;
 	int end; /* end flag return for reads, end io suppression request for cmd*/
@@ -59,7 +59,7 @@ struct gpib_wait_ioctl {
 };
 
 struct gpib_online_ioctl {
-	uint64_t init_data_ptr;
+	__u64 init_data_ptr;
 	int init_data_length;
 	int online;
 };
@@ -134,7 +134,7 @@ enum gpib_ioctl {
 	IBRSP = _IOWR(GPIB_CODE, 18, struct gpib_serial_poll_ioctl),
 	IBEOS = _IOW(GPIB_CODE, 19, struct gpib_eos_ioctl),
 	IBRSV = _IOW(GPIB_CODE, 20, __u8),
-	CFCBASE = _IOW(GPIB_CODE, 21, uint64_t),
+	CFCBASE = _IOW(GPIB_CODE, 21, __u64),
 	CFCIRQ = _IOW(GPIB_CODE, 22, unsigned int),
 	CFCDMA = _IOW(GPIB_CODE, 23, unsigned int),
 	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, struct gpib_board_type_ioctl),
-- 
2.43.0

