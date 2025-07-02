Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41592DE6F9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751490303; cv=none; b=gy72NDY6G5Zpbxt/+qEUemxRENzPFsQah5xf74Y9QM1ide3efI3SVaP6bEvMm+fZTpWEofzC2FjcxGl7a5YFliglxvJwivkYagP1Ih5x2AXwh1iJQol0XovXtZevmYzoHxLtfAfI0DUWjGOn5EeikUpZ0OS5f7ix+fvfLxmeW8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751490303; c=relaxed/simple;
	bh=KSFjoXjeVI9Q7mVA0gaQA96egYKc8irfnFONjI0h9KY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCOErgi8WxG6kyCDCLMd6B4uaRt0gIhPrHCNi/oBrEANB9rSVcrIPxntnx/JPJJyKqABxpJoErW8otZpFLpurIz2hBwsalSa/7KThO55vVfxrC5GDL3IDzCHDwskoFjo2RDOUGjBPB6aBpx4EfhKIDZ9teg4849NikupGNsdgMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=CnGwRoFV; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="CnGwRoFV"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-713fba639f3so72367897b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 14:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1751490300; x=1752095100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSFjoXjeVI9Q7mVA0gaQA96egYKc8irfnFONjI0h9KY=;
        b=CnGwRoFVYRhHo/WI8aPvrtFzmTKzvqntCdKD2IzdZPgI2RVG4h/j4rpo7VyWoVyhMh
         WK8KEAdOpTATeQA0crAhDhhR4Mw5rBtZESWcCnIJ0IkgElbF6+D00GY/KNoNfDj9iJFH
         4HbcW7uTYF1VuetG5yjeKe/V0l3Sx5y2QKqDP+VEDFB4KrNzg6Bkxh7U+EjkNlE3RqYz
         jAV/ypwlYF97h7VOPvue/gA7Gkpb04VyaVRAEsGZdysE0njEHMtPurKrMJMKmMerhRAX
         qm43ghmG3DesKLMrmHCN9WfYlA24G2Vgy3k+FPQ9lcWhSZNo4BF4b+WQBY69DHLvg8+T
         4rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751490300; x=1752095100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSFjoXjeVI9Q7mVA0gaQA96egYKc8irfnFONjI0h9KY=;
        b=EMr+JX59s0N7OepOUz/7a2fYIGDkrS3TJmieKItQM4tXWMG41rngCjm3a5+OlfkBmb
         Pfm6eH4C9qkjbrQ0KqYQ9M+rB8OvS3FNQnstsN8hbXIuEmbqtmitIbF0cJVJ+0P0iyra
         0pDFwd220gXTMNrtFRECQEp9NsmjPz5OgpWTBM4vWOQHdlrcYtMDQYWeNdDuuVOdiU8Z
         oIPFIYCXsjEX6vFiVS0boPr1Ad7eUBMn42CwaUlE8nxdmWFcNSF+Yussa6u7MGmptmAQ
         FkByhBuFmJaj7jIHKCqcargTGH7odxx5IK8VC8fcqvryLjoo1AIVrcqWDm2k7I9pUKcp
         PFcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA3RmzriiZr+kLxRpgvGmsQq3qnzB6AKXlOveVWmIHWYXfBZd65HXiJWUpmPN9giItlVU4iSlWf2UpC2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy0FN1XfA1sa6waAZHGlNUCKBgm8dx2Q8JJ0TgECupZ45N+Cot
	TU5IiXiBKC9+8l1lsgA0GtQqL9vK767fyks5v8k3gIAZLjEA0lZdln8vKGZAR+eYxBA4SKHLqyn
	eY6izT6mPs5GHEh/Rwu93KK5Bq3F1iGNmOBInidVT
X-Gm-Gg: ASbGncv0AVyBgG7UNhJSXErsm915QpmMEDysDxgd/dhpesGkuFu4GVds6RIgz7bbKyq
	a+pG1tjzxdkULfJt8UFBJ/Xqa17mXeCCCLw34zC3j1TOFzgx+K7PGZ+FqoaQ7b+acXQzH788gwW
	GNLbQLAEsaeQYy1V4FBfXpR9rtf3lMFd+AW5HGRsBhrbAqDAOtRejTwfznWvFDW8LVxYAWP62t6
	ABI
