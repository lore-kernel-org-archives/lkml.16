Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FC81DDC15
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 16:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743267059; cv=none; b=ScEsZMtWEa1kLN6JItgLXxuC+Jj5gsmadmLg1ouhnbpudGR7Hxb4UQJlORNotKVaOiq3mO6Rq14QtMoPd+WWnvKpjDmRj2taxz5m4b3fk2pQYCDOJohmMo42+3pOaOrUsWstEFluhTLrNYMaLraoAY8y440WYWz1N7MT99jGxHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743267059; c=relaxed/simple;
	bh=hQY8Ymo/WuRJnDgtBIVwuMEU0IovYOYNeqYcV+brREo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7U+EgiwWlolR/QPAGVoPlAuDXgoa7vk4cPhHPODyQ5uJaHc7ad4HTnVZ95XHc1rnxQNCaQYQdi2skJBxB9qIhpc4T0i9AqEy2lcepcJUBxt66C5Rj+GFm0U33XVGH1dZjuowSmowUUVMbzCYeH5PQBsdy+WiMbTyRt+xfa98m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGpxd+hU; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGpxd+hU"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so5102460a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743267058; x=1743871858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EIKH4WUlJ2hDzsxspQuDetTzvwGz5UlzO/Wk79NuNXY=;
        b=XGpxd+hUOEBzFDml2cPnOplBaOVSmQJgjz1NPsNjNJaNQaaXiZLYoUZbzYUWJdXKDz
         tmC/S5lMXE4fWvH2wfjL+NKUFWC+PNDfNUU6Xto5BZUyPHIeuiNabjBHgvUCLb/21oRg
         wvg7nPZaxDkCfx1D+14tG13Yudc2hKfKjX7JhHT6qojRbq7bu312M9H3yKWWbCX//sLR
         Pde2yU4qxZ3iQV1RbUCsAVhPjHbVbELOR21rM8yTfFto7C0P2SqGUQZwSW9FNvk0PLvJ
         ynqH8tm54WbOxPml+InsKIBfgbBq4nv4E8JlvquvZI4mhexlxc0Rz3NC8kEiRo3Nlua7
         JVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743267058; x=1743871858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIKH4WUlJ2hDzsxspQuDetTzvwGz5UlzO/Wk79NuNXY=;
        b=VIkXTMuOe0rqsnR1PCXzIe8ZF60NQJIaGQGaovp51B5/7kcaTDnWQ5c4jXLnWbOCzo
         c273IsPghR64hxu1/qgdGOtBSar/xSvAJGKtrpYB1wXYbP+LC5uXiLLe6mEh5Wb9qEhA
         +veDIV21sx+pcJT2vWfMBUOH1nMGKcuYbvCp3faQTmSi0ZCoFMrTkOqEB2fvXaqz9F1S
         EY4fmaBiDTNveq2ZTQndM+0jOe9nnW2Ryx21FtuYiSSDR5S8CGko8YFNS7/0eWbp+Wyx
         gt+zmDaq0otWvpHc3W2bcy3Necm8s2KeoNlhSDAPVUlpvFzgKGue+we+wS7VT6mYTraf
         wohg==
X-Forwarded-Encrypted: i=1; AJvYcCXHA8Y5y4smCHPwRPQ0j91ONgvW4//4nSmydBAy8A8J+RE8se4GhoHB2wLotYvWXMcKF/bDZWluulwQxP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIdIX6lYb2DWqyEcHDwWBbh1eszdXOl0sSNvPSJ8ijwf7QHUD7
	Oliv9bL5YtkCcBPIgjx3jJN7YnyXlQELFMEOtAwzpKQGVtAh9s+z
X-Gm-Gg: ASbGncsEjP3vkdbhwpYNOOi2aSPZM3Vj5N8TpXBUrd8D60Aw2YeToboFHZGLVcH4Fk1
	TuezA4OkR+z11/h1BVIuRBMq/bEQHuwcZeb5MiqGKGuGqqoRker1KYOCP82ZDCVEsAbkozBWEd8
	lbpxiF3a/NRkN2Zhwh15t0PBxl8jK4AUvKYSm9uz4pDwZDjjElt5vLNP4Flzc9Vs6bA2UM1bXjM
	Ffs9RVD1H5eiYBkrOXbknpXWHWnAHwnQQ/RlBC0Q9YinbmMTVeypq3rJ4yTCCi6aaeT+rLMjNBv
	YlE+Ww1fC3CbSiCKhHk728IYzfuT2XevyQ6qVlQj5WnL2eEqQ0v7eyMK
X-Google-Smtp-Source: AGHT+IFFncrZVAh/sPx6EADZxp/0OsWeFLdIoZEQns7C8v1PTlZYjizAdIK9G3wvfVyLXBmSrFN/sg==
X-Received: by 2002:a17:90b:2e8d:b0:2fe:99cf:f579 with SMTP id 98e67ed59e1d1-30531f7c03bmr6172874a91.4.1743267057709;
        Sat, 29 Mar 2025 09:50:57 -0700 (PDT)
Received: from celestia.turtle.lan ([2601:1c2:c184:dc00:fbd7:4326:6b6c:8c8d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedf98fsm38545535ad.57.2025.03.29.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 09:50:57 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Kukie=C5=82a?= <daniel@kukiela.pl>,
	Sven Rademakers <sven.rademakers@gmail.com>,
	Joshua Riek <jjriek@verizon.net>,
	Sam Edwards <CFSworks@gmail.com>,
	stable@kernel.org,
	Dragan Simic <dsimic@manjaro.org>
Subject: [PATCH v2] arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down
Date: Sat, 29 Mar 2025 09:50:17 -0700
Message-ID: <20250329165017.3885-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3588 thermal sensor driver only receives interrupts when a
higher-temperature threshold is crossed; it cannot notify when the
sensor cools back off. As a result, the driver must poll for temperature
changes to detect when the conditions for a thermal trip are no longer
met. However, it only does so if the DT enables polling.

Before this patch, the RK1 DT did not enable polling, causing the fan to
continue running at the speed corresponding to the highest temperature
reached.

Follow suit with similar RK3588 boards by setting a polling-delay of
1000ms, enabling the driver to detect when the sensor cools back off,
allowing the fan speed to decrease as appropriate.

Fixes: 7c8ec5e6b9d6 ("arm64: dts: rockchip: Enable automatic fan control on Turing RK1")
Cc: <stable@kernel.org> # v6.13+
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
---

Changes v1->v2:
- Added `Cc: stable` per Dragan's suggestion
- Applied Dragan's Reviewed-by tag
- No changes to patch content or main body of commit message

---
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
index 6bc46734cc14..0270bffce195 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
@@ -214,6 +214,8 @@ rgmii_phy: ethernet-phy@1 {
 };
 
 &package_thermal {
+	polling-delay = <1000>;
+
 	trips {
 		package_active1: trip-active1 {
 			temperature = <45000>;
-- 
2.45.3

