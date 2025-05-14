Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13D01A5B82
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234266; cv=none; b=ZVdvhr8+mcqW5mWgzVybqzKGNMbKc32VPUvl4TyKP2Bas4vKsTrvhPDB2o6ElqkqYfBak5GRrNHdspNp0XfWDapv/vUDxTSr+E986hpu8nxF4tWxqreEAFNnF+6M3fyEUXIOtT1t79PcEfH/EPVVYa7YH9ZJgFQsk8v5ZBJuR0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234266; c=relaxed/simple;
	bh=54ct1BtcUapGHVq4wWvZ4zz+MIrUcIPkwqhDJ5i7gwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZyZnDVO1Ga5ztipCyuakGLZtyrnkBGRgo6NhUBawA4obbai+FLOAhMH0l5nkhuA9wIZ7kn+f7ivHJ7FK0W1S67hPfLQNBiz/1oJl/EBH+8X9sXhpbzsRpavyIyBBsXep5EMEHNwD26ClRKRrrLOE5S8GKhwN3vU07hGTZZkhNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ue5b80FW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ue5b80FW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47CCBC4CEE3
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234266;
	bh=54ct1BtcUapGHVq4wWvZ4zz+MIrUcIPkwqhDJ5i7gwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ue5b80FW1wgF10U3Zifd1J6tz1VUWPPruy+wYjhUfUFL7wgmvz9Ve7usUqmllE13D
	 XqnpNS7aG/OZDNydIG+NM8uXNlx9EPKVuY8sCe0ZuW8GJQH8mIGTOtDUvOnHijxZtg
	 UMvgYXv02ahv6dztYnj3H3Vz1BQoatO+E+WQeCDmEY8FIA7aur1JPUrxHC+k0kTy5q
	 fiXipjK2NmvHaIQaLAeqFwvOsoaxFJUi4Edi5g8MwzX5pXHf9iIooBDY3lyc+UVn22
	 o25u6hS9Q01oX89k0s96W/DewWp2sqZ80CexAig5+E8uK9RxhTkYXD/Ga/kcBJgDBV
	 zLADSA7z85c1w==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acbb85ce788so1333896266b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:51:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3pjrG9nPCDxO4cOvUOpcVB5ntmXFhjxLO33yRn9rfKBft2WpoImgOVf72uFs4wPo5SU1fHbpjtzxmilA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpkQUZAFyQJGXDQotqc0JfZC5nyEJPWf6gyFPTkL+7MsBD5vHr
	f6cugZyyDiOJpRpdt3pkUTH9L1hBrKuEcJdsKgyXIfebm6t9DSHwPd7wVgkuQwZDupfqLrdbnc4
	0nAl+Tl6eQJPxYpNhOXEd4HQiAQ==
X-Google-Smtp-Source: AGHT+IHHwEKl6KCMBqy7rgmxXmuTIh8nZgXRMqUStX7VUuXrxOdp1iOj4RjhCEheh3CMMCyM4wWF2NCrG5d6xK07Gug=
X-Received: by 2002:a17:907:a2cb:b0:ad2:39f2:3ab3 with SMTP id
 a640c23a62f3a-ad4f728f90fmr409018766b.48.1747234264928; Wed, 14 May 2025
 07:51:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla> <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
 <aCIVec7zl3tIh73h@J2N7QTR9R3> <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
In-Reply-To: <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 May 2025 09:50:53 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+TUife95L3hgafAujsHF9O81+YYV1gwq17AR_e63x0vg@mail.gmail.com>
X-Gm-Features: AX0GCFv0K4Z03fSgxYvGWe0EVE0kgIwLZ5h7urcrmE_VdP42VE4V5alJb709t7I
Message-ID: <CAL_Jsq+TUife95L3hgafAujsHF9O81+YYV1gwq17AR_e63x0vg@mail.gmail.com>
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Radu Rendec <rrendec@redhat.com>, Will Deacon <will@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 11:27=E2=80=AFAM Sean Anderson <sean.anderson@linux=
.dev> wrote:
>
> On 5/12/25 11:36, Mark Rutland wrote:
> > On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
> >> On 5/10/25 03:04, Sudeep Holla wrote:
> >> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
> >> >> Cache geometry is exposed through the Cache Size ID register. There=
 is
> >> >> one register for each cache, and they are selected through the Cach=
e
> >> >> Size Selection register. If FEAT_CCIDX is implemented, the layout o=
f
> >> >> CCSIDR changes to allow a larger number of sets and ways.
> >> >>
> >> >
> >> > Please refer
> >> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache in=
formation probing")
> >> >
> >>
> >> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for =
use
> >> | in conjunction with set/way cache maintenance and are not guaranteed=
 to
> >> | represent the actual microarchitectural features of a design.
> >> |
> >> | The architecture explicitly states:
> >> |
> >> | | You cannot make any inference about the actual sizes of caches bas=
ed
> >> | | on these parameters.
> >>
> >> However, on many cores (A53, A72, and surely others that I haven't
> >> checked) these *do* expose the actual microarchitectural features of t=
he
> >> design. Maybe a whitelist would be suitable.
> >
> > Then we have to maintain a whitelist forever,
>
> There's no maintenance involved. The silicon is already fabbed, so it's
> not like it's going to change any time soon.
>
> > and running an old/distro
> > kernel on new HW won't give you useful values unless you provide
> > equivalent values in DT, in which case the kernel doesn't need to read
> > the registers anyway.
>
> Conversely (and far more likely IMO), running an old/distro devicetree
> on a new kernel won't give you usefult values. Bootloaders tend not be
> be updated very often (if ever), whereas kernels can (ideally) be
> updated without changing userspace.
>
> > The architecture explcitly tells us not to use the values in this way,
> > and it's possible to place the values into DT when you know they're
> > meaningful.
>
> Well, maybe we can just use these registers for the hundreds of existing
> devicetrees that lack values.

If the lack of values is a problem, add a schema to require them. Just
adding them as required globally isn't going to work, but nothing
prevents someone from having additional schemas for platforms they
care about or we could figure out a way to opt-in to specific schemas.

Rob
