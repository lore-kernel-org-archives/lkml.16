Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9931C134BD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743428634; cv=none; b=cSzWf2XZfpVIZ8JKITeWCwNvoPs7pAtm2XlC9Ju6r+oNKXKntl85EwKbWM6+qIGOVKIvxzeXcEz/Jr8lf1PG+/AT/5RMm1JlukCTD0UR/vobUzmzqmsQC2Xj3SRjsfIhekBYm0lkyEHHKqzNowU2jU2g7wBKZLJdeeIp9kMUDGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743428634; c=relaxed/simple;
	bh=sKGQYZYdqcsj0/jlpSudpr+IAb0SOvz1vgVsAAV0WUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKWQzaaMN95Hi63g4S6RkkWOv2udL2llN40Nf4EPXckTGw+qfY0DbTiIqn+DzfwHUM/PDEv6v8HTFsMp4Qy8VTtVSpPV66bSDkmDHhTmJqmzd9pOLf84TdE/38BN+6u+qp0zjyjiaPtMYrO2IKujXir2w94g4l+mskOLqRoTmhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUsAgemX; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUsAgemX"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225477548e1so79563955ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743428632; x=1744033432; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acRC261SaEKC/7/W6BFAn2cHMzShm+CQ8Ads6iAgzlw=;
        b=lUsAgemX/5H7rtQy8yk+tqitET0Hd0H5VfqpndqrhMArYGYVuHwMn5Yl6F+1a3Gk1V
         FZuEy3S7tteIxtAmInTmpRzq1pr3g7KxEj7UmsLA3BKnlU/vvl3pNSsAaPKOKDfYHRXF
         jlmUc7SzP4ySizilbXGYVKEP0xqON4XiXKQbpVhgb1Tq1IQBedqFzTPHdMF6lP9Erjxf
         65VnJuNyOT9uVuVOefVDBopMvETaDjzSioR52hehqEaOz4XFnLDUH92T9TrdgeXTiPsh
         HCZV2MGqclCZ2yX6CwfRTW8B0Hk/Ym4MfgIdJWksfs+t03QkvvkSoKLw3cJKrPUR72wI
         bWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743428632; x=1744033432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acRC261SaEKC/7/W6BFAn2cHMzShm+CQ8Ads6iAgzlw=;
        b=MFUcOipCboTte43CgbSaBNEvX71uIwsIv+bke8ZDRZdmdJCIaynUFxn+laAN6Xg+/M
         eikJzWUjCoLKGlD8ckbDbLDIgT1+9ALwqDtHun82Mw8zSY5dVobJb/gRrc8/cfapeX06
         0T775r9abIVV2gD/Dx7rnN4VcLFx6wPlbyHK7vD+yzTCkwCiy4qpvxGuzyLUSbfGBK3H
         u6zWlqByrnc+h9xQoMjyZ27pTI4dJwG8IwnWURU1ON8j55atLB6yPlk9J15LZZzDo+BJ
         IAINsxSMDinqcxYOVzmZLP7lBNOO5rrj7dhqHdAeFvq0oKpNcMl8segGCm7ScfWw3r1b
         tq2w==
X-Forwarded-Encrypted: i=1; AJvYcCV2+E/1tM0L5+KncHwmH7h1YkJ85gttoJFktRcEBuSvlIQ9aBu09JhdVSKCyeF075qIcakOmbdmfDPuHrw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKJTzMdfpd/GvFlytB+iwIt7laT1U8wR4+xB2118tFl6/v8M0J
	TL/n271NMX4MOTqq3+2MOkEI0CQN1yMiy2jjIPCw/EMTxxMMo3HyFauOY1GVZOwhpTTcGovjwaH
	mXkcT+jVYYqB6jdd8b6Xy3rbahXg=
X-Gm-Gg: ASbGnctd/piPmzoF0sT16JuyLyJNuEZvLp3n+fW4F715+L2qmvd6hr3z1nANzYuRWhP
	DFUAolteaXBhza7mbPvjRY9142BRj3614XERkGGmJO8u6JkEISf6V0+qIba6yxB0DnkRW6ieJeH
	0ExvLZXnAYfo/v9tYlWAGFs6HWmsJcMe6whlGi
X-Google-Smtp-Source: AGHT+IEPmbA0/4hiOM9hOsW56MQXEn4vU5JkEnSFv38ADOJ8A89PqZHuvxqXawZEyBTy1YJmlUmc91EzpBLa2NbxWV8=
X-Received: by 2002:a17:90b:510a:b0:2ee:ab29:1a63 with SMTP id
 98e67ed59e1d1-30531f7c897mr14182798a91.3.1743428631746; Mon, 31 Mar 2025
 06:43:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-8ulp_hdmi-v1-1-a2f231e31987@atmark-techno.com>
 <v57uy3gddzcoeg3refyv7h6j3ypx23mobctybt27xzdyqy6bgb@atzdlqlytz3c> <Z861gsaGY6bGSisf@atmark-techno.com>
