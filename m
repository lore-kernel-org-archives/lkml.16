Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB75B2144D3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744992943; cv=none; b=X+za9As9UlY3sWkY4MUnDpnDsXPu0JlTBVRJ6LEflOhVk1yCy4GzdyKHz2ljSuxf7NXUX32BqGC7ssHiy7Fto7oyuDBZOyhVxbPowPQ5M1O0sWU7X4ApsxF27KDdG5y9Eh8O6FQ3LbhHLzGEYmSWlA+Tv/khbT0mOzOucP52V3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744992943; c=relaxed/simple;
	bh=K+/CRwoooD32z1HfZkIvN1+3Y4G9naq0LdYY4gBYDyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHvbSCtMJYtOrvNgQ83KSU9LSMEXXdcf7Q2Yp++pcA8Q1fEdsKw/IqzKgtWaDxK79XegCxgFl40fmqsxv+o8Sj0cNg9Om+87+AUEU/u1SQY6Jefh9407L0ECkmBTjQwC7nPRYZ/TBPQnNsKWYHNW0tKHj4BFu7LZ9XKozAx7UOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=E6hcIrrX; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="E6hcIrrX"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2c2c754af3cso1041713fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744992940; x=1745597740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WGewu/6Uc/A3LPxDq+bmb4Xyd0I+dI4OpVDZkGsXcDg=;
        b=E6hcIrrXOWS6p9ogKJCNVjvVM/f/dW8U08Yjpo+AE3OXQJMHWgS1kikDM6/UyIfxO4
         xKMWijZ5spxGGtmDvQ6D48AYKdNsnmLEMH22MujiauGSGfW1Au9A9BWYg7AcUedY/El9
         OQpqfkJMIl9wjCSsEkp+2nL28I7jsw+Mt+JiXF7LOfXKNiFCdzBNYOwkAvLAfnJR4h0z
         inwdmtrXW/gArd+KH+CFw1+q1oLJV3ZHkRQUAK6/XiqWFZEq2Vex8+pVm0EMfVevKnPw
         s8kD3Yw17o9fUcpGL0MODFZ3yAjk8wbvi4H5K8SSG1SQkjXM/FmCxy33bI2Ca2jv8wgi
         X8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744992940; x=1745597740;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WGewu/6Uc/A3LPxDq+bmb4Xyd0I+dI4OpVDZkGsXcDg=;
        b=Y85TDkIQvT/s5a22ttbabqW7GwMhvDvw1HeeUG3xEbKHRB5NMoPz9owfeohfcGg5hg
         AKVwZUBaWeyA9+vyDzjGzzTUevmhGIkbL9cM4qetHL/lToFsqjFumsCr8aH36kKQxZmV
         P2cLf9fYBEOPqE6jFHvoNJu0RwpvOfG257+sEszE1ff0Mk4kWF6WfEFnLNz+dQZJK+9z
         yFq47vtueG0PdhOSr5pUQdwIeLM2PBAkurtfnU7O3Zu/p3vFp/GmyAQAs1H2xT4agI1b
         hdXh++Jv8AfHmRxLfb6seT2rBtxIcBTllFng/EAx5XO++x1c1ITd3Eu1J8lm6WCu7gOG
         Z+2A==
X-Forwarded-Encrypted: i=1; AJvYcCXjKzj8bHoLNKWZfsTzibrNi84Qbmynu5AQQnklyc0P3pR9ymXPMf3PilInLPg7Vac5iA+liiEwsNZG1QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk6X3+30bwp4hDMhUZ/S9ss7XqU/e+yemlrFwM6GcL1aXmM450
	MfuiJ/eAs9ALfvAY6tfrmFHDcPJnJCKydQVRaVlQKwofTWjvbvyEWX3WbbBiui0=
X-Gm-Gg: ASbGncuOa2ss0Lcm7C9DV7dwU2vdc4k2dr5k1MvbU4SOV89eb6zlhz75PSt2YZX6FuN
	sTrzqqStdna7mkvyYLN9Xy1xOMeexMzOoE8h6umnaeUIRTz8tnTBSi37EUQI5pUne7Db7Rz5U1L
	7C7zj44YDXFjInvEpDapfAM4E1WQtiU5sI8V9AO8X4HL9eMoZ2t/pnb+ZgoAX1M7q5Hv/uxn8D7
	VQrT+Uhq7BD6S0ZNB0B9E/azP4DVrFaMqToz69k1OJiw65PRibQKBF+BdnOkZ8yXMblb27uYW7Z
	GTCL0DjDKxF5/WvfRCxVtbR5I/eOyNY/HmtwlBV7LBTwZC9PvXySf1cWEuVOoXHW7s0wYCk5Ppb
	5EgbrhXT/vo+t8faihQ==
X-Google-Smtp-Source: AGHT+IGE1zwH/9pCVtJ65BBx41n2gg+r20RAvwIpV+gKuVenwX9jlxR/s4HYv+sV9yWK1DRiHVSJcg==
X-Received: by 2002:a05:6871:5582:b0:2d5:336f:2d53 with SMTP id 586e51a60fabf-2d5336f74f3mr1143727fac.31.1744992939736;
        Fri, 18 Apr 2025 09:15:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279? ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300478e34asm390673a34.4.2025.04.18.09.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 09:15:39 -0700 (PDT)
Message-ID: <ebfd728a-7994-4fd4-9e58-1336fb5f9237@baylibre.com>
Date: Fri, 18 Apr 2025 11:15:37 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ad7606: fix serial register access
To: Jonathan Cameron <jic23@kernel.org>,
 Angelo Dureghello <adureghello@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Beniamin Bia <beniamin.bia@analog.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417-wip-bl-ad7606-fix-reg-access-v1-1-0ce341f3cfc3@baylibre.com>
 <20250418165649.64ebef8b@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250418165649.64ebef8b@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/18/25 10:56 AM, Jonathan Cameron wrote:
> On Thu, 17 Apr 2025 23:42:51 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
> 
>> From: Angelo Dureghello <adureghello@baylibre.com>
>>
>> Fix register read/write routine as per datasheet.
>>
>> When reading multiple consecutive registers, only the first one is read
>> properly. This is due to missing chip select between first and second
>> 16bit transfer.
> In what sense of missing? Given code you mean missing being unselected
> briefly between transfers I think.
> 
> chip select itself is always set in current code and hence the 'missing'
> description had me confused!

Agree it would be better to describe this as missing the momentary chip select
deassert between the transfers.

Reviewed-by: David Lechner <dlechner@baylibre.com>

