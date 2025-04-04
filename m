Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F07E1F0E58
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767848; cv=none; b=rO76nxf2Kd0DK10g0ulPpeHYjPoUau+hDBbfuZRXEzwJ79rmZQW10NCRO9EQUaP96pabA2YYH0xsjC1kKVpdqOT4grg0sdn72KQT2VT/hDTiZanXDejTJs038N+F7YKIHeX8Sg7EVGUegkO4oY33pDybvx1dpP/woyRLn7v/RwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767848; c=relaxed/simple;
	bh=f5+Z3NxSd3MuBNTouLvShUVcveuEqAlNOVOD9G+dzxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CyMhmm9Me2pHxxO4xjN10BufXNXd4BNTAgWAPkF/frYzJ2kJd5l1w6y1vxZQb5HHi9o5cxbjL0UuWw4zZG9iaG5X/VRZ5qAdZI5JrCfKIuHS6Uf6quPwoQpNwg12Yn6tvM0raYBJmCamWiZr1nsODFu/3ZsV276WYAy35cSS+tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iu149ib8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iu149ib8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39127effa72so177503f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767845; x=1744372645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7FNE7uW7CqflTfCGo1n2418876ImE/7n6IUCl4015U=;
        b=Iu149ib8On0f8AYOMN3K/oNF8Mvwann0+MzmD8y7xThXE+Eut5ej8ZZMkbY8dnyrPF
         t9jfFOGeWABPzeEab+5eHa0YPbDZ4bPUQp31Op7JQTJd/8iKZiadXpE7ey7Vxp4AkBRZ
         lBg6413kINlqHlHhIVcKao+GnJftIVde8u0diD40hDrdeS1OT4cgZ3MMLlpyhhDSmD4Z
         fO8+gRPPq5Ttn3RtzEe8zBtCWhaL/+yG/yHzFqN1JxM/g74+uviWXtDvR7yPmJY42uw6
         TJbQJbzvuJcgazVnN/p2kmdzGkaixwAHTAWihkGEtjR3U/6RDm6C0Ao41kgF79qZmFur
         92pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767845; x=1744372645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7FNE7uW7CqflTfCGo1n2418876ImE/7n6IUCl4015U=;
        b=irHG4eP8bxf52OgoZIzZoK+M0fuABdy1phllNp0kkpB8EkNPu9DA4vX8HeBIDLwRDJ
         kpctSJN9dbfrvM+oSBkXqf34oitsh9/0nbYn1EqD2v6103jTJeE+Em2YjifbVe1k25wC
         /yit7zjpJcvO+InJJ4bJ1Tlo/a0sk4jfh5cj0ukHWiUh7cp9TGEPBUwljFEaY2tStQlK
         rG/MlSuGGlNC8xkwjhOfpiNL7E7PBjzdMPmYzTsTX9zpbbzh04ToFARoI6/U3kOyYswk
         PaZjupCtRyhjJCe//KU36p9ShMILH3pubWkV2eL0nS2YYwLGwdUyssQExZeqb7Ks8ava
         eTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXP5OISUJ2dEd7AT8201Qy8ahGeVt5Pyd3nhcKVV1fkM1qgQ3a0l8FtD2Fuu0sMTNJziMEWJCKjaVMlUZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyM2T1xC4qz+9NsePAf+aAQPHhcy+ZaWo4REQXzkZoAplDWnco
	C4bHBpCJxL1ebmk4nZvskKaIZfl1K+Od02MuN578yIWRlN51JjJbMRyAauPlMIo=
X-Gm-Gg: ASbGncttJCAUX3KdA3O1GfWz+KkR/2bDvSVTz6hTN3n6VBopjRvR1ZsiTaIUH8+pGhj
	Uh0t3eM9rRyIkwCNDd+Bi9+m1h0ANzOzAGQXF1QMBY2T775eZevMjywMn4VLCnWpSsRn0bheIQR
	S6YosqMqOQD+LTHpRkpCWtZ4Je2S7QNGD0iP8fdZEUlFQ2gkbbIN5gNKNqAtlxKQEj1y8k3lxmL
	KDYx12Qwhd7GhSdPVrhYUW9ClXxyR3DNDyiHpiS3kChDkRRPGdHpW3on6fWCKInBiUXQyVNFToZ
	Lq3/u6GG1t56hiH8UkceqPkAIVOfEzXnfm6i+mh4BdcBpdGVbamAFw==
X-Google-Smtp-Source: AGHT+IHBtV33JgKfAEZ/K/Z3eAGyaEe//CmaN4daL7d9M+mX3ZcQYu8+eSe3/MU83jWvj/2V41Xy8g==
X-Received: by 2002:a5d:6d81:0:b0:38f:27d3:1b44 with SMTP id ffacd0b85a97d-39cb357b616mr910662f8f.2.1743767844740;
        Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
Received: from shite.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301ba2dfsm4209455f8f.60.2025.04.04.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] pinctrl: uniphier: Do not enable by default during compile testing
Date: Fri,  4 Apr 2025 13:57:19 +0200
Message-ID: <20250404115719.309999-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
References: <20250404115719.309999-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enabling the compile test should not cause automatic enabling of all
drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pinctrl/uniphier/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/uniphier/Kconfig b/drivers/pinctrl/uniphier/Kconfig
index b71c07d84662..5e3de0df756b 100644
--- a/drivers/pinctrl/uniphier/Kconfig
+++ b/drivers/pinctrl/uniphier/Kconfig
@@ -3,7 +3,7 @@ menuconfig PINCTRL_UNIPHIER
 	bool "UniPhier SoC pinctrl drivers"
 	depends on ARCH_UNIPHIER || COMPILE_TEST
 	depends on OF && MFD_SYSCON
-	default y
+	default ARCH_UNIPHIER
 	select PINMUX
 	select GENERIC_PINCONF
 
-- 
2.45.2

