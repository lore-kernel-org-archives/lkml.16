Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD8366;
	Fri,  9 May 2025 17:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746813069; cv=pass; b=QoxU7J5xzyhT8k7Qsq84nvCkITnbwdxyxYWyI1a9Bufb1HspkbXC4dIwAivX45NkvStMaWJbv5ZbgwogzmJqiQ4BAhvVh22dVnaUKf1cj2ZJizUrtio5fzEG110tC7QfYpAscWI1Ey0kV8b5EqYM3cJYxCRMbIV8+9CyNxk5CYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746813069; c=relaxed/simple;
	bh=GYvkbU1dA55AIWI9soFaV13cwkF37VsgvVwRRYBrAOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1sAYlC1M+t8bsdCoemT8qAYyptkdb/G23/m6n5Ng9/4h217owGvRk7Um7MjeEao1D6z7/469n+b/3CExvO7F1MLyxdiicCmaZLEtxuZ+UhbFa8feW1iKwEk18ovv8FwY7jvfJnrx6roWYaJyOWKkJ7gUCnHZtBvxlWzYh0cx1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=j9GzPjuQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="j9GzPjuQ"
ARC-Seal: i=1; a=rsa-sha256; t=1746813039; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WD1GJHv265qHrwYpctoxZaOYaa/ZsV4LUQwylYV9H7R2rdemwnvYEMBIIzSWomua3qoAZ0W+lFIQC+++32an101/qGZftK0Vc5ViftIxtBXj6Y6MoCMS9R7MhauhsJ3Knywg3LH3bN8VThrgj0wWdl42/IY1abRizqkHSOPSFQ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746813039; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Xb3FAM9DukSaaQnWJ0ny0WfqjW4tD0jQW7N74zDuk9s=; 
	b=g6V5tiV9ZrpcTJm4fi8a7nWvkD7mfwAIZG+FGk/R4g6SbnlFfNWhYYmt0zF8F2Yj/LNKE8HblrZWjxIGEGKIaWZTZRUlzH88+wQu0gGzIGC60Hy/KbSQrHQ1FuP7LPJlzMkubDW8z+oUR7f2yIgESuJ9WoMgDaeTxlNknpiSL3I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746813039;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Xb3FAM9DukSaaQnWJ0ny0WfqjW4tD0jQW7N74zDuk9s=;
	b=j9GzPjuQKtxd5MFrYPJU81cGLRQ8Sdf3UrUJ2q+/gwX+qT1c108DGuwFcoopLIgI
	mUtAnqZkVR06BZbaizKjx1qlebwFuWhXjrKA4mVmaRd9Z/5lUstqmWD1MlwQH1n20ZX
	4xhoS9nJiuyxG8utUgc5uQzkXDwDK0BzTt0cqs/g=
Received: by mx.zohomail.com with SMTPS id 1746813037295349.70202147402665;
	Fri, 9 May 2025 10:50:37 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 395A518074B; Fri, 09 May 2025 19:50:33 +0200 (CEST)
Date: Fri, 9 May 2025 19:50:33 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	FUKAUMI Naoki <naoki@radxa.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: add ROCK 5B+ support
Message-ID: <peq364nrf7x2zy6ou3tkxpilvs34dbcf3x2oxscf6z5aorq5eb@twxasrypjpl7>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
 <174679985287.3369051.14227124355079340433.robh@kernel.org>
 <1893373.atdPhlSkOF@diego>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6qqwt57436zwj5dk"
Content-Disposition: inline
In-Reply-To: <1893373.atdPhlSkOF@diego>
X-Zoho-Virus-Status: 1
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/246.795.57
X-ZohoMailClient: External


--6qqwt57436zwj5dk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/5] arm64: dts: rockchip: add ROCK 5B+ support
MIME-Version: 1.0

Hi,

