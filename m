Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAA71DE8A6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839961; cv=none; b=Sjgq2t9BNN6C7s7F5JJ7g5smh3ZY8h1lFtmCtVGHr605pgned3Z2zW9jzev690LRga99rNCnam9JveXOEST/Ly2v4TWxlLfeI6fmPfnVEiB8RTs3f1EPEKYcnzW1y7A/+hDI9GNIcgWRI7l9/II9KBZLyTWmv5KMIfi2BCecdh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839961; c=relaxed/simple;
	bh=Ir2MVdbmo/b4UDviWzXQ71fWGSN2ZSG7Gn5CR39TeO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrwfwSgYg1iAsWfU6Y6DD78vpqQNEftyLzxuPg5oQqa2osEfRT+5wUS8V4b86X03WNLmbH/3ysGAER1HpFd9mf0++Y7xE2TO155joL5/LuqJwSjwLVmUqG3Jj33mvVucn5EQvPyf1o7nzoiN6ywXoITbKC8BNKJgrvUBudzZIIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Sv/YSHew; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Sv/YSHew"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2cc82edcf49so1505600fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747839958; x=1748444758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FNM4AdBa+GtBGS+Rm/l5dOnnE3L33VAp4Mn0qr/3Iw0=;
        b=Sv/YSHewOXOWpnSaPD3aVcnWkykaJjnsls86+P3izQxFiI2QX4N1+WKgWLi6Okf9K0
         Ee9Ek7CDFeH5rkqqmDMzpiX/+W1GlVnlEu3BIGIwJWMWaPPHizBPCRqrYqtmpNX0a2Sy
         IbbzM7O1XKwrTWXLPR8YbOCRkY62S6KPGtLlr6SlkwY6sYhNUkubdwiXzAH/ILUpZ39u
         UTTQ6eXNFgQ1P/klefde944nzeYdvQIJSkIt/xkpiC5OeiI14V6/ofNQVMXj2+4wtP+R
         2cHkiFpn/bOhLaMbopy/4xjgsiPCwhcs9ntLo1fcmP7V/LNTJeSS4wTDksX6p//gVmI+
         5Wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839958; x=1748444758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNM4AdBa+GtBGS+Rm/l5dOnnE3L33VAp4Mn0qr/3Iw0=;
        b=GrvmLgdKGgKNLhsbqekLV17Ib/ZFl3fS138cPbSscKhNW27R/0cu7OP8PC7PqQj4ku
         XuaYvf7Bd6ewX4eJAM8TQwjDBtwAPZRpy0FVdy2B6XOmfJ5P+5piftgWcAsPUAOXWK4A
         KjXvtxrnxI9vFCl+jZgcLfjVsQlDw/vSNBUKLSt0GXHgpy0E2gfuI99b/lbANpps6Q5G
         Hf5WOOdT0SzDLzKOj/RrKloAeGmxwbiFNiDit8LtzsW9F/51a3L821hYUXFrdPsOo+uR
         NZDqeu0wnFlkeE6LqaeG7CjYF9cbwAWM+QBy3Xr2dMZ8M5r8yl0wUpM5lrfqRJgUsz3F
         dwiA==
X-Forwarded-Encrypted: i=1; AJvYcCWaq9j6qA7LseSA3M2CRO4lE0a7sNnh5AZTzmdzP/Lqr2nOkBfOsUX57Ovtk4p5vEjSwgid1JOIyPguZw8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz45yl0u+tQ7QCsf572QUDn7Wi9NgFlwbJB3WAHeqg33JtjxHU4
	M5kCNVNMi8zVVi8N9oqvooP5uSvMkRLQG+fgig2mk2RUJE5vsIgX/RL+m8yOdEgVibQ=
X-Gm-Gg: ASbGncsYXFRVxdcIaJ3WbMAL1yuF1zta69mW7Wh5gYjxVOqNLcHq+Voy82jARN0+7Kx
	GRABnQEvdSwabCat0AE7uPb8W9PyZ6QhueVnXhjPcbTicphns2lBJTNEWiRJJJoUUiHE5wQSDXB
	gFg4V8RoPgcaZjtVi+l8kXUrGZHSI+47SM/YcJ5035+FtHGED/7Nk6OUbFqWXKqe8b48ubVRoYu
	H4OW1JDETjxz+j/WNTzrAWLBKxz34nZLDdWqhKq3eSPTaizEvCnKnJxDDeCDiHkAAZxvQo3O1D/
	9iFCyOdsQMPUj6M32WahxmuQDoWD/c7I0hun+1WjKwJhKJdQqWcIUyD50XkmlrBsMX95gOGGvUu
	mObYS9RPnbq9pzxjpcgTbJdRPJA==
