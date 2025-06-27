Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF2D2BE7D0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019647; cv=none; b=g/Jcj+UxabdqkUnB3G6oCxzYz3q/lxHKkhBx1Kdjo27NUg+Rc5LJXVUkDoyUSrEkYBf+XYTVMzbTnKqEO2c5OEsS5++y9qdRie1Xf+sx0nyelqAD7uDU5XyR5Abvd6e3TV6CuWONSGEn6fIYwGpUjX/MP/kipHIY8WYSEF14gUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019647; c=relaxed/simple;
	bh=jL/YtnZUBwUm3r8kPPjqfuJQkAPEMLB/FpIfnfB7Kmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cmCaf50KMmQ06azfpW8ah+mQezx4QpCFGmom4xueevtCmWMppgF8cT+xScjAAkOjb2M2vRqafXck2lo//Cwq+GbL7UWiquXkvHZdYSAoBunRKMkWJ97dmmNmUWSmpuFx/XQ/hqIMPSqrsUCFbfqpZhx0csHNK9m61SYpqmzZWCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=pNEH7isv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="pNEH7isv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf214200so15019685e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1751019643; x=1751624443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iEKV6ts9W10Av07F6DCzZ39zrp07uluAsuhY5sBvobY=;
        b=pNEH7isvwcd1DOvkfdNDzV7UGUTl3G+VcFamDRzdnHitMw3XtWyNHo7Ve7MMyCqHdu
         rCxYQmcvHkWDod0ObKiKmM22mskZz8IB8Wz/g6sVe+r2gpyjPVZ0oW73hReHP0vDHblk
         C6L3gKHFJ+qBv4VUV18atyD3ogpwlta78OwNz5wuyR5+rfEA3je+nJ4iFBjvGXYVrw8d
         dLu1zyvzX8kCDbQbkV3UtaSndytJqRlko5xeAk/53LHMQI1AyVn8C9J1naRAu9EVzROF
         KkKrACF0kL9E325axcIDTWI0g5ejjGZr4QPdMyPAjSTBrINU+MQZKHUkZwrisRZaNGFM
         8p9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019643; x=1751624443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iEKV6ts9W10Av07F6DCzZ39zrp07uluAsuhY5sBvobY=;
        b=HywP450sHBAiklaShgBcjEzD1WHomHE9F7wAS/VxzqABdVCusdkBbPogBmcczUXw2/
         AB9/ygjbqY+Wqn4bmsMblLnR5UXKGQSCCiH4m2oP6nB6UguITkkq7ijeuBhST5luh5lw
         oo2X60BtWtI+NhB3j8LYfRXWRiS3DZWJDIpWSq7Dk4tJWClvFb1DsqqjqZpkfKrQkdTC
         I0cNbTE8HL37j05XWaih86EhWxFOEIhrUSslyW8L3J47Ae7qDCvEQEpmxvNKNeI8t95W
         d549w1SyCx4kbxVu6tzVtlzG7Y5x0WzYLDEid3R6mztnv1QA+/8XSeJh4XUrXleUb78I
         i7gg==
X-Forwarded-Encrypted: i=1; AJvYcCWAzA7lQxTaN4nfUhAqxnPYFomXoOVW0UKx9aXpNNptYQmq3kkoKg+akLTE292zuJfP6kQVREyECaDswi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8PyUJ9VHvFEDxNmBf8BNYe19tNlvcOwQInmUtVKIRMFZWo2e4
	KRHe8s2z17VqYtMdPwh7KEsU3e01w5QyIJJv65nPpr68MLfz6h99PiNgcVKJ+2aIqBo=
X-Gm-Gg: ASbGncstRA+K/bDF0SPSxU/0nwGy7uCu5rc8eryUeQ5LIm0qAR8YMhLb+QOPoDyfDd0
	/lXZgiJWefxnH/+uwXLUVzBHIY+5jLK2YDViAU4FwbmQ/oyDnkMPZrkvcbVzpfpyWaAsH76iqaM
	nQyWM2tddJZcOFdRQqc6ReFpfseF2qRrFugzoeOjccv4foKgtrCcUqpz+GtAIGbhC2gZUpE3OBq
	YJtHJBuCuvaHRsWPtlZYun72b0glxcBbo8CLCxLG7MgfmM4E3/cbd3SI9f5ka2PvIURu+prUtAS
	r66+VN1je2soJtikJHIYji919CY1Tjmh+48Ymi+nIdE5BIAGqY5C9agEO5lUYoBdq6w3GF/016O
	S2zY=
X-Google-Smtp-Source: AGHT+IEaRWI6eEtESOZAX60HsBb4MY4ild3QZPxReHjEFDua8kGED/GJs0e6NClhbG8tzglFyqEpWQ==
X-Received: by 2002:a05:6000:2704:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a8f454905amr2335863f8f.1.1751019642944;
        Fri, 27 Jun 2025 03:20:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c7:1d1a:9c01:1a4a:198c:c191:f3d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7524sm2331700f8f.12.2025.06.27.03.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 03:20:42 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 27 Jun 2025 11:20:35 +0100
Subject: [PATCH v2 1/3] leds/leds-is31fl32xx: add support for is31fl3236a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-leds-is31fl3236a-v2-1-f6ef7495ce65@thegoodpenguin.co.uk>
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
In-Reply-To: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751019641; l=4935;
 i=pzalewski@thegoodpenguin.co.uk; s=20250625; h=from:subject:message-id;
 bh=jL/YtnZUBwUm3r8kPPjqfuJQkAPEMLB/FpIfnfB7Kmo=;
 b=7CGhMlMkL1Y/uOXcbcJl3otoIY5jEsO0VoijKJBMZRvJFnX5tq3r0nHhGm4US407AHQrbwuMo
 4I5VzxJE9nVAzckCT4mbVPpW4Iu/D9TTavAwosLQ9GpnbUpB5gx+q37
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=hHrwBom/yjrVTqpEvKpVXLYfxr6nqBNP16RkQopIRrI=

