Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99978F49;
	Tue, 29 Apr 2025 00:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745886452; cv=none; b=dliF335yYmD/jfm8lgaofeLjgoYK/dxjMATzHdZD98RGGrMErGSmPndav/9SuBX/6MwS3a8K6JO9hM4YhBLpVnMDowFAdGzVg05umvYeNzX25M4CAFKrGnZMDuoR9Mbc4QgG5VJrJN4Kns/76MHXBVxM8Xu1+Fr0x3sE47jiz6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745886452; c=relaxed/simple;
	bh=STqvQqB9VdqroVIjQ9O9iSgbyf9AE7dywx0Kt9YQ/X8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pIGYlfsva+64bgNVs+/zLcvQXzdW3XQyMC5A7KZIaGS6b7o3e4SmLo871f+1CpQGOtQdy6DMg/qoQUq2sna2ZBcqO9k9qrnReqhKpO56bm4Q1Bi5L/b9kB+Ac4kLLM8O+i53Hl5hsD1tw3+X78Yc5/mdkbmXUSAQozGiLRPQZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYB0D0Vu; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYB0D0Vu"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b1396171fb1so3447171a12.2;
        Mon, 28 Apr 2025 17:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745886450; x=1746491250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=E4+/s+VEvuC5FXOEm8slr7X2s/XWFR6SZw6sxO8nbRQ=;
        b=YYB0D0VuZ3KJGi4qdy2mTQ16YPsvNmA12TLOytAFVVE4bwEnXULip/cVnz9uqxcLVX
         zTOfHt7zh/VFIDqNQJWXtGVzI2LHq3/7AZgqudpgSPo2B0mGqhjiMzbxuMHdO+RT+V9T
         /+y5Z/mfFWt7CKy0N2IG6EtN6pU28tp9VS9xR72IMjogCX0wJdUcnJ13suxtPIFPCOqi
         uOMgVFeX2EvUn/U6qHAdaL1+a7+iB6SzToPVeXBWFJHTWz7MtDgSUFlZrOUs33lxayyF
         6s+ui3+AFrC+5QKaxa8MBdFV2zhKu+MN+oHPYU6maS3D980gFIvbwB2nGcIJ0ZXWZkvT
         Yuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745886450; x=1746491250;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4+/s+VEvuC5FXOEm8slr7X2s/XWFR6SZw6sxO8nbRQ=;
        b=KROGODL21z1Nql+J7ZkVqlzkv6L7oZe/RA1Kl6QO9Z9ej4/Po+pRCutSFLZIbCgzPW
         O1fNWLJRc6is6PCFyyV1bGjLWUuW3OgWAe9iVcOWa4n+DYx7iSfFYsiDyQV/OKL2j6VL
         /KoY2MTBWU+LdMze5qP+xT2McZRoj9EelencWkPCVVaGPziuNu5UsU0984X73td+M87w
         Austus6XpuYPiYolrPs7WM91w5nMGSKd39c6A0As2RufJvgG0V5mK/ZF5Wu7+SYuXx+G
         SxGjwIV6oPT/Y4y4VtrRSjz7kyQvSH4ag2ALFK/tm2LM7ymhBCq8jH9TZl0C9pCgWb5K
         jLFA==
X-Forwarded-Encrypted: i=1; AJvYcCUFvLAn7+SnERBczbYpQRId/TNgBfkrV+z1oJ+O/pKevfuL+Til65QHac4ah/Rtvv2VjPCEr+TAzR5++Do=@vger.kernel.org, AJvYcCXI0z40bDWhqMfL5tBUq7tJVJ//4P4TdZeSYfnfAwIK+0Q1mmStrAExlffGCTT1uGawwEkl2YWFj4A6o0RT@vger.kernel.org, AJvYcCXRZs3aioD4mXKxa7vMhxqBE4mTvr6hQy4Y8bV4hVEanSNvjjqvnCCJMH026VJPoMQzuBvuzsX6OjrK@vger.kernel.org, AJvYcCXVxSQQ8uAFbLuZp8/DJtQJgMWVY8OitFzNMKmmnuEDflpd5UOgIQMiwRHIoFpd6CuDHw+GvFJYEbsV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5x7UfhBD86XHhoSJS8trbrpRXXFej3OyenquZMYompa+55zZW
	OIxSVBgde9v1HTJggkt70IWSPkwnxX/jm8eejunGMzjUWtG3yNuS
