Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBD0289E1B
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746628558; cv=none; b=qYZNlE5V0lWHrG+ROtskceRGkHrrkqtKzM5nVKFQvN0dVVqGla+yfGDNVpYElZ6LKcylWnEo1SYhHZOsnLKR9UAIXxX76foIdwlQloh2SoDhtYx8m8o243WVbL2YgdfUm1/V+JFxOHxR5x8tMKSP4OyBLoQM900kWwa+6W2CqdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746628558; c=relaxed/simple;
	bh=1vJaV5IB3PQLrcO3XwAI003ot8u30fZLIj9vvrH7iAY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgzUiL3Vg41vxxO5q8NdAIz6ouA0Vo+ASdxEPoAAZACxtUIx/zCE/EHkO3Zae3by11LT85qVthFYoqDu0YiOQjSJTgV87K2xQqW3Zp+ceUV3w9cyUrO/yOyBqEBpjILIdYg4ds2UhhgmaleiWr2rEsw5dALCS7Pkmh+yx62T1EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nh62yrhR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nh62yrhR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso13833125e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746628554; x=1747233354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PZP+vwFNWuh5ghEI4qOKuQl+IJHm3W7oUZPfVYjUgRU=;
        b=nh62yrhRcUjU+nz7qykKCBu474EfYvXE1KqrWFiUo06p9xJSHYzeRYXSXfzCt5mh1/
         T/i0e5UhCuosauWgV2Zk0Wivpx1RvSIMnvNG2g5QNWXiOv4l313YkWn5FguiVjTwkm4C
         bPGOQnAF9k9A8rehzSSfPor7ESRVu3iuYTVzrM47gcrg0tvTwLt2RGgrA3wgtWXe8Tgk
         0UMp7SNyoT6ZppBYl/9Xpav+8YKoVcRlX7QSeRyC9YMrvKWR+hZPi10MUc+N4B8AQOej
         3jozzO6V6rYShCF4zyPOgkW2OGqXsN6vt8JVl+Kaji1mjX5YHaK+nJSIK62Rzm8K0v6u
         Zhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746628554; x=1747233354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZP+vwFNWuh5ghEI4qOKuQl+IJHm3W7oUZPfVYjUgRU=;
        b=HACjuVroveU7QmO0Go9FuX0fduiBGVV9YODmXuB7IRpso9cTDidgoFAksMeEvBqWKc
         X8L2834h0TLU2FaXtsXioV765ALSkQIYjPD+O4EUZvvy0jti2fXk4bAeK/4S4j/k+c7W
         rQOs7Oy0aRVr03aRgq1CcyN1/ApDJJ1EaMfWnwwb/exs4zu0dV1TgozFbe680QRMGSVj
         W6rO+NB3+dX3NzahZK7ureaI4S7psQRRfvFeDlbCEL/8tZrNXpx2qvLbU7Z9TVfFHNhg
         aFgRiBqTsl62lmvRGQmIRrJ6sOOOAGTuhi3oP9ALiWqhwPX2MKk1auHQlYQUC24qPogm
         guVA==
X-Forwarded-Encrypted: i=1; AJvYcCUywf/h0Ws6maxut5pcRMruH34qG+Z4VByl4NGRq8aMFU0C6pkLTnMcM7K6QdUeV0xrQm5pekcEmk+CRz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHfbj7ptbE1TdSu2CCKa5O7Cf5jwqTylzUA/WHAGLvH0I/ESeY
	xQ1KqlkceTmXyX4Sng+ZXaBqbYGWGS1thUyGuleHOnKmDXB21IajW0EjY0ozea0=
X-Gm-Gg: ASbGnct7akHsEm81/PWVM9myZ0uuPDu4w13v3tl+RSbSVZJROdIQvVdmtDKaPRxWSrw
	H5Uu811PhipDQgfmz9M9ZAZH6Gm2j82+ENsyDslK2ccjYD0JribL1q/mncbw6SP5W2wUdq9fc7N
	NdiZ2RVdNcwx04Z0xZzcPHNhXzMD7tnpLNWhyE7DvBglTDfeDuWPwjhU2e0RRxLas6zw5J7PjLt
	XM5p4vNGwQ0kETbhTvmUsfe067hRCHrvR9eDQguJ6QBlLhARiAN/zjdpy81QBU7zHO49FaDNU8/
	lZkWRibgybryjn9zHBrEAg2UPqIlIuvlLcYhYpe/lw==
X-Google-Smtp-Source: AGHT+IFha+RZUAi+OttzpPGZymHN1i6U1q2b9g+xVfZMh7twm5F69jMyZbgHMqWJlmduu30guOSv0g==
X-Received: by 2002:adf:a458:0:b0:3a0:b53a:7b3b with SMTP id ffacd0b85a97d-3a0b53a7b97mr1913697f8f.12.1746628553963;
        Wed, 07 May 2025 07:35:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b323:3744:4800:6909])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b9322eb9sm123475f8f.3.2025.05.07.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:35:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: add stubs for OF-specific pinconf functions
Date: Wed,  7 May 2025 16:35:51 +0200
Message-ID: <20250507143551.47056-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Allow building drivers using these interfaces with COMPILE_TEST enabled
and OF disabled by providing stub definitions.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505072245.OgSXI1hh-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinconf.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
index a171195b36159..e1ae716105261 100644
--- a/drivers/pinctrl/pinconf.h
+++ b/drivers/pinctrl/pinconf.h
@@ -142,4 +142,21 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
 				    unsigned int **pid, unsigned int **pmux,
 				    unsigned int *npins);
+#else
+static inline int
+pinconf_generic_parse_dt_config(struct device_node *np,
+				struct pinctrl_dev *pctldev,
+				unsigned long **configs,
+				unsigned int *nconfigs)
+{
+	return -ENOTSUPP;
+}
+
+static inline int
+pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
+				unsigned int **pid, unsigned int **pmux,
+				unsigned int *npins)
+{
+	return -ENOTSUPP;
+}
 #endif
-- 
2.45.2

