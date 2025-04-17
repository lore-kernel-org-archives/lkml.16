Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CEA1DE3BA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744876008; cv=none; b=Ho3VcgDGIaUznAunCwbYfyvneysRibOvudCdks7FuV+h/to+Bzhi1zRC5k+x3RdCTqBiqPdvEfV/Xow0ih7ecNsbl/m1nw5POVJh7SDsuSxXcxEHCtzoFfoEwiuOlCDBoD/2A6tPHDsbj5dnGXXzW9G4dAEb1ZNq6M7Fu72wgfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744876008; c=relaxed/simple;
	bh=aSvlpjizI/Lrp13Pva6wwkw049E07MN4kZArewmdN8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=paWZVxiqSkC1tvYsd5I2TafaYtxgDn0R7BdvHbYj975aYhFykuGlfHFSua1FKH1ufZygroYuvCmRrd8hqRq5CmYWbCFdl+dvTwtjlXcGlWZbP7TbTo7Jbq818WZ8x33e9WzGZeRJLtAuuQfii3YWWKzZTChAR2Rapi9/gmEpVnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFTtwG3g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFTtwG3g"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912a28e629so18446f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876005; x=1745480805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhI+WADkGBk+0ULST+CxSRjnFxvmTJk3SgN2rfV4lm4=;
        b=VFTtwG3gRxFYqiqBb4UoDyDYv07/9oNjqp9ttYDqkGKVsODrVMpubmH27bvRnDUn+t
         Ag+ssQv8TEYkPNsuHBFocZlqzpj7qPbqGiTqmRBzJNDQJ43Pax07+Vy7ANVNFRYRitC/
         lSpC3moImHuR8ryiUJq8CTNsiUGz96Axefhfir4+UW+LgSVtK4qkiqc15t8lWLPNCP5Q
         jZOLn1JVKzgLKDok9Q3RWEP10zg+myEn7ti4Ni/y3NCy7ZSmWtP6UoBQs2e3ODRF4nms
         YEo8SVszYIvZWOTL06ow4sZKaJ5RucHZfDzOQmBZG9VZOP41K1gkOzzL1cV+MLuUCnjo
         5llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876005; x=1745480805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OhI+WADkGBk+0ULST+CxSRjnFxvmTJk3SgN2rfV4lm4=;
        b=GwxZDmPCtDjKyhPBq3/fYoTHf02z6PoI+Hl1UPSx5rV+cb0RapaHmXa2R/220J2/Sm
         nVJfCImHUoYzIwHYVdWWb17z9d5lmUGhIFJy+nM5r5PeTXADcmwwVvTNgHQ3flJyGuDh
         jxWo67WvNyjyLBvEJLUVofIeulBDDtf/Jsc0V/7NDfXpTpg2UI1A3CCpEchjl5tnBo8Y
         dtHR2uoIU0N6eu8pe3fm9TRGZ4K2/FU/aFLXL96uYli6IfGoDw8ydzygk8KIYgt+Zw5W
         YNf6sfX/Hkuz6n2WO6UxESI68tNsS6xNvpaa445j7l7j/UgiReNPvXxp5lFdzm2MYiEc
         k4rw==
X-Forwarded-Encrypted: i=1; AJvYcCXv4RsdNrw3p6AT37oRnCb1XFgtNwGeSpx5QmXgS6vhrvCfVZR+qId6/PJs8sGCu9Jeuind/DGGn8nZmdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQe3KPHL8z9rUW4S5SIOrjXWJVhoLFVRhynfoa1aLLZH83ZS1
	2pfZNoLdD8Di44gvbFQXo1UaK1gIWBxXWkBnmqvNi/aU/8Qp9SMPhdV+ZXv1htQ=
X-Gm-Gg: ASbGncvYlrEJJMhdyM1n1Vfl4CIsUpI/yxc7/9zqDImc61GQleDubbIB/5Rf0o7icXu
	c65XPZLtwMuDJVnGhILxxlmA4663XJyxJOFa0IWcNhjyvFwOe8KLeKK1kKdqFH4wkwITow3xeIp
	w+38d9n16yXEgoXorwqkU5laHPXShGjnRfx4rEMwi0a7V4sol7VUM8BlKqFWQZMZQxNd8YELO4w
	tIUYfStsHJw4LG2kbwpMtizJtqJtZU/a2JizQtfrNiHma3v5KUm7CocxGy+j61A+xmc2/w1yWWO
	NQSyjs22yYoXTqRIPnL9Nm39GvRgVud8zDs1WRmNAIF/XHOe0mHd7dPFFtwLPodoqK+RhCFJCMA
	dMKBI0w==
X-Google-Smtp-Source: AGHT+IGFe1ON7uLFnctXLbWHCIx251k2gOzxkcVdUkHVQsZlna6ZhlzZoF22sAc96PoeqkFuh+hKAA==
X-Received: by 2002:a05:600c:1d15:b0:43b:c938:1d0e with SMTP id 5b1f17b1804b1-44061d9b048mr8672705e9.2.1744876004978;
        Thu, 17 Apr 2025 00:46:44 -0700 (PDT)
Received: from kuoka.. (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4c8188sm44102175e9.5.2025.04.17.00.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:46:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ptp: Do not enable by default during compile testing
Date: Thu, 17 Apr 2025 09:46:42 +0200
Message-ID: <20250417074643.81448-1-krzysztof.kozlowski@linaro.org>
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
 drivers/ptp/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/Kconfig b/drivers/ptp/Kconfig
index 07bf7f9aae01..204278eb215e 100644
--- a/drivers/ptp/Kconfig
+++ b/drivers/ptp/Kconfig
@@ -44,7 +44,7 @@ config PTP_1588_CLOCK_DTE
 	depends on PTP_1588_CLOCK
 	depends on NET && HAS_IOMEM
 	depends on ARCH_BCM_MOBILE || (ARCH_BCM_IPROC && !(ARCH_BCM_NSP || ARCH_BCM_5301X)) || COMPILE_TEST
-	default y
+	default y if ARCH_BCM_MOBILE || ARCH_BCM_IPROC
 	help
 	  This driver adds support for using the Digital timing engine
 	  (DTE) in the Broadcom SoC's as a PTP clock.
@@ -59,7 +59,7 @@ config PTP_1588_CLOCK_QORIQ
 	tristate "Freescale QorIQ 1588 timer as PTP clock"
 	depends on GIANFAR || FSL_DPAA_ETH || FSL_DPAA2_ETH || FSL_ENETC || FSL_ENETC_VF || COMPILE_TEST
 	depends on PTP_1588_CLOCK
-	default y
+	default y if GIANFAR || FSL_DPAA_ETH || FSL_DPAA2_ETH || FSL_ENETC || FSL_ENETC_VF
 	help
 	  This driver adds support for using the Freescale QorIQ 1588
 	  timer as a PTP clock. This clock is only useful if your PTP
-- 
2.45.2

