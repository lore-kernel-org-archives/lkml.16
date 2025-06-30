Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5FB202976;
	Mon, 30 Jun 2025 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325045; cv=pass; b=hy8b3HSd119TCkEvnXHezrQreSBWLQ9zYT7QQEd4poX3DBTB65w0wPOQEj8irQLQ3q6QaHmkdEx13lJEXik6CpRiBlTxQyLnOQGyrawNBLeraxTef1RwevRwwbmafj1IByr+fc9m7elYKM/IC7lwPg9OumcGNiInOP0z+Tjvp/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325045; c=relaxed/simple;
	bh=e+eRDizTChxsNQSlu63KUtprX9rdJ9Csf/xbJCFc9FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWXLG74nt1kJaGIrqaXnLs6QPt0PBhXw+/PNLObuxjViDgR6JFg3DpxyDVato64f4pxbnymAr8gAPSIsAiJlPKrOXhmE3cH3XzHMvP1u6XNo6VKP9BxrcghJkktOsxl2NuVI3mO5ae9//tM1/9CH8krHhchx19yA2KZqA9h1zhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=bRyJuM7I; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="bRyJuM7I"
ARC-Seal: i=1; a=rsa-sha256; t=1751325027; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kNUtf021KMtv7ipHIehHdCrJkE1VU45x1iToozGgvTRjrieFWc96z/FUK/djFDZVoZpCXu5fFtC9SEoIq/fbPnFRzlYDbRZ71hJSK8glw5BBggkbbRKS4Ri72NTdaJjOySUDdW7i+7yGMvAQHUvfbBR766/BfI2WLAlKc8pWFSg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751325027; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NMoRzxFpPcptg7A9l+92hIng0UBiDJ8hvoxFQ6v0Zsk=; 
	b=I+gt4qsOCCsvFVeFA0HL9zNhomzKmIbSgkJTYGi6hOsi1gnEbhWC54cuiWQxphYzftkhmUg+fybCpb7qOjQfM8qytP0vxwk95IbJBxPIsdknVzS7Y6vLIp0vFqijkkI83nNChfTGZdOvFE8JBKJlP7pf1+7Ms440/gRaXruhKXA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751325027;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=NMoRzxFpPcptg7A9l+92hIng0UBiDJ8hvoxFQ6v0Zsk=;
	b=bRyJuM7InKHLhoFTGk9AWIOnRw25H4iGk+0AZvpubUikxOdRiMFwO9u8KIQvCxI6
	9gDtmjVv8sZ6CRBxoKtXOrWBARmlLxYlaeHL4c//D6V1hIeICesda2nmqlPEEsY+zYg
	onV/fIBT7xiC3nsI1R9ckqQ53MolB89tzMwiEO9c=
Received: by mx.zohomail.com with SMTPS id 1751325024081616.6563756773481;
	Mon, 30 Jun 2025 16:10:24 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 8AD3B1809B6; Tue, 01 Jul 2025 01:10:19 +0200 (CEST)
Date: Tue, 1 Jul 2025 01:10:19 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, kernel@collabora.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK
 4D
Message-ID: <5acizoywvjolaffojiawqlzixiclrqzohuhq55lbsjm6yhhlwi@w2amqugl3ee2>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
 <20250630-rock4d-reg-usb-wifi-v1-1-1057f412d98c@collabora.com>
 <DB02KKR1VK9H.1Q1Y5A98FKGLK@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d22k3ikyl4mwgwcs"
Content-Disposition: inline
In-Reply-To: <DB02KKR1VK9H.1Q1Y5A98FKGLK@cknow.org>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.3/251.316.55
X-ZohoMailClient: External


--d22k3ikyl4mwgwcs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK
 4D
MIME-Version: 1.0

Hi,

On Mon, Jun 30, 2025 at 08:12:27PM +0200, Diederik de Haas wrote:
> Hi Nicolas,
>=20
> On Mon Jun 30, 2025 at 5:36 PM CEST, Nicolas Frattaroli wrote:
> > The ROCK 4D's actual DC input is 5V, and the schematic names it as being
> > 5V as well.
> >
> > Rename the regulator, and change the voltage it claims to be at.
>=20
> Shouldn't it have a fixes tag then? Providing 12V where 5V is expected
> sounds problematic ;-)

This is basically "just" documentation, as the DT just describes
a fixed regulator (i.e. nothing software controllable). This just
changes a number in sysfs :)

