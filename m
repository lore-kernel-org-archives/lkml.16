Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FB19E7D0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378296; cv=none; b=aDPEDh+d0tt2wygZ/PYEmGIc4IKTFDWC1bfWtuvTQDla8gti5F11qLtefMY8TeDXY95W21KfvCVV502zrbmC+cgfmD0cq+/cL4S3G6IX5dreCJRymKEopaXKpXelYlvPc+KMycgKnsz2iLMNzp8831FcKkT+7bT3BTzElBOv+rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378296; c=relaxed/simple;
	bh=n3kMjemtNSykIJjPqaZz0Hkiu5d57jfz8WFKVa7uBlI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hkzW7kGd3WtwffA9WHwxTQHL/8SfdpRRrYSKFkNez1SY8t+50asgcYYSFBSmzgoRt/iIaMSYV7zl9XbslHVvlFwNKoX8hGeG84fj6QoaXGEViZkMSxKu3ebAmzLIgmfxVBDI682B3FwIRUEuC1QLzwoNv4f58loJdC4cuvSMC34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWuS0ru0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWuS0ru0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso9889095e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744378292; x=1744983092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ys2zmQKpfW4P35WF6lXbQzSiSIW2EulzVdbiG/PaLWA=;
        b=qWuS0ru0Huj6dBYYcaDXHLWz892fHRfR/jvzxu6W/Ff8wDGF6ibmH+xl40WyOhlhzc
         w7G3LSYRNYXVXFk5hReRgefnBNxEVf1cU3mctXECxUcBohTIxG0MoFzfJSe79r/sgvlL
         kAYBKbgkB5oVGxIaFgYgGDshIbRz3oWjCYhHdc99R3tzLHhB1kISHt8uFsrpQY7NwiYy
         OeTUL7uS1BC8JkiBZEXJMmb3aUBGYbttkyhD9lMXFLOSXP/knBx5hEHMl5y+Pceq4H/D
         xg5uoAUz4xJqJl3L+FC48HEPsZTkhSxcuX7HJOMR5KiKOvUcEF9L+Lsi5ZySB2VgZm19
         FQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378292; x=1744983092;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ys2zmQKpfW4P35WF6lXbQzSiSIW2EulzVdbiG/PaLWA=;
        b=RTPQhfs8/PogDAlXhGG5/rVmGFSoifdBPjy7pHG8QNgSS9jIedA44cN7vmU9hPTuT+
         WL97z8RPsqFfehDWHbvFkfJKdk5KdYYwQLXgaJvtgh0NKpuEMXy+afNtU5JBS1HDKLXw
         lIiwNVsCUsP9HkW7Ah6ZyshKzYskCwQNskD43NImhsFjYMjR7Qdmh89NPofDKlLfUEb+
         N9z10fARcQrrqfAhzPAqYmQM2vDYHLyUS6XgLqyYry0jhRTLJz1eUljuzvUfIUEoogye
         UFpjUuxP+Sr9ExERt6NXkiio37SL+QHmIqlgjxpbv/47SNJFtcsEIAbadgyvMBRDIP3m
         CSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt9iltJyhWZI1VbZ/idvznvsh4L+VKIJ3JME96C7xFBxr3eRtejLsGCKxzFcSkj0Wc8tkSFglqLrIqkCk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2fenlH8GWpC3HeFnQFX6ouKZ5DetM3k3GeeH7VifyqQD2sr9+
	4fD3rhVQebTt0K9LDIaD8o6dwhtL7Dt2+zSxFEjL7qJXHupDEAhMFdNWJxzEZms=
X-Gm-Gg: ASbGncvxgBpMlttXBkikKF9QfOExxInIoLsYz1FHxJlwbbQsl6Ko7i2UfDRBCSgJQir
	HsY6szSgxa7dLke1LH7NKikAWVFOr9QdYMwmudw21Zq4frWW4N+gpUE6Q1owXhb6U4mNNY3Shfn
	WFH23gbNJHxg/ivPsrsHmPsjVvGgBO/voa0R41QzcT/nFrpCSJZiGtNTpL43+//+ftVjqBkbP6E
	2Tk/tyx/PNT6it/LLPHcE5crM3Gn2YHkNj8S75jVClRFyGpffNI7FLLmxcdyUkoo1yZs45vgYgr
	Qh/GGN0gwFmJ03q4jOTgTT14KrOcURB0Y66+H/GLGGbz2mmnaz+FmR5XO0E4qLLxrUc0OofMnON
	ORWKg0Dn2usAPLzS0+w==
