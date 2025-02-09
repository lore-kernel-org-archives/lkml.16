Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6971119A
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 19:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739127912; cv=none; b=BulkKMpUVhW7ddn1pcW42HxIvAkAQKdaKY77tzxFk4t0qaEhchSY01EmEp3pcSqbf6lZbcGBbElhTKd5Is27ibyAZRTgDZJysnS41om+sxtjWfO0Cfgk8knSvcZulDQiOCy7Yq02W5ttY4qg1dURXC2xPjk0b2o/btBJe4WVl4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739127912; c=relaxed/simple;
	bh=tO443QVXlFWLQZzpp8MDDYbUAEc3gKeOAG0AC46AoWk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=davj6g9THz/NVM0TxMdj5C7fwY/Gk8rFGdAzwT/k50y8vs/gYBNlXvJUXhthh6kMu8mA/ktat7eLGD1r5LUFDhMBoBaXP6rmhQ04VDrxn3WkgIQovcn9sgSlvvvEaNaAV5Yw3C1zl3pS+lzYNgYNxCxlvUf5Qg6YXnENPzP7jj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GDHLNNt7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GDHLNNt7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso3623749f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 11:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739127907; x=1739732707; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DOgrqfsjruWBU8I+dOd1YugI+z334YIgbaObFFiHDqo=;
        b=GDHLNNt79nLWxuNLsgbUi4WeYHfUm8cYx+7vYqimuTPdT+1Oy10IJaZX6Hdza8CV2/
         gfEh4kipbho5YH/9CULzQY5tK5/5wUCYeK+YcNi8A3WrIwGtrDKt1rvtMQ2livrtDt93
         Tawm6+Is2DsGMyL5MzMJrKzWehtFO6o03nARSbhrAZTGjeAhCvVoIrryi8vw59U5RQAK
         DuV2UDzH76sdY37iEafqC1kov7Talmn+Zy7CXlBuI1zSP9RMneEsA2Q4TOhSeCVaNlXW
         XAf4i8nasYKQrG2udwAuKmcwyrWXWdL3cHOFG9/H6JN3vhP7asp8j1FiyO4lQSascQ3J
         AO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739127907; x=1739732707;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOgrqfsjruWBU8I+dOd1YugI+z334YIgbaObFFiHDqo=;
        b=aTcg4+J11RYiR7LWYP49KQQ3oXtFBXt3+V0rYQTYMrrIjFwp1DpKgABZCdSd7REEZV
         F7y5RwBAvp2BN+S0rbZH7hy9zCjhuOWC9p4BBh0nXL0Bc4quN7w1Rs9u/0Z/R05K939r
         6wXArSQH7LiFsuEF41kCzebgmX3oqa8ZTGPQDlvdVnw9qre0YR18NsVu5yZcXR07pnb8
         NqDF+6zQL88qMF3Efuy4abKXWYh+9FzwZnbrwMzqkNM5aK18vTB8VjCyxD/1qJiI7ZTj
         EvFwcg6EzLbaOUmJ/gGC2ule4074n7cGDwLoSAsp2quytB8U2cgDCusP/SGn1ZSsZszd
         iWkA==
X-Forwarded-Encrypted: i=1; AJvYcCVtiTzpXFNDWyHecL2SX9EWi2IriXTRaod7sj1iJVD7r/tK3TPCkeqbk4/8LBQbJ1JKYXEitNpbJLIdtig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEKKuB/RVzFxFfmIlvuXAhK824JZjgyk2ONowHl0WZ3VsYfHHm
	BYUrHBifxJI+aDqnhaULs6+E8lSBEzrpgKKB/MkYQVgEBgEG4Txd+W0/fNCYT2s=
X-Gm-Gg: ASbGncsyMneaTduDW13OZdETDEFJ98BVN0fqJTD8vGaOfeezMmASjVz4wHRPNvtM5l0
	jejZ2AXAepa5vNO9OkxWBarS8EMYxddI1e6i2YRiJp7ov34hbY+haVnA/5NeQ7VZFYFq7AaR8wU
	0B1ZO+94bf/wLH+F0TJVSrFMeo7y8o6cWzPmJPvJtWNakigAAztqi9A4LJBfiFfSoWq1qVCi1W3
	xL79Fxc/LAUpkQ1QNOPjhQyyGgDHdAIlGoEYs9uro/EcKffh+U+obwi1GMLF3s9IPI9xNX+LT1l
	+0rttuvBfGTt7w==
X-Google-Smtp-Source: AGHT+IHIDgs582fYiTnMyFA1Xfn5fJtr1bzDiCb7caNzZEYgyUddfTzyipyRqs3rh8ROJQOCY9Y0qQ==
X-Received: by 2002:adf:e60f:0:b0:38d:ba8f:1ebd with SMTP id ffacd0b85a97d-38dc9135a06mr7424042f8f.34.1739127907134;
        Sun, 09 Feb 2025 11:05:07 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a1c:15e0:43ce:c34b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fd0dsm10209234f8f.75.2025.02.09.11.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 11:05:06 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  linux-kernel@vger.kernel.org,  Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 1/3] regulator: core: do not silently ignore provided
 init_data
