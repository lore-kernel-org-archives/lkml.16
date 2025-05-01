Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FAE1EFFA3
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746102898; cv=none; b=mN3FQajQF7c40PAj9R9rHvDODCvvkwuCqkpav939nHHp2NUw4RRpchY7yqEIJp1e4FtymWtlDJeEN+1IZfsJjLDIkSGA/g/gOuyutgbVyu3BWkQ9He6H7fu8dG7GdEI97V/VGNXLckMcJkOksByafEDhMZfAYPsY+S1HBzDpHpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746102898; c=relaxed/simple;
	bh=G/RoUkwRiQOXSxv59xARYxUagM8QnADLC3A1IwKkiow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5AjDaJ4NAXX5dbi/p0YVPLda0iu7ioHQaVH7Mh7Mmu6ZGmkKGxuWoqsiUQxLIphztoBW4Rkb2Pnb3N+QbUJe2uzc1MMmHWhC1IX8yDdCGLd7goqtDMlG4PeMmg6x7Hdea3WZ/QboomGGmb44SHG6Kcx0K1Oll9Se8szinpXcMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ihA8sECS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ihA8sECS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso714306f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 05:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746102894; x=1746707694; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YPiLjAi9V3LXrkyU6HTBrDXuzWqvSmJyUjh3f1X0IeI=;
        b=ihA8sECSaXXezSez7u0E8+0uPxU4bItflTyv6QgSsrgJpN3mkLtAQHnL+jBRsSXjfD
         sjCuQpAIdU7Tw+pI3jkNwrfEK0W5KiUit10FIKdIbAqpudCg8tsl1RxxAH3kemupXR7u
         BKGaN8a/yvyWBrio22dYuUmhEOkwDEGMjgfVkxZmiFkdnc1A6UmodzLNRBErAzbGZXAF
         bStJ6lKgo0/5zFH+o2CxCy/OqgQbCLnx44a7kI21jOUTB1UfJBJR863O97xa7R1xG8MI
         Akkiuu3Nw+UQkaAku9GpN4a4+IohP4pVKHTV8H/Cd995YTkzX9RXcmYpPmVY4FCcReUj
         soNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746102894; x=1746707694;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPiLjAi9V3LXrkyU6HTBrDXuzWqvSmJyUjh3f1X0IeI=;
        b=BTH8WN34ImcABv17ec4AwiaAZ4lVF9kb9XKTXAmqNr09WFBI7enNmJ74bdHbza5gk4
         MpeF5duT7GC2BLzC3aaKc0KUz5iF0rXQ45WCFXACZUotmANO6Xuz+FdlGQsNtOnk5lBX
         RIn02KBKnq6gbz9Dd6oEPXp1I6IPb4UL7nla6XlYhnpLQ9gh0Y6HZKlxleV51OzP3CpD
         a566vltfphycDmZIDtW4dBpTQ5xYorP9YDODkLLML0bDOmcQmWXtsyxuj/ImSDrnvmPQ
         4V28GqAPSOhCEeFoXD9mAC7g/n4ebNArVJq+i8a0pp3Xm5M8RIvrb9m1rTt4VGF6hmDE
         n0OA==
X-Forwarded-Encrypted: i=1; AJvYcCVyvIaE+1J3BEgu9OVNQGmPle/dnYj/WI2LbN8GqXJp59KWG9T8X+ih5G4d6wdeLcYtg6LBPnZZNRcDJaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YypQ944whFw1XjZrjweAPzPTJSFrvnmuBHMcDZGedMcfpuuJeR0
	H4dYrIvwq3BgoorId3Rfks2B/VEn9EXYlD0OBVBXoQ54NqcfnKCjQbYhJazxU6g=
X-Gm-Gg: ASbGncuoDXJ6/X8IuUPWizqNPf1Z4oikqVTa9DXBqAGEiw3uYxGy63DmP3GWr16iqj1
	OF6DyqEN5s7hWVQIfhbqD3sUVjst5Gp6pDRQ+b5mimmZf1Ge8JFu6PBVFmXRJSMqrLaaBAOpCke
	v1cM9CX3WxjVnffLIi/6Ri3YO1NDdI2C+hamuDygey9TZBDxBW3X+8LwdpYnqqw51DFe2+rANCF
	CUvZ2RSf+Kgd0ZfFNWa/jXRp5Dqyin9KLTi+cMLTw+9PJNSaBkPdBM+BSL5vs9bm71EutfWC3OZ
	uBRTGEzrSfItOT67sXLN0BIcIQFEp9pkMDjbytloeK3tQNHKAz2aUf63uJEgQ00bXhi8A/0wYrR
	TvDJTMvM=
