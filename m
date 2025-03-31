Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EB52144A0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743458348; cv=none; b=k7nYQipvWXbNgj2iAjnoyJs0U2NZftQtkfAo57I/9dGGqRNErLCTMmPoP1a01RP9m0ua1/y2cZybiaU3hodk8PMeXFY8iUY+uycAO62M3ZzRq9zOzmQtSt4YPY+tryqSNnRlQY+/ydyoITmUVm7EEY3bI7LVRT7rcjk3jl+45eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743458348; c=relaxed/simple;
	bh=k7LMlvy0mG38bHKsmOyr2dXqku3hwvCTZolnWTOf4hU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QUapQ2U8qwDZ5e2jBmrR99RP2IvqmtUUXgmlcMo0xNviTpZhDtmCR7Uiq+aT+U1gqdd/q7/HgAy4ZAYXCJ7Ezgu079RORRu6xV8VJP2VGoVQJXnQJVR+06otUUYh7W9OAkdF6tdA9aGNvtT92AFNNXAX3OSC7/c5AChzoTOTOCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=XfqH6hVI; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=Nbwe1bEE; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="XfqH6hVI";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="Nbwe1bEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1743458340;
	bh=k7LMlvy0mG38bHKsmOyr2dXqku3hwvCTZolnWTOf4hU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XfqH6hVIS9lF220D8mfMsxnGbyD8pzwrDfAPONdcMDDeFEw3BuzUsdg/VC0V5K0T8
	 HQhH2m2BEyVnHFaXXIvuBXHgtEDaIR3Opmp3bsGTJfZI4CN+TVoTWVDsosgOkm53FN
	 kI9Zc2BtHJftaejpTyQ9Wyilugr2f2q8Wq30oKgFyvU1HzXs2+WY781rygCi+jNf5b
	 1vGCVIYCSZ+8teclJJoN6vlUExK/0RmBs6x8AfbzdLRZCfpJzXmWz//tOfra6Yma8Z
	 sCpS2+xDtmF2ynkWsKToq9N/iZjjDkujxiJ3EPfCnEWaLh+FJoDoXPBC0DWp0Zn4G/
	 oC2IwmTTuK/Jg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 40E0C3D8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:59:00 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=Nbwe1bEE;
	dkim-atps=neutral
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 59779935
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 06:58:59 +0900 (JST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2254e0b4b85so84087725ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1743458338; x=1744063138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tFX2ExnBv3aVLNqFccl8e2jClp0XfEMXZ5Px9EvOekY=;
        b=Nbwe1bEEuhWTwgXhJdCLsQpDZmC/SW3HFNFxlmZ6yA49Sj2zND7FeFoI8UykFaDTEl
         2yID5P6vSKn7EJx9Md0cJtZYdFBCNUnzcdLfBWa8Fr9CKSsWapFwvrLoIbuqSnj0Ew9b
         zCotsFxjOzqoBb9N2iiHkt1Q6mBxbMxmKJY8rneCmaN++DpomOhTkXUdo6QlomwsM6rV
         Fdsg8S1i5rgz/uzdHnRzcFpLZpp/rxgS87IgCu/YFjI2bq/xWGBJYij2jLRk74MeCxuE
         Xnfy9kH+LHXj43pQzI71N0xxENd2RSTl6N/cKardHeGhBSijSUwfqp3DpM3oFOpfaN97
         5imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743458338; x=1744063138;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFX2ExnBv3aVLNqFccl8e2jClp0XfEMXZ5Px9EvOekY=;
        b=R8XrfIxqSn9hU91p0PsjdUNcacaCslIWGxHllmQd/Z9XZgySdSAVTFciWblsf6rWL2
         zKjOK9pmFcMtRcDE5PyyHJQQSRoKZ1YoIBmBi2Uo68/rCRA767sGzEnrUy9V8NiYr4C8
         3sxG+boj17uUGY5ufM7qwqcjRVcKm3IqboMSgahWMP/YHoqWJdzF72BdycWyOWJoTttx
         mwGThkdAwPkV3071dVYQ0x2DVbWHokxVj5IMwDOmC7yswJicSteXDiq3xAz18i3EsZRb
         83Wx7f2qb3FuJ2VnwmZ58pV3oLHbNpSsuBegXYoOicGPxVthPwMyNEQNGugw9ly72Fdw
         U8vg==
X-Forwarded-Encrypted: i=1; AJvYcCWIHukuTtK/xb0jJK24rdpc1QWc08xJNqmSHQ1Z4UwUj2J2QWffbqJ1xRc9tgYdYJsSM/HAGeYIS/Ud2qc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP9O4np3WoaTTm4DbY4DnPWsQhAR3TV0q7YY41MUF5NgWwBEjb
	F2oqtVUpakJwWLyY2gYX2lvWXT9VFIya4a8UZmwBk3MICszsSvzz8WO1rjheYOLB/++6xoWvoHn
	GydYFpxXA+/3TQdlKApdLn+LR/0Bxsj6ehxcwqtNgMJjPqqCcvlxuY2zNsDYLybI=
X-Gm-Gg: ASbGncus5y+m/PpOWgBlGt6r5a2wGaatlk1/srk0PXPTN5dIsaFRXVK11MYFm6xV/ta
	Ml4psmvejOlxsp47DXjeRWAwn55uUHZ9K/Gudaj4saYXu2z9XOEJRuBsbQc3QEHMXnDxj/cV4xv
	Ys9IpowfPTl+nVqP/7yHHf0n2sk70y1JRhcE9mmMiyP4ELOzj00dph9cedKC/5rPvTOB0y9CZsn
	ttTtHUUVTYu+1GM9KnRFLIy38ODGoDPUAlODWGh4ZhMvE2ZxRnkLtpnhIKODEEEUtrkFdwq1Oar
	9aDSjLqmx4XsV/neskIVE7pUnQavzZaoeq63VQRWJgdObdx3lmD2n58jz20b54zMAf5DLXDB2KA
	=
X-Received: by 2002:a17:902:ec8c:b0:21f:2e:4e4e with SMTP id d9443c01a7336-2292ec07225mr162596045ad.5.1743458338182;
        Mon, 31 Mar 2025 14:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC2tmtdDUEgw9i+Zj6fWqwksycm+AdRgJPxbfLg0t89SH8ZRKaaaInjYucDq0nxU0GQWquPA==
X-Received: by 2002:a17:902:ec8c:b0:21f:2e:4e4e with SMTP id d9443c01a7336-2292ec07225mr162595795ad.5.1743458337821;
        Mon, 31 Mar 2025 14:58:57 -0700 (PDT)
Received: from localhost (117.209.187.35.bc.googleusercontent.com. [35.187.209.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f818csm74221515ad.233.2025.03.31.14.58.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Mar 2025 14:58:57 -0700 (PDT)
Date: Tue, 1 Apr 2025 06:58:45 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Adam Ford <aford173@gmail.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Lucas Stach <l.stach@pengutronix.de>, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Makoto Sato <makoto.sato@atmark-techno.com>
Subject: Re: [PATCH] phy: freescale: fsl-samsung-hdmi: return closest rate
 instead LUT
Message-ID: <Z-sQFRaWxiGe6XEN@atmark-techno.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7x+WkhPQGLUqJ40SjtmhTXx=Fn2rkqw8NQ=qgaNnpK97zQ@mail.gmail.com>
 <CAHCN7xKUdveqVnOXXRL-RhXFrN4OUjJC+VgZguy1kYjx230wCw@mail.gmail.com>


Adam Ford wrote on Mon, Mar 31, 2025 at 08:45:26AM -0500:
> If Dominique won't have time, I can try to clean this up a bit.  I was
> not liking the names either, but I was trying to keep them small.
> I'll default to this convention more in the future, based on your
> feedback.

I've been chasing weird suspend bugs on our platform (another soc) for
the best of the month so it'd be greatly appreciated, sorry.

Feel free to replace our patch with anything equivalent

Adam Ford wrote on Mon, Mar 31, 2025 at 08:43:38AM -0500:
> > For this particular rate check, I believe that if phy_clk_round_rate()
> > rejected the frequency then phy_clk_set_rate() cannot be called at all
> > with the said value (at least on this particular setup going through the
> > imx8mp-hdmi-tx bridge validating frequencies first before allowing
> > modes), not that it'd hurt to recheck.
> 
> I believe that is true.  I considered adding it, but when I put debug
> code in to trace what was happening, it was being rejected, in one
> place, so the other didn't need to.  If the general consensus is to
> have it in both places, I can add it.

Yes I think it will make the intent more clear, if we're going to share
some code or make it more consistent might as well go all the way.

> > In general though I agree these are doing pretty much the same thing,
> > with clk_round_rate() throwing away the pms values and there's more
> > duplication than ideal...
> 
> I've been working on creating some caching to determine the best
> values for the PHY and remember them, so the work doesn't have to be
> done again if the next call uses the same clock rate.  I'm not quite
> ready to submit it, because I need to rebase it on Linux-Next with
> some of the other updates requested by Uwe.  My updates also remove
> the look-up table completely and use an algorithm to determine the
> fractional divider values - thanks to Frieder's python code that I
> ported to C.  I experimented quite a bit with which values have more
> impact and reorganized his nested for-loops to keep track of how many
> iterations are done and also measuring the time it takes to do the
> calculations, so the code doesn't really look like his as much as one
> would think.
> 
> The downside with my updates is that running 'modetest'  on the 4K
> monitor that I use has so many entries, the time it takes to calculate
> all the values for the monitor takes a second or two longer than
> before, because searching the LUT is quick and doing a series of
> for-loops to find the nominal values is more time consuming.  We could
> potentially keep the LUT and only use this new calculation if the
> entry isn't in the LUT.  I am not generally a fan of LUT's if the
> values can be calculated, but I can also see the advantage of speed.

Hmm, tough question... I don't think we want displays to show up a few
seconds later, we regularily get mails from customers asking how to get
a logo to show up faster on display (I think there may be some variant
of uboot that supports imx8mp hdmi? but we don't have that), so while I
see the appeal of not having an hardcoded look up table I'm not sure we
would appreciate that compromise.

I think it'd be great to just have a way of checking the values in the
LUT are correct though (either statically from Frieder's python code as
I started doing or through a CONFIG_WHATEVER_CHECK_LUT config item
that'd check once at boot, although that's probably overkill); I started
checking from the python code but they weren't computed with the same
algorithm so some values end up being different even if theend result is
the same frequency and I stopped halfway...

> > That's quite rude of me given I just sent the patch, but we probably
> > won't have time to rework this until mid-april after some urgent work
> > ends (this has actually been waiting for testing for 3 months
> > already...)
> > If this doesn't bother anyone else we can wait for a v2 then, but
> 
> If you want, I can submit my stuff as an RFC to give it a try and
> solicit feedback.

Happy to test/review anything you send, but I make no promise on delays
:-)

Cheers,
-- 
Dominique


