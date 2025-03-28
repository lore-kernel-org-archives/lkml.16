Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84242212FBF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743150633; cv=none; b=j/rdnHwVASFdSIxTXUsscK45Q0/dMtZf8CJxR/g3D8GH+pqiezvf38MQNXpbhRBhViSlxJz4aez7I9B5Al8WCBzg4e7/yjpfnfXve2ald4Oc6rSmJb9XDIk6kX9yUCYG7B0js+tHsIGXiYNGbM4NTET1N9Q7cfTuN8glaWBLvdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743150633; c=relaxed/simple;
	bh=9HztVfNSSbsFpEOdHla0tUCKIZ0HhA//ZtU7g1Uu4gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqKtIIZf8bJdceELuLIxJOUancBpSjzgZmQBUhKkTncWCrhZUTZZlDR+Towwvr0N7FmWNU77C9Z5nFsxBXEEp1No6qJ48qNLPrVyBbzcvc3fehpFMBzbH7A/o0boaCVzTNtpwPn9ak4lw7W7KmIni4VUYMPTfUS2JhozaSlvSJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AKpHAygl; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AKpHAygl"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2243803b776so58695645ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 01:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743150631; x=1743755431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=makVc1Wy6ZWe2mpSuhAdO4nGFknj+sYe3vzqlSz4ovw=;
        b=AKpHAyglQ5GwCvP0JBrEKMo1yEDUvnrb5aMh5StABE7/xquBFaQt0BOqTEDWcVvV5Y
         OUPmUpIZnbNBNphk3pcVLyD/CkvgRTKQQYzULjBRdcirFkiQXdowDgBmFexyflu7B0gI
         1YTPXhTx2cpr2E1qvZPNI6XeOmI5kKQbZXVIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743150631; x=1743755431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=makVc1Wy6ZWe2mpSuhAdO4nGFknj+sYe3vzqlSz4ovw=;
        b=VJPtI72RJr67guoWEaU1fYSQnJNnhSTubaje2K6POa8mdllSB0PccOyRxPl/N9RuFu
         Of3QZBID4h/folfvkosmWdOgSsbB/wQqOJfKsZuviz2xza6IEfLh/TP7F/yG2UwLhJHh
         MUjBr3mJFgZQW4rDVcQHy2L3/rd04NPe+G/zkhF4/LKQTnuuqA/1bkcVzdDuf3JQe06B
         j/4kCp3PKTOO01w2uuAABQCCKH38tJCpjb6+7scHGjYW9qIsRe7QaVIHugc9nPR/YHbG
         89ZVgeRCy0Lc/8zyXX9AvtdLN5eC4/0vpTD1lofBxM4Vhal/yHmIbkCr5g3d+MX6jCdN
         jxIg==
X-Gm-Message-State: AOJu0Yy69+bWyalOwpq8vnJWgIISbBwMYV8FH7gXLfsC0ETLp+nlUOcM
	+vYbYJ78S4ayWnrq9PQbmK4SJ4OCJD8woxBe/Hr6uMQgEvcQGgfsN9oo7E0OSw==
X-Gm-Gg: ASbGncuvo98IGneit/6PIgnWnTFybMUequOUqpipM42YQULx5snzEO4emBmWVjechty
	+aorTYRuXjzwpLeZj3QucCcylAHcB2dw+u6ybRckM/McXt42AGqWliFoszmji7a2DxScMuBPFJl
	gYR8ukIQJ6FhMng38Z+cBQRHTXk6IGUP2NHDrzzf/5SV2tsG9Y0cgosufCnYf8CBvM14JW3GO0r
	40IAOxSd0a+dDFEnDI/AGkpawYNIr1mp33J51RGVoWZRzMFE2t3C/BdTUMm9zzjdYpkP58aympT
	AwmDh2gtRbGufZigORbDSySYq2D2QrNfZrq8afjkhPKAdKcqSIO7Tsi0PHg+qZzdEw==
X-Google-Smtp-Source: AGHT+IH2qRVjHIYQ63E+yeqheYOjTukGTZ19Dk/wXORZYgbt+7wPPWlRjGtmaSz0/LvLJcESsokEfw==
X-Received: by 2002:a17:902:d483:b0:224:256e:5e3f with SMTP id d9443c01a7336-228048c7c17mr112158025ad.25.1743150625904;
        Fri, 28 Mar 2025 01:30:25 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:9004:7029:99b:276])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ef62asm12283775ad.217.2025.03.28.01.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 01:30:25 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: linux-kernel@vger.kernel.org,
	Stephen Boyd <swboyd@chromium.org>,
	linux-usb@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] usb: misc: onboard_usb_dev: Add Parade PS5511 hub support
Date: Fri, 28 Mar 2025 16:28:46 +0800
Message-ID: <20250328082950.1473406-2-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
In-Reply-To: <20250328082950.1473406-1-treapking@chromium.org>
References: <20250328082950.1473406-1-treapking@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Parade PS5511 is 4+1 port USB 3.2 gen 1 hub with a reset pin and two power
supplies (3V3 and 1V1).

Add the support for this hub for the reset pin control and power supply.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/usb/misc/onboard_usb_dev.c | 3 +++
 drivers/usb/misc/onboard_usb_dev.h | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index 75ac3c6aa92d0d..91b49e58664d6b 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -490,6 +490,7 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_CYPRESS	0x04b4
 #define VENDOR_ID_GENESYS	0x05e3
 #define VENDOR_ID_MICROCHIP	0x0424
+#define VENDOR_ID_PARADE	0x1da0
 #define VENDOR_ID_REALTEK	0x0bda
 #define VENDOR_ID_TI		0x0451
 #define VENDOR_ID_VIA		0x2109
@@ -580,6 +581,8 @@ static const struct usb_device_id onboard_dev_id_table[] = {
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2744) }, /* USB5744 USB 2.0 HUB */
 	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x5744) }, /* USB5744 USB 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_PARADE, 0x5511) }, /* PS5511 USB 3.2 */
+	{ USB_DEVICE(VENDOR_ID_PARADE, 0x55a1) }, /* PS5511 USB 2.0 */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 HUB */
 	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 HUB */
diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
index 933797a7e0841c..2963689958fc2a 100644
--- a/drivers/usb/misc/onboard_usb_dev.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -38,6 +38,13 @@ static const struct onboard_dev_pdata microchip_usb5744_data = {
 	.is_hub = true,
 };
 
+static const struct onboard_dev_pdata parade_ps5511_data = {
+	.reset_us = 500,
+	.num_supplies = 2,
+	.supply_names = { "vddd11", "vdd33"},
+	.is_hub = true,
+};
+
 static const struct onboard_dev_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 	.num_supplies = 1,
@@ -122,6 +129,8 @@ static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usbbda,5411", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,414", .data = &realtek_rts5411_data, },
 	{ .compatible = "usbbda,5414", .data = &realtek_rts5411_data, },
+	{ .compatible = "usb1da0,5511", .data = &parade_ps5511_data, },
+	{ .compatible = "usb1da0,55a1", .data = &parade_ps5511_data, },
 	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
 	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
-- 
2.49.0.472.ge94155a9ec-goog

