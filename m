Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483527EC7D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747133989; cv=none; b=AvBWyjAicOmZnaVaOtVui47Bx/AaO35Mfh5XYeek3aysyBbgfp7O9L8Uf4rmFIQnGBD5jSR108RD77ng3D2UWAKOA4x4qXZzS4hT+63lfMenmTvreEZtnFvFjS3KEg/deJ71KyoLEefKMMptdK5JAyLRq0vbnIoY8dbgc18oozI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747133989; c=relaxed/simple;
	bh=GAD0kFJ5YJ2FK8mLZ5w9P8zRKTWeWXXWX86RwPrS390=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hxnZRZUy1zjn595dmtyNP+C5+dVnh1EJuO+TFpqEINUOZAFwEghGPwfBg809ney2u4IbRO37+ZlA/YCtIpXl0N5x5WSWxwy/S7mOz+t06/2Nnghu+MidHFmK/F2D2DV7Ryt9BjnoBrQcCLsTUjba3PdUJRmn5k83/i5ZHyHWFVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jQUXizoj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jQUXizoj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0b5b90b7aso636687f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747133986; x=1747738786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=;
        b=jQUXizoj0s8tXQLdH4D/428a8dG6y31jd0Ts82QycPUYpPMD8QOTcNSaNsD9QXGqaQ
         N7EJtnF/1sXZ+zyAGfVvTU8Z6AvWpTWtUAx+JQi1hBU8L1FgaW945syqGhi5yYbOVACd
         AmTHpIHncEHrWfjd+0C69PC2qRfCv+6OYYECgUPn4uBhDiN8OcctKblOtSrnew00cew/
         MnB6jv+0/OiDLxKijrCOXcxtXmKGAkB7vEpo/LQu+dFQrMqyJsIO0AtO+yjWK1Czfptg
         StKYg/o4Tx3IBVCG1uF2QLgQp10cJX9kBUPW7eF2lGkZG3Al3BNUybnyRqWC9j7rZ21t
         CzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133986; x=1747738786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=;
        b=MKfx9m1uwxbfqUG2CWQAFqonOoDKrWo9SROSHv7BRwlDlTkQ/lhzD5SWih5YTnJnzh
         p/n3StmSf5YwyBt9lredo8VA72h3XCLWDFEujQsaJEW3Y4tLaRE3zfKtMSN7j28FdlB4
         Uwua42YVcyZcx8+tHZs6oLswKZx9t0W/5V9fmF32RgQ6yBXIFnhJWvU6LfRU5oT1Nuqw
         k9UMQqEyVoVCjfAypD00A/FELqjRCK4nz0kPAUn1GZrJIjt4v9UURx3Dp9lbCLSoXQMt
         TbIo79BnUjGsGZIZ4x6+G5qtYyJzpdbEt+E3FwjyRu/ebfhkj1TFp9oDEZjeRzqi8uRi
         iVpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0KtRZV18ElR6ubfqu8I15uyXfgmibR4pGVtzr2qwe0c28NhSKzO24qdjhrSuy6ZckasIrMzMQEcSAxws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CXscSyv0Wmrd8WHypZHign1n1DeZb6wmRAVhxFVvI0197nvQ
	8B1RsC42SfFjXVqbrNjqoylzNXyc5hn9a0FjgCWTu05Xrd7QsxE4TuAd+YQyJYQ=
X-Gm-Gg: ASbGncvGDoIyOvd/unuPega+lZOvrnzcBs7ZUxBOOQSNzR2nY2CxolWCxOpourY263P
	c2SAtJ104x0sflN0qezBmHjCdYP5OPKLbkZdHZJQs6460fEjTxARALtEmJSr2bKzutn8T31rOua
	D/juTsF12vNXjgmkjK+alof3GJ5Kc5RPd7y7pF5e37yCUkvRZJDFhyrmh7DujYTznvIO9tU7h77
	Ap5xwrweMy2CMfH9BKP9wHDufPW2K6brxtocvTKWh00+xqyesAGUwqoS/icDkuy3m5jP7E1wULv
	rFvNMucmz+O8PrWQ4URvwGxvBByJ6d6vtugxWs9bXHEHhkNOthCcTtU/QMOFNs5OgnEXhu4dpuO
	1W00xBgY3TxVOAmnUf3iHjIRmqVsMMbK8cvTqzQ0=
X-Google-Smtp-Source: AGHT+IG5fKMxvjjltTJpP1VGWjmB/2GOQg7Z1BsjigMi3Gmj35E8GZ5+qOXlM4koXQ1T7HjcmVC4nw==
X-Received: by 2002:a05:6000:40df:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a1f6423590mr4776881f8f.2.1747133986123;
        Tue, 13 May 2025 03:59:46 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm16078670f8f.60.2025.05.13.03.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:59:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.16
Date: Tue, 13 May 2025 12:59:41 +0200
Message-ID: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=GAD0kFJ5YJ2FK8mLZ5w9P8zRKTWeWXXWX86RwPrS390=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyYeXGYfRXBpOgZAbyMyM0G0gXfP7x4rVhaNG
 ZNlW5kBi1aJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMmHgAKCRDBN2bmhouD
 1/mMD/QJrD+uVxskUSpR2WCT2iO2+zMLNh2Y105Wpicr6Ppz9U1EayRxH/yzRm4FqlVITLwSXPi
 J7Wutiaf6sSE2g+LRG5mvicN5kctLn6jeKpgtCr7chJmHsffzJ24bC4MPO77a84H/0pItzLZYss
 W5bzXLsjUr8VMg/22ALBMREsx+wfGlD5wzSXf/eTXoPaIWktsTOaSMC6UQ1+kC5zLgUZHXVJdW3
 wf4gOksiN+SxVyQw1831nBdb4d3o68a5HtWw/q620FAkMOmKrur4T2Jow9E2eAaC3xjcE46cynw
 m/FXrz42LMv6FeI+6oPdkx1gn00Eeg4pM2LRIyTK9htDCTkC5DvNZvOwTbvobADJgAxopW8riR1
 9yEWXP0hQOTaoLnmWmatCcKRPhvFh3mScZ7aWEML5Vh/AVRVe/2vA2tyPqBi9kxePyQbTJjAKiE
 PkRTZ7gAgGxy2W6y4oXv85TbJgt7FYIQknSg4xPjnmkhrAcOXi77Q7hGQxDwh0bJzxL4bwgBikx
 ZO2Zh5Yi2T2TzlEffmT/iaq5GtwUtRkOdwuK6byXJJpRAL6GFlyAVKdXqxtRJzLR1EncdtF9c2i
 x3BO0yWGmDqHJXPZ6Ge0SoVyGhmn4vq+eo5UsX+5n6NqJwlqI5f+3YqjebieP9OZmVRz21iaKm1 VIdZZ7f5Bry/C
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.16

for you to fetch changes up to a30692b4f81ba864cf880d57e9cc6cf6278a2943:

  pinctrl: samsung: Add filter selection support for alive bank on gs101 (2025-04-08 20:57:51 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.16

Refactor the driver suspend and resume to handle Google GS101 EINT GPIO
pin banks and add the alive pin bank for that SoC.

----------------------------------------------------------------
Peter Griffin (4):
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  52 ++---
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 300 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  28 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  21 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   8 +-
 5 files changed, 255 insertions(+), 154 deletions(-)
