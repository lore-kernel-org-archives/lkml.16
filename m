Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8527A17A2EA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749726331; cv=none; b=H6REXKla/QRGfTbo9gE5+Ke+NxfFZ8CPJH9DvnodY/EBD0Zd/8JEWaoHqase5z6CRUe9tI0Oz7foYdk4v+/mMTtFAfMdGlVYjIdfu72V5Ts3CaF023YPK7hapHF+jaXHsT7+6PC9Xrx/1hqS+sj4P25Ti7ZCZn6VXg5n7FxLyhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749726331; c=relaxed/simple;
	bh=VmVdPGLJWVp1Q+RRMP+IPcIfqsGTNRzvggSjlNeCNHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEy5lTaI1uTwcem3QD30Y+7K3KWL+wV4Ug5m0PT+mszV6xQDzK91huAjkBxrw8mG1Vq0kcBNo7Sz+NXu9uJc31hVGheKLGIezTOtwSI5wazPxkSILRoqbeQGi1Q4ajLH+YPvhWq+XaNfQNWIyW79rdLLAHSLEfH51TQGiW9pi7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGBsA9Ty; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGBsA9Ty"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a528243636so519777f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749726328; x=1750331128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7u4uVBYqmPw4TM6JxOSbDHprNtjOfckENCh20/XDzs=;
        b=xGBsA9Tyj0keivIGMnDoulHYNW/90tQGyMWZJbhJGjdvp5ZCOv+crARY9AlNH0JD8y
         SdGKrCc8tPzUVeH7U7OldWGwZboemPeHxeCRZePaPWnIUa7tDLCdRfts2QU6Tnm07VyM
         A+csCl78a8rNK5UajcVjEvolV4hpaTNk5DuEoNwD0f/USS1a7SR2gylj2PFuws0Fx7Rd
         ox3cmUOCbGmS6d4sS/hykjgK7vBQeKzKAZs5xCibzFvk9+WW9JMgq9u0+yHOsPoNnDDk
         pS0wYqpYy/q/zbTqV0aUPyTtqdaBVyustyeZk1V6o2MUtPWG/nT6gjojXpeFj8g1kxET
         +MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749726328; x=1750331128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7u4uVBYqmPw4TM6JxOSbDHprNtjOfckENCh20/XDzs=;
        b=AamYaCzB5V6Qe1niRFG3VmwR7qYGu3CyO13ZDEj08DTgkEREYA959tCDiKu8ME5ZNb
         TTZ0RhzqN9QyOia0w3P1P8bLWlhDTK/znXwYAo7Ye1GHP3bNF8nAQYVFgJ6OtTbqmzAz
         QDsUrWT/nB/rBlU2YFehFlkOlax5ubDv2dAO/0lPwEgGuftuljv0/8O06RVhPD+AfzEX
         RLwnKb0ke7wT+j7+GZQr96slVAorJJVb802tQXHcwRbicsUSAyegqow4OSKANbUUvuh/
         6rN6kBtZaUsy8ZkVap0gOVldU5r4yZl30tnQ0v1OAKPEowd6OKd1ViG2GrFlqGImZVPx
         ZNwg==
X-Forwarded-Encrypted: i=1; AJvYcCVfiFQ4yn5G1SLkKgloormTWv+ja3xcec13wHVUxPy78Er2TP5I8y9oQ8P9DvEI+afqLYF5umkRk+V5mVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw96OdOVu9pr3drV1hXyQF3e56J8DOWCs/emNTuoCVGRFzFeLaK
	fSh906bNEe7RHNXBxx3wyX7uMMUgJOh9JBmMpkHmc3qptkOR8/1GU/B76DUKjjj4lmc=