X-Google-Smtp-Source: AGHT+IFnZRH+Hh5lq3DEVSL/82U18YO7cHWK19WHaRYgQFCSmEQepHDCKm6lJxK/KahPr8I4MbpEwQ==
X-Received: by 2002:a05:6870:fe81:b0:29e:6f32:6d91 with SMTP id 586e51a60fabf-2e3c8566451mr12486245fac.33.1747839957682;
        Wed, 21 May 2025 08:05:57 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff? ([2600:8803:e7e4:1d00:d77b:6acc:2ad1:8ff])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2e3c0b2c853sm2681647fac.50.2025.05.21.08.05.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 08:05:57 -0700 (PDT)
Message-ID: <d2803c4a-d4ee-47e6-9bba-2d042051f980@baylibre.com>
Date: Wed, 21 May 2025 10:05:56 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pwm: axi-pwmgen: add support for external clock
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250520-pwm-axi-pwmgen-add-external-clock-v1-0-6cd63cc001c8@baylibre.com>
 <20250520-pwm-axi-pwmgen-add-external-clock-v1-3-6cd63cc001c8@baylibre.com>
 <zdltaexty6pzbqesoluuyluygyt6w7nq7r2wccmtfktppwuw3e@qb36fsu3jq4k>
 <0dd1a97e-ff7c-4d09-b18e-5df9944488c6@baylibre.com>
 <p3ejuwktdxcjwv43nnap5tin33ziimgxfan2xoghtaaubsxgy7@tjmwjpwy6yy5>
 <6b72e9dc9d574aa1f025c0f5d317dcec1d729ba9.camel@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <6b72e9dc9d574aa1f025c0f5d317dcec1d729ba9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/21/25 9:22 AM, Nuno Sá wrote:
> On Wed, 2025-05-21 at 15:54 +0200, Uwe Kleine-König wrote:
>> Hello David,
>>
>> On Wed, May 21, 2025 at 08:19:51AM -0500, David Lechner wrote:
>>> On 5/21/25 4:22 AM, Uwe Kleine-König wrote:
>>>> Can you achieve the same effect with the (IMHO slightly nicer but
>>>> hand-crafted) following patch:
>>>>
>>>>  	ddata = pwmchip_get_drvdata(chip);
>>>>  	ddata->regmap = regmap;
>>>>  
>>>> -	clk = devm_clk_get_enabled(dev, NULL);
>>>> -	if (IS_ERR(clk))
>>>> -		return dev_err_probe(dev, PTR_ERR(clk), "failed to get
>>>> clock\n");
>>>> +	axi_clk = devm_clk_get_enabled(dev, "axi");
>>>> +	if (IS_ERR(axi_clk))
>>>> +		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to
>>>> get axi clock\n");
>>>>
>>>> +	clk = devm_clk_get_enabled_optional(dev, "ext");
>>>> +	if (IS_ERR(clk))
>>>> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get
>>>> ext clock\n");
>>>> +	}
>>>
>>> The trouble with this is that it would not work with existing .dtbs
>>> that don't have clock-names set. I think it would need to be more like this:
>>>
>>>
>>> 	axi_clk = devm_clk_get_enabled(dev, NULL);
>>> 	if (IS_ERR(axi_clk))
>>> 		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get
>>> axi clock\n");
>>>
>>> 	clk = devm_clk_get_enabled_optional(dev, "ext");
>>> 	if (IS_ERR(clk))
>>> 		return dev_err_probe(dev, PTR_ERR(clk), "failed to get ext
>>> clock\n");
>>>
>>> 	if (!clk)
>>> 		clk = axi_clk
>>>
>>
>> If there are no clock-names, the parameter is ignored. (I didn't test,
>> only quickly checked the code.) So passing "axi" instead of NULL should
>> work and yield a more robust solution.
>>
>>
> 
> Are you sure? If there are no clock-names and you pass an id, you should get an
> error back:
> 
> https://elixir.bootlin.com/linux/v6.14.7/source/drivers/clk/clk.c#L5198
> 
> 
> I know it's not exactly the same we're discussing but of_property_match_string()
> return -EINVAL if the property is not found which leads to an index < 0 and thus
> of_parse_phandle_with_args() also returns an error back.
> 
> I think I'm not missing anything but it's always a possibility.
> 
> - Nuno Sá

Testing agrees:

Given:

	clocks = <&some_clock>;
	/delete-property/clock-names;

And:

	axi_clk = devm_clk_get_enabled(dev, "axi");

We get:

[    1.190040] axi-pwmgen 44b00000.pwm: error -ENOENT: failed to get axi clock

