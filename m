Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CD72BAF8
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441098; cv=none; b=TUgxyOw0ng0MiGduWcDtmXL5LiFzXA+qVM9i5CYORT5OWF4yv7oIpubZLGQsDCbVzZveswi/bwxK+PDZKzBOE6B3SeFxTVOiKtCtOTFjNvyXeS2QZOqvODBPQ+IBpIvEdhFj1+3UDkCzIYL/DI1xX3hyj4cFP0mnKtE3rOerYaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441098; c=relaxed/simple;
	bh=njyseWzQaB7f+oeJ+nI/1Ty+ZQUMTDQhQmChzcJr4R4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rUVbm4ZmWXP1oEleiKy6fPmUvXRTGPneLlsNtEn4mFnXiL1kSHFTAjFG3/2OHnytHURxh3YhMKCe60glzOsOmNXz+xYpvO0bDWkDDdcu94INJy9V2W0XqYDYltGMWKxP26LGy6CZj7Mm1K6JAwsyyet6bnP9F3TK9S0oeFT3hNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5dWGIaA; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5dWGIaA"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b07d607dc83so3407455a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 03:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746441096; x=1747045896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XUpQWufJgs2kKIw18HiC9UXi+ywi6blxUGeIGBekrE=;
        b=m5dWGIaAG/DUicTo+sAR8MzphJwpvEndGqyHkDWCgOR6SnYFPMmAngT4cLACWdQwOX
         MCJq0XlM/y/QlF6ciRy/JUHaaTi0N2MwQRv6HtpWHSGxJD+h65jy504MFdC1eVjovIjF
         Wfan2EwP/7GL9rN1dKG2VVPO3HkE02kM4uFFmfzfCHrBxqKQkk7HPf5Dw1pES1bUg3R1
         RIxpFm6v4OLWAf45RtYyongMZWSluVwBx/In1t4xkRTx4+WS85FyzsN+2A41mftjAfzL
         xfYM7MHmG5P/hV9YRiWGcp7IofvVsd3zqrfUKos+EgTDJw9nOiUKjBPRHSHwlNbQ8hBF
         1U/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746441096; x=1747045896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XUpQWufJgs2kKIw18HiC9UXi+ywi6blxUGeIGBekrE=;
        b=OjuL0GZEldiJ80es61WuR1YngXEPWeMpK/j4HgEH+xcRmXqkPUXWBjzQHUdILoBgQc
         WjnWFoFOY4lj5xAyJnq8k/Kjv6D8zRM7tH+lpSSLk9HmuEOsOp8cwOPsul3chFdApg9K
         kYwbnuWhH6KOB7mu3Ecl9opnedbjLeODm24PfdqByLtCzf+pjycde3f0FlArQwPrCMOK
         iRxGKYiEpMwCh89FcVYpw3ZniCI6ehOeiccDUvvSQrMR6tx4yIFg6RFzZS2rpkUcB45y
         b1Y+XtjAKM2j01e+demyZEvIm5RR3+qCqnsYuIMw4q9YcKhE1zY/ZSnqRy5WXxvi2R2Q
         nH8g==
X-Forwarded-Encrypted: i=1; AJvYcCUjWHvcVhS+qJ3L/H7ncz8P33s/AaN+2LHRv6gaIyp9baqvy28HxsfZ4bflFuT2ZkQqdG7rK0B4n4UY574=@vger.kernel.org
X-Gm-Message-State: AOJu0YydavsNvUdHqawUeLdNGMDfRCdORM+ozx2p+LrYI6K5Y/35rUTZ
	JvVMUF4vYWVcpnh+pre98jpvGx6ZuyWDlbfOwHFc3uWfXFG5GbbnJibVCs3dzwUIO4esYAVPC/D
	UCTU4uv82cx3BbzCDyhAHPvkuDrk=
