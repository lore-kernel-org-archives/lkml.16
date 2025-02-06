Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189C4239573
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738862018; cv=none; b=Lh9eosYMw56/mtGnf3crBENtvUfz5ZoOFifTQ1lqoVHwEvKJimyvCTsjYv8WL2p7jnZxbIcCnnC32+i8FFgKZhRvxfPfKFVf0DPak/BBziASk0GaFCCTqc7RFM1qhaupW2ZjJ59n0J9uWUf02B/528tt1FP5u3AMOMASY/sDO4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738862018; c=relaxed/simple;
	bh=naNBMBvLwLgg9LbU5b3rygqVIyu8ucN52sjZbK2fj44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SWEK8yeDGKA3IbCc6HpmTflrcy9cUUx7AZrC6SI4eQtZW6P2rE0CBf/UTSaymh4evAtmYLTRBRSzZ0aC/IVzfK66gXmqTr/fb1EE9OVWhXAkmiot85jCP4+3EqSY6qEUNqE9gIeK9kKXYTE01f4QFfHaKsOChi0pgDIOdaWTTzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G7T7OGzl; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G7T7OGzl"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6D7644346;
	Thu,  6 Feb 2025 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738862008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8qcVxq458N/mAEJuBQV6f51SQeiq0Xrop5ehm7xdCc=;
	b=G7T7OGzlVio7+/xgaozWsxRnF2LyR3WtY50zNi+iuSGIl27pCtu0FwTJG49dy8DwikeJMz
	5pQHFZY84tUItYqhx73EP5X5O3VSPIyMDBnFayxIgHQ2yF5PELNeC2+VtUgVD7BArInjSl
	bhZ1bnPitEzbncv/yTjPrYvDiqAn2bKu5dT1LyoD3vQ0k0nw9cQo5ArwckVhg6YYWHi9Lx
	g7tSf654ksf1Hd5QrQduEEnuz421qrbCcik3bYvHTWzqJKDnWJb3Z+DzgDiaNg90sNEUto
	PvtyiKC39tDOjthvsj8AwdRc1tKZTWKHU4q2hNoHbK5a/pCfex72OMg9yMJ6EA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
In-Reply-To: <20250122065605.285145-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 22 Jan 2025 14:56:04 +0800")
References: <20250122065605.285145-1-linchengming884@gmail.com>
	<20250122065605.285145-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 18:13:25 +0100
Message-ID: <878qqj3sju.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtp
 dhrtghpthhtoheprghlvhhinhiihhhouhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Cheng,

> @@ -687,18 +691,43 @@ static int spinand_mtd_regular_page_read(struct mtd=
_info *mtd, loff_t from,
>  		if (ret)
>  			break;
>=20=20
> +read_retry:
>  		ret =3D spinand_read_page(spinand, &iter.req);
>  		if (ret < 0 && ret !=3D -EBADMSG)
>  			break;
>=20=20
> -		if (ret =3D=3D -EBADMSG)
> +		if (ret =3D=3D -EBADMSG && spinand->set_read_retry) {
> +			if (spinand->read_retries && (++retry_mode < spinand->read_retries)) {

I believe the condition should be:

                        if (spinand->read_retries && (++retry_mode <=3D spi=
nand->read_retries)) {

So if you have 5 retry modes, you can provide 5 in the manufacturer driver,
and not 6.

> +				ret =3D spinand->set_read_retry(spinand, retry_mode);
> +				if (ret < 0) {
> +					ecc_failed =3D true;
> +					return ret;

Shall we try to set the read_retry level to 0 upon:

      if (ret < 0 && retry_mode > 1)

?

> +				}
> +
> +				/* Reset ecc_stats; retry */
> +				mtd->ecc_stats =3D old_stats;
> +				goto read_retry;
> +			} else {
> +				/* No more retry modes; real failure */
> +				ecc_failed =3D true;
> +			}
> +		} else if (ret =3D=3D -EBADMSG) {

Rest lgtm.

Thanks,
Miqu=C3=A8l
