Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88920213E8E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 19:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743448366; cv=none; b=bfEc8O6OR/DGFBPXAKQdhIX50IJwu62c426pga60uM4QLqDwD0SXxRsfGpzXp+RME9rWsIJnGP/+owjgclqRy74NN7SXaylF9lJe/poJOWkhhUkNBm1y5nO9k5TBGIOw5eJbk59vA/vG8koruSBlsmW5lnj1WUL0fTNgRYKT0Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743448366; c=relaxed/simple;
	bh=FynjO+wyrDxQU76r4XZQPeVNoSz6E2PDqYfEE2ZRHJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qb+H06NFo/LuUviUHBQAkxqF84K3OIHcLl2+0ol/GTQXyWQkwyqO7lzzFMy9YN1ff9auchR7RfasS26FUhb/ESsCKR1nMaWuc4nAia6XjSFz7zRb2Skk/m6jG7e0KJKnImLVx3wxp/vPc5X0dxZxr9dVQbbT3cEYC86aTIyraqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Oc7nN89G; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Oc7nN89G"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso7553424a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 12:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743448362; x=1744053162; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i+ZQnQ80R0WMIpJCwElOQwANooBm/ZMxuRWkUPoDmbE=;
        b=Oc7nN89G7mR9CQfkxfeTaBdk5PXyUvZkWZIuw+hSuujjn6U51vg1udHPLNPPTHvANL
         riy07Jgg4RR3yKlxH3mmBn8DKandeQPb4XZCAl0jZOqsN9pe/zDbf8w6heRSTAOGO7pC
         nEZeoBFlx20vLc6VrLb41ivr/UDYiXvMDMXxjHnAvcs7OlbJXeziAQl+9jL/hZ5FNuyI
         GT0XxmxcnnvW81mh11S45ISIz9gLXC7UPHSWkYlT3vEsgsqRBQSwLODR0OML014S1MDX
         y2Q+5WdU9Taojmwg+5cWuD+qaSdaSWD1rl2/e7uQ1QBqPSatAi8ECacrjM/NodYQjMZH
         c7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743448362; x=1744053162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+ZQnQ80R0WMIpJCwElOQwANooBm/ZMxuRWkUPoDmbE=;
        b=VQgUCgU7R0kdis8fXnc2sjWkcioqQN1I9IhEJi4FpABn1oCIYitef1hmjsW9fq/IqW
         9sJISCCMHgLHnX9oNl7q+lagww43z+c4odXj7kFD5N+WdbnR5itQ7xwjC20Kf31J2UM7
         r+jxNCkf6rchsHAtv9mnJD37OKYofTUyVjYfv8nkvyfssQYVeCjo0/5HQkPTxPvtywmc
         TvCXoW/jfjUcszrzdlwyihnAEZXF0iDcwq5faoKo+QJqslVjxgECLrOU4QRVoc+QQWWL
         vFyIyIGSqn3KTkugSuGJ+uUu/IMvI78cePsn8YUW1P54JxDjgoeJULDdZoGM0Hn/baoQ
         wADA==
X-Forwarded-Encrypted: i=1; AJvYcCUM/DjWLFCi4H7Q24Yr3UjYKDaKkX6BLnJwrcjd31MWZHtBSyS0x5+CKZxZmVuflbeZPhvkirPAu/0sr80=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSoHQdNE8fJtEvz3SpM4pe0aROLChNpml0haoaCT1zsMPUfkX
	C9G7yGyVjYcZNMfwju4w6G6wYfBDSd6iAb7ar5D06tfe5Y4HcmnzUGLlBnYlwUo=
X-Gm-Gg: ASbGncujadIoIheRI9IDvqiITy2svJjo9eSKHieMBaGAtltzItCxfWm7p2ej+xSZup9
	yR7DPqnFXDd9rLlUr+46t2oj4fi7PWVxS0iGOfdsN0z2bWxbwBWamDlxj/j8VFYBp/dbotM1b5C
	lhtvr3hSd/4DRSh5kS9SWmfrUE7a3eq5zuoeEUUlTjRAhD48D4y7oYyjsR2SleP1hGgFTVpKQpL
	TG3ReO+2KgctmSuG70YKPBk5Zm1cu7u/7QeXDMjPsTBCIvt+ooJtc+d4wxlluDGVS1LB2y0FkBz
	Vad2UFILM+iUPU9sfvb92rAFKPZiX40JD7XG4DuvMl2EPOotuH54dq3TI7QHWBL7pxYzh6Xs2Q2
	T0eTOEmRAXcnVv+VQHOCskQ8=
