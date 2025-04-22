Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE9B2980CE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745310622; cv=none; b=O8n/QDSwUsvDRwmceruO1T73Bn31PKCKHNvdoYC6qQZ4eAB+2XlsPAcJ2/vIc1R8nUHIg7VMt79kJxOJG79r6tDfkknwA8/demP1wZ2r0t+DDYg3ZHsV0im+6KmzYwCMYoHLUNNCKB0FZTwid4rQtxhTry5Yyx3PpqX3YhodFK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745310622; c=relaxed/simple;
	bh=gBnvR1I1ZnFzb4vg65PBtlZBg4X6LVpbCReLzWaUhJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LfonCCBw5U5gWopqI0TW5bEI+XjnI19K0oPxlMyPGewGKA9PcIVd5ATsKIlrJStsHvLE4xipQ0r3pam18OiRch+K9rDzyEI/la34pu8C4frFw9zEDMOBNpZmq8IR0RPrTMHv0TWHJFLFjUa4GshAK1ZODhJyjUq2HqqMYNmXVMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q0U0vOb3; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q0U0vOb3"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso5622904a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745310619; x=1745915419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhnP5fHmR2Q8bheAgrl4QJ3VtrLDUwvDbOgI8e/2CDY=;
        b=Q0U0vOb32HFqTuyURLC878BQfNxM7IzgvSOIjD55i/oMdzYfGjga3m1eSUNcB5u2lO
         hL5rBDkkuUAeUZaq6ciCdsZI1o2unSZFGms1rfJhAegNcQVyFcYsEYAT5BbESQszm77s
         VSwIox65hVUfBDa46fAzqtcxOsRZnOfzF4q/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745310619; x=1745915419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhnP5fHmR2Q8bheAgrl4QJ3VtrLDUwvDbOgI8e/2CDY=;
        b=U5L2kKjyFVoeqpDZIAYLHQFLtGeCYL7EZ4dVwqWBhcFcixHKB9+Sl3fvJ5WqXmGb0a
         22yZgplAPrjj68EZ5J3K5FuFIpk/VaO3GB9LkLppv7DK9xwUN6gAN8tQiOoDQ2azdhsE
         j0qy0OLbqLMUUpgJXSNat3b+t0chUdTRdwiSoz+Gx/tIBzQREh44YSBtcbcTLeZi9lbx
         y/ozcSGvuwLmICMaJ0LywUp8ddNQLs+bCiPr4RLYG4WBWwqo7mq+HCcQWRvR/IySCipT
         ZfQrhlsv+aCTAmIW6mZfED/4NX4kFsXcj925MvtlrzLUDCnLcXv8oF3tDZjKYmPnpQEG
         xYOA==
X-Forwarded-Encrypted: i=1; AJvYcCX247BHhAt3FHgy9Fan/BpEM0ifGxPVcEYAVm59vsjQpggJof4l9e/2c5Ilf5jdlz7h+ytc8jlahIoeIoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHq72N4g6I6rc2blg2kLxJGq/HCJ1+MpjUKfGCCodd5AebWrXf
	Q78g0AGprWRZaGl7SHaZpaEammFrsEkRRxMAtH86/T3Ikzlcj7COALwaE0F1WA==
X-Gm-Gg: ASbGncs+saae/nLuYEeYR7QmLmtMcS9xjEhHu1it+6dsQ+i18VQoJqhy86nNMt+gFLb
	UnYzKyhm5PRiInjrEokajYYd9Xl03bNQtKl74RBvRwyNJ7u4ZLbGpNkoDp9CGi8g+VEBLjGEjeQ
	OUFEH/8HZ5F4C+FdK+0q68uRt3J6GzLZLO6qdlCTwlKXJj5E71qBkSoYVBkttuPyCxWjj1czqiX
	wURFNsJdKStAeQ6/Oi5RaKLMKYeo1Ug7A5IJLC2mr7rBvlt0l0IZ2JWuB0hSlwBnIBJaxLDBc8p
	l1LcAU81IbJ06dkqhvRjHUceOZX9KO6vBWXjVkHhYk549Z94tVv54cyKyLMOZTIA
X-Google-Smtp-Source: AGHT+IHvMg/U3wawJMIjtv8NdwlNXjSugJsH0Z0eeETts37HBEVjcFftSg9+DA7CLUjYcHqi3e59Dg==
X-Received: by 2002:a05:6300:42:b0:1f5:8a69:f41b with SMTP id adf61e73a8af0-203cbd41774mr23233480637.37.1745310618738;
        Tue, 22 Apr 2025 01:30:18 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:90d6:56e4:9d90:9df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e0be0sm7993576b3a.49.2025.04.22.01.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:30:18 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Kaehlcke <mka@chromium.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 4/4] usb: misc: onboard_usb_dev: Add Parade PS5511 hub support
Date: Tue, 22 Apr 2025 16:28:30 +0800
Message-ID: <20250422082957.2058229-5-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250422082957.2058229-1-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org>
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
2.49.0.805.g082f7c87e0-goog

