Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A0728DF13
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710908; cv=none; b=jcdCSKAqIHgnLWeABgWwYyKUa4VhvpJvNK7Abpdek12DQUKWvxfDU7kFp7T5bTYul4h5ukZPhDpiSg64e/4thEZlDpZB338nIXzFJe0ifqaTI6rjurCkPZZiddPgMphvY5M+Ahxg0AlRGW2ermTCXoJQy05slnbytcETzkAFzig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710908; c=relaxed/simple;
	bh=L0R8xGjLChjgStq7fgUrJ09AFQFLRTNk5cUsHXiRm/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IER0hPf7IytUJZuqA5uPD1NXnXkqMduN1qvheVSCFo0ZHZU3SXxeVcvS9aOHNq3/RJsAp+QTj8pQrM3F/DipJW8nixqNhZSe5a/lfzzPxs0iTSAd6R6htEO79TDmQgXUVnNRDxIYTgsCzilF9tyEzT/WKV7/qyYl8GXV6hCHAxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=NvdEg70P; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NvdEg70P"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac34257295dso1003047766b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744710904; x=1745315704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Sd6Yg3rC21jnGehy22uUVz7lDVf6VWqh6Q2Fhe7kCA=;
        b=NvdEg70PipU0O6XlqoRNzzBLAKA/q2ZenLdVSng2WxCmNNZCqRt8rmlFTkPLytc9Kc
         c0P0xV93/XSYTZjwAwPiWT/QB26WxQquxSDzBnu0sHt2Oic5vZ9PU2upeFDmrDOdpYPI
         G2J7fLW6oUQpjpdwvs57PxqFUkln7KlajAUJ96N89Uo2IHAPuguzF+jElnOFiM7/r8sY
         8wP3aCr0KMvvj5B9dMMy6rMYc68T2cArgoW4rSCYhmiiOmaOfUOh8PKQl2tj2zQXIF+k
         vU8iWHtgiUBS+ol+MIjFesX3nNEGQRegXTQdX81/njwlCL4qH5VjXTAOy9v+vSFZEv0D
         3LRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744710904; x=1745315704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Sd6Yg3rC21jnGehy22uUVz7lDVf6VWqh6Q2Fhe7kCA=;
        b=GPP226brmoemyuzYnVnssrtVnD53dfQ6LFrzJQ6VNJaQWWUJIg5wvKOWAAD/VwF98p
         2puP/tNqhTxMduOfML8YzZRKnbriiHdDneOgX8EST2xxSnr6Fm0EeAIyc2jmh5kuFEZY
         HxPQqABijBhE5AaxVDEEI2PxEP6X8bqq4+obcnjGlXIYwmNww/DAVX/UxbRoVYH0Y47K
         5gJYPL5AMcTOoBVrWWZtLUXucoFdh5y05tr2+V4JsPzvAaS0fYkYCMZlBqUgaWqFDEXq
         v1z1R9T6sMQohswcZ/c95ODuGlHAcH47kxbLWSSQcXZQnChbZ+gDV9wiFFBlQu24/tS/
         LzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUusg214CtB7I05wBrbfh0nTmZf9g4c24Tq12zW5TZshE8VRHZnObwaHm9dbO5WNnstx40+x8wDwccE4os=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYYAy+iH7eo01DYotamKsy+/DR6JtznF9Hjyh8KJLdL50LIemo
	LCUpz4DYzop+kZkqTb8V7CA3F57jdyYMOF+N1BaSdyEx8Zjqwl4ZfNLO0CfXpc+0FHA9Cq1uAYy
	GttnUp2RYNRYAmE9anOwuBkP4NnkoLDAPJ7Dlemy1LWExeIytDZvNKA==
X-Gm-Gg: ASbGnct4QSxNu8ReN0DVF5ehvKVrsKwDM2rmBR3p+e3j53mi+hfIioavozypveGynMc
	MFOunS0nxZ35wK0HJ46nmddiIvivnOW795B1xY71mAF/LrfrbQceMbRZDolDkxke0SRTjWpdSnj
	7wEU731BnAxQxf4/8/GED5nrr5BA==
X-Google-Smtp-Source: AGHT+IHAU8wJfJDF4eNSdv0Zm5P/kiq6Yogbh7eiqNmQ6osroOUsaiP2v1/BjbNJSKe15J8jBc9YnfV5U+5wxjTv07U=
X-Received: by 2002:a17:906:7154:b0:aca:dd0c:cfc8 with SMTP id
 a640c23a62f3a-acadd0cd3bamr1109850866b.10.1744710904488; Tue, 15 Apr 2025
 02:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-2-guodong@riscstar.com> <20250411-confider-spinster-35f23040d188@spud>
 <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
In-Reply-To: <89b6142bacecd4a7742341b88dc1e28c4454527a.camel@pengutronix.de>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 15 Apr 2025 17:54:52 +0800
X-Gm-Features: ATxdqUGYHln9nntZsdf9jj-vYb0_3U3ad99wI0oBwmwTA_WUeFe5BkvwdaXHs0w
Message-ID: <CAH1PCMZnJDcYKJR35WirQT95hte0NWvGBe4fjDuyZEgagvunAA@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: pwm: marvell,pxa: add optional property resets
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Conor Dooley <conor@kernel.org>, ukleinek@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@gentoo.org, 
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, 
	tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com, 
	duje.mihanovic@skole.hr, elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:53=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix.=
de> wrote:
>
> On Fr, 2025-04-11 at 17:44 +0100, Conor Dooley wrote:
> > On Fri, Apr 11, 2025 at 09:14:15PM +0800, Guodong Xu wrote:
> > > Add an optional resets property for the Marvell PWM PXA binding.
> > >
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >  Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.ya=
ml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > > index 9ee1946dc2e1..9640d4b627c2 100644
> > > --- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > > +++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
> > > @@ -31,6 +31,9 @@ properties:
> > >    clocks:
> > >      maxItems: 1
> > >
> > > +  resets:
> > > +    maxItems: 1
> >
> > Do any of the currently supported devices use a reset? If not, then add
> > this in tandem with the new compatible and only allow it there please.
>
> Also, if spacemit,k1-pwm can not work without the reset being
> deasserted, mark it as required.
>

Thank you Philipp. spacemit,k1-pwm can not work without the reset.
I will add that in the next version.

-Guodong

> The driver can still use reset_control_get_optional.
>
> regards
> Philipp
