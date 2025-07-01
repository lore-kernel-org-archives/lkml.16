Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CE323A9A3;
	Tue,  1 Jul 2025 09:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360892; cv=none; b=U1TKMsnZsiJUlto51cZxRij8/oAM6DOk23X/mv8fJbKkAD9k7dPHkA+DXs7TaX53azC/LWZuT1hQ6/jFhBtQ4M33yA5u0yWmt/dNzL06xxT/nfTkRCRiSxQTIiCHhD+Yktv3N6GIAQQ1pD/N3cb2woJFQMnbB8O/qk6WSUzve08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360892; c=relaxed/simple;
	bh=sQOR5Ukb5Jem/GnNplbF10cI9ssq5tp3I425VLznSko=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LDmZ6v/9QP72Jz6IPH0DcUUfAGm2z/69hhT97xmDfo7LRuQo4Xtm9Wcw0VUHZwIx0AV6qJWz0QIP0mhqg/HJm9I3xAfXtx39W6/AkOM4BWN8oHN5lV3FB9ZyE7UfJN1w0OZz6dn4ziB2asTyC+nepdftk/ZNdM4xhGlBDDLrUxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=hwwkWF8S; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="hwwkWF8S"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751360887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sCKhaBsg8xUAooQ2UnBR99qEvYpdT0zIlTvlGHqxLsI=;
	b=hwwkWF8SmOXJLw9wzALqdogqAoTe/5RQm7bPFyxQrcWnFMjdT2GuLKk21ZDWysMGviZ5f9
	bFW5nLhOSzTFNd/KKAgJys6NIt5GGPMzTN5ExlBdQ+ttoSfDQf813i2zfAhSjBy5T9S5nm
	29imL8mAXYjoMtwg6ieAmEp4bhhpPxmNV3e4mokzW0Q5uHpiToqxC+UdhwIeghoW2Rr5Yc
	MEgpH9jb0lb+sGuLV3r7uZu3Xe32CPkiZyHDzGbG2mp5HMb9juEXMXYXFjErEa7CJNckxS
	o2HuCpmNUldlDxBTa1/KBP1Tidc4c6apZEkK2BCsDZDzHI0/9eb/zNK1mHafGQ==
Content-Type: multipart/signed;
 boundary=b8323306f1bbbc5afcc52f8f8b6518b1db3b53e34623a0a8a033e4200c2d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 01 Jul 2025 11:07:51 +0200
Message-Id: <DB0LM56C47LH.YYFY0ZGCVVKC@cknow.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <kernel@collabora.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK
 4D
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Sebastian
 Reichel" <sebastian.reichel@collabora.com>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
 <5acizoywvjolaffojiawqlzixiclrqzohuhq55lbsjm6yhhlwi@w2amqugl3ee2>
 <DB0KL629S4E4.3ENNM27XN3IYM@cknow.org> <5039013.31r3eYUQgx@workhorse>
In-Reply-To: <5039013.31r3eYUQgx@workhorse>
X-Migadu-Flow: FLOW_OUT

--b8323306f1bbbc5afcc52f8f8b6518b1db3b53e34623a0a8a033e4200c2d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Jul 1, 2025 at 10:55 AM CEST, Nicolas Frattaroli wrote:
> On Tuesday, 1 July 2025 10:19:33 Central European Summer Time Diederik de=
 Haas wrote:
>> On Tue Jul 1, 2025 at 1:10 AM CEST, Sebastian Reichel wrote:
>> > On Mon, Jun 30, 2025 at 08:12:27PM +0200, Diederik de Haas wrote:
>> >> On Mon Jun 30, 2025 at 5:36 PM CEST, Nicolas Frattaroli wrote:
>> >> > The ROCK 4D's actual DC input is 5V, and the schematic names it as =
being
>> >> > 5V as well.
>> >> >
>> >> > Rename the regulator, and change the voltage it claims to be at.
>> >>=20
>> >> Shouldn't it have a fixes tag then? Providing 12V where 5V is expecte=
d
>> >> sounds problematic ;-)
>> >
>> > This is basically "just" documentation, as the DT just describes
>> > a fixed regulator (i.e. nothing software controllable). This just
>> > changes a number in sysfs :)
>> >
>> > Note, that the 5V DCIN is a USB-C port, which does not do any PD
>> > negotiation, but has the 5K1 resistors on the CC lines to "request"
>> > 5V. If for whatever reason a higher voltage is applied (which does
>> > not happen as long as the power is provided by anything remotely
>> > following the USB specifications) there also is an over-voltage
>> > protection chip. So it's not problematic :)
>>=20
>> I was worried about and wondered why I/we did NOT receive reports about
>> boards being fried. Good to know, thanks!
>>=20
>> > OTOH adding a Fixes tag does not hurt ;)
>
> to add to what Sebastian already said: I purposefully didn't include the
> Fixes: tag because there is no functional change here. I don't think
> cosmetic fixes are worth pulling into stable kernels unless they're a

Then I agree with you. I didn't realize it was not a functional change.
I guess I didn't (fully) understand the "just documentation" remark.

Cheers,
  Diederik

> dependency of a follow-up functional fix patch, which isn't the case
> right now. If such a functional fix patch does emerge, it can explicitly
> declare its dependence on this patch, or even have our robot overlords
> figure it out itself.
>
> In that sense, I do think a Fixes tag hurts, because it needlessly
> adds to the patch queue of the stable kernel people, and it's worth
> pointing out that while I claim this patch has no functional change,
> that's always predicated on the understanding that it does not
> unintentionally break anything. In this case the chance is essentially
> zero though, but I won't bother re-rolling this for that tag alone.
>
> Regards,
> Nicolas Frattaroli


--b8323306f1bbbc5afcc52f8f8b6518b1db3b53e34623a0a8a033e4200c2d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGOlcAAKCRDXblvOeH7b
bhLJAP97JDpJXhGMfDQaNL37OzPukLBLbOqLs8V/lgGwI5aFpAEAhggtFpJ3o9PL
NRBJV2vUQPI7/xkFk0EFLqPv3aJFcAo=
=mOO0
-----END PGP SIGNATURE-----

--b8323306f1bbbc5afcc52f8f8b6518b1db3b53e34623a0a8a033e4200c2d--
