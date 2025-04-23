Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DE526B2C3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393444; cv=none; b=XGl8SUrQDV8uxiNyjC9eEMRR91eZ+GYd8NJTePkH2OGb4RsJczvQ6SgnxA2GuC8AQR2GVsyKBX09J4IZ70vpESLmZNQZlHrC/cd2rrf5iL5xzssoZJiul0U6UvL+RPKTSTbZh9zrcK20DTPybH/bxFd4lUDm1GUpx+301gPW4ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393444; c=relaxed/simple;
	bh=OGFPRiVeOp2qKkd93z5kF2aUIB4+PjN1a56OlgE6zuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VT2N2KP1u38xrN60W5IYf5o+7WuyuaO1eii2WIX9Xx3cHZnJR0H+6FWgvUDJ32pdYivwP+KwcgecFFXRA+iOYV5q0GjwyC2novWD2bn42PJlHw98KEQSiRfRP5c9Vh08yvPI655R2iLzhhKtuntX5yO5jZ5PQH5cAESuR73/Xds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZw4WBUz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZw4WBUz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so48227305e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393439; x=1745998239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AEPeEqZil/T5Z7MPC/u/BIquWlke76+jXR6HQnUCPNY=;
        b=yZw4WBUzTiFbv80E63+PH0vaCUOlWrxq8YSh3afFu4DoGPO7w7bKkctbbT5R0hgjkN
         2TClTnTUi7RUh+VwMLvcM4IJCKBzrGYkPockbct2k2xQvQz0Pi4SGxLU+ohxrxPSoWYv
         JllzwaoQnoeCUIQcbpOey2M/qN2vae6jbi20fhpsm13yL4DUwdGjpt7qKHApv2fTWgA3
         FQSvhquFZXIWhdZ6iMtUU/mxeXGeZdm7SQHpcv61jqHvc17NizLdWaIEU93aRcGG1cQG
         G60vAVKfy/3gZFvyiQh1Q6eQjZ2QWBH5oyrVCQ9NIvisztJ/iwLCMjFSk+p1SMR9JY14
         t11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393439; x=1745998239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEPeEqZil/T5Z7MPC/u/BIquWlke76+jXR6HQnUCPNY=;
        b=nWYZy+/USVUeHxumkbh6LFyQUqUSungcOBJhsCJuAIn7E/+f5KigB5fDXlsY+7l863
         nwILkwHMQlgSm6YJsWIzkhWRNJ1eX02uWwq3DknyY2tH8CJ8A3kYCgQiI9ITEPFegeMN
         SE/xrW9KNakdo7f5TTe6jk+y18eetI5rCxwvK4HGYGhJwaYDK5h8aL5Xjs+ZJ57TiplO
         n05n2WnvDcPLVhNIctDhXrRAceWwxiL+OhGNcB4daKeG85LjdozOlJx7qnGWR6rBf3uz
         n/NXdhMq7MZNavtJ4Z8K4bdkPpJPR7m+WtwuKGDC9nIWsgKWGC2GZFEKlS0grHmd9W6V
         IRZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSGKpKxYh5qgL0rT6zU3FEIzAXrEf0tgLCoAaqcO9jgcDLLNMQwaAvxKEs9o2h1KcN/7rW2NTA0BiDR5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLwOcdfYOAI6dOTJSU5mbQy3r4DCLTeh71FhXLaeGPm3dec0u
	slKGhl3OHBiSg4R0NVV2Gf8QlGsphTr9XH/E4UWqc74UHA2iAW9L1QXFFdeRurA=
X-Gm-Gg: ASbGncs/vGfztKO0PIq+Sva9adweD0H7c2dqz50bpL0xjGS++u9OjYtWzYtyitWY3fb
	7W+1292qXOABF6C3JKjCdJsK7DtOh4QD5bMM4rRy7GwcPpc9ySjsu2V1PRWnShxgAxefHYga0cN
	fdfE87AiiJDnHkEEdq7hL76Om314LGJnyG1uaotW/VCGzKbMdAelfNKEGxFVcgd82CJ8XTMbeid
	/wcqHQJfmRlLGLM10BPmU+YYAJCGcCzYn8yV4zlt9P6ksqmVy/FULZX4Pmv/SOQojFpRniwSHU+
	pejFo4jcYqpyJCpxYuZIILzaMdTJcg6notJBnRJih0QL3ezZ5MzrIOU=
X-Google-Smtp-Source: AGHT+IG8wc8v/scENBbWgZ3YLGA2Q8Ik+3Q6D9mj1DGO337fBhfOQlX35NB9ynMbOYJsc9Ex9XTJbQ==
X-Received: by 2002:a05:6000:1448:b0:391:2db0:2961 with SMTP id ffacd0b85a97d-39efbace3d7mr15158756f8f.38.1745393439032;
        Wed, 23 Apr 2025 00:30:39 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:38 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:09 +0200
Subject: [PATCH 3/6] arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix
 vreg_l2j_1p2 voltage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-3-24b6a2043025@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is configured with 1256000
uV instead of the 1200000 uV we have currently in the device tree. Use the
same for consistency and correctness.

Cc: stable@vger.kernel.org
Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index fb9567817be6f887c9214cafbfbabda8b8cb8203..c94ddba5fbf1cb8ab2bf841cf51ac3553e1f95cb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -351,8 +351,8 @@ vreg_l1j_0p8: ldo1 {
 
 		vreg_l2j_1p2: ldo2 {
 			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

-- 
2.47.2