X-Gm-Gg: ASbGncsT0Kc2ShTHOIPanwozpfCRqx0kP33tXTdtwYU+yDCfbi819wPwqyRCYf3GJ6K
	LsEYJx515a5/aYN/zWnYsjn6WJY4sdZFKhRdJnCxVd2xYi17rUL4GJwr1Dfl8yx3LL51qXznTuL
	aDXB/3xDTyqcbimgQRB/6BbsIXBBQrEhQYBTZ8VME1kQrnKZv49rhJMotp6XI7xbNiAb44kAY6x
	iF+b7Xo8A2HoNWhVMPmny166oxTzw0mPyBuLaw29T6aXy6ZdQQF9hoEqINhzXnF3n7Tts05TRKG
	nPxcwXIQ9kZ5lL0+RD4gnb6G4b/wwismI1LKSdK0SJN274LMOBg+y/v8QwWAJLbfi/QZuMu7O0V
	aJymWjT8dbcIElg==
X-Google-Smtp-Source: AGHT+IFtMnFRx2QYnId/i9jukQX75HwClFDq2N45fA22F6PtOr/3Qugyj+Xg15EKW+yWXErhqcb+JQ==
X-Received: by 2002:a17:90b:554f:b0:2fe:dd2c:f8e7 with SMTP id 98e67ed59e1d1-30a21551e90mr2678098a91.10.1745886449916;
        Mon, 28 Apr 2025 17:27:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a244bf043sm150486a91.0.2025.04.28.17.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 17:27:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec2dbc97-664a-4eee-80cc-929f13f80129@roeck-us.net>
Date: Mon, 28 Apr 2025 17:27:27 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] hwmon: pmbus: mpq8785: Implement voltage scale loop
 configuration
To: Pawel Dembicki <paweldembicki@gmail.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Shen Lichuan <shenlichuan@vivo.com>, Greg KH <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Charles Hsu <ythsu0511@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250428221420.2077697-1-paweldembicki@gmail.com>
 <20250428221420.2077697-5-paweldembicki@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250428221420.2077697-5-paweldembicki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/28/25 15:13, Pawel Dembicki wrote:
> Implement support for setting the VOUT_SCALE_LOOP PMBus register
> based on an optional device tree property "voltage-scale-loop".
> 
> This allows the driver to provide the correct VOUT value depending
> on the feedback voltage divider configuration for chips where the
> bootloader does not configure the voltage scale.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>   drivers/hwmon/pmbus/mpq8785.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
> index e6a643856f08..6e2325d7f37b 100644
> --- a/drivers/hwmon/pmbus/mpq8785.c
> +++ b/drivers/hwmon/pmbus/mpq8785.c
> @@ -78,6 +78,8 @@ static int mpq8785_probe(struct i2c_client *client)
>   	struct device *dev = &client->dev;
>   	struct pmbus_driver_info *info;
>   	enum chips chip_id;
> +	u32 voltage_scale;
> +	int ret;
>   
>   	info = devm_kmemdup(dev, &mpq8785_info, sizeof(*info), GFP_KERNEL);
>   	if (!info)
> @@ -105,6 +107,14 @@ static int mpq8785_probe(struct i2c_client *client)
>   		return -ENODEV;
>   	}
>   
> +	if (!of_property_read_u32(dev->of_node, "voltage-scale-loop",
> +				  &voltage_scale)) {
> +		ret = i2c_smbus_write_word_data(client, PMBUS_VOUT_SCALE_LOOP,
> +						voltage_scale);

Per PMBus specification this value can be in any supported scale.
Also, the chips do not support the full 16-bit value range. I see 10 bit for
mpq8785 and mpm3695, 7 bit for mp2853, and 12 bit for MPM82504. There will
have to be some device specific range check.

I don't understand the units. The devicetree document talks about
VOUT_SCALE_LOOP = VFB / VOUT * 1000, but I don't see how that translates
into chip values. For MPM82504, the datasheet says 1 LSB=2mV. For mpm3695
it is 0.001/LSB. I have no idea how that is supposed to translate to the
units suggested in the property patch.

Either case, I think the property needs to be something generic that is well
defined. Maybe "pmbus,voltage-scale-loop", but I really don't know what would
be acceptable for DT maintainers.

Guenter