In-Reply-To: <5857103.DvuYhMxLoT@lucaweiss.eu> (Luca Weiss's message of "Sun,
	09 Feb 2025 15:16:17 +0100")
References: <20241008-regulator-ignored-data-v2-0-d1251e0ee507@baylibre.com>
	<20241008-regulator-ignored-data-v2-1-d1251e0ee507@baylibre.com>
	<5857103.DvuYhMxLoT@lucaweiss.eu>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Sun, 09 Feb 2025 20:05:05 +0100
Message-ID: <1jwmdz0wim.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun 09 Feb 2025 at 15:16, Luca Weiss <luca@lucaweiss.eu> wrote:

> On dinsdag 8 oktober 2024 18:07:01 Midden-Europese standaardtijd Jerome Brunet wrote:
>> On DT platforms, if a regulator init_data is provided in config, it is
>> silently ignored in favor of the DT parsing done by the framework, if
>> of_match is set.
>> 
>> of_match is an indication that init_data is expected to be set based on DT
>> and the parsing should be done by the regulator framework.
>> 
>> If the regulator provider passed init_data it must be because it is useful
>> somehow, in such case of_match should be clear.
>> 
>> If the driver expects the framework to initialize this data on its
>> own, it should leave init_data clear.
>> 
>> Warn if both init_data and of_match are set, then default to the provided
>> init_data.
>
> Hi Jerome,
>
> This commit is breaking USB on qcom-msm8974-lge-nexus5-hammerhead for me.
>
> I can't easily provide the full log since USB is breaking with this but in
> effect it looks like in drivers/usb/chipidea/core.c in ci_get_platdata()
> the call devm_regulator_get_optional(dev, "vbus"); is always returning
> EPROBE_DEFER, so USB never initializes.

Sorry about that.

>
> This vbus regulator is provided by ti,bq24192 so the bq24190_charger.c
> driver. While the driver does seem to probe correctly, I do also see that
> warning "Using provided init data - OF match ignored" in dmesg.

Well the driver does this funny thing of passing init_data but also
setting the of_match.

Looking at it more, your driver provide init_data/constraint here:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/power/supply/bq24190_charger.c?h=v6.12.13#n718

Apparently this constraint is only meant as a backup/default in case
nothing is matched by the platform, which would explain why your
platform through the trouble of passing an empty regulator node to
override it.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts#n116

I did not really expect that but it seems intended indeed.
Revert is probably the sane thing to do but it would be nice to have
comment about that and maybe a debug print.

Mark, do you want to revert this directly or shall I submit the change
for you to apply ?

>
> Reverting this patch on top of v6.13.2 fixes the issue and makes USB work
> again.
>
> Regards
> Luca
>
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/regulator/core.c | 57 +++++++++++++++++++++++++++++-------------------
>>  1 file changed, 34 insertions(+), 23 deletions(-)
>> 
>> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
>> index d0b3879f2746..a58a9db3d9c7 100644
>> --- a/drivers/regulator/core.c
>> +++ b/drivers/regulator/core.c
>> @@ -5681,32 +5681,43 @@ regulator_register(struct device *dev,
>>  		goto clean;
>>  	}
>>  
>> -	init_data = regulator_of_get_init_data(dev, regulator_desc, config,
>> -					       &rdev->dev.of_node);
>> -
>> -	/*
>> -	 * Sometimes not all resources are probed already so we need to take
>> -	 * that into account. This happens most the time if the ena_gpiod comes
>> -	 * from a gpio extender or something else.
>> -	 */
>> -	if (PTR_ERR(init_data) == -EPROBE_DEFER) {
>> -		ret = -EPROBE_DEFER;
>> -		goto clean;
>> -	}
>> +	if (config->init_data) {
>> +		/*
>> +		 * Providing of_match means the framework is expected to parse
>> +		 * DT to get the init_data. This would conflict with provided
>> +		 * init_data, if set. Warn if it happens.
>> +		 */
>> +		if (regulator_desc->of_match)
>> +			dev_warn(dev, "Using provided init data - OF match ignored\n");
>>  
>> -	/*
>> -	 * We need to keep track of any GPIO descriptor coming from the
>> -	 * device tree until we have handled it over to the core. If the
>> -	 * config that was passed in to this function DOES NOT contain
>> -	 * a descriptor, and the config after this call DOES contain
>> -	 * a descriptor, we definitely got one from parsing the device
>> -	 * tree.
>> -	 */
>> -	if (!cfg->ena_gpiod && config->ena_gpiod)
>> -		dangling_of_gpiod = true;
>> -	if (!init_data) {
>>  		init_data = config->init_data;
>>  		rdev->dev.of_node = of_node_get(config->of_node);
>> +
>> +	} else {
>> +		init_data = regulator_of_get_init_data(dev, regulator_desc,
>> +						       config,
>> +						       &rdev->dev.of_node);
>> +
>> +		/*
>> +		 * Sometimes not all resources are probed already so we need to
>> +		 * take that into account. This happens most the time if the
>> +		 * ena_gpiod comes from a gpio extender or something else.
>> +		 */
>> +		if (PTR_ERR(init_data) == -EPROBE_DEFER) {
>> +			ret = -EPROBE_DEFER;
>> +			goto clean;
>> +		}
>> +
>> +		/*
>> +		 * We need to keep track of any GPIO descriptor coming from the
>> +		 * device tree until we have handled it over to the core. If the
>> +		 * config that was passed in to this function DOES NOT contain a
>> +		 * descriptor, and the config after this call DOES contain a
>> +		 * descriptor, we definitely got one from parsing the device
>> +		 * tree.
>> +		 */
>> +		if (!cfg->ena_gpiod && config->ena_gpiod)
>> +			dangling_of_gpiod = true;
>>  	}
>>  
>>  	ww_mutex_init(&rdev->mutex, &regulator_ww_class);
>> 
>> 

-- 
Jerome
