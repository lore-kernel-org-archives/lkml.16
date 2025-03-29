Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFA71DED47
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 19:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743275248; cv=none; b=HTqnvRD8aeWnjn/MLuELSaFPefFiYEbxbv8XJLn+bfTIjv+2UetwURnDRN/wlyopd5jt2dsr+NuP9I0HaDow0YalFnWU6icSgD1ojf9gDrUyZl/UT1NLWDLKkBa4suAJfr1uPxfhw7rzKfVl3HiU3WBsrGrq1Z3DAsnDl20aMnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743275248; c=relaxed/simple;
	bh=IAkTaOkR92WiI8sw02OJNWY3cfgpYwCKjVVQXwbRO/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aF/xr9vmEj5LWr7VI2MMuA37ZX9LhgyZnbB93R1YLusi+73YOgxlJwy+tSUiBQ5L7vfuLtWAsqe3Yar1JpA+kpqRKLnFVR2SgNMPpRev73RBX+k7rUiwI2p0AN8Iy+ckURjvAR0Uu94eLkUSTfeK46FJM1Vp3lhqqgAGa59R1d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=FUgFjAjM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FUgFjAjM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abbd96bef64so512755666b.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 12:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1743275245; x=1743880045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qodMBbXsFgPfty36KeQepLijN45E1LZ5eGME17HgdkE=;
        b=FUgFjAjMm4/I0ZIciKSO9uP9n/Aegs2kgYXBNOdtEyvinvlq1N99bM3AcEJQZmdaI3
         KRlnvShG+9vecpEKij3muzx2gPJN0/ecF+/fzOyV7ly5a/rvKpgGIEkrW8KQJXqA+Z2I
         5mKN8+DFzokr6BPGFrqMdrTmbrWNPQJ8In5FRFUxw4LLlLanNFXA+S6qubSRkkIioAy1
         lYYqSFMEbA+gjWXJgm/VOMF1yX2+sghTcU0xb3Y6maNak2tD7obN3V1zXnC/B+Gfwcvu
         mT1DFCHD3O6+t6Xei3S/qCM8G+tTmC1u8brzboFCZR8Jvn6qHhm2q2hijDZMEJ0iqvon
         k14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743275245; x=1743880045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qodMBbXsFgPfty36KeQepLijN45E1LZ5eGME17HgdkE=;
        b=HEqAPviJGWDYKlhk/A00lEeNLcDc0vaqQkTcCLkPEXv9iTHwGdB9D+jFdCqhQ07gfQ
         /5IcGelXZLtfO1k8s9eCUwUZu9wJvdS1ZozqN/kpHLeeXZtbm1GCWafCQ9yayjkKAOju
         GL6ta0n8ggCVrXf8sM3+Qu4TL02CxGtArH6WN1UGYxLWaDEYf5UiFbfMuuupX8m4X16y
         EKB9XSttFeBgUFkjvlocIcx1QT+KHZjJP7aYpIXwny5/wlC7aMqiaiX1sE/Es4eSFzbf
         AU8/noyERBH1VSI/FaAZRpPegaFxOmVA+AEB0tT1FFwzWyjNG00hvd2tF9Ges7nDJCbZ
         G8Iw==
X-Gm-Message-State: AOJu0YxHeH8NbIbcnztnXFEScMp2TUt+II8bUB6KfjWqyPgcyhURNtt3
	HcYvPmp+kEFr+dlrb49rrDo2O+a4MmSyBjK3gdWRS46oKhLV2fNs
X-Gm-Gg: ASbGncudz2GT/6T4vD58UoDFX9cg1tlbjVk3bg/k8RzQLAc8HYbz2V2zdz0Cq+E2qaT
	ed/NEXhfVUMWBYGbzAWlqlUL6K0ZQsk+fpKLIvKgOtNkkSIuzrRiBur3Dwha7SUfteRQPqoLdwr
	KkAzpCH+QimNf+qlzcEKzJRb4jMBKe+A/fh+E0CY4lmHvmzecLEgmwVrj1BpPoE4Q0BH4uSjKww
	4oiIEQbkzNPdoHrMhFk7YysQpiHYkx1MkMtpPq/XHo2YA7vktgkxiD53fegx2ULPYh4dPa9/0B6
	RXQn3Rp2J6OmvBAJlbfEylispKzz47Uf4JRlTQDFhTqo4B1yOSDT/TYL6d1llBuJsy6hnY+K9bJ
	hd2zKlOsoPPmOyxWtN4wMzGXmzbZJzrjPqJo8bh3FOsOvb5KbjLTYrX+C/t2S2B7W1TJuuA==
X-Google-Smtp-Source: AGHT+IH1KTUC9DJrrlQnXgZ2JHbNiFwezSsNUKf5SUJT51h9qpOBj23TKaz2btvXkEWQPO3v51g2jA==
X-Received: by 2002:a17:907:971f:b0:ac7:41c:748d with SMTP id a640c23a62f3a-ac738bae656mr310740866b.38.1743275244484;
        Sat, 29 Mar 2025 12:07:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad73-6800-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:ad73:6800::e63])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16aac05sm3275271a12.3.2025.03.29.12.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 12:07:23 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kishon@kernel.org,
	vkoul@kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 1/2] phy: amlogic: meson8b-usb2: Use FIELD_PREP instead of _SHIFT macros
Date: Sat, 29 Mar 2025 20:07:11 +0100
Message-ID: <20250329190712.858349-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
References: <20250329190712.858349-1-martin.blumenstingl@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies the code by re-using the FIELD_PREP helper. No
functional changes inteded.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index d63147c41b8c..d9c761b7c15c 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2016 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -39,9 +40,7 @@
 	#define REG_CTRL_TX_BITSTUFF_ENN		BIT(18)
 	#define REG_CTRL_COMMON_ON			BIT(19)
 	#define REG_CTRL_REF_CLK_SEL_MASK		GENMASK(21, 20)
-	#define REG_CTRL_REF_CLK_SEL_SHIFT		20
 	#define REG_CTRL_FSEL_MASK			GENMASK(24, 22)
-	#define REG_CTRL_FSEL_SHIFT			22
 	#define REG_CTRL_PORT_RESET			BIT(25)
 	#define REG_CTRL_THREAD_ID_MASK			GENMASK(31, 26)
 
@@ -170,10 +169,10 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 			   REG_CONFIG_CLK_32k_ALTSEL);
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_REF_CLK_SEL_MASK,
-			   0x2 << REG_CTRL_REF_CLK_SEL_SHIFT);
+			   FIELD_PREP(REG_CTRL_REF_CLK_SEL_MASK, 0x2));
 
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_FSEL_MASK,
-			   0x5 << REG_CTRL_FSEL_SHIFT);
+			   FIELD_PREP(REG_CTRL_FSEL_MASK, 0x5));
 
 	/* reset the PHY */
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
-- 
2.49.0

