Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45C61DF991
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747841045; cv=none; b=mldRCBW/vzcJI+goDHbFThIOSRFADo79gIwEqIwJupMWXCMaZXjKo3qjypdD5KKU5RQuhxJdCxQFRBg33ZNctaptCAC4y5U5SEbNS/v6SehqpA9L5zz3LWkcWPJhcWn3Hp5rpM+qpGGAwiE4kuOSa2aQDKxY7tseLQvlfHV9ndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747841045; c=relaxed/simple;
	bh=8HrgxZ0MCumMDdt6QFamqYRf7OJgYcrR1UnCkEFSiXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2qf2ctTJi6K32VVDmq/VNNioL9fWj000Foa4hL1uDyTTwxoLumN1gGlhVMQLcs7MlgSaOcwTOfxPABaNEgrrrfo4IHRrQnlYoQt0GNEcUI+wMALrWiXCazqWLfOXHx6tjPy/GQgPZ4GFbqRGvWV9ZHHIVdv9UJOGlHsfJU70vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dAB9mM/1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dAB9mM/1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a36561d25cso627603f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747841041; x=1748445841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tyg+Wrmw4xGeTvAbK5Y4prcmXa3cOdYU4hJhJZWwkws=;
        b=dAB9mM/1xv+OA7Ds0D0KKpDT3nGR/y13ksi6qx5n46KaIS8LBDcSejuVfo01BZXeDz
         D3BiUEI7V7xFFPn8RkPa/x/HGJ3AtXgi/vypbqDOcuJEyT/m78V2s7e3dGMnXwf5GwVq
         kicIr4UMXuqY11iTDOG9J37zXQE4V6JPd6tlql70SHOJui86NfR1ccLsjDMuQ3f+elPi
         bEANP4k75Aiaa9a9vNHbhuTMI+SnzOvMK74JJFGbC6irS2Yn8EN0POCkkvyeZzNfjTZH
         5TcxqBnCRZ/wywVkY5bvKGDi+CVSpcnE6+f3mBTSl8H+z+JEfwXpXOknBzEudDo2NT/A
         0a2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747841041; x=1748445841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyg+Wrmw4xGeTvAbK5Y4prcmXa3cOdYU4hJhJZWwkws=;
        b=Un4JGF/MjDt2Ixjkdh3ZwQasJ/9NiqTqJ3W/jEChDrCSOwyKOePi1FZ4JLRIGdZK1E
         SFcdIRKk0oDRdlNPXWUsEbcCvNc5BloOtGxP5HtUTZLojbU4gdRsJe30AylmAGk5Ag3p
         AqfwDRtnlPwbimKoxtWHzuZL64AQKCUEe1WCzHmDHrBHe4wH6Bc5/mTuadgLWJ2zq1os
         nfjXmQ23hZ4keQyj9OwevaBr1qVDKpeazBLHPY3YrQewqW/H9TV5E4SbBSXaKjnO5UJl
         5UPSvwOPlUzejULTI6D2VliDjU7Bbhg4Va7H/bFig77Zdg1l8jVXSZ0Xb9uZYJuSs2jC
         j0PA==
X-Forwarded-Encrypted: i=1; AJvYcCX2h3e8SyhThmdXDX99wb3JIZNAUDcrKIlzz6oVKWVmsjjXuax1YHXKibvUiqZQV+xf8F+c7Gy5/V49V2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy80F1RxKm+L+5eC5dk0N3lwnDPhrzJK9Bsg+f8Tc1d0Dc3vOL
	2aeAiQd8VOic5F5doAGuB8DLunbMWWMaHENwgfk8mZqcR6/NB4kSx3fTHnvEuLFVBX4=
X-Gm-Gg: ASbGncvGCV50acUhdxuXm8FI5VXYppWyYdU3rAlLv5qwm3ScPzoERNeqtNwt6OT41WG
	wYqbv0KVFhDIt09LRMjkvLMBwPNaf9znKGkBAy+AYbc4i2H1b0lxzNpJ2cnbb0gjXATeDTlor4v
	gNyeW1qphRZIBGok7XSzSmvjFaxweJabnXEg7NnfxqQlYQqpkoQelUPbBcRLLyNEccGhkuAnRIv
	eoZN+62Ql7NBV5j97VJxKVK6caqA9LiYGN4uZjbW+6KvESiSyJUBHh3ZFhYCLgq3PitC7znpoBX
	DYpnOgEXlU4CeKpLp5TUxBZTEep7YLaOqtB3pFDZo2zbDxZhgMKWVDAqN2eWWg==
