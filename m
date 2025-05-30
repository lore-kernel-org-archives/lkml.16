Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680A91DE896
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748590705; cv=none; b=epkBLkmU3sHguUkgmQGrWDm/mOVmB48j1ea5YaEdhkfMza9nnOjpWgXXkWZZ3sVPX/FunLYQ5SxH8+OCQM0VPA0Lu5G8ukJtvyN38wLo5NQBB4XnQlkElY8ir8AeBc6mkXgGmg3bII1bRlNTcREyB9cXd6Vj4xcdrTabxTKNHb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748590705; c=relaxed/simple;
	bh=iQgrvOqRA70LGQbw+GLCqJWS7MwZcGOXx4QpLJML8B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhN712tChHeqUR4Sk68qXDPAGmnrSDk6pQqEUkYM7VY8fULZdvRr8RovASDllKY32WI40EBGdhInxOg/B/gqR5fnV6NVEZhCK4ZghtfMBsRwhbSAzwgdFhz/wEVMyGj6+QCmtYGLVDKeWu4fn5j6vnMzXy6sX2hjkQB8pOXk6eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TwvbsS9d; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TwvbsS9d"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a37a243388so1417697f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 00:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748590702; x=1749195502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LfnbZiQbAmqPKSfMf+Mq18rGvap4moTa+Dp1DimkkJE=;
        b=TwvbsS9d3VlOo3x6Q//jbKnLl5Vx4QDTxknbDZXit1vgjNBupa+rTyv9V6VEIT43tT
         YZdImqytpkQBbO7cs5TPqbthDEj6MOsC0m3xzz39H3+juQJbXll1iU2a+/E5hma12GxV
         7hTu/o+eqjw10KGJdF91MrJkn50gBgR9q5YsVw0CTintje57+ZisT38Ff+8lhsLiOUPY
         ySHAF8DG7ZvdLn1F4z9gzenTSnXBnu1PXNSbjE1ApByfKuwZqsSVwkR4Ak7/3UI1GMgg
         R5JZm2K6bHQsOzZeW6PJrVkgLGUMEG5HEsliGC+OERW1BV7cjCTz1yNVKKimTwvg/ugv
         ayFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748590702; x=1749195502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfnbZiQbAmqPKSfMf+Mq18rGvap4moTa+Dp1DimkkJE=;
        b=M57QgFC7lhwinraYlap8oid34Vjzb49IsYnXx/wCU7HoR5S5/LL9rBeeVwDN7Ettae
         lY3ydmxlOHS6jyO/MLdUHyuzGcyxzTEgrI2ojJo3DSAhBKBH0j9BpufYnodiDpSVSSm8
         LNYDUVLHLf+G84Q4OUPrLR//SQkrUKn9GOdxojtMDR9SKFBqbeU7BLTFBiOIopf6DZ/a
         2rACiz6vK7W+VwCSlUFw3pWtIADtqTZBVFvY7WBBnKk1/ELt4LpQ5aBv3WAyEggxashF
         ET3lfL/kXk3ao6mjaHIFWt7Wl450pFSI6btBNu/8HWGadH+QG6m7diuccubn7smrRJdT
         2+rQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1SUjb53WcaY7THmDNHA0HpuIqo90Vhr0HKrF1Hg9MEkEVdlw6WfVP62s6VjEe9eCINZjr1RAm7mZG25U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yweh22cGKypGKOlyUSZQQ3X6/4TXWAlOqRq8IdME+lqn4uPAm2B
	EM4iZCWueMqXJk7e7QFFbfhkVo9imbBRIA2NC2DgPboBJX1JcbaeVWrKC1KPqhaeXaElku9F9cx
	DKlje
X-Gm-Gg: ASbGnctL6Lq648NhvfItha/GY2CNYSocBz8KRyHCYDmhyjxUKIg437Ci05Inwk773Vm
	d+HiDkFkjk1dJVQ5g9+88v/8xIiW4Hwp4TtmgF7njZk6Re/fS/s/auKA+wWzEkOcjcHAXBa71QS
	sZ0Wb5QNc7bxUyiOX52Mf8QpWzFGYATGYmij/HEixDo7zB5tSMG0jKdoTjpIFFJ0Xni6a5khZMI
	sszWV3txA3+clJwdHi7YsV7QX5mFj2XQ/ykI8sJUT/pFCC3lgmQasfhdJeLaE1AHKCY3fDdKcIB
	lrABCIetSOqLqVE2YyOrkWmdcqXOlG2KRFmzujfVG5Ejb353htHsSAFmitM+JVWm2MXrBNr/4cS
	jjmWqGVwLstbAfDJ8fUyJrAY5kw4fow==
X-Google-Smtp-Source: AGHT+IE9MXHewsFsO65gOCbyBARWfhxCc3GiAp4JhYo92c97qkhscjKdSO1/x+TgAzn1ycE2rzPEIA==
X-Received: by 2002:a05:6000:4212:b0:3a4:e1d2:9a7a with SMTP id ffacd0b85a97d-3a4f7aa591fmr1586687f8f.46.1748590701612;
        Fri, 30 May 2025 00:38:21 -0700 (PDT)
Received: from archlinux (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009758esm4057600f8f.75.2025.05.30.00.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 00:38:20 -0700 (PDT)
Date: Fri, 30 May 2025 09:36:57 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/6] Documentation: ABI: IIO: add calibconv_delay
 documentation
Message-ID: <lj2jhnuggbpil5ogler7uruhf5uv5u6lnrs5jxgsvxiy5lq2fd@kwmvftbyozkl>
References: <20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com>
 <20250526-wip-bl-ad7606-calibration-v7-1-b487022ce199@baylibre.com>
 <aDbmTaX1d0HCx8V2@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDbmTaX1d0HCx8V2@smile.fi.intel.com>

Hi Jonathan,

If all the rest is ok and there is no need for v8, could you maybe adjust
to 6.17 on acceptance ?

Thanks a lot,
regards
angelo

On 28.05.2025 13:32, Andy Shevchenko wrote:
> On Mon, May 26, 2025 at 12:03:16PM +0200, Angelo Dureghello wrote:
> > 
> > Add new IIO "convdelay" documentation.
> > 
> > The ad7606 implements a phase calibation feature, in nanoseconds.
> > Being this a time delay, using the convdelay suffix.
> 
> ...
> 
> > +KernelVersion:	6.16
> 
> You need to bump to 6.17 if it's not a fix.
> 
> ...
> 
> > +KernelVersion:	6.16
> 
> Ditto.
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
