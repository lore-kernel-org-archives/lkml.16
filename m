Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA01F2EBDD5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074867; cv=none; b=GL5D1DkiAeq/NyA8amcGejagnbVry/uoUYWO/3Qqgh94+xdZN6FOZHXc+c7+smE+QPFrChirXCopP6YuFsXMD53j1O9l91sBRhaTfCHEcFeQh/uFf0lUhhpnm4JYfVo/zuHU79DqcQDjcGRs/Re8tMCBrs+PsiC1oM3ZKUWQK5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074867; c=relaxed/simple;
	bh=ddclz8Y4tyEeomH+WWsEabbA3+O6bU2+U3UDS2VzqMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IvLNBaDRh+hviWnTuKroBGvVujL9ksvGXsyubUbfnxzqsmoloPBcVkqjF8AcWq48R3WhP6BWLPp9nbABI4EXGEO6i37GprqQrbaIVHgugdkAxngv/QajdwX4D9D3DUWSmnG7oHpG85MqtvLYSYTKAuzyLj3mOUdPfZjPrReQq4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUzBoQTd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUzBoQTd"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e62619afso361886f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750074864; x=1750679664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fktTiKLJcxcAabt7Z2x0w+wHenPcFx1mmVYaf7lNKSs=;
        b=EUzBoQTdIIPbdL1WA9EYfhppuxlQE0ALYUZgPyvyZOo4FCmckrnqgAtEGyXoGqd8ZI
         7x+YmMNDPD3jVakDpT4w/4Q8paPLVzsjn5RPhR4tiPiOcjxLI69BwzJ+pVYsOV/0bctO
         BmYMyWYfW4OCMY0LUaCakfTqjARLB+Ri2qnzIMlK5VCAsaUcaIYOaKGgR4wA4+VBEtqI
         CgHJQj6j6Y4mieU6M34hPLGxc8ImEy5b4w6W5cY4JI9Mt2SrY45yCqoBgAFBqlId+hBe
         pC1o9N159migCiGK60NMq36kUOvYRHLiYA+a+v7wxM+5/qYfXUelRt1el/IHzXMVKYVc
         PSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750074864; x=1750679664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fktTiKLJcxcAabt7Z2x0w+wHenPcFx1mmVYaf7lNKSs=;
        b=Fto4V8Q968zpD1jMd39e+VdvwLYDXLImDYIkf0sRN1pcca4eo/Khh8lrfCm5O3OkFC
         uGskncU8xEdu48NPhuvbxnknQcQZqFi9r58cVH7FMmxhELvvjvrUUfxaxnzvGgMGXMjb
         jzSe2N5L5ozqxyqst1rmIA03oGZgWwvRe8d4d3Na/+2o0hMBy1fKVMJgkwOLi2r8+hpm
         NTVoKy5w6UrcAxfDJvW2f+h+KQDyor4POZCOGEb92YspQcOG4TeQPUJLE81tXrvv/kE8
         fBY464b2BTMR1D9sO5/GNU1KfALzL6SdNJ6WnUjp7fm3DM7TaxeKWdmgXLN2NcjJzl1W
         4MTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsURsuXbNOZX9+bmlRZEsGJLYliiEGRwWtiGLVp9bOsbkUfr5ZM4jTT4cKNjvUHad8NbEooRoWeWqhhtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZbLHADq6vECy/U80tuzjV280/QOGCGYBiniPwUUI1up/XBI9q
	j4JvFLr7Jexgwj+1kKQYiHdA8QxvXltMXSsZbm5QEGNfyaxoRmV13z/l0hi/wY5NxSVCH8ZpQga
	BBrU9xilxlg==
X-Gm-Gg: ASbGncvgFP9nFVt4d5latCPGZQT0hqWKyf7yIUxcjrwFHk0U4vPlaok3965825aAfXf
	qejI//lZY+XVhqwsNkqkCSYPUG2Udm+tHyAdbwcsxXQlL7QF1EqsXZZUBKYmZ9kUAXuSj/SSkar
	ncA3/kqXLmVkOU43C51m7zax4t+eGLMJM6FggOJMxWrqK0VlqGYNMGcuIjej34JtObUoX8TkDs3
	vCtakD4VEcVtV1NA56KfGmGRtD33rzPGowHCE8Y5ZWaz5Psq3oK7o6Cvont7pqOBkekUGKoDXQO
	n19DprBiHCD3icyr9xNzBCuJW2qj0+QkugP1cLzpeRzc5Jn1rFHrdJ7Q1NRiQzDynuJ16AU/kHQ
	UWeXWo9Q=
