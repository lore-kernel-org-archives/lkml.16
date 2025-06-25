Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E842C3242
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847632; cv=none; b=uCmKDTC/MptKg4ogDzCW9XmTaaijuQhwM5HTwHDj72zcs4TemJewUU47zVqhRx2i/q/sfg3F6Z2rT9b4OxIO+fjfdoQCv9EkSHxxV3fbSmh9CaHd7J1UMwbmRaG1O/n/DhGUcyo3xOx5BNxBThXtZzgSRGaXvllG4biJaqKyJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847632; c=relaxed/simple;
	bh=PW+v0utVLGCc4tkDWP3j2dlPI/ydKBiUWmzZDvFg+uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ST0hrJHOtbo+v1Xw4O4+WNKTjwzQfXsC8SYkZUFhEOx7ZmLKzLOq+Q3UQEqu3GGgShhSQpWS8hL+xpmq8AW7uotC+HozNlask0P/KbzrRxlk1xbg2fBcPiaWP5RIjCGFB0odN9n2qi1Qi8Y7SyCISNcOHzsC05Klt4M8oI23/UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3aTS51wL; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3aTS51wL"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so560759f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847630; x=1751452430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=;
        b=3aTS51wLRuDwavNsZHNC2fJpMvgh71Ijs1luXo44nBqFPeh1uwFJOdpxfPZjfubKyl
         4MQtF/G+36z8DzWCLEwK8MvaZa+zlHqUTmU9GFka6MNEqMj7IDGU+Hp0ELY9w+1iDsK2
         Y2NxSTn7ZF6R/hubj6VyyD24md09HIE7zMyUFDmMHPlZs28p1s7eVxXQkWJDUz036eAt
         C7SS1p5naZYhbLFC982Bk5sYKb3xABywDe8FPdP5+dDtSld/6PIA2yqzRER0zE7hUIo7
         Bo8soofj6h0m/F52EZx7KfO127Mqb7QqabJo5mQQvVkIuShCY5G0sRWosQHbeB27wU2o
         86CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847630; x=1751452430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=;
        b=wGX4XFJDGUwBUHLJJ32PXhlKkfFo5MvtQbdRn2q7nyw8FrGqkE1Gi2P3a2KI5bIxVl
         uDLh3rtoXsCML0urFlBpGZ9Dya6QVCaDT8AVsAb1DhhIbZxxve14FPdAXQ1FvrCDCgCB
         EqpoubPAsoEswtc6lCED2JqJ4RShB5qquPiad6DbPtiP0dvQzWZthmRvZJuVohtAuIfN
         VK857mqA0Stmj6eCtQVgP3vR05eEHM59q+9CMkKTDTl9sHseobBFlXLPMoRjlkrX4Itv
         +FuhtcQnab6BYzk2A2uNqiOzaM4ZGfExVwg+VNZN+zj8aFLKah9ZSevcBBnJSWQGvj5d
         sOIA==
X-Forwarded-Encrypted: i=1; AJvYcCXy609xp1BdLgGcKHSKNVVV5ZDeH1glWHF0PmggRkYAhh80RWFBrhhqYIccTBETEmsiA6DdvBfH073Xpco=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzCQGMpjjXYSJCjQPV8+Ug2+Jtv64J/oZuCdMXbneJT5NV081H
	1E99hlKlFcOU3DhLN2s7FkXvTz5qw3iKeJOzkOi7ybrz0h/T4f6VhTp/8dWe2s/7uPU=
X-Gm-Gg: ASbGncuaAqVWMXmbp5+fPxo2fprb7ngqLBv0bTAumyW3pzBHi9gbJm62XWOcy+oV+22
	+cU94sQuzQF2wIZen7KVUO3i+MX2gbguAqOolo8vvmZR7pLpqkPqh2mDVqf1GFQJdrvffxq7TxR
	xX8Pf7nbUO2qd49QvClUpiB+H1/Zh2GK8t8EAptSnPPHe1gcxYJsvxsUMVfV9Q8tZxLinn0Egmp
	3HLDHWh5E7XieOe/v9A/vBuldlqCKY1BYVsgjIlwLZ8G2Ezlm8Aj5R5qD+aiWQdYbJaO9sfNXUd
	95lPIdU86XmNxlRc4bh7XMGl/9remK5/4H4zjX4j3D3q9ZjZlBGHXzEF
