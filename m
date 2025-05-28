Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1D6221261
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462414; cv=none; b=CQTahLkGSaaIFhhGANEMlEnHAmRza3o6Kk4eKARf/4rr6CZ0dIlMtrZyJJTsbZ1j41C1z+OUhgKHamLiskUWKjqX3VfZacKgEBWJ2Vvwk0+ZLlZftQef17rjr5MguHcRq0kPF1wuAIK0PEaR7lNgEcZOOUYfvqC7MrqqXwTRfQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462414; c=relaxed/simple;
	bh=CpYH823lP1gANgxKRTCYkC1iXZwcMTKwp/L88jc6Xws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csNO68V7osu3Lp0EjGG8GV3F5nAjYOy27D8S53XcrpUapUbhe2PKv2an+BagM2qFMYMEjFC5twjygjC978oZGy7wlGyTf3QzBeFSkUv8vfT1Yrw/+zLnLfdtO4Y/Wm9CMiaylTVYxKbMw9IJcH39elP44hbTpmHddoUOaP0LC98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EcqMzV7b; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EcqMzV7b"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ca8e6d05so38695e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462411; x=1749067211; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDq0VVP4RBrXESa/PJeathjlPVt4SwgrUucxImBu+7c=;
        b=EcqMzV7bAeJT1vV4xfnJLSrs9E0OwVyz9EWvG/WxeBZCx33Lbehwn+dOvpGxdUVaU1
         OdJxlOX3FWh2ZryuF29StlKMQZ5l2c/s8QZf9c90NHm2v1z5ztyvgnwrns+9K9Jci++O
         zc15aX+dn0JOiLhvayOmBDaE3/DcnI8Xy+21Q/WPYDHimpeSpG5KuBoI/kJiJ+sp90X1
         JXGuKdYrN11aBForg3OicMNIy5u9CuyadSAyxgMajcVLUqP2DaYrYsKnUOFS7uNjtrJ9
         LNY1epowm5W+jaPf5VWa4vQVffTMgQ+R9VIZMSGAWsgSjUu0e9L6zBbkBOMf3OxfWSh0
         Wn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462411; x=1749067211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDq0VVP4RBrXESa/PJeathjlPVt4SwgrUucxImBu+7c=;
        b=UDWKCjo3cyi49oR3InjO+x169wTXkE43oXnCYYSOH35F9HGVXWI3NUlHQZY0i3sP42
         rxV+C/xtj1HgGjDYf1VXduOrUos77jXDdns4YFkY4kp+WrP7XD9pifQ/K2A1T1pI4Owy
         E+LeKTOAxcCXZCqkIq2gWFPX1UwhLT2zIs/CerE2tOEqOy5zepiNfcMi4deZnm74CLRS
         h6TjZ/AvfOL444xupRrRdO3Vtb3gqpysMf40bKlT7v7m4lwlw8j96F1u4A+HwNKD8bkK
         BW/z869UwfWg3BMu3lUksRuCtmy2bddu8iss74Ml45PX/RrgvWpYA2A96IkqPY2IWUhs
         Qpvw==
X-Forwarded-Encrypted: i=1; AJvYcCUnB2mjeaFZJsQ//Q4G52L058Rg1tro7GeEqci33nPPWXtjkgEyEovfRBTRjyl/AVoZLWoU7ON/hmK37bc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdawW48yiii1Bmls3oIzv7BY6RTbdzmjuMpS1oS87AfzKmqMVW
	MtjntUB/MG60o6FGhU670QYwgcEZpb53hJ+KaS3XTjfwnBrES6O19tBNvthKbD8vG2I=
X-Gm-Gg: ASbGncuwy0suYnaD5H8XaS6DIz2z+zHzxzL97+XWnJtrC6BDQJbYLNUdZ6ly5+5ZQf+
	rRdPmj1m5WhPhzNKOccFplj4702LO2z8r4jE6NMB55njPPFwB0SCf2J3WuMc1tTWTMAJba+p4Zx
	dADm0x4n/GdlTCOjXeX9U+t8ddawpqKoObMaVR/Ot3ScaosqEltUBs0rLCT+G3T3SAK8EJXG+lk
	+gcUP9LYA+STGVwXOowUy2dQsVAF917J3vio3uj8jWq99OSb/eJQg3X1AtYnzGxat7uMCjOQ9B2
	969MSI5T506IFOqmC7QCqrKUqBCZYwTcH78GSDPJ9CxPfyFM40G9fI4qayMxcjZSoare7hpLTpO
	sXNpBsg==