X-Google-Smtp-Source: AGHT+IHyOrozgsuOzZWZs7ZYmaWQ0usXxB6oIaUXRPRoUskrmrPfCCEyNNzxS9EE/RunI0ffXUHN1Q==
X-Received: by 2002:a05:600c:4fc1:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43f3a9b015amr19324255e9.29.1744378292326;
        Fri, 11 Apr 2025 06:31:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f77b:949e:1d61:69a8? ([2a01:e0a:3d9:2080:f77b:949e:1d61:69a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d6ebsm87521365e9.2.2025.04.11.06.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 06:31:32 -0700 (PDT)
Message-ID: <9f10bc53-10c8-4312-b7f7-2935990fb193@linaro.org>
Date: Fri, 11 Apr 2025 15:31:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/7] soc: amlogic: clk-measure: Define MSR_CLK's register
 offset separately
To: chuan.liu@amlogic.com, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
 <20250411-clk-measure-v1-1-cb46a78d019a@amlogic.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250411-clk-measure-v1-1-cb46a78d019a@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/04/2025 14:42, Chuan Liu via B4 Relay wrote:
> From: Chuan Liu <chuan.liu@amlogic.com>
> 
> Since the MSR_CLK register offset differs between chip variants, we
> replace the macro-based definition with chip-specific assignments.
> 
> Change the max_register in regmap_config to be retrieved from DTS.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>   drivers/soc/amlogic/meson-clk-measure.c | 70 ++++++++++++++++++++++++++-------
>   1 file changed, 55 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
> index 39638d6a593c..30387d26307c 100644
> --- a/drivers/soc/amlogic/meson-clk-measure.c
> +++ b/drivers/soc/amlogic/meson-clk-measure.c
> @@ -14,11 +14,6 @@
>   
>   static DEFINE_MUTEX(measure_lock);
>   
> -#define MSR_CLK_DUTY		0x0
> -#define MSR_CLK_REG0		0x4
> -#define MSR_CLK_REG1		0x8
> -#define MSR_CLK_REG2		0xc
> -
>   #define MSR_DURATION		GENMASK(15, 0)
>   #define MSR_ENABLE		BIT(16)
>   #define MSR_CONT		BIT(17) /* continuous measurement */
> @@ -39,9 +34,20 @@ struct meson_msr_id {
>   	const char *name;
>   };
>   
> +struct msr_reg_offset {
> +	unsigned int duty;
> +	unsigned int reg0;
> +	unsigned int reg1;
> +	unsigned int reg2;
> +	unsigned int reg3;
> +	unsigned int reg4;
> +	unsigned int reg5;
> +};

I don't object, but:
1) could you help actually put a real name on those registers ?
2) why adding regs 3, 4 & 5 if you don't use them ?

