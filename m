Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C400428F51C;
	Fri, 20 Jun 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750428657; cv=none; b=uuWaaZLzmN0mQ/eKuCV/Ltd7/I5IaDieC+41PknUkoZru1NhDeINrECF+dF2STGdA2iI7AtriCxKxJ3jHsrX229WOa8HoDNfqkjmmjF7HLMn1LVxJMrv1oyDIL5O1G3lbVrJYKWLceKKM4Xi00a9SsGqVAYgVWecLkkZbnElN68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750428657; c=relaxed/simple;
	bh=DWLqTlt7qScs/eSqGbluIhMQJKPILMhDxFv5Fnv72L4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUTE9fGFWb0InVYipT3izDsqUWw96g7lJ49Ikq6ZiiEYFkOFPjhbyDD6cIA9D61Rj2L9CZ0tWee0HhglbuwU3IF2zJ1RwaZIJvR9ZjyI080C4kidr2Sa6AtJ+a6U0MwrSXhhZnAoMa05lNBw24quXD7OmHPk0p1ceqciJG//y3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFeoPcWJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFeoPcWJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FD4C4CEE3;
	Fri, 20 Jun 2025 14:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750428657;
	bh=DWLqTlt7qScs/eSqGbluIhMQJKPILMhDxFv5Fnv72L4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=aFeoPcWJMnJJuG3uY3WNTldZ7QqXEuKax9osUXOEC/BlfQ1pDs/Ov32VZ9Yv4XTQ3
	 lQNKx47qX7paNjvfsENL661ABeLP57dDabdE8wAbR6KbZlLbLbAxHshHP1FS91ipKV
	 1qxD/0ClURf6XbmNjlDkptniJkAKl7CbKFFv0L2pDGmKCNUBqJNUuFf9/uKdIVnQLV
	 gD/9g272BlMPwerwzPvHgNVqsQVekFAs+d5f6aW1HOaoINhfR1rWmL/BGmuHXVvJFU
	 N+FEDu2G/WFhCjaEpSzlLmkI20ssityG/Qv+1D26ykwJ6604NFpWL45MkFmSEFF53m
	 4F9qg45KlUzfw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32ac52f78c1so17932821fa.3;
        Fri, 20 Jun 2025 07:10:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbaVCA/tZdE2CCCp2lI03I/jxccjP9zbWIbIfXMWaScavQoV9KYO87wEhmuur2eTKLwd+5XPPrt2l7@vger.kernel.org, AJvYcCXZpvgRiWSRVhZhg/VQX8VMozZqcygNl9UeS6STiCXD5kfEiWLQ9oIXUw0PVorJ8lXC/ePtfmpul0JY8cQF@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt9OTjd4EAt3GjJoRTfamp6Kqo3Fkmg2J3HyUu9awoPRO0q86H
	011mp3DUMvsMuU43yioqudgg8c4W/sv9EGUMdhdWHX7bHXh53XQy57Ge6zqCgQ0w+niqrtX8h8L
	bxU7glTVTvlAjOzlNSBKRwptVFMXdBiI=
X-Google-Smtp-Source: AGHT+IH8CF2NEra9No6azeD1GCngMtpDBipIwRYnL5TXqwOKzg1LS0rA27TzN6NN9wS6furzgVnYmCLyy13aH/I5tbY=
X-Received: by 2002:a05:651c:2006:b0:32a:74db:f3c1 with SMTP id
 38308e7fff4ca-32b992d7c61mr6520011fa.24.1750428655837; Fri, 20 Jun 2025
 07:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619173007.3367034-1-wens@kernel.org> <20250619173007.3367034-5-wens@kernel.org>
 <20250620145508.4d483885@donnerap.manchester.arm.com>
In-Reply-To: <20250620145508.4d483885@donnerap.manchester.arm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 20 Jun 2025 22:10:44 +0800
X-Gmail-Original-Message-ID: <CAGb2v66unLq4qiWDVVOLk3Aez2FTswXGXo7BVipeE-r4uhfcaQ@mail.gmail.com>
X-Gm-Features: AX0GCFv8LAvHWHMZ_VtGp4DmOmmFrWvOE56WxoB2hq-SW0Ou_bsSiN3oBifigJ8
Message-ID: <CAGb2v66unLq4qiWDVVOLk3Aez2FTswXGXo7BVipeE-r4uhfcaQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a523: Add UART1 pins
To: Andre Przywara <andre.przywara@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 9:55=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> On Fri, 20 Jun 2025 01:30:06 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > UART1 is normally used to connect to the Bluetooth side of a Broadcom
> > WiFi+BT combo chip. The connection uses 4 pins.
> >
> > Add pinmux nodes for UART1, one for the RX/TX pins, and one for the
> > RTS/CTS pins.
>
> Interestingly there is only one possible set of pins for UART1, so the
> naming is correct. Which would also mean we can insert the pinctrl-0
> property in the UART DT node in the .dtsi file already.

I'd leave it to the user, since it's possible to use it in either 2 pin
or 4 pin configuration.

> Regardless, checked against the manual:
>
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks!
ChenYu

>
> Cheers,
> Andre
>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun55i-a523.dtsi
> > index 30613a0b1124..6f62201fd739 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> > @@ -168,6 +168,20 @@ uart0_pb_pins: uart0-pb-pins {
> >                               allwinner,pinmux =3D <2>;
> >                               function =3D "uart0";
> >                       };
> > +
> > +                     /omit-if-no-ref/
> > +                     uart1_pins: uart1-pins {
> > +                             pins =3D "PG6", "PG7";
> > +                             function =3D "uart1";
> > +                             allwinner,pinmux =3D <2>;
> > +                     };
> > +
> > +                     /omit-if-no-ref/
> > +                     uart1_rts_cts_pins: uart1-rts-cts-pins {
> > +                             pins =3D "PG8", "PG9";
> > +                             function =3D "uart1";
> > +                             allwinner,pinmux =3D <2>;
> > +                     };
> >               };
> >
> >               ccu: clock-controller@2001000 {
>
