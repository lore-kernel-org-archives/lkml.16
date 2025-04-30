Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AF61C8FB5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746038020; cv=none; b=ZcL3JlTHGBumAGsakliHAEH//ZRuxlrgla/Kbei0evLUBM017uVMXfuwIcHSiemWVNhjOPYog2OssaXOVjGQc7yvqS5sOro/00kfQPLDh3tzYjY7k1wCxMT+Zz4djaa606zOLbo7dz/1ISUkrOcaFRPAXb/wAT20wewXsqkiKls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746038020; c=relaxed/simple;
	bh=nvBULGbN7c+mQ9lJkUnAGdBDY74gyxKHw/37B/Drwe4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Jx+KNrooHfnIK4b2fdYmgmL8vjiHdm9G0pM2kl4jRAHD+Xj0v+FMQxFvrnknmGH33K5zupTsPTRvwAtLInfcpg++KQwLOErh8sy1JyzauynbkYKVrG9EZsHftJyeP354AO9u69XTwmkyg3FJgQvSuruoQZBobh8W+L4uyRDDot4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kTPTEtlx; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kTPTEtlx"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c0b4a038fso99565a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746038018; x=1746642818; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bhh7Yy/ML2gRa+hVqpAWpNr84ikftSdkLJWeAvX4C2I=;
        b=kTPTEtlxgS+c2o1ZOeWyZ7bIJ82T5Obia2zwW5HTjcNMXxgvvtpvVOJy+DL2b2UZ9/
         o5Sp0B/Bhq3cXXOk0zVeilPqjzBjOgFhU8i104lybOHYxJlGQl6/drbHxvK5flLjtCOV
         SswRIm9aCWkRyZYDlFId+QspXpyVQ45620PZdhNCTnIudVn+SMS2RPJnrMU4jwQv3gyn
         Gb/r6W7kbB4TP4VatM19Vaj8h7wRjFY5UuzQF4/opFeJR43BoI1odBi2tla5+rNe3NmR
         e2rgmHpwlGctMAqZ7OUiVwwncORQw6fkYo40KmEnW+59Vmfa+wWXyQ7B8/GBB5xnC+yb
         rgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746038018; x=1746642818;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhh7Yy/ML2gRa+hVqpAWpNr84ikftSdkLJWeAvX4C2I=;
        b=o6iXeUxkMoYut7yW/iRO9L/lQ8glzLjkBaAtwpTi/dl8PlLeOcG5eR9pFZMJMHaspr
         dviVj81entGm4FkKiXFU/YgFznBSXiSGt4xAD6jweuA5ObhWRXZ0lPhv2m5cIs5gD6+7
         3+NAKonHnrnIBKxZYka7S2Fvg57d7WVmdXmE0d+9GK5rBBlHB/crHfCvDmaLXfgc576K
         /VRyHT9UoJrO8gIS6IWQyUxwe1KizQ+pNmMeZ8JTWlaMCdRRoYGhsVd6NhAv9vypEwK+
         glEYPM+wJBs+rnyAEwhsxOPrAVwDONRHdZ3t5gPChPhB11v+K1VssJtIduGCj6jnDwAK
         9hpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCzV8pUEIUk9caLS07JIg33mLo8NJYstwrb3BKLGyDOuImY+YvJOawEmOgsKkGdsKekfYGrzec20sCWck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbR1RhNpOgNmac/wjOR/E11LyCb1FtCLlNEVhpCE3x3VIncup/
	xJSjPuBfIleIhnX6Wwx9sDbPmD/GhkUQaSjwyU5g/Y5mkmZ8UBTb3xHpQ2aUn8o=
X-Gm-Gg: ASbGncv0NGwjjOYral67H1WleZss9Kkuusq+4C1v7BaOgcA1FiovXltXuEDSwydKY2P
	+EYdGG8NqfkwolCy6IO3i0I6aitwciUObfuq31ZyPUn9lha410wG/BmqLFcr6sXv1Fr1IxPdaDO
	KF9agQnBB7LQOGdCt+h+mxI6+jt7R+a0Qg8gl6r3F0rAzWMBatLKDbzPJFsV5peguJT6d/NZSwm
	t+OopKUXN3exvd/KTlzXVvhc+PsoBR3MTprS/f5jZDuUDIWyXPS8W8YKNdSVT0yMWLKsYcEc8tD
	VqSYEBhgxNExat62yDp5kZnl2W1WrVEmOs/R0zR8OZBul76Yydl7vR5yE1/cttUVFJKVMnqgl76
	bl2bT8KVvqiYHtGkJNlUJbZIBOQ==
X-Google-Smtp-Source: AGHT+IHbIjYVljXLsdKYQQWRQpAy+l9KRVU1cV2K69m6KCRFTLwRAoGzT6npWbnEi3pF5FVxdEM+oQ==
X-Received: by 2002:a05:6830:2aa2:b0:72c:320b:fc8c with SMTP id 46e09a7af769-731c0a7c762mr3169245a34.21.1746038017706;
        Wed, 30 Apr 2025 11:33:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:359a:f1e:f988:206a? ([2600:8803:e7e4:1d00:359a:f1e:f988:206a])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b312cb2sm992682a34.60.2025.04.30.11.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 11:33:37 -0700 (PDT)
Message-ID: <b4598086-e188-4dca-b060-0dd82fc79c02@baylibre.com>
Date: Wed, 30 Apr 2025 13:33:35 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iio: adc: ad7606: add offset and phase calibration
 support
From: David Lechner <dlechner@baylibre.com>
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Angelo Dureghello <adureghello@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
 <20250429-wip-bl-ad7606-calibration-v1-3-eb4d4821b172@baylibre.com>
 <d273fa78cb3986da5249bd800dd25c4c0bcfde7e.camel@gmail.com>
 <9c02b2bd-dabf-4818-8adf-83c9127946d1@baylibre.com>
Content-Language: en-US
In-Reply-To: <9c02b2bd-dabf-4818-8adf-83c9127946d1@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/30/25 11:14 AM, David Lechner wrote:
> On 4/30/25 10:36 AM, Nuno Sá wrote:
>> On Tue, 2025-04-29 at 15:06 +0200, Angelo Dureghello wrote:
>>> From: Angelo Dureghello <adureghello@baylibre.com>
>>>
>>>

...

>>> +
>>> +	val += start_val;
>>
>> Shouldn't this be val -= start_val?
>>
>> I also don't think we have any strict rules in the ABI for units for these kind
>> of interfaces so using "raw" values is easier. But FWIW, I think we could have
>> this in mv (would naturally depend on scale) 
>>
>> - Nuno Sá
>>
> 
> From testing, it seems to be working as expected for me, so I think this is
> correct. The register value is not signed. 0x80 is no offset.
> 

Heh, you are actually quite right. Even though it working correctly, it is
because the value that gets written to the register is val & 0xFF, so adding
or subtracting here basically has the same effect. But subtracting is the more
logical way to do it. (I tested it that way too just to be 100% sure.)
