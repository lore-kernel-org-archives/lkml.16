Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591027D769
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222226; cv=none; b=MI4SGR30VVuu+UXjXaVNAeIcy9aSd/HxnrJ15OrnBDIodoc9nCYvmoa7d7WMpaJrY8XYFeXYa68PJ9AiGxr4EK8joDbT4RPkmCGcihi0TZr9Zqoh8lIeZsk71dOCV8myN24d5netj240bGLy8EjwNsQO75qE/L8dY/1BgBZGq7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222226; c=relaxed/simple;
	bh=3Tspjz7wxGyMD0ERoZ4OefpIVgysaEDnq71Z9+37JeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdDh8ma24sMG1l6yiLA6Phc+/mIEQOVWiOuvKNIHE99seMGpq32qsDLZvOV3QbDqmOkKFHJeBH/IHmz5WTPOrnD5596WKVqwoB0lx0cfGknY0Neh+sglz7kdvyLnhmC2sKwOW0NUpccchYXZfriujlDvUoDxtCbqqQYDfY9Zl9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=UeWXhA0P; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="UeWXhA0P"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so20353a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744222223; x=1744827023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx5EY5NNpPB6MvS87zqGMc+jEI/M9Fei5OKN+WHLkj4=;
        b=UeWXhA0PMiOsQYEe/aq3XZ/Jz0NwIcF8H7eyPO1dlTJhKC7ohS0jaZF1LIv8CMOetV
         hM1Q/v83SLv+CWr32kPLQdQRJVyN7PyDhwSwQiRCiTXGFOX0AwiBcXFibiUqsPjh88vK
         HpKpGJ29n3y25sfI97fa1OoQoIobRSqvCdvcHEXFL7Oc4V7o/6mEkk2ifSSdqKvNjc5m
         odWLLx5xFgvRpr5P2UV3K2gbxhqP8rAkIHTFYxCU4JW5Zd0VYMVmWMBbs2Yk0LbuiZCP
         w3lXXu2EZe9zs4+cS2OAEANqKA4wnh2HxElBr+NDfWvvzGzYMmgnHh+LZxxw0dPX6O8u
         Lukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222223; x=1744827023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kx5EY5NNpPB6MvS87zqGMc+jEI/M9Fei5OKN+WHLkj4=;
        b=e2WWsBifHZiELZXeXJFYIDEkhiOSI9k8EfGqQz7TgNjbV+vAzOFv/AIzqG93j8qoE5
         4juHY7dcVqD+HKa4jzCWpD+fkVTw0S89yrYSchgvhYktmZkKqvC++VO2x1rSSOejfhBi
         d2VKPGCZcT+LAG+PfYH/+R7XedzBl2WV+0QsQChjMwr4RfJ5LehvNvild6g8gQ3HV9nX
         pbrQd11XFBPwliHIduguj5nylmpya55Ymm7vpRtdwuOlXpn2DUeXaFsZCuGLg7N82bk9
         JW6Z6DRVe7hSoeDtjopCLEEgTiWouaIWxzx/NfHJ2bPe5WhkckVc/yogVt5e3/k+OBKR
         F1sg==
X-Forwarded-Encrypted: i=1; AJvYcCUlOLTu8psnAcUEii/WfR1sKV9MFQjuHyStLRrZ/DrhLcnRJ/xllfX52iIoieMviqrnZJUcMeyKnz8dJVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCwp20P3OryUA8T8FuVrqWZDAX6qcsPz65uZA5dJnxytL84IKL
	089vpoHIvp+XYABmL5XXtt8r7TEGbvg/YfUO0cPS9HNhiJ1fbpWHJ9LzhXGhMYSwo2uyRoJkHLQ
	=
X-Gm-Gg: ASbGnct3esfyIHyKFXAV973GzCIDwaOndRWz+5XIwVn17SkY1crTBv907ANVdrpw8mh
	4OMxlt9DL6i5nZqE4nkVg4OR5AxEfoWaEzEOxAsHTL5GUvVm4P4wQyLoOOsLk+N2s6jW14xJnOM
	Ti6vrv3qYwB5d6tUNoIE1ZQSPs35D1Yp7Y3FEHdz/RMQ341teKPBOYIFhrRiHuA+s1lLJp0uGgY
	tHhDzxL0nIeDa9kmjUnnsaUBteHSwDaTnOj0n9Nz1EM8AMeeKTGH30ziPZT4H94ykB6Whr3TeGZ
	WZt4EK6m2aOz7v9j6M0oBi5KRh/9AmnQs2kxHonpY6QlCgarhP7LJqzC+ftrADRvxFshL/WAbFx
	UINhwzQ==
X-Google-Smtp-Source: AGHT+IG6p1tZfFi8ilrumj+2WoOXmfGtk2AOoKK4B8lB22BJUdisIq1kvt7/UBFLJBTqtXu0iStG+g==
X-Received: by 2002:a17:90b:380a:b0:2ff:570d:88c5 with SMTP id 98e67ed59e1d1-306dbb8e6f7mr5021604a91.9.1744222223562;
        Wed, 09 Apr 2025 11:10:23 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10c42asm2163598a91.7.2025.04.09.11.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:10:23 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 23/23] staging: gpib: gpib_ioctl: u64 over uint64_t
Date: Wed,  9 Apr 2025 18:09:53 +0000
Message-ID: <20250409180953.398686-24-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>
References: <20250409180953.398686-1-matchstick@neverthere.org>
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

