Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C5A207DEE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744923257; cv=none; b=lcaQPH7NF+8x96SZQJqHLMmT2j0FrJed6ddMt2mpSxOJCwiw9/yje6W0LlaoYn7Vlt3lv53VR+YrPy2+aEvVgdABSKT8hHyyhOmxz6rqyuBdPrCjadDrMziODsPAv+JxFYbG/756wN7vq2Q0VojkpJtBBSEmytEKUPJUVxmwhPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744923257; c=relaxed/simple;
	bh=/2LmxShOaQLvBEqccdDJUYFolTsOGX4GIEB0Z+NV5NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DhqjpgVbD1VonBhRarIpDsep0I6tKaGSoSZqDPXBsKG+VGlYOPLcyVJAKfD/E/kxHKCNG78aULesElMX9mg0QQOAZHkSurRKCtDhcHwQSFbrh8x1O9EauL+Nt46rluxmjOYxdt+rfJxnf3l1rCUySTYF4rw37ZZ6OFzBZJAquxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=jmHRcbOa; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="jmHRcbOa"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72ecc30903cso642322a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1744923254; x=1745528054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxyhzbzIHVkJvC2MgzVh8m2arwnfs5b3zesOIXgwMoA=;
        b=jmHRcbOaNXkwpQsvfKWbxmeQqAz/Zw/tvKUp8QQiNZvvGAmkOIkQKjb030czTBbXJQ
         M9BrBd75apUEjlPnkfyWovTbaSlx4tyojFjiZef0wgk+m+IZjEZoADRterCYUV2d2rDI
         DTCSWo3X2qpftyIeLiYgl3RippthuO6JxZ7rnb37PdcJ51PYxtVJRXOuUSAl7Od3CJDG
         0swqRpPWgeNpILQb2v0Tsn1Yd3WvoNSYaL6U5jFrHqil32693GHF64GQm0t4O8hyZP8m
         ZkwsawiIANHlH0xtw9B34BjjNWnmbLfirxim/8/D4aolH6jnvao6OZsYqwV2QOPdEKM2
         xLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744923254; x=1745528054;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxyhzbzIHVkJvC2MgzVh8m2arwnfs5b3zesOIXgwMoA=;
        b=fQLzIz3nPLKoKNLsOKPB07cOh54mOs3qPGmpvTlzyDt2YJODK+i7AdxwGTv5uRGJuJ
         wMFeOGlvabcr4znQ7WEjSDRNAi7pB/6YZfGZt4Ez46QJa0VsGvkWTO/UHuBI5xHuO4am
         0FwIE8cje9VdMBZyUbPKQhDaoMzSvR0MosGacSK4rw7aM6aD9QFg/gESpI76PUAG31a+
         es6cmydxlq/HVhT4Kbf52Tr17eQV1vxECKfFHCzDbrlIVUzyNo5cakHb6D/GPuZ5in5r
         C1mdOq1DRjEXTQRoFQs0Pm7FQartm8k/n8E7YgTiojESMbhVr/qVFlN/vmI85vRII/yv
         4lFw==
X-Gm-Message-State: AOJu0YwS+dM2dDj+xMmfdblGDiMARpGnaN3CpTOa0weGit5ZJNjOmC+F
	K5fHIYyOqWib/O/dzk6cUffiFMT8I1xil+qL360EoXlwxe/XjP9ZsjDEg3/irzA=
X-Gm-Gg: ASbGncsIRjL52KF+66keb8hRCAJG2ccA5ULtS6p9Q3KVpTPww/f9rj60+mMJ9h+ngdR
	GU4iT6iMs8m8wUhu1aOeQNyvioyd/61OkA5h+8HroFm9bcJsr6b7drW6fqA1wZnhQmziVjmHgwS
	c0QGpfffdM5i0icvBO9Ekz/P4ksLW70J6uFP4d0NG1/lknILi8aY6vVyHGgoGWMK1DCzUl2XEeC
	9F+G/eZbJ7Nb60JqdMjOHDYVRjeU55dyCtXA41fjkGv5hLcSU7OjcKjSsjKKZJAKe5nwbRQravs
	1nSKnRRzB8TVvqEzZDCcv5ZgIiHrHbyCArYMf9FJeNnf
X-Google-Smtp-Source: AGHT+IEEBCPGIT987h1aHaE/eKmnbK1GNdv4lCevrZreACU6pefT9/dZW63fGbDma8uaCTHrBWM2qQ==
X-Received: by 2002:a05:6830:600b:b0:72b:9506:8db0 with SMTP id 46e09a7af769-73006213195mr121803a34.12.1744923254576;
        Thu, 17 Apr 2025 13:54:14 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:8795:e9fb:beca:ef25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300478f3fasm89495a34.7.2025.04.17.13.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 13:54:14 -0700 (PDT)
Date: Thu, 17 Apr 2025 15:54:09 -0500
From: Corey Minyard <corey@minyard.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>,
	OpenIPMI Developers <openipmi-developer@lists.sourceforge.net>
Subject: Re: [PATCH v2] ipmi:si: Move SI type information into an info
 structure
Message-ID: <aAFqcaFGOoOVRpWO@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250416183614.3777003-2-corey@minyard.net>
 <aAEkdwD888tW2OUY@smile.fi.intel.com>
 <aAElHft1iVqZbhBA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAElHft1iVqZbhBA@smile.fi.intel.com>

On Thu, Apr 17, 2025 at 06:58:21PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 17, 2025 at 06:55:35PM +0300, Andy Shevchenko wrote:
> > On Wed, Apr 16, 2025 at 01:36:15PM -0500, Corey Minyard wrote:
> > > Andy reported:
> > > 
> > > Debian clang version 19.1.7 is not happy when compiled with
> > > `make W=1` (note, CONFIG_WERROR=y is the default):
> > > 
> > > ipmi_si_platform.c:268:15: error: cast to smaller integer type 'enum si_type'
> > > +from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> It seems you copied'n'pasted from narrow screen. The lines should kept as is
> (as long as they are) without an additional line break and plus sign.

Yep.  Thanks Andy.  Should this wait for for 6.16, or would 6.15 be
better?

-corey

> 
> > >   268 |         io.si_type      = (enum
> > > +si_type)device_get_match_data(&pdev->dev);
> 
> Ditto.
> 
> > > The IPMI SI type is an enum that was cast into a pointer that was
> > > then cast into an enum again.  That's not the greatest style, so
> > > instead create an info structure to hold the data and use that.
> > 
> > Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
