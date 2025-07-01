Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A08A275877
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380760; cv=none; b=usXICdCJcWwFjD2Zy64yLQUZkFFFeYaohB+0tiqqlGF02mx39HMQJA/2+UabuxmZWFqsiWomlQc4mJrIP/srp5CRANSKrz/VDvTObGMmJ3A7J4EQS+gv0Ta8QyNQC1VmxxeRWU/44trlZ1IbeXvW1tL7dwUU2Gr6ETBdpb9O6/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380760; c=relaxed/simple;
	bh=bzsHPDIfrDjsrjy5B27djM9PbED1Yr+fq/tbkNYT9J0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sMxNykTB5dRU/wAMVXzf452vcGf9IxWnQYCIWroMhTZFLTwi9/WesRcSK7dgpdl5+nbtR0yMVjM6Sb3rYgQOHgjB+fLFMCk0dMbGtaW2GzJbLg2UaXCYOigA8tIZuWjNTrH93q2s2M84qwyZxASU8Xa4kEHiP0MTMacnhayfRPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kOYb2rUx; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kOYb2rUx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id B3C91205B2;
	Tue,  1 Jul 2025 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751380750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=prNrXolkjfaud3bDDiSuiyyGfRfPFPDh9Iys4bsEwLk=;
	b=kOYb2rUxixLfppnTRvGBVq741Tu4dTNQQ/xfJWB/FikMaWEB7QW3H1NB6sI7ZgSbPp7SUX
	81/jelmC1MZn0M0e5aTZpZZiZrQmZ6KXAIilp3MLnnLfsqjApojvbTsyZzwWNwUf04o8H6
	a46No/sjlgOzlA/V7TLEDpXLThDU64bxCh0RejAroK5fDMVFzDljDpihYNkLJj6JiR/d/0
	k1QsbxuQYM53YsqUH+xfpKe42PiSzbkbTQHj8fA66tlQdvCQJvTiDudpDNTubV2FzCeNgi
	4PqYs4PE5cOqz6Crbb5q2lbB9TLvvO6xd09cIP5yNsnIyHX0H1H8V2TCiPrT8Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: raw: atmel: Respect tAR, tCLR in read setup
 timing
In-Reply-To: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
	(A. Sverdlin's message of "Tue, 1 Jul 2025 15:33:28 +0200")
References: <20250701133333.3871085-1-alexander.sverdlin@siemens.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 01 Jul 2025 16:39:07 +0200
Message-ID: <87ikkcou0k.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheekkeegvdfgudevueetfeekuddvhefhgeekheduueejudeukedtveejkeehteeunecuffhomhgrihhnpehmihgtrhhotghhihhprdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvghrughlihhnsehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepsggsrhgviihilhhlohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrt
 ghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Alexander,

On 01/07/2025 at 15:33:28 +02, "A. Sverdlin" <alexander.sverdlin@siemens.co=
m> wrote:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> Having setup time 0 violates tAR, tCLR of some chips, for instance
> TOSHIBA TC58NVG2S3ETAI0 cannot be detected successfully (first ID byte
> being read duplicated, i.e. 98 98 dc 90 15 76 14 03 instead of
> 98 dc 90 15 76 ...).
>
> Atmel Application Notes postulated 1 cycle NRD_SETUP without explanation
> [1], but it looks more appropriate to just calculate setup time properly.
>
> Without the fix we've measured -2ns tAR delay (REn asserted before ALE
> deassert!); with the fix -- 60ns (subject to module clock).
>
> [1] Link: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU3=
2/ApplicationNotes/ApplicationNotes/doc6255.pdf
> Fixes: f9ce2eddf176 ("mtd: nand: atmel: Add ->setup_data_interface() hook=
s")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Please add Cc: stable

> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/n=
and/raw/atmel/nand-controller.c
> index dedcca87defc7..844df72f45063 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1377,14 +1377,25 @@ static int atmel_smc_nand_prepare_smcconf(struct =
atmel_nand *nand,
>  	if (ret)
>  		return ret;
>=20=20
> +	/*
> +	 * Read setup timing depends on the operation done on the NAND:
> +	 *
> +	 * NRD_SETUP =3D max(tAR, tCLR)
> +	 */
> +	timeps =3D max(conf->timings.sdr.tAR_min, conf->timings.sdr.tCLR_min);
> +	ncycles =3D DIV_ROUND_UP(timeps, mckperiodps);
> +	totalcycles +=3D ncycles;
> +	ret =3D atmel_smc_cs_conf_set_setup(smcconf, ATMEL_SMC_NRD_SHIFT,
> +					  ncycles);

Nit as you'll need to resend anyway :), this can be on the previous line.

Otherwise lgtm.

Thanks,
Miqu=C3=A8l
