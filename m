Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FA51DD0F6;
	Wed, 16 Apr 2025 04:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744779571; cv=none; b=RTgD8EmbimH7mGbpP5/QCiwD+et5Fo6t5njMJ8uubd75BjxiQIGokQrPPYiNCvgIGiset/2D038T8izgsJrSWfkwDcDIOmsz6GDTf0iasj2lcGKKElNGG8Cbtd31RwxuGbChPO8ptDmOSWo8AjsyuMoNRCQzFvVKrSCV35yZ36k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744779571; c=relaxed/simple;
	bh=fFtTR8fQUvOjp3hOLmXlvnaWEHVD5Cm2FoHAZ9ohiIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bf+jzmyL8DDRmC5YfeFpfh7TCJ8HSKf+duizGL/tYXDbzyfn0WJciSk/9nXtKoyu0rUhrn7NA1qJFqBIH3VU+T+HpgP6cixKfqc1oukt7LwGX7qB4GcNuipjV9IivRBv+DgRPzXkeEBq96v63Y57yFR2gmah2ELlF+Uy6C50qHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YUMeOFhw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YUMeOFhw"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:2dc0:c767:bd08:cc70:b57a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AC48446;
	Wed, 16 Apr 2025 06:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744779444;
	bh=fFtTR8fQUvOjp3hOLmXlvnaWEHVD5Cm2FoHAZ9ohiIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YUMeOFhwqd+RmkTnCGSvxQ0qG5oVojLNHD6HHGjdOrimaF3rqiDPQeVnNNfBnXbxk
	 AJQCZA5+8TBiJCOsSfZcGtwUqQgd59/IJDPJCTfc8Qr38yFCt8zn87ijpImRBekoZj
	 Ptj7DZSfqHjrPfqJbb5EQ9nsWruByp04kkWuWH6g=
Date: Wed, 16 Apr 2025 10:29:23 +0530
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
Message-ID: <c6uhzqizih7m2tdcnavm4cvtae2udk3jfnmr6of6h4qy3xmxon@323rr4apj5cl>
References: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
 <ZxYiCv6SpLq9uh08@dragon>
 <qqi2z7wutuy7e6o5fhpzsgfwkyn4quqmdeftl24meld72sudpg@lo3qpk4x7lbv>
 <d6852cf6-e8a0-49b8-a565-2d94eeef67d9@leica-geosystems.com>
 <20250415154724.GG9439@pendragon.ideasonboard.com>
 <20250415155239.GH9439@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gbylwkaggxhfjf2u"
Content-Disposition: inline
In-Reply-To: <20250415155239.GH9439@pendragon.ideasonboard.com>


--gbylwkaggxhfjf2u
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
MIME-Version: 1.0

Hi Laurent,

On Apr 15, 2025 at 18:52:39 +0300, Laurent Pinchart wrote:
> On Tue, Apr 15, 2025 at 06:47:26PM +0300, Laurent Pinchart wrote:
> > Hi Catalin,
> >=20
> > On Tue, Apr 15, 2025 at 03:42:22PM +0000, POPESCU Catalin wrote:
> > > Hi Jai,
> > >=20
> > > This issue was already reported by Stefan. The problem is that I don'=
t=20
> > > have a Debix board to investigate.
> > > The main difference b/w WFI and cpu-pd-wait is that the first doesn't=
=20
> > > call PSCI/TF-A. So, the issue looks to be related to some settings in=
=20
> > > the TF-A.
> >=20
> > Jai, are you using mainline U-Boot and TF-A, or a downstream version of
> > either (or both) ?

I am running mainline U-Boot 2024.01 (with cherry-picked Debix support)=20
and the same TF-A tag as you rel_imx_5.4.70_2.3.6

I can compile and test with U-Boot 2025.01, will report if it fixes the=20
issue on my setup.

