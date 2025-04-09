Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610E71E1E0C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178357; cv=none; b=Xd5mBUw4s/6VFtYJK+2NmsXa4rEdKn5g5lBED6t+azKbVKCMOgm3FhEv+MFk8Cl1QQR/R9spNSGsLBJoC2jy7On3t5XS5GgWTPNup/0++ZdSDtdOkG5kUOpdHLLl1n3APIgLcs1o6UEouOc+QSTMFm+ERZxmvX4my2pVNnCh1dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178357; c=relaxed/simple;
	bh=/bZHTaMP6qZNG+6B+h6xZLBEPyyqDzKN3WknItrbwz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iv1BhTcc31Fps6rcj0finjyfNYq5uxdYZka8c3fJ8dV0qjn8vTNce4FLhUvAe1wzccqL3Ptos3vnDq63+6FG9szbbzvjXhvF7H0DwoL+UysrL8d8MwozuB4x/oxw81myq/Cn155xx/kV2kJYWwIz+gcr2/EpldsSPUMSLrLmR0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ftQFsny0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ftQFsny0"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7370a2d1981so5444316b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178356; x=1744783156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgSCc/CZI/7pOuwGbarGcJIHW5TIhb+Lwu6y3er4SkQ=;
        b=ftQFsny0UfwiNDRbSj6VYATJ28tLn2gwSQyWNHsVjvHWmH5nxzbAoCZ39LRAzK1qT9
         oDzkhG6AQPadmYBn5W6UR/6mxs+ZJ/Yt89K+kh4hU+nP6lin8ariatpNqxliqKBwDa0m
         2tV7TXlyxlFeBy7ZZ3aNZdliBuZgCR+ALvvguSSwl54xAET71tORPxaNr+BjD5o0LWhk
         yStezAuOy6wUAJj7BLmO9eaQ0ZbSGgITT7o5iLoJ+B92zVAkdok5dDAOPJ3FayTR4ULW
         XbI0zuuk5LZCwsmezbj0Ao9W8pb6FlnK/dLIOu9mr0P7jVmFrnPpzIsN5gDg5DPIjLOl
         ipwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178356; x=1744783156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SgSCc/CZI/7pOuwGbarGcJIHW5TIhb+Lwu6y3er4SkQ=;
        b=FVBoDLwRdBdInXyUJ9vUl1P1p7r3/vy2Hj8ndpOrmvKksgP+Js8CmfwI2rGdZRIS3D
         brgM2fkkVo5HkMbiYfhthdBoAnfl0Y1zoc3GrST/lmL/cnRUrK8GdEAM29rUllASaB/v
         txcqJbhOIWnePRH2Cr8og4/X0vXRIiDlbAqGfdE6i2OV7CfX3LFgnjDMp3PCAof0UF+B
         8z4LWolUq5OT4SzpSVnRDmxyKXfv3lNkmYI3y/v7NdSSEYrqUtC5AWYuOV1VVde24wZT
         KJq9NcIEwq1AVhv6pPNfwAXo8wUQvO0KEf6j9839WSbQW6XJaluINa99gifC2flhrgSJ
         fV/A==
X-Forwarded-Encrypted: i=1; AJvYcCVTPHlneMu2pqUhmt5FnnJTkfDf1h8EniyhOt3LMGr2q8V5BkUWfbvzGy2ghxpRDLdumsZho/jw/RhkjFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCk0txrF/jDdkIZ0UI4Oln2kUdDroKcw3gQArxUk65Wps2nCfS
	2q9M0zyozYolWTfhcC+H3PfZPNypXZNPgxJcvhcQu59fKFogxzyegUS7PSZvmg==
X-Gm-Gg: ASbGncstAJl11ZQKtphfuLUcfe4oQ/IfK6EPlQWF3OAKEJamlCOTPj5Uz2HGu/Dp4KD
	+Yg8RuzC6p/HheumKoNSxjxMDnE7VFe91jCW9efvnrukVkavXD+ZnHDwKfzjlBGE+eDA8jrpP+r
	lpkkTqtUXk3Hx6goP9tXGjlAcNX5VOSC6pl6pVl93vJ7QvhHZCNIwUU1BMXoNpskEF91E6JnKGt
	kldCjVZHia8JC93XzUHTl/kqfKOOrSY7VsWXkKbsKgZHTiYeJ4qbqYnSI+0YTgF6t2zeIF58w4K
	8Fas2dxGK7PcZA0Z0kYD+BURGvSyPQ+KE9bNiyShIHeKxQU2S1nwjBr4FenH8AR1PR1VBxOaAtZ
	oOVJovw==
X-Google-Smtp-Source: AGHT+IHDsKQzq+kRdRhtw0xx+ABY5gFAKYBsxmbvMxvH7JNhzPz2aoKQbOSByQbidAktAYZGHjSkpQ==
X-Received: by 2002:a05:6a21:3943:b0:1f5:55b7:1bb2 with SMTP id adf61e73a8af0-2015ae8f9c7mr1881092637.6.1744178355797;
        Tue, 08 Apr 2025 22:59:15 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e5171dsm419092b3a.153.2025.04.08.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:15 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 08/21] staging: gpib: Using struct gpib_online_ioctl
Date: Wed,  9 Apr 2025 05:58:50 +0000
Message-ID: <20250409055903.321438-9-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_online_ioctl' to remove typedef.

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
index 6d0191c9f730..b215521d0ee5 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1353,7 +1353,7 @@ static int parallel_poll_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int online_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	online_ioctl_t online_cmd;
+	struct gpib_online_ioctl online_cmd;
 	int retval;
 	void __user *init_data = NULL;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 71c5e3d020bb..dab170b09764 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -58,11 +58,11 @@ struct gpib_wait_ioctl {
 	unsigned int usec_timeout;
 };
 
-typedef struct {
+struct gpib_online_ioctl {
 	uint64_t init_data_ptr;
 	int init_data_length;
 	int online;
-} online_ioctl_t;
+};
 
 typedef struct {
 	unsigned int num_bytes;
@@ -158,7 +158,7 @@ enum gpib_ioctl {
 	IBLOC = _IO(GPIB_CODE, 36),
 
 	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, autospoll_ioctl_t),
-	IBONL = _IOW(GPIB_CODE, 39, online_ioctl_t),
+	IBONL = _IOW(GPIB_CODE, 39, struct gpib_online_ioctl),
 	IBPP2_SET = _IOW(GPIB_CODE, 40, local_ppoll_mode_ioctl_t),
 	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
 	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, select_device_path_ioctl_t),
-- 
2.43.0

