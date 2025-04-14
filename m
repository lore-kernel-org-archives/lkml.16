Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A1E29CB40;
	Mon, 14 Apr 2025 12:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632462; cv=none; b=QV/iVxihO70WGXc4DfjomCTtmqBF1/WuR5nyZDWNHFO0uqAuzWMY3OYqxKEmme5PDx29WzTxkuRRRK0z2gMvfS3oa+iHxRKCqZY3lBcZ29yARXOWdX+UrZCsHo9RWaM3/J5pzQkNe9RJkk4FksVMebuouhawUs/qg/wQDigTCkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632462; c=relaxed/simple;
	bh=i7fjaaffP15XqkniyfX75okb0C6c8PrElL3LeRzWROM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oruzzaswpZezPgmNGLvb/wc4+v+gStkH+Ztz1wm8V8HDSycmLV2JI3r2E5gDOK2VnWoc6MWnRrpK52kPnuDvYvSgB2hfHI0gY/FwPLAtb55SvjZ25CdwxNVbbw1qRXyNbKVPX9wBAdJQsdiww/7rh5m6FbzQYq+IOXPrKtq8mZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eBYdtTrT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eBYdtTrT"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:2dc0:c767:bd08:cc70:b57a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98DEF4CE;
	Mon, 14 Apr 2025 14:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744632337;
	bh=i7fjaaffP15XqkniyfX75okb0C6c8PrElL3LeRzWROM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eBYdtTrTSjty2OFqvMHEBm3LzQykQ/BAtHcpCLiKmRTDE75RUuAz/mbzgnjYthV9l
	 21W0gW7ZbNgPsSn0uc0jzJov4/C9tPw8ZMLzsWz2iXQrNnevvKgDdHbf1jn1Y6kebI
	 LR97sDij1fnLgnKdUfu4TyMbyUiV0YGHjPsg1Ga8=
Date: Mon, 14 Apr 2025 17:37:31 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
	Shawn Guo <shawnguo2@yeah.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, m.felsch@pengutronix.de, 
	bsp-development.geo@leica-geosystems.com, stefan.klug@ideasonboard.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Message-ID: <qqi2z7wutuy7e6o5fhpzsgfwkyn4quqmdeftl24meld72sudpg@lo3qpk4x7lbv>
References: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
 <ZxYiCv6SpLq9uh08@dragon>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b2c4etq6n6kvcnzt"
Content-Disposition: inline
In-Reply-To: <ZxYiCv6SpLq9uh08@dragon>


--b2c4etq6n6kvcnzt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
MIME-Version: 1.0

Hi Catalin, Shawn,

On Oct 21, 2024 at 17:42:34 +0800, Shawn Guo wrote:
> On Mon, Oct 07, 2024 at 03:44:24PM +0200, Catalin Popescu wrote:
> > So far, only WFI is supported on i.MX8mp platform. Add support for
> > deeper cpuidle state "cpu-pd-wait" that would allow for better power
> > usage during runtime. This is a port from NXP downstream kernel.
> >=20

Since the introduction of this patch in mainline, I am facing sluggish=20
network performance with my Debix Model-A board with i.MX8mp SoC.

The network latency jumps to >1s after almost every other packet:

PING debix (10.0.42.5) 56(84) bytes of data.
64 bytes from debix (10.0.42.5): icmp_seq=3D1 ttl=3D64 time=3D1008 ms
64 bytes from debix (10.0.42.5): icmp_seq=3D2 ttl=3D64 time=3D0.488 ms
64 bytes from debix (10.0.42.5): icmp_seq=3D3 ttl=3D64 time=3D1025 ms
64 bytes from debix (10.0.42.5): icmp_seq=3D4 ttl=3D64 time=3D0.810 ms
64 bytes from debix (10.0.42.5): icmp_seq=3D5 ttl=3D64 time=3D590 ms
64 bytes from debix (10.0.42.5): icmp_seq=3D6 ttl=3D64 time=3D0.351 ms
^C
--- debix ping statistics ---
7 packets transmitted, 6 received, 14.2857% packet loss, time 6126ms
rtt min/avg/max/mdev =3D 0.351/437.416/1024.755/459.370 ms, pipe 2
darkapex at freya in ~

If I revert the patch, or disable the deeper cpuidle state through=20
sysfs, the issue goes away.

# echo 1 > /sys/devices/system/cpu/cpu$i/cpuidle/state1/disable

PING debix (10.0.42.5) 56(84) bytes of data.
64 bytes from debix (10.0.42.5): icmp_seq=3D1 ttl=3D64 time=3D0.482 ms
64 bytes from debix (10.0.42.5): icmp_seq=3D2 ttl=3D64 time=3D2.28 ms
64 bytes from debix (10.0.42.5): icmp_seq=3D3 ttl=3D64 time=3D2.26 ms
64 bytes from debix (10.0.42.5): icmp_seq=3D4 ttl=3D64 time=3D0.848 ms
64 bytes from debix (10.0.42.5): icmp_seq=3D5 ttl=3D64 time=3D0.406 ms
^C
--- debix ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4051ms
rtt min/avg/max/mdev =3D 0.406/1.255/2.280/0.842 ms

> > Signed-off-by: Catalin Popescu=20
> > <catalin.popescu@leica-geosystems.com>
>=20
> Applied, thanks!
>=20
>=20

Thanks,
Jai

--b2c4etq6n6kvcnzt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf8+oMACgkQQ96R+SSa
cUUNPg//anR3yxnNmlggeRsPCsaXgpxgH5UJ7tzVGaft9KVR/F/gw/8q2uj9AfTu
uOfUd2n31EPxw+JLA3YDL7SNENesWvNnPAmKYIhajou7fgsm1q+gejvni8XntT3A
uxI1ewvh8irH9fDFNNLrxkVLKpTowPUXEwHxCMC/SdxugUxUk0yOJdX+N9Rm5xw2
VeRxmnj6v0Tv9x0ZRZPKNyTVDncRhFia6r4UJWTWCbGZotzKqNK8NbTmlsZ76pw6
RPNwoRNs6GSZnY0kOLv16PN5PkVKSB8/NwUcPcsqAJXNqx28Bu9jzHjvdLPZ5XDo
WWrcC9eK30I8H/Fb6X1r9qZ6B99UiMgAu0rVI8WdOkkHN0MZMGvICq4FSMgOyFhc
+W5Hf6b61EnPAVRRYb3LxrQL41r3D5c3N7ZMyGCri2DeOft9X2L1KeE0W7txBSnX
s2iofxxOBc/p0qP0wsm+Q60Sm7VH9NbA1POhT1/UL0m5xl7Y1wlHXovGrUNL9q71
8WlGI1+H1vAhZxelmZofWV8AgmZKrC3tHReGdQqk2q2lhOyfS1zNYWYPQwcR8agm
t0MdrTPDHi4LtpYQSBr6BvWhHf8Wsd+9z9jTWeP2bB4i9sVncybB2lnYrE1g0l1V
VCfKJ5GncNuftXQULhFsY9qu9iaVIMXVbHDSlyhyn7pyDFmY+uo=
=mTz8
-----END PGP SIGNATURE-----

--b2c4etq6n6kvcnzt--
