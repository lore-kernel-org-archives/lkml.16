Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D29203714
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515987; cv=none; b=ZQ/6NffopLnIV1oee+Dke5gEVE6rc9SnUoNXDsWHoMxmNZpJ8d/rASf/ogAlBiGCaDcNGjXeOKjzDVRueIht0ySUHBP+GaV6eKQJycNLFfy6O4nayoN/cv4ormeJh4of9Qpwy8SfPs8qEV80oVh3+GWYu8o26NOYZEmLj/sTbiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515987; c=relaxed/simple;
	bh=jwOZEI+1V0bSdZLU8bFkYBzm5hOClcnQE4bCc9kA0vI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vy0cmoV5ZLfZ0gYv5y/OjGrEaX8snx+/1kbqxLSnxF/WP5D+aFK+sldqGl3sx+Zr4lz2wgY3Lyq9+Gxh9kfXDEQcUP/HuycANb+xBM5DIYnyyqCkU0wIp9IPGt3UcF/2g9F7ZypSbDip5bm20ZQv01GOvZGBIcNJz8C/N+kyF/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzvQE9fN; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzvQE9fN"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff784dc055so9403086a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743515984; x=1744120784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGYXonTkHcl1ZOGGNFSMG6Pu1YJzE62IfJgYQhAo2xE=;
        b=DzvQE9fNKraEsYaNDNRbg+qxXo7KAnE7NK75kptkj0e4FbrVw61DnMJaddhGKFGR2Y
         bz/eXXjopkto0JdMIjHU3I77ngZtBHLPUNxP2QYhZB0yTg6TB1Ay+Dyx/5b9NtY2gRqU
         8/z7fwMlJqpBqc7VhPHUUtfJ6A4oIHITYh9liSV4A80Bamy/Qao46WdZ0p7Z9+UM6mu0
         XFXufGfWRQ3yOJ1QuQI4UjLwHTqqFFr1egO8PxzSpS7yiKJJi4T85uGSX8Vn0ymNgBIJ
         oCRADYYuwxD/9LpJLVaevY+7M1MWYpzPYaL02zVr5wfPcLsmJIYojsLyjo/LVy3Tnmmz
         Ey9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515984; x=1744120784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGYXonTkHcl1ZOGGNFSMG6Pu1YJzE62IfJgYQhAo2xE=;
        b=obAHw9rbMYRms+pS2PPxur9MqwVkY+RZs9rCHoFmlL6LkJi4kK+HbEX1UFoL0J4IrU
         hYFuv7+hhh/BmDDMdq9Rq6f9jLdQKuKNE2L1lwHsDXEn22K9F6TEMdmbMBJ20Exnkp1R
         VZK/TbDsT8YhAxThsqL74xTEWQWns8duaKKNos2y3Tul42JbR2lzxub2xIQhRjKRHsdx
         oi9vHyZKHbOAEQKqRZbAZCWdU2z2jrim6HaB04iZHnC/VL8AzftTOFTN9x0XAQWJC3bQ
         mmdL2qu9pyzRf/RJPAouPC7NtWTFc8UFr1DKvkchzAN5byuY/2kq4omsmEJFUK1qiTDM
         m+rg==
X-Forwarded-Encrypted: i=1; AJvYcCU/J4JeWredJrzpmsTUSYYj0H7SGtPdwMrd+3tCwxDT51Zx7EmvcLaZYLW0ZJI+vJshDyhVBbMIzhIyJbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJGZ5pY+gyszOPU/QeFGQxQikUvnBoKwxrhHqVj0BNOSs94Mp0
	QI/8v0c1ey4+hzmHSyUN4jNdImOUEFBrnTtqGJl6RkYxv2/6+gZPgYqlCLFjEqpp9a4ee2sVD3y
	n1WYqcKx66ZB/3Lgab4FlJj8K8mg=
X-Gm-Gg: ASbGncsBHOCjSvW/y1M+ZCdrRFq8RVhQFBJVuNHn0yb6oZMqsk8ewB8jSLqcc24NGXH
	+Wvg99wm/1yKMwnsuWJZ3VETxjIou16ZGNQtqPXCeD79FJZsEC2LCWTRABANyB/qKL6HJ8ukifh
	RI5VFv1sjFO5xyOodb9Ffgt7ibtA==
X-Google-Smtp-Source: AGHT+IHb1o0LPjrLTU+HRNoqh4woznSYQZMft5Ou0nvj7nGES6vt4g8Js/jFnN64ADJXFtnlwDc+bQZWFGJk3jhZyFU=
X-Received: by 2002:a17:90b:4ec6:b0:2ff:692b:b15 with SMTP id
 98e67ed59e1d1-3053215a24cmr22408797a91.33.1743515983633; Tue, 01 Apr 2025
 06:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHCN7x+WkhPQGLUqJ40SjtmhTXx=Fn2rkqw8NQ=qgaNnpK97zQ@mail.gmail.com>
 <CAHCN7xKUdveqVnOXXRL-RhXFrN4OUjJC+VgZguy1kYjx230wCw@mail.gmail.com> <Z-sQFRaWxiGe6XEN@atmark-techno.com>
