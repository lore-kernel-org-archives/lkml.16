Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5766824468A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131042; cv=none; b=rICktmkUtgItXv/BFYaI9GQT6RLtDGWBpRY3kIi+K8hDdgtUaxY4FwNaI7Ck+nCkn2ev9ZTwYMR9mTVprARSVYnUe7pUU7ZavV3/it3i+01x82dv41NunkVEz45O67jjy87EsCLECq7XYDlzdSni4KWZzdRWJZJUpFXIX5dZHJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131042; c=relaxed/simple;
	bh=FV6lUS1VQZkp1LlugzR82qxxAdBsO/kVg1ZGJpHO5Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppHK/99BRcXpm9zVbTMMvPryCrMKWV/PodqzPh3tRkRqoh5Ddd7C1iSJ53sSXiiEPsGPUYNo/IR/hVB5bUNUckhknKwhCC8wk0/VH01e+5LM22uGadku5/nCYfkJxRooQXJveMVKhf4XSe6S9yKEPgLWu7I8aKG3oiBjZk1nTIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lVHJ+9Iq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lVHJ+9Iq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43f106a3591so5158725e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131039; x=1747735839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=;
        b=lVHJ+9IqE1UqdV5sYOS/u9ix0EOWdLcEgf7L+xU1him4/zvhLqpLm49vaFkNZK45qy
         cOUjlwdk4um6qf8I2LyBfrHDN09rO+rRfa4mk46314txWSAdszUxFU6gIJ1HyDKW+g3v
         aHECCBe/lgLJqdCvM9+YP33vrzQ96ZcqDvn/Y7wUF+M7H8Q7ZUkcuXO4mru5zVC6ftYI
         4yZKpZvzQpjG8M+m27MGk1cnWVLg6vZfVE7S3ohQ0wzTpe4DJrVOWd+FqdpYRUxW5PM0
         u2VzMscg5Gqnu/LMTHPQWy+QFQz66otP8/iMfGdY0UKttVWCRE8F0akwQkMpsApgu4HP
         MbDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131039; x=1747735839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8LDU3E7ugNL0CY6R17fTrojKGk0DUzjv1ic5ywPvNUA=;
        b=UwOM5WoIVyJsf//+Pw4+nMUN56CVuKOZgWax5x0upPljbSZAnTw/D9+m4ch/8HRRhK
         TmCp9bTVqdEDEgl7NE5M4+LsyhMqfko7NJg2p6Sv4BzLEOeXCZd1G/VmJqvj68BMRJYt
         UDA4S39r/pv0sLkwPqv7VyF4NEgiXcvg5mseD1p9YZuwO4hrfvHDyOKP/REI/KxD98f9
         LoSXy+pgd5TluSheps9CKbi/G01BkUsLxArbqhCnRxdRG0CGfI1hkKKzAQHVBo/8ciWC
         2QOTnBExeEGoi3p3MgnWMI3WhZ13VhofCWUNbih8xWG3gzbaNQWBQNwtTsvAwQizpaqL
         Scnw==
X-Forwarded-Encrypted: i=1; AJvYcCXPS2zhPDyLpmNGpORrcJpVeXFr55OdbdCvD16OgEgGnrlmxjav8JdzpIYUH+pia6c+OLI3ITyXP7qIblw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI7mAF6DDabwdo+1G6GI1aGdKA9H1sjXfk7POuj5xNbsfgMctY
	YRsCE6PRieAAQxOf3qU1gQ8gjCyA9ZyFiAKB7J72pg9vV0lUcLPzlEd46adI+qQ=
