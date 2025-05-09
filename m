Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B41223A6
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802005; cv=none; b=BHccS2hMkPXWoD7LWub7ItdK5qFJgM87OOjwNWH1fn9Sk5aJcfzFNL4jdK32czRDxOqqkMT7qaxRcgvTim6aztIXZ6Ku2ABzrNVnuuf1RFohJv2/91xLbxrUZLtXUBEiP1r1Zj0PC5lxyOkx/zx5Qp5zB3Hn2UiYNdEWB7Idv58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802005; c=relaxed/simple;
	bh=tPVZPWNCOYoPgGgXeIIn2UbDqXC7SXYegkzLCHglCNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SxkZr9KrozBDw+hocj1mxwmgtmfbRzc6g/t53M4oE7JOh2SGGvkCSsfcW4ZDVsEaoala8nRftxvx4e14IYsQML2Ek/ueIvj/0Z/QxqYoWIDzJqh6bSCzA8MxoaafFNZBf7d7Uy4JlpFML8wQJ5topc8Aawnj0KV3LQ4FgW7i9jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0B1KOm9j; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0B1KOm9j"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2963dc379so353862866b.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746802002; x=1747406802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqPDd473ZQWcooUPNpRz+CKqf4hWlXZOHvbt8YRzn4w=;
        b=0B1KOm9jnH30vTSocHa9TjgHUtfQffvsn0OfzW4EXNJzHw0WAjhpdZkeefBuLRmpeW
         HAvOXIjkW4Gi8vcxptjwWXOJReVxi7Bejl4y/VkOhukLCXNKtSmTJZNHHVjF0ChvvtEy
         It/zRLi3iOzXWw08vxWqvl8k762XOGEsQUuPQySSsw2qP2HB9FSoydBWUlsxkbQqZlep
         pPQd136lzJ/2KR8acbPx3y4qjfdd/Hrr7VMzQROZaEQlZk5OIX2emvWLj/A4MELZqszO
         rbiaXRlrMYHffdMhg6R//AJX3T+u377CmYnLRwBdENI0GOT/siV18noaJfNToRK3hOLW
         juHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802002; x=1747406802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqPDd473ZQWcooUPNpRz+CKqf4hWlXZOHvbt8YRzn4w=;
        b=psKNT1CFOu2FbWN8SFHT7eOmfc5Sc3VUnVwPycNr80h2bpAB/uzybDEdFUa5Xg+Xit
         4/H14vOBFBJia3q4qbTNsZLibeLX2inLC7OZhod4gmX4P1WWezJm9w5kJwKbctO1JYOF
         E822hOgrTGBcvY21LIMK/TWIjGi7qP45HuAnJtzwVqII3c6Nz2u9vLrBcuO6guFLXOvq
         N9UisYyR9nrjSU9PFFxViNV1k9LIzwBQyq3vtxUxYt4G/eYXJq4Y95CdfZPoHWs1AW+S
         AZPkpVSCX0BzAhkYvpNLy0GLmd7EtfZGrZFLmY5liMUkO5CFxpHrDCVfa3LSrTHX42H5
         E3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhreBPtCMCx79xn/5iAQM9kuXCnBJKV5rTev2z10FC720eJ038RRNvNzoLBr3jjOQzba6GzWS5crqJcXU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywko98jN5+sa+ou5dh7F4UMDNEfW/Zeru+H0vgu15TQAcoGd4cG
	y3jufXDzq6+p2/CO5/GygAoL9MZGw1Ct3N5+2EYpsWKmMkkL31GG1hlRxHboxj84VRbNg/NkEbc
	YSW2UqZM4FLc55beLSP5v2XVc7NSZSist1bohrJaIEe53x0rA5kUq
