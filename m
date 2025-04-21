Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03602638B4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230403; cv=none; b=RfNv0Xee1gQhEL07itUWSpqO99omxKLFRvq2ff0xwCTbeJFAsHpeMh3+jhUvN2zz1qSJDiqddkTQJE7SQMlBjbDVCpPoVvpiTjqu/or982vBVai1A4nronZoe35dWDq/tVZ2pyUUwTTgw/KKA281fTFI5ArF0w2FONRdVZOtfDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230403; c=relaxed/simple;
	bh=sy8ThRyRgU7oedwZh2khgThNY5WH15EZl03oVLUYUIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmhhXUcxkZQnLWMEKSS/MoPlvZWxYWiBhhhYYe/l+IGWpemA7/8onHgg3X131hLyLgHnENGowYkToBIcHaOYuT3ICzbpHVoDtU8L2ECBAGKHLORS/Qt+nx4U5RTwyxmgfPZqe6HINfNTK85GlNog0nSWUMwfHFWPZ93UREx0tzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PvMscab+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PvMscab+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-308702998fbso3445222a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745230401; x=1745835201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rok2Mg43bnfRB9cqUAfce4PsDdZdAouW+RpiAparFCo=;
        b=PvMscab+f/DdGlLJV6Ty2Gp1BVUtvDMJSxM1BFQkpaZRq2K7gf56rj2xE7+yhd4c0E
         3ITfuRNmnQeU1fVEHm/27tz7lyqLXmrI7hg78TdtVX8vhdkwGIODD5nIB0DxFFIOebLY
         WJiNvj7Uh609dX1cwfg9Xl7GE7BzPARmry/SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745230401; x=1745835201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rok2Mg43bnfRB9cqUAfce4PsDdZdAouW+RpiAparFCo=;
        b=rTpEMseMyHPQ6KLlIbO95QOMvPq7EmP1WC7xjHMIwyzjxvXPC1tllNFUg8toARP5L1
         yV1C5GELFj2cWhnM+OITOP6fE+o6s8Rb0dml3aROmMjShzK6FL5p5S33As79y7+Q3Atc
         8rIM5VI2o5VCDeNdeD5hQeAwM6oiX2qVgMDyykEvX+UU2D34WW8N1/vGKg2v2R2l7CxR
         m9Exh+5LOXKvoGiKJf+TdHcM/zUv6pVC5ue+didIyublZJvwZtqqMJjMaxE9+3dg/pLw
         lGxzuxhrnTebyFsXBBJnfmNOP6MgeyhqIXGR+l/WuKg5/DUp4xezGtIL2e6cL/EVSovQ
         0h3w==
X-Forwarded-Encrypted: i=1; AJvYcCVX95VsvPw8CQjT5Vhm4bScM1uxwFLm2E2dufyNyeUBwXjPdc5pGH1RN8HAmrAfVUgy/yCyMDKWryMptf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9zdCAwFKpeVdCf8YLU8w9lwxrGn0brtDZH892zQ8sIa3fGMw
	99bmYJxczYdVP9hFq1KKNA4UHu99EYAftCtTnpnOq9iWYdQWxVQgjMjjKHiGrw==
X-Gm-Gg: ASbGncseWXownnF4fFgjztS8/XZiOSNEz5NDyuL40PF2kaRoOJtaPOr1grQO6yu+TTv
	nq/yKGiCSebAZZ8Av/sphXqQZWTKkfBBl6brc1lS6bioGKISFPxBAo4Oxe3NI5wnpHM6QGplm3z
	jpMvCrDrV/Oy5noF+rXQ+UQGvQ04n1HmO6hY5r8j3xof3WGkUIBzVtqD1cDOEHCsJVHEFao78TB
	O+lagmvPlUVcYO3WRxTTPVIDoiSRO6BEjtXsx9+/gmVVTxaGLgezMqu0WrDJZnSw7IujAaAKBX6
	T0R5TAL5AgOst9eJJRkNdq8SXjIj88vh5OBEVQEee+3VxypQAe4f85YRgc8=
X-Google-Smtp-Source: AGHT+IHzGqLnsYoPPrUzas9aFIuhG2tfwpqW1sujdJRkCyGS/gKycIu8sZyY4IdNUXVMBMKhKzW5aQ==
X-Received: by 2002:a17:90b:4ad0:b0:2fe:a742:51b0 with SMTP id 98e67ed59e1d1-3087bcc8fcbmr14175251a91.31.1745230401151;
        Mon, 21 Apr 2025 03:13:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22d78db8b04sm38985205ad.238.2025.04.21.03.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:13:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 5/8] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
Date: Mon, 21 Apr 2025 18:12:43 +0800
Message-ID: <20250421101248.426929-6-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250421101248.426929-1-wenst@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate device trees.

Merge the two device trees together and simplify the compatible string
list. The dtsi is still kept separate since there is an incoming device
that shares the same design, but with slightly difference components.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile               |  3 +--
 .../mediatek/mt8186-corsola-voltorb-sku589824.dts   | 13 -------------
 ...orb-sku589825.dts => mt8186-corsola-voltorb.dts} |  5 ++---
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 58484e830063..ff67931e7821 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -73,8 +73,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327683.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262144.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262148.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589824.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589825.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
deleted file mode 100644
index d16834eec87a..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-
-/dts-v1/;
-#include "mt8186-corsola-voltorb.dtsi"
-
-/ {
-	model = "Google Voltorb sku589824 board";
-	compatible = "google,voltorb-sku589824", "google,voltorb",
-		     "mediatek,mt8186";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
similarity index 76%
rename from arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
rename to arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
index 45e57f7706cc..cc805408a8b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
@@ -7,9 +7,8 @@
 #include "mt8186-corsola-voltorb.dtsi"
 
 / {
-	model = "Google Voltorb sku589825 board";
-	compatible = "google,voltorb-sku589825", "google,voltorb",
-		     "mediatek,mt8186";
+	model = "Google Voltorb board";
+	compatible = "google,voltorb", "mediatek,mt8186";
 };
 
 &i2c1 {
-- 
2.49.0.805.g082f7c87e0-goog