In-Reply-To: <Z861gsaGY6bGSisf@atmark-techno.com>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 31 Mar 2025 08:43:38 -0500
X-Gm-Features: AQ5f1JpJG3x3SEs9GIv1mzubPpNEg-PfTCQ359LMo2SckOQ0fNPeeBD-j5SgQEM
Message-ID: <CAHCN7xKUdveqVnOXXRL-RhXFrN4OUjJC+VgZguy1kYjx230wCw@mail.gmail.com>
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

On Mon, Mar 10, 2025 at 4:49=E2=80=AFAM Dominique Martinet
<dominique.martinet@atmark-techno.com> wrote:
>
> Uwe Kleine-K=C3=B6nig wrote on Mon, Mar 10, 2025 at 10:14:23AM +0100:
> > > for 83.5mHz, the integer divider generates 83.2mHz (-0.36%), but the
> > > next LUT value (82.5mHz) is 1.2% off which incorrectly rejects modes
> > > requiring this frequency.
> >
> > Is the unit here MHz or mHz? I suspect the former?
>
> Err, yes MHz; I was still half asleep when I added that example to the
> commit message..
>
> > Without having looked in detail, I think it would be nice to reduce cod=
e
> > duplication between phy_clk_round_rate() and phy_clk_set_rate(). The
> > former has
> >
> >       if (rate > 297000000 || rate < 22250000)
> >               return -EINVAL;
> >
> > which seems to be lacking from the latter so I suspect there are more
> > differences between the two functions than fixed here?
>
> For this particular rate check, I believe that if phy_clk_round_rate()
> rejected the frequency then phy_clk_set_rate() cannot be called at all
> with the said value (at least on this particular setup going through the
> imx8mp-hdmi-tx bridge validating frequencies first before allowing
> modes), not that it'd hurt to recheck.

I believe that is true.  I considered adding it, but when I put debug
code in to trace what was happening, it was being rejected, in one
place, so the other didn't need to.  If the general consensus is to
have it in both places, I can add it.

>
>
> In general though I agree these are doing pretty much the same thing,
> with clk_round_rate() throwing away the pms values and there's more
> duplication than ideal...

I've been working on creating some caching to determine the best
values for the PHY and remember them, so the work doesn't have to be
done again if the next call uses the same clock rate.  I'm not quite
ready to submit it, because I need to rebase it on Linux-Next with
some of the other updates requested by Uwe.  My updates also remove
the look-up table completely and use an algorithm to determine the
fractional divider values - thanks to Frieder's python code that I
ported to C.  I experimented quite a bit with which values have more
impact and reorganized his nested for-loops to keep track of how many
iterations are done and also measuring the time it takes to do the
calculations, so the code doesn't really look like his as much as one
would think.

The downside with my updates is that running 'modetest'  on the 4K
monitor that I use has so many entries, the time it takes to calculate
all the values for the monitor takes a second or two longer than
before, because searching the LUT is quick and doing a series of
for-loops to find the nominal values is more time consuming.  We could
potentially keep the LUT and only use this new calculation if the
entry isn't in the LUT.  I am not generally a fan of LUT's if the
values can be calculated, but I can also see the advantage of speed.

> Unfortunately the code that computes registers for the integer divider
> does it in a global variable so just computing everything in
> round_rate() would forget what last setting was actually applied and
> break e.g. resume, but yes that's just refactoring that should be done.
>
> While we're here I also have no idea what recalc_rate() is supposed to
> do but that 'return 74250000;' is definitely odd, and I'm sure there are
> other improvements that could be made at the edges.

I am not sure where these values came from either.

>
>
> That's quite rude of me given I just sent the patch, but we probably
> won't have time to rework this until mid-april after some urgent work
> ends (this has actually been waiting for testing for 3 months
> already...)
> If this doesn't bother anyone else we can wait for a v2 then, but

If you want, I can submit my stuff as an RFC to give it a try and
solicit feedback.

> otherwise it might be worth considering getting as is until refactoring
> happens (and I pinky promise I'll find time before this summer -- I can
> send a v2 with commit message fixed up as Frieder suggested if this is
> acceptable to you)
>

adam
>
>
> Thanks for the quick feedback either way, and sorry for the long delay.
> --
> Dominique
>
>