X-Google-Smtp-Source: AGHT+IHZUGUK6yTkOMly/UTCf5TfkRX+RuLMJ+zm0TaswuyyY5q5bbmG4zBXo05PBD4iH1y4pl+NdQ==
X-Received: by 2002:a05:600c:4752:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-44c93caeb6amr61901665e9.9.1748462410755;
        Wed, 28 May 2025 13:00:10 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbd61553sm53347665e9.0.2025.05.28.13.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:00:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 May 2025 21:59:56 +0200
Subject: [PATCH 2/8] ASoC: fsl: Constify reg_default array
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-asoc-const-unused-v1-2-19a5d07b9d5c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=CpYH823lP1gANgxKRTCYkC1iXZwcMTKwp/L88jc6Xws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoN2s+XsqS9sFfoi0z9c+1UBE4EIIisHahFoDdV
 IQAKD8fYDSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDdrPgAKCRDBN2bmhouD
 14HkEACFdeeKCanwIs9cv17+UMezTLZWq0x8/jrTebWUBqQqWOfNZFxDU6WjQcbXZ7dXF5S8wQ4
 7bLJBjpg/DGuUc+eS4RBF2PEZ6NX2WBqzoXpwQqGh5IU8mjJoaqnNFYzOQandX1OW//JzbLGrGO
 YFprEji4Oid03TG7/AgU/DvnN4+g+/8BtNMeq1G+VklfGrQKT49hUMNnST2geP66RYQwpi77ogY
 2s+J3a1eRLYcA04uRF54ZJyA2FLE6SMIm6kwzLmwGliMUbqO6w3bRbbwMTdizD3zn3aBPEEZtpG
 ++ayreX9g0cV5IzOIFqbVfycaLLHom3iO7dy3K4L8Pqz4Ozx5YGewOHbcb3G0kllU6sxYLgfkDX
 tXro/sl120J1X55bh9T2FwBWVNQuFhi6V8REO7tRcZj/cYwyfXrq3tbAWfH+/iUTKX7dFXCWIk4
 BafMN7HfrnzbHhhm0m4SrH57UsvnoLA9ZZhao+zwe5EerO0Wb0TKL7tgV3g1I/VdWKCRyHn9wM9
 jUvYBzaZqnoxLhtU0JcSwfNjwz5TKbJo0TnrJq35lqZOw+zKvpHlx7hqUiSyr088rslYMHZJXp6
 2RAFQfgHUZhqSe2i8GfEeRoanO/1RWmQOD3NOHWI1RbMqJObKGTgBWW3+LYWY5ssXczSr3oHcfu
 3MvwM/3z7gf87DQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Static 'struct reg_default' array is not modified so can be changed to
const for more safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/fsl/fsl_asrc.c | 2 +-
 sound/soc/fsl/fsl_sai.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 677529916dc0e53a15952c53016930203c56dc9d..637260f306ecab109ed23b92a882cffce1c65421 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -930,7 +930,7 @@ static bool fsl_asrc_writeable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct reg_default fsl_asrc_reg[] = {
+static const struct reg_default fsl_asrc_reg[] = {
 	{ REG_ASRCTR, 0x0000 }, { REG_ASRIER, 0x0000 },
 	{ REG_ASRCNCR, 0x0000 }, { REG_ASRCFG, 0x0000 },
 	{ REG_ASRCSR, 0x0000 }, { REG_ASRCDR1, 0x0000 },
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index af1a168d35e379e24ce46715ba53b4a4dac65988..c84e3bb1290fd1188118b220adeb4f8e279a3372 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1059,7 +1059,7 @@ static const struct snd_soc_component_driver fsl_component = {
 	.legacy_dai_naming	= 1,
 };
 
-static struct reg_default fsl_sai_reg_defaults_ofs0[] = {
+static const struct reg_default fsl_sai_reg_defaults_ofs0[] = {
 	{FSL_SAI_TCR1(0), 0},
 	{FSL_SAI_TCR2(0), 0},
 	{FSL_SAI_TCR3(0), 0},
@@ -1082,7 +1082,7 @@ static struct reg_default fsl_sai_reg_defaults_ofs0[] = {
 	{FSL_SAI_RMR, 0},
 };
 
-static struct reg_default fsl_sai_reg_defaults_ofs8[] = {
+static const struct reg_default fsl_sai_reg_defaults_ofs8[] = {
 	{FSL_SAI_TCR1(8), 0},
 	{FSL_SAI_TCR2(8), 0},
 	{FSL_SAI_TCR3(8), 0},

-- 
2.45.2

