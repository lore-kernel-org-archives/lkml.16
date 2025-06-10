Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE8328C03B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548648; cv=none; b=U5xqMux6agIke0cl3Gum7FKtnzfm+Lw0X7vqC30ZdmOkmaHBYX6vZbjNNv8KlO56rp2NuzOBlEsUmFH758L6AgkNf67ND1ky8Bb9cP+poPw3PbsoEqXsZFysRr7wHxQLQ3Dxe9i5vGQzgsBKdMRw64gxplDBpsAqVrQkdt8Y4U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548648; c=relaxed/simple;
	bh=QWLCswuVXOzsyDLwB7rh4VyUKA23f/FOPB6FbILMyzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=c2U3n7uxzZ2F3/En54DdMTavs/diCH0eSAbaMbhjdWa53qnOWfWZPb/GBgbJ3WuawzWLsYAKV9+XeGpjuqLAGixPky66d+oaCUg1rD8ntSXSmb/3RAcJ8vLOJDEEL6WPgIOkJztHL64iAdML+OD9c5gGwX4ibp8Wj2eKZQcXoz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cnCesy0L; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cnCesy0L"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a51d552de4so2811735f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548645; x=1750153445; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AP2lApXT3oK4hCPR2yyZqkXMhT/gHqM9SDhESroajJo=;
        b=cnCesy0LNL6xPxEGV9jDZVQjHCqHITiHkzu2uzv1W3yOkpvyXWB8lGX3P3AzrsILLY
         xaqZCxFxNbjtv2XoP0gYHzKecX4zSUqjUUyanbjiUC+YAWh0+v9eZBug2uzZmtMoKImy
         6JwzS2CMQ9dXoqPKc2Yg0DDnsAyW14gAaOQ6fnncY2EzvfC+6zodKJFgBu2tne65Hy3e
         m4fjLOyng8pO7gS3vTmE14IiVm8kHMkCAbCHMT06pEWQpYoUUkIOuYSBTrh0mrhAkyHs
         eH88wtO5wm9h21Pt8zyEeekZ9fp/pOgBcksuiLW32QqdrPDCuQZCNOhdKLvTGWCmjHmr
         p9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548645; x=1750153445;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AP2lApXT3oK4hCPR2yyZqkXMhT/gHqM9SDhESroajJo=;
        b=Tc7zYwnNp0tz803FUX3rTWpZhmTX3j0nusCUYRF7n+MBkb6CBtMEJyiwaBF+RLqUlf
         Yq8Zab4pCFA+FuM5/1am9GwZJB7/W0hj4R+DRuRRlEj7J7lPD8dzmT7oAeKUMUcsUC+g
         fTTC8q1FIVddLAnsoIhv7qOYFlXdoQjGVlnlqryiFP3uxqKfS8NG6tgwPmPi8LZO/p3+
         /iSgnLKiVs8WcmIVcDXrDS45Wmy4ln8sh/j5WDFW5FrUIJgi89VdM70w3knZ9/f5Bdgr
         N4c+Lc/9KYLrzig5FsO4vrsBvfI9R/2dcpfR7olemkDRek6SopsgiQBcUPG4tWdAannq
         QmBw==
X-Gm-Message-State: AOJu0YwYag6YMMVn23SvQMvcC54xV0lriBsKeQpMZCvnepxvr0iosLKV
	aaA4yMu+J4dTS3lmcuDZeU5JCXvd96ysvlClIJHOUijv/Fb7W0L/apHEM1+JaG5xjY4=
X-Gm-Gg: ASbGncuzb69iS5zDkeW1/lE96VhhFNQUwiL3iw7KsYudawig0VQM/WSvz4xtU+GBa+e
	D58xHXH7s6N3xLzhp/bpSJ5/Ar++jePMZmTuoaY9qkGTSbTkYdX1xA3Na771dd7ny78tuj2Pu7y
	VmxzwxBVdcrBUr1G1Tb9SsOj42LEY0kHGUBvsKHx2KYzE3/N2hcGKYi6UM7n/OmyS4Iz757jsgr
	oATc4w4EzctWHGvJk1ONhkY+/Or/MsBAsPF2izF/1B506Ciw5agQIR+zIFVZ0ZOgMZqnjWJMn+Y
	upM71qiT8injWwC+MmLFjWuBgT+MED3HnND4jkKaKUSKVhQ9gAjc
X-Google-Smtp-Source: AGHT+IGc2KM5AHFDg0UZ+9LBR81/PsWs240h3WEszfvWbHPGb9vWNuxU4xjmtYVvcZ/UZFPLVTjYVA==
X-Received: by 2002:a05:6000:2512:b0:3a4:f722:f98d with SMTP id ffacd0b85a97d-3a531ab6df7mr13667513f8f.51.1749548641167;
        Tue, 10 Jun 2025 02:44:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6905sm136450895e9.8.2025.06.10.02.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:43:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 11:43:58 +0200
Subject: [PATCH RESEND] platform: cznic: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250610-gpiochip-set-rv-platform-cznic-v1-1-30afd2444756@linaro.org>
X-B4-Tracking: v=1; b=H4sIAF3+R2gC/4XNMQ+CMBQE4L9C3uwzlBYxTg6yOuhoGEop8BJsm
 5Y0KuG/2xB3x7tL7lsgaE86wClbwOtIgaxJge0yUKM0g0bqUoYiL8pc5AwHR1aN5DDoGX1EN8m
 5t/6J6mNIIZOMH9pOVLJsIZ04r3t6bcADbvW9vl6gSf1IYbb+vbmRbeuPOP4jIkOGindCV4UQn
 PfniYz0dm/9AM26rl+gg+3X1QAAAA==
