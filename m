Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3649A202C26
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625790; cv=none; b=Uepvtg3lanQ5o1PcZc1KsbH/FSCDgs2MUXIJID83bhBx69ia12+dWN8h7zxUg2ecXew4mREDJmJkiXBAzOmsAULzFlwFjJM4/ckzuaiYBlkyjqvvGZTwnVaVeM6oCsmZk5BHMq89sD7/HLKyrs1BjvJfzi+eBltjF6q235cJirs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625790; c=relaxed/simple;
	bh=w9dJJZAfLFUz4sepGZ4yAHD92WyyzbYRQNOBLcVmWcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0Ch8qaAvoz+z+hflW204wxrW+T0zhIpxgKSb6evyaPfmjnv5hbEQaVp/8KApcNyf6Veim6s15WsmXduGUIoNs47ro0sIMl80la1M6WjTJ+CpPpU20Hh3DKzVAIYTNjkiCyReWT5DRzYkMvfZOFOcpIVoUgbTANI3b+Nrdxs1cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xMOwG7NA; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xMOwG7NA"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-401f6513cb2so524379b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746625787; x=1747230587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2E3azbVaCRVDrY4UnTVOScgZIlfU9ExUYdpv0XY9P0=;
        b=xMOwG7NAiSA4M9iwSSzzquNz/WWG7vxM4jBE+hXIPioIrtEFMqxV7FD9O57Pdc6SZO
         gOLxTBFvr/Ficn3HfyB+izDOblNKOtc64bzwzSjlqlXSXMZwe4+UsjZP8THsXj6x5gOs
         vwsyrdnV9IrD/S84OtsH49vuaUeBaEPb5TWiAE7IVVahjO99L/oqd1DYYiamucXtfKal
         enjJyHLZJ9OvnnWkpJE5bD0eg3Po120jv14zqsWw9zlkZfQsm6QCEcqPVxmFQJqY+AL6
         VHXrTkqCpGfsxiKXlHnWMrGUhRw8vv9tIhIuhzn8qO8s99MRV4V1179SvO0llEH1Wx18
         B/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746625787; x=1747230587;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2E3azbVaCRVDrY4UnTVOScgZIlfU9ExUYdpv0XY9P0=;
        b=K8/tGJ9aY4LioPe56Z89w9zWtWvII1aRk960gkFJGMmtm7P9KNlFRu8iFSH3nkLi8u
         DzhXLaoddIF/CbBWo/2/48CEru0A7oWLS+JICBojYPVMx3b0UMcH3098WDIs+suuWwC2
         RhnCdQOIWaJbXyQdLAX7YkmRuRQ112R9IkV6ttRRgMEeHwOFR7hlWuJiHR5IYLzzPx/o
         /fYGY380cNLahg+6YEeDw2nENyQ3Tg5jZ6h+EukK5w/X4nSzuIipjPt6DOo1ycyKnYmR
         2RPEd5rqxXt3gJwMnMirGV0/uANAVOffrGEkVAAxhSzwYsmYd2U3tn3bxDP3cdGgxMT0
         TG3A==
X-Forwarded-Encrypted: i=1; AJvYcCWuGiaz0PYMxhlz/k9gg4HdSzrjTo9KWL7dtWh33XvLYiOXzCowLgsTwHkmsoPKhxi8EaumjeraN2GjB+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTcxmydN8/2L+LOS2/oBDLhjzxWc50VT2zqU5d8BY+iLrHvCGZ
	wM5IPskbv4KgkXHGJgWY1aIaG/tyzJnxCO9dwyE5D+Oda9a80HSdKELZ49uNEXs=
X-Gm-Gg: ASbGncsLGT3Jm9HYeILy9ZOz7YwmI+J/SNqoeoXwj0CfyoDlobTqjSPZh4+tAUi9akf
	UU2Dk3G9GBtZGHODXhLAbkdj0eKqifSepTvjuqbbKN0xxKWNXIMp7uewCA5C8Tl2In7hcomi8wo
	KX0/hGafTZ/bh6rmSb2MMHMzJlUybMZFOb0ryaYNSis+7HC4OqctlHH+73qpjx6qKdPf09e8HdZ
	t5ZmojU8QNgo9IUFLaA8gbyCnAwGJBGw49+OoA8v9b2BZhmu7YhSyQT54Ew+t3HiuI2aOGupoRG
	XJWXCnhJRacBbRhqyFjNZHgCdx+huAmVH3OW1QC47fssgDKqS+LHidxJDuvUJqDhLIMyfdlwfGK
	Sb9aJQ/yHSJeukd8=
X-Google-Smtp-Source: AGHT+IEkqfDH15pjFTL4cZA58InYNRqoavGNSUddgSHwMO1Pw7iWYqyvF5hpJ5MLza2jpw+neoIdHg==
X-Received: by 2002:a05:6808:178c:b0:3f6:ab0d:8db1 with SMTP id 5614622812f47-4036ea41ecamr2103982b6e.3.1746625787217;
        Wed, 07 May 2025 06:49:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3356:f6f6:bf76:a32? ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fe84a8sm2683429eaf.36.2025.05.07.06.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 06:49:46 -0700 (PDT)
Message-ID: <fbf6c7ef-3680-40ec-8c90-121e6a635b8d@baylibre.com>
Date: Wed, 7 May 2025 08:49:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] iio: admv1013: replace redundant ternary operator
 with just len
To: Colin Ian King <colin.i.king@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250507134502.254736-1-colin.i.king@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250507134502.254736-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 8:45 AM, Colin Ian King wrote:
> The variable ret is being assigned a return value and non-zero error
> return paths are taken at all stages. At the end of the function ret
> is always zero, so the ternary operator checking for zero ret is
> redundant and can be replaced with just len instead.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

