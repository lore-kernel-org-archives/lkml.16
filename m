Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278D221F06
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960490; cv=none; b=i6OexPw+pv1D/+se6nsxz8NYa75ClVHgmHHIAIXZvuuZOdKx/gTCXtGrsL6e3VLK+M7vRWRrmnbU7k+E7GG+rnyUYb/Mutnp7Bd6GVm6uLKAAJiWDxOcnilhyKr7w2BJm1q8SxEPmxkx7CabO164A29EOm8PptasDFFVvNApCdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960490; c=relaxed/simple;
	bh=e6WAD+Q9fgYgM9twIfuBVafvCYc3m9ocAUhLVKu4J3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3VmJzxdIVExip2ma21NYLR7EcsPKDvdl7gkiX+DlVNpKxJj7dHMlaLXuF+GFkV3Sr8UihdFf19DVlEvZer7MNa1fBcdMCpV2CpVQceK59pHSsDiZLSTbOz9ra0OchhTugU1xmPnrWdXipvhv3QogvoW9qFM6OncRkyqVU1BT38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pwGIzinz; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pwGIzinz"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1913514f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748960487; x=1749565287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7NVC+W/4cnhRBLtqaKDb7hylurSPoDltgbkfNZRJlpg=;
        b=pwGIzinzyHpjd2i7PTy94N6MbdR4RJNprabCnaZLZ0WTGZD+iu80tSp+MHNfK8jcOc
         tfye4Xk9SqjSqegoTraQGOK1757y46rK5nfR/5n7BhaZ+geyJr2sZHb6vXYLLtI/zplq
         vXWukLGClWoSSy4ubVF7JvWky/XYijIvbNoqvT74WDEeIKu55tYwtGYF4JfdzDo6tmAo
         LEGWafHo7G6ZXnJNuqf0WLWBiOzQ3tnQYLyjphMON5bdtJ0oEU+R81BioWsLCYfWopV8
         RgrS7VOpdNfZAnlI2Mndyt/3SjKcAmr4G+r673rlol+xFaiMw+YsfY/Gv0qb3eqi/f7I
         NsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748960487; x=1749565287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7NVC+W/4cnhRBLtqaKDb7hylurSPoDltgbkfNZRJlpg=;
        b=WFufzHeovnYEvsypXSeV4YXPGWoPwo973VEfUSvjgRXVgxjDZFMuI0I1mlELJj73MP
         b2y7H3p9a7KR8W9cLwzoxfsaLrGlfHKUxeQf6SKHWboli0WxqqGYVmAUy+w1Kg+h6yFx
         mwbKmrGKclhuAq0zCjhbQtAkOMN3ATAzqczu786FeAVnzxSlhieXWd+cuuWwX/Avw+BA
         nHjdBafhAg4bVwUcm6fmMFzHlT9hQA7d/+dsdRLX5kdO//97p1QGg+AHJlTcRxj0M/aF
         ETV6ZrKas/RzoOcjUuqXRrrCfs58sDK4CbluLdUc9PY+Cb4ZOODyCZQ+bEQC0eTErzet
         q/zw==
X-Forwarded-Encrypted: i=1; AJvYcCXT3t5m66qvY1i12Ub0CV1R/DMNGsvMMfMRU2dzhfsbk4YtOfgl79t3Co8HEfA5JT+ZIwkdIarl+2fn/wI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2nQ0vuMOjVPrRCpSKjkUUbO8enk2VPEJMl3K+IA06MEpQN0rO
	O++iEzLPgnJnAXoojrMwwQTqnFBEhLC9v1uUfMsJH76Rp7khMeuFHlt8K7YR94FEs7k=
