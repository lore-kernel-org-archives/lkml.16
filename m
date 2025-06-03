Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FFC3B19A;
	Tue,  3 Jun 2025 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748963739; cv=none; b=b+/aKqSixsNJUNvrIQWt6YaHaShj43cXU/mMuDmDQ78LR73tsJkTS2XsLiMdmbhlma19fM2mUeDThqbkBCu0vZz0+m6Sk/3F6vS6YLl9YZhJpSgHaT5WL5s+BHllLwAM7bs8zGovPrPqiNcIEUpPc+u6wwtk6w+tJSrN/qGfmKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748963739; c=relaxed/simple;
	bh=uPH1qCx8aCUcLC1E09n43osZKJyp2k4rUVT6oDBr33o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WFGUM/TAO1MJlq+QPIZl5MOOGEyqD/sjk4I+2FKMWB3p1Awn3l1w3PT79LxKjwZwy+C62wRTN+pR2dMQd2C/JEEkyhFyHXFD7FjF4d/oMXzJC7/rtERQI0l7v6fZ5FsRHvTVdk+KpLnOKrzk7WxZ54jwWiVjwRdhjUYTo8YmlZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNs3TQc8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNs3TQc8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9336CC4CEF6;
	Tue,  3 Jun 2025 15:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748963738;
	bh=uPH1qCx8aCUcLC1E09n43osZKJyp2k4rUVT6oDBr33o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PNs3TQc8gBw66VpmKxlLLhegoo6dmN9CYAQM2k3jiQ4S53yZ3iMlejdnSM/ACJ/Pb
	 HwXILoulHvvKNIO/HQAQtQfbA3qtXHuedh7cYv8aersiEFNHuBSa0QLpHI8odrxnkE
	 TIUBMZcag23heE1Cz2NlLqZOO61IgXh3V9Gbd62e35aji+OywQmP7vAIvKKG2XS8vo
	 zmWAcz9JiShd3fxzYHziMme0uZxPUhwSUjTFL1/XGTDYGBvZoMiQeoU1/xBVMoiBvm
	 dpBSgd9rLJkckFIyHozIsCubTtPLlK5Kn/TpMfuKHRfVpTkY2+Vi5PMGTXorUQcdjx
	 ebrAFA+NSdBLw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-604f26055c6so12832974a12.1;
        Tue, 03 Jun 2025 08:15:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUK/O5JruOu9DJK7HaDAWbm1hgt6Bx/VzJMzKbuQd2B+K6LMhYRf54lwRiSRWwafemVy6UpKxu+Tq99lbVj@vger.kernel.org, AJvYcCXEQNiyhWas9SJL1Xr5dmIy/eV8k8vIvTiWVqZZ4P9wf+fxT3Pxvzh5fVLGmpUq0b8hujYtJORYckER@vger.kernel.org
X-Gm-Message-State: AOJu0YyuBnnQ528oe+RiHzYZYr3jrib/Ky0ZO5zdFnMNqehBlIkl8OD6
	IVg2rWjxJEgLWXUiLyOB5T8SbD+jeky+mK4g+xqgGQHhoBqK8g7SMRHNhLjli6gmkAXW9E5Bd8i
	xELe1Go1rr+5Reifj5Rfkq+jJFS4/jA==
X-Google-Smtp-Source: AGHT+IHYuVkgYffZYwIk9zOx4O17w5xiyut7oVsDrPWVULDKwfy14qROoIZLMW73H+Zgzw3g7/yBgH6W/MtlT29QslI=
X-Received: by 2002:a17:907:1c9f:b0:ad5:5a7e:bcd with SMTP id
 a640c23a62f3a-adde5ec8284mr372128066b.8.1748963737020; Tue, 03 Jun 2025
 08:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com> <aD6ouVAXy5qcZtM/@lpieralisi>
In-Reply-To: <aD6ouVAXy5qcZtM/@lpieralisi>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Jun 2025 10:15:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
X-Gm-Features: AX0GCFs8qXTII7-x8n1VBPezizNhamXTZTvAiFVag57Gde-h4t-14oUxQ682H78
Message-ID: <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 2:48=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@kernel=
.org> wrote:
>
> On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > On Thu, 29 May 2025 at 13:44, Lorenzo Pieralisi <lpieralisi@kernel.org>=
 wrote:
> > >
> > > [+Andre, Peter]
> > >
> > > On Tue, May 13, 2025 at 07:47:54PM +0200, Lorenzo Pieralisi wrote:
> > > > +      reg:
> > > > +        minItems: 1
> > > > +        items:
> > > > +          - description: IRS control frame
> > >
> > > I came across it while testing EL3 firmware, raising the topic for
> > > discussion.
> > >
> > > The IRS (and the ITS) has a config frame (need to patch the typo
> > > s/control/config, already done) per interrupt domain supported, that =
is,
> > > it can have up to 4 config frames:
> > >
> > > - EL3
> > > - Secure
> > > - Realm
> > > - Non-Secure
> > >
> > > The one described in this binding is the non-secure one.
> > >
> > > IIUC, everything described in the DT represents the non-secure addres=
s
> > > space.
> >
> > The dt bindings do allow for describing Secure-world devices:
> > Documentation/devicetree/bindings/arm/secure.txt has the
> > details. We use this in QEMU so we can provide a DTB to
> > guest EL3 firmware that tells it where the hardware is
> > (and which EL3 can then pass on to an NS kernel). It would
> > be helpful for the GICv5 binding to be defined in a way that
> > we can do this for a GICv5 system too.
>
> It would be good to understand what DT {should/should not} describe and
> whether this DT usage to configure firmware is under the DT maintainers
> radar or it is an attempt at reusing it to avoid implementing a
> configuration scheme.
>
> Rob, Krzysztof,
>
> Any thoughts on the matter please ?

I'm all for firmware using DT, but using a single DT for all
components with an ABI between all components is an impractical dream.
You can take that a step further even with a single DT for all
processors in a system (aka System DT). Ultimately, the DT is a view
of the system for a client (OS). Different views may need different
DTs.

u-boot and Linux sharing a DT makes sense as they have the same world
view. Secure and NS not so much.

> [...]
>
> > The tempting thing to do is to have regs[] list the frames
> > in some given order, but the spec makes them not simple
> > supersets, allowing all of:
> >  * NS
> >  * S
> >  * NS, S, EL3
> >  * NS, Realm, EL3
> >  * NS, Realm, S, EL3
>
> Maybe reg-names can help ? Even though first we need to understand
> what resources should be described in DT.
>
> Current bindings are reviewed and I am not keen on dragging this
> discussion on forever - the information the kernel requires is there,
> I'd like to bring this to a close.
>
> Thanks,
> Lorenzo
>
> >
> > secure.txt says:
> > # The general principle of the naming scheme for Secure world bindings
> > # is that any property that needs a different value in the Secure world
> > # can be supported by prefixing the property name with "secure-". So fo=
r
> > # instance "secure-foo" would override "foo".

Today I would say a 'secure-' prefix is a mistake. To my knowledge,
it's never been used anyways. But I don't have much visibility into
what secure world firmware is doing.

> >
> > So maybe we could have
> >  reg : the NS frame(s)
> >  secure-reg : the S frame(s)
> >  realm-reg : the Realm frame(s)
> >  root-reg : the EL3 frame(s)

Here's why. It really doesn't scale.

Rob
