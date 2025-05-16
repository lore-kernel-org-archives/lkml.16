Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB072220F47
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383862; cv=none; b=W+i+W8JFx1upiO0xYsoamvmTC2Tzp7myksOZrZ6koowDEbVNq7k8khIma4NzA7ct6F80GoktcCKvFeuMJrAjf6E5U5cPIZTB0hx9jR3CkZ9DetMygLHL1yD2eKS51ObxkKJYvquaxGvZHGnwJQrOu2H14qKJYH2+RtKq12PytcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383862; c=relaxed/simple;
	bh=YwKjx0fEQ0UuhQ++E/oLz5zeEhVCz3xdDGClQFFBPq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M3sMVDTMqj8vjoo3vU/9+0Ui1UrSgdaX8VauUM2Z/tL/cihgcfUXj68o3gXnB87jl2Eby4C8J07Di5LBvWmPc86M3LDH65PpADMOEI64agaWibPhE4r/F97tZh9bRFDisSGZQp66nQbLCQM3PTOb2WOtTU8GTB+Ddz5m8XZC9KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3pvnsnD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3pvnsnD"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so2549515e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747383859; x=1747988659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMYA3hP9yM4YaD28axG+SVccD5Rf7aF501EOBYAvQkI=;
        b=P3pvnsnD+hl9+Rz2AJK04TNOgKBzgs+A+mFiJAGqgnR8ffMQglx46XLGKxvmqvHY8F
         02NhrMLZnniOL4egtac0omHquOs9WJfo5g2QOS8YmBy6XP+SC5KpWaQf8cYeQLCGR8e6
         /ffnNp2DFkppAh2u2w40/rtPNnK3sw1RGFkCKfI7NxyCoD8UMofA+Hlo65G4CpnW00Fx
         LbcHD1x/dTfOLcaWbboyOJVBSCL1iXJFD58jnqyKj0m9bFHxEUnMO9wBroonLt5Y6RBX
         vBAdMLJMBbBV2hs2dG1ScVW9OUCC4hBiPQ3ZrkYkCMCubg4/Qc6LQ6UpVjGrSAPKC9Yx
         JG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747383859; x=1747988659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMYA3hP9yM4YaD28axG+SVccD5Rf7aF501EOBYAvQkI=;
        b=JC84YLV4anC/ZBhBe8N1jUzmfpKsHCSpeYWpouT/y88PrFDPmQYDNS6zsZXnhh/3jZ
         R11U7iZTMsyaulj9eM4ATiy6Y1cbvnry5/6vewuaRTgW1Vaywbki2ZhxCTgemXZilBGw
         bsamFj2Hlyq/LFanJXXPOlJPmiG1znP6HSc8wwXKibp2S3zWmOsXFZtH0HRFFaOmr8lZ
         3BobBeRjcJI9Yl4xMCLdwlQLCl62aJDH7WA0g3qdipeq9VJnqWNrMwNmOZ76g5Nr8/m1
         dmOwTehFUC7LeIvxI0XijxQgqHGMZlJydq3xYHstuxihhEQL5a8xzbdsTa/VKdxO2H4u
         RT4g==
X-Forwarded-Encrypted: i=1; AJvYcCU/00t2HUTIwtQ6LG2dATLR7xShUvh/BqtdjTbsuH1UOk/xdFLvsXmg8IwpyNv0MN59nTJP5lkJFwqL4os=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw21znjYnbTHGUuLc98dN/PEOGSaXiB2SXLqm6+Uthl2ULThkDF
	WRBNc09t44HjtZbZd1s3zF+QR2jcdRiHiDVDp8e3r1LI+jznazpGhgilUKJpb60YWjU=
X-Gm-Gg: ASbGnct7bwicH5R8x39KVWHzeZShq8VGWh3a5/IcVPEH8f01z2YmgtyGFlp9dVdhIsE
	CNdQunJ3xDg4VrQLsBjG7cY4qo2fVQ8hkzNJC2DukDXjD+ynASZS6O+gHCX6GV4AwchADoPgsfU
	cfP+ljtE8br+ZHMATs/zc1NMlV8dWKkA+jGOPouSezghP3YaZ1sjImMBB4mIlyLdwQbW1RkMcBw
	GR0/WXaxKvR8vuTlbSkBG4FHmrL0wPWkOF+wAtakgm55NfhHbWQrwLiZ22zaW3Z04y/46VdRQBu
	bNXgsh+NJhi6y1Nr2xIOkfio0RgnVtaFzVCzWlHDRfqIm/ylhtKFBtj8wDec4jhvadZG3W1upBj
	A+jF5wgCtaALKx42Xot1h9RdqNGlRYyo8zYpJHak=