X-Google-Smtp-Source: AGHT+IEIbbf/OZuD+Zj46a1YVLMU7rprN2/0xvSeZWv1bKsLNfcqHiG2P4WlaJMEjA6SHfzilU5zzQ==
X-Received: by 2002:a5d:598c:0:b0:39c:dfa:d33e with SMTP id ffacd0b85a97d-3a09404c7e8mr1529963f8f.23.1746102894180;
        Thu, 01 May 2025 05:34:54 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a3df91sm745593f8f.9.2025.05.01.05.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:34:53 -0700 (PDT)
Date: Thu, 1 May 2025 14:33:42 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: David Lechner <dlechner@baylibre.com>
Cc: Andy Shevchenko <andy@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/5] Documentation: ABI: IIO: add calibphase_delay
 documentation
Message-ID: <jvhwdzmruov3je7qvsncn4naxg2cbbset27vr6tfjl3fumw7es@v3ho7m6iwaqp>
References: <20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com>
 <20250429-wip-bl-ad7606-calibration-v1-1-eb4d4821b172@baylibre.com>
 <4645ae3e0c3bb1ada9d4cadce77b64fe5e651596.camel@gmail.com>
 <070b269c-c536-49c5-a11d-7e23653613f9@baylibre.com>
 <aBI3eUPirZEXpZgG@smile.fi.intel.com>
 <896023ae-c279-4201-a7a8-dfd9b33fe0e5@baylibre.com>
 <7fe18625-3a25-40c8-bfb7-a7a22a3eccff@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7fe18625-3a25-40c8-bfb7-a7a22a3eccff@baylibre.com>

On 30.04.2025 10:04, David Lechner wrote:
> On 4/30/25 9:56 AM, David Lechner wrote:
> > On 4/30/25 9:45 AM, Andy Shevchenko wrote:
> >> On Wed, Apr 30, 2025 at 09:21:28AM -0500, David Lechner wrote:
> >>> On 4/30/25 12:40 AM, Nuno Sá wrote:
> >>>> On Tue, 2025-04-29 at 15:06 +0200, Angelo Dureghello wrote:
> >>>>> From: Angelo Dureghello <adureghello@baylibre.com>
> >>>>>
> >>>>> Add new IIO calibphase_delay documentation.
> >>>>>
> >>>>> The delay suffix is added to specify that the phase, generally in
> >>>>> radiants, is for this case (needed from ad7606) in nanoseconds.
> >>
> >> ...
> >>
> >>>>> +What:		/sys/bus/iio/devices/iio:deviceX/in_voltageY_calibphase_delay
> >>>>
> >>>> Not sure if I'm too convinced on the _delay suffix
> >>>>
> >>> Phase is measured in radians, not seconds, so it seems wrong to use it here.
> >>>
> >>> https://en.wikipedia.org/wiki/Phase_(waves)
> >>>
> >>> And the delay here is with respect to individual samples in a simultaneous
> >>> conversion without regard for a sampling frequency, so I don't see how we could
> >>> convert the time to radians in any meaningful way.
> >>
> >> And how this delay is aplicable to the phase in the hardware? Sounds to me that
> >> HW has some meaningful way of such a conversion?
> >>
> > 
> > It is a calibration to account for a phase difference between two input signals.
> > This is a simultaneous sampling ADC, so all channels normally sample at exactly
> > the same time. This phase delay calibration factor can introduce a small delay
> > on an individual channel so that it starts it's conversion some microseconds
> > after the others.
> > 
> > There is a nice diagram here:
> > 
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ad7606c-18.pdf#%5B%7B%22num%22%3A113%2C%22gen%22%3A0%7D%2C%7B%22name%22%3A%22XYZ%22%7D%2C34%2C594%2C0%5D
> > 
> > To convert the phase delay to a phase angle and back would require also knowing
> > the frequency of the input voltage signals.
> 
> Maybe calling it "conversion delay" would make more sense? Since the phase part
> of it is really referring to the application rather than to what we are actually
> adjusting.

Are there examples of a phase calibration in iio ? Becouse apply a radians 
calibration seems complicated and maybe non approrpiate for non-periodic 
signals as often used in real world applications.

So another viable idea could be to use a IIO_CHAN_INFO_CALIBDELAY instead.

Regards,
angelo
