Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4892737F5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344923; cv=none; b=qr0u+HSGylGTri64NCjbE90+z2UP7zkIlAlvXuBoYjJz+TVTwZs1XGR8NDAH+W1kPatFrX3enoWx6+wTPYPSO0+jszaLUuQDvBksGcwxyPqEGSE1qyZe1ZfsGsU9Yies0fwZ6cymTO9d4cql/fXX14ibatLY0iAhOren6V6n9pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344923; c=relaxed/simple;
	bh=qYAZCfZCRBki6rEwNto82MyVYrF2GEVO45R3Q08g/IA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUKEuEX/bxNxbkZTzgcEdsHgP3a47h4Wj+F4+IF1tpz4hXPE8dKtF1pMgY0qkNtZrtX1Ggd9NDCvnHtEfhOOu/XFheuu70VJqrlhiEsI2bVXoJHugrPh4117vBpnwTQReRFYqR19E3mTfllue0e4SsFDesSH5r6tM4NOaND+gHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GiRIjnJz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GiRIjnJz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442fda876a6so7610785e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750344918; x=1750949718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k6CcoGZqjD9+K1M8PYMMCHFJXIehGW4t5wpSeTmgCi8=;
        b=GiRIjnJzhPZYfgHcZwpnz89qiKvoMQrB2yAurdDj7rDgg33XvrOCFXIO9QFDYL2wEV
         N6KkwpYi+AtVZAh7NRXXw42faiHbmPZ8ecHdaoHsEGxcZGo4aMTE3ptQ0QhPM9ktX+rA
         aVCQSguZeKDD8EVUVNcuQ+ZWWYqN7MPO6llVi486H7VITLEJ46q7oU0aIYOz70I5ePmA
         aQ0N0+YaQuLTZGnIE7DRxEk7qxuNO6q9v8tFZOoxEDILoUM33yxoSHd4vGbui7x7y+L0
         jdDXCCoB6nkO9OZtE/u7gVOfihI331pAw3zC2Gb2IbvD3jhc27VgVlC25wDW66KGe27J
         ZKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344918; x=1750949718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6CcoGZqjD9+K1M8PYMMCHFJXIehGW4t5wpSeTmgCi8=;
        b=dnEncC/URb5W5l+H+Cyytl12HJyXiIaGxumjRk85Yu7DbS94kgvMFiP+RrWbVLdWmw
         SH3+TWI+iVmmedPG80S0YNlvE214A6XEaQVuAYeb8aO3/Xfil7somJNGsGYjggWW6UXX
         qtsqmhGKcccMXG7PrpHiyaKlCaus83rfsDUGJjfmy2GaERML/u7oL5AqEBscXcwE035h
         UMCAmfVAR3UhiLn9ubfzS0wkgK0Gtl/kCGD7KMN6zJ4Ggtc721hX8ATEh596DED3eBbv
         p6ydJN84CfiH/caXLEMvCA4MG0QKjxaRLGqbnyZVgh0nfLZ/piuUxUNSqaorpl2Gib3d
         8+vw==
X-Forwarded-Encrypted: i=1; AJvYcCXC1GJMj3Fl+c0TVEWRfEtnpXNDThYJUeWEJKfqeo1GOn5ScVg6UvpIDwlMC5z7zTWB9DlXM2QJWYLFToA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy86TdIjKoJ7KSCw70dTFr+f4oNcAWL79t1SXlQGstGos6AqEyR
	CDPpKYT0vk9bIHaZMgrVr9e7zSiwajmQn/q2Nz91Y19qZE53+IM5KMpAdLQnjuK9djE=
X-Gm-Gg: ASbGncuqt7+70qS3auqqEx0TiATBlTL/KSfJ+2uvJKNZpZiFOji5PTK5i5phinJa0dB
	GO4R9P7VfcVlmMW7ZFFDUxp1JnhjuSNZXjsBWEtxFGs9hq/XuGUtK86jAdq2NBUMuOE1bUZtXmo
	zzaVdOAqy0ZW28Duzi2OZQLUMhl6EBRPh0a49EQqZ2JACIgguY6WOjEeGzAWSeR5LrBA55R/WDc
	g/P7DMiUuqbB6JPBGikiLGx09yDvSRYnjRDza+dc/vL9uwwX2zYHFwmY79pgbplYlaPDpkJr8u1
	JELcFMEBkPGcXhtjIuvXRILT2EeS0p6ebsXh/2rK2KngETW2W/cTfT6qAa6n1FVnLLPzLKcepre
	KrzMGuD5mcJcUNMAz6Rq2bg==
X-Google-Smtp-Source: AGHT+IHqn4tAEPgYc+nW6NOVxVDdxt9Vx+UOQZkFC9cJaTvzxaVLk2lXNPEErPPHH3ALfmNFXQfnFw==
X-Received: by 2002:a05:600c:5185:b0:453:59c2:e4f8 with SMTP id 5b1f17b1804b1-45359c2e6f1mr60408825e9.1.1750344918502;
        Thu, 19 Jun 2025 07:55:18 -0700 (PDT)
