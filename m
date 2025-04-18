Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E9026B2C7
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744965464; cv=none; b=t6HcxBGEkPUxs6O2BEeWU3wBg23BnZV6HwwJRDG2DP0OJPeJkuTkKIeqC9mAaS1UZQa8P4HBq+JbQfkHT/YcHEw3CB3Hb7iA7srKOF5qNdicuJ0F5Wp7aTXDAWEKhYVbrYgypJa0s/Bkx7zKe+5DPaMwscDDUNScpyqDKhV1iTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744965464; c=relaxed/simple;
	bh=9wFd+LWaeWbb8ByS2WTwvKaa9Aazj1pXPEB3WNZjVzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKQLkCH0lFEoDd89i1t41RLEPyryeSgG2hKuYJ/25X+ZSRjgNQpCI2wCGJIegZYu4psgZlgIZauSAMTODSugeE42aOBIWhc8EMWI1C+GTlGB0Gysrdnq0xZc6e9cNJNKXlpSful+Cbbab6L5FZun+9MJkgJF98na1VA2orn2RsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7MMKEc5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7MMKEc5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so12642005e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744965461; x=1745570261; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H338YpIXIN0Gvnxx0CNTxMSFWd6J6lOzxWOZLc2fN3E=;
        b=f7MMKEc5en/GP/4ZgRucQJmQw7hfysdCimw6S47n/pSgl8NmgFJD0dsdnrWmODgljN
         R3CXNOJse2S8Wr7M+U8XwDKwjRf7BVmLdEU4ZhROYDp4M4/e2/ijgKNUIBka4yZItvah
         ZZgxNkS7iHNM7RQ0w+qvneroMC76cvdg9zKEDarpdeWuE22yhEx6+YTQ49+GnuE4jzho
         jNOLnlAM5KyOPtjFnZIoTxjNfB0/DuZlNwOGd6iJgcvPY70EDnn5sE5Ktwr+4SVg3hgh
         bBuiMs8yPsUSUCCUJUBTyp5l+aex5CCimmWU+QAl5Q9Vp2BAyK6cDOtZjdPqTQc/wE01
         1zlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744965461; x=1745570261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H338YpIXIN0Gvnxx0CNTxMSFWd6J6lOzxWOZLc2fN3E=;
        b=SzqQAU+cIqu1pWHSgqPYzO2Glb5CqDlQrLWHb+2bUB0hxAD/S5QnsAnISn+HfnFkac
         TkPGAbajmQAYRIser+gEqtF19GHvoMsESOWMrXwO3XrGs0lFde3iWsruhZZQHuZG1+5t
         caT/zjtIdnV5QdaY291hygBcc5anBhOa1tzA6bhZZ8IU8ilYWd+IBWD6M0DncYPO2BYn
         ucD8P9JuBpq0s8vILPPFjwYmQe1VdgOs9jouAu6yiEtSDIA9N632X/4m3ysNM4m5qmL7
         ORVwYTw5oGHjgtJXOpj51uYMy3nSUthb6xbXwzcIeVXQOlpZJoY1X12WFWGDAsJWLZmW
         1GAA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+dkbJUmWfl1hZ6NRGUh7UERYATxrGvjXAyoEqRHhgDBqPHb5+HIvmhqu7DcXBvxEr3qQ663NM4A8s1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdbqSkCVyVagMQEbHJszmmhtDqaZBM35z+CbpzL0HzVrebJqps
	TKaZxeR8KwJ+f9fXJTORqUZ74L0Ld9e6Iv0x7f8Q5pFq5u4gTzXkbFn23ackoBA=
X-Gm-Gg: ASbGnctCT8DQ8XfYJvtvptV0yFoDNzueg37RPsTO9YfLZGXkOs1LvPMqWAQBvg8jDd3
	XpGW11D/eRSg1nLRgG95yASQ+QgjqI9rS3vvRyWwy31a9GfAAojbK2nY9yy2aYTj6UsW5supDes
	c2QUCN8HpgqM10h+bViMKBEaNtya2gVSGoASI56Lzu2RyBtQzisqhUzkGFa0m4matzNQ/0JHteR
	mMBERgcvXK6lGJuyR3PGH6+/z1+30JqvWlqp4pXz2x+X1Oix6P70vBWwJy84am9uiU219Pt7zDJ
	ylA3w0ImYrHWGYBbwmCFXUFEkPK8371k0Wu1LiIZzlutoypIBokNvX7X5Qf2OgZlQWjMBFRSFRe
	p/xk=
X-Google-Smtp-Source: AGHT+IHiLpagTJs2SbpQ7T/yPM+PTl/lUYMdfib3CeXF6j4CoViiiMG4uhTpPH8XNuL/o5PBHm8qrg==
X-Received: by 2002:a05:600c:54c7:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-4407076031dmr2922635e9.15.1744965460792;
        Fri, 18 Apr 2025 01:37:40 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5acec8sm13487175e9.16.2025.04.18.01.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 01:37:40 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:37:37 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH 1/6] thermal/drivers/sun8i: add gpadc clock
Message-ID: <aAIPUcS_cNRHoxwq@mai.linaro.org>
References: <20250411003827.782544-1-iuncuim@gmail.com>
 <20250411003827.782544-2-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411003827.782544-2-iuncuim@gmail.com>

On Fri, Apr 11, 2025 at 08:38:21AM +0800, Mikhail Kalashnikov wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Some processors (e.g. Allwinner A523) require GPADC clocking activation for
> temperature sensors to work. So let's add support for enabling it.
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  drivers/thermal/sun8i_thermal.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index 226747906..1f3908a60 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -66,8 +66,9 @@ struct tsensor {
>  };
>  
>  struct ths_thermal_chip {
> -	bool            has_mod_clk;
> -	bool            has_bus_clk_reset;
> +	bool		has_gpadc_clk;
> +	bool		has_mod_clk;
> +	bool		has_bus_clk_reset;
>  	bool		needs_sram;
>  	int		sensor_num;
>  	int		offset;
> @@ -89,7 +90,8 @@ struct ths_device {
>  	struct regmap_field			*sram_regmap_field;
>  	struct reset_control			*reset;
>  	struct clk				*bus_clk;
> -	struct clk                              *mod_clk;
> +	struct clk				*mod_clk;
> +	struct clk				*gpadc_clk;
>  	struct tsensor				sensor[MAX_SENSOR_NUM];
>  };
>  
> @@ -417,6 +419,16 @@ static int sun8i_ths_resource_init(struct ths_device *tmdev)
>  	if (ret)
>  		return ret;
>  
> +	if (tmdev->chip->has_gpadc_clk) {
> +		tmdev->gpadc_clk = devm_clk_get_enabled(&pdev->dev, "gpadc");
> +		if (IS_ERR(tmdev->gpadc_clk))
> +			return PTR_ERR(tmdev->gpadc_clk);

			return dev_err_probe();

> +	}
> +
> +	ret = clk_prepare_enable(tmdev->gpadc_clk);
> +	if (ret)
> +		return ret;
> +

Why calling clk_prepare_enable() ? devm_clk_get_enabled() did the job no ?

>  	if (tmdev->chip->needs_sram) {
>  		struct regmap *regmap;
>  
> -- 
> 2.49.0
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
