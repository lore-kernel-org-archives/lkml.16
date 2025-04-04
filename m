Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BDC1EA7FC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767826; cv=none; b=usu+j1mDeZ4cyTB0D/2Ngu4XJxbUam8blTGZR8NMOXjJjptfPr5NNNCJHN4PW8XpARE9nTEXq8/Oi7Yraq8F0A+zJGEmD3Jhm9xOMZFYKy+9uECSw9JYEC2DlB4LHwUJtNANX0wZG9C0fX4A9IKj/mAsX91uc8WOT/KPaZiOfRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767826; c=relaxed/simple;
	bh=d1fAb3fHPiIYP5vnZt7mimC59KcGXB/kjjU+riDZhLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RIa27vhAibVs76Ar1VFSCAbQB4ELOq3evG7QB4cdyCi+pZ5vS1YoNdDdeJe5NnEc0QPvdtY+XgUCVFvwxVMEsH780TOTXifk39BGHV7mF8DGPQT9XKOXbEFAWRZNzCts9hi95T7qAGda5kUGIkD9QS43sC1enjsWRpmIrWHcjXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=etbYadnn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="etbYadnn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39127effa72so177435f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743767823; x=1744372623; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
        b=etbYadnnZxOjh1wnppuM68xoMdapqCCStqyvoKSzGPn2mixQ69N6ZQqa2Nuf1Tc1S7
         5aVGryk0tC84wSCv0Be3WFdf4yNz7RGfvfsU5tEG77ywqcT/FWOpO+9GAcRE5pCN3zXH
         UG9Q+XeJ3d/I38I8X/Hz3Bm5JiQGB8U2GgSPoeWpGYECJ3VQs8muG1Ee0DMrtH86kFBG
         1ywBUR1Fi7Q18MlNSoXTHukKJJdpqtM8acqlVlX5rMy8QpLTTRTbIhnTUR5H/xb3CNWM
         1A5rIIgzJAqeRqvlxN5deDOEGuwOXQkr3UJwTASZB/rgtdN/74oBLoAFG76eBPBBhM7v
         TahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743767823; x=1744372623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rP6n61SWekMknO/zRlSYN14fVYP5G3VDX27XosLbmfk=;
        b=BFuF26TwkYQLh1mqn2pnFuf2GuWIynPjbx+36JjdYk/7XlWm98CgatH6uKRhY5iwLx
         wJ9nHRkpR9qPI+/ugwu7hQQSj3li4CA5FBarV6UVCsVxrYSIrci06WNO3cizYSA/p7YK
         jm4xdpHr7jjZp0QdhaKS5HU9go/lDV1OSc3NztGVRatvgY8hdPPbr+z12vuM3BUFleZJ
         7JLL48vhKCUcwRNCYKolHwrOQfqAS09Fv6ytcIbvMIV0emPBgjjom9pVroQcGjaga8Yq
         cEp44b+ScNYrM1mF3LB9cll0MnsKmH7gUYi9O2sS02prs8IkOZPAiwzghuvmUE3ez8KX
         cNHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOLQnaZlv/t/ehIyOu+HkTZL1qQ/TfZpIY6UvfbnKACxJYozZxwhGe+/yFnx2DTHTSGffA1KRWL/olbtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YylmAk+gRMih8Io6Bk+0MtfoQT4L+ZqhVXFM6pg/Q8cnG70QEzP
	fiT0J47t7OnKUQjGVfB8KNwLqm0Y1MkX6z/QwVk1bysLNEyvwQOm/fG4m3UiYrY=
X-Gm-Gg: ASbGncuYT3WoBQHwgUUrOdBlFYYkXUv0lll3O6GjFim77qnip0f8v4bdt3FPADwG9Rn
	UGR3MzoCfV9m43KWq0sqgEzbYEfzh5J9qJNImujf7yDTAY8ceL8AqYPl8b3ut1N+WspTtPyNObX
	Vn2n/WgISmwJhNbufAkasEdbNbKW3JVPeO9+9I8FQX6J5u6JKKLe6LvE4ZMnBozm/DpvkJE2n3C
	MHtYsoifLmrGIV/XmnfOoisPDthSHcIQcQ6uiPHtsQ8AwK5R8yEuPMUfLc1MiMn5W2E4urktf/c
	RKenVsi1pCeOD+pQc7mrLRnFYXJtQC9CyoaXqKTGVz1+AEFE8FAVkWiyrAsIE4I=
X-Google-Smtp-Source: AGHT+IGREdRnQ2gEflgpMySypGT2xrFpTeuT80iZBzxVkRizH3MB1Iv/GdfxP0Mu67TBThpOTa6MIw==
X-Received: by 2002:a05:6000:188e:b0:39c:266c:dae with SMTP id ffacd0b85a97d-39cba936215mr862740f8f.11.1743767823172;
        Fri, 04 Apr 2025 04:57:03 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec364cb9asm43842815e9.31.2025.04.04.04.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 04:57:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Apr 2025 13:56:58 +0200
Subject: [PATCH 2/5] clk: nuvoton: Do not enable by default during compile
 testing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Enabling the compile test should not cause automatic enabling of all
drivers.  Restrict the default to ARCH also for individual driver, even
though its choice is not visible without selecting parent Kconfig
symbol, because otherwise selecting parent would select the child during
compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/nuvoton/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/Kconfig b/drivers/clk/nuvoton/Kconfig
index fe4b7f62f467048b7c86890972d55faebd066947..e7019b69ea74824de6943108f30ec259aa52e5f4 100644
--- a/drivers/clk/nuvoton/Kconfig
+++ b/drivers/clk/nuvoton/Kconfig
@@ -4,7 +4,7 @@
 config COMMON_CLK_NUVOTON
 	bool "Nuvoton clock controller common support"
 	depends on ARCH_MA35 || COMPILE_TEST
-	default y
+	default ARCH_MA35
 	help
 	  Say y here to enable common clock controller for Nuvoton platforms.
 
@@ -12,7 +12,7 @@ if COMMON_CLK_NUVOTON
 
 config CLK_MA35D1
 	bool "Nuvoton MA35D1 clock controller support"
-	default y
+	default ARCH_MA35
 	help
 	  Build the clock controller driver for MA35D1 SoC.
 

-- 
2.45.2

