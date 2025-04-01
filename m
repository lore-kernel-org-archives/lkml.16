Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1AD1F150B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 17:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743527543; cv=none; b=C38j3IwN1C3ET9kGzWa+2iIQTeistyiQ78v2zB5KImCjZifnyQ0yiCkVFYqkZ95iG3Ff8S46PRP9AmUVsO0O2WYuRO5buGLqTqXVJt6YzilmZn4C4vtcZEhBSBiZG3XYnuTTd8YPekYN/FaYByOUNUFOCfAORQxZX2QfN8ycJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743527543; c=relaxed/simple;
	bh=BP5il8vEaAu9aTth6vD6KtGRpBas/BFDLnGP8Zck+jI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcBsCdOR0LeiGMQs69gehEPPSQu5h7eJ0+He+8gJ9gUICqE5l89RRWBoEo5HMaweygceVexYECAMtov49721XYyJxkr8rink4Ki3MXqA2tpayrYvkgOzSFA5EIBuqjPklknPaOj3rgw0m4i/HDgTy/SxttdPKFSrQXYMirGfgO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QICRop94; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QICRop94"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72bccda48cbso3492222a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 10:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743527541; x=1744132341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UD+DYeYJxZX2qc60CEMQlzZ1bJFQsVcFTnUWz6yYLuM=;
        b=QICRop94zqRHlyWfyeq4ZekdlOkyntlvPl/GpH3z7Un8jXS9aMppFKyAYjHsC940we
         7l8zT0EiXuqdJUVPyPdtB+mUFK1dNhGje1NDMnZkHMMgMkNryV9dmNFw4GXFZc/aRCEg
         sI12pVp803RSR/zG7KSRB2nXZE5ZJYlaY+1X0+9HFzckUaFUt9dbuh8eDPYrjUnrzi0t
         yKDzHS+/5ziax0cLgqaTULwn8C5BMsWWdmYsLbj/oDGnckJMMOyUWGdVNcbJFSw0Bl6Z
         wXWN2oyJer8kKww2RB52yNWi9KeSz7zvD0nJ4VkLdDQbnSXJyWLSokIV+B0smf1nI5zj
         Yfeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743527541; x=1744132341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UD+DYeYJxZX2qc60CEMQlzZ1bJFQsVcFTnUWz6yYLuM=;
        b=CdDRx8HJzOSGexGC8ORMANerFAUFKv2zEIHYfF4ahP9nJ/lsU5Hgp0hoomWqrxfPXi
         uiAJznnigluo7Rv7KYgju/Vyvn6SVr7uOwv7y7OvINI+ierAFd3+J37x6ZSTzR0/OU9i
         sV5APQ+RtdWfdH3UajIXrAgMDj7L5zQsXFtFIyA+FqAZuIhcqsa7qmYsbFAhlhwJutIm
         kjIjlMyb8D20x9XT42s1w3jrj7A3w/MTfGb/qnaZo22PP3XDsINgCDhv6z7/olztyP9B
         PvFDZQPoecaHwpJTgOUUPiT0bYXwfUyOTrgcqNX3Wa32v+E18+qamN0b7Y2GdZjBqpsp
         7HvA==
X-Forwarded-Encrypted: i=1; AJvYcCVnxEQt+OABrkM4HbwnoaMoaRPaXPEl2JMenKtdtT9G1VbYQtZESNfEsw5gR+GQNb6tMAeL8Gu//iIw6mw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYGlDVUq8laNKSy12Mo+0GtO/EucWpol9NcC6VfejOwi4nrhyA
	SuwjUDdjUS3bVdtFvZNfFNLEOKCCwASFlsNokP9+5XgRLO0RmeKurzR+/JA6dYQ=
X-Gm-Gg: ASbGncuSr2W9acOcRSKtjTZ6GiO1T2A8Psq4tZpxeW5l4ua7blLJpJeCzVHWzgGG5XA
	tXIBWZPY2sgpzDmm2j8n57DZELqcIyKg9yeogQuLFKmYrt/TLGSwOBGNlP8UrYw/v/W6kU0eNJr
	8+gaNz0auXbBB9Vp/TaO38ezTuMb63QP1E1nhqp7P3eTzbnuNWbh7nrV2/vH6+rc1YG9o2iDapS
	3jfkygRD6I9JTIQs274hQIb9g/DRymsoZKJuz9eMZQBUASLwIdHE4XG4fGKnnl9jKLcrsTRQ7QN
	rOlhZMYf+cgbZI+2tuLAPoJFkb1M88MGFJwKPG6nsJCeQ+96UDMGBKo7r4/+TGtslXACSqVAnuI
	IEjYmhA==
X-Google-Smtp-Source: AGHT+IFO98sJd1GOfYYUHbpUvxWXLRd7beck4SwvpYzQJESTfWe3OYpajZbcTX2Jw9Pw0NfMaczKjQ==
X-Received: by 2002:a05:6830:6509:b0:72b:9bff:abb with SMTP id 46e09a7af769-72c6381de2amr8883395a34.19.1743527541164;
        Tue, 01 Apr 2025 10:12:21 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c580ba906sm1921676a34.25.2025.04.01.10.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 10:12:19 -0700 (PDT)
Message-ID: <2d78031f-de8f-42e4-ad3e-42cff63387f1@baylibre.com>
Date: Tue, 1 Apr 2025 12:12:17 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/17] iio: adc: ad7768-1: add low pass -3dB cutoff
 attribute
To: Jonathan Santos <Jonathan.Santos@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 marcelo.schmitt@analog.com, jic23@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, lgirdwood@gmail.com, broonie@kernel.org,
 marcelo.schmitt1@gmail.com, jonath4nns@gmail.com
References: <cover.1741268122.git.Jonathan.Santos@analog.com>
 <2aa347a97e7ea974951609b0bdf81cad0b21b993.1741268122.git.Jonathan.Santos@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <2aa347a97e7ea974951609b0bdf81cad0b21b993.1741268122.git.Jonathan.Santos@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/6/25 3:04 PM, Jonathan Santos wrote:
> Ad7768-1 has a different -3db frequency multiplier depending on
> the filter type configured. The cutoff frequency also varies according
> to the current ODR.
> 
> Add a readonly low pass -3dB frequency cutoff attribute to clarify to
> the user which bandwidth is being allowed depending on the filter
> configurations.
> 
> Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