X-Google-Smtp-Source: AGHT+IEwM2t1XefxZU8DghVTXKK8wSS63f829kSWALD3RIefh4AeNCC3TbqP+9rqackkafREvW4tyw==
X-Received: by 2002:a05:6000:4024:b0:3a6:d7e6:f281 with SMTP id ffacd0b85a97d-3a6e7206d4fmr6033940f8f.22.1750847629787;
        Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:32 +0200
Subject: [PATCH 09/12] gpio: stp-xway: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-9-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iM77eXflH98tEqykW1k+5Ww0CPuJn4LOyCx2J1hnDc4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CAekDrQa+N2Lkq1WXdL06pphPPFEQKtl/A0
 icei1YT42+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 ckF3D/94LKQv+DwKv8kgiajCz0+LVB02vWQFLuawtrrCD3lT3mQR99okl12W8v4bFRqrQgkZbh6
 Mwxo9HqCfHrH9G1wPF88tIC0mVzVRDUcaMkkI/b4FaH2V+0uGdss9BLmJOKb1w4yxHpo1s6ud4Y
 nFa0ZFobojyWKWFqWgnrLBkO6Ee/kCKcHLOWs07yKRQSDbkiyhWoVo25QrzuqAUbBe5SZitOElx
 RP9QH+MV5jiCBF1T5PELubMo9gHJaztZHMs3/J/Cv2sgOu6GNRiU5PknjkdXY9Yr3ViaiGNVoq7
 KzUxVZLCCPxGNwMAtpYoCs8OazkrmTFJgeDdd8FaN+AUMRpzElDe5gMLKbxG4ywUxzqBDToLP9y
 ZBvBSYsWfXt7NVRv8ar/BcFa5+wl2NZu6mFOiME3DM19NoL++9oa2pQAWqa2l1pADddWStrecGL
 fjYRJasuaMjmEYDKKb9nnY7P+EqE9fMlUtwzCvldqXYcMGu6vfuiePHGLGUhvB76UPmHagMWnzu
 gdyb6iE/IAa2qwFBcjxH2dgglrcOhusiGNqea293LnB6a4b2QeAT87hOs9fiH7zhoAByf0Vuly5
 yFmAioTpLemDCiO4jMgJuQy02PedULImyNIjLmPw8V7RS2UW42vPkdfq9THCKWegBxq+langWnB
 lWhe1Qpcgf94OAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-stp-xway.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 5a6406d1f03aa75e82423f7c5740fdb3df42dd4b..fdda8de6ca366662aec1fccb475f0698fb478ef5 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -113,7 +113,7 @@ static int xway_stp_get(struct gpio_chip *gc, unsigned int gpio)
  *
  * Set the shadow value and call ltq_ebu_apply.
  */
-static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int xway_stp_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct xway_stp *chip = gpiochip_get_data(gc);
 
@@ -124,6 +124,8 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
 	xway_stp_w32(chip->virt, chip->shadow, XWAY_STP_CPU0);
 	if (!chip->reserved)
 		xway_stp_w32_mask(chip->virt, 0, XWAY_STP_CON_SWU, XWAY_STP_CON0);
+
+	return 0;
 }
 
 /**
@@ -136,9 +138,7 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
  */
 static int xway_stp_dir_out(struct gpio_chip *gc, unsigned gpio, int val)
 {
-	xway_stp_set(gc, gpio, val);
-
-	return 0;
+	return xway_stp_set(gc, gpio, val);
 }
 
 /**
@@ -249,7 +249,7 @@ static int xway_stp_probe(struct platform_device *pdev)
 	chip->gc.label = "stp-xway";
 	chip->gc.direction_output = xway_stp_dir_out;
 	chip->gc.get = xway_stp_get;
-	chip->gc.set = xway_stp_set;
+	chip->gc.set_rv = xway_stp_set;
 	chip->gc.request = xway_stp_request;
 	chip->gc.base = -1;
 	chip->gc.owner = THIS_MODULE;

-- 
2.48.1

