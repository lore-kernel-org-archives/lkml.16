Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB84C19E82A
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747041270; cv=none; b=QQd3njoTAVaVq+/8FQI5Z8lP5N/p6Xe2iZktKqUeuOt/zqYMOVGYxuwXeBsvLrSzFHbMt3GfRQB3e/D7ZiKVBZucIyC8HgH1+FGeuEhr6VaCCQXd8y6OCjQNBMLJwMrZKuoUj/7pHmqXWGAwQuhQjMot+rqFUirlkgNvBcX3V0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747041270; c=relaxed/simple;
	bh=y2AhjnGfkM5ZElWW4GYAPAGlFxNKYE2GMmB+j+7M/XI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LHle2ndaTwLiknx4ra2AALLGx/C1xtZuEcBe/Bmro81pBBYqs514u1TUDkRRLsHClhmB14GiTrrzLHIF2Q+sEWDTTx0qXbMfK7UU1NSJz3h4vziNm5JVsWFvSctaZMkwuc8gzWmrVMwb422yeCCHdSn85NUNTvB4IEe0+zed+Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TT+vIWCk; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TT+vIWCk"
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF7FA43ACA;
	Mon, 12 May 2025 09:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747041266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=71NJibszXJxK146D6odNbBLRQc8NbVhYjl6rwxOZ04M=;
	b=TT+vIWCkvORfoZ7wpP5Ld2dJywaXLJFde9jPu4T4ot5GeKbXOoaGXeOcW3nMbjwS2uGWjw
	wWugIFfLYq6iHNOoGca9vuCC7nWTRN+egl+bq+OzCdhW9EVw5fXKqylk6ZtqkPymxUKWAW
	XigQXei5qasG7ngOpS2T88jzJl09+G7QHb3O8yGwSl8CJCVne03L2h7I8VEfs1cYNuwktF
	Sdgi/EgBAK5PgLr12zMTtL2fV1xnmm8iPQ+bztMgGX6BHTaaL0IsuLEQbxDzsVI8PF8Bek
	G7qbgAtylwmJStV1x5C7XC1BMdE18P/pKWNDC9VCbbm9awpbUUExl6Bb03sEFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bence =?utf-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
In-Reply-To: <20250512084033.69718-1-csokas.bence@prolan.hu> ("Bence
 =?utf-8?B?Q3PDs2vDoXMiJ3M=?=
	message of "Mon, 12 May 2025 10:40:32 +0200")
References: <20250512084033.69718-1-csokas.bence@prolan.hu>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 11:14:25 +0200
Message-ID: <87frhambri.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheptghsohhkrghsrdgsvghntggvsehprhholhgrnhdrhhhupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

On 12/05/2025 at 10:40:32 +02, Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.=
hu> wrote:

> Add MTD_PARANOID config option for verifying all written data to prevent
> silent bit errors being undetected, at the cost of some bandwidth overhea=
d.
>
> Signed-off-by: Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.hu>
> ---
>  drivers/mtd/Kconfig   | 14 ++++++++++++
>  drivers/mtd/mtdcore.c | 51 +++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 63 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
> index 796a2eccbef0..e75f4a57df6a 100644
> --- a/drivers/mtd/Kconfig
> +++ b/drivers/mtd/Kconfig
> @@ -206,6 +206,20 @@ config MTD_PARTITIONED_MASTER
>  	  the parent of the partition device be the master device, rather than
>  	  what lies behind the master.
>=20=20
> +config MTD_PARANOID
> +	bool "Read back written data (paranoid mode)"
> +	help
> +	  This option makes the MTD core read back all data on a write and
> +	  report an error if it doesn't match the written data. This can
> +	  safeguard against silent bit errors resulting from a faulty Flash,
> +	  controller oddities, bus noise etc.
> +
> +	  It is up to the layer above MTD (e.g. the filesystem) to handle
> +	  this condition, for example by going read-only to prevent further
> +	  data corruption, or to mark a certain region of Flash as bad.
> +
> +	  If you are unsure, select 'n'.
> +
>  source "drivers/mtd/chips/Kconfig"
>=20=20
>  source "drivers/mtd/maps/Kconfig"
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 5ba9a741f5ac..3f9874cd4126 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1745,8 +1745,8 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from,=
 struct mtd_oob_ops *ops)
>  }
>  EXPORT_SYMBOL_GPL(mtd_read_oob);
>=20=20
> -int mtd_write_oob(struct mtd_info *mtd, loff_t to,
> -				struct mtd_oob_ops *ops)
> +static int _mtd_write_oob(struct mtd_info *mtd, loff_t to,
> +			  struct mtd_oob_ops *ops)

I don't like these '_' prefixes, they do not indicate much about the
content of the function. I don't think we need an extra function for
that, just include the check in mtd_write_oob?

>  {
>  	struct mtd_info *master =3D mtd_get_master(mtd);
>  	int ret;
> @@ -1771,6 +1771,53 @@ int mtd_write_oob(struct mtd_info *mtd, loff_t to,
>=20=20
>  	return mtd_write_oob_std(mtd, to, ops);
>  }
> +
> +static int _mtd_verify(struct mtd_info *mtd, loff_t to, size_t len, cons=
t u8 *buf)
> +{
> +	struct device *dev =3D &mtd->dev;
> +	u_char *verify_buf;
> +	size_t r_retlen;
> +	int ret;
> +
> +	verify_buf =3D devm_kmalloc(dev, len, GFP_KERNEL);
> +	if (!verify_buf)
> +		return -ENOMEM;
> +
> +	ret =3D mtd_read(mtd, to, len, &r_retlen, verify_buf);
> +	if (ret < 0)
> +		goto err;
> +
> +	if (len !=3D r_retlen) {
> +		/* We shouldn't see short reads */
> +		dev_err(dev, "Verify failed, written %zd but only read %zd",
> +			len, r_retlen);
> +		ret =3D -EIO;
> +		goto err;
> +	}
> +
> +	if (memcmp(verify_buf, buf, len)) {
> +		dev_err(dev, "Verify failed, compare mismatch!");
> +		ret =3D -EIO;
> +	}
> +
> +err:
> +	devm_kfree(dev, verify_buf);
> +	return ret;
> +}
> +
> +int mtd_write_oob(struct mtd_info *mtd, loff_t to,
> +		  struct mtd_oob_ops *ops)
> +{
> +	int ret =3D _mtd_write_oob(mtd, to, ops);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	if (IS_ENABLED(CONFIG_MTD_PARANOID))
> +		ret =3D _mtd_verify(mtd, to, ops->retlen, ops->datbuf);

Why _mtd_verify and not mtd_verify?
