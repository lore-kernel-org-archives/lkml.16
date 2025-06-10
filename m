Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A6A29B789
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749564375; cv=none; b=R0BwOxHQUHmwh59f58da6IDFkAWa0xNPpWoDWPuJpraRior8myzv8l34ryDe7aZ+QyLhu29ZkJy9d9gDchSIlObZGPtgY8RXEn027zc3kTKmmQ6D1QG7oFYOGSqoDG81IaTNAO50g6KgsRFMGLmj/Uuq8/XH8nU5ivYhkM+9JKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749564375; c=relaxed/simple;
	bh=6p3gmVNgeWpM5P5NgnZSHUvO6bicpNKcBnOP1+C75sg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LK7V1IxAvUbuYB4fCoC7nHUoPSlE6xhrSqSajxRSm6yMgRAO7t+hhQDKMygBc3ggZPZQ0Pzm1u/H9MUuEGdeQOJWTJ8mdvgiIa4TCW0NJd/Dvj6oRdsK2VCHYFbO3aoCu+yH8a1dh5i3XGeSzoqnFX90Fgieaj/rAh+q6EcO75w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=phRFrQBr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="phRFrQBr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso720737f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749564372; x=1750169172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
        b=phRFrQBrljrcRCzfuzcSLVY8F1cEMQM0goN6M0zSxW66J6znJU6Q9pZLGeAiqVwaIn
         az293bo4P7Dk+saEKLx0Wyi9vjaeVwbuAP9ZFU/YpV0lMYn4UNww00h0kDC+h9GDJEC8
         fQylDdg8BwZpzdKTI+FAt7wB0VWnxnlS0S3vQhI2MQgxuGPLsOImfPJzAKhFseG0ctf4
         7fGU0Q//YtXIzFap3d+uSZrrmQNF3g6LqQ0FT+BWwS0PLNz7rrfeRQFtv16jFveWhCtI
         S2brltkB+K3b72TobMlfZpE+r7LBkpo4RNTsd7rZ1eZ+ajyCekbA2AUqsX5k0/63KUMz
         QwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749564372; x=1750169172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4X7DaN4+Map/kL0OnjyI+6NxQr2TtGJmMy/gmAt3s4=;
        b=SUCCzyMbARNDw86GQ5y6jFnPVe6z0DnNosOO1x2YzoTAiJrTCXjyOMaOdiYEHOP1vf
         yhae94HaWns+wHn6EIX0jRTqCHCDWIRI6yDE89LEVpcW4MwJz/hRRo6jedW+0bjGFbCD
         vz3dVw1L36lmjCa+2TV44lrr3sa6sKVrJNcEqQB5Nf7m9RjDcKJftrTBt6hlgidLQIJm
         MPcEKe45qEFqfwSQCw8OuBWZHX9RswsXnkcjZ7oSssoBib6yLIPDm/WfkBVVJDvx38Nl
         XYCJO9mrLVb1vNH0Hks50tiYkQtQKNaMDH2Wd7hwzHODZr75gD73Z+NOQFUldwqx3jcp
         LsFA==
X-Forwarded-Encrypted: i=1; AJvYcCU6y8GS5z27mXGyW2kmxQYpcFXaEmruvfVruCnBRTaSGLtsC/cYhc8LtpMS9nX1EEskWgt9opMrFExD+pI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4NpNuOoZuUAnwRVgvXmNMzilH3A9GkzcpHPQNtGiteieQ+dGF
	Rv8QMkA36LDelBXgKAVc4xA9PX5DhMOvRGl80sf3dhiZXFMJikydabTxq2t/ljHiiGA=
X-Gm-Gg: ASbGncu5oOt/Xg+a0rgfJ5GAHRQ+MWpeKdf43F1kc7BkGRsswtje608I+NlmNa2ODn4
	m/P9HZI7Hm/ws9JqQ8lRDiyWZeFKSVPTjmWX0LEETPLkCw2mTNqTvlYlahNHAi2jWTzyrPHi2RT
	jNvJIl49itlCx6L2Hi/sN/1xfK+y7XU/QfP4t56UO18MrVk2JGW3eea2DNyl9/Jcgxp7njV1y4t
	I6xTn2uvs/ppqL20OkhDGqwcqHcCIbv2woJmNUsVYoasbw25pkpYJol69UVQG7mbypqjlirqml+
	+ihmMKHzldv9XW6JLs8ApHkhA+eFG4qeHcLFb8njE12Kn8iFtIiQxC4sOze5Fs4e/qBO1/DjyEp
	+tHaSJA==
X-Google-Smtp-Source: AGHT+IE1BPh9K0tsvS2irh9slIs2O8I2IOLea/2GWBdBPLJ7P+lih7SyOyAlCDTffkcTPSwFJR6kEQ==
X-Received: by 2002:a05:6000:4025:b0:3a4:eed9:755b with SMTP id ffacd0b85a97d-3a53315704amr4816797f8f.4.1749564371436;
        Tue, 10 Jun 2025 07:06:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 07:06:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:39 +0200
Subject: [PATCH v6 01/17] dt-bindings: display/msm: dsi-phy-7nm: Add SM8750
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-1-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
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
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6p3gmVNgeWpM5P5NgnZSHUvO6bicpNKcBnOP1+C75sg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDu/qPyxSZr5uQgETQ9z+HGRjh6JyUCMstBR5
 md4b/PmrcmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7vwAKCRDBN2bmhouD
 1w0PD/9GgT8PUxfu86n+kcyB03P7Gw4/ycsNaJmnr0wzsebLzXby5oB6UEvkB4/MCKHhdpfDL/a
 rCvIquz/8M7jMhEgVw2yLc0MWBwcsPSOi5z6iTGHLz43eN5J5517ETTrsG45jucq4LgZ928YkKR
 /VNFmPklDDRNd0KZhw471vuGhtJg9/O7GJunrg8CAyJ3igcEL8Xa1E8mG2y9RG2RRffqzyjgeCO
 fp8uDttlMY1wsSc5dmzQl1JyAyBKfVVkKnZOiRXyurhb7i4zK/skjmu8LxsX1nuYO81VWbU0b0l
 fA3C0eob3/kyHYnNqbhWIDjElj0TF7hCB4FR9bfD3FDCeFDCb2U4GcBGVULVfTV37uIV8kNLIhk
 5idnNT7l5NP8UICj6wMB2HSt/wrAMWjfLKYabTLOy3C0Fw6vsKzw6dBg11Qj5+ieoQfWodyUWgQ
 C6AV97Yil29ylhmXcRpw32CoSVhidWRKQ7uGB9Eg3ATYfAQq5ZXgxYqCE68NfIbeMd6rM1HK/LE
 DwUHSLE8r9CMzY/PwbNSo/AQp8gSoWo+bnDne2/YBayYMzpOTQ1t/uBMnVyY6Cy3ssEGcolks0Z
 y+tYb1Wb7L/25zKlBFGwYvb8QAP1/E3ahn3jtAl93W3Da8yDfwC7zmqAfJ+ImEz198M1TOMqs1Q
 COEegQZ5A86rK4A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add DSI PHY v7.0 for Qualcomm SM8750 SoC which is quite different from
previous (SM8650) generation.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 3c75ff42999a59183d5c6f9ad164023d6361ac07..1ca820a500b725233e161f53cbbbd59406326876 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -25,6 +25,7 @@ properties:
       - qcom,sm8450-dsi-phy-5nm
       - qcom,sm8550-dsi-phy-4nm
       - qcom,sm8650-dsi-phy-4nm
+      - qcom,sm8750-dsi-phy-3nm
 
   reg:
     items:

-- 
2.45.2

