Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2222E545
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502223; cv=none; b=bZi7byH2TmK+bPGioO6tZE4YTkGhzn9xoAIAvlnQTXKm40NKfAT4hsBtep9NClq6bbVTWGwGj7/YQ/3FlT53bQzJOKZ+F6b5UFY9j85BLwyOICB7ynAUsGhBQkwHvmDLq6JFcSOmu9iykrGgbBGomULFfMuUJwncPZiwHfsvrtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502223; c=relaxed/simple;
	bh=b5Ti4BCgUElx5Q7TsHyzuLCU8awSnXi4SG9jOsa4diM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFqF/ZbSrU3/qWMqvCcAtrLqTvDYMUKduvHKY+ZpgU7wzD809Lp6lAhoSSToHzPp/KAis+bXJ5N3dMbsNl3FKdiB3v3zeaVXFIcB3ezZTAnlZah/aVe253yZBoVNML++mG3Yjzdpkib6Remifho6CJuIax1644LRVuqeWRzvNF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RzxPb0XM; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RzxPb0XM"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-72c7336ed99so297329a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745502219; x=1746107019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySZRnYP9tmklFRTY4e/KiEeWxMervJlsgBohTm5W2qI=;
        b=RzxPb0XMZcfjR2M6WbxumQPie9o8536ZrFA/+OS1PqAwRU+7P7T/ge5W63gCMQaQRQ
         B/SXGm1ozA1FQs1QmCKFRnBv2eqoCn3yAxfM8bb6HatwoedAOrtgfZ97uu0ZDc8d/ryD
         cLbWQDIfgaaBgeTcOtWOSxd82T0k6tv+Kddoq0jtBWuL8bXxMP1LJ2M0n+MScrgr5f3C
         Mt6WO7rPAokuhnrzqysCWbXMxOiJecQsRfCwnJuVdf69Pis5dMv9gRgszKR2koPUI7Jk
         MRUPsqD6QqHHuqj7THpkObXGcc4bkk8GEviQnckzv2NpNpw3YfBPn6OOecF3yWsjMfJV
         SH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745502219; x=1746107019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySZRnYP9tmklFRTY4e/KiEeWxMervJlsgBohTm5W2qI=;
        b=fnd0Nbf8UljoUl6khPkxLgZQarl86iozPJzY0MXaOTgrDwb8CnAx2AmSRYRDnqPL1i
         PNul2Cn5rwmeOMNUaKviMcu/Ytg/kOjldCxS428E4nlIUbzww+8FPbZYrl8rWW4HBffq
         7pcysoB27CcVmzFo3oD94GhIw2SeBaliyyFoI325a71JnvXY/LsHppgeSe4vyRTQAJFd
         GE0vZbJfaNYVTDkpQQD6ZcJTFOiLtv5Q48ij9D5yk0xG0lFAwpjgRyGYsEZXz++iYPM8
         Bq9HNBF3A19WRlLYf6SZ+ChgnCf0+Nzzg0dO057nuLXkec+1JmU3ZSyNt3LYuYj1ixhN
         H5pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhtt/KlRBE6lP6B/T2BaXZJhcgYWfWt0dGVbDQTXZlTeYpm4N0eLeM92kDNT32NO2pH3mbF1n2snh8xFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBksrdBEez6GVrJw05sqiJhos/qJCKIjWD/S+Cfc792mseE/ka
	sowYlw8yCqR/sAn7XwePYNKsYvM1GNIEq8xn8OUI2df/dEed0vbKvc8Hlm9NV3g=
X-Gm-Gg: ASbGnctBndLyBQVrH8CfELVysUwXzv2c2eZCbH/8SkWUb/R+wzMGAA3XQg32RZmk3dN
	ij+i/+Zwbb5Qi91lhb65IAOyE6gYDsCZPajCqpD6jCzXtT0eu6Md/pcAj0HWFeXsgF/i/eUuRNP
	xMZLx/Y8Oe26ejEB9MoW+Nk43uTT7uVLpyQajV+Lp5rw2JMvPeLN+rWbQ3xg5ldhTwGMDFZt2/s
	Dx1ZhBGniKeybv0WHjzsu48mUW8zk0J/vWKP32XtH3/VsT4ZadPzFWS7GjSoeTPzDgOI9lNroda
	wlAHvNlQJlYvjozu9eKNX+h6yXv0V0coUbv46aUMgJ5GUYhuXAnHPykVyNJdNOax1+caHwTcHSS
	lX9e9tnIqKwNWfH5I/A==
X-Google-Smtp-Source: AGHT+IHdImH/qJ9ieJ6L6o0QojQPrcgl+jDOiFGkRIR3z+FL0j4ZR7iI6e7AEhDyvUGSay24UAM1Rg==
X-Received: by 2002:a05:6830:4389:b0:72b:8297:e988 with SMTP id 46e09a7af769-7304dbd15cfmr2075735a34.25.1745502218845;
        Thu, 24 Apr 2025 06:43:38 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:68de:6c1f:6d0d:b32d? ([2600:8803:e7e4:1d00:68de:6c1f:6d0d:b32d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7304f37e123sm235519a34.47.2025.04.24.06.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 06:43:38 -0700 (PDT)
Message-ID: <3a6d1f46-2f6c-47af-ab6d-10afb22c440e@baylibre.com>
Date: Thu, 24 Apr 2025 08:43:35 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: PAC1934: fix typo in documentation link
To: Marius Cristea <marius.cristea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matteo Martelli <matteomartelli3@gmail.com>
References: <20250424-pac1934-doc_link-v1-1-9832445cb270@microchip.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250424-pac1934-doc_link-v1-1-9832445cb270@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/25 3:06 AM, Marius Cristea wrote:
> Fix a typo,(PAC1934 -> PAC193X), into the link from an application note
> related to the ACPI device definition.
> 
> Fixes: 0fb528c8255b ("iio: adc: adding support for PAC193x")
> Reported-by: Matteo Martelli <matteomartelli3@gmail.com>
> Closes: https://patch.msgid.link/172794015844.2520.11909797050797595912@njaxe.localdomain
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