Add an additional and optional control register for setting
the output PWM frequency to 22kHz. The default is 3kHz and
this option puts the operational frequency outside of the
audible range.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/leds/leds-is31fl32xx.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 8793330dd4142f49f15d6ee9d87468c08509859f..b3f25854f97eac0f87c5be762b1d8e3afaaecc21 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -32,6 +32,8 @@
 #define IS31FL3216_CONFIG_SSD_ENABLE  BIT(7)
 #define IS31FL3216_CONFIG_SSD_DISABLE 0
 
+#define IS31FL32XX_PWM_FREQUENCY_22kHz  0x01
+
 struct is31fl32xx_priv;
 struct is31fl32xx_led_data {
 	struct led_classdev cdev;
@@ -53,6 +55,7 @@ struct is31fl32xx_priv {
  * @pwm_update_reg      : address of PWM Update register
  * @global_control_reg  : address of Global Control register (optional)
  * @reset_reg           : address of Reset register (optional)
+ * @output_frequency_setting_reg: address of output frequency register (optional)
  * @pwm_register_base   : address of first PWM register
  * @pwm_registers_reversed: : true if PWM registers count down instead of up
  * @led_control_register_base : address of first LED control register (optional)
@@ -76,6 +79,7 @@ struct is31fl32xx_chipdef {
 	u8	pwm_update_reg;
 	u8	global_control_reg;
 	u8	reset_reg;
+	u8	output_frequency_setting_reg;
 	u8	pwm_register_base;
 	bool	pwm_registers_reversed;
 	u8	led_control_register_base;
@@ -90,6 +94,19 @@ static const struct is31fl32xx_chipdef is31fl3236_cdef = {
 	.pwm_update_reg				= 0x25,
 	.global_control_reg			= 0x4a,
 	.reset_reg				= 0x4f,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
+	.pwm_register_base			= 0x01,
+	.led_control_register_base		= 0x26,
+	.enable_bits_per_led_control_register	= 1,
+};
+
+static const struct is31fl32xx_chipdef is31fl3236a_cdef = {
+	.channels				= 36,
+	.shutdown_reg				= 0x00,
+	.pwm_update_reg				= 0x25,
+	.global_control_reg			= 0x4a,
+	.reset_reg				= 0x4f,
+	.output_frequency_setting_reg		= 0x4b,
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x26,
 	.enable_bits_per_led_control_register	= 1,
@@ -101,6 +118,7 @@ static const struct is31fl32xx_chipdef is31fl3235_cdef = {
 	.pwm_update_reg				= 0x25,
 	.global_control_reg			= 0x4a,
 	.reset_reg				= 0x4f,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
 	.pwm_register_base			= 0x05,
 	.led_control_register_base		= 0x2a,
 	.enable_bits_per_led_control_register	= 1,
@@ -112,6 +130,7 @@ static const struct is31fl32xx_chipdef is31fl3218_cdef = {
 	.pwm_update_reg				= 0x16,
 	.global_control_reg			= IS31FL32XX_REG_NONE,
 	.reset_reg				= 0x17,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
 	.pwm_register_base			= 0x01,
 	.led_control_register_base		= 0x13,
 	.enable_bits_per_led_control_register	= 6,
@@ -126,6 +145,7 @@ static const struct is31fl32xx_chipdef is31fl3216_cdef = {
 	.pwm_update_reg				= 0xB0,
 	.global_control_reg			= IS31FL32XX_REG_NONE,
 	.reset_reg				= IS31FL32XX_REG_NONE,
+	.output_frequency_setting_reg		= IS31FL32XX_REG_NONE,
 	.pwm_register_base			= 0x10,
 	.pwm_registers_reversed			= true,
 	.led_control_register_base		= 0x01,
@@ -363,8 +383,21 @@ static struct is31fl32xx_led_data *is31fl32xx_find_led_data(
 static int is31fl32xx_parse_dt(struct device *dev,
 			       struct is31fl32xx_priv *priv)
 {
+	const struct is31fl32xx_chipdef *cdef = priv->cdef;
 	int ret = 0;
 
+	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
+	of_property_read_bool(dev_of_node(dev), "issi,22kHz-pwm")) {
+
+		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
+					IS31FL32XX_PWM_FREQUENCY_22kHz);
+
+		if (ret) {
+			dev_err(dev, "Failed to write output PWM frequency register\n");
+			return ret;
+		}
+	}
+
 	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
 		struct led_init_data init_data = {};
 		struct is31fl32xx_led_data *led_data =
@@ -405,6 +438,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 
 static const struct of_device_id of_is31fl32xx_match[] = {
 	{ .compatible = "issi,is31fl3236", .data = &is31fl3236_cdef, },
+	{ .compatible = "issi,is31fl3236a", .data = &is31fl3236a_cdef, },
 	{ .compatible = "issi,is31fl3235", .data = &is31fl3235_cdef, },
 	{ .compatible = "issi,is31fl3218", .data = &is31fl3218_cdef, },
 	{ .compatible = "si-en,sn3218",    .data = &is31fl3218_cdef, },
@@ -466,6 +500,7 @@ static void is31fl32xx_remove(struct i2c_client *client)
  */
 static const struct i2c_device_id is31fl32xx_id[] = {
 	{ "is31fl3236" },
+	{ "is31fl3236a" },
 	{ "is31fl3235" },
 	{ "is31fl3218" },
 	{ "sn3218" },

-- 
2.48.1