X-Google-Smtp-Source: AGHT+IHYlyt8xY0epQjTlOCW+TVkJ9R/yks8RK5qvgPhFcudpqb9LYxazj5SPyj/oXKpLpHkVhq25A==
X-Received: by 2002:a17:907:7e82:b0:ac1:e332:b1f5 with SMTP id a640c23a62f3a-ac738b61c9cmr1026985366b.37.1743448361779;
        Mon, 31 Mar 2025 12:12:41 -0700 (PDT)
Received: from archlinux (host-80-116-51-172.pool80116.interbusiness.it. [80.116.51.172])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac76fa520absm145764166b.112.2025.03.31.12.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 12:12:41 -0700 (PDT)
Date: Mon, 31 Mar 2025 21:11:30 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Jonathan Corbet <corbet@lwn.net>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] iio: ad3552r-hs: add support for internal ramp
 generator
Message-ID: <ucmb7wfkovo6mssmmrx4fmfv2hliulshjhob4efz2phczbnu74@3xphjz5schp4>
References: <20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com>
 <20250330175350.6cebf779@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330175350.6cebf779@jic23-huawei>

Hi Jonathan,

On 30.03.2025 17:53, Jonathan Cameron wrote:
> On Fri, 21 Mar 2025 21:28:47 +0100
> Angelo Dureghello <adureghello@baylibre.com> wrote:
> 
> > Add support to enable the HDL IP core internal ramp generator,
> > actually managed by the adi-axi-dac backend. 
> 
> What is it for?  Circuit testing or something else?
> We have in the past had pattern generators in IIO (currently under
> frequency drivers, though I'm not sure what we have in the way of
> waveforms in the stuff outside staging) so I'd like to be sure
> this is about debug rather than a pattern that is actually expected
> to be useful.
> 

Sorry form some reason seen this too late, just sent a v2.

Anyway, the signal is a tooth wave at 280Hz, not sure that pattern
can be of any use except for some dabug cases, or noise tests.


Regards,
angelo

> Jonathan
> 
> > 
> > It works this way:
> > 
> > /sys/bus/iio/devices/iio:device0# echo 1 > buffer0/out_voltage0_en 
> > /sys/bus/iio/devices/iio:device0# echo 1 > buffer0/out_voltage1_en                                           
> > /sys/bus/iio/devices/iio:device0# echo 1 > buffer0/enable 
> > 
> > Activating ramp generator:
> > 
> > /sys/kernel/debug/iio/iio:device0# echo -n backend-ramp-generator > data_source
> > 
> > Deactivating:
> > 
> > /sys/kernel/debug/iio/iio:device0# echo -n iio-buffer > data_source
> > 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> > ---
> > Angelo Dureghello (4):
> >       docs: iio: add documentation for ad3552r driver
> >       iio: backend: add support for data source get
> >       iio: dac: adi-axi-dac: add data source get
> >       iio: dac: ad3552r-hs: add support for internal ramp
> > 
> >  Documentation/iio/ad3552r.rst      |  65 +++++++++++++++++++++++
> >  Documentation/iio/index.rst        |   1 +
> >  MAINTAINERS                        |   1 +
> >  drivers/iio/dac/ad3552r-hs.c       | 106 ++++++++++++++++++++++++++++++++++---
> >  drivers/iio/dac/adi-axi-dac.c      |  27 ++++++++++
> >  drivers/iio/industrialio-backend.c |  28 ++++++++++
> >  include/linux/iio/backend.h        |   5 ++
> >  7 files changed, 227 insertions(+), 6 deletions(-)
> > ---
> > base-commit: eb870a5af7db1e5ca59330875125230b28e630f9
> > change-id: 20250321-wip-bl-ad3552r-fixes-4a386944c170
> > 
> > Best regards,
> 
