Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F0A286D62
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746727430; cv=none; b=bYqbOspIGNFmmeGqQ0R1C0KoIR30MhppCwajL0EOj0e4al/A5O7j5h251A+yvULIILxpHXCVr6QiYZwPpDQKLu6wg6Nu6vBCSUejtY4+mBqw63IvGj5RknE0/2upgKzDVSieAcjXzJ0cCq307Xke0ayOsfGKvdPfeyd9w0t+Aa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746727430; c=relaxed/simple;
	bh=BPaM3uBsQYkug/7fouL8TiZUFIRkQwryGGOrlftw3rI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=No4bf1XvMtgo7R/c5DMWa+93kpACTdWkrULTNay2BDGVUfCRAV+JrdPBQfpQAx5yxzb9Od4sojzRNJI4nN7D88dkWcJcTaFAbHDVkzeyhgXZtQEWVmKyfG0d3MlnczkHNe6n+CAVT8LngGJ8pDJ2aYRQ753N+1L3GfC76P/HyPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=h/NKT0MV; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="h/NKT0MV"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6060167af73so758761eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 11:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746727428; x=1747332228; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eDIMXcUh+1t2oaHEL05AcYmEhaIiuHzLG4RdkwQs3gQ=;
        b=h/NKT0MV3szo5YA+cTcEaMfm/g+f0KzQJ91PosONwMUNS0wToMj+tFls38jgaX1uPk
         oOzMwrNE4VZBd+m2MuNC8R8iNS/DIQpoczEJb6rPaaX1jcu8CwuvfdP4yttusT6yyTfM
         qPl21SWeECE2vCHispLqKCQZhaVar87SqRnOQtj1ZOcW9+2NRXWqhPPUJTBl5/2zFYfM
         ay6NY5O9EN1S/u5TU8pkcohEr11mqVa1mTZXSizJxPXrnr8HD6/wQFoLXnvvAw3onxsU
         7Mq+4mTzDcR8lB2ZQu3Fcy7MlIH3WZxucn6FVPqI/dKX4HZCGo0Oj30UwsFsBfG3HTXN
         VfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746727428; x=1747332228;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDIMXcUh+1t2oaHEL05AcYmEhaIiuHzLG4RdkwQs3gQ=;
        b=nbY2KKNMstsyhu80N3BaoAMSZ/EaTjfuWcpMk8oeH0ZbXMLLg7ymHGVyxMSDn/Cprd
         k+HYGno1kvbwNANtBxdnQW3NwxnNvUn8NcL4yXqE7bpyui7aEMROk1y4zIxCy2P/1XZR
         7v2//EFE00qI29t4rhB1UEAhr2ayhCGK9s33/DoZfw7Bz8u3xaX7wqDibclsOQe3Fjcy
         rN0NOCkKk+dvsKBPUCC7syASuxEf669CmAFS5xE/zMot/ACw98w7VIII6tE6LWljfswP
         RdyOGWgdwM3nNhGjeOIenwgGNV17N0jsjfJ0r4VDFZ1tvTePt047kMYGvWMPJQWhsNTJ
         oTJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwCPDX3Rmvhu571XR1ewq4V0Ie5SRGCRjR9cEVkdjtXdlOWBxq/G/EDHaV99xLBr/bDwsFYf5SXbojMTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxczLuYrarwey6TtIOf1HYApqkVJeOuteVT0zwVjmoTbOBW1/fN
	9u+bHmoWrLei+YGj9Y6DXxuEl/0M+o8gxG1Z7oGhvx1bW6C4+Numl2jKroKhfEE=
X-Gm-Gg: ASbGncv+H/ndcjgSXzdVkq0syL33gZBXdmEmRuoy6cEJR17tM6A3cNFY9D++e2jwpca
	VgT/WVaj3aiM+Ztx/OthUG5Qdm2ALJ3FznGg1xJRSUpmqLx6IzYs73tnLetM/sLrf/exCxrJRxK
	MjsLJo8UfYg5H3ys+SH9do4CAFNMwqU5R0+5XeddEdIt+6mRmRE5FabOR+tqNBoLH+ROwo0SzU3
	mjIpR8vX93EFOJ/8zXNYIhDwBNg9wEXHtmOD/otaw7iiH3CDM9PVASKeVgWzn3exXWVWwWh3lwG
	FKxI1Z9VBJaO4E98HXxFYrW4iX1zjeRsGEFw+HFRiCJiOC2EooKNngPq4oQRUpINnGcopi7CQ1S
	g96RVtIE2nEiNcVv37g==
X-Google-Smtp-Source: AGHT+IEf3U6aBnbW0K6M59yOkNClYiW3gx4S2YQp31BRyUSuIa+tQqcacAiU4K9X6FdN1TJqPPe90A==
X-Received: by 2002:a05:6820:818d:b0:606:9ed9:c38 with SMTP id 006d021491bc7-6083fdc3f6cmr408574eaf.0.1746727427735;
        Thu, 08 May 2025 11:03:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-403803995e7sm60463b6e.46.2025.05.08.11.03.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:03:47 -0700 (PDT)
Message-ID: <1f8e1576-a850-4ddc-9be1-16e59756c65a@baylibre.com>
Date: Thu, 8 May 2025 13:03:46 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/12] iio: adc: ad7768-1: add multiple scan types to
 support 16-bits mode
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: andy@kernel.org, nuno.sa@analog.com, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, marcelo.schmitt1@gmail.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, lgirdwood@gmail.com,
 broonie@kernel.org, jonath4nns@gmail.com,
 David Lechner <dlechner@baylire.com>
References: <cover.1746662899.git.Jonathan.Santos@analog.com>
 <8b8f861422b15b1316a1513cd66abc544ab8c5bd.1746662899.git.Jonathan.Santos@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <8b8f861422b15b1316a1513cd66abc544ab8c5bd.1746662899.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/25 12:04 PM, Jonathan Santos wrote:
> When the device is configured to decimation x8, only possible in the
> sinc5 filter, output data is reduced to 16-bits in order to support
> 1 MHz of sampling frequency due to clock limitation.
> 
> Use multiple scan types feature to enable the driver to switch
> scan type at runtime, making it possible to support both 24-bit and
> 16-bit resolution.
> 
> Reviewed-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> Reviewed-by: David Lechner <dlechner@baylire.com>

Typo in my email: baylibre.com

> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
