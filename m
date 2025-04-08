Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D64A266579
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097922; cv=none; b=m+hXA+cWCHXH1rZIikdE8MBa30eRQwGR7NXFNlsUaQO3OsbLuu+C3yGzCgeLkUU29+5E/G2uQI8CgXL9lM45fB2lvsBckdRqOyhjMeGcHd2dwtJlDSy4OORG2zDtpyfpEdUGLwIXmJi0s14mKHt8Rs+vzbxCrxr9rExduBsVDek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097922; c=relaxed/simple;
	bh=k5vupL3n8W6xhxCh+SyC2X8XDm9fYPVtRAm53auXbdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XXKzPYqb/yI5nb/0Ogzn39M5cb0ZA3E+eW4LLgn9Kob3M+iszQeiTEy0PknOx9jVs/DUh2DaOaOaNYNe8aT5VXvzCPizQl4F8GRfhiRwCdReNWk4HAfdonC/4vJ6OjrS0jm/iL0zvm2kDEGlICvRiRr7inCD61y5JG1KpMgfjbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RfnoV3MF; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RfnoV3MF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4619567f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097918; x=1744702718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8SlS/IkZp071lE3E9og/zyHpds+/VnXMpibkYRrvZA=;
        b=RfnoV3MFL4Kfa9cy29c85WT3xr2480s+FIJGV6eP8VpM+5Anl3aR6ejlpOM3XWqVd4
         ouPn7VMmNIX27otz9+rWVdals1/PHcc58Bm5M6FnVMXjd7G/wu7ba4lxng2cO4N6KK23
         kjbIML1ZnfNeDwIzXN/P6pxTkAMtJcP1A97Jw23x7vPlZF2yZiP7mbgx2vDvXVzPWKA/
         RSsxDz37a6IKtmAQW5SSVXzk3AciwasBlJQ7GLwQh9WuvMLpKqPeKlXQMdZx4r2Z2RIO
         QmDEjZMIxTS2nnUH7ELmM8fBXEKNDY0H5yUiOfw+n1m8nsSaCU/a39Myzaj+5ht38WaH
         4wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097918; x=1744702718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8SlS/IkZp071lE3E9og/zyHpds+/VnXMpibkYRrvZA=;
        b=jX0uTFA+MyJ1b2YK6gBkgJ5hUrXwVNbJ5y7bwdYnkwoKP79Uk7YR+RpkZmRHEawnRz
         OpD0CrLIwHl4PXL2cc6LjLHtYwP4YUk6dfUII+coSM+7QQuds+dm6IKUyrIgTFB36aAO
         XYIPWkcQNjstUejGw4R2R4aIVyjo2tlWb+5s4CYjcNZcL2s3Ln40JLWpn4kjMVikcDtT
         Qi/tOOVZcqA/2e31paNEMICiFx+yN6rzuYnfA6JWv5ctnpnkV+ItQn3sph0a/s8J1GVT
         HQ1qWRhiJtSoANK4Tw+JHIKdmXyPEplaReQ6btSiNYdajB3GU7MhmAtfOrftFbwuhqhe
         bVMw==
X-Forwarded-Encrypted: i=1; AJvYcCU3/jwUf6OX5yDQT4LXMiuEXEyFZ4M1sGjyfe0C+9mPcpzYWK6OLJ6Ighew6i8oxg+fuWKBV+VAuuThbuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEO2jR3xoGn91LBqULlnWERyMXM5YS4yVs5UXkZPAwpThG9R5E
	zQgANzm4k5q2QMtzdFL08UOf4VhQZ25dNMCCOqgFcJyv9Hu3+0MgYkDoLtLYjFQ=
X-Gm-Gg: ASbGncsziLKOSj6wLJchM8rBT3sEygrjaDXSKuCxbU3qAeIT0/swc9vR/FgIOeidtZY
	8jWLc+CekhldkuR/kwsD3Vpyd5zp/Bv9Wm2G6l3iYlZd7UlbmQ/qcLIZympyqY4htjG0o4/L5Nw
	z4DQ9ylRJi/FWYq3yGNkp2xj1M9jo4EZrgaYuq2Doz3KDX2H0Gv/XQXqeYGJkp9hzMV63WIPklj
	LpAGp9Of5vI4BbJoUKO4BKXGeYdpfYj18DcONP7NJzA1aTw37WKU5bijXARaQD98ZKwyEsSd5yc
	5jShAG8mN8PP7sndZYz1NUrleLDfjoI5aK30VA==
