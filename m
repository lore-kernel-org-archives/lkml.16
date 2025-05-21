Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442942620C3
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747828232; cv=none; b=humW2aDSeKrr1d/zT9GVGAfX+vzZvLDKuJJ6UlemQ0xegpHzB8nAPd99GRb0zc42ZqZ2duvRqZ1y9WaytxeNVluygTwae/Bf5HCfZRCkbniKfSZzZnfTdy4MHkhsGmBNEpQVuF8pHraOwi2qYiRe3iD29b9dqLo61HyiOe5GvBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747828232; c=relaxed/simple;
	bh=e951PShlKNo10wcS9vkHybZj1SgaWUax7hLHQxoB+tA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pB0iu/4OWsbE2/RnBTQEn504Y3O9TjQaNFJajx+HDiD7VUT1D3vEfiXaq8KF4VS0tI24HhFGiHTFsUCJN6OBMIBWLGGjOx4ws/6z8enaiM+5oVwKsB7uZRKbgDcUTQAAe75K/LjMmOtf8HUhib+0/mCtxIOIpMB3S/npltAt9k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hUPYVQtK; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hUPYVQtK"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60FAD43A0C;
	Wed, 21 May 2025 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747828227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WXNZ86rp58kr+d4DRVHEoAdClta2oqC2LPL/P6UIuHw=;
	b=hUPYVQtKAY7UmLRFArz58tPbhoeEBPgBbPlWniDcLFrdezINrjVhSlDAaimvIyJZ/9oKEP
	4tDnKGhHqmC0aZb4lRYY77wx1hqxcg9ph1Ddj/PcA1/UP9DQNSDA4XhXZH+Q/tljJUjF8h
	d17OsyOd3WnxEekoVVKqh1GJVFAI8Smbneg7i/5aqKfnxdyBj96JhJqqkVyOo+HS5PfHaF
	IwNUe7ipXEGM5pYFpp7kLqI4Bb6WWg3lGpISfhSdakUy/+uJEG9f40L44aOWwGyrFrVk+g
	llFiw43PuOShYYY+DA63LmqvzryYZXtNW7F0ahyWBiqlR+OWtIvifibodCdaBg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] regulator: core: do not ignore repeated requests on stepped
 regulators
Date: Wed, 21 May 2025 13:50:22 +0200
Message-ID: <6190301.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <65ea2969-b528-4a7d-b6ae-21376fe2e517@sirena.org.uk>
References:
 <20250521-regulator-stepping-v1-1-b681ad012c0f@bootlin.com>
 <65ea2969-b528-4a7d-b6ae-21376fe2e517@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5044080.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeftddtucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhvdelkeevgfeijedtudeiheefffejhfelgeduuefhleetudeiudektdeiheelgfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvg
 hgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart5044080.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 21 May 2025 13:50:22 +0200
Message-ID: <6190301.lOV4Wx5bFT@fw-rgant>
In-Reply-To: <65ea2969-b528-4a7d-b6ae-21376fe2e517@sirena.org.uk>
MIME-Version: 1.0

On Wednesday, 21 May 2025 12:07:05 CEST Mark Brown wrote:
> On Wed, May 21, 2025 at 10:47:24AM +0200, Romain Gantois wrote:
> > Currently, the regulator_set_voltage() function will assume a noop if a
> > consumer requests the same voltage range twice in a row.
> > 
> > This can lead to unexpected behavior if the target regulator has a maximum
> > voltage step constraint. With such constraints, the regulator core may
> > clamp the requested voltage to a lesser value, to ensure that the voltage
> > delta stays under the specified limit.
> 
> No, if there's an issue here we should handle it the first time we set
> the voltage by doing multiple steps in one set_voltage() call.  Having
> individual client drivers all having to repeatedly call set_voltage() is
> obviously not a good API.

Understood, would it make sense to handle this directly in 
regulator_set_voltage_unlocked()?  For example by checking for a max_uV_step 
condition and repeating calls to regulator_do_balance_voltage() until the 
resulting voltage stabilizes?

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--nextPart5044080.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgtvf4ACgkQ3R9U/FLj
287gWA/+OVUeKiNjc1HqtOew/VU3WA+ylOYTNpri3EEh6C1r/pCiZDNrHnfnMIJP
U1XLRgg8QH7RwmHM5Y+ohFY0ToEb6Qh0aXJ3K057t28rUKu9EvzOva2/PM7SPV3W
/2Be6p1dmgJBrJJW1+mc1qicdWUuR7rrUFJsQWFUhRFBjcbZ89BNKOVbMR6R7dXo
/Dl8WAmHAa+IZ1rCfObDakD3rCprfH7Mt395QxjwaYq4/mEthWwNa/JThSZY+y6U
Wg49pZXKTb/VMY7WX3oLlK6OBQb/L7aVI6yV/ha9duz6xmexpb6h0CEIHLEDa8Vl
7S6kX6OWAksicxUSi8ONoXaBW3Pg7LQD9shzyDKom9o6GASwOeygcKLh5sHH4U+I
vPey3DxFBXDsxlvEjJtiki/cT0WpkR+4PbCRt14T++gkJ80SiZ1NCpqyJYtXD42f
hfqWCzHQN9tNuvqDvJWx5qzt3gOD1P9mowbFrn8ECihBkaYQY6QXvheR512Lq7Ni
MmVIYwFwT6+2KMYC4jPmC6OW9deabb8xH4g2OUD6tfPPResnOPEcNh2ocA/M0K/C
b9JOG+eiU0ukPIrqwPD7cmBnw3Mn5jecYFlvpFoP0DQqnYCPMfgi2M+Ok7K+Y5uu
UO5rQf+lgaaI3rZ1Vxs/8qBDka8A7qnOaVamiGJA5ZEfHD2kBc0=
=Y8t+
-----END PGP SIGNATURE-----

--nextPart5044080.31r3eYUQgx--