X-Gm-Gg: ASbGnctrTMnYKRzVCSQ2cZE085WIk7Z8tvykDaWli0cVoZtk/AVYEFPUz9/0rJmQFyy
	PmQgJ700hPFIrWauHVA81UHsrhAwtFAPZSmm+c5pyssF2cZ/J7CwNMt6ECGKU4w7VtAUjxCjSrM
	XBfOUST8/yt662N1O7nreQYqppjyaDhtoMvp0aQFtPf7QPtr7aHQy6ZzgY2w93KIkqiYAqcg9YT
	IEsJvtnkqkxL53evelnzCi2wBLvEuG1lfiKiq2xyvFNd4+zsnHwofWr0S3FWwuuzjOBUTYLuni9
	bZAA5Gp0Jn5MYJ1FfYdFoO3b55465xVatHy4kGTE2LA4+ncpv+153ndhx07kahnOQ3E=
X-Google-Smtp-Source: AGHT+IGqh+W+S3heXakioz/3q0T976hhBdPRspmk0RARxwVhScFCvhjgC58QG45FOLgAchX8ykqp6A==
X-Received: by 2002:a05:6000:4284:b0:3a5:2fe2:c9e1 with SMTP id ffacd0b85a97d-3a56075a5b0mr2326130f8f.30.1749726327860;
        Thu, 12 Jun 2025 04:05:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5619767b3sm1719322f8f.13.2025.06.12.04.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 04:05:27 -0700 (PDT)
Message-ID: <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
Date: Thu, 12 Jun 2025 12:05:26 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250611090107.t35zatn47vetnvse@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/06/2025 10:01 am, Vladimir Oltean wrote:
> On Tue, Jun 10, 2025 at 11:56:34AM -0400, Frank Li wrote:
>> Can you add performance beneafit information after use non-coherent memory
>> in commit message to let reviewer easily know your intention.
> 
> To expand on that, you can post the output of something like this
> (before and after):
> $ spidev_test --device /dev/spidev1.0 --bpw 8 --size 256 --cpha --iter 10000000 --speed 10000000
> where /dev/spidev1.0 is an unconnected chip select with a dummy entry in
> the device tree.

Coherent (before):

rate: tx 385.8kbps, rx 385.8kbps
rate: tx 1215.7kbps, rx 1215.7kbps
rate: tx 1845.2kbps, rx 1845.2kbps
rate: tx 1844.0kbps, rx 1844.0kbps
rate: tx 1846.1kbps, rx 1846.1kbps
rate: tx 1844.8kbps, rx 1844.8kbps
rate: tx 1844.4kbps, rx 1844.4kbps
rate: tx 1846.9kbps, rx 1846.9kbps
rate: tx 1846.5kbps, rx 1846.5kbps
rate: tx 1843.2kbps, rx 1843.2kbps
rate: tx 1844.8kbps, rx 1844.8kbps
rate: tx 1845.2kbps, rx 1845.2kbps
rate: tx 1846.5kbps, rx 1846.5kbps

Non-coherent (after):

rate: tx 314.6kbps, rx 314.6kbps
rate: tx 748.3kbps, rx 748.3kbps
rate: tx 1845.2kbps, rx 1845.2kbps
rate: tx 1849.3kbps, rx 1849.3kbps
rate: tx 1846.1kbps, rx 1846.1kbps
rate: tx 1847.3kbps, rx 1847.3kbps
rate: tx 1845.7kbps, rx 1845.7kbps
rate: tx 1846.5kbps, rx 1846.5kbps
rate: tx 1844.4kbps, rx 1844.4kbps
rate: tx 1847.3kbps, rx 1847.3kbps
rate: tx 1847.3kbps, rx 1847.3kbps
rate: tx 1845.7kbps, rx 1845.7kbps
rate: tx 1846.5kbps, rx 1846.5kbps

Ignoring anything less than 1800 as starting up, coherent has an average 
of 1845.2kbps and non-coherent 1846.5kbps. Not sure if that's just noise 
or an actual effect.

With stress running in the background the difference in average over 17 
runs is slightly more significant:

   stress -m 8 --vm-stride 1 --vm-bytes 64MB

Coherent: 2105.5kbps
Non-coherent: 2125.6kbps

There's not much variance in the runs either, they're pretty much always 
2105 and 2125 +-1 so I don't think this result is noise.

(No idea why it goes faster when it's under load, but I hope that can be 
ignored for this test)

