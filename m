Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B007A26B2A1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393440; cv=none; b=ha1sKzkb0olETqRGN3GHiTXDa2cMIoItsJkC9NIzmSFL67SM8vYEqjZqI35y7hnzgvFm+g7sZhes8as/XxyKqlwViuemGblf5x/g/7ncIa9gI9Ly+8iWW3t5qUq3YFUZDORuKUKzK7aRMDYg1rv6dXT1Zt3p8cSiqutZgcWyd0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393440; c=relaxed/simple;
	bh=S6odiCi3j39rnfA12G7xzuyLfwGU/y2NQFlu0xGB+Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C8wXV92AlRsqbhiKo8XUjzQBlbKC1VmB5CmJhVZdtIemPCcu9eaxLCCQEJpuUw7gptvIhTcl4Kkgplpzc9yN99tF0j4LyADsbyfRG9MdS2Ymj9WoquK1qWVib7p+snAChEK1fGPtG1V49VFC1YFJR//8Qb95Rirk8yU2kRRGbWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HAj6aLjx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HAj6aLjx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso42090045e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393437; x=1745998237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tF1AwFDumw3UVNit2m0kQw0zJqe/q3et1UYoR7HMBN8=;
        b=HAj6aLjxPKuGNF5YNQgPOGiCxkeyU58aJuQ+aiy4L9HT+I40xT2tfilpidUDFmDIf2
         L89aAp2Hzb0/W45cFpV1GvDOxGIbLagG3UFLI2cU2UNxJs/obmda7LHCuVpmvP1On3f5
         taB9l1juYB6Q809QmC04Dki+K+2RS7LubunbZtH98WpQdnMmOxMu/LmUSYo8tJ5XFbDl
         7MfO+bv5Vz8t+8AZ+XckE7JbGYcI1hnTVVOpAhtWS903dy9Cld/XoY+nCuyqXZEPM7y9
         s6OzQPqJgpxS/BH7AKhijDduunmDun0XBL2dxMQ0CtOr1X1A6/HpN4pdTe3Qe+dckRKV
         /cGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393437; x=1745998237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tF1AwFDumw3UVNit2m0kQw0zJqe/q3et1UYoR7HMBN8=;
        b=v6SrapqmDiB+zerG9k51IwbzaaNRdNA87gttHGTpE2qko8gjaNsd6k4KexBCUqMmvQ
         jklI0ph4kpNkj/EKgdRQRYl6lmNZj41/+/aE2Jn/SqI1SGiGt21amU1a/Yj+SCNvmjtH
         ukdyr6wvDs+I7Wbrwwo58n6uDHaH4jd9kDRBxlewcjWq6fnqAYj+cix9YKsaWbGgMBuA
         eqWCYM3oNC94iWXkqmbgCxT21Hb36CcKghJam0p1g8V6jGtHRx4HUZgcKbvOqllbsF/o
         43mr14PwTJd5Xod5yG8ZPHE7F6QVbm9QFNKggtCf0wMV7ZK/LvkwTb3glvc2e0OjT2tF
         xVIw==
X-Forwarded-Encrypted: i=1; AJvYcCWBEwEvUTQAVXbGVVQ/8o2feQIw+CzTJYP8ISWgIid/mmAqsFM56JXfkTT7utrMfLWAWPLwff6WeAGVjBs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxlr72EYcKVq6iMKLvkgMokaFqJm98KygaI26UDCQ4AH7j/z8B
	1y/bLSVM2CRVSNuIqmTNiHA0xzL42Jc3UxD/WrYeLQjvIGepejFUC8yw7HPNeOM=
X-Gm-Gg: ASbGncsA5QYi0qMFvniB1GRQAUZ6uCq2ggdIg9G1meLcWhbkjl/96wc3aYGy5mpFdQz
	tCtVodgjwjqCwC5+nigYSzYy+5uI7YlwI4CopbLrDnQMOUJFgWaieZ/bsn98385KNX9X8ZAjfk1
	F+cBFcgXsZDXKFex10p5ScLDqwqOAZK8+cFD06/4FJgHRNkeeLQQ8gxx+ieciJFU14OMKxge5W/
	G8sZjzUeQ+ZquQByp0jGceKfXYftFhMWA6WafsPNYXZ/I3lsSgq6GW17sLa+f3/dTfHDt896b55
	wR2FbVw3cFJv84sVCZXmDUo74Gvyqw7BiUSA2Wxqq0hKUaIBMEnWO4Y=
X-Google-Smtp-Source: AGHT+IGUNupoHscjHh6R1ET7M+ji3vwdx1hKnT6AJp3tTymPpE723vt3TtbJSrUt781amFhWAPXmnw==
X-Received: by 2002:adf:ee0b:0:b0:39f:b62:8cb2 with SMTP id ffacd0b85a97d-39f0b628d40mr6545976f8f.38.1745393437079;
        Wed, 23 Apr 2025 00:30:37 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:36 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:07 +0200
Subject: [PATCH 1/6] arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-1-24b6a2043025@linaro.org>
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
Fixes: bd50b1f5b6f3 ("arm64: dts: qcom: x1e80100: Add Compute Reference Device")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index f73f053a46a08d875acdeeef9ac195a9b857ae3f..dbdf542c7ce5132ef37a68bfae293a09488b0a0a 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -846,8 +846,8 @@ vreg_l1j_0p8: ldo1 {
 
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

