Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB512580E0
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622747; cv=none; b=fJ6EbEr3PsmoZ8lOxLIy4Kc3i/m1HmVOOLOTc4DjFmBzRo4iULtibiA3HQD/E0u7qgxjvXELSfN6RpGEX68rpFth7TF2M6j6NlVHAYJ2isJwno8AD6phZHF8yjZTRm77cPLoAxEwE3I/XZzk9N3DChFAeaEbwBlOOAldxhx8Ixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622747; c=relaxed/simple;
	bh=MVqxawyNb96iRVnkoxL8y3RC6hJHYCWJTgkVT9g5/ls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gOWAWaxS27g+BCAiZ3/FhHwxeSMOk2WCfreLrxqam3R59bgwm2Xg+U5CNvTrBCZZGMAl4uwddFrno7Harmulcpc8dLNMIma8nxtvPjkDrl0TOZ1/F9ci/5yG6dRETERtuHb3EGcn496vvZnkg3vKgmF/qRtbXBIeGuZPSa/SvH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F/P9/eWq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F/P9/eWq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so8012024f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746622744; x=1747227544; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0RRD/vFTkmGzJVJl187rnmFHQjXKt5IA4r05/FngQfU=;
        b=F/P9/eWqDprlJgJbYRtNzW5nJFIzW1YVr47IENsJpa+JTqm+VmOvfEZu0q65nbrVZF
         IaeRhfljXIUCH5ytd6qkK1ng8BkFIiFF/YmX8Y7nVsn2dPfyIKDi7/kWl/sFxEDUgeja
         OrmwPkdvug+MPNo58Gd9oAY4ew+rPDbB1z7kamk+Jw8SOEzr9tv//6hYNOG/lKrvDJ02
         qzxfUMP8e4pd+MaNHhlNr03gtAm6o42bPx/fA9dKtmknbQd3I1aTmRDkNQI6fBgTqiUS
         MNYz44dVOOVKF/TIICUMOR2dEFRZCxl8huWBnNSZuwPB1uFyUmAzrMYUIYehLLfDMt2+
         bILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746622744; x=1747227544;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RRD/vFTkmGzJVJl187rnmFHQjXKt5IA4r05/FngQfU=;
        b=OKTgpQsWpOELWDvhz1B2bhz08+G6K7N+ovMmblC/d2foxU+BmF00CxDjZ7FFQHX/VP
         akN3/YD7OTb0PMw65Mk+M5Y24T3E9shKMttHLbGzazsiwR7dnwV5lQqrkbLE1HVKKyQx
         XYsgM//ZFea+XyfDY0JWey6vSQsmYY3A3FB54sXFg5UvPld6c7pa+6K5jALSBYUCrzm/
         nzOauUU4HJwSrvHAIlvvLWxgdMG/lpeC+/dODboHH/vzMY1SvAMPf2cCaq4tCV7f1mZ0
         A3hWFjfUUsTqzinc+kj+QA20M5iWjeNHFWV3Z4MKRpNIt+fmgqLk0qU0xIeXTg7qNOMG
         4ATg==
X-Forwarded-Encrypted: i=1; AJvYcCWStJnrQ3NyG2aE8n8jR7pIrDbO12/Z3oY/9JYqp8xE02RR+LCxfusSpNB0OjFNbpJ6Tw4EsPlOk5q4GVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsUMqny8ddmNTZ8Xh0COtCvfjUSV4F6+8sLvZjnFgH7NoepTCd
	HWmyINENtoMU6HoKtNRKhhXhcH5XCiFDr/Ntc9zJHqkLsjZVoh2wQ+eXVZ63XBw2wOJzFwYQjDH
	M
X-Gm-Gg: ASbGncsDevYerEvrFiA5kF7zNHVnr0/uNIcbBt+Q3/lnvlfy12kybGOaRMFu2tQ1aH3
	kDpnJpyHsoz6aB4hf5kGyM6WOo8jwTYGdGjn2e/7LP7IYr6XLVSCrHRu8hZZLK/8S35ZHgvyfRF
	laZMdSD97M56yQWH0KRl2dd6KhGpZXuS6BQI2/nvTWZdiicjDfSd25YrmLAML47Hee52rlSQtpr
	pMm/oB4Hjl89fzAKFUx621fhwnGlTgTm8GFkx+YWkf2yqNRDvm0wb9VqbL6bogTsu2RLIPVBjPV
	8iUlI+UOIX9JT3R2c68Cael+OQDE2lhApbwgu3W2q/HpCA==
X-Google-Smtp-Source: AGHT+IGsSMuTAgYqI4wtcBoKdXPHDvWaWYH8enx/xlGJpO0gLwyPuArBF8AKXQOe6SYKQMsl8Q0xsA==
X-Received: by 2002:a5d:5988:0:b0:39c:13f5:dba0 with SMTP id ffacd0b85a97d-3a0b49a7f45mr2596695f8f.13.1746622744205;
        Wed, 07 May 2025 05:59:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a0b501a197sm2545233f8f.76.2025.05.07.05.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 05:59:03 -0700 (PDT)
Date: Wed, 7 May 2025 15:59:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gyeyoung Baek <gye976@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] iio: chemical: mhz19b: Fix error code in probe()
Message-ID: <aBtZFLFlr0slcYSi@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM if devm_iio_device_alloc() fails.  Don't return success.

Fixes: b43278d66e99 ("iio: chemical: Add support for Winsen MHZ19B CO2 sensor")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/iio/chemical/mhz19b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/mhz19b.c b/drivers/iio/chemical/mhz19b.c
index c0052ba3ac6c..3c64154918b1 100644
--- a/drivers/iio/chemical/mhz19b.c
+++ b/drivers/iio/chemical/mhz19b.c
@@ -276,7 +276,7 @@ static int mhz19b_probe(struct serdev_device *serdev)
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
 	if (!indio_dev)
-		return ret;
+		return -ENOMEM;
 	serdev_device_set_drvdata(serdev, indio_dev);
 
 	st = iio_priv(indio_dev);
-- 
2.47.2

