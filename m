Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCB124C676
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734133; cv=none; b=N5+1DFWSEkHONyVONyBFxnEYUjwc2tOXpl6hxHX2qmQ8bUvTs2OzsYcMrFhv8Rq9sWJIy36IEmE+yHK2gPOWw3b6Rc65Hc5x/dsitqPjA/BljzuCW6v5aNOZNTqd6Z4zkz+gJAaLcSZM/1X+kBzeuON0/VzXTWPO9C7AUUc7An4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734133; c=relaxed/simple;
	bh=w0yxq9GrB5wxpDo1vCkzUf7jDpYrthjvxTQ7Cy2YDBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5xUTBCRd2SiQbl4pJAaEEQHzLNtvBdC5qSiQlDxwTzYl9ePGkAlAvrzUckh79IPo+CViGEeooM1V2zXoJSLLGx1gV0NjyAf22kHSFPl4LYVLpcPivPFbOvUn3XOkIoh2skP5/viD8qzxtZHPc/kXXACxreE5QbfetonsEIBnHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=q7Gq04ym; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q7Gq04ym"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cfb79177so5342705e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749734129; x=1750338929; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGXLWLYyw9ZyCRb8Qq3Tm3IRZiXBZ5znvzTh5cF4+vI=;
        b=q7Gq04ym2orqMBi7Ku/7AwQgKHfZNQsXkbJ1YjDeFmzesRAWZSeN2MRaprBe/x7syc
         UQ0SjHFWykfr9AP59NZGVp79zD1tD4BXhTOsLAKelQadkjSxp9LLJ4NJ0zWpw7sUtObh
         370c0gAX7BxV8/wMRuaYbYaQMOkhgpKI3vZSypmKg6Tu+I7p0+5ZrfuLUrJ6NEyzPKQl
         xL3FMSCkihfBiNS4EnKkldqDEcqll/PRiDhhIP+157xtmFWy4xIZamCK2onwgm6O+edB
         okfmk7R4quaA8FZp4ydlFFTUQkpwNkYRle4A5D6EO8lAqfHNmaw+dQ6qefphzMqjhGCn
         IICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734129; x=1750338929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGXLWLYyw9ZyCRb8Qq3Tm3IRZiXBZ5znvzTh5cF4+vI=;
        b=J65Mh6Lhl8vHCID5KXYI6y6HNPuujA9AAGW5iO9QQqghRgK30+8i07/MppufUSN/ux
         h3ov/I1+CIVeM/y/Nla9+TB3k+aUdJh9lOhpGCyRYS9lYOIbT4ujN04bJxx9n3YZhgsz
         5KUXkqhJMpqhQ25AdqLD0VToZcL/KmI0adYHTnZvDGxYF8fLs8eDsn8F3h52bBe5BFrR
         H02JtEwGRNv9ToVREbKJxazEatkVqtt0wMl7ERwwKBn57V7D9kvgmiVRpCNwrrIsdeYG
         onzu+zzItG/Gd4EePOWPb2Sm4uIoHau0hca+A66XM0O2d3r2h2u8krkUEXVjeg1HTb9E
         LCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhYQJ7SPKm7dslJeIHPKNLBx4R9Rz3d7ctmBYMP/fsgWk0JjpaZAPFyZ7vJuIqBvs429HAMLYb/ZkSpNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynd+mTY98hbnX3yPMMCdXrYvnn7INs4oENIz5RxfNC8bUAAP1F
	H0ZL8kYkYvFTNwylEsL6ev+Q8jDECDAyy2hHaUyG960/JR+ndFsdDh+y5pTPCb+SiRk=
