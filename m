Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226302749E1;
	Tue, 29 Apr 2025 22:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745965788; cv=none; b=eWFlFt80mq1nkvuIaTgfgc1/i7wWxPyrG04NUTYa4KPwxoH+sWKspVvsLi09rXEhhnupfO31xF/6q8LdE4sSc9grdaf1vYkqpJPh0Kk1fAXlsgDVI3m2QbKoyW7C83sfnsoIJQuDAdzvQrx74eZKYb50HEO6h/OO8hgfuBKqKeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745965788; c=relaxed/simple;
	bh=krVN7fbLDEgUpA3CZRaPnPrQx/YtEFqbO33A+c1lnE0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=UbTpiek5JbhlvOjZkt5Ya4N0Fd24ksVzOPJyHMytNJ98akvKk8V3T2BhC49CBdxLF/OnQxUXOtPtpV5SoPjWlXdnxAC+EUeQAZQiYaxYWCNMCTh2IOD36jevJRtcPzrsQe8hhlvCkuq3O4azaGVVkhMiww+IOP7oQANu5vvt/Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOHSLfvd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOHSLfvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D573C4CEE3;
	Tue, 29 Apr 2025 22:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745965787;
	bh=krVN7fbLDEgUpA3CZRaPnPrQx/YtEFqbO33A+c1lnE0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=gOHSLfvdCibmwpEa/qnvyBi3DOHj6LwLBNnR5umgTyIpzr6ishK7lzagEG4u/X0A6
	 Gu7XUIaaTz0hulUcTeerC9q13qE0vQ8TX6Hd0ERoBgVtZoNPDCkOJTxYm4ILBWcZrU
	 aLma7kuKv09FpEJ8g67GOph8JOFjgufewWx/u0QH4Db4ZXvVzKBhJhsSkjnWbvKSRl
	 S1QnVz2rQGLBqz8b3VsepNJj6DwXoLFEr+L6tTH+uXurmZ7q+51ih6cjN9U3pG7/LU
	 dSaevH9O3KiPPOjUXfbrCJ3bawtVYXN0Q4mEeAmOMphYetKJ1JNR+GQyM6zx5ak3uk
	 UEl/1ZupSCyag==
Message-ID: <9ce45e7c1769a25ea1abfaeac9aefcfb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
References: <20250403094425.876981-1-m.wilczynski@samsung.com> <CGME20250403094433eucas1p2da03e00ef674c1f5aa8d41f2a7371319@eucas1p2.samsung.com> <20250403094425.876981-4-m.wilczynski@samsung.com> <Z/BoQIXKEhL3/q50@x1> <17d69810-9d1c-4dd9-bf8a-408196668d7b@samsung.com>
Subject: Re: [PATCH v7 3/3] riscv: dts: thead: Add device tree VO clock controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
To: Drew Fustini <drew@pdp7.com>, Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 29 Apr 2025 15:29:45 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Michal Wilczynski (2025-04-07 08:30:43)
> On 4/5/25 01:16, Drew Fustini wrote:
> >> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/d=
ts/thead/th1520.dtsi
> >> index 527336417765..d4cba0713cab 100644
> >> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> >> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> >> @@ -489,6 +489,13 @@ clk: clock-controller@ffef010000 {
> >>                      #clock-cells =3D <1>;
> >>              };
> >> =20
> >> +            clk_vo: clock-controller@ffef528050 {
> >> +                    compatible =3D "thead,th1520-clk-vo";
> >> +                    reg =3D <0xff 0xef528050 0x0 0xfb0>;
> >=20
> > Thanks for your patch. It is great to have more of the clocks supported
> > upstream.
> >=20
> > The TH1520 System User Manual shows 0xFF_EF52_8000 for VO_SUBSYS on page
> > 205. Is there a reason you decided to use 0xFF_EF52_8050 as the base?
> >=20
> > I see on page 213 that the first register for VO_SUBSYS starts with
> > VOSYS_CLK_GATE at offset 0x50. I figure you did this to have the
> > CCU_GATE macros use offset of 0x0 instead 0x50.
> >=20
> > I kind of think the reg property using the actual base address
> > (0xFF_EF52_8000) makes more sense as that's a closer match to the tables
> > in the manual. But I don't have a strong preference if you think think
> > using 0xef528050 makes the CCU_GATE macros easier to read.
>=20
> Thank you for your comment.
>=20
> This was discussed some time ago. The main issue was that the address
> space was fragmented between clocks and resets. Initially, I proposed
> using syscon as a way to abstract this, but the idea wasn't particularly
> well received.
>=20
> So at the start of the 0xFF_EF52_8000 there is a reset register GPU_RST_C=
FG
> I need for resetting the GPU.
>=20
> For reference, here's the earlier discussion: [1]
>=20
> [1] - https://lore.kernel.org/all/1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@=
kernel.org/
>=20

In that email I said you should have one node
clock-controller@ffef528000. Why did 0x50 get added to the address?