Received: from toyger.tail248178.ts.net ([2a0e:c5c1:0:100:b058:b8f5:b561:423c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebced8asm31343715e9.40.2025.06.19.07.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:55:18 -0700 (PDT)
From: Casey Connolly <casey.connolly@linaro.org>
Date: Thu, 19 Jun 2025 16:55:10 +0200
Subject: [PATCH 02/11] arm64: dts: qcom: sdm845-oneplus-*: set
 constant-charge-current-max-microamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-smb2-smb5-support-v1-2-ac5dec51b6e1@linaro.org>
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
In-Reply-To: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-hardening@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521;
 i=casey.connolly@linaro.org; h=from:subject:message-id;
 bh=qYAZCfZCRBki6rEwNto82MyVYrF2GEVO45R3Q08g/IA=;
 b=owEBbQKS/ZANAwAKAQWDMSsZX2S2AcsmYgBoVCTRdzCeOVoOYYIZoWDgVhy/ZEc/+H7vHO3hk
 9+coi1FjLqJAjMEAAEKAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCaFQk0QAKCRAFgzErGV9k
 tgjFEACJoBqzSyVmNA7Zpg0bF2fnP3tcsYhpkpKhB+GRT6LikucPsFc4ySsBumxIks0HruvV5ym
 XBTm07V2xs+PTsMWjllFWTGsObMoPxYJXR081gxtDlhCL0Ng/A5vFdsFHiYU0zn2vK+bqtZgemt
 oia+SFbIUf5a+/MB1cwJUrsjodgY+OUE3iR6nVvuqlz7CnVpI0TvXxqqSzpneGfC0zxHUMjrfSy
 f8aR1Cc7+iLLp6VqAV6AaIS1aGQkQPQYUFB77t2gk2sTs8ByeIm2fWP0UnxbaV7vd52naJnmi4r
 jfcbyvihE53AY7F0RYLzl644mwnj32/INi3C/qZsfaHJYRXFyQjsaxi0DV2eZQmn3Mqq8bbc5O1
 OqN8GqoHqT+N5BOhkEn/b+UAp0d4tHCW21o4FyqMsvlfAH+9GiPAZpMCfFLxdup8FHTn7cW4QMf
 Y8XOicvxAQentqPPUVhhOaZyB4mP0faVWN0IeA8tQHx4kQ6trbi6qeWb1fgNNJIFPwMPLBDDOCu
 R4c4jpKQIPEuxc2r7CYJe5jc+V77svrd454tJnurx2rlWNMFmONymTxnXftnaV3FYx/5Zr/uhBl
 Ha8Iv5nLMRjqDGEHTuFBDXLxDExoNqGOIaMTssY9bo9Em52vZCFs11E1HYXdcQ6TKiKFAo1/+qa
 GIVjesETp5LyJFg==
X-Developer-Key: i=casey.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47

Set the maximum constant charge current to use for this battery. While
the battery is likely comfortably capable of 4A or so, OnePlus didn't
include a secondary charger IC for parallel charging (instead they have
their proprietary Dash Charging). It's possible that this value could be
safely increased after some testing (and when we have support for
modelling the charger as a cooling device properly), but for now this
value is acceptable.

This is references from qcom,usb-icl-ua property in the downstream
vendor devicetree.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 4005e04d998a40d25a64d652a526bf93efc20332..9ab5ddc1f6cbbdcfbf793b959d199b20256be9ed 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -19,8 +19,16 @@ battery: battery {
 
 		charge-full-design-microamp-hours = <3300000>;
 		voltage-min-design-microvolt = <3400000>;
 		voltage-max-design-microvolt = <4400000>;
+
+		/*
+		 * Typical designs have multiple charger ICs which can handle more
+		 * current but the OnePlus 6/T do not, hence the lower limit. This
+		 * does not apply when using the Dash Charger, however this is not
+		 * yet supported.
+		 */
+		constant-charge-current-max-microamp = <1800000>;
 	};
 };
 
 &display_panel {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 9471ada0d6ad8bd44cc58a6efa07f7eb27921af9..1644648fb8800934e4a8a9b54380bb019dcd0059 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -19,8 +19,16 @@ battery: battery {
 
 		charge-full-design-microamp-hours = <3700000>;
 		voltage-min-design-microvolt = <3400000>;
 		voltage-max-design-microvolt = <4400000>;
+
+		/*
+		 * Typical designs have multiple charger ICs which can handle more
+		 * current but the OnePlus 6/T do not, hence the lower limit. This
+		 * does not apply when using the Dash Charger, however this is not
+		 * yet supported.
+		 */
+		constant-charge-current-max-microamp = <1800000>;
 	};
 };
 
 &display_panel {

-- 
2.49.0