X-Change-ID: 20250401-gpiochip-set-rv-platform-cznic-1a136bd47a5b
To: =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3702;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pYxbyIrnxsxPSFmRinhVqBD4ziNyGPLYFRlg+L3caks=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoR/5fvZhhVDSj8LyHz0YKZEKCPJ9Wl4mSygojm
 GeZuNtcyhyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEf+XwAKCRARpy6gFHHX
 crqrEADS5I0ITOeC63rZHdwLYW2YThlKx/Z1GfyAXXADsIMCoT8jpCLEoRwKMcu1C/iVghXuE/D
 9suaLKwU1QtXC9Tt/v1/7COZUGqWp+u4jsuyRtdMlFZ4VJ7Ho/ZPcKLDKzJnCw04DKIJlMyYIkY
 YPBuCNtaBC+2+/gYvOYjZnom2O6D9R9Ld1i7C51gWWeQ6ib7MgS1tppXjThvkY7XR2P4VnYmtiJ
 DYDBIuE4cCtstB+w4QmUYBwiqWVaglxpS3tjzuS02mK+GMDchaiVyYrtepmgONoCUGZ1+AdQHrf
 QCw5G48fa8yKuJChe0oYnxWARCJrz7jXRWFp6cfVtqMti56KL6ctWdXk2eU0+ZxCdKG3MBiZGtJ
 K4KhiuE7kiS7ANx0Y8SdKswXG1OGFk7zgrP0KGsQRmD63qrhyGsvrb40yx+blqOgsgYbMgjxSif
 d1+Q6LvmtJllSXVcg3JXMWe9kCjZZJvHfh4nshjVNgTJGlbeOkVzb6UAm0oJLgM8RMNyg711qnU
 KeKZlEdUZJLax1n4uMCGJcCRha6K9ATYgaYVt6PO81KyNEvLFnjjIg/F879U6qwc9P3EC2fem+o
 Ndn13ZtIEFtLlH3VoqkWIz27q9EGMLNkVAnhme8JR0atmQjCwcP60IXyUmcLNA8WRrICiPOc0W6
 uyHNsLYA7nZhG6Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Nodoby picked this one up for v6.16, resending for v6.17.

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones.
---
 drivers/platform/cznic/turris-omnia-mcu-gpio.c | 35 ++++++++++++++++----------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
index c2df24ea8686782c18b7cbdc62e3ff6aecd9503a..77184c8b42ea21a2e4194074bdb1eef1806a7ba7 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
@@ -439,27 +439,28 @@ static int omnia_gpio_get_multiple(struct gpio_chip *gc, unsigned long *mask,
 	return 0;
 }
 
-static void omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	const struct omnia_gpio *gpio = &omnia_gpios[offset];
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	u16 val, mask;
 
 	if (!gpio->ctl_cmd)
-		return;
+		return -EINVAL;
 
 	mask = BIT(gpio->ctl_bit);
 	val = value ? mask : 0;
 
-	omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
+	return omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
 }
 
-static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
-				    unsigned long *bits)
+static int omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
+				   unsigned long *bits)
 {
 	unsigned long ctl = 0, ctl_mask = 0, ext_ctl = 0, ext_ctl_mask = 0;
 	struct omnia_mcu *mcu = gpiochip_get_data(gc);
 	unsigned int i;
+	int err;
 
 	for_each_set_bit(i, mask, ARRAY_SIZE(omnia_gpios)) {
 		unsigned long *field, *field_mask;
@@ -488,13 +489,21 @@ static void omnia_gpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 
 	guard(mutex)(&mcu->lock);
 
-	if (ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
-				     ctl, ctl_mask);
+	if (ctl_mask) {
+		err = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_GENERAL_CONTROL,
+					   ctl, ctl_mask);
+		if (err)
+			return err;
+	}
 
-	if (ext_ctl_mask)
-		omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
-				     ext_ctl, ext_ctl_mask);
+	if (ext_ctl_mask) {
+		err = omnia_ctl_cmd_locked(mcu, OMNIA_CMD_EXT_CONTROL,
+					   ext_ctl, ext_ctl_mask);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 static bool omnia_gpio_available(struct omnia_mcu *mcu,
@@ -1015,8 +1024,8 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
 	mcu->gc.direction_output = omnia_gpio_direction_output;
 	mcu->gc.get = omnia_gpio_get;
 	mcu->gc.get_multiple = omnia_gpio_get_multiple;
-	mcu->gc.set = omnia_gpio_set;
-	mcu->gc.set_multiple = omnia_gpio_set_multiple;
+	mcu->gc.set_rv = omnia_gpio_set;
+	mcu->gc.set_multiple_rv = omnia_gpio_set_multiple;
 	mcu->gc.init_valid_mask = omnia_gpio_init_valid_mask;
 	mcu->gc.can_sleep = true;
 	mcu->gc.names = omnia_mcu_gpio_names;

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250401-gpiochip-set-rv-platform-cznic-1a136bd47a5b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

