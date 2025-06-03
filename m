Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C299220B81E;
	Tue,  3 Jun 2025 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748977908; cv=none; b=Qy58tCPAQSWc8dG78ifoQgeOcv/gwd2na/wVsVXhywd4D8dbrW/W/sPOVJunuzVv7vujn5ZZARbP2WsN0hkIQcSuTH2HTwdToTe0qov8NtdcfxLQNzvR+Ob637ZSpMTHTLSELMgj5Y7W3GAPCJOmbT7iLb4cSH9e0n7wBQl4qYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748977908; c=relaxed/simple;
	bh=NtbIHNXJCE6HdiAWFAi8T2FRZkuH6G7Wy6EuLQ2JEc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f+KtKBYUIwXneQMmGSvsrf1f8zORB5SZyYuydZ5nFgokc8+bjt4qkhjWm1uL+nFN4i45oVZhdbmSRXs8Enu40c9mXBEme+jrYo5D9Nv1iYMqbE4SIgeBniKyPi5CWhvudbAkFPPWg/3u/W5uTn6VIaJ9kiAvaIN90g18eMJGciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvwUxNiV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvwUxNiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CB9C4CEED;
	Tue,  3 Jun 2025 19:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748977908;
	bh=NtbIHNXJCE6HdiAWFAi8T2FRZkuH6G7Wy6EuLQ2JEc8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LvwUxNiVPwYp6mLEbWdTUoZoKksGLZKw7wQxDV1vwfc7hUdUdatMQUbC0aAoB88oO
	 /HWvYGTOo5Nvo7pmnDs07DEJ9ORh3PdFhrUw2LNNA2AFYj8KUbIqA62zmSQwBd7ynR
	 uiIRh5hYPhouGrxol2KhLlL2eBRe/U4Ei6xeV4ffAegT/TTraI9HpY7FUSd0pHNB11
	 2Z4iRhDaz3MawoC+fGhfCgbUoAy7n3RrHdQiBJ0ONBgF8EMYY8NNVrBSotxpq0ykVu
	 QYdwQtbKs4NSQrjMZHxKGwk45psiyr6jU4CyiUW8h2dGxleO6jsyp2JyMVgKHBLLmR
	 9BKjQLxkLdlVw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso11666619a12.3;
        Tue, 03 Jun 2025 12:11:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyjoR50JYnDJ3BLeHC9aKBOma/vUSKsUBmRF/UXYAgv6Ojz/lHTRPNrtOnGIr4hvHRL1eyPgLqjnUNLZ2G@vger.kernel.org, AJvYcCXDV8vQUhWL/+Lp/cnL075zJxDrRsc8yYT8WHJDXfxJw6+K26LW38/taAUA3yruIQwQkBIEU0Tj2KP2@vger.kernel.org
X-Gm-Message-State: AOJu0YxsRpg/3A/pScje1A9ZAJiVpReQVnzWwLm9CkaZYzpFPsoYhoX6
	7ptr+m4KoaJaO4pIVCIiQwxfozXNAbN95vaZmqWcFx8GGnpo3zs2azu9JS34P7oAhvjvwWRYCIt
	unQ1vK7r8NHEgAL1ua21RGHIVwW3aMA==
X-Google-Smtp-Source: AGHT+IGDlt4OCveynhrCFXx4DgX8xfm85z6UL0bsAuJVVSY62Mr48Abx9k4B0J9Pz7qcBz3dXFPCas/vNXZvDftBXQw=
X-Received: by 2002:a17:907:d649:b0:ad8:96d2:f38 with SMTP id
 a640c23a62f3a-adb36b23626mr1719607566b.18.1748977906740; Tue, 03 Jun 2025
 12:11:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
 <20250513-gicv5-host-v4-1-b36e9b15a6c3@kernel.org> <aDhWlytLCxONZdF9@lpieralisi>
 <CAFEAcA_3YLMSy+OsSsRayaRciQ1+jjh-dGzEjrh2Wa8BqdmqrA@mail.gmail.com>
 <aD6ouVAXy5qcZtM/@lpieralisi> <CAL_JsqJ5N2ZUBeAes=wexq=EstRSZ5=heF1_6crAw76yZ9uXog@mail.gmail.com>
 <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
In-Reply-To: <CAFEAcA-JrS0BiT66iin-pRVFadrY-pnJZ8TkDNxcjErknSCnUA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 3 Jun 2025 14:11:34 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
X-Gm-Features: AX0GCFvn1r9Jc_cN-EiFTkdAeiyJWM3OfHLrf6lkihvKvJSq8fFGzvhI_2zyfik
Message-ID: <CAL_JsqL7x53an2-MaLHP5tfVXb4JxT8ORUMaA8pL-gMsWLJqkA@mail.gmail.com>
Subject: Re: [PATCH v4 01/26] dt-bindings: interrupt-controller: Add Arm GICv5
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, andre.przywara@arm.com, 
	Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Timothy Hayes <timothy.hayes@arm.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, suzuki.poulose@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 10:37=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Tue, 3 Jun 2025 at 16:15, Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Jun 3, 2025 at 2:48=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@ke=
rnel.org> wrote:
> > >
> > > On Thu, May 29, 2025 at 02:17:26PM +0100, Peter Maydell wrote:
> > > > secure.txt says:
> > > > # The general principle of the naming scheme for Secure world bindi=
ngs
> > > > # is that any property that needs a different value in the Secure w=
orld
> > > > # can be supported by prefixing the property name with "secure-". S=
o for
> > > > # instance "secure-foo" would override "foo".
> >
> > Today I would say a 'secure-' prefix is a mistake. To my knowledge,
> > it's never been used anyways. But I don't have much visibility into
> > what secure world firmware is doing.
>
> QEMU uses it for communicating with the secure firmware if
> you run secure firmware on the virt board. It's done that
> since we introduced that binding. Indeed that use case is *why*
> the binding is there. It works fine for the intended purpose,
> which is "most devices are visible in both S and NS, but a few
> things are S only (UART, a bit of RAM, secure-only flash").

I meant "secure-" as a prefix allowed on *any* property, not
"secure-status" specifically, which is the only thing QEMU uses
AFAICT. IOW, I don't think we should be creating secure-reg,
secure-interrupts, secure-clocks, etc.

Rob
