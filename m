Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB2255F5E
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040967; cv=none; b=HW0o8ImYOGNZZGfmyv/JVf1DY6sTh+zQBB61IA43jfg33rwKrN0G7OlyOSNasblWlxJTOrA3D8N5GltdrhItO+aA+ZXnPf3bsa29B0GRVw+gq9KczBPGPeKbYD5ot8y3b/z61HZYWvOR7llksDsZZr+dMimDBLz2tH4O3UmExjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040967; c=relaxed/simple;
	bh=QvUlU1mDRHLL75zkuyqfgBcWMeWc3nzP/iD1ya0fFbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VlQ5o7LCQILy9yBjREgUx+ybaGMefGAx/tD9i82F8Q6S0y1NGkBJ551SUGlowkhMESCNLEYsxDZt5vIY3t4q1ZzaUQ3N6k9I4rW+53lM7OvZQo6cSVFWDxqii4bheSeodSfwJPBDrHx9TT2PguGn9/7ggJNQVsb/UM9qeYvapFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m5JC5GBL; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m5JC5GBL"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73145433E9;
	Mon, 12 May 2025 09:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747040962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zKsMMVg+ksWGcwsexvgT2/5MZLLsZR0fW85cr2s0QhU=;
	b=m5JC5GBLNZAiQowwpGPPWyQX6dO93nDUwSEcLvuejGUEuVFsJ5v/pF/0iJs43P8chhxMfe
	eWfaKop3uXCySpd6IEMeZBZV6ghvinCapzAikE8T0kmwUOMTCNlGqErybed6JvZl3Rwkom
	psWJf/VWH2KgL4pbOYG16juvGbzNy5KG5XpK+dJl4KT9bmUrQfwZO2CmNYZgtLnDN3MhlN
	gzxoWEESJcmXUCSjz0+Cxw8isf0Xz9PuIF0H0D6KMoR97koSPKDJsdFklOBPBp4JwUGuKS
	bK8+aQMh39EkCSomReeYyTJjjIGNCsOgYssItzd9FZfYbYRpFHlZrW0ZTRafSA==
From: Romain Gantois <romain.gantois@bootlin.com>
To: wsa+renesas@sang-engineering.com,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] misc: ti_fpc202: Switch to of_fwnode_handle()
Date: Mon, 12 May 2025 11:09:17 +0200
Message-ID: <47222064.fMDQidcC6G@fw-rgant>
In-Reply-To: <20250512085852.2432422-1-jirislaby@kernel.org>
References: <20250512085852.2432422-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2235955.Icojqenx9y";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeekffdvuefgkeejgeefhfdvteeuhfdtleeiudehieeludelvdetleeggfffffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehjihhrihhslhgrsgihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepghhrvghgkhhhsehli
 hhnuhigfhhouhhnuggrthhiohhnrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart2235955.Icojqenx9y
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH] misc: ti_fpc202: Switch to of_fwnode_handle()
Date: Mon, 12 May 2025 11:09:17 +0200
Message-ID: <47222064.fMDQidcC6G@fw-rgant>
In-Reply-To: <20250512085852.2432422-1-jirislaby@kernel.org>
References: <20250512085852.2432422-1-jirislaby@kernel.org>
MIME-Version: 1.0

Hello Jiri,

On Monday, 12 May 2025 10:58:52 CEST Jiri Slaby (SUSE) wrote:
> of_node_to_fwnode() is an irqdomain's reimplementation of the
> "officially" defined of_fwnode_handle(). The former is in the process of
> being removed, so use the latter instead.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Fixes: 1e5c9b1efa1c ("misc: add FPC202 dual port controller driver")
> Cc: Romain Gantois <romain.gantois@bootlin.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/misc/ti_fpc202.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
> index b9c9ee4bfc4e..cc597682b89c 100644
> --- a/drivers/misc/ti_fpc202.c
> +++ b/drivers/misc/ti_fpc202.c
> @@ -284,7 +284,7 @@ static int fpc202_probe_port(struct fpc202_priv *priv,
> struct device_node *i2c_h
> 
>  	desc.chan_id = port_id;
>  	desc.parent = dev;
> -	desc.bus_handle = of_node_to_fwnode(i2c_handle);
> +	desc.bus_handle = of_fwnode_handle(i2c_handle);
>  	desc.num_aliases = FPC202_ALIASES_PER_PORT;
> 
>  	fpc202_fill_alias_table(priv->client, aliases, port_id);

Looks good to me.

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

--nextPart2235955.Icojqenx9y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmghur0ACgkQ3R9U/FLj
285vuRAAjNDAQ/01mOOa99MhOI6ywCt9FVAHEOdrJWyyu8Qc5Y4Np359+L/aWARe
f7FEwcEysYVaBJJ0VS64NEDAgm7hqvb3efdu3afj8rNIsAbalc1Byibkg4zewCo2
7qoVaCWcsBiPM/JtBd9EFRauPg4RntGqAXgsN+2W96M7Mr8Ze6ScoFAksSlMwqn4
pNGG8AKIHQLy4N/yb7FSDiAqbNYg3a6jECenAU2ZgYdIGJZgupSxaW0BhZm74NsF
UA9r45a+1PxyrekPtKg3KVRUPg+veIBmSEOsSxa6tynkAWmkzGBZOMXu2h/57Oxc
n2ijhSAlRnksMc731rwAFQnBWGMW4yKrD33G5C+tZCvVeB1dNYB0tYrXcGogYFeF
mNBvhG21EBZJ9r5fJA95kFB22CVbi9V7U9nek0yujulTJVL03H0XAurX2YgeUTEU
c76y2JrXgKYRW6SKruCVB635/1eFeoLct3O1dJKpUdddqQxsa61kfPfXb1Dwuupx
DwjFyDx8XLBPJn2rFzhUfOovafoL6Sf525vyEC5J64ZfQwzQYw2tYlixBy4Unrh5
M9egOd+FP1FfJEjWKbEF4fI6hSGqeu79X6S1rRN3NaRzLir7ThtgfomfFSWxZptn
sZoZI+q4GEPbvPmhk+lbZuHofqX3+KGC5KZfNrvcRRGT1/z76bs=
=zbl8
-----END PGP SIGNATURE-----

--nextPart2235955.Icojqenx9y--



