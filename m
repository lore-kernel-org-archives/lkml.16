Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADEF1B808;
	Wed, 16 Apr 2025 08:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793207; cv=none; b=rTDvf8lEWcLfwjKV4UXnI4GqIsJqJkvH7h2w9s0bRTm/8eMjieqBGYXEZCXJNVplsLnrbivx/H5KGBZWxGkd0Am3iH/xhzsWrDPhqC0dm7JP8NLOv27gU9IsHsdQZY6DVK+lymxoldYiBSVaMB5QI4uDNqvbqEbTPg29/BbF+do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793207; c=relaxed/simple;
	bh=d1Ah8+0BEPldRUb+Pp7KnRwXO5MRL0tz+DSN6dYy/Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6DxhDHVnd9TMc7gZSSHPeoXBYEuMX5ZkAVNbMlEJfSJlFg8dxTu8tfug9rnBAQJ57A/ICXsfaCOcT+Dlx7ikARtHp16tIvv0bilIvAJWHsh/9oa6nhgHSXDMABLT2zS4u7+aLLExn0uuf9/swPUrRPM0UmW5hbr2rdGu1prBBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=W65ZTAMY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="W65ZTAMY"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:2dc0:c767:bd08:cc70:b57a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A49B5965;
	Wed, 16 Apr 2025 10:44:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744793081;
	bh=d1Ah8+0BEPldRUb+Pp7KnRwXO5MRL0tz+DSN6dYy/Lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W65ZTAMYlIV88VR5bOLSumZCQie7HoHeHPtUZJBbEuiR+lA6AT7FoT+XP03f9fLCR
	 veNG9OEUAbKw/cgGtuXMno31IwRKJxaVwve/lfFv/ZbZokrNkFjxI99wlkFE982vjP
	 P0Cu5+DcSljYg+M8HMWr3Ub5UUXQc0C9jPs4TgAI=
Date: Wed, 16 Apr 2025 14:16:38 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: POPESCU Catalin <catalin.popescu@leica-geosystems.com>, 
	Shawn Guo <shawnguo2@yeah.net>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"m.felsch@pengutronix.de" <m.felsch@pengutronix.de>, 
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>, "stefan.klug@ideasonboard.com" <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Message-ID: <43qcktsp4ajqicfvpmcicpym47rbamrscs5oup5625xs6xxlxa@ztu46vm5dkyq>
References: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
 <ZxYiCv6SpLq9uh08@dragon>
 <qqi2z7wutuy7e6o5fhpzsgfwkyn4quqmdeftl24meld72sudpg@lo3qpk4x7lbv>
 <d6852cf6-e8a0-49b8-a565-2d94eeef67d9@leica-geosystems.com>
 <20250415154724.GG9439@pendragon.ideasonboard.com>
 <20250415155239.GH9439@pendragon.ideasonboard.com>
 <c6uhzqizih7m2tdcnavm4cvtae2udk3jfnmr6of6h4qy3xmxon@323rr4apj5cl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ux5l62wqmf3brrbe"
Content-Disposition: inline
In-Reply-To: <c6uhzqizih7m2tdcnavm4cvtae2udk3jfnmr6of6h4qy3xmxon@323rr4apj5cl>


--ux5l62wqmf3brrbe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
MIME-Version: 1.0

On Apr 16, 2025 at 10:29:27 +0530, Jai Luthra wrote:
> Hi Laurent,
>=20
> On Apr 15, 2025 at 18:52:39 +0300, Laurent Pinchart wrote:
> > On Tue, Apr 15, 2025 at 06:47:26PM +0300, Laurent Pinchart wrote:
> > > Hi Catalin,
> > >=20
> > > On Tue, Apr 15, 2025 at 03:42:22PM +0000, POPESCU Catalin wrote:
> > > > Hi Jai,
> > > >=20
> > > > This issue was already reported by Stefan. The problem is that I do=
n't=20
> > > > have a Debix board to investigate.
> > > > The main difference b/w WFI and cpu-pd-wait is that the first doesn=
't=20
> > > > call PSCI/TF-A. So, the issue looks to be related to some settings =
in=20
> > > > the TF-A.
> > >=20
> > > Jai, are you using mainline U-Boot and TF-A, or a downstream version =
of
> > > either (or both) ?
>=20
> I am running mainline U-Boot 2024.01 (with cherry-picked Debix support)=
=20
> and the same TF-A tag as you rel_imx_5.4.70_2.3.6
>=20
> I can compile and test with U-Boot 2025.01, will report if it fixes the=
=20
> issue on my setup.
>=20

FYI, switching to U-Boot 2025.01 does *not* fix the issue on my setup.

I'm happy to test some other TF-A branch on my board if someone can=20
point to it.

