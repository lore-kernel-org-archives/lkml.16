Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3881827A920
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642972; cv=none; b=N2KQiPvy7FueJ+4J5QRu/jmam/Mpoq+gn5dhJ6lsKvtDtWwhWlZZEGtXn+Nojo6l3Spz+Oyd+uqqKMwGKLb88j2d7NouQJfEOY//CCIhoIO5/Iq1dnh/Ejpvhx0+KQ/9wvpZKPZ2d32qTL1slBiovZTRNn2v7VCxoggs+8+RCCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642972; c=relaxed/simple;
	bh=4k/xof5OQp7PIVTQYNQCGur66hRPvIJqafxT6KmwVEo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hMMEPG98PZt2a4YoxjY+fdQ4gQfRo7PvEsKktNNMd57wTWeUSHabRA6Z8gdXiDo5grbMaIvWLZQjDmnz7DQmVCkJDQpigxg3zQVb0fhTRzF/Lb9m4yqQ7GnpBkENI6gQd0yE4pOq5UpOxph0KjCCrnpkfb3HrfPyG03IDJ5MVcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qKog0Iu9; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qKog0Iu9"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-603fd257386so986564eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744642968; x=1745247768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sS4Zjvq3sJ+eWVkmWgf8OvoOhv08fRRBCISkBnmL1FM=;
        b=qKog0Iu9jZ8XtBQZtEsf03uebxAqjGqUoaJbQ5xNFSxf4DnonxzOtUFT6q3XqHpaHm
         ZjVE+DwJ1Fx/nMCxDCWTrQmPLcaO/iuwvp6xVcT77dRG257p5EiX3Div/5WFmdRniyjn
         p7crDRDBazKkLbqiVo2/QY5StRP7ew3tRugmsUj3uKwuuI/9FO0EBW4iY5LCiY+P9Ih7
         RwOXPG/8E/K2Na1doDsjEGhtDP6kyvHluzaLRIEc4YqiY0G6UTpzD/Mlp0drH8zakuHV
         TrnQgJUbhQxIqQ+9G0jE1Iap2wqWAZ8Xd/mInSOsBDcd27/aWuwTPlDmRVoltpIe342Y
         pmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642968; x=1745247768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sS4Zjvq3sJ+eWVkmWgf8OvoOhv08fRRBCISkBnmL1FM=;
        b=k5HgQtl2Rz+E8NCPIBgyA75eXajWNpIJF4JhU8Pg0/+EQY8ZUbjTAvLJfGmcONAo0B
         E4lIInF03cwVLs7N3583xBrZuc12KHJa0ibae1h2ZHRX+tPYAenF0IdWdmeAggS+OpBQ
         6LrJkofwwYIVXXND8B01JC9A7d9cgbGgpoAdMv9wbM6yN8EsgdJE6aJ/JXTsSpYi8A1r
         w44GFhA6lvnVWCLPJLWtUaevoWa5oqXu8GmTPjWisyxcwRdL/COioz6Vk4YtdcSnfqUI
         JNkVPONoOoljzk/WKbl5mVXgTYcuHbLE6J58VgJHYgHIIgzYu0c8xtlW+27HgjSnj61D
         MBpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsA4RlLoLiE2Iui/PjxxdGqTa1UAH3Zes3QAyr2yYBAPGXaWpUBWJsi9lts8Ub4HyodyFlPZYufn5BEOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2SNyS+XA3LfrRBV3HyFSbCxlBeV0GGdXsdcb+V4jNHYNejarG
	zgxRHkBt9YyP4VbeBpTrkiUrbdY0KJDk27GBvIe6c3SIPv8vURqsIBL5TfxHhLA=
X-Gm-Gg: ASbGncuTt/nigYbgLETcoj1EVJbV9W/IAHnty44p6UJuKhiUUZguk/nZEyT1gAnIEGP
	g+drNuI1y0Mzvg+jZBCAxar98bcOSnNnupV0PmOL/aaKjTPIqpOpeTrXS4nliqQ7628qDXZLvmo
	DQrfKWNl16yGaJuQkIiO91aWSdR29J5MF1fab0IZzX4Se6Q9WtKSWw50dArrZPx5LXekGKBznwb
	6UkwLR9q6Xd3HJI03xW1+NOXlWq85HKrJV3aWEyqukRmojwJASQIGDpw7TbNp4ADkRDPZsOpcus
	QfYQ3uksu5/qkjYejxjycBU3o+rxaEmywMQVVHXW1FnEHj0juMIzEiZmkU1I0A/kdLNlOeTLIu4
	TxuMY5UTa8aFzSgD07w==
X-Google-Smtp-Source: AGHT+IGge1vpcmLU7HQnnhk2Pd2GdQcITC0JwJErpepL0AlaxCPXrAcAXrwLje0ymi6nTKAEBpYLOg==
X-Received: by 2002:a05:6820:1e86:b0:600:239b:c1cd with SMTP id 006d021491bc7-6046f59b874mr7612300eaf.6.1744642967977;
        Mon, 14 Apr 2025 08:02:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:442c:b496:9db4:da43? ([2600:8803:e7e4:1d00:442c:b496:9db4:da43])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f522fffsm2020557eaf.10.2025.04.14.08.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:02:46 -0700 (PDT)
Message-ID: <25db1c97-001b-4b9c-bc57-879fcd0abb14@baylibre.com>
Date: Mon, 14 Apr 2025 10:02:44 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: Correct conditional logic for store mode
From: David Lechner <dlechner@baylibre.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: gshahrozui@gmail.com, skhan@linuxfoundation.org,
 kernelmentees@lists.linuxfoundation.org
References: <20250414140901.460719-1-gshahrouzi@gmail.com>
 <0b1b428d-9ad0-4581-a13a-88f4ffd6c4e3@baylibre.com>
Content-Language: en-US
In-Reply-To: <0b1b428d-9ad0-4581-a13a-88f4ffd6c4e3@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/25 9:59 AM, David Lechner wrote:
> On 4/14/25 9:09 AM, Gabriel Shahrouzi wrote:
>> The mode setting logic in ad7816_store_mode was reversed due to
>> incorrect handling of the strcmp return value. strcmp returns 0 on
>> match, so the `if (strcmp(buf, "full"))` block executed when the
>> input was not "full".
>>
>> This resulted in "full" setting the mode to AD7816_PD (power-down) and
>> other inputs setting it to AD7816_FULL.
>>
>> Fix this by checking it against 0 to correctly check for "full" and
>> "power-down", mapping them to AD7816_FULL and AD7816_PD respectively.
>>
> 
> Sounds like we need a Fixes: tag here that reference the commit
> that introduced the bug.
> 
>> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
>> ---

There is also a typo in your email address in the cc: gshahrozui@gmail.com 