>=20
> Actually, same question for Calatin :-)
>=20
> I'm running mainline U-Boot 2025.01 and TF-A rel_imx_5.4.70_2.3.6 (from
> https://github.com/nxp-imx/imx-atf) and don't seem to experience the
> issue:
>=20
> # cat /sys/devices/system/cpu/cpu*/cpuidle/state1/disable
> 0
> 0
> 0
> 0
>=20
> $ ping debix
> PING debix.farm.ideasonboard.com (192.168.2.230) 56(84) bytes of data.
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D1 t=
tl=3D64 time=3D1.03 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D2 t=
tl=3D64 time=3D0.800 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D3 t=
tl=3D64 time=3D0.935 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D4 t=
tl=3D64 time=3D0.902 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D5 t=
tl=3D64 time=3D0.738 ms
> 64 bytes from debix.farm.ideasonboard.com (192.168.2.230): icmp_seq=3D6 t=
tl=3D64 time=3D0.939 ms
>=20
> > > What I don't get is why I don't see this issue neither on our IMX8MP=
=20
> > > specific design nor on the EVK, which uses the same PHY as the Debix =
board.
> > >
> > > On 14/04/2025 14:07, Jai Luthra wrote:
> > > > On Oct 21, 2024 at 17:42:34 +0800, Shawn Guo wrote:
> > > >> On Mon, Oct 07, 2024 at 03:44:24PM +0200, Catalin Popescu wrote:
> > > >>> So far, only WFI is supported on i.MX8mp platform. Add support for
> > > >>> deeper cpuidle state "cpu-pd-wait" that would allow for better po=
wer
> > > >>> usage during runtime. This is a port from NXP downstream kernel.
> > > >>>
> > > > Since the introduction of this patch in mainline, I am facing slugg=
ish
> > > > network performance with my Debix Model-A board with i.MX8mp SoC.
> > > >
> > > > The network latency jumps to >1s after almost every other packet:
> > > >
> > > > PING debix (10.0.42.5) 56(84) bytes of data.
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D1 ttl=3D64 time=3D1008 =
ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D2 ttl=3D64 time=3D0.488=
 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D3 ttl=3D64 time=3D1025 =
ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D4 ttl=3D64 time=3D0.810=
 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D5 ttl=3D64 time=3D590 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D6 ttl=3D64 time=3D0.351=
 ms
> > > > ^C
> > > > --- debix ping statistics ---
> > > > 7 packets transmitted, 6 received, 14.2857% packet loss, time 6126ms
> > > > rtt min/avg/max/mdev =3D 0.351/437.416/1024.755/459.370 ms, pipe 2
> > > > darkapex at freya in ~
> > > >
> > > > If I revert the patch, or disable the deeper cpuidle state through
> > > > sysfs, the issue goes away.
> > > >
> > > > # echo 1 > /sys/devices/system/cpu/cpu$i/cpuidle/state1/disable
> > > >
> > > > PING debix (10.0.42.5) 56(84) bytes of data.
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D1 ttl=3D64 time=3D0.482=
 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D2 ttl=3D64 time=3D2.28 =
ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D3 ttl=3D64 time=3D2.26 =
ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D4 ttl=3D64 time=3D0.848=
 ms
> > > > 64 bytes from debix (10.0.42.5): icmp_seq=3D5 ttl=3D64 time=3D0.406=
 ms
> > > > ^C
> > > > --- debix ping statistics ---
> > > > 5 packets transmitted, 5 received, 0% packet loss, time 4051ms
> > > > rtt min/avg/max/mdev =3D 0.406/1.255/2.280/0.842 ms
> > > >
> > > >>> Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.=
com>
> > > >>
> > > >> Applied, thanks!
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--=20
Thanks,
Jai

--gbylwkaggxhfjf2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf/OSsACgkQQ96R+SSa
cUW6qw/+PvMGbnroClwQ/uzTkOVg4OWzEeTTnOk1jTSzKgOrJ5vQVN72ch29Gtl7
3R58uOGPJTzUGrB5J3EWgf1TxTIwjwN2sOkGo3ymO3rmBDkc4uEjCn8OsIcWIV1y
cZF0a/7bhgiFo+eDp7MD/evFmYF3hoUMiTrqWAOObJd5u+gubA5LgaOp0ub2hn8D
zRbzRo4kEWiu/XdG19ppXOKaC8TNNBtWhSGPzHdvEmIKx+xMkODzoAayFORN6pLd
SJUxoE+2fs+2DD4hFGaADdg86a7/mmFmbcwDr7TPsA9aT4S6vwcCYJjMJuBV5Ho1
aRbfRcKiXkUCbLwlUCtfmLb6FDJvOL2BVcMEXft0t9j/aWgU302UGigAbO7+h+E0
xtNQfH4Ma+YBCMIbA7q6/+GaXesB7y9HOgj0K/btdys6lqdwCNH78NnWDbSrqRLY
/Qvoga6XKpb0YhkZ0Y5FR6N7HXrcWf9E6n3se4FGgUDku8w2BZjctDYPCqHpFYES
dud1zae4vPsW8SiegFqxXb7oKgupYcfZAYR33iv5ucxBdAVELN935RRQ4k5Eo0+K
E8ywas5NEkoSi05glaHU1ZtZLWHgBGXFNNg5I4u5h8y3AOIIkKQxUqPSWbNKttUg
q2vpUNnS68/aiNjI+bHEqU6Wf7Wjy7sqW4BGwvX7DcL2SFNzrfs=
=UuwY
-----END PGP SIGNATURE-----

--gbylwkaggxhfjf2u--
