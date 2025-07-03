Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F9C2F363A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555628; cv=none; b=MWIIxR+VPXxVh1IRX5dtrT7bc9ptxdWDnuIuciUvwQIg7OTMQWMNRzUdvEpQUWkYAmqVuj2LG1nPYHa1ACwgZmtLyrzVzjhFS8m+/xx96fXsoKepL+y+eX97G5rBOjFeX1+utqLfMheOoCJWOTdeFYJ9YIBXKbgNvF+oJnfPAZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555628; c=relaxed/simple;
	bh=ypjreYPJ7DpTt9JqUM3qZTM6pG61xK8rDbalnxcM+mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=umM6Uvhch9pTjiJrFJjbhFI0UqAghARtQGXUvi0B/Grwlb9dpKiyNkaEfQl9eXLBGWXewiwC43LNs7K14u2kW7KnM66JtbeW2jXF78WDoQWAlp3CvJeZpy9BtcwGTQ0UlWv8speoxuQZmek6ZOfcyoNQj1GepCsIQLAtRkslN7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HPEIaEZj; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HPEIaEZj"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2ef891cd058so38030fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555626; x=1752160426; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KVPzloh1oUX1Y6h3ndP8c2+rIYKbbClu7XHnxXtmGIQ=;
        b=HPEIaEZjgXgOEE+d12SUGjtR//uGNfRSV6NHs+UqyfytZx+uoCAgEEPNz76mLS+yGV
         9SZQSyb7t58WL47QfS6wJJw88tIt1Z2HvD64MdtHR4f9iAK9kK4nUg55WrNox30xtS3w
         XYyO0XFQys1cpGscGl9yGNV8NPs8R4r/1BoF1gwVtL5vspWLxHp6lRnhOBvEEa9Ieu4p
         bIFYxUoQ8bK760Uf2j6jTDipWlh06qJAJZcdKsWZTXnTtzYYCg/9CKDVX0P6QczmjkiY
         VBlEEaVLjs9KlqIBTbfGmyhXdae0WUfsNzEx07iXFkEdU6F0PTBoXT/JoO/dES5r1Idj
         BGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555626; x=1752160426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVPzloh1oUX1Y6h3ndP8c2+rIYKbbClu7XHnxXtmGIQ=;
        b=rFDrSU0NVVIigR40280wxFbinUA5g8AvH5A7sNOuX9sRu81NXnlVmbVxfo4koBhYc2
         SpJfo/16tifaxcSW3ahGNepOBzHUoH7e9lvvIo0fVEna5/9rUeKPRK1JS1H0xPzED0/b
         1WvVnFTky/hBBcdPYW+M6Pl87Rf30fvN4HUjjfR4984bI4qT9lYod+kEPNXUwSJrNNOg
         YSz7KCvg8/3NYOZjJ3x3Fl8/HTiytWzvVvruDRkGdFlB6O00UJs8XoF7RjC1yIlAUiKE
         iLWcSeT3cSQCvwnSrSOWBFLTcmStAgk3i47c7B2gHD2QC8ugWJFmbDWxwxGs+tILGUPI
         OvXA==
X-Forwarded-Encrypted: i=1; AJvYcCVQxXiNokTWh2bm+7MszvvgsS2m/wDT/HECJY0pyQOs6eneA2cOahk69w7/JzLxu2Ap9eTm8Npi8MxKV2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaHFn/updDVkEuQ7SuWy7Qabo/HH7gc/+mbdiM8tTIwBjc+vC5
	Scg24AaIIfyrj2c8jdNxSNylYZkijocKouAGx+DTagocsKELwdgAl/J2YI55Mv8aLZpiCbaEv0w
	tm7zvgaL1ZTfZSTD8+zWZSjO6ndDeJxBGWjxlhV8K
X-Gm-Gg: ASbGncu9oefiEzaJdb/uLCAJ27OsOjOOgSPw3nnoKQY8XjVMfNGM+tcPd01DcPrUJEH
	reS7MobU97AdG7ghnKjQ4m4M36sxTqbDUqejGrmnEZNEZkwhOQoq1E9x8rEvupjhGBSm/dORyJi
	novaKE+21VIIWhy5xec87WekhJeA8XiofFbcXENU8heRpYUh9x2hg=
X-Google-Smtp-Source: AGHT+IFNofYLmKV5Ky0RG07x0qI3JXTBrrZQnExq8xPcLRUNb9KWtuoW/38SR0jSXaannNWxKg0dLKoxlfAIQh14pQs=
X-Received: by 2002:a05:6870:288b:b0:2d4:e101:13ec with SMTP id
 586e51a60fabf-2f5a8d3f1b6mr6005725fac.33.1751555625656; Thu, 03 Jul 2025
 08:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL0q8a6pOBZbWYdwKzC1U-PuH4rgf2miv0jcF=fWVZt_dUZHmw@mail.gmail.com>
 <20250630133343.GA26040@lst.de> <aGLyswGYD6Zai_sI@kbusch-mbp>
 <20250701132936.GA18807@lst.de> <aGRMilWhgF4z0WOf@kbusch-mbp>
 <20250703093042.GA7387@lst.de> <aGaTw7SzermpfiD7@kbusch-mbp>
In-Reply-To: <aGaTw7SzermpfiD7@kbusch-mbp>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Thu, 3 Jul 2025 16:13:33 +0100
X-Gm-Features: Ac12FXwWdPQaun6KP1n2WG90MWR4J8ZJY7tGLBNOTSkceZgMU661bsKnTuwWQZc
Message-ID: <CAL0q8a62bcjkJdKjTUbEOXMRfaCr1eB4YWeNugdRO1GjLLQe0g@mail.gmail.com>
Subject: Re: next-20250627: IOMMU DMA warning during NVMe I/O completion after 06cae0e3f61c
To: Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, linux-nvme@lists.infradead.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, axboe@kernel.dk, sagi@grimberg.me, 
	iommu@lists.linux.dev, Leon Romanovsky <leonro@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Jul 2025 at 15:29, Keith Busch <kbusch@kernel.org> wrote:
>
> On Thu, Jul 03, 2025 at 11:30:42AM +0200, Christoph Hellwig wrote:
> > I think the idea to reconstruct the dma addresses from PRPs should
> > be considered a failure by now.  It works fine for SGLs, but for
> > PRPs we're better off just stashing them away.  Bob, can you try
>
> s/Bob/Ben
>
> > something like the patch below?  To be fully safe it needs a mempool,
> > and it could use some cleanups, but it does pass testing on my setup
> > here, so I'd love to see if if fixes your issue.

I have tested it on my system and can no longer see the regression.

Happy to retest when the patch goes through.

Tested-by: Ben Copeland <ben.copeland@linaro.org>

Thank you!


Ben

>
> Thanks for confirming.
>
> While this is starting to look a bit messy, I believe it's still an
> overall win: you've cut down the vector walking in the setup path from 3
> to 1, which reduces a non-trivial amount of overhead for even moderately
> sized IO.
