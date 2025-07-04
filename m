Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5984501A;
	Fri,  4 Jul 2025 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751644527; cv=pass; b=GacZsE+iBH0C6vslCxGMD44sLtFGsk9kzZV043DDuEADYK0Y+GhAzWXKvvJTk66YY05t2s8dlAc3hIucuAY9+qAiO0K3WaKvpZGQpVj2z7cEqY8XulJ/L2tS5jUkdvKKnDzhd6+czJ5JA8KmbUFUVSwuWrgmm8n2UsCX0E/bQiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751644527; c=relaxed/simple;
	bh=y9shy4WABjMXApP03CgNPKXgv/nf2wQ3YGULRdAM/EE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OrSWXI8vvIC+9fp8eXqgq3d+8lflmpeA1H1UYL5yrDKtg5XHfXv+geeDPk1e5B5DkrjikEJqmXA8Jrymdsa4P4fG+9tJhPl0hr+2ZZmQa2eIAHV889s0QbzW7TQ3g19u3rAPNr+M55x2qcKqHxuKFdT50eukE/WEiSpuz6ZBlvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=Zt5tu1Dj; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Zt5tu1Dj"
ARC-Seal: i=1; a=rsa-sha256; t=1751644499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cdeygm4lRsrhT0J7mAzrQZsYAWPAovjxuALljDuK/7lWBABchyzXX/2qx+MkA8iPWWxRbq3TjLKiKCZQGGAVN4iwOgtjtYDF++UbporfluQbBytBqFp1L3L2QazuqoxB8LoPZsADrtynUIsyqaCsSaoRctloMrJiPptzlRLOLWY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751644499; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y9shy4WABjMXApP03CgNPKXgv/nf2wQ3YGULRdAM/EE=; 
	b=F3i2rZPeDCiu+XbCS6U9D16xSAA/y4R8tEzJESWRI5+htDWmZJWjEpbGcjHuvA+ZlBCiJVuldRJ0gcnXCHN2oe28eibZcwGqOBm9rlgWQe9d4z9dERKa96p30+yQJkzUwTq6oiKgvta6mXd3vbWBiR/4SQZOetCdyl6aRkOXrGE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751644499;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=y9shy4WABjMXApP03CgNPKXgv/nf2wQ3YGULRdAM/EE=;
	b=Zt5tu1Djn9hVKTEtlodlT6YUFACQSNWam8KJRf2/fWGO/g5Rvzy0w6pRSuML46No
	PNiGQatgAoLulpnxC96K4qPQm0aKgCFKbBWyUZMdXl+nz/rmGY0UDqMePXl24IDUtn+
	mBXNIB2FcAVPzgmjXUjz0XbZUTPjutwvaD9Kk73l77P6iseCbEpS85/Uvp7qhWq8+Sq
	x31HsLmnZ6Muj6VGiX1NkOivfAYEiEOE2cx27Gyg64MocBs7o9R00zjnIy7Mf0+y3/t
	OwaFzGKk++T9s/rszaoaRfJ3LddGQZE9dZw8e1mNBE3aNdolCFLf+z/gDe/WYSYcmmT
	sfkIZu4ATg==
Received: by mx.zohomail.com with SMTPS id 1751644497723754.7368487298465;
	Fri, 4 Jul 2025 08:54:57 -0700 (PDT)
Message-ID: <4cd84b9e2227c9225d977107eb05b9c3813b8846.camel@icenowy.me>
Subject: Re: [PATCH 1/2] clk: sunxi-ng: v3s: Fix de clock definition
From: Icenowy Zheng <uwu@icenowy.me>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>,  Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Icenowy
 Zheng <icenowy@aosc.xyz>, Maxime Ripard <mripard@kernel.org>
Date: Fri, 04 Jul 2025 23:54:50 +0800
In-Reply-To: <20250704154008.3463257-1-paulk@sys-base.io>
References: <20250704154008.3463257-1-paulk@sys-base.io>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2025-07-04=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 17:40 +0200=EF=BC=
=8CPaul Kocialkowski=E5=86=99=E9=81=93=EF=BC=9A
> The de clock is marked with CLK_SET_RATE_PARENT, which is really not
> necessary (as confirmed from experimentation) and significantly
> restricts flexibility for other clocks using the same parent.

With it not setting parent, is arbitary pixel clocks still possible?

>=20
> In addition the source selection (parent) field is marked as using
> 2 bits, when it the documentation reports that it uses 3.
>=20
> Fix both issues in the de clock definition.
>=20
> Fixes: d0f11d14b0bc ("clk: sunxi-ng: add support for V3s CCU")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/clk/sunxi-ng/ccu-sun8i-v3s.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> index 52e4369664c5..df345a620d8d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
> @@ -347,8 +347,7 @@ static
> SUNXI_CCU_GATE(dram_ohci_clk,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0"dram-ohci",=C2=A0=C2=A0=C2=A0=C2=A0"dram",
> =C2=A0
> =C2=A0static const char * const de_parents[] =3D { "pll-video", "pll-
> periph0" };
> =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 2, BIT(31),
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x104, 0, 4, 24, 3, BIT(31), 0);
> =C2=A0
> =C2=A0static const char * const tcon_parents[] =3D { "pll-video", "pll-
> periph0" };
> =C2=A0static SUNXI_CCU_M_WITH_MUX_GATE(tcon_clk, "tcon", tcon_parents,