X-Gm-Gg: ASbGncttatXcoqlSzFs+fBDbiuNpJZVD3jdGGEuTGvlcDt6frXaqqxI8ykeHqYOGD+O
	3tiiaN0l6NMfF0XCBAxZtuth/efNOpPN1P560onalM9exP9SZNpAvIXRp6cvUaOuEWmvva6ZfGW
	yk0L8K6rxQ9f2QjmX+Nl/CTQ==
X-Google-Smtp-Source: AGHT+IEYlPo2xwoK9jTR3CithZ5yBxrXrdxirztT2/i6xi/HWoODXSwNegDQZi0mDmE9cngDoeuiIrPsTJdQSDWsPK0=
X-Received: by 2002:a17:90b:548c:b0:2ee:ee5e:42fb with SMTP id
 98e67ed59e1d1-30a6198d16cmr10340838a91.13.1746441096338; Mon, 05 May 2025
 03:31:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310-8ulp_hdmi-v1-1-a2f231e31987@atmark-techno.com>
 <v57uy3gddzcoeg3refyv7h6j3ypx23mobctybt27xzdyqy6bgb@atzdlqlytz3c>
 <Z861gsaGY6bGSisf@atmark-techno.com> <b2qwqacogz5vzfekhk5276owld6isgewu5a2iw3roag3lbtsgm@67vqf54c5tdh>
 <CAHCN7x+q-K067u6o=+E9ybREi_jopwhMTyMN=JKfCS4r6K=HWA@mail.gmail.com> <7wmuggeoslylq266u2bhunz5vcbbwaux4jv7glytxn6yer2nyr@7s3cfixtlau4>
In-Reply-To: <7wmuggeoslylq266u2bhunz5vcbbwaux4jv7glytxn6yer2nyr@7s3cfixtlau4>
From: Adam Ford <aford173@gmail.com>
Date: Mon, 5 May 2025 05:31:24 -0500
X-Gm-Features: ATxdqUHfUWoPkX7ywp5TdexqQkSq6Rqa-aZ0I--IAftxx0IXeyn79h1aP8dyKxk
Message-ID: <CAHCN7xLcQPvZp_fJu-1gj4H47vb64k9dw1efqe_yQQ73LQwF6w@mail.gmail.com>
Subject: Re: [PATCH] phy: freescale: fsl-samsung-hdmi: return closest rate
 instead LUT
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Dominique Martinet <dominique.martinet@atmark-techno.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Frieder Schrempf <frieder.schrempf@kontron.de>, 
	Marco Felsch <m.felsch@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Makoto Sato <makoto.sato@atmark-techno.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 2:55=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Adam,
>
> On Sun, May 04, 2025 at 03:44:26PM -0500, Adam Ford wrote:
> > On Mon, Mar 10, 2025 at 11:12=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > >
> > > Hello Dominique,
> > >
> > > On Mon, Mar 10, 2025 at 06:48:50PM +0900, Dominique Martinet wrote:
> > > > [...] and I'm sure there are other improvements that could be made =
at
> > > > the edges.
> > >
> > > One thing that irritated me is the function names. `phy_clk_round_rat=
e`
> > > sounds too generic. `fsl_samsung_hdmi_phy_clk_round_rate` is long, bu=
t
> > > I'd say would be a better match.
> > Uwe,
> >
> > I just sent a patch to rename round_rate and set rate functions to be
> > more explicit.  I also tried to refactor the driver as you requested
> > by simplifying the code, but I didn't have time to integrate my
> > fractional-divder code yet.
> >
> > I will be traveling for most of May, so I won't be able to revisit
> > this again until after May 24.  Hopefully the patches I submitted meet
> > your satisfaction,
>
> I don't feel authoritative for that driver, so please do stuff to please
> the phy maintainers and consider my comments as suggestion from the side
> line.

I thought you had a good idea, and your suggestion made sense.
Getting that kind of feedback makes me a better programmer.

adam

>
> Best regards
> Uwe
