Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3F21B4227
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725205; cv=none; b=WP/H7ylUUhhAkvEsIxT0+7SZYREl38lLyjGy/AHLTED6Kp/9c8oxbJ5OKyh+wGFqDwoggIpPmomW75qwEt5doN85M0C4pcLq63JNuTK4GM8ocui/CeoixE9ZYgIvigr9HWT6e7mSXIGrZbhOg2PV8C71/s9XSudFfYu8+C7NPsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725205; c=relaxed/simple;
	bh=JWwoxEMK2A5kDbhJ080c6MdZJuqktgRFVi8Ef7ShjQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hETeE4bH6CIWqR8VxqHM1cqftzJGZLnAYMRGqaHlLDSMMzq3zwb2SXjSVLQbOz7tkNF1ys2iDaym0S9wV97WOZCJQgjebxBLaKxL/YqDbv0rJ0tBKy41QANHFJD+4z9bOvXyNGqsrFhVCMOUBA9WCu24cHNqw7NcNIcDEvQLGzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySUlPsEB; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySUlPsEB"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so9151341a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725201; x=1745330001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IzowgvGIaxdQmiDRDdrZTttLqfGAIGHXMByDo47trxw=;
        b=ySUlPsEB3vYBsGS1xVnFdaphSHt7LRYeQAyYfwPYNT9teyB71pHVb9/KQhP9rl9w16
         0yzbXnHY7LKNYG/z+WaL94p1ljxIDOo1KWJt3jWkLfwQAfZ+QdwU+jcUhZS2SaQeCOP2
         GsXTNfetQElNS8j96kZZG+MyllcNvhQK8srYh4PbOXCaRmCj27Fv+/lDzAtntww2omiA
         WaJECwzXpMK78Lb20cT9+f+/nAVSqVkWGJLm7MeZ0qwKQXuPKBIKTx8LhFND998yuLn5
         dS1NQfYfHG8vyNeiZhNHoCRizAUkNr2kyV/lFfWVwNxyoQ66cBQIdW8a2n2RxsW5bDYq
         XSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725201; x=1745330001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzowgvGIaxdQmiDRDdrZTttLqfGAIGHXMByDo47trxw=;
        b=uPC32f4xH8vCAZr0Vx3IS8j5hXe05UuLZl/AbBEnoWU3rPjLLLFZLovkF5JHBJM4kU
         uJDW8AhFyENw87bzL2Iqy6ct1vPhHyJp5C9Lkmt58DPUsNa6OYbcJlaep88GdvQwtQyy
         opxyxmlUkpaMu9xCPfBxTl/aO+BjWxePjQl27UIedzTRNgp2xpK3Z/m/CFXl+qmQlszj
         pocqIf4DR5AJfReVhIYlpD8k5aAr1yhpCSqmFzmA/IZKe07IXh41W6hwQrDcZM1KFWDP
         Y4f7/PbO45wtLOb0M14bKP3HhRaCr/xEzPrX0Qx2fGSr0IlZ+2OezTDJIEto9uewjuzf
         2BSw==
X-Forwarded-Encrypted: i=1; AJvYcCXOBmBOdARYn9ZqN0M7fp8BWOa4GOBagv1dAdnQxlfK0CjObt2Xr9JUMbfnG3vl2yqHHH58lNG3rjqWLOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YycJam0lcAEp3Dt41klI2zMItdXw9pRtm9hcWVKycNq5gVHxnPu
	ODw8foetdZvRxQ1a0JNBz+sl9PH5WCqhjs+bO8kO1ZVT0LFJYWj9lmA1lXX/pYgyE7HTSo3JuEg
	M
X-Gm-Gg: ASbGncusapBiR5zWltKEn4rwa9NFzioe/gAlHCMZHhlsx+zI/4EIjr4Fk04WXHXH255
	imQxRNy19xZvms7Yz68xS04cqKg3DL80IYGTOO1jHJ9knGfTUd+W3uNBG1ww0tZoZmcwlzC/QC7
	batPcY6i/uvAuSo+dg3+ATIBped5Cvt5unqKNjKhzzg9q31NB9eCs8eBTRff5EXtppUHhoexPkS
	Hrb7Ku14xjHsKY2ddU51V0upo7V/8B4l7yWKzg62EUbh6KR5oHz0dv73i7kiHPZZYFzAqfP9V7S
	axWnGSZkM0bQOzMF8ZkNPUDobtZxot1ohZYtkcbVtGD8JWB4ZsImgYk=
X-Google-Smtp-Source: AGHT+IE675xAbbKMbD4WeLidcu5LWshKzXZX5noo05D93crI/D9lMfCT+vddCc2faeoXBgbbVScKiw==
X-Received: by 2002:a17:907:972a:b0:ac6:f4c1:b797 with SMTP id a640c23a62f3a-acad349c39cmr1352690966b.19.1744725201472;
        Tue, 15 Apr 2025 06:53:21 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:7b18:2529:5ce1:343d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acadcc21a44sm681379166b.177.2025.04.15.06.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:53:21 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 15 Apr 2025 15:52:47 +0200
Subject: [PATCH 4/8] arm64: dts: qcom: msm8916-motorola: Use UART1 console
 pinctrl
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-msm8916-console-pinctrl-v1-4-a1d33ea994b9@linaro.org>
References: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
In-Reply-To: <20250415-msm8916-console-pinctrl-v1-0-a1d33ea994b9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>, Casey Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.14.2

The Motorola MSM8916-based smartphones all use UART1 with 2 pins (TX, RX)
as debug UART console, so make use of the new &blsp_uart1_console_default
template. This applies the needed bias-pull-up to avoid garbage input,
bootph-all for U-Boot and avoids having to override the UART pins.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
index 48134e5ff524fd5708db7b9c3a567ec3f751868c..4e202e7ed7db1921f347ca8b4a01ccec593a8d8e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-motorola-common.dtsi
@@ -69,8 +69,8 @@ rmi4-f11@11 {
 };
 
 &blsp_uart1 {
-	pinctrl-0 = <&blsp_uart1_default>;
-	pinctrl-1 = <&blsp_uart1_sleep>;
+	pinctrl-0 = <&blsp_uart1_console_default>;
+	pinctrl-1 = <&blsp_uart1_console_sleep>;
 	pinctrl-names = "default", "sleep";
 	status = "okay";
 };
@@ -132,14 +132,6 @@ &wcnss_mem {
 	status = "okay";
 };
 
-/* CTS/RTX are not used */
-&blsp_uart1_default {
-	pins = "gpio0", "gpio1";
-};
-&blsp_uart1_sleep {
-	pins = "gpio0", "gpio1";
-};
-
 &tlmm {
 	gpio_keys_default: gpio-keys-default-state {
 		pins = "gpio107";

-- 
2.47.2

