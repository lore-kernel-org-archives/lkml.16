Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432DF254B1F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805607; cv=none; b=u9VsILEaqyNy9UKI7XUK/6tIoZoaCn4Z3b65Ej/pd4FsBAxRWbthb6VYFIfBADX9ViyHMS4KGxADjPbYlt11vV3wlGpu76JkRlc3CijS6kqrclySvb+UGpULWiWKdYgeXcHMb3ogNPxlDYhPrvPnRagQ0d2lgreeIaNpYLcKMlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805607; c=relaxed/simple;
	bh=ii+hIQEk5KPpp9Rn+sMvSqUQf1xudg6b3gBT7fQQSZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6NG7jPIQowB8OOurKiWXqYs7y87fjTHh0dUy3I7w+rYfAF7OJhjCUco/VJ3H2V0RGfzcZcTUEBUevqnBp53nvd7StQX43MBwJ3zaDnQjmecnmA1j2nqGuWGEafvbaEPDteOBAiAlud4k8mssW9orZA+lts7itKyxrnGVCEyh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SRAljMDx; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRAljMDx"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45348bff79fso64001355e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750805602; x=1751410402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwW9cC5wHVHau0v/JAk5tSGRFiIcBmMVN4B9SoOsJMk=;
        b=SRAljMDxjawpsCW5wMRo+gfIMyOqMl8JfUAvTR5MARboBkvCpE4RG3DRwM+MaDocuE
         7SrjzdCM8eDHEk6/W9UliAJrvRV06yrC7AYgC6UfElhdrvb0rzh4uJTId1Z3KCCuv8jY
         ISA9oBUemY9MjYWTPccCwsTVGXSsR8Wnfn3LcKgH8alN8LuQ6T/s1dZDfFKirYVVh/sH
         9rSwPRFVoGyC6SSjEf2lXr/4PSIG/YViK2sU7szoVKh55P67bhq4go3YF1CekojB4ZwT
         hfQwHIpf9gWk7XA70WTqkC+/BpPfRvo6vMrEEZmAgfD73A00l62dHTmR0hI0oRkVQYJY
         U2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805602; x=1751410402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwW9cC5wHVHau0v/JAk5tSGRFiIcBmMVN4B9SoOsJMk=;
        b=vnZ0mRcmLaUV9C6Tkh2KGdxpMmr7wo/hFq77I3Z2kuZBR4LSZCwL2n9UrAd/8j7pFK
         q5FJgzrQ6+qxQvQWERjmfUodu5W3642J/5r7LpvCqKnE06UhpXWHTXMYRDHONznNu6He
         To6qflHcG+x2uxmojo92fPXuCDMR9VSyUzLTWtmPCInntMFI5916dIvAdbpK7EsKVNQ0
         n34ZDB+keNhUCvKUDyFOebWl1Oq2NzVRzY7cX8nIsKqjCcjyKzsAdGWIDkQkrhTvGhMJ
         MdWjsqLHtacJjhcu05OCDGOzkx18EXAhMC5gc7ZnfFiUSR43yyXApg1xty+uz9MgDaM/
         mhRg==
X-Forwarded-Encrypted: i=1; AJvYcCW4jmlqlMfgVxaRDIbyV3aQn03s1pHwif+9QI/GZIqPVtY07ywB3CLCe83cXt62FZJ1Y7q6q+BgyhY5SGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvWK2I10qI1zLg8eOEv6/cQwOtdUMmZd/Cpv4P2gpndhljtJo5
	mzqH5bHeBGjTPxBTS8WDEwLNCLqeKResw7Z2cy3Qb2kUaQzG82nl77VHO96YIaGuL7Q=
X-Gm-Gg: ASbGnctbUck2H37BqqjmIWEs81xVAqSOLRN3+vmonfg+e68cLdnvnXEf0bBiFOzizHD
	CCpQiGk2o9QsTdx+85BgtkodDzZBo112NXEYV4rJ2zBsLp+2sekCpmN0aPowV7enm7kRSHOuAbx
	IhLJE01tR+93O5UWwWT0f0lr1ZxZzSHaR+uVuqjrLes/EUuaWhEh2XRg4JTgxOdsdHTogduVZSg
	LQ0aEPdSD6fckGXOjdiTuQCFYJrgo/DjxsWnWmKPKdAmOfTxRx5jRF3y37u5WsOncilcm5KznXG
	cX3zx/UOK3Hy9X+eSZ+0oMiPiavqx4kQKc1VT/rrsWE+MuqDdNvC4fSr9yL6CEWF/OsIFxe34I2
	bvYCFCPRHMDREUHCAWqg1TzN2odU=
X-Google-Smtp-Source: AGHT+IH8P6BDbTrJ0EiAo7KibXe1ky3Gx/YMDChSZawMD4kyG+0v0v3ZS0ATCr23xT6TbXCSVhiztw==
X-Received: by 2002:a05:6000:25ca:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3a6ed64a81emr351747f8f.40.1750805602432;
        Tue, 24 Jun 2025 15:53:22 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad0fesm2055835e9.25.2025.06.24.15.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 15:53:21 -0700 (PDT)
Message-ID: <fac65b9f-d95d-4e7a-a82d-223f3297d9e3@linaro.org>
Date: Tue, 24 Jun 2025 23:53:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010
 by default
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, laurentiu.tudor1@dell.com, abel.vesa@linaro.org,
 jens.glathe@oldschoolsolutions.biz
References: <20250624225056.1056974-1-alex.vinarskis@gmail.com>
 <20250624225056.1056974-2-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250624225056.1056974-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2025 23:41, Aleksandrs Vinarskis wrote:
> pm8010 is a camera specific PMIC, and may not be present on some
> devices. These may instead use a dedicated vreg for this purpose (Dell
> XPS 9345, Dell Inspiron..) or use USB webcam instead of a MIPI one
> alltogether (Lenovo Thinbook 16, Lenovo Yoga..).
> 
> Disable pm8010 by default, let platforms that actually have one onboard
> enable it instead.
> 
> This fixes dmesg errors of PMIC failing to probe, and on Dell XPS 9345
> fixes the issue of power button not working as power off/suspend (only
> long press cuts the power).
> 
> Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> index e3888bc143a0..621890ada153 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -475,6 +475,8 @@ pm8010: pmic@c {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		status = "disabled";
> +
>   		pm8010_temp_alarm: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