X-Gm-Gg: ASbGncu+X7ioYoHxyW0QNN/fZz3fx5vEtsaCELEv77mh2GiFQE9k42zrQiwWrlwlAae
	5qHmLCTLDJqp0bgOfg3KDniFqQ8rqXHmrexemNJTujUCPX7siKF5EPyMoYNyz5KUUL475i2nSv2
	T2UbYxVE9rLBheu+rDoBcrYN7uEY/UyvNByU1zPYb56sX37MZpVvaadF8KZjPEnMvv8gMjXRxu6
	wwU8MMbdoyGVhnPNvj6OJDhOnWzC4xL3t4z3uV4HX9hmLtHCtCETz3WpsOfK+xAogxXUZ4IOirV
	+D3G83J8M6tzqxCWEVcwP3K5pFU/qOjgG7oDiFNZyMMbIIzzluGMZFo=
X-Google-Smtp-Source: AGHT+IF9IZN2MS+sYW2ouGCv5DMbUlGfHcNRSDur1nJMOJwR6mhtfhHbo2K0m63hGJZ7Lzm9t37Sjw==
X-Received: by 2002:a05:600c:3586:b0:440:6a37:be0d with SMTP id 5b1f17b1804b1-4532b8c2c9amr37528825e9.15.1749734129300;
        Thu, 12 Jun 2025 06:15:29 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea17d7sm20619795e9.10.2025.06.12.06.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:15:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 12 Jun 2025 15:15:16 +0200
Subject: [PATCH 07/16] pinctrl: xway: statify xway_pinconf_group_set()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-7-556b0a530cd4@linaro.org>
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
To: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Baruch Siach <baruch@tkos.co.il>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=9Q3bm/CeNxC+8oeWa7fm99HCVraMx1u7Zl7EzaVQzgw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoStLlNqDuphL86C99UAAzPjSE0SJSMbsWkwcvS
 zysyjdjnZKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaErS5QAKCRARpy6gFHHX
 cim+D/9Yvh9pdH0HyHsSxQ03GvnN1C9sg0macmAjL6e0GEFn8NRgOxEnXwKbStGp95OJYoTJ66D
 jGvdoiWzR8UqF6TssAx9xGFIRvMWV6PZ5DknaE1I8c6T74vJmoJhu93H/sDuwVLrTn+/DU2mCFA
 jnPNftQI2C9KH4WKcwsW6p88+VkRHVVojR71vHqEly1CvfsUDt1YHdfD0b/i7sD4U6wKsdF5Je8
 dfcENemlDbwdAwAgiGY5Fh8LbLSRWPLeMG7zzrMuVwW4epppnpeSJLV6UKgrCgz/czoIVYNPyDs
 Rf87bKBsOdzu2II2sLqjC0FpkgsgGpfEK4Y0cgLsAHYSnu+AzsTWVPKtM7UVYZ05GRHLuxcKgXU
 PjLnEUr3bR07xBoubOEXOjQKtoV2wcZ5/dLlfo+MaNMT3ub0nw+qNhQMbGGSdNBqsTZcCLcG81u
 qxqW/N41epJAzbgUyQziedQdsAi6pZtSYrCG/HNuuBhbMSTwQTKr9mA5lODj6UwJC1c6owybPjp
 cPVB2E90EJN97TqqmSlpCm5As6SPt63bD+uj0RihsW/Y63BWIS9e33rzwyS8251w5U21iErEzoU
 pk8qWDKqMb8tuCs1JuJf5+bZ69qI1UzCzDmGyaad1Ncn318qefMNQozIPqs0Jk07IWgHAFzqn7Z
 KLFaSAY7+IyRMHQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This function is not exported and is only used locally. Make it static.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-xway.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index 48f8aabf3bfa3ae18f3eca8ea00c6e796faf4500..02e65d25e72911b812446ad4b90bfd611c9c1714 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1228,10 +1228,10 @@ static int xway_pinconf_set(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-int xway_pinconf_group_set(struct pinctrl_dev *pctldev,
-			unsigned selector,
-			unsigned long *configs,
-			unsigned num_configs)
+static int xway_pinconf_group_set(struct pinctrl_dev *pctldev,
+				  unsigned int selector,
+				  unsigned long *configs,
+				  unsigned int num_configs)
 {
 	struct ltq_pinmux_info *info = pinctrl_dev_get_drvdata(pctldev);
 	int i, ret = 0;

-- 
2.48.1

