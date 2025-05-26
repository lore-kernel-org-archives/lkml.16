Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DBE1F4180
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 11:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748257693; cv=none; b=qcG9ygcM0hq06NocKZgz0GjySOriTBfmwVvMpRo/xxDHsWMe4h7iiLFvk+PnoOcO5Bf+WcZsaKkVCkuHPvg4P0dg46Q3JOjg1r63IZ7RQ/37aJv3WRzUV5dSioUaGNaoSwD3fPoS76SEwwHj7h3QXIzLJx51Wo+gIJ2pbf5LwMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748257693; c=relaxed/simple;
	bh=O+dE09fzj62OmqV+UsjuQLQsX2ktS32WrQkumdnCevU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DBPlSeXBV6b2kNJJynjMwHNWXR2/rNnjmNyk/KpaT1rsCoihrBZ/qyqiaKT3QgvjEMamaWpdFI23JdhtjgHAyUk/XzjNKsZ2Nf8OM5aA0qpvQLsYo4LdPFP2hDkbEtiiGHaKHgnwvmzY+zZR1B3cLiU9a3dljS3dnALbMO4ZC8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OM+KKRCe; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OM+KKRCe"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-231f39b1b7aso1804045ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748257691; x=1748862491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TYrv+P2HDOOtjJG1Ylbuyew/XFq9E/PugmdWiaigIXA=;
        b=OM+KKRCe3U3GdJussATPtTMASZQrF7Iobyt8JuWS0UFLFfZByPYc0qAuF9aKsTheZf
         H/ZyiR83rcA4BmbO62wL0biAIZzT1jomjIx911SYWufvObBb3i3iyKqTotiiQ9Eui6I1
         vHn6jrztJEKotdobeOGGmqDaW/TQRfzUqIJGlsen5NhBXkwfJeFnd4KDiTyRZgNR80oi
         cjjUlyatyiA8bbtdvQPT8704THnsh9qBKv7Ahq+KDgTZr2j0ctV5YFIIose/aAXMiuWH
         E+yaYp6CiqnIue6LlZ545WcKl5IySkm8jiL+i4w0J2RM3CRUSLf+XReqUFBuYUtr19AM
         0tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748257691; x=1748862491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYrv+P2HDOOtjJG1Ylbuyew/XFq9E/PugmdWiaigIXA=;
        b=AR64b+01bsV7ZuCUyGrLmwWCMr3HSMUsKM77r2krbAhSMK0ZT/x7pVfLNazrggVPza
         lvaFrn5USjnY18JZw7XNQs8jqf8AJYKjWTgDS56ebq62p/72Izzhb1aQrm93ZQIkR+78
         vxPVIuQY8XuMMX5AJN2lcmPtIXsQrKj6rSSh0gIGpasB/HE/NI20g2tM/MNaidSL1+eA
         H2nlhgfNYCT/ap8661ud8lqrtGckhuKlHVHKjTC3CihFZ2+0d3teWNaAJ6oiU5TXbXv2
         dxDi4rh/ExWky9jpKpDxnMG0UzJ+Ap+J9mmW9KHnyKWIJHPgeosvkLn+YeZfJa7fQUkc
         Cmgw==
X-Forwarded-Encrypted: i=1; AJvYcCUWNX3sk2kR59bwcYQMAwmP5LfTJ3fRY0hw0BGagqS7Fgbr4piMVgKtm2K5nJmUND6UkGIgQv1hODJ5USU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHmEYpkVVxvZjlEn3Tgo5eCD/n2IJxF3SN9MIvxTawc/tH8UsH
	I2f3PNq2cKSSHRsz2J5m1kzNWDhhGLtmJ3EwBxzZ6xgutgv2ktACiqc1NE76W+D5qxjXJTTa
X-Gm-Gg: ASbGncuMN5SeXfgJ54sIyOzeunTltXhOtXV+mfmrUcaPVmpAMAnB5BMQWGYqUEEj2y7
	5Ei4MQs2aqaott6TGqKWIYOX//wEaosOq12wbo2SOMHRz0hIavPNjNRPjmKp+yXkz0yky6cIf1Y
	7LyQ27i135UqTV5Bu311PVLcMagPJ7LZx8QfXCGdJLIUQLkf0yVRof4OG99+cKpvJgCt3kWDfIj
	FFCoReG2ih8kcABaaHhEvsByqXswbPvYFYXF8Mygb9zSxWJA5/T+6uFFkEn+Tc0Y+4Dhktiyv7u
	+xCRID0tR26O6d471TlUuhg2BdxX0Q==
X-Google-Smtp-Source: AGHT+IHq3w0bF9u3FNLf9NfvqS8horvVYf7CrW5lhlByo7h0D4LInhkkAn5Rq1vWblX71HzqOcrmxA==
X-Received: by 2002:a17:902:db03:b0:223:5525:622f with SMTP id d9443c01a7336-23414f2fca5mr49499585ad.1.1748257691042;
        Mon, 26 May 2025 04:08:11 -0700 (PDT)
Received: from user.. ([2001:da8:283:e049::9:6ed3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23435e7671asm28156875ad.89.2025.05.26.04.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 04:08:10 -0700 (PDT)
From: clingfei <clf700383@gmail.com>
To: elder@kernel.org
Cc: johan@kernel.org,
	vireshk@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	clf700383@gmail.com
Subject: [PATCH] greybus: Avoid fake flexible array for response data
Date: Mon, 26 May 2025 19:06:54 +0800
Message-Id: <20250526110654.3916536-1-clf700383@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As https://lore.kernel.org/all/20240304211940.it.083-kees@kernel.org/
pointed out, to enforce the 0-sized destinations, the remaining 0-sized
destinations need to be handled. Thus the struct
gb_control_get_manifest_response and struct gb_i2c_transfer_response
are removed.

Signed-off-by: clingfei <clf700383@gmail.com>
---
 drivers/staging/greybus/i2c.c             | 9 ++++-----
 include/linux/greybus/greybus_protocols.h | 9 ---------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index 14f1ff6d448c..2857c2834206 100644
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
@@ -188,7 +187,7 @@ static int gb_i2c_transfer_operation(struct gb_i2c_device *gb_i2c_dev,
 
 	ret = gb_operation_request_send_sync(operation);
 	if (!ret) {
-		struct gb_i2c_transfer_response *response;
+		u8 *response;
 
 		response = operation->response->payload;
 		gb_i2c_decode_response(msgs, msg_count, response);
diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
index 820134b0105c..14395f9300d6 100644
--- a/include/linux/greybus/greybus_protocols.h
+++ b/include/linux/greybus/greybus_protocols.h
@@ -110,11 +110,6 @@ struct gb_control_get_manifest_size_response {
 	__le16			size;
 } __packed;
 
-/* Control protocol manifest get request has no payload */
-struct gb_control_get_manifest_response {
-	__u8			data[0];
-} __packed;
-
 /* Control protocol [dis]connected request */
 struct gb_control_connected_request {
 	__le16			cport_id;
@@ -678,10 +673,6 @@ struct gb_i2c_transfer_request {
 	__le16				op_count;
 	struct gb_i2c_transfer_op	ops[];		/* op_count of these */
 } __packed;
-struct gb_i2c_transfer_response {
-	__u8				data[0];	/* inbound data */
-} __packed;
-
 
 /* GPIO */
 
-- 
2.34.1

