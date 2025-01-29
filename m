Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368191E0E16
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738174886; cv=none; b=shJQAZtPVR512bBAGqW7dfuYKSQqT6xPi6XQZipQzM/rTkFi4gobKWKb5kQz55WkDhAxD4rsVR/M2YgqZ6TN6Y5Elr1EMeAkqUorbd32KEQFG48pNQzwLdG7fiZqP2j8Q1RyY5VQDIaJ06Cpf4pnOhDkuROWpEp3P5Ftu019mc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738174886; c=relaxed/simple;
	bh=jgivZaabkF7Qc7bmSxtKnn5YGJoU8NZIe3+mKLJzzF0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c9u733ay0bN9CvFFEHL8VYkU/EWBqJAeEgiasP79fSKw37dl/Bkeh8zC2X8gVr0zFA0ZL7bwfR6tBral1Z6j4trAto1Ie0BN2P9Jlc2CbNSOJ44R4qHM/4TFgcoe45irXa2i4k9Ekc9d4FvjURBtRs/9Dk1fMl3DkW4KWTrcIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=taJOoU1B; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="taJOoU1B"
Received: from isaac-ThinkPad-T16-Gen-2.localdomain (cpc90716-aztw32-2-0-cust408.18-1.cable.virginm.net [86.26.101.153])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76586348;
	Wed, 29 Jan 2025 19:20:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738174814;
	bh=jgivZaabkF7Qc7bmSxtKnn5YGJoU8NZIe3+mKLJzzF0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=taJOoU1BnujZILxtV0LncWYfuBuQlTdYLG/4h7lyhy/kCamW1PMyPAmzuKA/skzYz
	 myUbVFNTDiuEbD5QRXblImeIkLD8V1s9xnaw3p8JcmNw2LwWfk3KruaMi653hd6H27
	 /StalaOVE/TXhUmA3F/9Ie1u0t2aJQYjAp8nloEI=
Message-ID: <dd50b01ea752ef0a6c028cd7eebf927c5b2f877b.camel@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] RFC: regulator: ad5398: Change selector division
 calculation
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: "Hennerich, Michael" <Michael.Hennerich@analog.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "broonie@kernel.org"
	 <broonie@kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 29 Jan 2025 18:21:18 +0000
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

Hi,

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

That sounds like a better idea. Thank you! Out of interest, why is it
beneficial for the limit to be higher?=20

>=20
> > =C2=A0	if (ad5398_calc_current(chip, selector) > max_uA)
> > =C2=A0		return -EINVAL;
> >=20
> > --
> > 2.43.0
>=20

Best wishes,

Isaac
