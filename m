Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73152239072
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 17:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949055; cv=none; b=EKJRSNbqLgGkf7LnrgeMjOuiQsYX7u1Stb6oMi7QiEigxt2OuNVKv4xSjLyYY8wRiEIlcomc5l7kzSjHif6eeExF7Lwavkd/Sxlss+ZSxdHsU8MpqrOSytSG7soWsbUzNRMN/SxeTxDMbvtn2pnuhyZkzAmoVFJnwCqvrPDNgVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949055; c=relaxed/simple;
	bh=RV95OZ6QuotW+SyToIsFGrOd4oJnyVS6645KwSoOxqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fyUoU2Kvb9YymtWYU8NUPngXNU0JChi3x/19sBwlBDlLZ3DCn7OFiNvuEG+Ril8/5P+Kmd+demzc8ee1ASePHdKQ7+xBWc9l1jN1iuNa4kJwjzavMhrcnHlW0LWQ1Vx2qukZETLPp606EVbj1HzHe3V38cu9F3ksE1mkwAAePtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=C7tBWW2W; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="C7tBWW2W"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7302a769534so4341052a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745949051; x=1746553851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=04d/2AWDhOwk2FHBr4f0N3xfbkpUd71ShNH0wmj1gUk=;
        b=C7tBWW2W9QuKYpg/5A0xBdDVMT/8Bo9+C4zNs09yD2Jj16q9870ua9tHQ2HZkiTEM3
         NFrAWc/c5gJ/41fWLQ03NL8PzxZdM/77YRTxjA+TNGfagbGHlIuUWnQiNuXcd0gvfZaC
         NCGoZyQsyV79D5IKPmtU1dDX77E/BKHpG0vlbCP5il5AqgnhUlFW1gPGGgNZ0elKuSQ3
         pym/a0/J4JeHs211QSNII9kKhnTq8pcJMG6Yt6J0UTFBn4CMO31Sx02/6/CaDmqoURpL
         3qn7OeBaUzSPcQPyOUEZgB7kthvRjKTGymtCLeipiZRx/S+FDumN7WxdR492B4xXIHB3
         noOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949051; x=1746553851;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=04d/2AWDhOwk2FHBr4f0N3xfbkpUd71ShNH0wmj1gUk=;
        b=D9n0x8+Ao3pznvvYIm3pnVDoErlucvgTcHolwAkwS7SK5Q/66sC6ZbzgnOu2Bmoyfs
         qQDhqgMTrmh28LEd5xXLiATLDAzhR+RvjCp8xVeP6Sss3aXu2w7meI+6W8gBjy2BCp8w
         wPtPrdj8lIH/v5ejl1rR79nc7bV/QCfghG9JOlY2Q/WEvfdRatWvCPrJu0CUwqOLFvna
         GFFXNmT9I9HP6R8hearUzdM9jKaXrbBOS5XSEN2MLqyjyfPPHr0kC9v+G2tTTaca2To+
         qKGK6UDPc6NA50upNzanjyiJPj0YXLMhbXRZ0bcevOhZwL4ZivBy/Dk1mTcSt2lHqite
         KSoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUazkkDJGQ1BXQgQPy+BezWlXKpjl0AX1QbNm37knh5SvM8b+z+McAmKbSHVxw2KcJerMx6koNp385GZRA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx9KR3ZJkpgsnYhiYny+GZX4G1uYQ0zpZr/4VqSryXq+3fp7Zz
	zCXXMk/mJLamgDIvifYvm5Mo/qBC49Yfemd8ojCKMNDcQra0w4jpwk1C2JFmDVY=
