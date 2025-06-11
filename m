Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416AD2750ED
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 13:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749647393; cv=none; b=bRhSobncqB9SXklX/QG7WRW6Y1OkE5BX3TKRByWjsT8ejOERWJs0YC8+FC1Ht3QDvYBa0uWCEyAw/zNazFJlfIzYh+MFtkFDWJ4JwSHNgrxka9iYK+urhLc9vMpTwL82T/Xt8btorxtojdyOhSszVRPPdpQ5YVN/GusXjhbjIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749647393; c=relaxed/simple;
	bh=L2yruaMlTjnh6snqZlpt4phoeh5TVI4kMDcp31WpKUw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P25yBjN0/4TjgtJf4PnXOjgpms3ac0tXe7x1m/5HlmS7PZCg4NYEX1w6Rf007ntEURty5pCPSR56C1NCF74zJOLynHmY9gFMQCoHwmDMM24UeKYzPN9J0C8FzN8HxE4Rw6O2+wLQabc91Wo2UlGY0yB6wHJFyzhHmYgVEGWVgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L3KnW3Uh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L3KnW3Uh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso42609455e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647389; x=1750252189; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZtQA0IihRFr37LmrEZeXl1GzobVsfcdH49oAK/210w=;
        b=L3KnW3UhmSOCJ6NAkkrydI6OhuvBQlJ7G3QK54wpYUZzW1wCelUqiscAOSqkCACntn
         zvIv/vnKO5gynA35/c/IPrpNt65kXIMc+GdWoikR0Kn6ZNMpzYLNciqHJ49U/EhU/S59
         IouqO1dFu86kadaRqSI604ybwh+w534FqyohYGG9usoFIs30XHMX0LUSBIzwpxZGnY9f
         ArhnNMjfnO0aMmx1Z6Wh4xTaAqZRevqTMYtOCG1GwQq379dHg5RPzdZDWVPEUHgYXISq
         Myh1B1Dj6DOVoD69p9E07cOyMvMfAU1BK8ED4R6s9Le+/Ol0UvGykGwoAsLrUf/8XRbS
         h3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647389; x=1750252189;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZtQA0IihRFr37LmrEZeXl1GzobVsfcdH49oAK/210w=;
        b=EvKiknbDwxOepD6C73m1t77UvACWScg67V7uUgoBflQteuuLH0hGX3nUkYB1rTg4/a
         eagWwavXN84v/EzV+5fJbriq4XCOzf+GIOV4Yua7fUHY3ZxMZ+6JRk2JnERBBUg/igvE
         pM/rNx53MbRJNqeq1Wc1CP8mTiZGrBdan4RUIepQ7Dg/4c6suWTh8AkKrlZ/fwfMxKqn
         mUKFcLX5jEHPA2ZOXt5//wlL8CXmZjnV+FZAYGLxjxrNalOSkMwXA0kiwBXG4Dgh3F1T
         1WGtQNjIx1uONfSXzSRSVW0PekI2Lv68q1v2c0cpE3W+EZ7YMgw3MvFiLE7HBNQvBwmo
         X7jA==
X-Forwarded-Encrypted: i=1; AJvYcCUGgWqpZUoge+N5QLL3tPoDuobnBMgUIVj0RKCoWbwjooTfOt3DFfZndxyWPkPXItE0zfx0Om7sYzMlAxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtDaqdE6TMUJfxMcedF9cVQ4R5pMfUN4Bt2iFNndqrhHxLMTF2
	J6lVrtVgd9qhPhd09a8oV4/OYDZFUxjwWNPkviJ4F0BlK2IQ9fQ2D3LeP88ShwqZBHg=
X-Gm-Gg: ASbGncshkQoa5X/Mu/PDVTfOvyYoNrkyj55stbhGghAQ9T4Fw74K9Cau3Cvz/5b9Rao
	6t4489ztABWAjZ/OZMuT3zk1F9bUSgvpVWpnMBS9pHolGoVXH95TKRKsD6Sv9h/so+EaGrDKiq9
	C6ArXDbmwwcvaSmIh+4U49oks/E8eo/aHrce7PXRqSnlStrb9bBmx5pbABEP7clzTbpSzTTO0HX
	S5GB0ZpY2D+vs7FMz4BUsOVbWte6pwwXnxzGP6j+ka0/w1N2pZCY9yRocznczfaPNXz5bPin7xp
	QqVo8ZKGSqzVU6JxFD7KVw/19RgG4TN1nYc407dWxK19b/9s2RgE3T0XcAp4po2+0JI=
X-Google-Smtp-Source: AGHT+IEBRO+SagBJ4t0nPcz40k+JfMlWO7SvxBp7cy9P/imnH5Z03hsajw0WU0mj5IxyTgoNyCPJNA==
X-Received: by 2002:a05:6000:2204:b0:3a4:fc0a:33ca with SMTP id ffacd0b85a97d-3a558a926a5mr2258868f8f.4.1749647389545;
        Wed, 11 Jun 2025 06:09:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53246b678sm15078061f8f.101.2025.06.11.06.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 06:09:49 -0700 (PDT)
Date: Wed, 11 Jun 2025 16:09:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] spi: stm32-ospi: clean up on error in probe()
Message-ID: <aEmAGTUzzKZlLe3K@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If reset_control_acquire() fails, then we can't return directly.
We need to do a little clean up first.

Fixes: cf2c3eceb757 ("spi: stm32-ospi: Make usage of reset_control_acquire/release() API")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/spi/spi-stm32-ospi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index db6b1cfc970f..4ab7e86f4bd5 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -937,8 +937,10 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 		goto err_pm_enable;
 
 	ret = reset_control_acquire(ospi->rstc);
-	if (ret)
-		return dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
+	if (ret) {
+		dev_err_probe(dev, ret, "Can not acquire reset %d\n", ret);
+		goto err_pm_resume;
+	}
 
 	reset_control_assert(ospi->rstc);
 	udelay(2);
-- 
2.47.2

