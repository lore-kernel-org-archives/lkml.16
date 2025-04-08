Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC63267F51
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104773; cv=none; b=q36hHfvHcoPGjxMysRpqNr+JWGw9S9VfQ4/IRo24sg4TbAewLZ2aytC2EqSmYalATJDpp201NEitufOXtO+o2rMjgyFQKF00bbo8rhGKHGdiscePDoKHuN/rYjmVp7ldvYqEgZOlLJJMX3eA/Z5l1y87J2BpPiGVjn17yc1IDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104773; c=relaxed/simple;
	bh=wrALnxrPHUXPgAdAIi61FIS6cjVsAHrdY0OAJGvKs+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PoeTCEYjXmrLqrUa+J8oXiS1+zZLf3BslmXTDkUaiZJxtnoOR1q3f0CEvxwgkAO25IyZdjLDuVtJvd8PeaAx3RxEbkKme7HQRlWsIzDUlMoD3cMvqFnitp5hjrepIXBHzVp5nVgry0TjlQZiF5OrKowkZYog/C0bo//LQW8TQl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkuSyAWA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkuSyAWA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so3754555e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104769; x=1744709569; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxO5+JoEiCzlmQhedz8IDum/Hr0w5nRBROvtuW53UYU=;
        b=NkuSyAWAE6nSagkDHFe9zvRzaLKawRqKlC/GqulydQgP/wz2y0C/zWrmGGE+slcvdB
         Laf5U89U8zPc867ketdjoDZwcL6TdL2IiNCHst3IZcfpsDRtRGcXDdTrvoJbK/J4c27E
         9jzR9LjOjkVFQoDF56hbo7/QmNd0GdqnBwWiWiqrz5C89fPVS+fDF1mwDlT3YKzrnrCw
         ZcCOvNfFjvtgyP6qX0NYrUeAJKgz7Dc5ZyizV8m5iuRDRxkTCqv5sPVMv1f1xh7x3k1z
         e2b70tOEOFhu2MRUsP0ZWdhxMQPzr4o+xLOsudPtCnQuY7/C8HcS+rU8GiTTmwiZdkap
         1wTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104769; x=1744709569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxO5+JoEiCzlmQhedz8IDum/Hr0w5nRBROvtuW53UYU=;
        b=t0nNqWsBV629bV0VzHbyGSM0irKPWbILafQmf4Bf1KMq3sos1tUbZ/7PeUjOIMKCKI
         GmuU1GYIDmkFjV+n4TJF8pDgfePhgvvd5HvTRz4jFtuDUoh3rl1NtUedwBBDE0wWr7XK
         pA58bRRzPBlhfkBrT9kTnuYU8Kv1Y4V4wirxFhy5uGLZNni6Kn0AqzMYTlYiKiW9wxUu
         CfVKNlNLE8JBM9UPZGiaCTSz+HdlP4ol8Tsxq3xATAdQs6LZvFV4ki4+FxfVC9jaAqtD
         NSjosd0Z5YxcHcX2mVEP7nn5W/L11kv+kwIT+DQIROTJEyIqO3/mPvkmTFV2ikKZenVG
         t29g==
X-Forwarded-Encrypted: i=1; AJvYcCWWKMNX5r5WqCyx6adkDS8zPZVUZ82vtWUoCIvKAu+lpgKFrJuNhF4+ZFko5rZvNkjHVDeixOL0GMFviMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSF9m2HILY5JfmXjiOgBoWbJd4l3pR4Q6HQyWy+B0GOIcZARwy
	qUv3f/f/S+oq/EvKiKPwuuDouwbQmzJkBgrgqn8nXqidpQuEmJfGIh4xG76syB0=
X-Gm-Gg: ASbGnctXY6bOtY5SxeK1myiMsjdoFQGBZAzj6wdbQwbhjWTE0JdMOCBIaVT861k0hcZ
	YqiQwJvH8XHBzvWKNH9lsF4XOjwQbDn/LoVg0KLUqDrwPSBBfJvVMUAwW11sBCVu0S47PknqKGs
	0nmI9UaR6gmh4IddCF+9xjjknqJvA+QWvdM+vP0JfB5t3yJjBeQFttuOk9krmHfUThb4Grk0Fgt
	8uuWJYWvHAwmkAZWurQCFX0Wep1iEpAyR/M/oTgrZnhQocN4rrLx3PeePDRweW0ibaVpQjp1CMN
	EYss7LbSOpBtqesMXGeLrVjyNZx4eZmWxk/E9qTjo6SShm5LUZ0mh9esXEnFDTLfSZCGKmvioQ=
	=
X-Google-Smtp-Source: AGHT+IEhqJRPG6jiXOM4M7EtymJybaJJaVAr0n8j1sg1vCzP02cienEQR993Mp8jqHgEpk251RiiMw==
X-Received: by 2002:a05:600c:8488:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-43ecfa05efcmr52827275e9.7.1744104769614;
        Tue, 08 Apr 2025 02:32:49 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:09 +0200
Subject: [PATCH v2 12/24] arm64: dts: qcom: sc8180x: Use the header with
 DSI phy clock IDs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-12-73b482a6dd02@linaro.org>
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1514;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wrALnxrPHUXPgAdAIi61FIS6cjVsAHrdY0OAJGvKs+M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0gCno9j3rBs6lVgvbMvXZl47cJ3JVVya8fm
 N+o1EoSU82JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtIAAKCRDBN2bmhouD
 17O4EACYJ6gNVD+8NUzbFnv+DaCuI3AxBbsSAaFusRUDf1sgrf+vZ6XV/7Ai/XMf7h6+y+0ax1m
 EaNuN7ijLoeQVPkWietQeBLL45UQKwZnjcd7qH5Gha3IjaDrTXuui/mkMWSUisKz9eqQDhwsKiT
 eAopAH18+Z9O3FKlIbN5zhgt/+zl4I8yLKontztD5QYhzPmROvsimJdkQSgdnKEi7r5gDuVA3Y0
 P8KifghGDBNNeOjIuW3SM+k2Qe9/ZhylcBILt56otfZMrY5TBgRh6OeaO988k7tqs6vO/Db+z2s
 J7KKPRbFB8hIbuE0R4j9AfDzCJWoEBnzrlp/WDzpwGnnTnl0F6IDWZloR1WbC4DzooFvr6QHnrV
 cbQaLtkuDI6AcvQuCPLOgJMd6mbWMWDAYRC+SlE3I2XD1OHYMLC3Kk9hmN/f2W1w4x2PsMRXjBF
 Zm43Oi4vGImC+fHhZqNJFQuNjP0AUteDatirsBGpMTBWMOZJVXKaiQam1Z46I+/uKdwmyKy4S24
 L62e9ZvaOCKsO+6bY7ZNw5lZsIjdqECuPNXS3fnP1Ce7b4P5GgA/dXroTxm542Zm2/HE222pa24
 VrtbRfqDh6HRyDQ3GZT+9y10aYO1swiISvy8cEMl/JiqmKlBPgF2TbDsPPtMj3p2vF5tKh4+Dup
 wgIiGe2WIPKN0mw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index f142eb63b8d7f443a8df2334cf3c205353762893..30b8a666561d7b56009db988fb70bbac402a934f 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sc8180x.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
@@ -3465,10 +3466,10 @@ dispcc: clock-controller@af00000 {
 			compatible = "qcom,sc8180x-dispcc";
 			reg = <0 0x0af00000 0 0x20000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_prim_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_prim_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <&edp_phy 0>,

-- 
2.45.2

