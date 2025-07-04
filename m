Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD59D16A956
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643460; cv=none; b=FJXamFdP6ULpKZswmG+SaN6Gnh+d90gNmnf944lNeu7TU4D/o64YiQSzOjzzvNigZWli1GQWACok2L2oGgWhJdbBaybG8+Pf0OUzHDNbdIaLlDQx5PBYuHUUyer1GVzgY7O7saygomi8lOpSa+H5TXyZ/hmPewslYl/64LvLRtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643460; c=relaxed/simple;
	bh=nMUwUQvpw8YaloECKT7I6pAgLXmQeXqRvqFH/BN0VR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEYZ5+PPSMufGP0qQOGfCPO/McajoBZ2rzl0/Nui9KX/4MDjsHpQuiKne02eCEHO4qg5Yh4NRtgb3ucYXsFezxcqoyx6pFCoUVFGYOYbxA629c0KnAvMMotAQha61zo/G1v/Fg1LTwbevr7GKVIGbvopkaEM3RUOx0tnlclkZ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N2iLyecg; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2iLyecg"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso600239f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751643457; x=1752248257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k4vHSbtWGZygYaRzsrpR/TDlNvjSrpMlfZbiVgpj+GA=;
        b=N2iLyecgzhJET466YfbKN+tbe28nj5TdEMz0iYFCAJYsrFUc+xw5lKK812NkcVMgEv
         ppAM0IaCrZ8XAkZgY2zpe36EdVzWQ4gKZvzhaI/J8JOZLMD21Dn7u9SqmtBKn7/vZYFd
         eymYDwwxbyFcNsmAYagnr2SoVAUT6cfc6ZNy/8P9pX1WrwSPrV2WF/Y9LTDJsD9lW4UC
         xxtcHuEPGqhKIRwknGMrFpTUdjYadUDhz6QZU1r6/5IshlsQRWr/DS0diK0SgL5JSN6Q
         vtwAob6M5RMrwjtZUrgcAzLoPKlX1kB8F/rO+iiSyBTZ7jL93cNgr1uHSrOl7jHAW5aj
         IDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643457; x=1752248257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k4vHSbtWGZygYaRzsrpR/TDlNvjSrpMlfZbiVgpj+GA=;
        b=fqSuig9DoMbrK8zCWDp1y5F4aCopK6Yw67nOioojkSfNkPOy9uONy0W2Kho8Gq1d5R
         zdSjgBK1W7Suy5q05mbboUK0Xu3aYCYqmJuTdP3FxLquGBSDoesZblucA78c9Xx0Vi7A
         nKm7qZ7MjQUgLK8vvPz5+9V1B8K+GOS8d+qpgiOQcFp165lUF+OIJuG0tFuDO+kcNznC
         Z+rygs+MA+sVouTBfakBdCH6sBLGPBmzBb+uaoDmq/8UjBVPvwpM8KWaRGI5w0ZS5T/r
         F95kZ6QvaNDCbp+WfOwlxOsgSjnJ4lRnHfRu9+UXS1iLGVwFuJ/k4FYFF645qbeYda9s
         IcYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgZ+C+aZyWneI92P695H2hfzWSlfoYSWvmZO71syWSCDnW0IrbGruR2/wp9OKI8sCH7yqW+IvBRc4W62Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6V1XoWszU1ROVO+FoReVISzRUQJuO3+EXnI1AhNbkxeXJPERZ
	WHTYlTOC1sJkWavXoacZu1Hqduddx0PhQ42wmr2jyLmLuJhkPLmHw2JGXkf9Su/hLo0=
X-Gm-Gg: ASbGncu1Dt5Hgt8N5FMdhv0iyxQt0GHm8WlYSycaZ/bzPFU/ahR+ACYH1guNWsKP2aY
	cNQ0MduWdKf10L6nMbvZF8uQjqeQ1aiPFmR5zKeuzTwF6R5YJ3c3co6KxnfuyXRP2DfyyXvneJv
	HjlUO5X90Ypgsat5Ly1ETalXAQfv/8rZSIjV2swmvDot+Txcq2LXbpi9Y/f4aTlclZ54/CryWY4
	0FGn2uPyu8WYohtkJRnWZchBlXKIeYNO5PjMhP+py+ka2o6FZaVktK2TTAZ+UoPzmUEuf8qTbCL
	VTWQTHpX2hyYbpQhzTxh7g+9MZyTski2FpOamXepYiKU0TnI5Ws+vy+aiorTcTkpdwZL1wntB/+
	qkLx1owbYrD15/xVMXo2SRJWssEOF
X-Google-Smtp-Source: AGHT+IFhUkHnFrfbIeRzLcPeKFu2lnHSq4lMxRS57J9vUC96pAccxTa3B3IG8HOVaY9CGSpbxOA07w==
X-Received: by 2002:a05:6000:4387:b0:3a4:cfbf:51a0 with SMTP id ffacd0b85a97d-3b4964f1f76mr2566213f8f.21.1751643457080;
        Fri, 04 Jul 2025 08:37:37 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997b1ecsm58921595e9.11.2025.07.04.08.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 08:37:36 -0700 (PDT)
Message-ID: <c0e03c16-ab33-442a-b73d-1b231b6d141b@linaro.org>
Date: Fri, 4 Jul 2025 16:37:35 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: x1e80100: Add videocc
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>,
 Johan Hovold <johan@kernel.org>, Stefan Schmidt <stefan.schmidt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
 <20250701-x1e-videocc-v1-6-785d393be502@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-6-785d393be502@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/07/2025 18:28, Stephan Gerhold wrote:
> Add the video clock controller for X1E80100, similar to sm8550.dtsi. It
> provides the needed clocks/power domains for the iris video codec.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index a9a7bb676c6f8ac48a2e443d28efdc8c9b5e52c0..890eaaa40184a18bff54f2d750968112a2546d19 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include <dt-bindings/clock/qcom,rpmh.h>
>   #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> +#include <dt-bindings/clock/qcom,sm8450-videocc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>   #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5171,6 +5172,20 @@ usb_1_ss1_dwc3_ss: endpoint {
>   			};
>   		};
>   
> +		videocc: clock-controller@aaf0000 {
> +			compatible = "qcom,x1e80100-videocc";
> +			reg = <0 0x0aaf0000 0 0x10000>;
> +			clocks = <&bi_tcxo_div2>,
> +				 <&gcc GCC_QMIP_VIDEO_VCODEC_AHB_CLK>;
> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,x1e80100-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
