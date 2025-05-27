Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD702139579
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748314114; cv=none; b=KuqpiOfi4ezf3optAYWkqX7uAqhoPQgUaxh4iWzboLd93ZJB6XEFPrqXLPgJZTpvQ5sIfxwvX1xqn+BOM/M9C/OlebPQIUTSCTtcJ+DGdGELjponolkPJsJCdKT2KIcZj7Wpr9oMomcLbxUNDsq8S0MZ0XaBpI5bfEleiuTOr0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748314114; c=relaxed/simple;
	bh=1sIkGvLRc4q9F0wAGlww0AgdOxuNbiq/W5VJZQg3ebE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANzjniqIsUe7a1pnNz+RyxiUbirMaN8yTICaSok23gkoZa6VhwIy9CeKSoKGCsBW8AnX4RyqSxSSKmUexycRAfld8lKwE42MbKDmJ5Juyfpk0ssyrxbNY4quozUEffF9l//Dnyyp50JbfDoebjPEeBmJlgHdo4LA/aVt/m4ANhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=cBaG4EKJ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="cBaG4EKJ"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad1f6aa2f84so566647666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748314110; x=1748918910; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxISWGK2XQPkm4Hhr1US0gvD1FZ3zYyiGOuHAQJE5eo=;
        b=cBaG4EKJNl3cuWB6pIdbTLbU184LMPx1S8Le/UTPlp9DXIT30STkIaS18O1u3dGVlH
         OzQYiG6Lxb7QkaC4Ss6xiXLamwysKiCmv5hTntRJY4/oFKT3VoRV2TMRukOA8BZYe1gk
         tXRxLO3X/i+dvdzQ0DsjlzPcoODAdIbATiDjchNRO5f1BA0tyF1h3V9HNyvwZ2d23av8
         PgUWib1fFQ8MxDAXmJjWUyoAx3XMeT7Kqw1kPDoe+wenMN3M0K0ZfdZvY2rZKJ6QDoAv
         DeN6fKLGUu1bw35d5DoaqDhx4DAGNsUwAbqYs8v9K1f7MEINOliAyJ/l5H1LxJOG/9vq
         LNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748314110; x=1748918910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxISWGK2XQPkm4Hhr1US0gvD1FZ3zYyiGOuHAQJE5eo=;
        b=ny6R0CT0MByxpvS8bEGobY813ZFVdr1eVQSdUWWy60rLAQwzv+dQObzDMpSy6gZV8I
         aOW9C4yBsNt8Io6Q8TRfAITE0Dy5Jtr7DbbjCK8YdhwwJ/320UL9wdB+vztlWmngLELB
         SJKFRN+s4z7mYg3Tpic6kkKT46pjyxbqnp1HnYuTCsC+8mWP1aUD9aR3PdTJK0mhi5rg
         f7jeJkSAcH/4k4ShsTptiVNODOy7OdSSQiZzNUHZa5tiMqMu6/PspGxL5Ef/ZGtNoXaE
         B1CHKjnHWmJRxtkOLb+pQQE6EstWylDjjWOMWDnerHqERG2oCgjtj8ZTdtbQTJSJLF9M
         SUzg==
X-Forwarded-Encrypted: i=1; AJvYcCUPhrcwsHSBEMHTHDFliGOcer1NMiiuCbJi4wBzn2dFHr0ONlR/e7bqv4IAMnL07b/IYrzo/OqVE55bqfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaX2d8KQVrRxSyiv/AEo8Fb+2QRqLvMTHi37Rx5BGYugYdGo11
	c0OjQbmYN6ZXQSCQS4GM8XS5/z9r8pqO6Aysvll1fct0u71ef2bbLdwUpSoTJ8WTqsxFW3a9LRP
	zSXcdh4aMkcLiquOh4k26EINrIjRHR/4V8ME6J43Zow==
X-Gm-Gg: ASbGncsckGMoLKxclNiNpFpT9gBGW/bHfViTrpa4ORJ6Y7EbGmULLyznAX/4uRiAZyY
	4IUcup1oS2yuP9Nkm/bjWBhFLL1EipjIpQWeTgairdCqPsT4WFuaNvC81JKW9ymiHD4DB15Nzee
	J7zn9bhH32p2Wuc/UDatvAxHE2985Lk92teQ==
X-Google-Smtp-Source: AGHT+IGlQnBA51IfLDQtlV4Tsj0DcivukafO3WpRjoRYo7aZ2XNkgT/ISpHO9OKoKdboUS/Oi+TdrQgc1gVBGNRrhUg=
X-Received: by 2002:a17:907:9303:b0:ad1:d0e7:a698 with SMTP id
 a640c23a62f3a-ad8596d8c4emr1099084466b.2.1748314109982; Mon, 26 May 2025
 19:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-5-guodong@riscstar.com> <paasmwjel652r25nxobidydtpxfjy7emerilmwqhvhtgrrtg6v@gowpzqdzvlfz>
 <20250526215243-GYA53128@gentoo>
In-Reply-To: <20250526215243-GYA53128@gentoo>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 27 May 2025 10:48:18 +0800
X-Gm-Features: AX0GCFvI_6k3vBVjk-TWBpWmMUcHskFmulTKZz7Kxcz7kFRTgK5PHEc_K-e3F1M
Message-ID: <CAH1PCMZhS4_u3nTdAQDfTTRVJ_61n-OYjmMuv2m4DHYDzGE0XA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
To: Yixun Lan <dlan@gentoo.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	heikki.krogerus@linux.intel.com, elder@riscstar.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 5:52=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrote:
>
> Hi Guodong, Uwe,
>
> On 18:54 Mon 26 May     , Uwe Kleine-K=C3=B6nig wrote:
> > On Tue, Apr 29, 2025 at 04:50:46PM +0800, Guodong Xu wrote:
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/risc=
v/boot/dts/spacemit/k1-pinctrl.dtsi
> > > index 283663647a86..195eb8874f3c 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
> > > @@ -20,4 +20,11 @@ uart0-2-pins {
> > >                     drive-strength =3D <32>;
> > >             };
> > >     };
> > > +   pwm14_1_cfg: pwm14-1-cfg {
> > > +           pwm14-1-pins {
> > > +                   pinmux =3D <K1_PADCONF(44, 4)>;
> > > +                   bias-pull-up =3D <0>;
> > > +                   drive-strength =3D <32>;
> > > +           };
> > > +   };
> >
> > There is a newline expected before the pwm14-1-cfg node, isn't there?
> >
> Right, I could amend this and fix it while applying this patch
> (so if there is no other serious issue, no need to resend)
>

Thanks, Yixun.

By the way, do you plan to take patches 3 and 4 of this series into
your tree? They only apply if the SpacemiT reset patchset is applied
first.

BR,
Guodong

> --
> Yixun Lan (dlan)
