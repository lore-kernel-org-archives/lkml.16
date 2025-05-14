Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E00F86334
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747201065; cv=none; b=ufoxcN1/tE21JZdwk+rSpfU6su7W0BzNcPAoqV8kvkg3dSDi9SAsf/pVqUujI0eU0zJhFQjTo6ISr2Amiphb2GY78cgIoaxgiAj4G9zPM7DPK0zOv0vtIPi8k1kVEHyk9KKUDTcMDaI8eVcDg05TWD5FFBZqXrcgKtZBRl8ZDlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747201065; c=relaxed/simple;
	bh=EEby7excLqyRAZlBVU18cvMGi7EHO5NAyeDfYhB2ybw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHJOTyaINll4JgrbH/YMwheiMrkOujR5tnZnB/HKPPL//CVU7siOO0eyn4f3/F3Jmn3CwGabQJAlavVJwMjyXdrkxrMboUr5SZuNYpFd8EDe8cgJ+fUmliqCS8Mej0U6BbHxgmEMWl2MA3qbLxq5KKyXkZOyoWvsC/o21YO8oJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CuMxDGNy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CuMxDGNy"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf848528aso55702255e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747201060; x=1747805860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X6RATe/WUl9l8PIeAPNH/uJUaYuQaKoomiYz3L5vu+w=;
        b=CuMxDGNyOaableO3MXJOxrrrJVQvwgg9JCk+sCsQAIPh+jQ5dqEogf9dxDyMUifnxb
         6rM5Q5nXm+fTe3W3ys4VsyP+vn/AVkh0mkq/H5gNnQsC9jCNvZxEFY4paOwfuE1UTiwo
         lNd2xxvtytoxPMdANZO50SxIjuy9K51pIx32/bnZsEPCkG03eHxknvXgSCwRUxglqPgA
         tE7JH+rhHCRRzl6v4yGCMPVNCcXsHD08iXjxv0Tk9OfQiLJn669tV/o7oPEMAxvOpiG4
         GNoMZdTqn1/Lj8MBVoWte1k96DRWN0RVtqpnqKMO9zJDKNRIhtWOdGACAZv4Xta2yJO/
         z8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747201060; x=1747805860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6RATe/WUl9l8PIeAPNH/uJUaYuQaKoomiYz3L5vu+w=;
        b=pmTCUryAka7tzHdZ9T2NfRNv7uG1xVHe64RXlMm3A6Itt1GVXemyIxCfohNqkUOpTx
         qxSASXL791BcEkVb+YiDdjjrSQVcsWhUQK5vJNHhkM3yTJ0b04l/nJidFDZuPNOJ7IZc
         yFyKwvFHIUbTPQ89/+zco4oFajQlz9yaOyEjxtdU3hSo8B8uEim29WsdrB6Kd4ZKaOpz
         AgwGHyth9Nv0OlyqYCsO/BTahaQIj/CHDp+Q19QLYMWP0uxF9g/HC46nyhygtNkcOCYn
         smJMdW40P5g0IT8TV4Rm8FmYjakBCa5+IEn8So74onQnoQF7N6O9OusEnDprf4yGWgBh
         Dyjw==
X-Forwarded-Encrypted: i=1; AJvYcCXlpcRB+i0zcw8fmMVEzPWCsOM3ZbsW00wJQjGSSO/UKmLla+muI9LxDf2tWSqb2Jd9g9+5d3A4rmtxRcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YylJ31m1dODlb6msQMJG6XnIFHvuktlKnoRBOhekAwXP7nXfpjS
	fgqU13ljxIcSKjHeAgdA4DlyVLLTDZprbZEhfPfhMQHi9qS+TiZSCqjXAnHsH3M=
X-Gm-Gg: ASbGncuf5LCMNP0wFqECeLkaZWKIszLP8tYaS+wbxf+jWCYJPqcW6uFilzFlYRRU5Da
	34g6wgd3bdsvpYWFhlmyLTL635tDkU9p8LzryHlK6/7Mp6MZRA/vk1v6tKZSDJ6fTkk/yGSchiB
	3yVYqzi6Shs+ObLfjriQNVHEyhS6dZuVuBjk12007DPNtDukrDty+Wuk9AMQqlKIt+OmYL+2NmK
	PDJ9BgOsGmAT/j7tHGoAUAr/1Tw5uwFwCQAI8q7Pano0ZJVH61do1dX3sZUOW4SbPzybd89o+Z7
	sa70X1vg/kI8wRCTxo+lbunoIeuRh8Gdd4QigS/QSzoJWkFfs7bEZwd6yuWci4W0uaRd0zIo97v
	RNWYNQRARJ5nL
X-Google-Smtp-Source: AGHT+IEH0gDtxUZnOie3UkdF+NX8VbUWlkkfab4c2RI1xS/aCqZplXS1DjQKIykuoWCzSS/8AUXEAw==
X-Received: by 2002:a05:600c:c0b:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-442f20e1ac8mr15280155e9.8.1747201060355;
        Tue, 13 May 2025 22:37:40 -0700 (PDT)
Received: from [10.61.1.70] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm28574955e9.3.2025.05.13.22.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 22:37:39 -0700 (PDT)
Message-ID: <e1c4cb6b-2445-47ab-a908-af3e4833385d@linaro.org>
Date: Wed, 14 May 2025 06:37:38 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sa8775p: Add CCI definitions
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20250514-rb8_camera-v1-0-bf4a39e304e9@quicinc.com>
 <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250514-rb8_camera-v1-3-bf4a39e304e9@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/05/2025 03:40, Wenmeng Liu wrote:
> Qualcomm SA8775P SoC contains 4 Camera Control Interface controllers.
> 
> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sa8775p.dtsi | 268 ++++++++++++++++++++++++++++++++++
>   1 file changed, 268 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9a8f60db87b1afdf16cf55eb2e95f83eb45803a5..a867694b15b307344b72041e972bae6e7543a98f 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3941,6 +3941,162 @@ videocc: clock-controller@abf0000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,sa8775p-cci", "qcom,msm8996-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;

The ordering here is not consistent with upstream. Please stick to that 
for your examples:

arch/arm64/boot/dts/qcom/sc8280xp.dtsi
Documentation/devicetree/bindings/dts-coding-style.rst

---
bod
