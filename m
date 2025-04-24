Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6D5281356
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499890; cv=none; b=WYUmKTUh9sJoQbbqRaDfaVefpM/fx6xMUy4VETzc+5zzRd4sWPKLuAB+t4Omum3kUrBJSRomWBOmkdo3xTBCDF6TjInmHVNtmQgLJktXMlQwqjA18cCjbhcoIFQqAJ+tyhjTUAu8ZDwR7iFoWAJ59sjHrliqLDivHusbzTjkAMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499890; c=relaxed/simple;
	bh=Xo1D4WMW3u8AexLikJCqgRpBtmlISfqstOrN3jZwAJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMvlP3trmGgG4a5HWjqD/ubuj9Z/Q3weiw1EQGz59AHRYFkd5p1HztfqQ7tDZcXT0aSHxf3P1lT114SLrwsJpKd7JfJWgI4hEQHO//R8MBqLQyS1WCH2rsQD1aW9xaHyhvm3C39h7AwpZMthGHP3jKmT+N0Wdo9qGSAtaQAYNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SABBVXJP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SABBVXJP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac79fa6e1c2so14820666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745499887; x=1746104687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykdI3Gi+8HO4bIXRSEA0t0XdHfsbEsUCV4pjAqv7UHU=;
        b=SABBVXJPJhBw/cThxHU08t0Hk1iFK37/lNUWxMRjBx8TvBTJAJn6df/Ct3D7BSvwDE
         yA35MZnrGSI7nm10SKklofSoJNJE+L0QUfu5YO2tHFgE/mEROV51BqI51Usfky/ygZhg
         1OSh5dYFEBfnvJpVSKGLNIGj4zfZCdz4awJX69GU8OjInxO1u9tq3lqn4/zDZPF2Fk7E
         5mSXTQ1OJGBx38Q00LA6/GxntstSRc22SIJuhqxPZwy9YcVbgNXIVuNUA9hw9uVXG5S5
         95eFF5IVg8itG2JkVdW+g7/vL6xnygsXT8o10RBSeMdr8P3uv+uVIfLmhNGiFE7xfPTo
         gRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499887; x=1746104687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ykdI3Gi+8HO4bIXRSEA0t0XdHfsbEsUCV4pjAqv7UHU=;
        b=gtyb660fPSfqq7cbUPH7PgSyJMcy65GVv7I39tv7iCxnzf0BrPYP0jb5J2Xk7HI/p6
         N8FT1lMFlLPr7Ku4G/K3PhNIJwMuJ1Sft+2QTnFI/fJ7JZZ4JZ1Pr4cL6Mcc17QrUTX7
         oNc7fVl5nT6vSfVQSCfY7P0AQbIcouXWyH/xOudlvOpp9NxohQMz6nmRRRh/Kk63DgW1
         W6O4sM4YEhEgRorw6ToI0CXTQnaAjcLcHLD1ssW8E7/E0disLyrCEL8M23tsg9AdvQFg
         cB0hUfT8d00bIiKPn3R8+MA+SJ/T7rhMUXnJ8hHagfF6dVu3jTfc3imbPupZbLdFkd9t
         5N8w==
X-Forwarded-Encrypted: i=1; AJvYcCX/Zw2IaAgylQQuN+Wv/DQ31+bUtlT1100vlKBdKhjKMaPhNnAVZnEh7QhajxP7Xa7oE+o7UEtWPRZLH6s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/y1UCRe2W7PWIOalH48JM0JidkzpZSAYQKA5brTX4HM6ePgmR
	3uqYMIyp1VMXCM3FNmWrRuYXthDQgBJCpTjQOKmIhRzupCu1E+0v34Zn4gw+6wA=
X-Gm-Gg: ASbGncutdbYAv5SlYJ8nfQm5jLwGOrfira3ZZnpESTUg9ZtPaHBQwTa4vYBlWCA4sZy
	FqM5o47lR2SkSMsu9AMarRoJnEhx80MUuAHZfO2VOIpCKkvJNg1HAwl2amcXECpzYkXYfK+51An
	U9FU10R5a+OdcQTO27t4JOYyuLl3DEcqyCW8hAv/7Ux8UumPuGiW5ETV9bC6AiT7LET3jG2MNJw
	lImy28fr5duRG9HqOscOvWEN0eicd+t0SHiT0abTQBc9gBAnLGYFmdb2hSfyRmJXIK7eurOt5Vw
	29HBpvDBJdRPCGq5H8NjKZDBbDHYW95dID2s+6IhkKHsH5IxSqpIkXv+P6tBrSIPrJGizg==
