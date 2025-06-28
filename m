Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856A01C84A8
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 23:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751153434; cv=none; b=CR8SdviTIYTCIBymH9VczqfjYGdecKVAJx/5McQNm+JBGasbk2fpElob+BK3LOl56UsDc285viX+o0Coq7VUQiJHPWiHdePu78rmVyVNcPqi4L1mJpl5SibPuUS1G3N3THiLr4ZXAiRM2pSej6RgRepc1DNPtwP1uDBBGEd5WMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751153434; c=relaxed/simple;
	bh=0L3TcnOnAT37xurn4zHF7Uelnh1A1OIPxvlh7Hv5QGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eg0WNXg+Fu/FipeXk5GvknYsQGRJtrvVihMVVtQFfeVJoxcSOUaIGNAyJ9drXu4CFrfcUFbKsEjrP9P1qPF1BZHzB5vftCFy8K+ad1fF38gasE4/9Ba8pka/U222l6E4GdKF74tr+HPsGA8L6snHJU6enhydTkewQ/+akHFE4ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eJMIj9kG; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eJMIj9kG"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2e9a38d2a3aso1015972fac.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751153431; x=1751758231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LV2whTVcFBv8HGVSk50MOoWwYm/BUMUzIcy7LK/5Gk=;
        b=eJMIj9kGY+TCzlzUxoZ9vT58J5vLtzhtCwnoVWwn+6IKmnb/QVg08tLzfh9y/rp1/2
         Kwivh55qtslzt3hnv2QKN7Dx66w89ZV9FKjMQ3EFL0IpVAAzL3qht7hSpuuPZRh7hWco
         BwUwulm/iZijHB61og4RFmUxP0M3SmJ3OFy24UM2LZS/fLXh3s/JAoojTAoGXZf3SC/X
         YdfzUdEZa+Nb5bnKW/Ea4NdtjufBok7ESgfYpYel/CNQBDxh0yxKchin48Dk8YWQslTc
         mROnDP+8iCOBggSrRghyoTr/eSAKebCBLExQWrZCB7VatLAUm8YP8I4aq4k0ckiAsneS
         iXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751153431; x=1751758231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3LV2whTVcFBv8HGVSk50MOoWwYm/BUMUzIcy7LK/5Gk=;
        b=VQtbC3IaK4bg3tn00IfkjoHU362k9Wy7vAjTRzr5phuUKynt0xkCpbL1lqKQtEgDzh
         HNJI69EykPTafCMi7ZV40yeEGii36eZ/dlHZ5RRWiXnNRkPwFFJStCEzDHuf8QoEyF9+
         7tbl3gx9WiW+UaqPhV7+45tDi1CfUELcVwxs1E0BeyFAtmJqldF0GkufxRgZt4WI8BNW
         HNgeBay2neO0Cb/6DpKSpG9GwBfHKBQHW9sWRWjWA+w5Xh06QlxAbY98HKART4ETwyuJ
         uEpXdiMWf2gHN49efp7C2U8GfdUdBwMXzoQ+GF8aWIavlIIWAA1WyPBgRqgP03BLhNK8
         7fPw==
X-Forwarded-Encrypted: i=1; AJvYcCW54xA7kNleafi3KiksxhRP8qhHO2T8lwKigffzj3tXN3+yH2YuWrqhapFQ/nz6aE3+zfNlbA8BfTHL5Mo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyI5Kvrx/CfCtFSIajmheXbSfyVevuxgL3Tby4XPrkmx9DjpW
	os/cvKVePxgEJVzREvBd0ePf3cHfeL755cGXVgEjlXQaBur/WgLVQ56wjbc/ele4jyc=
X-Gm-Gg: ASbGncs0dAsG9H7eXxVKp7gX1M5rJYbMXUaLe+fgnutpSInsD56bptPkSOO9MuER6ZT
	bGKxAW2BYzZN5OtWCXOsu6lez23RnyJ4/+1FMre/0GO6BwVHKGVVIcezcUM8WFmK5f62cJxs5Qd
	GEjpxTgJtdm6zxLHhDW2W1baFJCvGTgw24g2NiXntYMMK9Eu/is+H7uw+tzoE4NtwF42dJONiCt
	afbzA3sqiCc0eyhza3n+UxtVQsbzv48mSkB9qqLgmK1fXQ5QcB29smmLVnDi7Yn68Qi4DLZH0ti
	aWUig32yga4vTwpx/k179uaMFvqlSIAApEbLoSGRK0RrHJN7zGpMYTFo0jy292mXHdPhU+XCuUM
	8rRjtaXJVohZDRR4Tvhk3EilNklSm2MK4xuswFIU=
X-Google-Smtp-Source: AGHT+IFPRb5c72fGGjzcl2TWNpxe5UqjFvHdpbDERh59UE43Z4EhY5vjoD630Wsnz6iYSlvBePYWyg==
X-Received: by 2002:a05:6870:cd89:b0:2ea:7101:7dc1 with SMTP id 586e51a60fabf-2efed73119bmr5062597fac.33.1751153431549;
        Sat, 28 Jun 2025 16:30:31 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4? ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50fa38asm1750229fac.40.2025.06.28.16.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 16:30:30 -0700 (PDT)
Message-ID: <bd72b92e-bf8d-4fc2-84ae-4f9fd8b40c37@baylibre.com>
Date: Sat, 28 Jun 2025 18:30:28 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] iio: adc: ti-adc128s052: Add lower resolution
 devices support
To: Sukrut Bellary <sbellary@baylibre.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>, Nishanth Menon
 <nm@ti.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250614091504.575685-1-sbellary@baylibre.com>
 <20250614091504.575685-5-sbellary@baylibre.com>
 <CAHp75Vf=zQ+pdo5V1fAq2qWEpdUfNfWdO+_iW0wETWSniXisyA@mail.gmail.com>
 <aGB2Fnv797Wrenza@dev-linux>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aGB2Fnv797Wrenza@dev-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/28/25 6:09 PM, Sukrut Bellary wrote:
> On Sat, Jun 14, 2025 at 09:45:43PM +0300, Andy Shevchenko wrote:
>> On Sat, Jun 14, 2025 at 12:15 PM Sukrut Bellary <sbellary@baylibre.com> wrote:
>>>
>>> The adcxx communicates with a host processor via an SPI/Microwire Bus
>>> interface. The device family responds with 12-bit data, of which the LSB bits
>>> are transmitted by the lower resolution devices as 0.
>>> The unavailable bits are 0 in LSB.
>>> Shift is calculated per resolution and used in scaling and raw data read.
>>>
>>> Lets reuse the driver to support the family of devices with name
>>> ADC<bb><c>S<sss>, where
>>
>> I believe it's incorrect, i.e. it's something like ...S<ss><?>, where
>> <?> is something you need to clarify, and <ss> is definitely a speed
>> in kSPS.
>>
> Thank you for the review.
> I am not sure about the last s in <sss>.
> It could be TI's silicon spins versioning.
> I couldn't find any information about it in any of the datasheets.
> I can drop the last s or mark it as <ssx> and specify the first two <ss> as
> maximum speed.
> 
I have a hunch that the last digit has to do with pinout/number of
power supplies. adc128s052 has two supplies V_A and V_D while the
others only have V_A.

If this sounds vaguely familiar, it is because it was discussed
today in this thread [1] that Jonathan CC'ed you in. :-)

[1]: https://lore.kernel.org/linux-iio/20250628162910.1256b220@jic23-huawei/

