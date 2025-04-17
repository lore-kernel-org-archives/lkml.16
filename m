Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AAE21D011
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876006; cv=none; b=vAmMjO9UNLiKYq2L7J6olnMN3Sv5uNu/TgWmtxgwsgiIDawUh4TB+tLRqaoXRcjViPuT+ugEfmIMWvDX9DvWuE9g5ZMEBzcajVHOxTNSjTbb51EnwbdJOouP6BYZjtoMaQMB/06dmv5mYUxR4LZT412RItuf9t04+w0qR8Qizto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876006; c=relaxed/simple;
	bh=wlIEevCmjQERFYbQh8MiayyzelN6WBy0a+lSUqPchRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mqwe3eE2Wppjk5zzcgFbsJMHDUGMu0z+wyU5iU6/HUUv2vMh0O2zBiRoKtnujDK4P6YeuG7e3DeoNtB+LSlaxztk+7MPcgUA1qMez/ZC+aPp/1SPYKCpGS5VOn7fBIxtIgv89x8pJ+djhgMt/6FkUvZ0liJtIpm64ERiq+4pFOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kqkKGwZA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kqkKGwZA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso12964f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876002; x=1745480802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A08pQAastHDutVva01psuFdfpJpdF/00lKzxtTarv1U=;
        b=kqkKGwZAMsMK55HiznNAnLXatL28sn8R2HwuMbpZ8ASt9GvhRuyjhXn7OO2gfVB+SP
         ThlpXIbCxZhIkeLH603oYgybWJ0RYB0vs9Y1KEPPzktNqsyGS3RVc+Q3/dD7oFXHPX0y
         FuawI26bwFyejyjFXxbe2sQb1HjTNRZSF54ANcv8IrZV/fgF12FylznT0iDzKaHzdfNr
         K82v+NgmGw9nA5tFFIkWIsdHPXKL7pERQfyoveB8/c9/EvcRiDpSb0ruiHhTVpM55nJq
         DCJDMmW7HGidHYAhYQS868m7KYQ6VKo/Fjj6VU9byZfl3dLoq/gqjUetyiHgzNVN7KzB
         MLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876002; x=1745480802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A08pQAastHDutVva01psuFdfpJpdF/00lKzxtTarv1U=;
        b=KnEyxDzYkpknpAOoz1Z8Tl94bn3i3F/7LqIW5S4iYfCz1wLHOC+hoQvw4YjYq6OG2V
         S/Z3w0D2ak7NjNDm2j34dYFXUR309WntVG4M9+78LNNWdZifOc5Xjd7ThyQsVmHdLPAO
         taZ9l0xWJID2ivt0DRZP2nZlOpaFqcJ/fQb2hAYOhX8nqCBuIyluvkimjj/lXoAqir60
         /rrP6Hv+BMv0107EgbNhjNTpLQWCsI2dIRuU911ce2chDMs4UihHPBlPsKY1PyDsHxP9
         RJFDx23RwTuakWaW+/kXHioo9+/P0DRzm1k7Xf3EpdTP/8U8irBLbZOHturgxxispCAc
         U8RA==
X-Forwarded-Encrypted: i=1; AJvYcCXAG1oqyDqu1scYKHzYuHB1YS1b0nUuolVgPgaEE71baStCKsl1TWNe7h4gK8gbecqzjSErSv35uW5m8Jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOwds0w3iG/SpeYHXWKgbE9LeSzmHu8pcIO1W5ZYNIrr/gW6O3
	TjTz3MFYXFMmXJV+VZqAAKEmZlpk0IOJIDFIL3m1lalfleNgPhndpmzbcRzOCZ4=
X-Gm-Gg: ASbGncuwW6s2p6JbnJQFe6+mQLMbT2Ix0f4iz+jELwyQjtvDH3IUlHEsyOLvUsbodJW
	ghMYB3EIjaBBG5kyuVqpa7RKrEc/RmKgnh8Fh0ryYTpARDd+2uY/ajQKSW7n0MR6PKlYfooLGdo
	lf0DXqSebTiZWlmsz9PgyJp3EMTzE70HI9MblTsqjYoFBwDxXbUj/BVeEJ54WZffCR9m8T/c3Bt
	i6IwVeXVDazqN2OnwcF+tPZc8ZX3IJpx+a6PtuAk3vqZPSz2iJBxMLRnJoXtVNKp2Q/nQoeUY0G
	rx5wtV2Om8mqe6G6AQxE46QdxGttQ7l6680d63aV3GbROPhET4QQVAmqMZGJWXCVxnqBjShYlIA
	CWz5pSg==
X-Google-Smtp-Source: AGHT+IEvdZo2BLP4z8UvFx9FOWgsN7YpYjvUGwIjv+v2bOJs109wEHkXw6zQEzo3mhQTonujYPjgIw==
X-Received: by 2002:a05:600c:3b83:b0:439:9595:c8f4 with SMTP id 5b1f17b1804b1-44061c3741amr8732535e9.0.1744876002430;
        Thu, 17 Apr 2025 00:46:42 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf4456fdsm18922542f8f.86.2025.04.17.00.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] rtc: amlogic: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:40 +0200
Message-ID: <20250417074640.81363-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers, but only allow to choose to compile them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

For longer rationale:
https://lore.kernel.org/all/191543a8-2e2e-4ac4-9b2b-d253820a0c9f@app.fastmail.com/
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 838bdc138ffe..6153c50d1abd 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2088,7 +2088,7 @@ config RTC_DRV_AMLOGIC_A4
 	tristate "Amlogic RTC"
 	depends on ARCH_MESON || COMPILE_TEST
 	select REGMAP_MMIO
-	default y
+	default ARCH_MESON
 	help
 	  If you say yes here you get support for the RTC block on the
 	  Amlogic A113L2(A4) and A113X2(A5) SoCs.
-- 
2.45.2

