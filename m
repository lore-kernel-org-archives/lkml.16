Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179982BE7D1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742308; cv=none; b=eywUuCvF2uqpM5w1k/eLxyoPHXBe02HhnsTbbF1vIj2tY0r9knds/KCXxSM+5hvmbb5uPGLlVs8D42oeXM4+0acymvYrJ+8X8e0HOt/3eRo8d1nElx+arwf/wNUpAX2+95OhszxuoU0yBWsrULGKEruXURL4jW1Mr6qmeWzbEJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742308; c=relaxed/simple;
	bh=IQLfy/Zvhm0tkwTZfSoUkuAWBTTh+JjfsYN5OcGahFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a8pSrg8ZLwlKiAS6H0e0vivgqkkoNAP8t77nlj5F4ycZY1mm/iMKaxjrY9nGn4mmXRZvH79ALGqZ2sU4yv/FDAR2LrrCbwZrkFgPLlDZsr+S1aL1xBkaTNtwaYAIbnStFx0s4SLOvr7oNXzpk4zHl/xt1X/dpnCMnJlrTcGnlCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1H/F52zj; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1H/F52zj"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2e9a38d2a3aso892486fac.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749742306; x=1750347106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6yA7sWYbwYlMmX+GRi/1Lmimz1lplFtP8nIGu+YKP0=;
        b=1H/F52zjPN4dsyxuvKtQ3yx2ggGc20GWZJ+c81s76XJZTw3sVUjz5Gw9foUvywmpXw
         OOPR63bBgJr1aJWsMCvZfamGpso8P9MmCj31yudL175+R4BKDVT3KsDu3gxWtU/ZQGU/
         36uydGTBffkoGZCZWLCZG4HF2aWEdUYq2vainmyZPpPXYN87mf0Hv+pLdMMg/pA4qsHL
         xTeyQLKqQpHsDBlfac/zs95k1NGPm+ppumQ48BvVYinjCcUQeQiSKozveCoc8MIpJXC6
         RjrO45m8YkpvdO5pdvl4Srf+E9MHGAQ8sfJbHZykCT0qD0BlMdMNkEyqXsAbkZk+D/+V
         oR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742306; x=1750347106;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K6yA7sWYbwYlMmX+GRi/1Lmimz1lplFtP8nIGu+YKP0=;
        b=wT0pyNs0sezBzLMEfemOGLF5b9f2qUYBqHmbqwn58IVwGnEWphTJag4qDfFQQmPesc
         Gkxmv0N06Raz6i3oVLGcAt4t8NVMAFuDOb8BWiKBWkyBgXD04/EmvHX+fRS8UPYpoLBm
         SbGzMw4QGmSGr4LjkEIXqkN/p7kTxhiuVeKH+eR902MlJN3kPDtmH4uaCqxk+LFJ2pde
         g68wT+WHBz9lg7CUbJaho/QkvuGKtrchSrFtfBnDHvRfs3BU+HK6Q64Gh1HR5q8/2ngg
         /MVjg0+IevTz5z7w4GUUixoVS33yVVCWM9njEgGd6lNlyZ6f7v1W3xOsS6QgqmRaaqgl
         Widg==
X-Forwarded-Encrypted: i=1; AJvYcCW3U1kk8aYTaJUizg8WiLLs+ONAZIs5wNuSPhU8obcDibIxN53+ptnOVjMK8h8WAjuDphaKmJ+mqbz/afo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl3rt5AsN9Xp2r9XMBYua0Hbxt0BBhLWvz/fSjFIugMlB9qZ8Y
	g+3dHb6wWSXf4EZ74wz7SZllnUFtTncUspmN6ag19CjLIW+H+4xUW11mxtTZGafT9cM=
X-Gm-Gg: ASbGncvlwNhOk3Ba6LJV7t1494UY1KfCHVhAEkZ46ZgmcEJO5eBw6VF7z8UkeK7CHmI
	SvHq7xKQB0W6PiLjs5hEOJJ20RqO9dc+4Yja9ZFCWh4bAE9zPVHBCgIuwyDZu0YBlR27y49OtmV
	2tTVj+FYqwnbn2YXmciMHD5Wmvk0IUgot1mdOF/XUAh+4EmW1HZr3SR4mlJRdsrGbKMg3d1L2XA
	STcu++djAymfsRyppXFT4iXSBRMxyQxHzonER5GDZV4vCqJC03vNTgNZ80vpJNgo86fIPEiAhrR
	mjE2LAoQdGVnpQ/gHEp/akwed0sJ4q+zD3DN0muXSZ0SR99F73lUQ0RhkBaaB8dD83JONviOOcC
	2WpHjT4BzPGW8OQhI4P2/OXhCuHyLV8lJLjwUKXg=
X-Google-Smtp-Source: AGHT+IHUcajUQvAiQlcpyarsGKUlow+7UkFOgMUpz2TyLeDgZ26uWwara/bTnXaDMDjrdskS7D6z6Q==
X-Received: by 2002:a05:6870:52a:b0:2cc:3e39:7352 with SMTP id 586e51a60fabf-2ead0561b76mr207656fac.18.1749742306204;
        Thu, 12 Jun 2025 08:31:46 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4753:719f:673f:547c? ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab8edbd59sm319106fac.40.2025.06.12.08.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:31:44 -0700 (PDT)
Message-ID: <275cf035-f0ca-4aa6-a41f-b0c21d7c9374@baylibre.com>
Date: Thu, 12 Jun 2025 10:31:43 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] iio: amplifiers: ada4250: move offset_uv in struct
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
 <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-4-bf85ddea79f2@baylibre.com>
 <aErQVKul7Gnxvu3F@smile.fi.intel.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aErQVKul7Gnxvu3F@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 8:04 AM, Andy Shevchenko wrote:
> On Wed, Jun 11, 2025 at 04:33:04PM -0500, David Lechner wrote:
>> Move offset_uv in struct ada4250_state. This keeps things logically
>> grouped and reduces holes in the struct.
> 
> Can the (smallest part of) the diff for `pahole` runs be added here?
> 

Well, I didn't use pahole. I could just tell by looking at it. There
was int followed by two u8 followed by int, so we know there was a 2
byte hole before the last int.
