Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D3F2139B6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178373; cv=none; b=c9ygceQCN/bcbUq+I2x8EaaY8JePmnbD5PouzC9fNptAz3cV+q4RCxN5kRludvRzqRLwctlm1arxsXgpBM8RXWv5wk7rCALpmRnFvddYH8uRRFjEYF2AdL1bwJjHw5TWWJ/VS5L5BfZCyR960SWXEs7uw4yN/Yab06otzL5KT98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178373; c=relaxed/simple;
	bh=aXPhtRhaMr1ilREq00flcnfwj9TVbFWLuAjTzeOl85U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h088orupGJO3NZeuwy6yaNy2NmhwuUdh6QDkff9ww+v/Zpx6kQv2E/V1/O8rI8Z0bzMaLxk4J46LT2uoIo0Tepe4GamGbczGKGRcrv/FI0mJaS6Zekb6cUg2+HttGL18Rp6p+tI1HG5fSbEJf6eYDwjpfScPlVTv8MtRveVPD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=YPemqJjM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="YPemqJjM"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736b350a22cso5689165b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 22:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178372; x=1744783172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIu1dXNTYwl5r+9cV5uhg1+tHlwwvRGyoned6m5udoo=;
        b=YPemqJjMqb2Kn2T3HK+Wkw7bMyhQQxFH5TupOzPFQTX0v5mEyMkyqAixw/avzdurTH
         Uyantcv/wnQBJiA/3goJifIxOReZjS766R9RvqljjtV+dlGSqJVjhIJ/Bl4eVEr4K6Lc
         NB/6DmaKQf5sQQbRJ0EZUBL/9HvU6mOtZ6Qe42WfHb63EtSuXtrMWmok+dHtnk+GnWT/
         VS1wKD/0vrNQiRGOLHEk0RX3N+ua3mprMXoQt8S6ME0TgybY1rZrrCHxMcWD5OA56LaZ
         bx8k+t7+H/hSEmVfcq1R5uFFsHEYpVdED9TM60Ce4Vok9Bci3o7OGnwnq+5uL9HxC96V
         nMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178372; x=1744783172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIu1dXNTYwl5r+9cV5uhg1+tHlwwvRGyoned6m5udoo=;
        b=moUXptgc8FdDcJc+9C2OGpDngR8FexYndIt7o6OsOfJJE8bescWzn5U7KyI9CFm2Mn
         6Z1edpqKqceBVqewaqP9KUyn1Ep8xr55b1EEmfjUqLmuYX9R0TVsxwYP5qxVEKMNyIPO
         j1qL3S6x5YbXVBA2NbOJw1Cm2O7XYhDLoAl3ctMkBOhQJCTK6n3Juz8i0rsH0ifkSf4a
         2tgfAKDo8FlTBQo59iQxG52q/tTntHK2W/Yq3AlkDXE+KN1R5KNSsfWAitTX836tcPoa
         SCNBYmOf1P1fIPnKkBOMW67Ogj1+xi1mhqsH9qs0JJoGzqb6u8IR/V6AhqfsIehX8bRf
         EKYA==
X-Forwarded-Encrypted: i=1; AJvYcCU7EvTDfR1zkknHHdmzPupsHw3c1bvTjc/frdbQIHkP5q6LSaenPLtxKK/UUR8CYNIKdXQnHuy137GOfgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YziplLtfxUZOM8UHWsyEbQ35gL5ODwydSHDzIgT4ce2LFWUgjGQ
	wvHBtpCp5WEzfNz75cMMMBUJyLi45wq3Zg1fcks0ucp76lBUn3wUcRFNLYcxGPzCxDm8h2oE/OE
	=
X-Gm-Gg: ASbGnctIv4EVYEplWGhasJPSoRNPJG5mVwAun1Bye7tFE6rg5IYjoQUYi0VvxnOp7GJ
	GY2THIWVc9XPPM903W50YdLuJnayVX9XTJed84vRfLUfJO7egmCQAl9naGSOfWGPo7A7lCiqgTT
	E3LX0VzjyjUo8tjB06aaq0TiW92oAgtRhx9OWeZUHEaVJUvVPBalnmBDkVad4/OZMpm3EAznISz
	4561tSAtUAJuXJhuwhtdiioT/CygWU9maUz4jcuu8e9SsncVpC8WDEidaZzEHu9hABPe/TudFFS
	SfikwoDCKNzi2C3eWEw1SYmzGkiUhx94u3hqn3J2h6JqSz6N+l7u3yzGX9isgDt34hv0AD8Htuv
	pPkhdTw==
X-Google-Smtp-Source: AGHT+IEo/rej9w7R9G6fsBL4lZri+tY36Xc58KKxG1xuULe4YRg62fI+jLm3m+YZ4Z6XWF9E9BAf/g==
X-Received: by 2002:a05:6a00:39aa:b0:736:5753:12f7 with SMTP id d2e1a72fcca58-73bae49574bmr2559782b3a.3.1744178371587;
        Tue, 08 Apr 2025 22:59:31 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d516e9sm430158b3a.44.2025.04.08.22.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:31 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 21/21] staging: gpib: local_ppoll_mode_ioctl_t now short
Date: Wed,  9 Apr 2025 05:59:03 +0000
Message-ID: <20250409055903.321438-22-matchstick@neverthere.org>
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

Using Linux code style to replace typedef local_ppoll_mode_ioctl_t with
type short.

Adhering to Linux code style.

Reported by checkpatch.pl

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 4 ++--
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 6a92562ae39c..7d0c03ebe624 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1718,7 +1718,7 @@ static int ppc_ioctl(struct gpib_board *board, unsigned long arg)
 
 static int set_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	local_ppoll_mode_ioctl_t cmd;
+	short cmd;
 	int retval;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
@@ -1735,7 +1735,7 @@ static int set_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long ar
 
 static int get_local_ppoll_mode_ioctl(struct gpib_board *board, unsigned long arg)
 {
-	local_ppoll_mode_ioctl_t cmd;
+	short cmd;
 	int retval;
 
 	cmd = board->local_ppoll_mode;
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index c66b8d59a46b..e903ec1fe274 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -107,8 +107,6 @@ struct gpib_select_device_path_ioctl {
 	char device_path[0x1000];
 };
 
-typedef short local_ppoll_mode_ioctl_t;
-
 // update status byte and request service
 struct gpib_request_service2 {
 	uint8_t status_byte;
@@ -155,8 +153,8 @@ enum gpib_ioctl {
 
 	IBAUTOSPOLL = _IOW(GPIB_CODE, 38, short),
 	IBONL = _IOW(GPIB_CODE, 39, struct gpib_online_ioctl),
-	IBPP2_SET = _IOW(GPIB_CODE, 40, local_ppoll_mode_ioctl_t),
-	IBPP2_GET = _IOR(GPIB_CODE, 41, local_ppoll_mode_ioctl_t),
+	IBPP2_SET = _IOW(GPIB_CODE, 40, short),
+	IBPP2_GET = _IOR(GPIB_CODE, 41, short),
 	IBSELECT_DEVICE_PATH = _IOW(GPIB_CODE, 43, struct gpib_select_device_path_ioctl),
 	// 44 was IBSELECT_SERIAL_NUMBER
 	IBRSV2 = _IOW(GPIB_CODE, 45, struct gpib_request_service2)
-- 
2.43.0