In-Reply-To: <Z-sQFRaWxiGe6XEN@atmark-techno.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 1 Apr 2025 08:59:32 -0500
X-Gm-Features: AQ5f1JqRpjc2gJafSyHdBw28rwKsoTl3-ZjyiGsljxbad7xdq9mnAxmkn_KMgZI
Message-ID: <CAHCN7xKreZmJDyght97eSwdv6v8BgZfkzApM85x=PrR1PJFCDQ@mail.gmail.com>
Subject: Re: [PATCH] phy: freescale: fsl-samsung-hdmi: return closest rate
 instead LUT
To: Dominique Martinet <dominique.martinet@atmark-techno.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Frieder Schrempf <frieder.schrempf@kontron.de>, Marco Felsch <m.felsch@pengutronix.de>, 
	Lucas Stach <l.stach@pengutronix.de>, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Makoto Sato <makoto.sato@atmark-techno.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2025 at 4:59=E2=80=AFPM Dominique Martinet
<dominique.martinet@atmark-techno.com> wrote:
>
>
> Adam Ford wrote on Mon, Mar 31, 2025 at 08:45:26AM -0500:
> > If Dominique won't have time, I can try to clean this up a bit.  I was
> > not liking the names either, but I was trying to keep them small.
> > I'll default to this convention more in the future, based on your
> > feedback.
>
> I've been chasing weird suspend bugs on our platform (another soc) for
> the best of the month so it'd be greatly appreciated, sorry.
>
> Feel free to replace our patch with anything equivalent
>
> Adam Ford wrote on Mon, Mar 31, 2025 at 08:43:38AM -0500:
> > > For this particular rate check, I believe that if phy_clk_round_rate(=
)
> > > rejected the frequency then phy_clk_set_rate() cannot be called at al=
l
> > > with the said value (at least on this particular setup going through =
the
> > > imx8mp-hdmi-tx bridge validating frequencies first before allowing
> > > modes), not that it'd hurt to recheck.
> >
> > I believe that is true.  I considered adding it, but when I put debug
> > code in to trace what was happening, it was being rejected, in one
> > place, so the other didn't need to.  If the general consensus is to
> > have it in both places, I can add it.
>
> Yes I think it will make the intent more clear, if we're going to share
> some code or make it more consistent might as well go all the way.
>
> > > In general though I agree these are doing pretty much the same thing,
> > > with clk_round_rate() throwing away the pms values and there's more
> > > duplication than ideal...
> >
> > I've been working on creating some caching to determine the best
> > values for the PHY and remember them, so the work doesn't have to be
> > done again if the next call uses the same clock rate.  I'm not quite
> > ready to submit it, because I need to rebase it on Linux-Next with
> > some of the other updates requested by Uwe.  My updates also remove
> > the look-up table completely and use an algorithm to determine the
> > fractional divider values - thanks to Frieder's python code that I
> > ported to C.  I experimented quite a bit with which values have more
> > impact and reorganized his nested for-loops to keep track of how many
> > iterations are done and also measuring the time it takes to do the
> > calculations, so the code doesn't really look like his as much as one
> > would think.
> >
> > The downside with my updates is that running 'modetest'  on the 4K
> > monitor that I use has so many entries, the time it takes to calculate
> > all the values for the monitor takes a second or two longer than
> > before, because searching the LUT is quick and doing a series of
> > for-loops to find the nominal values is more time consuming.  We could
> > potentially keep the LUT and only use this new calculation if the
> > entry isn't in the LUT.  I am not generally a fan of LUT's if the
> > values can be calculated, but I can also see the advantage of speed.
>
> Hmm, tough question... I don't think we want displays to show up a few
> seconds later, we regularily get mails from customers asking how to get
> a logo to show up faster on display (I think there may be some variant
> of uboot that supports imx8mp hdmi? but we don't have that), so while I
> see the appeal of not having an hardcoded look up table I'm not sure we
> would appreciate that compromise.

I only notice the delay when I run modetest to get a list of available
resolutions since it's trying every resolution to see if it can
achieve the desired clock rate.

If I run modetest to set the resolution, it's not really noticeable
because it's really only trying

>
> I think it'd be great to just have a way of checking the values in the
> LUT are correct though (either statically from Frieder's python code as
> I started doing or through a CONFIG_WHATEVER_CHECK_LUT config item
> that'd check once at boot, although that's probably overkill); I started

As a compromise, I could leave the LUT, and fall back to the manual
calculations to both speed up the modetest look up, but to also
maximize the ability to sync new resolutions.  Even with what I have,
it's not perfect.  I skipped a few variables since my testing showed
they didn't have a huge impact and adding them increased the number of
calculations to determine the resolution.

> checking from the python code but they weren't computed with the same
> algorithm so some values end up being different even if theend result is
> the same frequency and I stopped halfway...
>
> > > That's quite rude of me given I just sent the patch, but we probably
> > > won't have time to rework this until mid-april after some urgent work
> > > ends (this has actually been waiting for testing for 3 months
> > > already...)
> > > If this doesn't bother anyone else we can wait for a v2 then, but
> >
> > If you want, I can submit my stuff as an RFC to give it a try and
> > solicit feedback.
>
> Happy to test/review anything you send, but I make no promise on delays

No worries. I am just glad this driver is getting some love and enhancement=
s.

adam
> :-)
>
> Cheers,
> --
> Dominique
>
>