X-Google-Smtp-Source: AGHT+IFu5UZoYZbMgPHu5hESmLw4B9k4Utb2s+bTUbe+a2wXFn7qit0ncmJKeYKcClMQRSCfizYTsA==
X-Received: by 2002:a05:6000:2207:b0:3a4:def8:1465 with SMTP id ffacd0b85a97d-3a5723ab6d3mr2358052f8f.9.1750074863756;
        Mon, 16 Jun 2025 04:54:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4534172d2b0sm73485315e9.35.2025.06.16.04.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:54:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 16 Jun 2025 13:54:11 +0200
Subject: [PATCH 4/4] ASoC: codecs: wcd939x: Add defines for major/minor
 version decoding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-asoc-wcd93xx-enum-v1-4-a20a1b538509@linaro.org>
References: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
In-Reply-To: <20250616-asoc-wcd93xx-enum-v1-0-a20a1b538509@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ddclz8Y4tyEeomH+WWsEabbA3+O6bU2+U3UDS2VzqMw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUAXnVMtL7cm+NvV9zHJndqRa6XP/wwXYcWL4j
 CsswTFi+jOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFAF5wAKCRDBN2bmhouD
 1xQzD/9y1KbbWGk0FP235eMwYiaIgIv18PnU+8oI3TVbRkklt1utnwXfX8YgoKICdzJVtz+OmeA
 XX5oy22ITZobBBcE4A+FZ2a9L4L6IbyOQD09yCYB4zi3Qvg8qNNEkz/IqT9uA8Yh5rC+21sTBuq
 qPnRIvQXJZf5maGTk9Hw/tfBFHR/8SUYKGDawam6d4QNhoD8pVjP7tFKIN99vk/Qj9TvTEi2bag
 GzgDjVgXqrJphEkpG5PxOLk2+rzNfiQZnQ+ZOzJj864v2OO+QVv8Q0zNtPdA2iSC8J6hTicKJtj
 Mi0vhYIDvnpifIiXD7xa+5xH2bwCzbzh+QoNttcTA+lSVMN9EEQfliw99PrWd6axmMRDZkAm4NQ
 592KLRFI5DKrYk9J3Aef0WJFq+qOBuehcTY149VcQSnOAW5oLCCdnDyqpNG20yPIer65uP6kVmd
 ZB9p4lhx6CGkejVknx91rgUeZEV/tQ66mV7TnBZOvn+D3QVkYiq/SA4W9icvkOU37+P2fJ1UhjT
 ViN85yXoJmh3D2RnHA218ZrKepNsiHBlDPg6RZ8RuSkgGMkECDJb4O5DYZkW5SXcPfehLzDGfmK
 BZYa8C1ZzGPdLISCTxs8cuvD9911eWlH/JTUGdUUdLzGPus1vpXtLEV8xOp1ym4kWc+5tHEuy03
 gJStJwISFvzikPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace hard-coded register values with defines for checking major and
minor versions of device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 7ec751a6cd2610dd3c4eb2bb6556e8700b62427c..64f082e474c1d404699e304743ed1ada3481effb 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -39,6 +39,11 @@
 #define CHIPID_WCD9390			0x0
 #define CHIPID_WCD9395			0x5
 
+/* Version major: 1.x */
+#define CHIPID_WCD939X_VER_MAJOR_1	0x0
+/* Version minor: x.1 */
+#define CHIPID_WCD939X_VER_MINOR_1	0x3
+
 enum {
 	WCD939X_VERSION_1_0 = 0,
 	WCD939X_VERSION_1_1,
@@ -3449,8 +3454,8 @@ static int wcd939x_bind(struct device *dev)
 	regmap_read(wcd939x->regmap, WCD939X_DIGITAL_CHIP_ID1, &id1);
 	regmap_read(wcd939x->regmap, WCD939X_EAR_STATUS_REG_1, &status1);
 
-	if (id1 == 0)
-		version = ((status1 & 0x3) ? WCD939X_VERSION_1_1 : WCD939X_VERSION_1_0);
+	if (id1 == CHIPID_WCD939X_VER_MAJOR_1)
+		version = ((status1 & CHIPID_WCD939X_VER_MINOR_1) ? WCD939X_VERSION_1_1 : WCD939X_VERSION_1_0);
 	else
 		version = WCD939X_VERSION_2_0;
 

-- 
2.45.2