> +
>   struct meson_msr_data {
>   	struct meson_msr_id *msr_table;
>   	unsigned int msr_count;
> +	struct msr_reg_offset reg;
>   };
>   
>   struct meson_msr {
> @@ -495,6 +501,7 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   			    unsigned int duration)
>   {
>   	struct meson_msr *priv = clk_msr_id->priv;
> +	struct msr_reg_offset *reg = &priv->data.reg;
>   	unsigned int val;
>   	int ret;
>   
> @@ -502,22 +509,22 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   	if (ret)
>   		return ret;
>   
> -	regmap_write(priv->regmap, MSR_CLK_REG0, 0);
> +	regmap_write(priv->regmap, reg->reg0, 0);
>   
>   	/* Set measurement duration */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
> +	regmap_update_bits(priv->regmap, reg->reg0, MSR_DURATION,
>   			   FIELD_PREP(MSR_DURATION, duration - 1));
>   
>   	/* Set ID */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
> +	regmap_update_bits(priv->regmap, reg->reg0, MSR_CLK_SRC,
>   			   FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
>   
>   	/* Enable & Start */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0,
> +	regmap_update_bits(priv->regmap, reg->reg0,
>   			   MSR_RUN | MSR_ENABLE,
>   			   MSR_RUN | MSR_ENABLE);
>   
> -	ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
> +	ret = regmap_read_poll_timeout(priv->regmap, reg->reg0,
>   				       val, !(val & MSR_BUSY), 10, 10000);
>   	if (ret) {
>   		mutex_unlock(&measure_lock);
> @@ -525,10 +532,10 @@ static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>   	}
>   
>   	/* Disable */
> -	regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
> +	regmap_update_bits(priv->regmap, reg->reg0, MSR_ENABLE, 0);
>   
>   	/* Get the value in multiple of gate time counts */
> -	regmap_read(priv->regmap, MSR_CLK_REG2, &val);
> +	regmap_read(priv->regmap, reg->reg2, &val);
>   
>   	mutex_unlock(&measure_lock);
>   
> @@ -599,11 +606,10 @@ static int clk_msr_summary_show(struct seq_file *s, void *data)
>   }
>   DEFINE_SHOW_ATTRIBUTE(clk_msr_summary);
>   
> -static const struct regmap_config meson_clk_msr_regmap_config = {
> +static struct regmap_config meson_clk_msr_regmap_config = {
>   	.reg_bits = 32,
>   	.val_bits = 32,
>   	.reg_stride = 4,
> -	.max_register = MSR_CLK_REG2,
>   };
>   
>   static int meson_msr_probe(struct platform_device *pdev)
> @@ -611,6 +617,7 @@ static int meson_msr_probe(struct platform_device *pdev)
>   	const struct meson_msr_data *match_data;
>   	struct meson_msr *priv;
>   	struct dentry *root, *clks;
> +	struct resource *res;
>   	void __iomem *base;
>   	int i;
>   
> @@ -636,15 +643,18 @@ static int meson_msr_probe(struct platform_device *pdev)
>   	       match_data->msr_count * sizeof(struct meson_msr_id));
>   	priv->data.msr_count = match_data->msr_count;
>   
> -	base = devm_platform_ioremap_resource(pdev, 0);
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>   	if (IS_ERR(base))
>   		return PTR_ERR(base);
>   
> +	meson_clk_msr_regmap_config.max_register = resource_size(res) - 4;
>   	priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>   					     &meson_clk_msr_regmap_config);
>   	if (IS_ERR(priv->regmap))
>   		return PTR_ERR(priv->regmap);
>   
> +	memcpy(&priv->data.reg, &match_data->reg, sizeof(struct msr_reg_offset));
> +
>   	root = debugfs_create_dir("meson-clk-msr", NULL);
>   	clks = debugfs_create_dir("clks", root);
>   
> @@ -667,26 +677,56 @@ static int meson_msr_probe(struct platform_device *pdev)
>   static const struct meson_msr_data clk_msr_gx_data = {
>   	.msr_table = (void *)clk_msr_gx,
>   	.msr_count = ARRAY_SIZE(clk_msr_gx),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},

Would be great to not duplicate this struct.

>   };
>   
>   static const struct meson_msr_data clk_msr_m8_data = {
>   	.msr_table = (void *)clk_msr_m8,
>   	.msr_count = ARRAY_SIZE(clk_msr_m8),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},
>   };
>   
>   static const struct meson_msr_data clk_msr_axg_data = {
>   	.msr_table = (void *)clk_msr_axg,
>   	.msr_count = ARRAY_SIZE(clk_msr_axg),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},
>   };
>   
>   static const struct meson_msr_data clk_msr_g12a_data = {
>   	.msr_table = (void *)clk_msr_g12a,
>   	.msr_count = ARRAY_SIZE(clk_msr_g12a),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},
>   };
>   
>   static const struct meson_msr_data clk_msr_sm1_data = {
>   	.msr_table = (void *)clk_msr_sm1,
>   	.msr_count = ARRAY_SIZE(clk_msr_sm1),
> +	.reg = {
> +		.duty = 0x0,
> +		.reg0 = 0x4,
> +		.reg1 = 0x8,
> +		.reg2 = 0xc,
> +	},
>   };
>   
>   static const struct of_device_id meson_msr_match_table[] = {
> 

Thanks,
Neil