X-Google-Smtp-Source: AGHT+IEiQuh5LjlsCcA7qaI9oQhIPWCsjEyB7JTNTj6XFbJ9WVg7qPtMe5Tz7PrvBDjuqNqnia9yn5ArtcfzXOoCqd8=
X-Received: by 2002:a05:690c:6ac2:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-7164d4db0b0mr64094247b3.22.1751490300545; Wed, 02 Jul 2025
 14:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
 <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
 <1j4ivued2q.fsf@starbuckisacylon.baylibre.com> <CACqvRUa8EqMbCd2x=di-a6jbMWW8CMo4kgLH=0qnsqHdO16kxA@mail.gmail.com>
 <CAFBinCAkW+G9oV+SOJdac50oLezQnbc358dBgs56-RfjPd-zgA@mail.gmail.com>
 <CACqvRUYwwgRqid8AbLJ7bp+gTyHw2c=o-pj435Z0PDriJcnnKQ@mail.gmail.com> <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com>
In-Reply-To: <CAFBinCA-aFNd+UQR5oWBY+HtMcdefeiH4Oc6bvZTaYDxowYCjw@mail.gmail.com>
From: Da Xue <da@libre.computer>
Date: Wed, 2 Jul 2025 17:04:49 -0400
X-Gm-Features: Ac12FXz2eBEQpE1uXBge_BXeozibSAfNnKLrTRR6ZVdJLMP7Abjjpj73aBSCXy4
Message-ID: <CACqvRUbQD3HS=_DH-ZW-D8JTkC_o2PbBkOzcZ44h57JJWW4-mw@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Da Xue <da@libre.computer>, Jerome Brunet <jbrunet@baylibre.com>, 
	Anand Moon <linux.amoon@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 4:57=E2=80=AFPM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Wed, Jul 2, 2025 at 9:07=E2=80=AFPM Da Xue <da@libre.computer> wrote:
> >
> > On Wed, Jul 2, 2025 at 2:40=E2=80=AFPM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > On Wed, Jul 2, 2025 at 7:22=E2=80=AFPM Da Xue <da@libre.computer> wro=
te:
> > > >
> > > > On Wed, Jul 2, 2025 at 1:07=E2=80=AFPM Jerome Brunet <jbrunet@bayli=
bre.com> wrote:
> > > > ...
> > > > > If, as the description suggest, the regulator framework somehow i=
gnore
> > > > > the timing set in DT, maybe this is what needs to be checked ?
> > > >
> > > > The regulator framework only cares about timing for regulator on.
> > > > Regulator off just turns off the regulator and returns without dela=
y.
> > > There's an exception to this: gpio-regulators without an enable-gpios
> > > property. My understanding is that regulator_disable() is a no-op in
> > > that case (meson_mmc_set_ios() even has a comment above the
> > > switch/case statement), see [0].
> > >
> > > > The code makes incorrect assumptions. Then the kernel resets the bo=
ard
> > > > without having enough time.
> > > Can you please name the board you're testing? I'm worried that I'll b=
e
> > > looking at one .dts but you're looking at another one.
> >
> > https://github.com/libre-computer-project/libretech-linux/blob/master/a=
rch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi#L481
> >
> > vcc_card is a gpio regulator that gets toggled on->off->on.
> Thanks, that clears things up as I was indeed looking at a gpio
> regulator while this is a fixed regulator!
>
> > I traced the regulator framework a few weeks ago and forgot the final
> > regulator disable function call, but that call basically returned
> > immediately while the regulator-enable function complement had delays
> > implemented.
> Yep, for fixed regulators there's an "off-on-delay-us" device-tree
> property (which translates to "off_on_delay" in the code).
> Its implementation is smart enough to not waste time by adding delays
> at runtime by implementing: on -> off + remember time -> wait
> remaining time + on (meaning: if there was enough time between off and
> the second on there's no additional wait) [0]. On system shutdown it
> will not add any delay unfortunately (where Linux loses control over
> time-keeping), meaning we can end up with too little waiting time.

Yes, this is evident on quite a few Amlogic boards but occurred rarely
enough that it can be overlooked but never-the-less should be
addressed.

On our SM1 board, this occurs more often than not. With this patch, we
can reboot the loop indefinitely.

>
> Also my understanding is that it's not something that can be fixed in
> u-boot or TF-A. This is because bootrom already has trouble reading
> the next stage from an SD card (which is a valid boot media).

Correct, not fixable in TF-A or u-boot.

>
>
> [0] https://elixir.bootlin.com/linux/v6.15/source/drivers/regulator/core.=
c#L2754
