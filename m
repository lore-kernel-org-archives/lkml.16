Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9A3246BC7;
	Tue, 10 Jun 2025 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563501; cv=none; b=MAHQIcLTUJ07lmVseWe6+celjNbSBBGdNnxVAht52FqKBgFbrBCWddW5qNyQcZzRXct9tmuH5QfvmYqTghLKrEE/X+Cf+bk3rgYFVPwpXvAVc3kv3QXNeZN1Et52GU1aMrgTsBTBVY66pQ2V8gFeNWzchERaQ4Ji/GP1429X7gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563501; c=relaxed/simple;
	bh=2xpav1gssifbJiMTvuagJlH8sA2SHN3RwD3C3+ICz/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CupjzndqmLGr1SfBMXM0GMI8lpICO5qatgv26IggDnm1baIfkfCJU2B946LnbKCm9OwxHXRXT7n8GhMPis84zeugmlzvcChdxj3kBkQJxbThDwADwDXnN19yt5wtvzzd85aQqZwdc2i+NWHdkC9qLQRxucpBlIyZQmrrFFk0VKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0q/2EnS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0q/2EnS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B18CC4CEED;
	Tue, 10 Jun 2025 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749563501;
	bh=2xpav1gssifbJiMTvuagJlH8sA2SHN3RwD3C3+ICz/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0q/2EnSQWJnZs3eHYfUdN9RsmsrF5oFiyG6W6foNdcY3DMpW52TXjQrQEDTctfQ3
	 KObwHOz4QyJBf1i3yg3aoynhBn51cs1uDNvkmxiJt0bcPLQT+Lsmv1F5C4vgA/i8w2
	 vvlWKXDtgsAA6rJ0rO9CgKNOne4QjKe82L6NNLEUNQqhHhaiyV3YPhhSy1yJSeBCjT
	 Dc0LcrgXCNBRy/E0ol648jDWrjfSvcu7Dz5n7uqGndYpAaQTnqGZSMTG+6KEvOaZAa
	 PmxQgQEUBysSCwKY2pN6/sv199m8BKOL9EkibW/u1242By6FQG38naChZgEaVbvj3R
	 zn75MdgBQ15pg==
Date: Tue, 10 Jun 2025 14:51:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jens.glathe@oldschoolsolutions.biz, konrad.dybcio@oss.qualcomm.com
Subject: Re: [RFC PATCH v1 0/2] Introduce dummy regulator consumer
Message-ID: <6fcbedb3-eb41-449f-9b6d-10699153c9dc@sirena.org.uk>
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
 <8a688e9f-012e-461c-a916-f06b34fdd913@sirena.org.uk>
 <CAMcHhXpVKaWX8guog_M+5wHfJ+6uxBteNnV1xCjcDJuGFWOCkg@mail.gmail.com>
 <b481298e-319f-41ce-8a56-e3f78b8649ff@sirena.org.uk>
 <CAMcHhXoioEJH+KnLYbXmnt5eyGT-tXg0-CzLQpvj=8Jy5sGXuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3JbEwhaoPZrgoyLF"
Content-Disposition: inline
In-Reply-To: <CAMcHhXoioEJH+KnLYbXmnt5eyGT-tXg0-CzLQpvj=8Jy5sGXuw@mail.gmail.com>
X-Cookie: When in doubt, follow your heart.


--3JbEwhaoPZrgoyLF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 11:15:09PM +0200, Aleksandrs Vinarskis wrote:
> On Mon, 9 Jun 2025 at 22:50, Mark Brown <broonie@kernel.org> wrote:

> > I don't see why not, and this can also be approached from the controller
> > side - it's providing a USB bus which includes power as part of the
> > specification.  That's just a question of where the binding happens
> > though.

> That would be another option. Could you elaborate on this, please?
> If I understand you correctly, you mean to extend controller binding
> (and driver) to take in an additional supply? If yes - I'm afraid that

Yes.

> will be hard to justify to USB controller folks - as per my
> understanding bindings (and device's driver) shall describe the
> physical specification of the device, and in this case the root
> controller does not in fact provide powered rail(s), nor a way to
> control it - its an external addition controlled by SoC's GPIO for a
> specific device, so it shall be described as such. Perhaps Konrad
> could share his view on this?

There's also the potential that there isn't a single 5V supply for the
bus, depending on the system design.

> > I'm also not clear what the relevance is here?  If we have a dummy
> > consumer we're still going to need to work out how to instantiate it -
> > that's the same problem no matter what's getting instantiated.  A dummy
> > consumer is a userspace interface, not a firmware interface.

> Ah perhaps I should have shared more examples, my bad.
> Currently suggested solution, which in my opinion is not scalable:
> * Add VID/PID (of every camera, iff known) to onboard usb driver [1]
> * Define in DT as:
> ```
> camera {
>   compatible =3D "usb5986,1198";
>=20
>   vdd-supply =3D <&vreg_cam_5p0>;
> };

That's what I'd understood.

> Proposed solution with dummy regulator consumer:
> * No need to explicitly set VID/PID. Define in DT as:
> ```
> camera {
>   compatible =3D "regulator-dummy-consumer";
>=20
>   vdd-supply =3D <&vreg_cam_5p0>;
> };
> ```

This is clearly not describing the hardware and therefore not a good fit
for DT.

> > > Having to add VID/PID for every device that does not in fact need a
> > > dedicated driver has another issue - it was just confirmed that Lenovo
> > > Ideapad 5 uses a similar setup with USB UVC webcam, but of course
> > > VID/PID are different. That would require yet another driver change.

> > We already need relatively large sets of quirks because laptops have
> > firmwares built for Windows which is happy to enumerate things based on
> > DMI information even when there is a perfectly good enumerable interface
> > that could describe things directly, never mind the bits that aren't
> > enumerable.  This doesn't seem particularly different.

> But how would we approach the lack of particular information, in this
> case all possible VID/PID for an embedded camera? VID/PID was
> identified by checking the actual device, which does not rule out OEM
> switching camera SKU on the next batch, same way they do with other
> peripherals.

I'm not saying this a particularly great or pleasant solution, just that
it's where things are at.  You're trying to solve an OS problem with a
firmware description which is a bit of a mismatch, ideally the firmware
descriptions would be better but that's just not how ACPI laptops work
unfortunately.

It does seem a lot easier to just mark the supplies as always on if
there's no integration with an actual client driver TBH.

--3JbEwhaoPZrgoyLF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhIOGcACgkQJNaLcl1U
h9DFAgf+Ig6Pk3xzKH/Flc4oxj6yfik8pQQR5k6Q+d0vmCRBVTHDBy35mSrlVK3B
8kq0mjhguQXGyNunIyaXK8H9REm0rQb4L/+IGxfgHOUadqDIWFQd5AlLoCanWT+2
NA75g1FhLuJsmPQjxx8ZG0Ai2/IbYFhjpLQQT5ZA7hC7Dnib31v1ermXfkBUPbqj
bK17nmw9gVZFX+6H+00ecrgRRxXnVX2T4Pwt1+mshL2fF0LXIX/0yioWnDHCvjAi
wrGPiYrcGQ8Xkvhh3MzYle1XSZ/koiND4rfsr1twPWEkFvkDEQQ+lkSWd6RZeYbr
VAiU9Ma6c5KzBz3YQKWxRla7CMvEzQ==
=NxSu
-----END PGP SIGNATURE-----

--3JbEwhaoPZrgoyLF--
