Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C242D9EC4
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843148; cv=none; b=SdbT+FqW63BqeiXoPt8TBFP4AGxfGzlas2/8//kHeS3lIWuTwTeC6+AdLE/TJ1OQbEFeweah6VdfpL8x96M3AUU74h+cq2BdsZYxUUkKdho5GhCN3ZD4s/s5h9SBTSNXvPbh8cJIaAIJ3gXqaMAvbOLhGl3jbsdsXVVzNcoLmts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843148; c=relaxed/simple;
	bh=20e3PphxG30T3V+Zob/qx0IQxDG73Gud5foeaYVbVvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b7BfgTOXYiic+g+wfM2c2gqKUxv5swpQoFu5DMfAnqQho131skGaPrZBMNmc9cKk1aEkxDoH5Amtv7eiVsnoajrmP+04FPn0oQZ+ohYBj+8IqPJm2XcRkHXKYdmk+hUjuYl9j8TRlaP8MnlqPJY0bIcvfQHh3U+BoIqGlz9GaBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yVSS5ONl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yVSS5ONl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4536b8c183cso4069775e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750843143; x=1751447943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojAQtrqRfWE5uG2/EcUt6MJrN5Ulz0bDOzZRTcZgA5A=;
        b=yVSS5ONlgQZLL68PH2r2KmK7ETejyMcCm5wiF5j70L9Vqdb3h9BBcWEk2B9ZP7ufC0
         V53h6hyFMq6bEmwmovlKSZqLyLSD1O+ij+0VMJk6XrmfPUVTrusL/TaZT9y3miQ8C75k
         1n0cIRrqKg2F828yMfKfD+giWFjaQNY+5cUX36nZFNp0uklf6TyQTbYvKs5BXyOYyHvE
         6Lfh9KF/Ue6pfb+lDm+hirDnoK+x/tbgXf/Kh0e42jYU4VmvVXiauFRSy4E/KFXTmcdj
         7eXd4Gi6OuLPWK0zWIun3Snav05yV2b4V2nK+94bX7cg1HUUYHzlBbpMQ7/Jod6y8KO2
         zYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843143; x=1751447943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojAQtrqRfWE5uG2/EcUt6MJrN5Ulz0bDOzZRTcZgA5A=;
        b=aHZ9hjPV+RcjlDTFFdyWuEVuraEaGiUVHpQB5QKNHGHudYbZU91LGwMk5Mof8Mvgsq
         996xwyq+l0pMMxPD4tmQFUrWLlOGafQRqVVQTOIZX+DpDLdlhWtINQxmMi1hsM+jmZEG
         1GjOKvYzRXUPlQeWEUsPT4uquQYFYDIA5BMJi2GFaY40b+bDIrGYE+mqvKM8li1fc2TV
         kM7O88QtDLV07fAI4suh0qLVvz2HomhZFvTtva4lo2LaUW6l7Lj/cet0Mgj+v4I/0w02
         A7fZQvJNAy9mcwC+3TihDKDSzQFYTF8RX61Z/X+BE92+voBJQ611VTpNcKeM+i/nXpp+
         8Kdg==
X-Forwarded-Encrypted: i=1; AJvYcCXnttiAnPafTXnKyLw9Am5X3O2anlEdg+BvEq/FgrpnyyHMXVIKGMOG4MzIIXlQwEtDHtlbNp/rdwng3Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbMM9wzkPZq82IQfORD/9P3HuOgx58GsnIVEBpQ1l77Gsw72AE
	DUQTD09hBZJ62HsHovtJQMCVtxnzD/bvI9yjS1PHHRTMxgt5BDpRCt8P+/ftn5U02cI=
X-Gm-Gg: ASbGnct/gekl7g1sw/EAnwXXTieXjwIuhWmnTeKK4CLT8L9xeItA9bMcJSPbni/CzCD
	3qJEDsjP/RxFYtc5/CUwZwka2q9rmmlXQfvdtrUZ8rLMvPxfroJQcKQm39pv6CQMK16C6eJ31rf
	Ha3fDeIkY0YraCybe3N1co2An7xpSQSqqypm6skMPIN7ywFSoFfFfX1ljNqfJYh4FSajvZAEV/m
	4heTkAXIaZyqN8gO2XASFjWLZY2zRWAM96WAhFUTWzcUxaMd1o7xucsdfz0jmdgtEOO+Vs/yb99
	du/oXaHTjqDhlDQRfDetvlp7mbtqnXEK89jE5+0fF5h/4zD+S2QtPhj8q2/KPc00QQA=
X-Google-Smtp-Source: AGHT+IHH7ZCWqc0u7ZgOrAL3WMonYTs/JRdAzK3sDu8U1/EewCY+ihQcjBc/zfznNgiZP8hFENkJ8Q==
X-Received: by 2002:a05:600c:450f:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-4537b631db6mr57163895e9.0.1750843143517;
        Wed, 25 Jun 2025 02:19:03 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80693c6sm3957051f8f.41.2025.06.25.02.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:19:03 -0700 (PDT)
Message-ID: <0c6c78da-575a-4d29-a79a-3903aa801b42@linaro.org>
Date: Wed, 25 Jun 2025 10:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] spi: spi-fsl-dspi: Stub out DMA functions
To: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-3-e7d574f5f62c@linaro.org>
 <aFrSgJ5xZfccEX9x@lizhi-Precision-Tower-5810>
 <290fc244-e88f-47a3-8dd3-0ec27eb5c60b@app.fastmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <290fc244-e88f-47a3-8dd3-0ec27eb5c60b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2025 6:16 pm, Arnd Bergmann wrote:
> On Tue, Jun 24, 2025, at 18:29, Frank Li wrote:
>> On Tue, Jun 24, 2025 at 11:35:33AM +0100, James Clark wrote:
>>> This will allow the build to succeed with !CONFIG_HAS_DMA, either due to
>>> a randconfig build test or when the target only uses one of the non-DMA
>>
>> I supposed you met kbuild error. If yes, can you add kbuild build report
>> tags.
> 
> Actually I would suggest making it a dependency on CONFIG_DMA_ENGINE
> instead of CONFIG_HAS_DMA, since that is the more relevant symbol.
> 

Makes sense.

> It would also be simpler to enforce this in Kconfig if we only
> care about users that use the DMA support.
> 
>        Arnd

But most of the devices supported by the driver don't do any DMA. That 
was the reason to stub them out rather than add the Kconfig depends.

