Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E329F225779
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834610; cv=none; b=Hqu6z6VxoLQ5Y8yeqOGk3DL+vASmZu+OStGzA/4C5yiaXkWDbeVL5a2F5MATy8JZMmygSXHKIt3+0I1R5EcbGXG0X3fEAnq5phc4cN0sG2lVQJ9iwKFFtaRWOFxzSr6LTxHEaWyJuW3uLf44vmh7MFgi46RJEtfbvTZdTXS2q7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834610; c=relaxed/simple;
	bh=Kh16Wp8fAy3I7OTirw74yhvKe46+5odebHIHXPF1qa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlKM2h+MHqdf4WZIkzFaVOo5YDsDCcVwm/g7DjjGymzL1qDwUkSoPK6sIS5gHOPYvkk1cH0JAd9BH5DzIlMsiL59LfjwhNgqeFy2BXva2QMceNFcDKUG+us9MVoi1d+mz7RWuwvmaja14B4gMrBpFsWdgNQ83fL2kYZCSnLW9Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zTomzqFd; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zTomzqFd"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54411e3c610so183150e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 01:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834606; x=1739439406; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2fOiT1hShmWAzem6QrK7ODBNtOVKho77Ypt9RNsYGk=;
        b=zTomzqFdGu2L36wsIEuPXt0D0GZmDhMLR8oujNZE8oWv8X4ONVT3BKbMFgP25PBScV
         1mTlkpWekCu/5g3B78kFKlyPBkZQXr5KFUNmG/zWRC/99I29ibQGITo8jRka0fSDAx8+
         MxMgpSy1ZMmlkqlpxWns4ZjxM1BN5ZbZLI7OqhsETo4R0KIZEn2n4Y0VmUOdPe68Fx7G
         uPEp3NN/ljGwDuHcVO230c7xvyTc+DubmhSpLGx5Erjpvro4I5avakzm0CT0FPH6yLnN
         8aqDaMCZt06P36ejgU3tsvUEJD/w70uynkiujmd/ywNf/saUqYskDmfYzy7QZFbQHNqG
         YdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834606; x=1739439406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2fOiT1hShmWAzem6QrK7ODBNtOVKho77Ypt9RNsYGk=;
        b=PMrhvIU+bkd1pmkGeqhomgWqCndYle8Vs2n9L0O1EocpX9hIQB/DRIA/8jR0p4Sq94
         wO/IIm29TwSxq9Hnuh/ALDYgzELVAIqPeZzxVrtONP3JpNk69EaZEtvlb4D/44MUueVl
         7kaxzNyEsGZDzwB5ugjNSvyirTIxzWi1Yqo/mSecML7HeBzPcEA2XqYFgzkBUR6BtQ2J
         0V5792KLgX13RcO1e8aGyOycz849oBE3OTwpIavTVdWRR3Dk5+vuuF+s9bFaib653D4W
         EzHx6Nhq064woxVgfaKp+foITBYDAhrjBar47hnY5f0/Pc48DitlxEUkhEpnvySJWLyg
         od+A==
X-Forwarded-Encrypted: i=1; AJvYcCU9fSVQih3lMU5pFK46144lwsX52/2svbonfEqqXQPGZ0vCDckdlZlfR3cXSEvLAjP+b1BEt57/Dd8WgaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwscVcXHTgeMhlvyQpLtyRuJ1PcUxMQMRuThDwC/nu6//k7cHeV
	hWYbnR3Rj9NBgSAA0ypsNpJX75SHFE1cdeIpPEIsxAuE1UlF6u8LEcTCwgEywTObaO8IqLYts40
	YYP2FB+6sgl4g4A94hm5+JZd2e5lkqfIY4KqOFA==
X-Gm-Gg: ASbGncsYJpgPbKN84dFqxO0jh35ltmmSuVLLKYkd7uFmDS4Fn1o8dsc+JFSYod9MKED
	OP9VJQ5T3/rJV2tTvYdtEj66mG9TVa3ZFjjDyimRpVB3q0V4H+1Q0r17x02NgTJG18Jesvfo=
X-Google-Smtp-Source: AGHT+IGTk7OHZHlA5Lj/y+SkMVlyAK1YiPP71DuZPiW3j2C24cxgmg+ZfIh/5nUIZiV+mmjJFD2qxBxmd7B/Wz3cmmk=
X-Received: by 2002:ac2:4f01:0:b0:542:6f59:f86d with SMTP id
 2adb3069b0e04-54405a24b55mr2378669e87.24.1738834605896; Thu, 06 Feb 2025
 01:36:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-kona-gpio-fixes-v1-0-dd61e0c0a9e7@gmail.com> <CACRpkdYVeHKzH7dgXfqFSDCvxBe04FJVDx5LGR9G7Og13bpDNQ@mail.gmail.com>
In-Reply-To: <CACRpkdYVeHKzH7dgXfqFSDCvxBe04FJVDx5LGR9G7Og13bpDNQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 10:36:31 +0100
X-Gm-Features: AWEUYZnuvQ5xC93XkWdpkWPDAjjF9Gk591-Ngc1pgTXmw3cRSAbzEVROjCVfbTA
Message-ID: <CACRpkdY6PbUjEsQFTPjo=YrjyZ6L3gciAmSA16PFKdSVFVrR7w@mail.gmail.com>
Subject: Re: [PATCH 0/3] gpio: bcm-kona: Various GPIO fixups
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>, 
	Matt Porter <matt.porter@linaro.org>, Markus Mayer <mmayer@broadcom.com>, 
	Christian Daudt <csd@broadcom.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 10:34=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Thu, Jan 30, 2025 at 6:10=E2=80=AFPM Artur Weber <aweber.kernel@gmail.=
com> wrote:
>
> > Fixes two issues that were preventing GPIO from working correctly:
> >
> > - Lock/unlock functions tried to write the wrong bit to the unlock
> >   registers for GPIOs with numbers larger than 32
> >
> > - GPIOs only initialized as IRQs did not unlock the configuration
> >   registers, causing IRQ-related configuration (e.g. setting the IRQ
> >   type) to fail.
> >
> > Also includes a minor fix to add a missing newline to an error message.
> >
> > Tested on a Samsung Galaxy Grand Neo (baffinlite rev02) with a BCM23550
> > (DTS not yet in mainline).
> >
> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
>
> Looks good to me, do you want to resend the patches picking up the
> Acks or do you want me to apply as-is?

Actually it's Bartosz applying, heh confused this for pinctrl.

But most comments go anyway I think.

Yours,
Linus Walleij