Note, that the 5V DCIN is a USB-C port, which does not do any PD
negotiation, but has the 5K1 resistors on the CC lines to "request"
5V. If for whatever reason a higher voltage is applied (which does
not happen as long as the power is provided by anything remotely
following the USB specifications) there also is an over-voltage
protection chip. So it's not problematic :)

OTOH adding a Fixes tag does not hurt ;)

-- Sebastian

> > Furthermore, fix vcc_1v1_nldo_s3's vin-supply as coming from
> > vcc_5v0_sys, and not the DCIN, as per the schematic. This makes no
> > functional change; both regulators are always on, and one feeds into the
> > other.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm=
64/boot/dts/rockchip/rk3576-rock-4d.dts
> > index 6756403111e704cad42f6674d5ab55eb0306f1e3..352e3df165688219bfedc19=
734d9eb32c547ec44 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> > @@ -57,13 +57,13 @@ user-led {
> >  		};
> >  	};
> > =20
> > -	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
> > +	vcc_5v0_dcin: regulator-vcc-5v0-dcin {
> >  		compatible =3D "regulator-fixed";
> >  		regulator-always-on;
> >  		regulator-boot-on;
> > -		regulator-min-microvolt =3D <12000000>;
> > -		regulator-max-microvolt =3D <12000000>;
> > -		regulator-name =3D "vcc_12v0_dcin";
> > +		regulator-min-microvolt =3D <5000000>;
> > +		regulator-max-microvolt =3D <5000000>;
> > +		regulator-name =3D "vcc_5v0_dcin";
> >  	};
>=20
> With the name change, this block needs to be moved down.
>=20
> Cheers,
>   Diederik
> > =20
> >  	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> > @@ -166,7 +166,7 @@ vcc_5v0_device: regulator-vcc-5v0-device {
> >  		regulator-min-microvolt =3D <5000000>;
> >  		regulator-max-microvolt =3D <5000000>;
> >  		regulator-name =3D "vcc_5v0_device";
> > -		vin-supply =3D <&vcc_12v0_dcin>;
> > +		vin-supply =3D <&vcc_5v0_sys>;
> >  	};
> > =20
> >  	vcc_5v0_host: regulator-vcc-5v0-host {
> > @@ -190,7 +190,7 @@ vcc_5v0_sys: regulator-vcc-5v0-sys {
> >  		regulator-min-microvolt =3D <5000000>;
> >  		regulator-max-microvolt =3D <5000000>;
> >  		regulator-name =3D "vcc_5v0_sys";
> > -		vin-supply =3D <&vcc_12v0_dcin>;
> > +		vin-supply =3D <&vcc_5v0_dcin>;
> >  	};
> >  };
> > =20
>=20



--d22k3ikyl4mwgwcs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmhjGVgACgkQ2O7X88g7
+pq8fhAAkPFlVvN2lEwUG4bNLm+GgZTuLazptAsw4tjhJ84qzDA8jiPT//VFbSYo
Rkx2KZD9GEeBnjW8bVDqNhEKrcHR5AoBBmciXgNeCvFPon/YR9zC5aYnGmb3MgYL
Qwn7dbpwtKwSdTPC4p0xOH706rJn7gORx6VhIy1jls8lX0VyU+RsKs+9axztrlIO
YAFGNwtTJgUSaBzDKhbGtswmi3pNZVef+4RgM6nJhaf7x1LClFnCvyL3q0Ma0uKn
gI5PWZ5X+qKh5wxAbVNTB4U597AzukdK94OAZS7/vSGpMhXPcTGPB+VlXvE5vPbr
c3mquGrcPSW47wpcI+8v+OmY0u/EuvCDqfWb2XovQst01FPL4FXPZzSjkFsHWoJ0
aV5pb9JBHdt+HIVv4B8/jwabVtFIi+7x4Ma19I72tkFcOv7+Ue6u8ox41Fs0oGDg
CTo1boGHCv8hsF0Z74hQAiZnGXHUrdjsdIzEY/02o4+b3+h0IeLYdQbzc9S1aEV5
UA2RpUaQweHy7JZ0odYY2jj3JbGa8mwPien/JZN78K+LW3kuJfHXr7R6aCrdHyzt
TZCR9uxodGvF8UO4vSfjA/URXoAp1DXS5Sb6ltJYCQZ3ZzAv6YvTHJaa4rrNqubh
1Vrnf014Tm6oa7arlUHzgfZ+mDEPj3FFutGz/JLmcn/GC3AppsA=
=c3Lc
-----END PGP SIGNATURE-----

--d22k3ikyl4mwgwcs--
