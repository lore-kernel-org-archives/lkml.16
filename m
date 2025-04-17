Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334B3221573
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876011; cv=none; b=crk3DTrhcGViIadKQ+Lj/UVKFIpY7PNeIwcKv6Hnv0GL09ygHUFptbLWchIZS4ec3TByFbRVee+miGUP3dNn2sbbPoGjVsDDMBhD3ztBzeYnkCGzluhnMAAIZDHh2TLOgjcvQ5iUI6tJzmogxS3a9aiDjWTuBdef/rgH7kIGTqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876011; c=relaxed/simple;
	bh=d6IlT9ShC4wilEO6tmmh9Fe1IzuZTHCQ29TmJiiTPPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Grr7hW5JrhcIlQbME2cOOQHPbPB+BoGWLNgpAWL85Vv/ZZSNkBpIVUvXHcjFEBqFFlGlPlflBiXTCc37G44PCg8gFW/2DRt+H/zeZGXFrXIHond1aTtFsK0SV/QTRu2Mp0/eZZtmCtzWMb7Gd8ATQToFLffGAVSPYSFIbaFPePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Drj80sNg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Drj80sNg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39d94327297so67182f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876007; x=1745480807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iufXt7XGPWVnixx75DmjBxxr/EKI8vcJNq5OOoFoztM=;
        b=Drj80sNgO3vuNmkKhmiy5OI9x859ZXIcJ2Ge/A2acKPPZ3xTtbK8t5qYONqZPKPjmZ
         fNRduuDF+rRDwNfogxXCCBerq5Kacm8WqmjNhdTQBi6BSq/CKgcF1t5cMYArVRTrFP7T
         k23GacsS7GAprw6AZDiT8tXMTls+FncI3qqxJA3DBu4jnU7sVyQkcTqjzigmLuh+vlNE
         kcvbT67HKL8ADGh3m2Vg1HGEyopUSg2VSjYd0feG4aZLe9GSiMiB/MMQEMHfRTWcxfag
         CoIqGH22ZwxSXrXKeyYCGqVoJ4wEqBVqeHyGHYve+f9attdXhdWyvQsrjtsjYi0DStL5
         N0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876007; x=1745480807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iufXt7XGPWVnixx75DmjBxxr/EKI8vcJNq5OOoFoztM=;
        b=b/8TrH8qm2IValGo3+yxNGNq1xJT9X37gyPAV77o0Xee6aauCYMVRRABcMGcyXpc93
         4MrINaSPl8zy5P9PStLwB0xduDMI71JNJFrZ1Uup2PPmzsvBr5f9WSUcDIuPwsLswRc+
         r8iC8AQ9SmQPum8XnCSM0QN8RSlLL4B0AMVM+znKH0YTRNHdEgrcDFP8m1WLR7kZwE/2
         VjrF+tCtXZMfNwPxWiAaAQCWgl3PrZmP83+PEIyXsVHfSlKR8N1EAPGWgpx8obXYhVck
         SaKNj/Rw0FFGqtgP/JK7V94sZOwMvL9huTiRepFDYuwl7AqI89bFTZLfHlIVu/Xc/KgL
         JAKA==
X-Forwarded-Encrypted: i=1; AJvYcCVbgMUrgmNETNhxX6kUWTDlDcdRJXHY1Xi7+iyXofCrZbLUzHla+ylcR2B9R21SEgng2il2CraaptpDAYI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7QYezt79bJ2zHXrJepwGa0YkgMmZgjOYjaGwd1Ft9FcBk0Nbx
	pvH4wwf7PR2cDPGQO9fn2Pm+ld1MkyVjKdoiTs2Vjc71XGpQ/JC9Xu8vLGzZCtA=
X-Gm-Gg: ASbGncvW58WPlTv9M8s+Byi7zIEFWeUNvk74s+t2z2/OX3bC7EVGNwm3urW0mhcdGu8
	UPXqwuBcOtebox6cBJ3IZID1rkQYnn0LMNpHFDWqIWBHrSGPYWag5bkBYLqhUqKhKBzesYzBBPR
	TizMZIvXhyb41ug8rZHBZApfjX6vKIZDAsAGtte+wUtLOuDkKdLKnbs5HhYB3QWN6h/AFke9VkO
	URZK1TAkMjp56BYnqT2X2YtlvjZ2p01PEQJKjLQlHr7j66PaIlNMgDLhk8atvjW0f4dciGMrLBm
	xOZh0iymNSoZxDbMrbogiBUr/GBgU1MfPSkbg6TUgHDAVLivoF3IxUeSMZNa7NK2/Po5jd25Ect
	aqLXWjw==
X-Google-Smtp-Source: AGHT+IHN0gCWGlfh6M10BCj9GpPYoIMHd3DPtjGO5OnRlWIDylaeB61eTs5nJuHYx+5YI8rHxxIREA==
X-Received: by 2002:a5d:584a:0:b0:39a:be16:9f1e with SMTP id ffacd0b85a97d-39ee8fd638cmr684683f8f.12.1744876007476;
        Thu, 17 Apr 2025 00:46:47 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4d2ddfsm43130005e9.10.2025.04.17.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] pmdomain: arm: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:45 +0200
Message-ID: <20250417074645.81480-1-krzysztof.kozlowski@linaro.org>
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
 drivers/pmdomain/arm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
index efa139c34e08..afed10d382ad 100644
--- a/drivers/pmdomain/arm/Kconfig
+++ b/drivers/pmdomain/arm/Kconfig
@@ -2,7 +2,7 @@
 config ARM_SCMI_PERF_DOMAIN
 	tristate "SCMI performance domain driver"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
-	default y
+	default ARM_SCMI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the SCMI performance domains which can be
@@ -14,7 +14,7 @@ config ARM_SCMI_PERF_DOMAIN
 config ARM_SCMI_POWER_DOMAIN
 	tristate "SCMI power domain driver"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
-	default y
+	default ARM_SCMI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the SCMI power domains which can be
@@ -27,7 +27,7 @@ config ARM_SCMI_POWER_DOMAIN
 config ARM_SCPI_POWER_DOMAIN
 	tristate "SCPI power domain driver"
 	depends on ARM_SCPI_PROTOCOL || (COMPILE_TEST && OF)
-	default y
+	default ARM_SCPI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the SCPI power domains which can be
-- 
2.45.2

