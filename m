Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7E223DC5
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462426; cv=none; b=dfs14qqZJUyd52qHt1MUvRqaORpsnwz9Lt2G0BcZugd2f+elaQNTmK6/VX79v3BFLzjP9JABdMYyw0SwQOh347swGJR0OPuwlBdscX5p2ndMSZqdLrSdTFyhFbu8vZWVlTrBXRcS/d29ycpx7dg1zJf0v7wpxUpCOliMf/y6oxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462426; c=relaxed/simple;
	bh=5DA+AqsUHtlrpCLr53RVEPhkKk3E6BWf3tgkSlGM9po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tHb4Wiv7/OqT22qXTh8sKbTGQtV49BkN9Ye9jQ0UgkICtkR2h417aJfoPHBWanCjRZJlF+HMWTu3qBqGhrxA7BPFBT5f5Ad2B8X4U9P20Kd6aZeb8QnKSX7cgsNsA1RCctHmxGuWBihsjsXigOvbMBx0i4ucreVp7ovuA60xO7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ljm8VMBd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ljm8VMBd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a362e099cfso28594f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462422; x=1749067222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKLxvsv39RxRJwsXICazlS7Jk7LfOfN7XFHnOLZsSTY=;
        b=ljm8VMBdoZqhlxe5P/bT+dtQhctkx0PtLIDzRLFgvoFsCNNa1w022B1RPMtNW38s9e
         LeK9tE8DdEfFTplxFWz2ZoF4CJioXarUzXT9nbRbf0t1slS6KcSW0k2iBkyPRVIzCtDm
         wHj8/q5McGa5JnnIzaG7NvVdR1FCrSKke48j4zhUcn80VJHIIXEZ9mTONIvwtR2K0hSu
         v4fHh0IEW7KwapWMB43p/ULX1UC88Mg3S9JPRgscKpspvywe/NrGRxV/hOYdC60px6ix
         wF0jNM+ETBMktFuwvffLU9ixdG0tm10MXUgjF16SmLH/NIieDZfQe/AuP+pEdBZYuoDC
         nXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462422; x=1749067222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKLxvsv39RxRJwsXICazlS7Jk7LfOfN7XFHnOLZsSTY=;
        b=meeIwjcQGLGFBIRUmRqhGjr8XRLGfRT2MgQDepAqPYDFuhD7cZhT2H2pl0NRSkYSkE
         qLx58Dt2ME3khKJgnZzgE6doJGNScm6wSo48Fpnq48L+/x49PUOiuJm+k7T0Kw2N+ygf
         W/3qg5tewWwUO9rZCkKif7mL8ELPHiQ0SmSQ/jpXH+I9xU4zsorcj9NP+YaKELSrAgNw
         kbZQLBcfE4uqEnvlztOjI+/VUaUHJmswKauKOO3rPNGK7UwLXFHo33HrE8F0GUBigJdB
         kkyRoifc0IUan9rCE9YxxRhmtWQKgshcJodV+jV7AzM6Z+HS41svU22/u0PqfhyoK7Gd
         N+Sg==
X-Forwarded-Encrypted: i=1; AJvYcCX9/RLwFLheNGFoapQJuRFVg/Yd84KqYKYK+yhL2pLYkv++V9V9IkxqUgE6UObQGwmIoXsM//J+LKOoBDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr2krfo10V9HCFvyArhvc1w63sgWLunDWeoo3sYQFEOQjTzDNA
	K4TqIsJ18lsQNlFfPtvGgz+cXqm5lqY//5tUg+WrQZJniHc0rpjGn6yEqqO51cSKD8M=
