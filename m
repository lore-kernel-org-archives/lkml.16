Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A885918EFD4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743765848; cv=none; b=cnQ82SkymNqi0nkcbM4qkoaT7XZRf3HhltgyK72pUDuVQ+QiwcBu+KN2vOUttk8QgkVeHdMKCSgbGLiTyri72l4Kwqgo7HKBlWXLJDzk4iegaMCCdOq/ndfKeCO84GmRm3gOfaab2twrok7jiUsDoKJ89aY/HO8vg5g19UHPtD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743765848; c=relaxed/simple;
	bh=UF769P9EuufThxdxJrgA+gjh7Ca7zysKFvkYOiSJZTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgE8RhLox9WCdDDlaAAU97PKO/iJJqrmFhvkNrs8HIBAfVKxQmcRmPGorb9A3foIDq3ICyhs+bDAr0q8T8BdW35tmWs1c34LesUJ6naTpix2vS01KtLF3+cdOOs7NgEVcP+ePb5uwrUGSIb+PmzDQqQMmn67SM2YVrWLHOYotUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sB9/0/Dk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sB9/0/Dk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so1395905e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743765844; x=1744370644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uoFJ4ptUi5AV/TAN1DOX2Iv9rd7IiSOqJe1GTR29a9I=;
        b=sB9/0/Dk0FLpu3gnRFgccip+iPwKx3sjQj3DB00WxFyhWpRF/YEX60+wAw/41dau7N
         92ToTHwEMV5Sptj7HuHjpQzBs/kXn6AS6jhsNhoXKPOt0uD8Vtfm9fs0AJQIZVeKtN4E
         UJ664xOb/Bz+BVdDNHtw5TFvjYr4jAMwTyOFrc51cuPEG5ef3EU9MQ0SrVqRCFVgJxMB
         QH5RgWYuN/6Nei10ANZUdU8PQSTwnwG32ZNot5eeBhysROhn03mbAbjlv9FQR+athEVJ
         xbjRL5Iza79+9a/2i/mAzJ+FPSxFsirG1dz03VnA9wwwQimVWPXkpZuzPMgI3asAIF08
         zCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743765844; x=1744370644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoFJ4ptUi5AV/TAN1DOX2Iv9rd7IiSOqJe1GTR29a9I=;
        b=fuw66QibCEJLnM1DPt3nNGfyG5aklL8UWHkBn1bHbdbJOSm1GSa/X7xBdJ4q2r7tQe
         fVIYyj5uy1vlHRGLJvgxuGSM3XOGq/5Zao26cQuSXQnkZxAKaNPnc6UJpPlp/vJAN/K5
         0nc4Xl2g/qs4gHWWpX2GF75Taz5Ipf1ucBZciCUaAY1Ol/HwvXnnx6bYTLtYzD47/Znf
         o4GeEqJWRvOpkYDDjmVRjP1JBg6Dz2VXGnQHSDPsI6M54UxhScvvq9UmovTWdEV4Xf9S
         ogksixBmsO8/xuCs1xKIXHNW/WAWGP3nwgtlOmrtnT0NbnKFOwjkCQG55Uzx5C9AEFWa
         2ohw==
X-Forwarded-Encrypted: i=1; AJvYcCXkcFURYM3xxYiix3ua3J3cKxPu9bmy2xJUMoiZ+2TZTz3PImxWLFbqJuIGvx2WurEc+GLY0CcjAzP2v98=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0sE9wmQU6428Z2qrYXf+0zWuPvB57mL7oMlPbaUdbAAk8Bh1
	TyDgNRLONfMM0YWSeCYADEsXODuY3HIEiz1szwuHDGSrMEG4hWuFLVl6GOJ2wbk=
X-Gm-Gg: ASbGnctkzK2CnIfr8cAoXQ8f3mLbCQNHmY5FUKom1xZuIRRfCSEUTEiTQvpp2PSjYU0
	8llGrMXiE/Ryi0Q/F7Ud2NQx8Sdoc9YLGFMUCkMWyV+VTpvV/zycMVDjlXFN6z83f5AKotAu4RE
	Qur9J9ioJ1+xcZdYk8fRmuVZ11wexmUhqqjgpl7U1O7jx6Em3his2FQYP29nMzArtwq0JrBympl
	yjbgW6LgjwiT/wj2r8nk2lHVxu870LnhkmgHSZvG17KRg3p946iuCZCkWyKLU9s7umXl6CFy3Wy
	x9hhXmnRJoqjB0tJifxPwvXGLjYBjPsCfNRaezSWE6/37t8YQg9kzA==
X-Google-Smtp-Source: AGHT+IE3ZXg+NpgHFPkT9tkd3OeMOY/cHa7ymbfFF9D3KVwgwJD5IbYwCsgQ9PomEA437IeP0SFhSg==
X-Received: by 2002:a05:600c:4f0e:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-43ecf9c372cmr8116095e9.5.1743765843644;
        Fri, 04 Apr 2025 04:24:03 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342be6asm44913355e9.5.2025.04.04.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:24:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soc: mediatek: Do not enable MTK_SOCINFO by default during compile testing
Date: Fri,  4 Apr 2025 13:23:59 +0200
Message-ID: <20250404112359.255053-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of such
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index d7293977f06e..006214f8e5ee 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -81,7 +81,7 @@ config MTK_SVS
 
 config MTK_SOCINFO
 	tristate "MediaTek SoC Information"
-	default y
+	default ARCH_MEDIATEK
 	depends on NVMEM_MTK_EFUSE
 	select SOC_BUS
 	help
-- 
2.45.2