X-Gm-Gg: ASbGncspOMJMWQMu7LqxE830VqqpJzW5xFL1OQIVzMfOZVKI6i3+y0H7XvlPIMvi4pp
	1N43uT5wrmdWf1Dq1AoVpIyLQFEVHnlcLREperH3RP9+E4p5NAmw9Cez6ZHKokMMA+r0i9PaxsY
	MRJGl2YLOH1f1x+Ws766vYu+NKhoIfD5KSiKVI4WmHpxJKmjIPopk3XPvq7uOZe3aXM4CKv09DH
	Rk5z4YTV+8U9yOn1K8/4iOJrQv4wmpJMiAqFfRUg5zIpunfSjhjJCnd1hkfFtI2HVfUoIHWOGah
	VAdGYDGJrVpWhdGqvBr6hXahvQsuW8mQA3QWFsQvZXQdh6q1INGXCQyYSISF7cYXvmc7BCLwjPZ
	LdfgFgdRyLdVjKCXP
X-Google-Smtp-Source: AGHT+IEKFABCfqGZPw1pdZkAPW/9jkRTXt6KG5zOR1VmibYZx2XavidfNIWW2YTZrnfCCg3BT43GEw==
X-Received: by 2002:a5d:65c7:0:b0:3a4:f7af:db9c with SMTP id ffacd0b85a97d-3a4f7afdbd9mr11191637f8f.59.1748960486164;
        Tue, 03 Jun 2025 07:21:26 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5005aa64esm11349954f8f.70.2025.06.03.07.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 07:21:25 -0700 (PDT)
Message-ID: <e6517c54-9163-48d1-80c2-4fd964dac349@linaro.org>
Date: Tue, 3 Jun 2025 15:21:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] soc: qcom: geni-se: Enable QUPs on SA8255p
 Qualcomm platforms
To: Praveen Talari <quic_ptalari@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
 quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
 quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
 <VgXAbpS__r4C24FLFz5nqCPgygil3nr3-oNHbL7bQxE0X1GnDStFaWlnts8iSxCeG6TCqa8mzIFqOysqIlWeJg==@protonmail.internalid>
 <20250506180232.1299-4-quic_ptalari@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250506180232.1299-4-quic_ptalari@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 19:02, Praveen Talari wrote:
> On the sa8255p platform, resources such as clocks,interconnects
> and TLMM (GPIO) configurations are managed by firmware.
> 
> Introduce a platform data function callback to distinguish whether
> resource control is performed by firmware or directly by the driver
> in linux.
> 
> The refactor ensures clear differentiation of resource
> management mechanisms, improving maintainability and flexibility
> in handling platform-specific configurations.
> 
> Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
> ---
> v3 -> v4
> - declared an empty struct for sa8255p and added check as num clks.
> - Added version log after ---
> 
> v1 -> v2
> - changed datatype of i from int to unsigned int as per comment.
> ---
>   drivers/soc/qcom/qcom-geni-se.c | 73 ++++++++++++++++++++-------------
>   1 file changed, 45 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
> index 4cb959106efa..b6e90bac55fe 100644
> --- a/drivers/soc/qcom/qcom-geni-se.c
> +++ b/drivers/soc/qcom/qcom-geni-se.c
> @@ -105,6 +105,8 @@ struct geni_wrapper {
>   struct geni_se_desc {
>   	unsigned int num_clks;
>   	const char * const *clks;
> +	int (*geni_se_rsc_init)(struct geni_wrapper *wrapper,
> +				const struct geni_se_desc *desc);
>   };
> 
>   static const char * const icc_path_names[] = {"qup-core", "qup-config",
> @@ -891,10 +893,44 @@ int geni_icc_disable(struct geni_se *se)
>   }
>   EXPORT_SYMBOL_GPL(geni_icc_disable);
> 
> +static int geni_se_resource_init(struct geni_wrapper *wrapper,
> +				 const struct geni_se_desc *desc)
> +{
> +	struct device *dev = wrapper->dev;
> +	int ret;
> +	unsigned int i;
> +
> +	wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);

It should be an error to depend on more clocks - which are specified in 
a descriptor down the bottom of this file than MAX_CLKS allows.

> +
> +	for (i = 0; i < wrapper->num_clks; ++i)
> +		wrapper->clks[i].id = desc->clks[i];
> +
> +	ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
> +	if (ret < 0) {
> +		dev_err(dev, "invalid clocks property at %pOF\n", dev->of_node);
> +		return ret;

return dev_err_probe();

> +	}
> +
> +	if (ret < wrapper->num_clks) {
> +		dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
> +			dev->of_node, wrapper->num_clks);
> +		return -EINVAL;
> +	}
> +
> +	ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
> +	if (ret) {
> +		dev_err(dev, "Err getting clks %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
>   static int geni_se_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct geni_wrapper *wrapper;
> +	const struct geni_se_desc *desc;
>   	int ret;
> 
>   	wrapper = devm_kzalloc(dev, sizeof(*wrapper), GFP_KERNEL);
> @@ -906,36 +942,12 @@ static int geni_se_probe(struct platform_device *pdev)
>   	if (IS_ERR(wrapper->base))
>   		return PTR_ERR(wrapper->base);
> 
> -	if (!has_acpi_companion(&pdev->dev)) {
> -		const struct geni_se_desc *desc;
> -		int i;
> +	desc = device_get_match_data(&pdev->dev);
> 
> -		desc = device_get_match_data(&pdev->dev);
> -		if (!desc)
> +	if (!has_acpi_companion(&pdev->dev) && desc->num_clks) {

There is no desc in this file that has !num_clks I don't think the 
conjunction is justified.

> +		ret = desc->geni_se_rsc_init(wrapper, desc);
> +		if (ret)
>   			return -EINVAL;
> -
> -		wrapper->num_clks = min_t(unsigned int, desc->num_clks, MAX_CLKS);
> -
> -		for (i = 0; i < wrapper->num_clks; ++i)
> -			wrapper->clks[i].id = desc->clks[i];
> -
> -		ret = of_count_phandle_with_args(dev->of_node, "clocks", "#clock-cells");
> -		if (ret < 0) {
> -			dev_err(dev, "invalid clocks property at %pOF\n", dev->of_node);
> -			return ret;
> -		}
> -
> -		if (ret < wrapper->num_clks) {
> -			dev_err(dev, "invalid clocks count at %pOF, expected %d entries\n",
> -				dev->of_node, wrapper->num_clks);
> -			return -EINVAL;
> -		}
> -
> -		ret = devm_clk_bulk_get(dev, wrapper->num_clks, wrapper->clks);
> -		if (ret) {
> -			dev_err(dev, "Err getting clks %d\n", ret);
> -			return ret;
> -		}
>   	}
> 
>   	dev_set_drvdata(dev, wrapper);
> @@ -951,8 +963,11 @@ static const char * const qup_clks[] = {
>   static const struct geni_se_desc qup_desc = {
>   	.clks = qup_clks,
>   	.num_clks = ARRAY_SIZE(qup_clks),
> +	.geni_se_rsc_init = geni_se_resource_init,
>   };
> 
> +static const struct geni_se_desc sa8255p_qup_desc;
> +
>   static const char * const i2c_master_hub_clks[] = {
>   	"s-ahb",
>   };
> @@ -960,11 +975,13 @@ static const char * const i2c_master_hub_clks[] = {
>   static const struct geni_se_desc i2c_master_hub_desc = {
>   	.clks = i2c_master_hub_clks,
>   	.num_clks = ARRAY_SIZE(i2c_master_hub_clks),
> +	.geni_se_rsc_init = geni_se_resource_init,
>   };
> 
>   static const struct of_device_id geni_se_dt_match[] = {
>   	{ .compatible = "qcom,geni-se-qup", .data = &qup_desc },
>   	{ .compatible = "qcom,geni-se-i2c-master-hub", .data = &i2c_master_hub_desc },
> +	{ .compatible = "qcom,sa8255p-geni-se-qup", .data = &sa8255p_qup_desc },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, geni_se_dt_match);
> --
> 2.17.1
> 
> 
Other than those minor details looks pretty good.
Please include me in v6 and I will review further.
---
bod

