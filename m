Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8B293C48
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771892; cv=none; b=HqQEcLHP1eMl+2d2h9U4hVSttXWdNzn54aNcyaO6Bg/PTeoMPRKXdXfA2EjFP+35z2drTDFOpTowOw6FvlLnbv06Toep/FgC6HkIFw3C9P3MdzoTDJfJUauyXHIJwP43Wv1AQsw7szHMBwq5YdpsNbQ3VUoEm9mjz5Ipuh+UQv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771892; c=relaxed/simple;
	bh=SNPpj7vjjty2f4GcEPbvBgmWRu/gVwdJZznlDEc11KA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CG7wdgDaTlAYo9TQdvg4zpqIfHrJdfabbHEIdgv8KpGaPNFYbAebnHGJHL4oy3dNzH8zwcxVx6aKFpDQS1BLFx2V9w2bkVFjK5lUyVelVOOPpTyWi2b563BnXeYjSS7TsU1lYfPz42DZGIboLOaXWZZPKoJ430zhCC2BBgIdpDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uA/M4pTs; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uA/M4pTs"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553d27801b4so451624e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750771889; x=1751376689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ixsChjPXVo6tgSzutDLAX1rFKh+YpL/is6uOUSR1ZI=;
        b=uA/M4pTsWXNxuf26ML3cTsvaYGniT0CiXnLKgZxOAcimj1IMmRoCKQ+t7mdCN7+G7s
         R1pxZKRaCQImOqnK5QZatW35asTsAVsxGrmyvoNx2nOD+XdESCpDVEYoN8eIB8yUVvwW
         ItXi3nkXiBiWprcC+5qzZ3qQeuOYk0+e4MI84xFHEcygVIo2XT+b44WBB/pXJjFLadQ6
         SM+JRHNrWmE1wzowI4NNRRrIYppGag2JiaYQ4bGKQF0YvclWMd7WSR15yKOpvupevg9C
         UeGvcXqTKcu9Uln5ywIafagCFY9wql3hoIGj978PwXsc3GoNe5mXhbJMPsFpbxDp60wO
         s5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771889; x=1751376689;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ixsChjPXVo6tgSzutDLAX1rFKh+YpL/is6uOUSR1ZI=;
        b=AA6czvS41BpubgnzTgs2PVx0qrao3qENZUfl3OktPvFmMSwocGc9sZQ2ZXVJb35F7h
         qfMzbr3XEB8YsChVJCdt6ML6ufH74bfeuTci3env07Z2cSFzl2Dk/+k/dhidvio7av/q
         8WeoNf04AroU2Xt3lUVjBjHELPMaiE9+Q0eRDXrkUXntmLo/ZbUd1GUr0VTvz7hM0Vul
         LoEPwEfvYfScbt0MyAUZBA9G8HpcecL7NgCtGSGEGtgz/blg8PycwJZrf38HSr8vwtCk
         //Ec8+KPK189MTHvpgXXPvHr9AATsqcg7dUoYmoTYnup0uUCj8ArA6MEBpoKYA12OW5B
         l6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoAgw1BPj7v34t3290z5Z172AReu22349mu0DAC7+BQXUAmZUro0AXOtt+Gu/Ovi7JeL0xiSp7cmBAjfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYiGcGRa6PC3tqQwK+IGbhcNjRfDJP6OGuauAlvhgozc3PihAa
	J3gmvDXzpUJMAWyL7PwAprry8giLHOemjeOpfkyt8jVwduRN5/SxR8wJuaW7Pad2zIg=
X-Gm-Gg: ASbGnct4UpkVoxr4A3ryvzWc6ULUcjDZpGGuZSfLI8jBUBTd0gVKAqBaq3bui6j28Uy
	EB/8vtIc0CQDREhpCAZuYtttnISKooelSSr5HTIBJ3D2BndlbrWbUo9rwv/PxErr7NPf5gELXeW
	NvGlMaMWLbnG6HOBJ/a3/oVZUhw4JBvSK56Mi9Q9mlcn98D2JirQecP3NTxAavg/yo36ztqdSDr
	u6OU/3A6sD9TV8ni6ikJDiMj3hjSyrxSZpus5qTG7UhiFJaHcWOyplqcY1nYnk5+HjpOXEgt2P5
	swkJlckHYBH5VRz2d0iufd9PsJWvTR28tbp8R5C0jUw9whq34blvIX7tzh/mZWUbnc61qCUdaEV
	jLZ6de8hPD+8KK8zpPscKZubVJXaueSJrqS2wV6xJ
X-Google-Smtp-Source: AGHT+IGwGCymU8RONA+nhcXdhqLM3PrHi9ooRcM+SCxJHnCXXQhmrBOwn+PHm3whE+vhvRviZRDUzA==
X-Received: by 2002:a05:6512:3086:b0:553:2874:8efb with SMTP id 2adb3069b0e04-553e3c079b7mr1854622e87.11.1750771888708;
        Tue, 24 Jun 2025 06:31:28 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbba4sm1837510e87.109.2025.06.24.06.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:31:28 -0700 (PDT)
Message-ID: <9fc448d5-5c16-446f-ba89-ce4681b5c76d@linaro.org>
Date: Tue, 24 Jun 2025 16:31:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-5-edcb2cfc3122@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-5-edcb2cfc3122@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/25 15:14, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100.dtsi | 185 +++++++++++++++++++++++++++++++++
>   1 file changed, 185 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 4ae0f67a634a982143df7aa933ec4de697f357a5..ee78c630e2a1c38643c9222a6d6fff4cc1216a47 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -5195,6 +5195,191 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: isp@acb6000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,

There is an inconsistency between the unit address and the first
value of the 'reg' property, it shall be fixed.

-- 
Best wishes,
Vladimir
