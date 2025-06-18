Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E812ECE89
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257204; cv=none; b=VpBde33+5KlCMSeT9m/qtCnIV9L1u2ebVVITkjdSC0ISoKgTxOdE9SZ0l4qeqsQbjzImPb9I7b74kQIggBQ6MYINcCCqLvf7F6iQAN7+stm9qzic2VvheE/YBrP2yzWTVMa4HqRXET3CQcEKQhJ2c8VaubtIFZzUX/EGFdSQUhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257204; c=relaxed/simple;
	bh=zXT5KqsXrSGK/lPM3MXSFlSxuq5G3CuX3u2b43D0aEw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iomx1uabY61Rvhc+NdGfoeMuS/IIHr4KhbI3CbJhW1R+DlPTvHgJC6YRnaVY3uvamAyybT2ZjhBwU62X3+86AmMmGG2f5T2YyhZV3Zebb8ugP0oLJt3c5fTxocSDmLAjAYeXu0t92r3uH+94njIqI04JCudeb7RIWI2aOJJVGo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vzl5eHu8; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vzl5eHu8"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6071ac68636so1388442a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750257201; x=1750862001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
        b=Vzl5eHu8KxEPQ9BkAor4tel+Q8at+Q75KmbIKzzUdgMpbIArWSG4oJjgG21VxE4mUq
         izm7hZuCTeZfzyj+dk1inrgFdG64+p60udY+ButA3hcgqqQZu6Ny6hMY/G8ylwlX3Ox4
         oX+TrFUnPygvKB/ivZLMiYhhcwRlzD+kdeARmlRqVK/LPXyTjI5C8FC/H3+qCRNrqkJ8
         QqoaEI4G/fnAjDXZKdO0CO0D5K9bKsv2OFu8Tmk+kJVjT2YStGpUNHCQY9+jlanHcQ1V
         8MCrVSw0d+btP1p3uz/oZLPPFuxTkY47tH+yrlfwnXFnYvl+z7IYedAE7tPw0B1JuQYQ
         Y4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750257201; x=1750862001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzIry+niRGay8PThnz32i8jV1sSA67calFaeSw/btE8=;
        b=FqlRHPVrjyV6Ein8FETDUV4il/29LGxn2y2CG43w/Ju+L6x9cF8k4xwBSBwbHpaaHb
         fjpDUv83WWEPV3GX93DOwJWQzbpWYaHZLYXyvuFjiCw+WLD46igRsPer4HkzIea1zlIy
         /12/U05KsU8/tzPp+WCHkIwq6sfUzbzcCY7SOWMvndPrJxiQdi+qHSqxzVm0W2gf0MtU
         N7aIkBy3D8lheBfux3YIki0QL8+JzrEbk14nan8SJQE/k/FSIdzEFuuIh+1DDBqPdpm7
         zUf5OaiUYYcP6554r6nqWEVSr6yHzwQ507m2jfYhYUci6hzcEXlZd+eWtB1+qJZ4wH0Z
         I4wA==
X-Forwarded-Encrypted: i=1; AJvYcCXUgB+8YpvgrKMplpo7Q2PNokaraiqpriuym7NrfSswQYaZ6AqYxAqFM4ky8yXMZrsYkcyQv4IF2BRPnzI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3AOcwvmYsF6UMhIkSvlmy1kFuj55GdhmyxIOuhQ0dH/wIze6a
	X7bb54Hg/xGGCBKgAexsgzd/DmQDmtzZwyZfB7oKqeuqfIY8EOnQqYJOlGXNdopk/Xk=
X-Gm-Gg: ASbGncs351QfzjD/pdV5ykdkR0XT5QRV/BN4+IztrtdefUliKFL47uJoWb/lFpczueo
	HQEfOv1GCZ8/ju6UqcbLw/IBEg+Co4V9WH2BL8Wcct5oZEK0ChOZ652MqIFr65V5GVjaGWgYU7y
	XzUykmxKR5VZ5UjJwyX9Cp7NV+I8VvmFSDBGfvvNmykqhjYqTXh9Bk5HF1gOSVLREWkki7Th39X
	2kksdtapMNRuGalZwAwzizjKPLwY3GnDesC/c4EAeACC07Vszj2DhdM8rndHpPh4uUdfpfz/D6v
	l68k0Nyv7TxGybpR9f0ojKYayW4KRnvF5/SAMpob8rpYdVqbmw3J3c34OA//sYnejLYzDarda1z
	TMpFgqmw=
X-Google-Smtp-Source: AGHT+IEMdibLkq69DiCOr764wdvjGhak8IP7M8v8RIPciwuAqhI53vGm8g+t4Rk139lqpyLxospJzg==
X-Received: by 2002:a17:907:c13:b0:ad8:8f5a:9d2b with SMTP id a640c23a62f3a-adfad54ab70mr571953666b.16.1750257201215;
        Wed, 18 Jun 2025 07:33:21 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0135sm1052257566b.47.2025.06.18.07.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 07:33:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 18 Jun 2025 16:32:32 +0200
Subject: [PATCH v7 03/13] dt-bindings: display/msm: dp-controller: Add
 SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-b4-sm8750-display-v7-3-a591c609743d@linaro.org>
References: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
In-Reply-To: <20250618-b4-sm8750-display-v7-0-a591c609743d@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1260;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zXT5KqsXrSGK/lPM3MXSFlSxuq5G3CuX3u2b43D0aEw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoUs4cKUra6D0/CzNaFqDGtiSf8+8T3tvUgBKFo
 C54hMLEb0qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFLOHAAKCRDBN2bmhouD
 13w2D/9cTJQhudDOWWXktRvkWBy6yv7PGTW9mKIsGxUEKcM9Ypbau9REp0I0qwaYXe+VIwV2g+u
 dXyPakTw2Vcqix3mc/2uQvntRTteTP15BfxlPZLBHSNPRgltijN+BF/3f0glhJuEevikMJaKbfA
 Qa5ph5CSbw07WqYLM0Jsm7+M8aoQx4z7fHjYMHyIuDpN/8N3ltcmW0j2cQJGTp9LrQ5J3hN4rpY
 uOzazHduSMi+6As5syM78sO1q47rd7IrIzyERDUMOQmnDPmuNrMjFG8XaHaGNCvwevTrUGNTYdT
 wu24qkYPGeJpC7glZBB0hVlsZItPVrIlNqMCEMfkg04clzcK8XjjxbBolOjRs1J6yIo0w24QK46
 SBfp9HCRFSZBF2bZYywdQjTPg6O4lsv80HWm4QGGeqDqS1njiYVvb7ICOpOJRaryrYcdTlRJutD
 E1KGzzG5VHinLzjALnMWQAv/eBPsrW93ku/n+Zl8EO/otDlBat7LQK14MHkuM+Lfr0TCRjyo4nf
 G/Zj0NBifUwMrFFBjEtkBAKaA8Y3JBHO3DYTGFi7XE4byPRasA9h4lvZR6kBpZBiMf8KrkbDnBf
 RifKT+s1NPPFVz+13otGmBO9LQUIvlcioTDjqDEPlWPIjck65TsoIcnhr/ERj3h4GYjqyYNeU6B
 3gt7dLujgpQCK2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
fully compatible with earlier SM8650 variant - both are of version
v1.5.1 of the IP block.  Datasheet also mentions that both support 4x
MST for DPTX0 and 2x MST for DPTX1.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v3:
1. Extend commit msg
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 246bbb509bea18bed32e3a442d0926a24498c960..9923b065323bbab99de5079b674a0317f3074373 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -38,6 +38,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8750-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.45.2