X-Google-Smtp-Source: AGHT+IHVdtfNRfLocT4pHHsOiqn02tPEY93VHOwmAXBlq+2rA/lzXOJPZsDShMGFqryxs6tz2QGDeA==
X-Received: by 2002:a5d:64ac:0:b0:39c:30e2:7218 with SMTP id ffacd0b85a97d-39d6fd18da7mr7950301f8f.41.1744097918459;
        Tue, 08 Apr 2025 00:38:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:30 +0200
Subject: [PATCH 12/12] ALSA: hda: cirrus_scodec_test: use new GPIO line
 value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-12-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1415;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=rJRtEYixkAn0Lvz429+OjNvyXIZi456GPAqjVX8W3O4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJwI/hZOWHfYBr33xc/jFo22uwFnmFIPdbf+
 J9uXUBFm/aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TScAAKCRARpy6gFHHX
 cqwjEACvzCz5vMpsyV0eFMubArpgGfUHrYcBTu/vI58XoaaJrRn6ylJU02IuFBVJaa5+eC32fmc
 LeFZC+OrR60DiWJtEjo/5ufTYHkBsu0Duf6YlDqwrVXWtmorKtatl3IdUZ97IT8uTp48A0VUAtJ
 YCPg0oC6fqO1nhGLBID+MVWX9YZeQlhvCXhjXY+oKJSFyonfi5E/kgxp3LXsDQHLUEi7jPjm+IE
 m4CQlrFVN9jsuyxcnITLxaZwcR0pFikCUgBOmc3thh8AGN8XClJE29KiAlmzr8xYX9QQiPR7TUI
 g0y+HDRsLMDLxf/laKyhfA2VjIRQDJio2AqFsC/nYR7dskvaXMBvusg0UuHDaM/fuWNs/15hc0p
 nihBNDylEpDR8uvBW+sqDbrDQudXFEyqTGU9YOL7N9mbKXoz4ycJnTefuXhpVAKB6ZgTU1AKRFa
 jnzYIW7AR42ow5fP1RsscVOzST5UWek2PD6tcao2PMjuwEtRX4EIe0QkyhuyBQFsEa8ItLt28lQ
 McE91qVbvCciWGo2otcSOSO/5WUse8WUJ4ucHJMNxY85Bha++zf8tcV66fyQ27v2PtvIpImJsAT
 l9VG1ORxh5A0uzmB1wKPSgHCzVYyrARLAnda/TtgHjuZ5zbQWBE65406t1rwp4mXqU4YCItKDcg
 mOTziCg3aSWFCIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/pci/hda/cirrus_scodec_test.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/pci/hda/cirrus_scodec_test.c
index f5d6241daee4..08b0bde1a461 100644
--- a/sound/pci/hda/cirrus_scodec_test.c
+++ b/sound/pci/hda/cirrus_scodec_test.c
@@ -48,9 +48,10 @@ static int cirrus_scodec_test_gpio_direction_out(struct gpio_chip *chip,
 	return -EOPNOTSUPP;
 }
 
-static void cirrus_scodec_test_gpio_set(struct gpio_chip *chip, unsigned int offset,
-					int value)
+static int cirrus_scodec_test_gpio_set(struct gpio_chip *chip,
+				       unsigned int offset, int value)
 {
+	return -EOPNOTSUPP;
 }
 
 static int cirrus_scodec_test_gpio_set_config(struct gpio_chip *gc,
@@ -75,7 +76,7 @@ static const struct gpio_chip cirrus_scodec_test_gpio_chip = {
 	.direction_input	= cirrus_scodec_test_gpio_direction_in,
 	.get			= cirrus_scodec_test_gpio_get,
 	.direction_output	= cirrus_scodec_test_gpio_direction_out,
-	.set			= cirrus_scodec_test_gpio_set,
+	.set_rv			= cirrus_scodec_test_gpio_set,
 	.set_config		= cirrus_scodec_test_gpio_set_config,
 	.base			= -1,
 	.ngpio			= 32,

-- 
2.45.2

