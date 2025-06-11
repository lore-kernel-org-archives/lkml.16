Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655C7231A41;
	Wed, 11 Jun 2025 07:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627124; cv=none; b=LA+FUy3Urm26SOUUe/iDu/yV5qmu3rKBi6speqsAXnzUp22NFK4QOUSEZZn0hF3c1f7vDTsTjymL/itrIZ+VL2AsWROjYaXGnw+dvX9dmPJx1jkOiU/h1R1dBuL0Xt1zXjn0TVxEsIWz1QhovS7UlanRRKdf448UB/wpws4K+70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627124; c=relaxed/simple;
	bh=mcs2Gho/gf2h14rpJHCrwPe28KQkUL6hXKPCa0ALDxQ=;
	h=Content-Type:Date:Message-Id:From:To:Subject:References:
	 In-Reply-To; b=EexQN0j/3lBogq1ZJpub7FpSsg0OeLyRyMP6X5O8FTzxZicDd5X6I5oW8BqH4Gx50mrVKOnWcXqY8YzJVzFEuf5t64XLjsZ4pyH/Ph44rntzpztfwFZyHTt1a21RzQz91UcgjtzGrHYJX4+zRSom45AVG3U3o/GnhxV2QI/VxUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBWyQW8h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBWyQW8h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604FBC4CEEE;
	Wed, 11 Jun 2025 07:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749627123;
	bh=mcs2Gho/gf2h14rpJHCrwPe28KQkUL6hXKPCa0ALDxQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=nBWyQW8h29cFfSv/z/4jGHtlbhBwY9wMDtAQQtUGNi8WzQkGAP7OXXDN99JSIBBnS
	 D3j7k9mwG74jeuALaoYhwle01X9Y0595EQ4l7iXIZxzxtGCVWWfaHVf7//XjjQqi4M
	 5bPKamPPjt/gN2CFQbaC9v92pBpKPDwJ//qSM5HGFof9te2Qfi7P6iu+U4wUxxHsAD
	 rmZVYIxvDQPnajlf2aRosJlIjO0/qFL9e8NRqdDoRy1u4WFIhwNuhK6ZavFSlHYXAO
	 +JQ85kA0lCbLAbEFCmBy9OfmgOYQgqTbLUPSxS+Rjyj72ZwjJC3vjFtVksFgdOcFs1
	 vN2iBFsTf9wsQ==
Content-Type: multipart/signed;
 boundary=8a3e323f28b4897e5ad249081ea4429b39cc85565426c3d93fcfc253e353;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 11 Jun 2025 09:31:59 +0200
Message-Id: <DAJJ1UHCLV0M.2GGHO5PDRWMYH@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: <Manikandan.M@microchip.com>, <tudor.ambarus@linaro.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 3/3] ARM: dts: microchip: sama5d27_wlsom1: Add
 nvmem-layout in QSPI for EUI48 MAC Address
X-Mailer: aerc 0.16.0
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-4-manikandan.m@microchip.com>
 <a15fd377-1828-4cb5-8c7b-7d26ea2a7733@linaro.org>
 <759e4a1e-6af4-4bf9-9a95-01a7f6faaf46@microchip.com>
In-Reply-To: <759e4a1e-6af4-4bf9-9a95-01a7f6faaf46@microchip.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

--8a3e323f28b4897e5ad249081ea4429b39cc85565426c3d93fcfc253e353
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Jun 9, 2025 at 11:27 AM CEST, Manikandan.M wrote:
> >> Add nvmem-layout in QSPI to read the EUI48 Mac address by the
> >> net drivers using the nvmem property.The offset is set to 0x0
> >> since the factory programmed address is available in the
> >> resource managed space and the size determine if the requested
> >> address is of EUI48 (0x6) or EUI-64 (0x8) type.
> >> This is useful for cases where U-Boot is skipped and the Ethernet
> >> MAC address is needed to be configured by the kernel
> >>
> >> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> >> ---
> >>   .../boot/dts/microchip/at91-sama5d27_wlsom1.dtsi    | 13 +++++++++++=
++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/a=
rch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> >> index b34c5072425a..be06df1b7d66 100644
> >> --- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> >> +++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
> >> @@ -210,6 +210,9 @@ &macb0 {
> >>        #size-cells =3D <0>;
> >>        phy-mode =3D "rmii";
> >>
> >> +     nvmem-cells =3D <&mac_address_eui48>;
> >> +     nvmem-cell-names =3D "mac-address";
> >> +
> >>        ethernet-phy@0 {
> >>                reg =3D <0x0>;
> >>                interrupt-parent =3D <&pioA>;
> >> @@ -238,6 +241,16 @@ qspi1_flash: flash@0 {
> >>                m25p,fast-read;
> >>                status =3D "disabled";
> >>
> >> +             nvmem-layout {

IMHO this should be "sfdp {".

> >> +                     compatible =3D "fixed-layout";

Please read my feedback on the first version again..

For the DT maintainers. The SFDP is a small table based content that
provide basic information about the flash. There are standard tables
which are specified by the JEDEC standard and there are vendor
tables, most of the time without proper documentation (or none at
all).

Somehow we need to specify at what table we want to look at. I'd
like to see a binding which can potentially expose anything inside
the SFDP.

So I've suggested to use "compatible =3D jedec,sfdp-vendor-table-NNNN"
where NNNN is the table parameter id. Additionally, the standard ids
could have names like "jedec,sfdp-bfpt" (basic flash parameter table).

So in your case that would be:

flash {
	sfdp {
		mac_address: table-1 {
			compatible =3D "jedec,sfdp-idNNNN";
		};
	};
};

I don't know what NNNN is. Could you please provide a dump of the
sfdp of your flash.

-michael

> >> +                     #address-cells =3D <1>;
> >> +                     #size-cells =3D <1>;
> >> +
> >> +                     mac_address_eui48: mac-address@0 {
> >> +                             reg =3D <0x0 0x6>;
> >> +                     };
> >=20
> > How would this work if in the future the mchp vendor table adds some
> > other info that needs to be referenced as nvmem? How do you distinguish
> > the info from the table?
> > Would it be possible to have some kind of address and size to reference
> > the SFDP?
>
> I was previously advised not to hardcode the offset in the Device Tree=20
> [1]. In the current implementation (patch 1/3), the read callback for=20
> the MCHP vendor table distinguishes between EUI-48 and EUI-64 MAC=20
> addresses based on the nvmem size, which corresponds to the size of the=
=20
> respective MAC address.
>
> [1] --> https://lore.kernel.org/lkml/D889HZF97H8U.1UUX54BAVLAC3@kernel.or=
g/
>
> >=20
> >> +             };
> >> +
> >>                partitions {
> >>                        compatible =3D "fixed-partitions";
> >>                        #address-cells =3D <1>;
> >=20


--8a3e323f28b4897e5ad249081ea4429b39cc85565426c3d93fcfc253e353
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaEkw7xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iI/AF7BJfA+KSiLsV4fBajupPz4g9JyqM/HMiU
1Rmr20pIB/NGVrLU83A6cm2FAmW2fG05AYDdp52UY6901PGPiSuBwRsDzWnehg6M
2zDhEhT7U7QBOD0n2PXk/uiGr5PakohwicQ=
=N4uq
-----END PGP SIGNATURE-----

--8a3e323f28b4897e5ad249081ea4429b39cc85565426c3d93fcfc253e353--