> >=20
> > Actually, same question for Calatin :-)
> >=20
> > I'm running mainline U-Boot 2025.01 and TF-A rel_imx_5.4.70_2.3.6 (from
> > https://github.com/nxp-imx/imx-atf) and don't seem to experience the
> > issue:
> >=20
> > # cat /sys/devices/system/cpu/cpu*/cpuidle/state1/disable
> > 0
> > 0
> > 0
> > 0
> >=20
> > $ ping debix
> > PING debix.farm.ideasonboard.com (192.168.2.230) 56(84) bytes of data.
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D1=
 ttl=3D64 time=3D1.03 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D2=
 ttl=3D64 time=3D0.800 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D3=
 ttl=3D64 time=3D0.935 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D4=
 ttl=3D64 time=3D0.902 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D5=
 ttl=3D64 time=3D0.738 ms
> > 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D6=
 ttl=3D64 time=3D0.939 ms
> >=20
> > > > What I don't get is why I don't see this issue neither on our IMX8M=
P=20
> > > > specific design nor on the EVK, which uses the same PHY as the Debi=
x board.
> > > >
> > > > On 14/04/2025 14:07, Jai Luthra wrote:
> > > > > On Oct 21, 2024 at 17:42:34 +0800, Shawn Guo wrote:
> > > > >> On Mon, Oct 07, 2024 at 03:44:24PM +0200, Catalin Popescu wrote:
> > > > >>> So far, only WFI is supported on i.MX8mp platform. Add support =
for
> > > > >>> deeper cpuidle state "cpu-pd-wait" that would allow for better =
power
> > > > >>> usage during runtime. This is a port from NXP downstream kernel.
> > > > >>>
> > > > > Since the introduction of this patch in mainline, I am facing slu=
ggish
> > > > > network performance with my Debix Model-A board with i.MX8mp SoC.
> > > > >
> > > > > The network latency jumps to >1s after almost every other packet:
> > > > >
> > > > > PING debix (10.0.42.5) 56(84) bytes of data.
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D1 ttl=3D64 time=3D100=
8 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D2 ttl=3D64 time=3D0.4=
88 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D3 ttl=3D64 time=3D102=
5 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D4 ttl=3D64 time=3D0.8=
10 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D5 ttl=3D64 time=3D590=
 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D6 ttl=3D64 time=3D0.3=
51 ms
> > > > > ^C
> > > > > --- debix ping statistics ---
> > > > > 7 packets transmitted, 6 received, 14.2857% packet loss, time 612=
6ms
> > > > > rtt min/avg/max/mdev =3D 0.351/437.416/1024.755/459.370 ms, pipe 2
> > > > > darkapex at freya in ~
> > > > >
> > > > > If I revert the patch, or disable the deeper cpuidle state through
> > > > > sysfs, the issue goes away.
> > > > >
> > > > > # echo 1 > /sys/devices/system/cpu/cpu$i/cpuidle/state1/disable
> > > > >
> > > > > PING debix (10.0.42.5) 56(84) bytes of data.
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D1 ttl=3D64 time=3D0.4=
82 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D2 ttl=3D64 time=3D2.2=
8 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D3 ttl=3D64 time=3D2.2=
6 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D4 ttl=3D64 time=3D0.8=
48 ms
> > > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D5 ttl=3D64 time=3D0.4=
06 ms
> > > > > ^C
> > > > > --- debix ping statistics ---
> > > > > 5 packets transmitted, 5 received, 0% packet loss, time 4051ms
> > > > > rtt min/avg/max/mdev =3D 0.406/1.255/2.280/0.842 ms
> > > > >

--=20
Thanks,
Jai

--ux5l62wqmf3brrbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf/bm4ACgkQQ96R+SSa
cUWvjA//exvKcF3kQxHggMPS8Q+9Q2h9lhBKm3zUCibBA9ZTjXfritWGnp2dlN4G
7YTgoM5zzkEMcHU7fYE1JpRsDM9WbwT0SjTKYVHdwSj9XPdot12R3v2Py+AcdrFa
kCR0A+1av4/gd0daTaJHrfbQe+KrXMGxAlvypCrS560Oo06J4EOqE99ijO0/ndnm
vxbURp5VrtgHK2XP1scGnpIxFRvMsNTmoQfCnBdJB8Py8L0qmwFZE8Ggezz5nHkU
qeBadmLVZfNg/fjiwGGXR7d3Y2rfE1P/9CFrfVrFHDlDF0VHP59Tf6YGK/6+MagG
5R1/hGesipalXLFOv29lq8mJCnevy08WlfLBzabGN2p5/3SGXbVchm8MmDQRml7y
+BgSvnPM22xFTL++faKtqzcl1Y1x0SU2NOOXXcj9t2iX6xaKEe6jcYQsdQOoseK4
Pnt9gGXGLghOK5V9ZnNZL59kEfmdTcSu0Zl7olNd7tqsj2Htl+L5ZGWhDaGZrkT1
qcT+VkrMpeNlUs52ga+v5NHpNiKXtzHJch+TpcIrUpI8amPGCtyWGVm/SK2KyUEn
dHIziKOwTkr0SeYSg7Jmb/1H04/Sez2KbuM5XWkU9MXXZPmBoyv25k1ITBry6rY9
IusE/reBAbRvMngYbNlD647QmDCYaNGwpuQrcKqhh0sQX9TvThE=
=e/K7
-----END PGP SIGNATURE-----

--ux5l62wqmf3brrbe--