X-Google-Smtp-Source: AGHT+IGKToQImfBiAVkuAUoU+7wSjsQ/54y3m2rmtsbkq3t65m/SkGnjmXSlnYIdMc3OVZVxVfOLNg==
X-Received: by 2002:a05:600c:1991:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-442fd675d79mr8193005e9.6.1747383859026;
        Fri, 16 May 2025 01:24:19 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef400sm93411555e9.33.2025.05.16.01.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:24:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v6.16, part two
Date: Fri, 16 May 2025 10:24:15 +0200
Message-ID: <20250516082415.7871-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=YwKjx0fEQ0UuhQ++E/oLz5zeEhVCz3xdDGClQFFBPq4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJvYvRK2E98+gpKrkbPvu1UMNGJxkSJ7aBGB0X
 HDrDM5EEgSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCb2LwAKCRDBN2bmhouD
 1+i2D/9drp29FyK0+15NezDZLAPtkNoejrB9ufc9VlWOXwcQbp+3JsrgMDh0zV33cJRDiVmpOsA
 lRGEDBgxRa3QTDQzIqSYRWt8FDMqSsTlLLInyGSvI+El301TUf8LRpJFOURHMEt3AMhYXUBeLNn
 IKMnoog4YfMdI8zoabS0/wDs2qpZz1apY16TlLyt17ShdsxJXs4xQqNYsM5kzSPu+910oS9f4kT
 PooTBogiZBY0jHt/8wnZL1xFRnJPWGxvPL/ABVaYs0Hm9dE6mfGUJsGBjpIhLVGzBzkp2exgfpe
 JeW6cvl23jCT+npgpUQh161JUtN8bx39UYUr8ZREvF98igmzbQnvp/v540Zb4mJlheZEbb17Sqa
 iaoMTbSPOE2OO2IDOjnO61655sygMcv+TkoIqPve+hkMsv6RWYQRdbRJkyxBt92uZSddhd9367M
 YAEUjaxyXl60SAFhObkCPXDkj0VeG1LZSJ7+uFKbwmZtU26AitsKajMCqGodVxVxSx8GpJRZfNj
 Fb3K07RWsHwww61pqZeM/GKtsOXN5Q/K76DB8zdZ0BEiPAv2itrapXRyxjbXChERnyHeg58JKi7
 QC01u3CV32bkt+9+hPvs6nKDDa0Ih9ia0sNOAL8UPhDRS6HgBILdBPOXj3Maae2AoeGj3qvgHcN VA0kMwq29gBcsRw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

Second pull request with fixes for introduced driver in previous pull. On top
of the previous pull request.

Best regards,
Krzysztof


The following changes since commit 02eaee70babd860d76dc23f9165f4496d0ffe77f:

  MAINTAINERS: add entry for STM32 OCTO MEMORY MANAGER driver (2025-05-07 11:27:03 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.16-2

for you to fetch changes up to 388d0cc33cc6fc876e053644d6af694b9d5c639f:

  memory: stm32_omm: Fix error handling in stm32_omm_disable_child() (2025-05-14 09:54:22 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.16, part two

Few fixes for STM32 Octo Memory Manager driver introduced for the same
cycle in few commits before.  These fixes were reported only after wider
coverage by bots through linux-next exposure.

----------------------------------------------------------------
Colin Ian King (1):
      memory: stm32: Fix spelling mistake "resset" -> "reset"

Dan Carpenter (2):
      memory: stm32_omm: Fix error handling in stm32_omm_configure()
      memory: stm32_omm: Fix NULL vs IS_ERR() check in probe()

Patrice Chotard (1):
      memory: stm32_omm: Fix error handling in stm32_omm_disable_child()

 drivers/memory/stm32_omm.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
