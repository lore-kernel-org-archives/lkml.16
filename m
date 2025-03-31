Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64475211A35;
	Mon, 31 Mar 2025 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743429312; cv=none; b=MpHGiVqVPLoiEyiEy2EID3TlYBU3WgI+93n0PvIeBo8g0iI/QKGhOTN/uZEXu/WJNhvDExK2NkTStl6ZbQDxoMbQtclUQ/28vSyBKH5Vpzv1pGW6Nv5zP23nmrq3qM84fFWTXFKVlQl8NYefWJVWqf7+8LlGy4d3TGDBTX5ONb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743429312; c=relaxed/simple;
	bh=xDcPg23gFPzU/v8vj5JYnIBglQLEeikT7XA7zJFPiI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SOjFkKWbpqR0Usj0fvg2eEHRXacsst2fc+vdfIarwz+mDVwSkRrpNa9whMAA6oXzhTPOKINBhY/RcQXkMX3PWEtMSr/9UfMDjp3ZxyLhT1kxSauMTfFMp4+Gfwsg2S7AQu5TASOl7iS8MyixV7SoYeneUkxR9xEtDJ5HRMRhosY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxKO8VFb; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxKO8VFb"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2243803b776so6266335ad.0;
        Mon, 31 Mar 2025 06:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743429311; x=1744034111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cw9qgkgAQMtPCJXWAugK5gQc/tlG9tink48VZwiHy8w=;
        b=UxKO8VFbdJGB43ycKFAtzWOML3pLKWuUFcxzZkWo4o0ohcCpe//n9jUC+J6iKWWJEU
         /3BgWKu9nRgTFIWIgfeSiA2n3J7oRKQI9PZePLmRSbdTFNJ+320BbjC+yKlXSZggXGwN
         tTs5G5zRTt30aeAHkIRKnVk+OLLLqnF2B56Rf/pCYlDW1NRZ9uab80+PTh+YW09glh7w
         SDRWlMbKfTW5oH74kHRG/aXWNuSg68KO29QIZOrbpMkmFZ62ruCLCNpfAcS503RY7vEY
         YIk8Ivs0IsO08M6OudWSQFRXjm89RqXVpYmfE0PtfQtT6PIw2zs8PzQhAL2xael/T48F
         tWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743429311; x=1744034111;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cw9qgkgAQMtPCJXWAugK5gQc/tlG9tink48VZwiHy8w=;
        b=dRvrQMqr+Dx+0xmrwCK/GnGGYFZ5c3HMXLwOjJIN7VWANnNoHFscuJy+qHGhMJGBbW
         qEdeRQn6QeKWwmjdHIqO33VuUAmElN6XBkrZ36/wj4tSMTsvTWumbF3T4dqLKsg8EbNt
         /CWToqMrmbWUtvwSw5ZSXjEd4wEdAQxhZj3tqo/hyYyd7uCpv82/dLo929m3dyCcleCy
         R7UYX2qw7jbZZVjYNFdPxYjHBz9wCEAdkLbg9k6ngZVw+J18+LiaIleC/ItUy73Ga31O
         /2C+oGa94BiDCqGnj6dX40GK+KVyhQ5Z0J2RFJvikcvke/edNjDmUHrRaml+D7gh8iYx
         q1Wg==
X-Forwarded-Encrypted: i=1; AJvYcCV7hsUNCb9jF3UiYVV4VqFnukwPhb4gHfBaNby++8f/M+jFsBrD7yoxAq++MiONAagEz5+ow77l6nUu8SnQ@vger.kernel.org, AJvYcCWqkGrzHyteyzPrNKqs9TVNaCFnbDBWegnNvEHZTkRXEGOemN5gRwcwgsPsGKDyqhQrdxBNtV8hwGPXDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3zq4EKKZ5kbw/aTYKqAhT/3kgNgn3mr30TzBzIOFsz2JHWCJO
	QH0dPt8oAxVS9i7Tb2eM75/GyInXhUCEPociBOth9vjAnhOpEVc7
X-Gm-Gg: ASbGnct5VWqggy14VU105/ebBbFAjGb3tI4u8S3Nx0c1HjUxG7a7DwmdcxOxvIwDFnq
	U845Dmo3/ie5uacdFsOBXxfqBOAV/BRnwoVxxF8dRn722rYsZ3XSWGlS3ZTzecO1oRgvUsxeNdC
	dmaPHQu0sj0T2gYjaIjQHlMTMBQdmUixQnIYCxxiYx1uONbfgP6jyc+OYCHhmEbeZTxj/Ta9dVn
	rLRrIPfqAvV/ecevsNIQgLxHy1eVkhzoysH7FVKsv57npJiVjBonoKnhX8w4oSUfujHism7a7LV
	/Vh+DEodRNMAg8tLy+B4w6YhtF3pyBJI8geyhYkJP/XqMAXu8+ugvMk2PFDrLb3aGR56LoudBBO
	X7mtGfegfidSWX03EOw==
X-Google-Smtp-Source: AGHT+IEBXXGBxiErIjIWWSMtRZXmq0eToLBWqlljaEE0ZNPzm2WxWlT37kRP7cZJEk2mYElLrBa0UA==
X-Received: by 2002:a17:903:178b:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-2292f9e5860mr131421455ad.33.1743429310634;
        Mon, 31 Mar 2025 06:55:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec6f86sm69504435ad.5.2025.03.31.06.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 06:55:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f9ecd621-0a12-46b6-a4d8-7714f65da58a@roeck-us.net>
Date: Mon, 31 Mar 2025 06:55:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH]hwmon: (k10temp) Add support for Zen5 Ryzen Desktop
To: David Hows <david@hows.id.au>, Clemens Ladisch <clemens@ladisch.de>,
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <Z-XvZRmVXMNHgi3e@archibald.hows.id.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z-XvZRmVXMNHgi3e@archibald.hows.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/27/25 17:37, David Hows wrote:
> Add support for retrieving CCD temperatures on Granite Ridge Ryzen Desktop CPUs
> 
> Tested locally against my 9950X3D CPU.

checkpatch:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#50:
Add support for retrieving CCD temperatures on Granite Ridge Ryzen Desktop CPUs

ERROR: Missing Signed-off-by: line(s)

> ---
>   drivers/hwmon/k10temp.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/k10temp.c b/drivers/hwmon/k10temp.c
> index d0b4cc9a5011..cc2ad7a324f9 100644
> --- a/drivers/hwmon/k10temp.c
> +++ b/drivers/hwmon/k10temp.c
> @@ -502,6 +502,13 @@ static int k10temp_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   			k10temp_get_ccd_support(data, 12);
>   			break;
>   		}
> +	} else if (boot_cpu_data.x86 == 0x1a) {
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x40 ... 0x4f:	/* Zen5 Ryzen Desktop*/
> +			data->ccd_offset = 0x308;
> +			k10temp_get_ccd_support(data, 8);
> +			break;
> +		}
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(tctl_offset_table); i++) {