X-Gm-Gg: ASbGnctK3UtwnGkrtu00r5XPgdIbG8TTOQTWEqBgxJ/H/tYFYmWhu0tXnXlOFOQ6i3D
	biTPiLijzqk2a06DTHjjWsR2CSSXso8Ob0ZSDoeR9Lw2GwG1fkiz2Ks1fvjc5/3yu5ItE34G6UG
	lNBo69f1Vfzsl8os4rEzzNNRqlCkPggJU/CuaX5TYczIYIUwttu/gVcn37r250bGmSeGNzovfJp
	SOWG2iRlCFCZ7SDqiOTCEjjDTVgvMKNC4rsz6oJeRo5w98LdQNrsD7d56DJzhEIl4Vz4Lt4xIn0
	xB/1CMzsZkiruEOCKAfaYPFHheAxnj2nteQ6xvIYaBzCxUM7koEGUSKm502vKe0U9WomZEE34nx
	kYAvdUfYgvzEeQaGcjP0an2H/RhE4PnSfr1KzBNY=
X-Google-Smtp-Source: AGHT+IHby+uH+9SrUe0Mcr5B37Co4treeOqApvNmT3ZzjxOsvuWSMZ2/x9YLsSi2DmbWlz1SlUQrbw==
X-Received: by 2002:a05:600c:1c90:b0:43d:fa5e:50e6 with SMTP id 5b1f17b1804b1-442d6de97f0mr50703025e9.9.1747131038625;
        Tue, 13 May 2025 03:10:38 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH PULL 3/4] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
Date: Tue, 13 May 2025 12:10:24 +0200
Message-ID: <20250513101023.21552-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=907; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FV6lUS1VQZkp1LlugzR82qxxAdBsO/kVg1ZGJpHO5Ss=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqREOlMZHUTEeB8rGJ1Gc38+QkgIxsOYpihB
 PhNb4GFzH+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakQAKCRDBN2bmhouD
 133pEACOMqgFZZYU1knd0BczssaCxOXwa3oD5FfktfyjygqFRCU+/WCNPLPHgURFsa0Hdph5dcP
 JdqF7642k+Zs7eid+yD15R7KnkgoSnoLxyVoTnvaqp+feC5HXpyqn16hFkXQgUdwgYOMDY68eFa
 hYaeGheo32dCD0XdeHBBG4gruHd2lhofAaiBwAAM32+I8dcF1ps1TURLduOC6uD0YHrykUjeg6+
 0ttqgCx1Eem6RPzY+H/Ih9FWGYsgOira9T2NrTxIGzNHEyTQRaaSjvz5ytncrkcv/kWsXL/PWYI
 dxJRaUUjFUZM4POvZXp9LVXijH+Nh+jZEK4rAsR+B4EdyVZxCZ/O6uv4Uxqrts2BEYFpTPaS3Kv
 4X7DniL1Mcs2cpw/N2wRa9kjaiuo0c9CrQXe6l+NwQ1mJ5CpHVj61IPvK+gP1hT/dbUeIFLuYNL
 zrRtKPzqDY7MFOtgspDImw2QLvnavEPi3LeaTWpLmSP84u6uHGaAwjZrgXa9Dcw4x9TsOCUGSSP
 kKNtoKqxj/ocKIaU9mBlGBiAgFWQoYIHqjLWQWdPgdM898/9xsIdJ9Esz5qD7HOEXyOLzkRbBtz
 ZElPdomkvmpOSvlz8CGDOOfzixnJ8vHLi/fr3zSK9sJY4dcChhWTjDc0YNetEUCcAldWlRdwR1/ 4ub3HTmQFrpqPuw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Recently DT bindings expect 'wifi' as node name:

  s5pv210-fascinate4g.dtb: wlan@1: $nodename:0: 'wlan@1' does not match '^wifi(@.*)?$'

Link: https://lore.kernel.org/r/20250424084655.105011-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/s5pv210-aries.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
index f628d3660493..153514e80c9a 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210-aries.dtsi
@@ -855,7 +855,7 @@ &sdhci1 {
 	assigned-clock-rates = <0>, <50000000>;
 	assigned-clock-parents = <&clocks MOUT_MPLL>;
 
-	wlan@1 {
+	wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&gph2>;
-- 
2.45.2

