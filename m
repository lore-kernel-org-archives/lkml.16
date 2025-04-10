Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7567A1DDC1D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744296724; cv=none; b=ufTvbOjNdIJwXs+qAVtW6Q3C39X1zieGTkiwin11QfAB/fl7aUIhJ5oXu3x67qlcHpFsdmmoNBmmv+6iYKI01cvDb/gOyLC+y5PH98sRbY1KSd03bzosVH4KGXZowr5FrAqPbbJwQJDlAZqsKo/e5NKoqwuzLlXKBWRyACtbkCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744296724; c=relaxed/simple;
	bh=eBi8FrMYdAv96WqoDBdECWOvbUZG2lDDGziG85MEw5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnm7qdzfscFkB1IbqRbYprGLv4VmUt7tSM9QvtvC7LOHafuUf3bmcGLDphBI3OF5/5v4C5nTveAxICUo/xMS76Q40ErJ+Cl9UPc07mQz9WbNTT4UA95wlnA+WZw1KdH90rn94puPPmx3VShTRWctnQg8qhdoMbb5iiMt3LOaIac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CcX2t6FD; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CcX2t6FD"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-601ff283d70so256978eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744296720; x=1744901520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gOno/gJ7gBboQpb02wlzMcv67wZeVwPKwITP1UuvCY=;
        b=CcX2t6FDAT3zaHCpVPUAKdb+3fQrfnbsxHYaR9nWt8/Zj8DySNDbG4YEdxI1RRiGyQ
         YDaRZh7wj+KMqBsY1q7rUfL0fXJkv0Dyk5/VxYKHJTIVLpw7IpCO4H2roKi57mVMNI9c
         dQ6iHr3QIB+nD1TokGB2lQrdFzX+rCpvN7GoS+iy5/+1YTdQxS11333qG2jphgbwr2Of
         ENRF4zJLCeZ0dgwjzLdCTTrgSUZqkufMQ1qK1cs9uharIzmJikNB/7jnVYnt+ZjsBPvG
         wh+MdU+xTf4m+9gRZZm9apaDqUL6veM0uQGcdVyGTdx/Uh+GjuI6UgHs+BaeFV9xaM5s
         tC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744296720; x=1744901520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gOno/gJ7gBboQpb02wlzMcv67wZeVwPKwITP1UuvCY=;
        b=a4a4ke7nxMrurrapICdOhEuQTY1sBK5xTvqSQ3rnjUmWX8VfJBZjiwj7opYtBu0/vJ
         g8cPPA+2cdjwKSXsWBS6JbMiZzSzdBKFK8ew9bDqKhtWbBgjm9pqZAj2MQkXomyX/Br+
         St9mT9YkUTFSElRDRTvwYHCbP9gxVbV8hQTHNfvV9bQPeODAfabX4sVhXRuxhXrGilqr
         OH3VGF+itof6RLe39xbBXRTYjlAHQfvlF8ttBKfwT8SccOnEBDMAMlux3C2aVG5Ox3A9
         KTdn1NJ/U2f1D2RlTWD6cp8pBjqqzLHIwfSbJ7eiDVucGlLwJ5nAs3rcWVt2H5LoFEsQ
         O2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiVTeEodAAyE3UKGpi2GmMMpeWjEc6KvPiUON1VfF2uA5T2sDz4SvtGXXqIxt5X7gddSrZvyryBU+woVA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNc98Tw/k2ciYFAjoY2dVbuiVjsCBZt96yRPpfYq3H3G+W0nGV
	iOrzsrI1qJ3O0Mm7X0sCpeIVWNAydZOlmI7r9HkaqH0X7gzYs0NDw03Wp8LVRQpnawys5vXzQz9
	SiJM=
X-Gm-Gg: ASbGncsI9jqJuA3IZd8V2Z6rJ1/l6cobUU6lWhXGAjn64JkksVDrYrhianUIP2CJuWT
	1mr3zqw+uTYpAdwL44MCva58NtbO/FRmM+xHNPc0bH/TI2gDindXPDy8ZLu7AawMEnRE+ylPrIg
	B5Fuzk26dyglcWsfTLwI7zw689xCBhj1q8sgGsD+oHRwCjyVUk3y8vdVJHEXWnvMCfK34CwyLXJ
	MXbQzDH7LPOjwrYDuF98MkTdzaB9+LpBFRtu/0RKAXcZlgpa42VASRIc2im58+PtPiWBbTpBBmn
	4ZFQIS77zz6winCuR6M0nrPTRCf9hwjjzniUSVoGanVtUzTI+/4xQlqppYwg0qMU2rvShbiRiPo
	7gg==
X-Google-Smtp-Source: AGHT+IFUJXtIwbiWLX/m7VjN4bLSRvII3p6HjstMTq0XFlrXhNxKjwC2cdba/PqsU5xVZ2Oqe4rO3Q==
X-Received: by 2002:a05:6820:2d04:b0:604:2ac:840a with SMTP id 006d021491bc7-60466c47874mr1397703eaf.6.1744296720499;
        Thu, 10 Apr 2025 07:52:00 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f523066sm557756eaf.14.2025.04.10.07.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 07:51:59 -0700 (PDT)
Message-ID: <1254dfd7-e872-4c65-bd17-8015e1b2eba4@baylibre.com>
Date: Thu, 10 Apr 2025 09:51:57 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: addac: ad74115: Fix use of uninitialized variable
 rate
To: Purva Yeshi <purvayeshi550@gmail.com>, cosmin.tanislav@analog.com,
 lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250409202945.205088-1-purvayeshi550@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250409202945.205088-1-purvayeshi550@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/25 3:29 PM, Purva Yeshi wrote:
> Fix Smatch-detected error:
> drivers/iio/addac/ad74115.c:823 _ad74115_get_adc_code() error:
> uninitialized symbol 'rate'.
> 
> The variable rate was declared but not given any value before being used
> in a division. If the code reached that point without setting rate, it
> would cause unpredictable behavior.
> 
> Declare and initialize 'rate' to zero inside the 'else' block where it is
> used. This ensures 'rate' is always initialized before being passed to
> DIV_ROUND_CLOSEST.
> 
> Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
> ---
>  drivers/iio/addac/ad74115.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/addac/ad74115.c b/drivers/iio/addac/ad74115.c
> index a7e480f2472d..26770c68e5fa 100644
> --- a/drivers/iio/addac/ad74115.c
> +++ b/drivers/iio/addac/ad74115.c
> @@ -814,7 +814,7 @@ static int _ad74115_get_adc_code(struct ad74115_state *st,
>  			return -ETIMEDOUT;
>  	} else {
>  		unsigned int regval, wait_time;
> -		int rate;
> +		int rate = 0;
>  
>  		ret = ad74115_get_adc_rate(st, channel, &rate);
>  		if (ret < 0)

I don't see how rate could be used uninitialized since we are
returning the error if ad74115_get_adc_rate() fails.

Also, initializing to 0 would then cause a divide by 0 error
if that value was actually used later in the code.