On Fri, May 09, 2025 at 05:12:22PM +0200, Heiko St=FCbner wrote:
> Am Freitag, 9. Mai 2025, 16:17:02 Mitteleurop=E4ische Sommerzeit schrieb =
Rob Herring (Arm):
> >=20
> > On Thu, 08 May 2025 19:48:49 +0200, Sebastian Reichel wrote:
> > > This series adds support for the ROCK 5B+, which (as the name suggest=
s)
> > > is an improved version of the ROCK 5B. It also adds initial USB-C
> > > support for both the ROCK 5B and the 5B+.
> > >=20
> > > Changes in PATCHv2:
> > >  - Link to v1: https://lore.kernel.org/r/20250324-rock5bp-for-upstrea=
m-v1-0-6217edf15b19@kernel.org
> > >  - Replaced DT binding patch with the version from NAOKI
> > >  - Dropped unused pinctrl for vcc5v0_host_en from the shared DT
> > >  - Moved USB-C SBU DC pins to board specific files, since they differ
> > >    between Rock 5B and Rock 5B+
> > >  - Added pinmux for SBU DC pins
> > >  - Rebased to latest version of Heiko's for-next branch
> > >  - Disable USB-C on Rock 5B for now
> > >=20
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > > FUKAUMI Naoki (1):
> > >       dt-bindings: arm: rockchip: Add Radxa ROCK 5B+
> > >=20
> > > Sebastian Reichel (4):
> > >       arm64: dts: rockchip: move rock 5b to include file
> > >       arm64: dts: rockchip: move rock 5b to include file
> > >       arm64: dts: rockchip: add Rock 5B+
> > >       arm64: dts: rockchip: add USB-C support for ROCK 5B+
> > >=20
> > >  .../devicetree/bindings/arm/rockchip.yaml          |    5 +
> > >  arch/arm64/boot/dts/rockchip/Makefile              |    1 +
> > >  .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  129 +++
> > >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  970 +---------=
--------
> > >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 1082 ++++++++++=
++++++++++
> > >  5 files changed, 1247 insertions(+), 940 deletions(-)
> > > ---
> > > base-commit: b7caeb9545db25649eda36ce593b70cc2aa804ab
> > > change-id: 20250324-rock5bp-for-upstream-fd85b00b593b
> > >=20
> > > Best regards,
> > > --
> > > Sebastian Reichel <sre@kernel.org>
> > >=20
> > >=20
> > >=20
> >=20
> >=20
> > My bot found new DTB warnings on the .dts files added or changed in this
> > series.
> >=20
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to rep=
ly
> > unless the platform maintainer has comments.
> >=20
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> >=20
> >   pip3 install dtschema --upgrade
> >=20
> >=20
> > This patch series was applied (using b4) to base:
> >  Base: base-commit b7caeb9545db25649eda36ce593b70cc2aa804ab not known, =
ignoring
> >  Base: attempting to guess base-commit...
> >  Base: tags/v6.15-rc1-40-g425af91c5802 (best guess, 2/3 blobs matched)
> >
> > If this is not the correct base, please add 'base-commit' tag
> > (or use b4 which does this automatically)

Looks like I missed that the rebase to your latest for-next
branch kept one patch, which you dropped ("Revert "dt-bindings: mfd:
syscon: Add rk3528 QoS register compatible") resulting in the
unknown base commit being specified by b4. FWIW the real base commit
would have been e8adbfc19627.

> > New warnings running 'make CHECK_DTBS=3Dy for arch/arm64/boot/dts/rockc=
hip/' for 20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org:
> >=20
> > arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /edp@fdec0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-edp']
> > arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: /edp@fded0000: fa=
iled to match any schema with compatible: ['rockchip,rk3588-edp']
>=20
> This should be already fixed by the rk3588-edp addition in linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Df855146263b14abadd8d5bd0e280e54fbab3bd18

In any case it's unrelated to this series, since neither the ROCK
5B, nor the 5B+ use or reference the edp node at all.

Makes me wonder, if it would also have triggered with the correct
base (since the eDP DT binding is not in that branch).

-- Sebastian

--6qqwt57436zwj5dk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmgeQF0ACgkQ2O7X88g7
+poitw/+MHq79V24l1hjQHIuzvUXGjLZaEZfilPxIIKKwqfRXgozYO/1qo1Qr08y
rgipI7lJEkwU+6LyXCkV85gip4HtjABRIvJT5U8QOmxHdCWaj/L/QoB3fehF+pFM
OZ4bJf3uBaLhY7Icf5wEPRGLfiGvbCkiAxRGtAyyqF5PSMsQF1wpmsYE8cuf3LDz
ZGwMUC/RSatYCdbPSnfQUAyUElyqppj/DDAKEu3ASN4dsNtDqENHZWhkIkWjhbM/
RqSRXUqossAKXNVLngyJ8lOzI2g/hO7/KNDRC656BLcZO1tdo3TtGZgCFT7E/8bC
k3fQ6h3GySO4rBH2ksheBF7CaxBc6b/YfNZv4Oc/rE0tKFsKqV/BCYRkqBmAUBSM
v5dcUKf90u7m3SO0C8bWBJtZDbbjTwViVVJzVdSvCchkOFJuw591s12IfconMp9R
jR35TA5n7RCuSrPbzwTpGwI646B9u9GWhYpbDmdPO0OmLWSoZ1ApIODNIYbaMMqk
5CJBOgOYbWbLErGZyH8aNoJyaJpQHMuBeZulAWbBlS3xNQnjD8IXzu7bw/WtquDR
1IM96K7AEs+bu+PZC8VslfUkMCIdzM1y+VEP7ibHNtn1I4ujZwjLMz5GxcwZza3G
r0gAl6x8plUQNVMFYGVARO5zbvJXVtgram6hkRAbTY1+zHikEKg=
=k755
-----END PGP SIGNATURE-----

--6qqwt57436zwj5dk--
