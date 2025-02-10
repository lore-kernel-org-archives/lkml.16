Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5181C5496
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739179975; cv=none; b=XxBfUt3FNI6HI9dgA43cfmkoEXLL+Vngbme2+x4nBcojdHSG6J5puS2oehb5eNQNG4Y7uxNi2AC6OOnFav9VcV5TMU777/T5CkEFZXK1OMtevfIRnCCpNvZ4tYGCCsBhNL2ceXKx7P20GTwLdnAeeJm0iNYrOFPiKNQAPnS+p1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739179975; c=relaxed/simple;
	bh=0VhCEsAiA8uPe5Ksn8CTqXiIWWrYseP1TtWKONRb3So=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4b4ngBmAVG+xB9AkK2+w9KV6Ys29DRUp7yoRRJXjA0+kNZb//iGF5+FoiXZZExOuiScitT8SuquDvCB96zyVyVGW27tSIUJAtVD+XIiNrfFD5oNGUBn/lrCllbNTq28LR6bMGWONSXJ7wUZWb8tUYn3EhOBbFqvNsRMZn5PDiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eedfO0aX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eedfO0aX"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27484695e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739179971; x=1739784771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ivOjMNAu6T20TyvE3uQMGt0H1lW20ezA1AZm+/b+uno=;
        b=eedfO0aX34XFZ+HNtb46BoSWzESRwsNYKpMLo/BRlsOBIvB3cMy2nP9Qg4OQnQONTa
         WpGfyHraDuZ84Nfa+NX5AAEtemBbB/P77cjeth9WsDgfrS48KcsFOeI2vkvD98CAggpk
         RwKoLVIpuT1wbhMBeozFmZb2UzyrD0d8yVwwxfGnpLgye7nKD0Xnu3ILo1SWjH8PEh+0
         /ooLiy7oghih+p+4tcPKdV1oYPeZixz7siFMcPUXVhDuda5LOwBr1LviTlve85pvbZ6/
         0RWP4eBebIbhHfUfnUW4YaTOVhUFhK8D/eQHqPB67d4II5zRgD+ZkXJY7mCSLLxMm0Yz
         oiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739179971; x=1739784771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivOjMNAu6T20TyvE3uQMGt0H1lW20ezA1AZm+/b+uno=;
        b=m8gQ9WJqccI/VfHum+yclFsR4z7ys1r6env0COs1r/rLVdxwxMYyUVsWCgbYAadzDO
         4DJH/zpbmalwryxHkVYQbpcsZ13y4ln75EOzYFBfEqkniS4+7VmgbnHpSBoZjfrrjvCO
         o6UimmTnEfeaPcg9+sI3nKPvg+XKYLIwcCXtrc1+nzoidT5YPjJeMjhliOZDIIM8xzAs
         DBwcBAnAEr0zxx/AC66zS+Wcpw0RgPnbj28UOjyzZlzx/ifwusRyVgtu+aqpWyoqEygP
         f24DR4X6tt5u97OdBPU3sfysVs8fVxhKK/DD1LZiGG7MWktKnogbzwHdVK5LNxoGQoI5
         UOiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjWc7pd0Z4qEFnfigMwhUDmbMhrUee7NTr6/2/lerIv56bqSycn5Irw/7kOE7txF5MpyZIpBc8UUq02EY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSN1XPTN2vRqd39hyA9S1iYbXOm0JBSjvyPEa2YrJR6qbttp6
	5BRcRNLTBq2uQEDQu7qiP2TY9eAgbZWxOR2FGe/Q/+WFY0ZY4fb8+AGYzqYQvsk=
X-Gm-Gg: ASbGncsJ4vLQwhO1oZU51+wcGV+8vmWqseKAok0uEkHTyouLZXBtf+94LERc76rZV0X
	VsBcMCMUkGuWWy7p54rfgppQLQgLrP3PCptXBrgbykbioA6iVLfFunYht4ZQORuox/9qlz5whos
	541KYXGbkxhMVSfAjXfUf9viw5WqnSeFHIopODmrO/laFIxghssxx8H2Tc3lsQQIi7Jrxn9kU8T
	J6VPEOcksJpIXpCOBpJWrgQF+LWsDk0ozwbPnqiF0qBUsLbFy0U1M/0tEBXxNAWza2SwQhmXVq0
	Kz6oxrUBILI11P2/BBxP9RSMc/FqlwoPJHGC
X-Google-Smtp-Source: AGHT+IEXic0KGgdCNoDozQ+TrMOpmSNABTZomzw86A4Rq2MFbbxQTIHAqCCxV6B4m2nofvxVYz86XA==
X-Received: by 2002:a05:600c:a085:b0:439:4858:3c77 with SMTP id 5b1f17b1804b1-43948583e32mr10166515e9.19.1739179971334;
        Mon, 10 Feb 2025 01:32:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da964e2sm141340895e9.4.2025.02.10.01.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 01:32:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 10 Feb 2025 10:32:41 +0100
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0VhCEsAiA8uPe5Ksn8CTqXiIWWrYseP1TtWKONRb3So=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnqce9a+PuxOtQdQqE+HfNwM8HRtkEQ+iNfewus0Px
 3gA067GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6nHvQAKCRB33NvayMhJ0f3YEA
 C2IR91za74T7rkm4X8WnFczjhLLGe/bDhH30O+tHMJHPZpHuNcgPxVCrVu5HDVnA+CoonOlsLyMmGR
 Jp3vHkZo8Vhst8fR8w6WDqfNKkmBxG/qCqVHKWpyWCF0CbHhwY0hOxz55IWOVQUT4ysS9SFVEZ7fqb
 6qOCD0/1bJrOjqKLQgDT92ohfhYkxKqknDCHq3qKRanNpOB2Ac/ncqEEEEGBx6Mt/UEkPSt54sA6Cp
 JrdcNKEBa/AGTZUJXFt4bveCuEqJ3uKbxgNWY7hcIyWMiPPKvKu5lsgIkTa+elFRYzyu8yNytBryP0
 bhYS+2jbgZs4MqhwkcjFdQ0Jvl4Mnq9NP2NdefuI4oDfbe6oXmUogwG5uq9BLAFbRdo9YGgn53SdsW
 KBA17FGE/w6eDcSrCP6jdGgwiMmHhUJg1wptXok7dOLRMw+2kFWW63qVLRBEEZI69q+8egTr7Hb7Xl
 IX1NcKup1NFo4rkH9c5FNx4AJQENpUVt/m8LHrVfTbJVAcNw3DeKttBS3wabq7dl+3a4RjacS/jOLV
 lD/n+YAZde0XUW1b7QUQqRdezBxoUf52BN+DqRBP9oq6/KS4zZyzYRn/rHYjxT5gcVdWJusxDpkrru
 NiyknZLeyksBYnWG5NyKIlo0o+uHRIYePklQrUZ/6gKWaMxw1MZtEAZB6f5g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
add the missing cpu-cfg path to fix the dtbs check error.

Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
 
 			power-domains = <&dispcc MDSS_GDSC>;
 
-			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem";
+			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
+			interconnect-names = "mdp0-mem", "cpu-cfg";
 
 			iommus = <&apps_smmu 0x1c00 0x2>;
 

-- 
2.34.1

