Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9F1E7C3B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744922933; cv=none; b=kWgUxop3B/n1iK+CF9ipMCGZnLShdFR15njaknEj8qhI4cPAe/9uX2Eb6tahPgy0GQ28MuFfKz1wKLX+0HJkvFA6b5Agvm4Nx/cvQMza3GfoEyyWgy0SD7Ov+jjKiyj5OpMapZm78m2GGNYQbg3j6FZXTkQ3LL0Wh6ve8VAom+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744922933; c=relaxed/simple;
	bh=SE6VYeO161Lchp9XqCW7wK4j3SfrihWV7uyQWpBrpwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ck/SinQkv4GU3fG2KCh0H0rkwmWGj/olTmdHQQlz03iKu/mcfqa50qncOAPz8lPLUguigQAkzjcRHeVDpXp26kIfCdCrSczHOTZFTaoeIyjr1nDWXTazh1D4k+7drzKYM7mdKzVc+7v5auFPh42YwjOPe7YGTdkm4xSH0n1POro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Pkg1uAzM; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Pkg1uAzM"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3f9832f798aso731832b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744922928; x=1745527728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AkhkFAogJf6rcZdrKyxj+n2pOOqU53PozCIK3xijJrY=;
        b=Pkg1uAzMvJIiRigpxIR5+/iH0jxoJHiCRKnxVlTNrsLTR3l/cnNbSm3dVLv3Jl9GoX
         4rx3/ExsooVw0ep2BgKNVScaeywkg/i0moalZFcFpQf6ZkMYVLnJjn5xKHiPPP0sQBV9
         vtehn65imb0MwkxzVlG86BVhTRhJrDFTwVxS9bZ8T6/rmKcAzVgIP7FcHK8JGWE8J5g+
         bgNbqgh8PHsgO/FKK83srAGoBKvVD+E3G5CbbFtUdJ6MsIB0G37EDlPbgrAhkWUBdWd3
         ZymCn1dneBSYG//dBzeWQekmv7+p+dKFdy8lOWN7Yf/6PkEO9J0eC6w5OZZqV2FUXkrM
         4hJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744922928; x=1745527728;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AkhkFAogJf6rcZdrKyxj+n2pOOqU53PozCIK3xijJrY=;
        b=LdoxXBMQ0NSowLQZOcDZQEOe3HH867wIYT9IEUrIwDxfJE9QvK5ZcuzW6tsb4FjgDz
         TxgnfDO6GPD5qTf9u/vieeJpVAEpZ3qFqKIG3z4TVVMdebrADo/1/gx2WaQSOECNqulZ
         P1CTtC9IVIMWlI1uqjM8Pt8aav4h9obdcCOBwBSJjTGSZHfbUyXgnJVNI0H0Sn41Mgfp
         H5C5Pp3j+sDlEiNpx+bULP0rxbxpiu9O2ziIWi86UbZ2VtKFlm7/rugoPhRm1irm4waT
         Ku4oYFgh9J/8Rt1tgOxaW60bun0WzVdEZEw5WW57NhjJzZ6FsjVxGb+gM4mdkqhHhTAO
         8mWA==
X-Forwarded-Encrypted: i=1; AJvYcCXW3SDz+91BIFFOFpSEk78ewdjLse/greBiXStkl2nktmooNjlOQSQUQmvHuNODGeb6b3LN6LwS4krTiiM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV0sIgYWHS9SeVrxgJyyDtNaHVIJ9F+gDnUN7cm9ZajZ3p4Ax+
	ifvm5ElDESay/IpKwbccr6r1ZVp7Pc9Q+GJJGuCSNJY5qEdZTHXEU9Ji6vBuv4Y=
X-Gm-Gg: ASbGnct9rbF/43XK5acBU3FQk+hSnAKeBWEYo41IhsIFCn5XPsqTwCPEL8XaKCKwlis
	Bw45+F8mUfbPzMbapCsWpB+zaInAmYZSaWGLTEPbkHPmunGJrFBJ4z2xMNLPoaW3SF2EkUBeqew
	1G0J938SGIuRPTopqNjKAv/s6fYqJkfGOSLXr/eVXDf7Tel8k4avXFYetGFfCmcEMtanJmumoL1
	wDsNhGt4SF4jdXY+gux+6x/EV49WYP7YWhvXXkYrY3AZ/GITh3xPpY0Rp2x/Nu6Rkt+pyh33vwK
	bd4wuseCEl+Su3qCpoEIcG7peE53S8IbYHdmAn+DDTpHed6cjKYR1iGmb/8xcSqEKjp7tAfspuS
	7b1b3r3XNz2JPOwTegg==
X-Google-Smtp-Source: AGHT+IF7ZjPtLD+LrakaPKE8P6Ie7Z9AHBDyOGjvviQeXkjr+Jv27cdNwkf/cTlSFR3UJfutg615hw==
X-Received: by 2002:a05:6808:4a84:b0:401:2e2d:cb54 with SMTP id 5614622812f47-401c0c3f94bmr111311b6e.29.1744922928611;
        Thu, 17 Apr 2025 13:48:48 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d52135b8b4sm115918fac.17.2025.04.17.13.48.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 13:48:47 -0700 (PDT)
Message-ID: <651b1f91-fd5e-4d59-b78b-fdd7f89247e4@baylibre.com>
Date: Thu, 17 Apr 2025 15:48:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] iio: imu: adis16550: align buffers for timestamp
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Tomasz Duszynski <tduszyns@gmail.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Andreas Klinger <ak@it-klinger.de>, Petre Rodan
 <petre.rodan@subdimension.ro>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
 <20250417-iio-more-timestamp-alignment-v1-6-eafac1e22318@baylibre.com>
 <aAEzeY_p6a8Pr-zn@smile.fi.intel.com>
 <f4db1a95-106f-4fa4-9318-3ee172e29cdb@baylibre.com>
 <20250417184429.00002403@huawei.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250417184429.00002403@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 12:44 PM, Jonathan Cameron wrote:
> On Thu, 17 Apr 2025 12:07:37 -0500
> David Lechner <dlechner@baylibre.com> wrote:
> 
>> On 4/17/25 11:59 AM, Andy Shevchenko wrote:
>>> On Thu, Apr 17, 2025 at 11:52:38AM -0500, David Lechner wrote:  
>>>> Align the buffers used with iio_push_to_buffers_with_timestamp() to
>>>> ensure the s64 timestamp is aligned to 8 bytes.
>>>>
>>>>  drivers/iio/accel/bmc150-accel.h | 2 +-
>>>>  drivers/iio/imu/adis16550.c      | 2 +-  
>>>
>>> Looks like a stray squash of the two independent commits.  
>>
>> Oops, sure enough.
>>
>>>
>>> ...
>>>   
>>>>  	struct bmc150_accel_trigger triggers[BMC150_ACCEL_TRIGGERS];
>>>>  	struct mutex mutex;
>>>>  	u8 fifo_mode, watermark;
>>>> -	s16 buffer[8];
>>>> +	s16 buffer[8] __aligned(8);  
>>>
>>> As for the code, would it be possible to convert to actually use a sturcture
>>> rather than an array?  
>>
>> I do personally prefer the struct pattern, but there are very many other drivers
>> using this buffer pattern that I was not tempted to try to start converting them.
> 
> For drivers like this one where there is no room for the timestamp
> to sit earlier for minimal channels I think it is worth that conversion
> if we are touching them anyway. 
> 
> Jonathan
> 
There is actually a lot more wrong in this driver, so will save that for a
separate series.

