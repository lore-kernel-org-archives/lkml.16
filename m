Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B4F19D08F
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317969; cv=none; b=F9qcIpbGqkNkVvyaG+fQHP4FYaHWv6oYzSxzFl8VMWS9hO90OZsBFZVIA28uq71skHvGlSit5zp8deFqSoXMEl0A59P79FmnciMEr3DB3PBLwJkEYIJFMUPvvlWzPbb+e/njgP5mlPpbnWaQD8HPnqM1X5MJTh95IlXNxnz3pWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317969; c=relaxed/simple;
	bh=ZX0b7+q/WHABStHBVU2DZikmc1ff9AvZgSAY2t2c/Js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xhhq/Gd0K7ZLWVicqkemNJC6DdULdqLsW3lPy/qDD/cPwhDeZ40hmG+p9vsbA0swB0P0WvoMAYgiBZv+0lSA1/LeFykh4MiwUPCaEduVNC2Rm1ZzPopEVSZhrtjhoiymKKSGTFJrfehpc9oEHvSOjVq3lI9hzZ/2RnAGGPvf0C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JjNtrIlU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JjNtrIlU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0b28d9251so148324f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747317965; x=1747922765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+TIgkAbsJjkBmPmDqXYIo5M6rm+d2Bew/nDM+VokxXo=;
        b=JjNtrIlU1pZ6D68eA95fvaW9xhtPFb4tDSOltWovIAR8kqw2S9FY6BFnoV25DBoXFv
         T23vUap+jwvsavpgbZ3W/WnPvaQ0kQMd4SN0IKc0/PZx359IgFbNS9xNXuoJ4frbUaCo
         J3oZxsaw6PZeb2WLtMetrLXfI9EXVIBfPSYScn79/bNRkwqf7aeKHfWVbRYmwRZz4LN/
         atJorZybH0aU/7y5YpQhWN7LmzaAeOOVjJ/8nufSpdLmYVNcsf11ltttXDBIXRbI9lSt
         n3+J9rlMwzN1b6QMAq9sP3nun4jEdzBkoZ+oZFbSZHEGNub25QML4zEsKe/sEHDHhNPZ
         PMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747317965; x=1747922765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TIgkAbsJjkBmPmDqXYIo5M6rm+d2Bew/nDM+VokxXo=;
        b=rPND+70ReMEo74SK6DDAvx+8PvIM+dNuRHYqOaVXhaEjphf+GEN1cxTtGGAXV2WNyC
         Cu0D/MBeKV6ySwqnn2Xk98DmzWr0+i04clgO6azSpbHZuvfOXKkchO2W7OxdkV8HorsH
         1BM2UbVkJ02DTt+N9yHyPZyO/I6AWqszp52oglnKM+cyvHbqfm/T9wqkQ92aXfBJgXMM
         gcPQprDZchbONBaNeXmSvNVhe9p63AOLAJVr+Vz66Oln4zYxHUWw6q98x9nS2wCQiJQ4
         pE2dfnk2Y+dtNwPYtoiWL7mPHmnz3WjVtx8tzMYTYdqUyRkTaMgZGBoMi+JKaxVtu+AM
         WUJg==
X-Forwarded-Encrypted: i=1; AJvYcCUbD7g4NQ3Io825slEghstcVIiOiumh/cU/t5cLQkIxO2NnjemsDIhIbu98iPbc83QBthG571qLyhrj69g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9nkLWUKl1hNc0+uEf9Y0sCbRKyTz98mlGfX+x+hDMAqbV8gMZ
	dD9XjAbpKENESP9UoUEwGpEyjwxlrv3lwcz037IgtTEsvZeqyNk1UBkyCbsCt/o=
X-Gm-Gg: ASbGncvWKDDPlPE+psuEPpGr8YIRKmX4OTXHBJgN7Oq6NMnQrFQLzrPxbkXXRlWSv2f
	NvhtyGJL1AjaPj9B8pw5/UqVmFVrUVzip9zzRowPywgWO190ObD3+tsNISHdZzwAr2Um0f49X/t
	Po/mTq4yl3ovJswSNV4fV4zWbxs/1JDkBIFWyS9cfYKE9jW8szQnSAxV+mFyMVkeS35F0qQ71ot
	0BGVacSCT4hrk2A0cBaRXFx5L0tKU4muKjeQwhDiNAvAdl1y6fCtE4HPNxXzG/8pALtfHi3ddxv
	pfeDgZabjOiH70dy5BjJfdR4LLogt0qQpN/XxuSxoeADhoupEsygghdmyz/fUrQ0Eom2khVofpD
	AzrPH6iU45J8gsrYKXiIeeqO8/Jap25aULZ4gJbdeFpTxOwIaXA==
