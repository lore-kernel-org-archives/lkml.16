Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794029117B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710169; cv=none; b=eWnRYfZ7zKxWUOArsqZDPsXr1xVyXxlCiOC6/aQ3aHWK928wtSYUu8U3cc58VxNwsFy8fc2sMlZVmmx/f1vszD+xEtYILGOkhK4u2yH7lz/pR8r5cX8f2HDGejRY+YceWPHFwf0kJdnDgxdpVawDaCElYRHKdF7IExgwEhstisU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710169; c=relaxed/simple;
	bh=/nBMOP+mjkengzFCUOyb+JIzXxW87Mah/5W754BehRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1TUFLrV8ah+5xV5tp2hNo5IPKmoOCNRHLmmzOI5YWx8oo4ghy4DEChNvBaBPlXswaiBEogM9/UxFWUVSkPKtKxPsz8GZz/JuW378JRmQx91KWyFmRP+N7u192RtRtq3zjw+L3p81NM9GklLvkCcEq47cjcoXxKKXcgKE4qLL3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BZPcIG1T; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BZPcIG1T"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223fb0f619dso56500475ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744710166; x=1745314966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpO334l3cl7LKBvhDLO3AWNd5+6mtKhWKdxedh3WdDQ=;
        b=BZPcIG1TceCevjooIdZP4m+okVUvdalurOrDFG+JSyMH+8fUQ8EoMXl5R0uZ9vF9t8
         fU6bn7dNMmkbJAE7xCIVZEml4jqiJhMQGJjzbWIhNLJzYv79+uKzknFsi5Rg7eORVSNV
         cHvCJH8QdTWVzLTs2qUsC76wG0V50QTEz9IJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710166; x=1745314966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpO334l3cl7LKBvhDLO3AWNd5+6mtKhWKdxedh3WdDQ=;
        b=Owsp3B/Li9cH1R3756lM5LoWxEp6VPOfGTXwfv0IJGyWdJxCChR6ONSZetEsUM0NeK
         eIhF5BXQOCDhooF+qN/e+iuDt+EV9JyKWiQmZXk8wDmWQzbVPke4XwvLu9cNrawCVt6K
         xBuE5Jhtra8iEd+k4HlAFhrgKiTn1sjzG+bPdZXpiw4QhoSwk2JF2TceBKdc4ca5IdXO
         EXKXrIJxeXGTE+TooyFNsgy3m5OzjJRSwtXsqlaIve4ctKg4+mpawi2zngeUMFZUdwtR
         tEl/hzyeustif//8Mu/rQPAWu/HoGktGnX0XvRJvgxi2SCBYJkLo4rgguPDhxtAO4xKv
         ID/w==
X-Forwarded-Encrypted: i=1; AJvYcCVaWCLUSiHDJMohTvYM7rpdd0x3DXiMaqHgMAJ2mSrE2HBJfpw+LBFe5WjW9yHzb/1O4hLrdVcLiGveA6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGvcCVXZ+Tx7PBJEbGPammi83MAddKpiVW6RterTOopvV22wAA
	YlVglPTRViUeqBYgFfD2cvPgGqy3HtG7iYHo9/wEQtxE0+hatU43W0AbaqP0nlbgOmFWSInU708
	=
X-Gm-Gg: ASbGnct2BX48B3jS+BADk2D0eMpnXGY7tk3AsHEnqmFUaueibwo4pwYymUtaTpZoRRp
	NcTQdc7hRWQXby+XP7XXd4mptzyjcmGowYwcY0OdoGkrLXRRfvjTU9etYYpdu8lglzt7LkRjfhI
	e3+RfXbQHyWTqC7ar/MlalExmfACeQ2sd3GsXNG97rJUU331qYBkAthKXT95mrJixpUqhaTJvsI
	aYhZ6k/L9NXJQgoQK1DsmbQyi6wXRyJL6aZSaczkcwvWR2IXmn6p+mhhnq4GyOC90lKFjU56KvB
	898tHWiuyy3lDpC4GEG1c7UWDHnNexs52USZ74USf1dB+N1wGNQ0hb4seIZbjB7B
X-Google-Smtp-Source: AGHT+IHBEMPrfPelV2330zwHPA4rKcksLCkHmzMsaQxLYWTxwvUzyGNeqz9IHoGnlcQAVmX7iP454w==
X-Received: by 2002:a17:903:2f82:b0:223:fb3a:8631 with SMTP id d9443c01a7336-22bea4bcce9mr224713015ad.24.1744710165999;
        Tue, 15 Apr 2025 02:42:45 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7d0d:86ea:ee84:cd08])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccca5asm113135215ad.254.2025.04.15.02.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:42:45 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 4/4] usb: misc: onboard_usb_dev: Add Parade PS5511 hub support
Date: Tue, 15 Apr 2025 17:42:01 +0800
Message-ID: <20250415094227.3629916-5-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
In-Reply-To: <20250415094227.3629916-1-treapking@chromium.org>
References: <20250415094227.3629916-1-treapking@chromium.org>
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

(no changes since v1)

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
2.49.0.777.g153de2bbd5-goog