X-Gm-Gg: ASbGnct5ZkX9r8JnTY0++vzLOu4eiE0O1tMe++uenkzk7haInR2IjVlvau40tHb5mz7
	veQf+7m3tkz286L37Ai6f4z4HA3dWh86EY3mESs24BACU5Wsz+CqvV7K3stGalVddfV0HcrM+CJ
	TKewj+us7g+UkRMxQownz7cgh7/G4Oh0hy7QRM0Nambfj9Bp4PtRG2
X-Google-Smtp-Source: AGHT+IEA002KjzYuQN8mBsFnac//gQE6/nlAx3Qg4teok9k7rMWjTs5P9zd3QgSlRedEqT+71xQmXuZHnUh/98J3AIo=
X-Received: by 2002:a17:907:7e82:b0:ad2:1870:24d6 with SMTP id
 a640c23a62f3a-ad21915d80fmr422482966b.43.1746802001474; Fri, 09 May 2025
 07:46:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429003359.375508-1-tony.luck@intel.com> <20250429003359.375508-14-tony.luck@intel.com>
 <4aa0904d-9332-4796-90d6-d858711fc611@intel.com> <aB0T_Ep2lJzfwjv5@agluck-desk3>
 <2a19f63a-f9b4-4632-bca2-2f64f6fed57b@intel.com> <aB3nGDzW6pNNkYTB@e133380.arm.com>
In-Reply-To: <aB3nGDzW6pNNkYTB@e133380.arm.com>
From: Peter Newman <peternewman@google.com>
Date: Fri, 9 May 2025 16:46:30 +0200
X-Gm-Features: AX0GCFuwcP3gG12CJJi6nR0VSEns8QAaD3COAOIHvOl4j9Xoi_yyM4CZSm_PzaA
Message-ID: <CALPaoCjzrGMTEYmTpH=9o_=N24apE0U057p6Mt6Knt9PoyFmzw@mail.gmail.com>
Subject: Re: [PATCH v4 13/31] fs/resctrl: Add support for additional monitor
 event display formats
To: Dave Martin <Dave.Martin@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>, "Luck, Tony" <tony.luck@intel.com>, 
	Fenghua Yu <fenghuay@nvidia.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, James Morse <james.morse@arm.com>, 
	Babu Moger <babu.moger@amd.com>, Drew Fustini <dfustini@baylibre.com>, 
	Anil Keshavamurthy <anil.s.keshavamurthy@intel.com>, Chen Yu <yu.c.chen@intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, May 9, 2025 at 1:29=E2=80=AFPM Dave Martin <Dave.Martin@arm.com> wr=
ote:
>
> Hi,
>
> (Backtrace retained for context -- see my comment at the end.)
>
> Cheers
> ---Dave
>
> [...]
>
> On Thu, May 08, 2025 at 04:45:21PM -0700, Reinette Chatre wrote:
> > Hi Tony,
> >
> > On 5/8/25 1:28 PM, Luck, Tony wrote:
> > > On Thu, May 08, 2025 at 08:49:56AM -0700, Reinette Chatre wrote:
> > >> On 4/28/25 5:33 PM, Tony Luck wrote:
> > >>> Resctrl was written with the assumption that all monitor events
> > >>> can be displayed as unsigned decimal integers.
> > >>>
> > >>> Some telemetry events provide greater precision where architecture =
code
> > >>> uses a fixed point format with 18 binary places.
> > >>>
> > >>> Add a "display_format" field to struct mon_evt which can specify
> > >>> that the value for the event be displayed as an integer for legacy
> > >>> events, or as a floating point value with six decimal places conver=
ted
> > >>> from the fixed point format received from architecture code.
> > >>
> > >> There was no discussion on this during the previous version.
> > >> While this version addresses the issue of architecture changing the
> > >> format it does not address the issue of how to handle different
> > >> architecture formats. With this change any architecture that may
> > >> want to support any of these events will be required to translate
> > >> whatever format it uses into the one Intel uses to be translated
> > >> again into format for user space. Do you think this is reasonable?
> > >>
> > >> Alternatively, resctrl could add additional file that contains the
> > >> format so that if an architecture in the future needs to present dat=
a
> > >> differently, an interface will exist to guide userspace how to parse=
 it.
