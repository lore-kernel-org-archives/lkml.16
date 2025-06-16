Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBEC18E025
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750066737; cv=none; b=GfhZBH1BsYEGL8FnY265r5vzEzCeLRe8ZMiB8wnUjTfJXtO/pplcmPYzlcHzhHzYv2yibImPqNxXQFVBsF1EmU70hoNRz/SVTFQaYOYgPHE9KTTZj0/yHUVPDKE5BwljdJ4b5FE0VLfQk08fpKltsXvil3YPD2sriustWPLARRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750066737; c=relaxed/simple;
	bh=FVwtelZAyWQx+vqU97yUlvnFPUwmzYcKQPRUwBFWJkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O4JQeV2kn9JfSW4tRkZSVOPhgpRBnU04LYT6gisR68dZXmm3n5aDWVBQt0ENF6ZqbfOOSpt0u0ntyXGorE46mHnwMQZVa+EzV/ASEojumhbaeepWby5JDUaGRK1oHmxRAbWCRC1i9s8HMOJv7JjrM4mdH9mTgm3dWP1A62HV/t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mgwee4eW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mgwee4eW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4e57d018cso602325f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750066732; x=1750671532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHZtdjxQWPz2h4m67PPRQKRG4gxPJKeLX80vTkxBv+0=;
        b=Mgwee4eWM9etIm67A2SXC0P40omJbKt28X5GPLWjlvDvCSdqROXOTns1h7NwcGnqgK
         Pn9Hl+aBHtHsFXi6BL/fpHpDywzRLjI+dislhRPKbsStlg8Lho75g0ee/+z9sO4s8thK
         BGhkdRlVAcuKwALjeTWf3SN/QOpJTDbIoxM3+4EEoQNd2r1ElIn6G6puKhB5e0fCVtuF
         Ew5arFgVbqSEgY0f+vkIExf3tSMPHPnhQBMx5d730P7HJNDw3kXjBlKQtjz+M5VgC+W5
         T5OcUHAu8L3q3lCXpKyW/APbtqlv6upxTapQachCsJa+A+sYNhdBfbP28Gxg96G/RG7I
         CmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066732; x=1750671532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHZtdjxQWPz2h4m67PPRQKRG4gxPJKeLX80vTkxBv+0=;
        b=wPOyfpA11NyJlYwAA81MXS7oIsE4GNHg2aAJ4eMFK0d7xmjVH8Z54EPbEPXk0zFCkB
         bJ2G9W9JjxE/cauYweVF3HGNrgwqkcNQD3OAiQ13WRIcLrWa7aFgBvsveuodQ56EEYT/
         LACTxtbUAmGst5srAwmI+KMc8Zq2ZRLHK8f1MsQ17I6PyHWiL5X1pcDuqWToQPIYelVn
         PGzxWCc2fA/HQncHeN0xmhWyrQ0LIupPzv9Nhrs1lkkrfujJr257X88X2Yxw1iZ+uF8C
         6ckdjhLE63sPefI55vq1Q2DvvlKqcwnJ9fGskVfiQLkKfgHzu/UMRqJ/oLwYah0FhX6h
         Lf4A==
X-Gm-Message-State: AOJu0YyZmrfPjHBlkJcAkzE0xQ8rVgAtzL7v8Ab0hF3amdrttZvSbd4O
	FXY5fChyMU1vvWyc6HHSq0Ri3K/0JQThAnJO29B3axPxdflFiaXrsgYaHEPnI3hQOlU=
X-Gm-Gg: ASbGncvhlGYw+rX+n+vkwQIA2n59OMl/DOwJNWPe+SB9oQxQYTrmZAcrSptuqyioUSU
	aHCfv2acWJT0/ZwGRph2obOPToBpGlLWjZE5DGxASe+SM+NhwNEnvctsW/YoJrNfEmGOd4BMpla
	uDREwG5SBhnxwGI7o3+EPyrrn9oOeUk3rNYpB1eQsV6O/D83jtfmtE55Hk2ooPd+MCFILKagIJt
	hSs4Cz+674XECmQvRmQfZI1CB34N07p7pXY9656xsmUfXAngC6JRRzs10Oyytqtyffvk7yKRFDT
	hxpnTJdF3V5abVlq4UoxUYe42nriLwJeUo8gDXrOm/kbdpaVQbB4QV3CJz27gyGpNuKbmTuSeqp
	m8fUOpglu
X-Google-Smtp-Source: AGHT+IH7YEG/fin7X5hn4NWKBNL9RSaFU1CTzTiJlnm8LW90ELlWxqL77mm55nI4g/YzfkCic3CivQ==
X-Received: by 2002:adf:9d85:0:b0:3a5:7875:576 with SMTP id ffacd0b85a97d-3a578750726mr1381419f8f.1.1750066732325;
        Mon, 16 Jun 2025 02:38:52 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b403b4sm10337099f8f.80.2025.06.16.02.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:38:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	peda@axentia.se,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH current v6.16] mux: mmio: Fix missing CONFIG_REGMAP_MMIO
Date: Mon, 16 Jun 2025 11:38:42 +0200
Message-ID: <20250616093841.31985-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FVwtelZAyWQx+vqU97yUlvnFPUwmzYcKQPRUwBFWJkU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoT+YhNcd0X+nGHi+aAV4LRAJsyBED4eM37dhf2
 kjd+VaS6+iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaE/mIQAKCRDBN2bmhouD
 110UD/oCUAiBpnLeUsWxxbwLNuC15j1Ju10mxr+crkyKH7iElXDsvrBhiqQwhYFQGsdv0idiUvX
 QN0+SHrETa6rxsQVAaPjUuEwYKlAzOrMU2tgOp4rozlNNQcECR7454UgPz1TMODUxa4C7HPMfJt
 J7LWIsUlP1zXaEBQSvySYNXcKrWwIT9AluIo8W8TxTPBWttVI6rXutd/wKWarovnBa7YDCoV1rg
 M4PSsb+5sDLxK4HcCo7IC+k86wlB6YmZAYz3J95ewbcsVKP918RiHRGtkKtAqeh80lId1a7W5fy
 WRTFksmR4h0WoW8gaB80d86NG6/vwA00Y6EyMA0Y7WodMzFjlo+5zXBukDOGviRlYNEcRNcBX8e
 Dd1RsTBQLF/FW6VQBWDKZiUebFgmD2wGKQHWvMI1kJ7iLW4KAxxZn/EjbST/ipJN+/0dobo+rjW
 esgy/sCt0Gy6AZAhjXLfIPCexGlXf/g1zCvBdzcHtTZLKqO6nr94jE3G3RpzxxVcREs4SLxoor2
 UU1pZBpSi2QnkgGLPnlIbbJD/JD+yTJFeUg/yUd2Qae2La2bqjN6S1kaGuwqtJPXk29IS5nEvaK
 aWStiYob3rEavnrXRm0oj0+cf9hP8lo33ItH0I3TkWf+iguFYJrz64IrKppZjHO4a93NDzrpF8E gk9zfKrOedWmxNw==
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
Link: https://lore.kernel.org/r/20250521152354.92720-2-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Hi Greg,

This fixes compile test build isssues reported for commit introduced in
this merge window.  

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

