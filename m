Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B3D433B3;
	Fri,  4 Jul 2025 18:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751655029; cv=none; b=RfS5xdMfKDp6moEPFe+am1lP9H8tTY9rnE/xrg2vO6CjKdR6nA6Cp8OB89ecEpJQIeLedFjl5LYLKQbIaECxUBPCixGC4mDMTZY2q/zFSryXlEw22N0A5vuDfyOP+vt80HwsfuTaaPhJ4FfWtQAjiADbXgPkaSBv2yy/XyYjWss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751655029; c=relaxed/simple;
	bh=nEYwc1VTGcfVPDviy0pXUbVVeHPyAmgcNUEtRwV9eIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izXi3vsKfYkOuwCVZGE7u+Zt6AiLCUukVvj7JsCuMXMVyQvwHKPHU1wAcKwThJnFnh/j2grLu2dwX1JXtlRgoI6wlZhmfmPQ8BUmDQ3rAmpvVK5quAD/7nWMZBHR28vXTD/oAwDeJeNoIdvr8QwvWx5obaCIY3x2FIcs6c5Ti+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=YrN2OT2W; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="YrN2OT2W"
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XlLBuBXyQZ4iTXlLBuO0t3; Fri, 04 Jul 2025 20:40:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751654455;
	bh=OnSSrMdktbh2fXNZWaY2HHusP/khfiopcZcQ51lmSZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=YrN2OT2WlfXaYtgIjJMCjWU35w1ts2kTYrOOSWUpJB6Gf7kHrxJWkIy5uf0hNzEUJ
	 FpoagX2Twl4Cf/WEOIAta/ZUboYpN/CWVQMPNHU6PgPt1chV7wTKaVNBe4bkk/KhTF
	 nkCflaBD8LYQwa+NNzs8ON2CK5UeIqS6YyHdimrRBwDenNtUUF3qvsqK7fviM98PVi
	 fmqIJXn4mx1oYOtc0LbUBSlbAD3aTOEGW/DhXTyYs4DOtSaSYjNUKA9L26UMtYd4n6
	 X6Q/bWwGbTEedhUPs8Vr+vS7WYCM6OhP1pF6IeiLERVxInTaR3bF+K8LFiTtSgj7JO
	 JEhME0BaFBviQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 04 Jul 2025 20:40:55 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <95dad033-4338-46de-b62a-be1db459b0ec@wanadoo.fr>
Date: Fri, 4 Jul 2025 20:40:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] eeprom: add driver for ST M24LR series RFID/NFC
 EEPROM chips
To: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
Cc: arnd@arndb.de, conor+dt@kernel.org, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, luoyifan@cmss.chinamobile.com, robh@kernel.org
References: <f14dfb9a-caf7-4889-a892-6fd61a9a5ecd@wanadoo.fr>
 <20250704151146.12118-1-abd.masalkhi@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250704151146.12118-1-abd.masalkhi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/07/2025 à 17:11, Abd-Alrhman Masalkhi a écrit :
> Hi Christophe,
> 
> Thank you for the review!
> 
> On Fri, 4 Jul 2025 16:12:56 +0200, Christophe JAILLET wrote:
>>> +/**
>>> + * m24lr_regmap_read - read data using regmap with retry on failure
>>> + * @regmap:  regmap instance for the device
>>> + * @buf:     buffer to store the read data
>>> + * @size:    number of bytes to read
>>> + * @offset:  starting register address
>>> + *
>>> + * Attempts to read a block of data from the device with retries and timeout.
>>> + * Some M24LR chips may transiently NACK reads (e.g., during internal write
>>> + * cycles), so this function retries with a short sleep until the timeout
>>> + * expires.
>>> + *
>>> + * Returns:
>>> + *	 Number of bytes read on success,
>>> + *	 -ETIMEDOUT if the read fails within the timeout window.
>>> + */
>>> +static ssize_t m24lr_regmap_read(struct regmap *regmap, u8 *buf,
>>> +				 size_t size, unsigned int offset)
>>
>> Why returning a ssize_t?
>> regmap_bulk_read() returns an int.
> 
> Since I return @size (of type size_t) on success, should I keep the
> return type as ssize_t, or would it be better to change it to int
> to match regmap_bulk_read()?

Hmm, this ends being used with BIN_ATTR() in 
m24lr_ctl_sss_[read|write]() so it needs to keep with ssize_t.

CJ

> 
> Best regards,
> Abd-Alrhman Masalkhi
> 
> 

