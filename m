Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA29C2701B7;
	Wed, 23 Apr 2025 13:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413549; cv=none; b=OjYdPBG71aBM7+Iou7HYf9YuSWC/BTQVAnsSho3TVHq+jWfGuU+YMjhkoDasXCuGiBKwtYLHs4BQu6IeEOKPjfWPDmf2nwa0S/2kJoaD7dBd1iWhQ9sMNfEyJkdoJ7+HCihqFlNdxKUnedNu2lhC/s6ZCxjCzxHFm9sPRtPc244=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413549; c=relaxed/simple;
	bh=RcgQTUHQ+Pl7003DZJD+mnP7u8UiOqqBTHs7cX83a+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eojc8d+Bqq9/HmgxnuEHVqZSYUyAIaFfHe3+K5/auwXDBbsmmAlggc7CD1CcMI3zJ9wboFCF1JoSrd6ZSKMudADZa8kscPs5QW53Le01b81XL/1Be+Uu2z/zzYDQgs49KcowRCickJmFbKnM89HuoKASoOLeSk7TtNsXD63+PxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DHBv1N3y; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DHBv1N3y"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40DEE1FCEC;
	Wed, 23 Apr 2025 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745413544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a7aC+Unu0bxBebacdFme4H9z3bxAWup925qXizcBc+k=;
	b=DHBv1N3yynrOyPyxrdijD6lEG1jabNBCfFJU4BIgfUXE2lcqDbbbEf1zhdtrjQ7iSYLKUs
	QgylcTwkSmf4QM/jgukMBqr42/AjKMF5ILXOwhCjuhQVCuhilO/d8bJjaQPoIFLdRDF0oj
	93ycOniN6NhTkyE/SQIJVQIjzrNQkVz1hVypI6RNO15LrCECnZJVGMESv/OjBYrn65Isa1
	/wdWGDgg/QUVgQslGxI+kCASASTjZkSns3AK2jXKVA3w/R6tizYk46Pm6QaF7ovP0d8FvC
	Hp0RTR/AaLCRZ5YztZi4tyVGUD3eQ3dGqSWu//W7AiN8G8YhXlbTd6l/rhKXYQ==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] misc: ti_fpc202: Fix off by one in probe()
Date: Wed, 23 Apr 2025 15:05:38 +0200
Message-ID: <1923319.16XuQ88jBL@fw-rgant>
In-Reply-To: <aAijRtGLzKLdwP0-@stanley.mountain>
References: <aAijRtGLzKLdwP0-@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3153738.SdYAi8KGqb";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeiieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfgjfhggtgesghdtreertddtjeenucfhrhhomheptfhomhgrihhnucfirghnthhoihhsuceorhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeikeekffdvuefgkeejgeefhfdvteeuhfdtleeiudehieeludelvdetleeggfffffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepfhifqdhrghgrnhhtrdhlohgtrghlnhgvthdpmhgrihhlfhhrohhmpehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegurghnrdgtrghrphgvnhhtvghrsehlihhnrghrohdrohhrghdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordhorhhgpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrn
 hhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehkvghrnhgvlhdqjhgrnhhithhorhhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart3153738.SdYAi8KGqb
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH next] misc: ti_fpc202: Fix off by one in probe()
Date: Wed, 23 Apr 2025 15:05:38 +0200
Message-ID: <1923319.16XuQ88jBL@fw-rgant>
In-Reply-To: <aAijRtGLzKLdwP0-@stanley.mountain>
References: <aAijRtGLzKLdwP0-@stanley.mountain>
MIME-Version: 1.0

On Wednesday, 23 April 2025 10:22:30 CEST Dan Carpenter wrote:
> The "port_id" is used as an array index into the struct fpc202_priv
> priv->addr_caches[] array in fpc202_write_dev_addr().  It's a 2 by 2
> array so if "port_id" is FPC202_NUM_PORTS (2) then it's one element
> out of bounds.  Change the > to >= to fix this bug.
> 
> Fixes: 1e5c9b1efa1c ("misc: add FPC202 dual port controller driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/misc/ti_fpc202.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ti_fpc202.c b/drivers/misc/ti_fpc202.c
> index b9c9ee4bfc4e..4e1871870769 100644
> --- a/drivers/misc/ti_fpc202.c
> +++ b/drivers/misc/ti_fpc202.c
> @@ -370,7 +370,7 @@ static int fpc202_probe(struct i2c_client *client)
>  			goto unregister_chans;
>  		}
> 
> -		if (port_id > FPC202_NUM_PORTS) {
> +		if (port_id >= FPC202_NUM_PORTS) {
>  			dev_err(dev, "port ID %d is out of range!\n", port_id);
>  			ret = -EINVAL;
>  			goto unregister_chans;

Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>

--nextPart3153738.SdYAi8KGqb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmgI5aIACgkQ3R9U/FLj
287sTRAAhGdCDX6fkbP3CN7e8zSAnAe60jWHF4tgsI/gul+Oq84ouZ1RpameFWPj
bXrNk+5u/PgbIqYydcshqRgGwlKVgYMi4B8qEyvemETp1p/i3ClXhxm8w1JML/Fb
rzJkrY/oRVKimTIXGv9k3RmeEkubGeYgGpNZ2LUBCsPiSMjkmk8WNnwTtCbUh9XM
Qsskh5W8TWtswRc+RB16xHTzr11BM3EI19uPxnfPRJsTb+rVwAn0wktkTf7G5WYb
2nKJ7Rp9ji93xet5Bgu2ZL3owyE3zn8qdZOiz7vWDvJMSFZV+tz9Z84abU4EZqf+
KINf2mhNH7Fftp9wY7ZO2eTG4DOt25Ua6UXEbvIFc31Tiwwpv7xyX8orFpU79+IV
7lpOdbR5n6R5nnn54kjbi+37Ws4lFUcn9GAVxUeNlR3SHFriWKmMtG9LhtonFtgM
JEA3GQowSUgW3CF+XmAwgXrOwh0WCMNm/OUtb/jEtO+EmRxLbh6EXto9hTl4U/SR
ffLA0ZS2wMlMIMDqrP/aFGIuSbzAxMjZfB1kKaBh/DvmHZ4W54E7J+wdBGWfy/mh
fhRCuo0ykjh7kyBvfs0KNv+iq6PEAxj03bO/TYbU0XR8gwOY/dLCUjk7UHuBsy+Z
QE76BPu4TRTUtGjQ3Zyd+siKVItB+FBDNy2pjy/KnEPpkiZMoOY=
=u/4n
-----END PGP SIGNATURE-----

--nextPart3153738.SdYAi8KGqb--