X-Google-Smtp-Source: AGHT+IGmNKfHbbVSEmUusIJS8WAr9eTgCDfqm5Zo/ICFklsk2Vg4Y/cB3sTKH0S53Bfr8a/oTyQc9A==
X-Received: by 2002:a05:6000:4312:b0:39c:1401:6ede with SMTP id ffacd0b85a97d-3a34969a540mr2019499f8f.3.1747317965090;
        Thu, 15 May 2025 07:06:05 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4cc39sm22467224f8f.100.2025.05.15.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:06:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andrew Davis <afd@ti.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Samuel Holland <samuel@sholland.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] mux: mmio: Fix missing CONFIG_REGMAP_MMIO
Date: Thu, 15 May 2025 16:05:56 +0200
Message-ID: <20250515140555.325601-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ZX0b7+q/WHABStHBVU2DZikmc1ff9AvZgSAY2t2c/Js=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJfTD9kKlTS8CAmlyX+fKZbqZ9Zq1tIycMjxZs
 vjcWGu58G6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCX0wwAKCRDBN2bmhouD
 16JxD/9yafFSZ57/7CQ7fwg1SktQ8velRNocwh/6keD92+jYLMP8TMMAbSmo6Rkm4HU3NlJXxvr
 R3+He+hbKcvadaAlHjoJDEcEZJYDRQGsJAPNYBA98+Pq1TAV3mTCMCKabBVA8OUQcTod6YgeFCu
 bAgU5+jDiFUp72fKo13bBcnJezSvZutht/AQTcQpc7dUbX2xnOEZ/FGaqJDzvsNALGnmSZGN7Qn
 mO44h3zirGdqvjiNjKvXR2HqJiRIcjNvAUColXZ/hqtQa6DABRPx0PL0ZZDq/baRnkD3HWNMyvq
 NULJVPomtXBacEHDMSOzoErScbWm6PCRCnO7vAkwq1FqUYgpghUZXENWvm6ZN18TGCg20qr7nMX
 PBhNv4loN3d5xzIUOocZdjVy0/LGpw512RPwXiLazXZSiztq3bXGzFmlQSPxxVIbj1DKVUjZHVM
 SURHkbokvyebwCgFJP0snNf3H2s1Q+HfGoUg1YMmm9dNo949EcrMZrOKWPraZvm03QjdpyNZoY5
 p6VramH779mQPZ91xQz2G6eb4QzedSIpHt2g+1mNucf3hfb7IGTRonmqNSzfGTTUsoqbp1A1//N
 8CPiNBKrJaD5tn2CqcLPlK96Rm0DN6Dlg3NGE9CKRTHqOaNtAB4DBMeMgXKwYSyyjhggoKsjai8 x21+ePNhk/B6+jQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

MMIO mux uses now regmap_init_mmio(), so one way or another
CONFIG_REGMAP_MMIO should be enabled, because there are no stubs for
!REGMAP_MMIO case:

  ERROR: modpost: "__regmap_init_mmio_clk" [drivers/mux/mux-mmio.ko] undefined!

REGMAP_MMIO should be, because it is a non-visible symbol, but this
causes a circular dependency:

  error: recursive dependency detected!
  symbol IRQ_DOMAIN is selected by REGMAP
  symbol REGMAP default is visible depending on REGMAP_MMIO
  symbol REGMAP_MMIO is selected by MUX_MMIO
  symbol MUX_MMIO depends on MULTIPLEXER
  symbol MULTIPLEXER is selected by MDIO_BUS_MUX_MULTIPLEXER
  symbol MDIO_BUS_MUX_MULTIPLEXER depends on MDIO_DEVICE
  symbol MDIO_DEVICE is selected by PHYLIB
  symbol PHYLIB is selected by ARC_EMAC_CORE
  symbol ARC_EMAC_CORE is selected by EMAC_ROCKCHIP
  symbol EMAC_ROCKCHIP depends on OF_IRQ
  symbol OF_IRQ depends on IRQ_DOMAIN

... which we can break by changing dependency in EMAC_ROCKCHIP from
OF_IRQ to OF.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505150312.dYbBqUhG-lkp@intel.com/
Fixes: 61de83fd8256 ("mux: mmio: Do not use syscon helper to build regmap")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mux/Kconfig              | 1 +
 drivers/net/ethernet/arc/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index 80f015cf6e54..c68132e38138 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -48,6 +48,7 @@ config MUX_GPIO
 config MUX_MMIO
 	tristate "MMIO/Regmap register bitfield-controlled Multiplexer"
 	depends on OF
+	select REGMAP_MMIO
 	help
 	  MMIO/Regmap register bitfield-controlled Multiplexer controller.
 
diff --git a/drivers/net/ethernet/arc/Kconfig b/drivers/net/ethernet/arc/Kconfig
index 0d400a7d8d91..8ccedece5339 100644
--- a/drivers/net/ethernet/arc/Kconfig
+++ b/drivers/net/ethernet/arc/Kconfig
@@ -26,7 +26,7 @@ config ARC_EMAC_CORE
 config EMAC_ROCKCHIP
 	tristate "Rockchip EMAC support"
 	select ARC_EMAC_CORE
-	depends on OF_IRQ && REGULATOR
+	depends on OF && REGULATOR
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	help
 	  Support for Rockchip RK3036/RK3066/RK3188 EMAC ethernet controllers.
-- 
2.45.2

