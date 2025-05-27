Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17531D86F2
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 05:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322427; cv=none; b=S9jQ2gW0OvlT5vMXIgjv/8N/2ZaqM7Pj2NbqjxDOFrBMZ//25jlxLjL2xazA5gseEeI0oS7kqQ65RW5zYalDe0vIzDxjKEMnJ7GUqKPYo4i8UuOVFJyomsrl2CRWknMU/KsE4EaxomrT+FiPgV2x85Q2STMbo8qnHZ4nyax1crk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322427; c=relaxed/simple;
	bh=665C0A0ywPp7IQwAfzFBpxxX8o89OwjurlTcLpd1Ovw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=icXI1nl51lKyM8UOmu91ZJihGdYEKibc+C5JH0sk033M4G3Fzu5PN4Bq3DytgNulrRDaIG3A7Mcz714o/9euoWNxK7+xg90WsPM1e0EAslbvKZnNVapl9xtMSwO2WlNIs3DSB1K4dE9c1+owvDP4aju+D26XQTCsJ+0MroukA1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enPntvTG; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enPntvTG"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-308218fed40so160312a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 22:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748322425; x=1748927225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bq5EwIkXOrraR/5nVIEtjR45/z8eeDLu8nm16aEaZ24=;
        b=enPntvTGVDaJa1FM8qq5EwapyLiFIH6nl1N7r+BXG7ZmpNk8c5lWb5+4icehGUg01s
         cO92HDtW92ngc+iT0AIaMxDnpFVgLZv6BA4H5Hk1FoSCv6+zE4SdSmD7DYTFMJwc7tjQ
         09Hb7VxIyOsXuNPHBnE/23bEyDVmr1LCdUjGUlLji3QYL4cJBiee/L0anRrSB5W6r6U3
         wneU0q+Ajq8778s69Editsr5BG3jnVy2KP5SNSv0ocULBYhpQx2Xevw47zJz+m34PvGz
         9wwE9bDcGfFOWPJ0/Edn/u6jTbeFChmjeyTkDjdUx9gpIxHpazfkbafAxxtPAMVb/BuO
         gzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748322425; x=1748927225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq5EwIkXOrraR/5nVIEtjR45/z8eeDLu8nm16aEaZ24=;
        b=L/IazvCHarNnBrDDGQRvPnPK3XxOYxT1MSDI3Y7gWx2TZe9paY8+ZS3JB20621xAL5
         bTOTEnmGK7Xjmw5hVxjOeB5FK5DUhmWoOy6NURrmAr7DGZhPuvCdqPkQVTN3dti7sc3u
         9rbtEjnFOp4KLlQBj5FX4fikgwWZN+n3axcP9rDrLLHfYUYL+aDP0SOURsII1Vek7de/
         pEQpOvj83dxey86Ts0eYkRjBdTeVv44t5BM/nz8Flup2T2VgrCFcolgo0F1j+GefPCrj
         ga/HiH3mC6IDq1RxLFHIeEEjJcvlijtYPWw39sSaceb/YZ2a9oyzcbU/Scnyo4JLqSi3
         3JDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOD5dKXXDFpvJqIAYWRYXzQsx7Gz88HDDn/oKXt+bwaRY1tTD48BIX326nKeg2Mel54ltHPsgkBrxj/Wg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdcXe6zzz9T0tL9lzL0X74nM27YIvnueWd6vWXgRwtkFYkUTcy
	X0luZHxlpKxbvGPJ3tb2BoaoRwoIqTOo4JwFuM05qa79/im+YkWrIFj2F6zn6EEQciOjzqgGCP4
	=
X-Gm-Gg: ASbGncveIXRIGIfm//l9aTyOR57iWptsDkJEhtbeCg93YaAFjnu/K1ecFr8RdRJn7PD
	rTMPRptJ2PoWeZcsMT8odXNjdYN6inpDPDKAYar6UqBhIUMRk9TIMumVZWshf78NxTfhl2atYH4
	5osPvSHxIA7wiE9B2BEuW4F9XB+BSIxSmX8sdANdo6GAe13WTdN8UKLGTx+UuvIC/7UhlmrDMF0
	hfkxFwYKee9/K5/hlFV/wLGw1VFoZEm4jzM7UhJPLmJOQEydMetaSTN1PIt79DrwTAyhV915Vn3
	VL59iVCC+PCm8gem2K1t6m9xh180JXDq1r/psSYpTG0=
X-Google-Smtp-Source: AGHT+IG1ZpXlBdEq/GjPYtl6pc9EcGGLHPouogdxKALQB+704gWvgLlSpt5eYSZDLGVS4PrHfg2rcg==
X-Received: by 2002:a05:6a20:438f:b0:1ee:d6a7:e333 with SMTP id adf61e73a8af0-2188c3a285bmr6988282637.8.1748322424767;
        Mon, 26 May 2025 22:07:04 -0700 (PDT)
Received: from user.. ([58.206.232.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a0ca7sm17883937b3a.158.2025.05.26.22.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:07:04 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: elder@kernel.org
Cc: keescook@chromium.org,
	johan@kernel.org,
	vireshk@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clf700383@gmail.com
Subject: [PATCH v2] greybus: Avoid fake flexible array for response data
Date: Tue, 27 May 2025 13:06:35 +0800
Message-Id: <20250527050635.946553-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We want to get rid of zero size arrays and use flexible arrays instead.
However, in this case the struct is just one flexible array of u8 which
adds no value. Just use a pointer instead.

v1: https://lore.kernel.org/all/202505262032.507AD8E0DC@keescook/

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/staging/greybus/i2c.c             | 12 ++++--------
 include/linux/greybus/greybus_protocols.h |  3 ---
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index 14f1ff6d448c..b248d6717b71 100644
--- a/drivers/staging/greybus/i2c.c
+++ b/drivers/staging/greybus/i2c.c
@@ -144,15 +144,14 @@ gb_i2c_operation_create(struct gb_connection *connection,
 }
 
 static void gb_i2c_decode_response(struct i2c_msg *msgs, u32 msg_count,
-				   struct gb_i2c_transfer_response *response)
+				   u8 *data)
 {
 	struct i2c_msg *msg = msgs;
-	u8 *data;
 	u32 i;
 
-	if (!response)
+	if (!data)
 		return;
-	data = response->data;
+
 	for (i = 0; i < msg_count; i++) {
 		if (msg->flags & I2C_M_RD) {
 			memcpy(msg->buf, data, msg->len);
@@ -188,10 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
 
 	ret = gb_operation_request_send_sync(operation);
 	if (!ret) {
-		struct gb_i2c_transfer_response *response;
-
-		response = operation->response->payload;
-		gb_i2c_decode_response(msgs, msg_count, response);
+		gb_i2c_decode_response(msgs, msg_count, operation->response->payload);
 		ret = msg_count;
 	} else if (!gb_i2c_expected_transfer_error(ret)) {
 		dev_err(dev, "transfer operation failed (%d)\n", ret);
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c..6a35c78b967b 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -678,9 +678,6 @@ struct gb_i2c_transfer_request {
 	__le16				op_count;
 	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
 } __packed;
-struct gb_i2c_transfer_response {
-	__u8				data[0];	/* inbound data */
-} __packed;
 
 
 /* GPIO */
-- 
2.34.1

