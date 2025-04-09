Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE8E1E0E00
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178356; cv=none; b=P5QtfnL6L6l8IhEfeaWBgERxvc4d7J3QUINIPWCrXdwLk95aoXWTuluDYOF7rC5cdlEtzDd4e57eYhJPZyPS8eLcJrLkJpqARSATCu6rGZOpXW5qD//h9ab52l+539InDa/HirDgcitCH48Ao62PduVLPmR/VvobCRuF3MFiCzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178356; c=relaxed/simple;
	bh=lTlngZeohT9fdDdZ+I8MYc+JvGejyLtyZin/uCn499c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YguxmAKMTfiHmRAxqcazScbA1SsLCshcnT63ertyj373zs7MOAV24umxW+0Gy5n3Y8JnGYHzYj318/N4/ShwRqSrsbAk1Ow7w6xHVEmTZ6m+ucaIEy6miLpCeu/I2UGFh2/5LdAWrGFua4dXiOynJfyLaI5LOXz38gy2FHUy7g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=RYmMrv6A; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="RYmMrv6A"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af5cdf4a2f8so4692491a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178354; x=1744783154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgVArUjmqQF/mOeS/jCzJyhUSciVAhmS6WARTC27SMs=;
        b=RYmMrv6Ajxs9CNVWJaW3/qPPnNU7d2b9HP3QBQqpSqSWJrW+7q7eOVV5Ou5TihV9/N
         MlpsdDvO4PKsLSccSNR8tbYM5Wu/NDiUaPlHfDNIHstREnc1NmK7pYduoBLUdACEe371
         rAlDaJxqLjiGKC1TeGsVmD55IAOVMOUUZXmE2TD+krLDpwkUd/vardzte4B0BTfuVAwo
         M/JWkUInWP5Q6FiNQJX3T9VWtWySzOHGZ+6UULLppdKBGukeAt+lTfbHpeidaa2/xY7d
         TxiNw5ZnZeQCxEaJuwGBKZibeVIhiqjbrs5MdAAixw0lZqEKsTMRIeLzGAijCc+zsPo3
         oxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178354; x=1744783154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgVArUjmqQF/mOeS/jCzJyhUSciVAhmS6WARTC27SMs=;
        b=XcnUUSVFulMc+x9Av8bL6wICVCRt9/3zGdlpTfRHPL7bDYfE2/45qmMbKUrjPjYeIP
         OHBcP9u2TI3i/XU0iqklX9dOiNvai0fsUOmf/+b3C1rC1HTrfsBnn54Mv4ilYK8IstpD
         /t5pJ2nlzRCEOusHHBHIZiQQ5tJVNcvVB0AA8Lz4jpumQ8Vt1wShhSA0tmQ6U3odGp90
         +N5M1HEaskEg7ISYvbupL1/j++GZOmYiEhP1VJpw2puYbp0Ien+nWEpArV39US1FZB+F
         ziYbUQmzt5bPsorzBeGFow53VeNO6hDXW4d7my8IJq13wM+7eLJ6GhmnNltMEi9SFbYI
         P3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCV7C4HrXCBCWIlq7mYGy1SNAH70PgIrspQjhCK17N+wr8OoSC4c6HWbY5k7LTeY85gONLu511H1wQdggOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2jgEWpKK4RHacOSotQBjSb7BAVD0rVLI2H7Llm59yPDOPoRRR
	OQ6KQ4lMQUr8M6N7ORFzvUzDh/LaT/ULtKCSQKjMxXSzxnhVAzs4sQC+XuEq3g==
X-Gm-Gg: ASbGnctSxx3gU5L/GzZIJ1dfHdd7fX/Q0T7fNQb3rFYEAtmUllyufUjEZwPeFofWNgI
	taodDItSFvL0HFrGKN0jaTKLFoLEo17UZMh1od7GbBAaFwlxkAr+LQPgri6uZYJ9xe6q1NLatMA
	BWfik9MYFvsy3EA+Chm17hzthFveOdeNEJ0fXjrjE96p+yO4R9/4fy3E4lyX/Hep1vbVeUHQQJ/
	TprlPZolRNnORFgO4mRXU1fh7MczP2lJmFBYztzFr6QRh/9am0yAnn0/6C9jgEeQdemFHmTwDHD
	JcSPQISeJvJmpJuJL6Fx/UDb9bdzjRZHt3dggYa7P/v15/qbS47B8b8sXWYddDHf4TIG1mZ1zRz
	bcMyrHg==
X-Google-Smtp-Source: AGHT+IHd+pzcdkjTbsAfnivLAC2JMI7PBA0a2cy6NXjGw1Py+x15ZQXxHq3GPkADOewRWkCU3EGd8w==
X-Received: by 2002:a05:6a21:2d05:b0:1ee:b8bc:3d2e with SMTP id adf61e73a8af0-2015915587emr2657905637.8.1744178354603;
        Tue, 08 Apr 2025 22:59:14 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e68059sm419768b3a.161.2025.04.08.22.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:14 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 07/21] staging: gpib: Using struct gpib_wait_ioctl
Date: Wed,  9 Apr 2025 05:58:49 +0000
Message-ID: <20250409055903.321438-8-matchstick@neverthere.org>
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

Using Linux code style for 'struct gpib_wait_ioctl' to remove typedef.

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
index bbf8a60978d1..6d0191c9f730 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1311,7 +1311,7 @@ static int serial_poll_ioctl(struct gpib_board *board, unsigned long arg)
 static int wait_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg)
 {
-	wait_ioctl_t wait_cmd;
+	struct gpib_wait_ioctl wait_cmd;
 	int retval;
 	struct gpib_descriptor *desc;
 
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 3f32eceaca93..71c5e3d020bb 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -47,7 +47,7 @@ struct gpib_eos_ioctl {
 	int eos_flags;
 };
 
-typedef struct {
+struct gpib_wait_ioctl {
 	int handle;
 	int wait_mask;
 	int clear_mask;
@@ -56,7 +56,7 @@ typedef struct {
 	int pad;
 	int sad;
 	unsigned int usec_timeout;
-} wait_ioctl_t;
+};
 
 typedef struct {
 	uint64_t init_data_ptr;
@@ -126,7 +126,7 @@ enum gpib_ioctl {
 	IBCMD = _IOWR(GPIB_CODE, 102, struct gpib_read_write_ioctl),
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, struct gpib_open_dev_ioctl),
 	IBCLOSEDEV = _IOW(GPIB_CODE, 4, struct gpib_close_dev_ioctl),
-	IBWAIT = _IOWR(GPIB_CODE, 5, wait_ioctl_t),
+	IBWAIT = _IOWR(GPIB_CODE, 5, struct gpib_wait_ioctl),
 	IBRPP = _IOWR(GPIB_CODE, 6, uint8_t),
 
 	IBSIC = _IOW(GPIB_CODE, 9, unsigned int),
-- 
2.43.0

