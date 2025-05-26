Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427441DED4C
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247626; cv=none; b=klKyBy0apJBe0NQLObQL4MNsoUk0zY4Ud9RYB5syq7KVe/NssDN2qaxDEXspiNb/fDw9Wso3XeVLfo8Ed7XLj5I4wkgff3hZsC0BzRuXGaMpMpz5anMjVo4vqgLe2QOJs9FUOi1DExWTzcO5othROG/ojTTwx1zEpTbyrs4yhYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247626; c=relaxed/simple;
	bh=kiIkXPF0mzMsp0+vmMLj34FpGFqIHfWevMok9dqiXjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1sSPH7AZNVzb/w+X7ZyoQH17wU6U6DPGpZaANypoUaCmC1/bYjqkPRBukiHPshUoIyJ4J/Uv0VndR1kkCTYZuS+5j+qgsxlCMk5if3lcuPsMDyqCVvALu+38EnrkjEBPjX/MpJ0ILkEpA4/MtFdunKHfzqEFPvVyZPx5+YTxLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mL/Mozhh; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mL/Mozhh"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so26502605e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748247622; x=1748852422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iYw0GGZr4tuoIVzPkfyLk2cYyXtNoRutkozNOrmk44g=;
        b=mL/MozhhkVuofUlbor+IFY+2NwW0ZELSrO8K+CBs/PwGDlRlzoB+q6m8IwEVyCNUVO
         W3Sn2BV9YGJHWkqNRPUxL5I2Lwda7/z38Td17Q6OT7BPRFW6nHk+TUashFQTiNFuUJ8w
         Mef3p7U/WyofrZEnMdnOF222b87UNcwidNq6z7P0GkrU9x5ZgKEGvccXAJup0DveNEYq
         Izi62BwCIXfGfmk1SL3mKUeFcIqi1ddOnSXHg66Im28lYvJqLUeicfZggYB+pBiyWJuk
         NbXgOPrfwRrZHDqsTU2x9jI5z/BR2uwA+vrUeE/9ajCxX9aEQeFBKUFTHral7BpaP2X9
         bboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748247622; x=1748852422;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iYw0GGZr4tuoIVzPkfyLk2cYyXtNoRutkozNOrmk44g=;
        b=NPyevHQ92IRUnYpUwcD6z4ctkhGT0Xu04pkGjsGu1HnAk6h37l4OVt4IODc0ntaMoJ
         50gORnq3XzjqD3fQuU83mg157U1HFTaRPCbXIaorGO4U2oaU79ysEimt8qozl6Sb+YXG
         b2sqUZgS6Pdexoq8co6YOCa4O1Tz+J5gI8gxiHXx27k4xBQznvjAEydB3BiCmDQxb4FK
         0BvLprkaUaJnm5LuRqF6JQ//+7LHZYAAJM/45XNfXMeHTsGL4aS5my8sy1GJAoEgWS57
         Ubgjfx5kShfTlLdZ8jMKC7neH7KRLZl7Ra7LkLfg2/9upkOiGmrMqvGt3GzfH1Te1sJx
         GYrg==
X-Gm-Message-State: AOJu0YzxQf6KuZb3HqIdXVajjWsJhgoyozeP7yIlvWgHDosvvRf6F8qC
	a5mdirmZNi8W22/i818gAYGEaaPb9ewiiz5LlO1inG48BCpIr3OpqbAnPco7XQDZ5uY=
X-Gm-Gg: ASbGncuzPpbcxfhKq4IW0VninC/TcsB+NRG8QauCWmlL5LIEqNP3g0yiw5WreizYovX
	qzBWOJzZ9jOCw+xxfS8VWQMr6W73NFbz3YS4W4wcXWkaHccpSAYT+3NAdk1UxW7bQ7HMn2n6S42
	zxzWmnGZUvVeSaa2B+f33AvU09UeTQOoRxuBCDq18GI/l7y3YEfGTn5H00iGWGynLIxgUix4RyW
	bknidK6tjodZHf+yVVBJNSRe89MU0rJNsI2vr4iif7NGqmOQzQDMK+ORoP7lzYxdyvmU7jlkvb6
	C6QP2TXrkGdg5WJzCTTJwChIRjNlHWIyH9xwCb4YE+9LB50hQzAPtOFpFFC7AQi6DYkpoDKlztg
	3D4Is/xEXMXwKQS94
X-Google-Smtp-Source: AGHT+IFp4oweCau504HUSsYtRlu63mwxtFVBOtfguUvjdqDFiDjl115gPPjk6xM6N13cuUqyj7SIPA==
X-Received: by 2002:a05:600c:5249:b0:442:f990:3ce7 with SMTP id 5b1f17b1804b1-44c9465cecfmr71103325e9.16.1748247622533;
        Mon, 26 May 2025 01:20:22 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1fasm16458356f8f.1.2025.05.26.01.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 01:20:22 -0700 (PDT)
Message-ID: <cc43d9b7-13ba-44ea-9b37-fc54c0d1f2e0@linaro.org>
Date: Mon, 26 May 2025 09:20:21 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: qcom: camss: Add support for MSM8939
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
 <20250525-camss-8x39-vbif-v2-2-6d3d5c5af456@mailoo.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250525-camss-8x39-vbif-v2-2-6d3d5c5af456@mailoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/05/2025 20:25, Vincent Knecht via B4 Relay wrote:
> From: Vincent Knecht <vincent.knecht@mailoo.org>
> 
> The camera subsystem for the MSM8939 is the same as MSM8916 except with
> 3 CSID instead of 2, and some higher clock rates.
> 
> As a quirk, this SoC needs writing values to 2 VFE VBIF registers
> (see downstream msm8939-camera.dtsi vbif-{regs,settings} properties).
> This fixes black stripes across sensor and garbage in CSID TPG outputs.
> 
> Add support for the MSM8939 camera subsystem.
> 
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
>   drivers/media/platform/qcom/camss/camss-csiphy.c   |   1 +
>   drivers/media/platform/qcom/camss/camss-ispif.c    |   8 +-
>   drivers/media/platform/qcom/camss/camss-vfe-vbif.c |   7 +
>   drivers/media/platform/qcom/camss/camss-vfe.c      |   1 +
>   drivers/media/platform/qcom/camss/camss.c          | 157 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h          |   1 +
>   6 files changed, 173 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
> index c622efcc92ff3781d7fc3ace0253c2d64c91e847..6311fc2975aa1345e430a477c8a6476f1d7e5663 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -605,6 +605,7 @@ int msm_csiphy_subdev_init(struct camss *camss,
>   		return PTR_ERR(csiphy->base);
>   
>   	if (camss->res->version == CAMSS_8x16 ||
> +	    camss->res->version == CAMSS_8x39 ||
>   	    camss->res->version == CAMSS_8x53 ||
>   	    camss->res->version == CAMSS_8x96) {
>   		csiphy->base_clk_mux =
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index 2dc585c6123dd248a5bacd9c7a88cb5375644311..aaf3caa42d33dcb641651e7f5bc0c2a564d85bfa 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -1112,6 +1112,8 @@ int msm_ispif_subdev_init(struct camss *camss,
>   	/* Number of ISPIF lines - same as number of CSID hardware modules */
>   	if (camss->res->version == CAMSS_8x16)
>   		ispif->line_num = 2;
> +	else if (camss->res->version == CAMSS_8x39)
> +		ispif->line_num = 3;

> +		.interrupt = { "vfe0" },
> +		.vfe = {
> +			.line_num = 3,

Hmm should we really be setting line_num inline in the code ?

I don't believe we should.

These parameters should be passed from the resources structures.

---
bod