X-Google-Smtp-Source: AGHT+IEnwMjmqYoeXiol5aRWjKTI8V0HKRWyVipeDqDx/054e4xCWp2ngxOEU1v1zHU6J2MgEsk2bQ==
X-Received: by 2002:a17:906:f5a9:b0:abf:6c88:df53 with SMTP id a640c23a62f3a-ace5725d41fmr89394966b.4.1745499887122;
        Thu, 24 Apr 2025 06:04:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59898006sm105101766b.46.2025.04.24.06.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:04:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 24 Apr 2025 15:04:28 +0200
Subject: [PATCH RFC/WIP 4/4] arm64: dts: qcom: sm8750-mtp: Enable
 DisplayPort over USB
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-sm8750-display-dts-v1-4-6fb22ca95f38@linaro.org>
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
In-Reply-To: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, 
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1381;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Xo1D4WMW3u8AexLikJCqgRpBtmlISfqstOrN3jZwAJE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCjbmi1xU3eE3c43nUPHItZE3DFChc9pXj2fks
 c47cykL5daJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAo25gAKCRDBN2bmhouD
 1zWmD/9p2QKcbcGrH0JBB350VSK8vdheJHkABSI9fKr9JwvDM3Zsnn2KB+levveiHs4D+5uYw/M
 XlVOH0A+lEWOLMsMYnZbh6c5gX8HZoOFmon81afG4/eOfRtaH1ObChIYGtiUnWH2PhCCAHCv/Jl
 ZaPCSJH+6urTjZyTru6y0rBG4u/fQvOnblFhz1kZYCgqIj1fZgb3bMaHmtmFb8O2UKZlNDrcCId
 sRVlTyAv3Fv1YEZIDr5fLMpTySP6fPdqOw6gpEeh4NRHnCg3d70x6aKpd5uSUiL1nfom5YvM43U
 +Xy17fVtby+pvDjEHEAhoJDYbmpBzyYATv/BkV2jC4FzqwQyJM4FB0vzsBukdIjdDtYAW310I9t
 axbIFbruG2VLPWKU4Z7/DGOhHMftTy0JPkmHSOfuZYKRDnVOTClc5ZI5OvnqeUjNbZZCtXMYgDx
 UY/XVlpz/inPG0+PzlS9pEP14MnKIn5r/2Htkvo8XEHx1r9flR7lYNTmiOAZbHaFSRHqemDrT8w
 NO0FFZ25xIyF3NbVLLEwR/JB7fljzIbj9rGyQJ8Rjyp9I/WdvaVf6KKa6NlZEn92J4Eu11mwF/i
 JvBM4nYvGLCZF14Ssf/2jtBzyo70ZoxB0nXbZAqMvktO1LMtCvPlMFVS/7babOtbkwonvgE8fce
 fRKg/LtTAdKmjvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hook up DisplayPort parts over Type-C USB on MTP8750.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index c3470e1daa6b7f31196645759be23fb168ce8eb7..69a54ac0f85d5ae20d005a09fbf8da7d769a9c2e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -910,6 +910,14 @@ &mdss {
 	status = "okay";
 };
 
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1>;
+};
+
 &mdss_dsi0 {
 	vdda-supply = <&vreg_l3g_1p2>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 753b069cab1de636a3b1108747f300bec0f33980..b20fc5b5bdfab598fc7b9be53eef96cc16bc5985 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2965,6 +2965,7 @@ port@1 {
 						reg = <1>;
 
 						mdss_dp0_out: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 						};
 					};
 				};
@@ -3064,6 +3065,7 @@ port@2 {
 					reg = <2>;
 
 					usb_dp_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&mdss_dp0_out>;
 					};
 				};
 			};

-- 
2.45.2