X-Gm-Gg: ASbGnctJ5xQ9/rKp2owjXUhIsIIc8eOMkdAAdmr2lrT8EH4leJSY36SE8Ri0xNTHPR5
	YsTRAuXvdT1antYkkAh9S4Cm/Su02NKBtaOuVFJyvt1bNn3/XPG7gFIt2AfBOfgOHgd2E5YLT2A
	fDckaQNt27yeW1YPPyfBhbQZKHfy5aXLQDlJu8EU4cZjBn3sWkmZOL9tIAF6jcHZHSwXJvSKELL
	s3fnJXEZRfwOLWaDtRQ3i6BaF5v2QvqF9D5VbZCJYlF+QEz+v3byfpoiuicMI1sVrOfnOWFebXg
	I5jPzPBFIR47gI2Qz4PIySkcmkrBz8TqDyTWf86/KtM55J0rnWGIQ5WjuG2dbJ/ipJm4lnpiksJ
	jRWfJlQ==
X-Google-Smtp-Source: AGHT+IGJ3sSfYBTi3fPzjAN4VbtvolMgUW9qvhXd5IMVHnaBWBDNY4Nx1ZMx26UcQkDgBz2hyRa/zA==
X-Received: by 2002:a05:600c:511f:b0:442:e608:12a6 with SMTP id 5b1f17b1804b1-44c91dc9fd0mr58577005e9.1.1748462422502;
        Wed, 28 May 2025 13:00:22 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 22:00:02 +0200
Subject: [PATCH 8/8] ASoC: codecs: wcd939x: Drop unused 'struct
 wcd939x_priv' fields
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-const-unused-v1-8-19a5d07b9d5c@linaro.org>
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=908;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5DA+AqsUHtlrpCLr53RVEPhkKk3E6BWf3tgkSlGM9po=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2tDrfib95CIYvZk4xi7M3DrBPE5m3VnGlzkN
 aW+v+MbM4yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrQwAKCRDBN2bmhouD
 15GKD/9fKywTDMjSHUBEwvsrMSYZ7PJx1H3Kx5RNb5MUtSG25meDZbWaHgDfMYrAPGpDsrgrtFR
 SGnr2WIOUdS4bx+SOU06YlLibFXpT+Uomolo2M9qHd7FLc9eJoh1VJ51hjHFznCbfpvEHAA7Fd+
 S44waPs6dgPrXRiTebK6adQOIYTf0kbBpNxkpwzdU6qNpSXeDzoDhbBYEI6bVp7ACElErAPg+NV
 HVY1qU+6PYUr2qVy1oTqiRvJoJ+4XQkSRNTLJArUdzXCN0gVU12dVuWu8n02ktCTobOjY1HflB7
 N39K6tqGL+Yu3tuQjuBjiF0asayZYqxOU70Zvz4Uj/82wQ3+yPqLWofZZr5nBf4S+eH7A+nUcLn
 wKuSW0AARL4MBdUQMBsByDZ+1583R5ti1ZzC5jcqWsyd/WUpPz1drs0CH4u9lcIQB6ZrWhQWIzW
 YoOULhkd7QttJe6kqE7XG2yq13z01RP7ONPPWtgJdlBtic1UKttSPbvib5iqZfIiOL0qhzYmcRA
 hLLlgRGEGM+6gL4ZMIpaAhypFVgKfBeyC5YlrjiUEy9y+aDSJTcOmrtR9SSI3JrzAB4lg1AQ2bu
 +t0xvzD0BCNsmMcuB6x3ZWOGTergECuyHVgmIaHVU8ZxvHTWUfHLsqEnc1foLwqqtXekUF4SY7C
 YLds3m08OwHgHMA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'wcd_regmap_irq_chip' and 'jack' in 'struct wcd939x_priv' are not used
at all.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 067d23c7ecf90ae06da1ad6cc89d273fb7f7f875..bfd4d2c8bdc9bcfcdbf673d20458f779922eb464 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -190,10 +190,8 @@ struct wcd939x_priv {
 	struct wcd_mbhc_intr intr_ids;
 	struct wcd_clsh_ctrl *clsh_info;
 	struct irq_domain *virq;
-	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
 	struct regulator_bulk_data supplies[WCD939X_MAX_SUPPLY];
-	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD939X_MAX_MICBIAS];
 	s32 pullup_ref[WCD939X_MAX_MICBIAS];

-- 
2.45.2

