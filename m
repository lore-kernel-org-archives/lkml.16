Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A717422ACD3
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061242; cv=none; b=qIYc24tVnvtmFKq/4apSHP9W+ZeUZWNCAaeWeCPe2TzK6kBfh9IWPmu7x5jnIEV6t8qPyYRiXN18rTE1ERPmPTM98fdXRjoLzq63vBa9esHh/Kkz98Myka8wUAll6yFqvK/BX+4LMdhqbnJHoX4MTw8b1ScpKsjDmyEPqEA12JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061242; c=relaxed/simple;
	bh=V4Ph5xtnAXExwa0AvHsQNBY96hLABXlDrBOSwKl/GUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pq9gBh4Wzhu57VsIOyimWopIBiHijGlS/vuoIgMMuwzoFGiYX8n/QSQzpUEmlmVD22aSWEYRZ03bLc2qzpdnsZIw6CwhifJXw8N082PZ3p3hn0D9zIALDW/lg33rvsCnwJvV/Y8gCQn5+YfRhymz6Gz78wy4n3oB4/9AE3RLHn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BN/zqeUq; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BN/zqeUq"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fbee322ddaso8478668a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 07:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747061239; x=1747666039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m14oScEaTjZatQKNom70YWJQE9ioUexgQ6aHqmSRsUg=;
        b=BN/zqeUqrqXDS3i7sbj4A93tntjS2lUYe4YIdTli//alO9Xe1SMlTSE0PBmdP84AOY
         dZqKTZoRLYC7GV/TYX+i3D0dJG6f42cLJfoQXuHhYeOZoqumQSdr0KdIiMH9wPfiQ5lx
         QY2wZdc5R5Lw0mciAi2Q84Jqs0kA4xbc9v2y9z34F8OzwFvyCMuH5xlioSOYCbkEvbc4
         Xdk2o2Gw6+Z/M4KGjMlaPnZmyfcct6klZ4EpuP/o3BsDd/8J9UcygcNenNOL7bLb9GE8
         bfmc1Zx+xnZXVHclRebhHpgiQBOARVoXKjSZjx6rQqv5GvuFHrEyMB4v3G1DKNZK7hJ4
         xSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061239; x=1747666039;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m14oScEaTjZatQKNom70YWJQE9ioUexgQ6aHqmSRsUg=;
        b=DNu4u+f50KlnV3lmAbEDCIeOFUt/kdkMoOR0Lw+GNgZNdGuQ1AkVCcwufqcY7U3sHB
         EP3Llt+uoKT7oG2+XOC2xuJIQl8FieHwKKhjyYjtGrOEZHSbg8Cv/WjGd85s/z9RvdOU
         xw245EzP7kh15btMYWropynqmFPwKqx+oe++piO5T2/Uf0/yYNeuDxVt1rpI2/pK1r+l
         ypxMoL6T/nZgtvonu/C43hKSG6eHjJWbwTeHgH02IJGgiuKJ4/1amffSJGRd4L4kGopp
         Siym1Ym0gZ0rzN2odOypq5RbrFVSckFf0pC4Vo1kVfJNiK6IJr5QcqoxxlSXobLL4q92
         AEvg==
X-Forwarded-Encrypted: i=1; AJvYcCX5R6an3Imw5D9KgcxqhVpyDOucX93/kfrG7mdBNd1cH/haG4BG0aweUJcXphd/DSfAgqkePZPaeIMHsH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCwFUa30eylTm9XFb+90I3LcVrnZEkgmdLs246ZEy+SfFz0qgL
	ughalk3DGK1YNOVGIYZZNN7D7fKWOpqdfuwbZe2Fo/lhMs/Aczw1XZAvfCjXFX8=
X-Gm-Gg: ASbGnctqi6XgB3cpSNcSgrHeLr5yaJnQVYnglno4zJ3ndVF4tvKfO64cwP8FltjwAYe
	9I9bfj20mqN2rXjTUYGNkHcN3XUVdKe9e/Hv3FxFpZgt5nbmmVkX/0nHmhgkbbcd3ngH2yQu7Cm
	3MEMcpXuT67vwnYbZW54+iBMhVmSBcHzFl30oL2mMsMMJffVjLhwWIRQF4Lem8k398Dh+IKicxc
	jzBmhA4+19iixPcKrDK2PZP9yd3kuuvvdRXVRS9jMs+QX/lHdGtzuKcOV+m5hJpAzMIRj9pdMpt
	ek7SWYC89tM0GO4uYOYKoRTrwarzJpksQIx3OM5YqYO42ks77PXCzcHE01w=
X-Google-Smtp-Source: AGHT+IE/hLZQy5Y7DCvbr4+of/4o1aU9oPBRNPSjrbd3z0hNDt9f/aX/QapKka7eYc2tafxRyG/spA==
X-Received: by 2002:a05:6402:42c9:b0:5fc:954e:efb6 with SMTP id 4fb4d7f45d1cf-5fca073136fmr10674228a12.6.1747061238595;
        Mon, 12 May 2025 07:47:18 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc26483sm5844513a12.22.2025.05.12.07.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 07:47:18 -0700 (PDT)
Message-ID: <bcf3089b-04d3-40ad-8673-db0e727fa72e@tuxon.dev>
Date: Mon, 12 May 2025 17:47:16 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: at91: sama7d65: Add missing clk_hw to
 parent_data
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1746561722.git.Ryan.Wanner@microchip.com>
 <41611e4b1eb2abd867523f707791292c6cdbc8b5.1746561722.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <41611e4b1eb2abd867523f707791292c6cdbc8b5.1746561722.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 06.05.2025 23:04, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> The main_xtal clk_hw struct is not passed into parent_data.hw causing
> the main_osc to not have a parent causing a corrupted clock tree.
> Passing the main_xtal struct into the parent_data struct will
> ensure the correct parent structure for main_osc and a correct clock
> tree.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama7d65.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index a5d40df8b2f2..1e9d3c393883 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1100,7 +1100,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>  	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	static struct clk_parent_data parent_data;
> +	static struct clk_parent_data parent_data = {0};
>  	struct clk_hw *parent_hws[10];
>  	bool bypass;
>  	int i, j;
> @@ -1138,6 +1138,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  
>  	parent_data.name = main_xtal_name;
>  	parent_data.fw_name = main_xtal_name;
> +	parent_data.hw = main_xtal_hw;

Is this line still needed with the initialization of parent data above:

	static struct clk_parent_data parent_data = {0};

>  	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
>  						 &parent_data, bypass);
>  	if (IS_ERR(main_osc_hw))

