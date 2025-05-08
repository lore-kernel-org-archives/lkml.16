Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E651283158
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 16:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746722128; cv=none; b=Q8+XQsV1V4w4XW0dpCjladPb/FBAdvNUC6BadZBhtdAm+9SuZUSE/nYX+/Tpd4JkfLxAD810WtkSlYI5vpbIAH7f5SUCRuGD7zAQxw8hNWBMD4xmU9duRnAJD32ayBO1DuNf+cy7sqPXz/ozLqS/Yaef4xWa+GFLCClwN7ZCucU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746722128; c=relaxed/simple;
	bh=98vXnldu3BmiisoGoWmdX4HwE8ZPCtGTXfUCtn6cp48=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hMPUoG9Ph9MYZnep7z+Z2tWnLblSSz+F7g9jsOqFFrWSjB2wY6qRUeHk8Lo+pWArl0YxwcBOyBNHfthembn0gFJnxSKUUWLtWfjx+VWfpFCdc9GaLRAv8lnrQ9Kf/iQ7b4RDS+g/4B5JT/l5eLnPJXQxO0CXCdLGtGOxeU6+EMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fKvAWwIO; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fKvAWwIO"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2c2bb447e5eso929250fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 09:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746722125; x=1747326925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJL2JF8HNdUlPHdXe0fsgW/lJ8QcVwXtjShT1s+tRu0=;
        b=fKvAWwIOZZXRVUYNSStzOi3BJw7A8E4OtUrMjA1D2/a6J+AvWACIt6t3gjQ+IxoPzA
         D82zXoyT6RpMz6hdqiA6YYMep2sbswh6ZfzVpGK6ZFBs4jdd1DCKEplDP0JhUevPdhEK
         nRVRlG10kCbnIZDAOjCYUynrO0D6RqbmOoiHXyVcApWzv+zUtzP15kC5zQOiFG9/ng/Z
         IMtmr18jvmI8WyuT3J+BYeDcn95ZIt11vKPoikVOrujIz3w4+BJDsNDRTO6E2+Ho39jg
         /1adCX+Z6CAklpNdGowy0crFodCpBtTh4FWz5AjgMuo7/NaDMnf4DXc3zlKc0Tnjerqf
         0Hvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746722125; x=1747326925;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJL2JF8HNdUlPHdXe0fsgW/lJ8QcVwXtjShT1s+tRu0=;
        b=FBJm9wpHotUi6gDKVjZvnvPQU4VJxCKABfTouboSra/Fn86sO0nRj51aCqakMiIahD
         2cVAh/0eA2Z7tLpEjAaAeGZPR5fz7rwVKPQjoRa3Uks7BBdxCeRQb7bix0UMiSyIkMsC
         RT4yYhHS8oq3PfOWHpjMTzklvyWBTjxr0lf4vqQf8+URzjd2Ce3oUo8fcpopzs4DmN1l
         7fVXumMt2AkWVbL0PnqiWZmRzKB+YGmJS4pOuxRBx8NcaT2hvylNu6LoNaEhK79CDgzk
         BdXf9sVg+dOq0055BLxqyqeQAEt+FC1sJL70Mgptlmb6JjLpGLHgDh2thgsHlG4gqyvp
         PqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyVbDQ8wH92pVkDwGE5NpKJe8QOU6YAqZsl28PNPZhEWB4sEVvaqYNq68Us596H8Soz9rrOxBoOi6OBFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLbLDZ3dHmoXROsk3/qZC9+FFk37Qam7j2FWdNvcfw+Za4k6XQ
	xJe4IihnD//fXY3yq3/NcraHIjVARwZpgoG9GBVrf6UWOVemkxOkBpefgt76SaY=
X-Gm-Gg: ASbGncsVpccAswkNsSnoa0DOwU5lRVaoOnTJl4jdYHa0PZC38XLQcVvloCGuNNnHi1X
	guHOhMca1ZoenIgGtRiQPhfSwNlixE8DRuqnaeWvdJ6zCZ58OVu9QiMFTbC/H1b6n8uL2W5X57M
	WG0YWKFSJ4Ol7E0hQzGrNnUQ3pNq8bSv1rIyy+n1kc0pIzSbJInTuUoh0BKOTjgiMOejWCb9Qhf
	WlVcuhPV5jqUqzjunCFY5qbrvWM+iD/u/twHr9j0RIdoxOlh0cHf4RWsktQ42fBuiuO9GUxbT5s
	FQZgAL//jqHPMCMVz/w7uQjWOXJy3czwHr8jfhZlElgSQ0rPAsKkgBwdxP1a50GLlI/4hW0QfSa
	2cfjjJ3A+XysCd5xaZw==
X-Google-Smtp-Source: AGHT+IHIJ0BuysYAybBvMTuPTyGsG2tzFb1OdQsBPE+ejZhEIUsRr/4qjoRxA88gOpIuEzDtbtwoxA==
X-Received: by 2002:a05:6871:648:b0:2c1:ae41:6b5e with SMTP id 586e51a60fabf-2dba42aff39mr110953fac.16.1746722125260;
        Thu, 08 May 2025 09:35:25 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2dba07912fbsm129204fac.25.2025.05.08.09.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 09:35:23 -0700 (PDT)
Message-ID: <d2cdf491-d6d2-49d6-8ab1-34118023f279@baylibre.com>
Date: Thu, 8 May 2025 11:35:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] iio: adc: ad7606: add gain calibration support
From: David Lechner <dlechner@baylibre.com>
To: Angelo Dureghello <adureghello@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250506-wip-bl-ad7606-calibration-v3-0-6eb7b6e72307@baylibre.com>
 <20250506-wip-bl-ad7606-calibration-v3-5-6eb7b6e72307@baylibre.com>
 <c999800bb5f6c1f2687ff9b257079dcf719dd084.camel@gmail.com>
 <qaiqdak4pieewavl2ff4mpr2ywhw2bvnoob55buiinkisacar5@q6jhlb5klcf6>
 <7f5f75c1-7750-4966-9362-2a46c5e5ba3e@baylibre.com>
 <720e300f-f6e0-4c47-8e72-b3ab0a50fbed@baylibre.com>
Content-Language: en-US
In-Reply-To: <720e300f-f6e0-4c47-8e72-b3ab0a50fbed@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/8/25 11:27 AM, David Lechner wrote:
> On 5/8/25 8:50 AM, David Lechner wrote:
>> On 5/8/25 4:16 AM, Angelo Dureghello wrote:
>>> Hi all,
>>> On 07.05.2025 07:14, Nuno Sá wrote:
>>>> On Tue, 2025-05-06 at 23:03 +0200, Angelo Dureghello wrote:
>>>>> From: Angelo Dureghello <adureghello@baylibre.com>
>>>>>
> 
> ...
> 
>>>>> +		ret = fwnode_property_read_u32(child, "reg", &reg);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>> +
>>>>> +		/* channel number (here) is from 1 to num_channels */
>>>>> +		if (reg < 1 || reg > num_channels) {
>>>>> +			dev_warn(dev, "wrong ch number (ignoring): %d\n", reg);
>>>>> +			continue;
>>>>> +		}
>>>>> +
>>>>
>>>> Sorry Angelo, just realized this now. Any reason for not treating the above as a real
>>>> invalid argument? It's minor and not a big deal but odd enough...
>>>>
> Ah, I see what you fixed now in v4. All is OK.
> 


Oops, trimmed too much, that was in reply to my own comment not Nuno's.

>> Why is this not correct? Each input could have an amplifier with different
>> series resistor value so this seems correct to me.
