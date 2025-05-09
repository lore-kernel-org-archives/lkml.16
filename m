Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD1722FDE7;
	Fri,  9 May 2025 15:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805710; cv=none; b=GFH9P10SXVLfVZfx2sPgZJ3Vb0xhu8oCUn4/R3E62N3JMCp0N1sv8OhBEzDWLes0FQucZMomQX4Ei2gIun/giI/eUTzhiI/BZRUPcakUl8hLkx3q38Dal4ckgwG/jq9e8dGlLIIcPx3xUt+18y8CJplzW6WZBdcf7bgujTknLrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805710; c=relaxed/simple;
	bh=Z/ccOXoCEaNihcY6p2Y764mYYL45MJ+rALkM+IUwoe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdw9WDRV0EbmW1ioT8/bnTUcgYXO3nPJQ4/d2VE/6jX48am8Yb9NYsPuHzsfDTF6dcK1GDNpFvLqUHu3hRTMS/WilZ2VfnjKMqwD37+c5s91/4YEVP50Y/MBk9AkQkwOFeQu5iM/nb7UApEGvduE0/MXzvX5ugRdavfLgYBnP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjWuvd9r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjWuvd9r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4622BC4CEEF;
	Fri,  9 May 2025 15:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805710;
	bh=Z/ccOXoCEaNihcY6p2Y764mYYL45MJ+rALkM+IUwoe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjWuvd9r7Fii+94cxA3vTZy6O0PSohuktwLs/ESa7TAcScbshAHwHs+MDfGMN9PVd
	 BJ0HrtDxDkBmtM5aG2mnm5wIJ1ChHyEbib3TTm+SzK3Hxbl9pujKshBEc7prGkOy50
	 CID/LqIok0SbvO4EEdzg6HtOBUQiAitMycu6crVcCR7JVMgu/yxWcVMqg5n732JzcZ
	 DWPwwxiRINKNdw15G1mj+PL4iXMjYDanwJYKywWQ87f+2BhFruV/AQYq+RRtlC8XPr
	 G5WRcy1j3I60HqaINX+pm2woaQQ6IeSxLI4zEBO0+xQf5/SszHTgKxtz9QCBRXTcIV
	 qkjGGUqNjB9/g==
Date: Fri, 9 May 2025 16:48:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: linux-usb@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: ti,usb8041: Add binding for TI
 USB8044 hub controller
Message-ID: <20250509-flagman-bootleg-ad27822f7d53@spud>
References: <20250507131143.2243079-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3e03400f-766d-4690-8f43-cbea2cac93d8@emailsignatures365.codetwo.com>
 <20250507131143.2243079-2-mike.looijmans@topic.nl>
 <20250508-prewashed-jawline-37f53c0f9429@spud>
 <583dc73e-23d3-4c8a-a457-f2bf71190e6a@topic.nl>
 <20250508-waving-sustainer-28fe228e01f8@spud>
 <d4604713-ffb3-4cb2-bcd8-14c0519ad608@topic.nl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n9g9I+OmmxWn4iaj"
Content-Disposition: inline
In-Reply-To: <d4604713-ffb3-4cb2-bcd8-14c0519ad608@topic.nl>


--n9g9I+OmmxWn4iaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 09, 2025 at 07:56:35AM +0200, Mike Looijmans wrote:
> On 08-05-2025 17:53, Conor Dooley wrote:
> > On Thu, May 08, 2025 at 05:19:03PM +0200, Mike Looijmans wrote:
> > > On 08-05-2025 16:58, Conor Dooley wrote:
> > > > On Wed, May 07, 2025 at 03:11:43PM +0200, Mike Looijmans wrote:
> > > > > The TI USB8044 is similar to the USB8041.
> > > > Similar how? Why's a fallback not suitable?
> > > I don't quite understand what is meant by "fallback" here?
> > A fallback compatible, since you;re using the same match data as the
> > 8041.
>=20
> I think it would work. It would look strange though, having to put an
> additional vid/pid in the devicetree to make it work.

That's how a huge number of other devices work in devicetree when
handling differs between devices.

> > > It's similar in that the USB8044 provides the same functionality and =
can use
> > > the same driver as the USB8041, all that is needed is to add the PID/=
VID
> > > values.
> > Is this onboard_dev_id_table table with the vid/pid used in combination
> > with dt, or in-place of dt when device detection is dynamic? If the
> > latter, why can't dt use a fallback compatible since the handling is
> > identical to the 8041?
>=20
> My basic understanding is:
>=20
> The devicetree match creates a platform device that controls the reset pin
> of the hub. It's basic task is to de-assert the reset, so the hub starts
> negotiating. This part also works with the 8041 devicetree entry (which is
> how I first tried to get it up and running).
>=20
> The VID/PID table then matches the hub on the USB bus, which can then be
> associated with its platform device. Since the 8044 reports a different
> VID/PID, this part only worked when I added the entries to the tables.

Right, so you do actually need to use the dt entry /and/ the dynamic
data? In that case, there's little value in a fallback, since you need
non-fallback information in the driver for things to work. If that's a
correct understanding,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--n9g9I+OmmxWn4iaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaB4jyQAKCRB4tDGHoIJi
0pfCAQCGCGWallUTglxaL9aGMoqKHpRUBAoqvKbvaSLxA9HlwwEAwOUAI1MU7toT
1VyheNOnj9KtDpaBM0yYX5amE/4BHAA=
=hpeN
-----END PGP SIGNATURE-----

--n9g9I+OmmxWn4iaj--