> > >> Creation of such user interface cannot be delayed until the time
> > >> it is needed since then these formats would be ABI.
> > >
> > > What if resctrl filesystem allows architecture to supply the number
> > > of binary places for fixed point values when enabling an event?
> >
> > This sounds good. I do not think we are in a position to come up with
> > an ideal solution. That would require assumptions of what another
> > architecture may or may not do and thus we do not have complete informa=
tion.
> >
> > >
> > > That would allow h/w implementations to pick an appropriate precision
> > > for each new event. Different implementations of the same event
> > > (e.g. "core_energy") may pick different precision across architecture=
s
> > > or between generations of the same architecture.
> > >
> > > File system code can then do:
> > >
> > >     if (binary_places =3D=3D 0)
> > >             display as integer
> > >     else
> > >             convert to floating point (with one decimal place per
> > >             three binary places)
> >
> > I do not think this problem needs to be solved in this work but there n=
eeds
> > to be a plan for how other architectures can be supported. When similar
> > enabling needs to be done for that hypothetical architecture then it ca=
n
> > be implemented ... if it is still valid based on what that architecture=
 actually
> > supports.
> > It may be sufficient for the "plan" (as above) to be in comments.
> >
> > >
> > > Existing events are all integers and won't change (it would be weird
> > > for an architecture to report "mbm_local_bytes" with a fixed point
> > > rather than integer value).
> > >
> > > New events may report in either integer or floating point format
> > > with varying amounts of precision. But I'm not sure that would be
> >
> > Partly this will depend on the unit of measurement that should form par=
t of
> > the definition of the event. For example, events reporting cycles or ti=
cks
> > should only be integer, no?
> >
> > > a burden for writing tools that can run on different architectures.
> >
> > Maybe just a comment in the docs then ... and now I see that you did
> > so already. My apologies, I did not get to the last four patches.
> >
> > Reinette
>
> Just a thought, but I think that while it's not possible to be fully
> generic, a parameter model along the lines of
>
>         quantity =3D raw_value * ((double)multiplier / divisor) * BASE_UN=
IT
>
> would cover most things that we have or can reasonably foresee,
> including memory bandwidth control values.
> raw_value, multiplier and divisor would all be integers.
>
> Since raw_integer can be the value used by the hardware, its precision
> can probably be fixed at 1, though we could still report it explicitly.
>
> Fundamental base units would be things like "byte", "bytes per second"
> and "none" (i.e., dimensionless quantities).  (Are there others?)
>
>
> Since we cannot guess for certain what userspace wants to do with the
> values, it feels better to let userspace do any scaling calculations
> itself, rather than trying to prettify the interface.
>
> For example: scaling memory bandwidth percentages for MPAM is a
> nuisance because the hardware uses fixed-point values scaled by a power
> of 2, not by 100: the two scales can never match up anywhere except at
> multiples of 25%, leading to irregular increments when rounded to an
> integer percentage value and uncertainty about what the bandwidth_gran
> parameter means.  Round-trip conversions between the two
> representations become error-prone due to repeated rounding -- this
> proved quite fiddly to get right.  Precision beyond 1% increments may
> also be available in the hardware, but is not accessible through the
> resctrl interface.

Google users got annoyed with these rounding errors very quickly and
asked me to change the MBA interface to the raw, fixed-point value
used by the MPAM register interface. (but at least shifted down, since
the MBW_MIN/MAX fields are left-justified)

>
> For backwards compatibility we probably shouldn't change that
> particular interface, but if we can avoid new instances of the same
> kind of problem then that would be a benefit: i.e., explicitly tell
> userspace how to scale a given parameter.

MBA is not programmed by percentage on AMD, so I'm not sure why this
is considered necessary for backwards compatibility.

-Peter