X-Google-Smtp-Source: AGHT+IGdFbn0AfMZUbP4O4bYrNzBfQ2kWAGPAMA4GFsdvBT08+7uXPeU9ZMNwNJPm2zmZ1LygroqeA==
X-Received: by 2002:a05:600c:548d:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-442fd60b9d6mr72248965e9.1.1747841040986;
        Wed, 21 May 2025 08:24:00 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a8c4sm19826090f8f.27.2025.05.21.08.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 08:24:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Rosin <peda@axentia.se>,
	Andrew Davis <afd@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2] mux: mmio: Fix missing CONFIG_REGMAP_MMIO
Date: Wed, 21 May 2025 17:23:55 +0200
Message-ID: <20250521152354.92720-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=8HrgxZ0MCumMDdt6QFamqYRf7OJgYcrR1UnCkEFSiXo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoLfAK3v8jvzWAXIzHgO40yc8XGjTC26EQen4CU
 th8L68sFiaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaC3wCgAKCRDBN2bmhouD
 16kOD/4xNop4cR/FRyvgP0rHxU9fPvI02If9V43ivPZSgaQWkNhe0HzLDScj+7qIXLkPepEMvzM
 xzQyL939bIiTxEtH+YhN+UZTBDUEJk5cml3v3SHqbXfuOyj28JbkF8B8u4ZfIbrGFkJDj8m23cl
 pPrQnu2SUN3yRFbYFRiOW6sCQ/xnkTfERU63MxEXEvZ+3IcpjHrkTXOL/XB+xeW/ha7evYk58dE
 3hRdjwuD9viJBKDIgUm7smbbxdeEge4WnjJCN3IUD1BVhEoMGiqIPuonerzVF4IQgo0D31L0iWJ
 mkD8crcRK8Q9TRx/gkEFY5mFe1OADcyYJ8AX7KqAKy8E/ZHI6PzfcCakDUhyOSN8kBnVnanvru1
 bQXYkM8HL5TLbY1EGtgDB0fupIwy8IikTcfaQ/qlUvUsjwLLtCYVgnMieprepyfmPb6ZhQhX6MZ
 9DdOF2orEIbygKir/nKna19+7GljyaM3BoYFFQit+8YIkBPg+17gPVpHnpIg98hpZ+CGuG1YrGg
 M9xkxZWUgnJuRVPNRhLZNG8JWVmj0AJ+3LTW+EK52no6srIhpLz4WzPT5IkiZSgid5LhTZzbtyw
 3Xty7w0TOIPEgeA6lDvLFtPs5Mw3k3ejTeP8iFm2U/7vpD3MMWxMUo84gwpc3OXzOQ0dpR09Dtt j9n+Pp4FVOcZYYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

MMIO mux uses now regmap_init_mmio(), so one way or another
CONFIG_REGMAP_MMIO should be enabled, because there are no stubs for
!REGMAP_MMIO case:

  ERROR: modpost: "__regmap_init_mmio_clk" [drivers/mux/mux-mmio.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505150312.dYbBqUhG-lkp@intel.com/
Fixes: 61de83fd8256 ("mux: mmio: Do not use syscon helper to build regmap")
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Dependency
==========
Patch exposes Kconfig-circular-dependency, which is being fixed by:
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git/commit/?h=for-6.16&id=c5a219395b4e6312102a505bfe73aac8f8bada8c
Therefore this should be merged after above change reaches mainline.

Changes in v2
=============
1. Drop drivers/net/ethernet/arc/Kconfig change.
2. Add Arnd Ack (although do not add Jakub's ack because netdev part
   changed/dropped).
3. Update commit msg because there is no circular dependency anymore.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 drivers/mux/Kconfig | 1 +
 1 file changed, 1 insertion(+)

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
 
-- 
2.45.2

