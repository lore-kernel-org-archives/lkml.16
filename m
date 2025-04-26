Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C69D2F44
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745674556; cv=none; b=Wzv16PIj4B8fJ5LvtQWwwon6l2mexrlGBnEPIXmn2Qo5VVhAb4pvCuoxiNbXZ9NGuU4l4Ahe7ToxOW4DoWXasyzrbWSIbLjSEwbufEI+glGFTPVeehhzVAAFCgWfUJzIEZc2VxLKhcsqehphSD3ZfjN/gQ9OdFkQaKnZen1mK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745674556; c=relaxed/simple;
	bh=yYCXS8YQZQjB4/1VmgQsilzMSLtC1TAavLUrwufzZm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXLtEGl7k1VcpVse+P3lUOAfRGbtFALh1Kn5qSOuG+McA0ZVxIosSPxG4qnE+lmCnVEcLV5jXMFrCQwo818Vrwvpf+LkSu3vVNnlpTavGE49hAUw49T7dMD7afwcwtrZ8YlMBVb9gGJizfa3qJp+pTpyEWvwIC1lwMBM5GveVgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KlQN0NUe; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KlQN0NUe"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso5118595a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 06:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1745674552; x=1746279352; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpKqYnXH25f3lqGlUZbd0EpV+dGbWQ4Gs839plYWRIY=;
        b=KlQN0NUemRBsu832EMeh6yyEqeGgVZ4fwQLH3wQT1m5B2scWGir3G1iqQyse3TX7js
         e2R8ckaJP+M8S3eMmUIfMAhobiL/ZuVFDdIRecn5b3xCcKk49y90yY8LTUR/sZWPmnca
         M7BXUNS+t05m0KqfL5NLbrauF1kkHfqIrHGU0YHgUg7DZN8Vjy0DCIehRmntQ8hgYKTu
         MCouS45uVX7FLkB4Yf4g1m8XdB0HSFwBSJMl8km7+D+KhsfnViaHmPSsWSEZR/Q61b9I
         eaDvqSwjSWbkhhOALpXsGn2dED9zPLwLJzGRm+lbChG+kJKHmnwDreb0F9PTYI8ja1vS
         19Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745674552; x=1746279352;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpKqYnXH25f3lqGlUZbd0EpV+dGbWQ4Gs839plYWRIY=;
        b=mCJBKnNAyxEI19Ss7YXIjvf7z+mD9UzgTjKOovHHsvWxtOFRq+FdUB+6I6brRE72m1
         w2qsluLcvddXLD7zu8gVjo4w4OrT531RjO8KhSsBfZcLliEn8WNmnylMXPN0Ocn1fZK3
         PA+JpaGr4Y2olBiYvC642xPgzGPHRGwZgOPGOvm1QJ+XvBJWUQto5Ck//1PaAmbB7Ig1
         WHkRyhczQfB3hOXQPKrpxRzs2Oj1jfP9I0Yh8xwXLDBNJPgM4ATHcTcWlf27vqu4551J
         EpzV6OTZePiZbAdXDVksKlGFJk81HQofWb5sEba/kq+sPVyneaZ+6/kMwT1YIVz7fN+Q
         /sJw==
X-Forwarded-Encrypted: i=1; AJvYcCXQ2b0o5rOqNK8nC+hj1jDdPc380UknoA/9AYwrJnd3hsQvTvoBcPkt1uk+R9EQyfuvdMVbrlcuuCy86Cg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6HC1Ci09Z8C7CzjMaTRbYnGmECQBey5qLJmuC+ugOmjBFVkpq
	eit4LvoCILyeC8bNf3bdvj33vZd7/NaRFV+RBSWiuk0Qbbqz3zD5Xpf4Jk2J8YE=
X-Gm-Gg: ASbGncs6o1NFE0ei0WVP5hFJF86umllfpxchl4Q4eAblXns0rrhUWoQMUOC5IcJEKsN
	RfzEeeU+pIZuHiBIAuokHLITBCSoq3hyIS9uovy3S2gkd4lK/75grwzaTxT2YtkYZeGpvbjxKT5
	Na3OhpH70mxdjbY1IezNkriRsCxYjnnhqdOM85U2/2SsVNSYorlqlYo/VN6+xacgASyXMxlHJH3
	Qory4Z45hAnanX5KnBYH8GYaVzBTCnepP6gdxnR/LJsDbr/f4grM0MCe7cbn5O6GAukUicuAQKe
	pVdfeYCDQzuQM6z5Yu5X+oPuzrrHK/4O3ut+IU6MbNhHodeBLapYG8AzEvJi
X-Google-Smtp-Source: AGHT+IEqy1Bjndt2pvxsKMV5+EcxiW6j9NOhnrynY2cN18NYigRKOQiOJgaMqvmfCZqpsJ/rAvLIew==
X-Received: by 2002:a05:6402:4286:b0:5f6:23d2:e6f7 with SMTP id 4fb4d7f45d1cf-5f723a1346fmr5017034a12.32.1745674552326;
        Sat, 26 Apr 2025 06:35:52 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035464e6sm2639700a12.64.2025.04.26.06.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 06:35:51 -0700 (PDT)
Message-ID: <47b54406-42d8-41cd-a561-9073db09666e@tuxon.dev>
Date: Sat, 26 Apr 2025 16:35:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com
Cc: sboyd@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <cover.1742916867.git.Ryan.Wanner@microchip.com>
 <d634ae4f72bca022e205b03c01415e90fda0bc01.1742916867.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <d634ae4f72bca022e205b03c01415e90fda0bc01.1742916867.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 25.03.2025 17:55, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> The main_xtal clk_hw struct is not passed into parent_data.hw causing an
> issue with main_osc parent. 

Can you please describe the issue?

> Passing the main_xtal struct into the
> parent_data struct will ensure the correct parent structure.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama7d65.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index a5d40df8b2f2..08306261c9c7 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  
>  	parent_data.name = main_xtal_name;
>  	parent_data.fw_name = main_xtal_name;
> +	parent_data.hw = main_xtal_hw;

I think, from time to time, you can still hit some random failure as the
parent_data.index is still not initialized. I think the problem may be
solved by doing something like:

-	static struct clk_parent_data parent_data;
+	static struct clk_parent_data parent_data = {0};

Can you please check with this?

Thank you,
Claudiu


>  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
>  						 &parent_data, bypass);
>  	if (IS_ERR(main_osc_hw))

