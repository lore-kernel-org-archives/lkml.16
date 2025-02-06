Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479301EA7C0
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849106; cv=none; b=kISl8jdeot6+BxmdGkrAAIKqxPeghr80tB1nbZ9+2aPF6nFBtDCebB+3QAlZGsCTfcs0JTp/dUAWap4DG7W9npBRUeBLcwdVpgBQqE/tSap9QyCiXn+nT4zvPOQsqHfhtyyILhSbDuq25bZbNntMZDEeaYyu/4MHdJi86AMlsUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849106; c=relaxed/simple;
	bh=KjmqvWmcqyv2vZqMrhG78Gdr5LGgyYYlRAvm66CRgI8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WogOfiHZSGYqjVsPtl4sudH0orY2Yjz+LgyOp1Xq3GYIuaKllCqaurdw7j2RVWj/wF2/8Q+rtF1y944TxTBmuob/QVzXwoKlnggh0BoLzEPnvilymMDr2HYUDbrlIHX6saVLyknkGE6dmcdOFMBJYl+b6O3ee3EmcqfkBwChG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pa0fSy0V; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pa0fSy0V"
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27E161198;
	Thu,  6 Feb 2025 14:37:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738849030;
	bh=KjmqvWmcqyv2vZqMrhG78Gdr5LGgyYYlRAvm66CRgI8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pa0fSy0VR9+XRrI19lg2OCBvIiw7Y9HifKgpfL0mQDEAlPXxhVQxG1Cm/HpmGDMep
	 IxR/xAK1O/ke8yR+bxHTADeucn659c6gz8OXiFAm3amMaZbOG2yEIrya7CDNiVPVcL
	 VWZZnGV+j5dagjnaZBCxsQohjXzp0ABKNhO3W3dg=
Message-ID: <92528d4cccd46c090c7840320e76277b18dfb3cd.camel@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] RFC: regulator: ad5398: Change selector division
 calculation
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: "Hennerich, Michael" <Michael.Hennerich@analog.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	 <broonie@kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Thu, 06 Feb 2025 13:38:20 +0000
In-Reply-To: <PH0PR03MB65127833FDCEA37075CBB3F68EEE2@PH0PR03MB6512.namprd03.prod.outlook.com>
References: <20250128173143.959600-1-isaac.scott@ideasonboard.com>
	 <20250128173143.959600-3-isaac.scott@ideasonboard.com>
	 <PH0PR03MB65127833FDCEA37075CBB3F68EEE2@PH0PR03MB6512.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-01-29 at 08:34 +0000, Hennerich, Michael wrote:
>=20
>=20
> > -----Original Message-----
> > From: Isaac Scott <isaac.scott@ideasonboard.com>
> > Sent: Tuesday, January 28, 2025 6:32 PM
> > To: Hennerich, Michael <Michael.Hennerich@analog.com>
> > Cc: lgirdwood@gmail.com; broonie@kernel.org;
> > linux-kernel@vger.kernel.org;
> > Isaac Scott <isaac.scott@ideasonboard.com>
> > Subject: [PATCH v2 2/3] RFC: regulator: ad5398: Change selector
> > division
> > calculation
> >=20
> > [External]
> >=20
> > If the AD5398 is defined to have a current limit with no range,
> > i.e.
> > when max_Ua and min_Ua are equal, the DIV_ROUND_UP erroneously
> > tries
> > to set the current to a higher level than the max_Ua, which causes
> > the driver to
> > fail to set the current. Fix this so the driver slightly
> > underestimates the current
> > to set.
> >=20
> > Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> > ---
> > =C2=A0drivers/regulator/ad5398.c | 3 +--
> > =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/regulator/ad5398.c
> > b/drivers/regulator/ad5398.c index
> > e6f45c6e750c..0c60ecd1f0f2 100644
> > --- a/drivers/regulator/ad5398.c
> > +++ b/drivers/regulator/ad5398.c
> > @@ -98,8 +98,7 @@ static int ad5398_set_current_limit(struct
> > regulator_dev
> > *rdev, int min_uA, int
> > =C2=A0	if (min_uA > chip->max_uA || max_uA < chip->min_uA)
> > =C2=A0		return -EINVAL;
> >=20
> > -	selector =3D DIV_ROUND_UP((min_uA - chip->min_uA) * chip-
> > > current_level,
> > -				range_uA);
> > +	selector =3D ((min_uA - chip->min_uA) * chip->current_level
> > /
> > range_uA);
>=20
> Not sure if this is a good idea. The rational was to set the limit
> slightly higher.
> This will do the opposite. The ranges are already checked.
> Why not clamp() the calculated value?=20
>=20

The documentation for set_current_limit says "the driver should select
the current closest to max_uA". In this case, does DIV_ROUND_UP always
choose the value closest to the limit?

In the use case where you want to set the current to exactly the
maximum, it does not make sense to overestimate the current (for
example, when the regulator is powering an LED, and if the LED gets too
hot from being over current, it could burn someone).

In the case where the user is setting a current that is within but is
not close the configured max current, it makes sense to estimate
slightly over. In the case where you configure the maximum, I think it
should calculate the max current that can be set so that the final
current does not exceed what is defined as the maximum in the device
tree.

What are your thoughts?

> > =C2=A0	if (ad5398_calc_current(chip, selector) > max_uA)
> > =C2=A0		return -EINVAL;
> >=20
> > --
> > 2.43.0
>=20

Best wishes,
Isaac