X-Gm-Gg: ASbGncsahYFpYvZ0PCxjnHkrMRhfT1M3IhuLKWgPc2yriz1KCkbKv69oXUg8rQB2gdC
	IqFC1356895oFkewj6xWR9ff7SHQ/VAoFYXmcB8vnFybsXgkGj/iJggTlrTg5MHDe6oFjFB72C6
	1mR/wRe/79hkvPOuj4+fGgwgVduRE3ZOL8IIHWcobzHhI6k5aHZZ+3TDX12AGgj1MJeE+bm7aX4
	nWK0fvSZLsKYwnyhlHK9bg1zicOETXa+EFMHng9gWy0Vq8z1nlIN5kEeq4MGq1ng0ePjNNWTJWE
	Bd9ZR26A2+PU60rfIZvQXU+TiiP2EtgWa5B6PzCFABuXsfu07iPt8eQpDP+jFROYHy5r3EVG+vQ
	CwhS9AuOR59Qv8zBjKg==
X-Google-Smtp-Source: AGHT+IEq89dAp0w+bvwAhh1rYlQuYIKa/rR3a/L3Ry8hOxP6kvm27VuAIEvwkrlKWYiFuu6TNS9Owg==
X-Received: by 2002:a05:6830:6688:b0:72b:8a8b:e02c with SMTP id 46e09a7af769-731c09e0225mr84454a34.2.1745949051440;
        Tue, 29 Apr 2025 10:50:51 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7308b13087esm394510a34.31.2025.04.29.10.50.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 10:50:51 -0700 (PDT)
Message-ID: <7534e787-5973-4854-acc5-1db847333b96@baylibre.com>
Date: Tue, 29 Apr 2025 12:50:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: iio: adc: add NCT7201 ADCs
To: Krzysztof Kozlowski <krzk@kernel.org>, Eason Yang <j2anfernee@gmail.com>
Cc: jic23@kernel.org, lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nuno.sa@analog.com, javier.carrasco.cruz@gmail.com,
 tgamblin@baylibre.com, olivier.moysan@foss.st.com, alisadariana@gmail.com,
 gstols@baylibre.com, antoniu.miclaus@analog.com, eblanc@baylibre.com,
 andriy.shevchenko@linux.intel.com, matteomartelli3@gmail.com,
 marcelo.schmitt@analog.com, chanh@os.amperecomputing.com, KWLIU@nuvoton.com,
 yhyang2@nuvoton.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250429025505.3278016-1-j2anfernee@gmail.com>
 <20250429025505.3278016-2-j2anfernee@gmail.com>
 <20250429-sensible-subtle-cobra-badedb@kuoka>
 <00fdf173-ac7f-48bd-be81-5d41351e99bd@baylibre.com>
 <64e5c5bb-f1f9-4bac-b1a1-f628816ee1b2@kernel.org>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <64e5c5bb-f1f9-4bac-b1a1-f628816ee1b2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 12:43 PM, Krzysztof Kozlowski wrote:
> On 29/04/2025 18:09, David Lechner wrote:
>> On 4/29/25 2:36 AM, Krzysztof Kozlowski wrote:
>>> On Tue, Apr 29, 2025 at 10:55:04AM GMT, Eason Yang wrote:
>>>> Add a binding specification for the Nuvoton NCT7201/NCT7202 up to 12-bit
>>>> ADCs with I2C interface.
>>>>
>>>> Signed-off-by: Eason Yang <j2anfernee@gmail.com>
>>>> Reviewed-by: Krzysztof Kozlowski <krzk+dt@kernel.org>
>>>
>>> NAK
>>>
>>> This never happened. Don't add fake tags.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>
>> Then who send these messages? :-p
>>
>> https://lore.kernel.org/all/7f2d4894-788e-4ba7-bbfc-67ac0903b6fb@kernel.org/
> 
> Do you see entirely different email? I NEVER give tags with email as
> written here. Such tag could not happen.
> 
>> https://lore.kernel.org/all/20250417-acoustic-ambrosial-mosquito-9d75f4@shite/
> 
> Where is such tag here?
> 
> Best regards,
> Krzysztof

Oh, I did not notice that the email address is different. My mistake.

