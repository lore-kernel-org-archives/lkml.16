Received: from mail.cab.de (mail.cab.de [46.232.229.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE031E5B69
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.232.229.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580133; cv=none; b=mXY6vymG1xKiclwHcrqTNCnQvTRRKgZ976OAV4j0mvNlBFmlP9JQy2EII3SMkxfAFLRuF0G37KhcC/Xyd/xH0vQCvw5WkFdUvzy4r8rU4ffduGHjFkigSRgz7gouVFg19vrj/fIDhclHpPpQ25xqobYos+IGHPXFTKy6f0ICduE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580133; c=relaxed/simple;
	bh=Ef0IjZb9UlGesfQ9u0/Pc9ovxRajvIw0yuhBB1YhWqs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BBVw2/j4N0x3lr8ZV3AEjphE5GOGaeSO+SE8xkTICKG0xoL1TSws4C2hjVLccLccxMHA37nLhC1TXTNBtEU9dloH4zXO6jQ3uAnkYdvX4e+OMHu6ovyt/Tn1Ofafyopt5VltMO8xJsgH+HRQLc0d668JaRzAQnjdQiATWus2msk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de; spf=pass smtp.mailfrom=cab.de; dkim=pass (1024-bit key) header.d=cab.de header.i=@cab.de header.b=DH5QoDoE; arc=none smtp.client-ip=46.232.229.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cab.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cab.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cab.de header.i=@cab.de header.b="DH5QoDoE"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.cab.de 4ZSH755YHgzMvb0G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cab.de; s=default;
	t=1743580129; bh=yDEunReZkm141gYo2d7V3O4nrAOY0QUk8P2w9nBbIDo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DH5QoDoErq4Tle7WuY9C4gfycjb3jmnAlqt1XSrvSZthsM349UNFkm1iE6kY+Tdq3
	 N4npxrmcSnrdk/oX5y8otFgL9BUwLhGWWypHIQ5DI6eRVizF2Zfe22KSmDF+3oXfxM
	 l46Mo0m3JvFqOU6aJPaHVllul9IfcY67cIQ6Fl0o=
X-cab-MailScanner-Watermark: 1744184926.52004@SX5YGNN9x05HxXmvIV4c1w
X-cab-MailScanner-From: m.heidelberg@cab.de
X-cab-MailScanner: Found to be clean
X-cab-MailScanner-ID: 4ZSH6z1Y7BzMvb0B
X-cab-MailScanner-Information: Please contact it@cab.de for more information
Received: from Adranos.cab.de ([10.10.1.54] [10.10.1.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(no client certificate requested)
	by hephaistos.cab.de (MailScanner Milter) with SMTP id 4ZSH6z1Y7BzMvb0B;
	Wed,  2 Apr 2025 09:48:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.cab.de 4ZSH6z1Y7BzMvb0B
Received: from Adranos.cab.de (10.10.1.54) by Adranos.cab.de (10.10.1.54) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 2 Apr
 2025 09:48:52 +0200
Received: from Adranos.cab.de ([fe80::9298:8fc8:395c:3859]) by Adranos.cab.de
 ([fe80::9298:8fc8:395c:3859%7]) with mapi id 15.02.1748.010; Wed, 2 Apr 2025
 09:48:52 +0200
From: Markus Heidelberg <M.Heidelberg@cab.de>
To: Christian Eggers <ceggers@arri.de>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Jiri
 Prchal" <jiri.prchal@aksignal.cz>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 0/2] eeprom: at25: support Cypress FRAMs without
 device ID
Thread-Topic: [RFC PATCH 0/2] eeprom: at25: support Cypress FRAMs without
 device ID
Thread-Index: AQHbowqgaLSFUZ+nPkiC1HgANtwlcrOOsPoAgAEuuAA=
Date: Wed, 2 Apr 2025 07:48:52 +0000
Message-ID: <Z-zr2oj-hD28ccy3@KAN23-025>
References: <20250401133148.38330-1-m.heidelberg@cab.de>
 <2759958.vuYhMxLoTh@n9w6sw14>
In-Reply-To: <2759958.vuYhMxLoTh@n9w6sw14>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FF1B199B4640924AB68B1A8A42D1FC1D@cab.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Christian,

On Tue, Apr 01, 2025 at 03:45:14PM +0200, Christian Eggers wrote:
>=20
> I use the following FRAM device: Fujitsu mb85rs1mt.=20
>=20
> This FRAM is also not able to report its size (at least I didn't
> try).

According to the datasheet there is a device ID, but with a different
response compared to Cypress FRAMs. It wouldn't work without modifying
the current implementation.

> I can use this FRAM with the following (Eeeprom) settings:
>=20
> 		compatible =3D "fujitsu,mb85rs1mt", "atmel,at25";
> 		reg =3D <0>;
> 		spi-max-frequency =3D <30000000>;
> 		/* mode0, uncomment for mode3 */
> 		/*spi-cpha;
> 		spi-cpol;*/
>=20
> 		/* from the datasheet it seems that there is no page size for FRAM */
> 		pagesize =3D <131072>;
> 		size =3D <131072>;
> 		address-width =3D <24>;
>=20
> Is this what you are looking for? Of course, the "type" attribute=20
> reports "EEPROM" with this configuration, but my application don't care
> about this.

This is what I started with, but I thought there has to be a reason that
EEPROM and FRAM are distinguished in the driver (at25 and nvmem core)
and I wanted to do it right. If not relevant now, maybe in the future.

Markus=

