Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52789165F16
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743093305; cv=none; b=VaL1xfg7+T+yymVZZr15PZYwe37nkfepsDHmVVIZ1fbnHDiklRfEztH6iHFytBIgazWaVMphcB/ZeQ+DkRDtoxeK5yxaG9PRB7QL895wBDYhObOP9ok1T0CsIgU7MYYI1J22nkcuTTWvs8vpPVtT7uAxi8sGUMx0E48iiiH91bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743093305; c=relaxed/simple;
	bh=yrLrJ07jSyEkRNOIGSnIx6UIH6SW0uwq2gx5Xt6MpTw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eH2b6Thk4kMQhtFlHLAaZLdO8De/2wglV7pjQ+qWs9yF/NbGqUXuhd4stT9V9pHyqaEq9wEdMwEq6zTXmqEtezaKvXSadbPQ59Cu1JfGypD1LODVOIuK6uNJATF+NRgxO/yu80E0uvjMZeYqyiBVptpwTRjwfBFIiLZB9dybpjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Es4wJgpW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Es4wJgpW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso11763695e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1743093301; x=1743698101; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GGjDGhXvhOctDrW1nI1udXGMONQSxA0lH5by2Ntn0tg=;
        b=Es4wJgpWTP8jzV/2d74v1syhkB6P/YbPKpMSQpi+7LHCy3AmT1Hdh+jh8vz4xdzbUp
         2TLKwxYc81UpK8LTlzqTw5tLbjKtsxOrkbAXhZB5v31/tl+UH60puHzPQJ9SMSvpRHLG
         TgbP+GOmJCIPLWmiPdTNy2PJnCEhAYJB3Ss+eM7HNNNePe1AzN+O6VFGCaL1wmyrPsEG
         Ged4/X6chrEGM9B8V9FLwpuNzpyoeYwVMmJb1HLh5ahDDeR4o4ouM/6T/+xDKj4JR00r
         Zhd7HBSIFYaNzZ5xB7DbfadSmxhwgTkKjRLE+cquz6cvQs8jsZIIESTMYDDYfFhsnyBr
         PVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093301; x=1743698101;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGjDGhXvhOctDrW1nI1udXGMONQSxA0lH5by2Ntn0tg=;
        b=mGLfI7G9FBDG40Ymspn6P8fXRW1pRCGqKm7PGOXYkOBGDCv6ts0gV14apHWzhdM+VY
         lMj1j//MZsxQV81jgVRTaPHP0Ce/qeOyCPIa0WOGTocFU582FTYLJYJQQkivAgtWg39Y
         oZT6ff1tLA0wBKtFfaDB4yPt3ixgRo/1vX1XYjLWPbKxsGWC2DF55ECroavdvKgX/eDa
         4xA96v2wtVRpcoM2XfYT69yOL7hy2sMO4yDtY3GM246TKs+nM7wUjAAu/bCTJq2zxtwc
         SJY5cUY0Qqi+YZ80cNpi03qTREOhfhGtjsSFhljYse6db1nVPERqdrdbPLr4yft51BAb
         dQ5A==
X-Forwarded-Encrypted: i=1; AJvYcCVUZpggXEvQ2aqZI537Ek1UNTf1jreaBGM5sxPjgeVVtmmqwWNvaE7GhdZRNh38aXYFAEm7rQJSAKfm5Qg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCqKFDZlBuGRHmuvgHrXq72hZPiiwXHgdUKvj5N2HgA/W9okT2
	VD1eQJwmoGC19dvROmzz7kMTC76XRrSD5YFPrQrUzUskqKM5+Z3yClQuj9ygq1M=
X-Gm-Gg: ASbGncusvaxKD0MQ949IWssddMBWZHjZ2jFFlGHuWc+HA8PxtkgwXnol6U4scd4B/tG
	cnCJgE8bJTu/db1cG1ucEi059Z7U5+/42MyHI189gfzd1OXZmudtKpqBXVtQV7W4/b29KyEkKNA
	txYIF4Ri1L81ajCcXQRcIoXSklK+dSmGlqcvlKFboFtmhzipxdk+tYgkRMOiZb2J3IZnDsl3hVw
	WUQOmkWnPNMIGbI35ZhhxNOQ4aSDG11m2EYw687ArpPIu+9ZfuknQ/RpLV5V2Q6AsYhyLG+PkOj
	O+f42QpxMtATRFDRMZUeoFVpZt/OomKtFBVSE+c44WwaSZFsPP3evhUBr8IGoIsh
X-Google-Smtp-Source: AGHT+IGawtvFBb4fS5ToIj7CyXU2x5hbH3B/DoIrPXE5LcvhbfIugmJW/IZ0c8unwGyuVy6PG4hKmQ==
X-Received: by 2002:a05:600c:3ba1:b0:43c:ef55:f1e8 with SMTP id 5b1f17b1804b1-43d84fb5ffdmr36069095e9.13.1743093301462;
        Thu, 27 Mar 2025 09:35:01 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d7ae6a206sm39611675e9.0.2025.03.27.09.35.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:35:00 -0700 (PDT)
Message-ID: <a66f3c88-0fe7-4e9c-83cd-1fe4bca8b14e@tuxon.dev>
Date: Thu, 27 Mar 2025 18:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] iio: rzg2l_adc: Cleanups for rzg2l_adc driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, gregkh@linuxfoundation.org
References: <20250324122627.32336-1-claudiu.beznea.uj@bp.renesas.com>
 <20250327153845.6ab73574@jic23-huawei>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250327153845.6ab73574@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Jonathan,

On 27.03.2025 17:38, Jonathan Cameron wrote:
> On Mon, 24 Mar 2025 14:26:25 +0200
> Claudiu <claudiu.beznea@tuxon.dev> wrote:
> 
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Hi,
>>
>> Series adds some cleanups for the RZ/G2L ADC driver after the support
>> for the RZ/G3S SoC.
> 
> This doesn't address Dmitry's comment or highlight the outstanding
> question he had to Greg KH on v3.  
> I appreciate you want to get this fixed but I'd rather we got
> it 'right' first time!

My bad. As there was no input on platform bus patch I though this is not
the desired way of going forward. Sorry for that.

> 
> Also, please make sure to +CC anyone who engaged with an earlier version.

Ok, will do it.

> 
> For reference of Greg if he sees this, Dmitry was expressing view that
> the fix belongs in the bus layer not the individual drivers.
> FWIW that feels like the right layer to me as well.

To me, too.

Thank you,
Claudiu

> 
> https://lore.kernel.org/all/Z8k8lDxA53gUJa0n@google.com/#t
> 
> Jonathan
> 
> 
> 
>>
>> Thank you,
>> Claudiu Beznea
>>
>> Changes in v4:
>> - open the devres group in its own function and rename the
>>   rzg2l_adc_probe() to rzg2l_adc_probe_helper() to have simpler code
>> - collected tags
>>
>> Changes in v3:
>> - in patch 2/2 use a devres group for all the devm resources
>>   acquired in the driver's probe
>>
>> Changes in v2:
>> - updated cover letter
>> - collected tags
>> - updated patch 1/2 to drop devres APIs from the point the
>>   runtime PM is enabled
>>
>> Claudiu Beznea (2):
>>   iio: adc: rzg2l_adc: Open a devres group
>>   iio: adc: rzg2l: Cleanup suspend/resume path
>>
>>  drivers/iio/adc/rzg2l_adc.c | 67 +++++++++++++++++++++++++------------
>>  1 file changed, 45 insertions(+), 22 deletions(-)
>>
> 

