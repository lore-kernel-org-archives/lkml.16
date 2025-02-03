Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5981F94D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 08:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738571548; cv=none; b=INlsbcpzNjCyt4LIU1xF1SkUxdGIsCazWt7ArH1Ch1t+H8G6TICdR7h/5MeqKCaDI1+OihJoXlHY8vqQJkZXCaOxmOZtz17p12l+tPMoCypk/XkMkE0SeKG9+r2ObJIPClCoG6sblG3+BD6XboWHyUl4Oegnita28gf75de9r1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738571548; c=relaxed/simple;
	bh=f4aCXPSXSi7l8A+rj61Aw+fWt3FEU8nBtN15GowRZaM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oCsSNgO9CuQQHhk76zqWhlFYhjUDIg1PQyYG57aIQTuWBX6CCKInC23s7brKRBAgW2bee+oXKgo4EX2SEI5h52ZPBgaQtLMuHy5Dxqdzs5xOO5p5pv7YcvkKUlxnfOLnkSh+NbbqMr5TaptJTDC4oSxBYdGsfHdEAZ7Uj1hA//c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RRLxeaa9; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RRLxeaa9"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D157E442DA;
	Mon,  3 Feb 2025 08:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738571538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Z+RDbiHqCFhfJq8P1RIqpEAdpRuAUP5aDcHfXI4AB8=;
	b=RRLxeaa9XOyXSAbOIsJ2MP1Ljw9F/Nxhqi6hQW2NcFbRLlta/RFiMCmdJT6ligIzAZxNsH
	j0U0SkE7Uos21jkvYdsAl2LF8fO7D22p0V4SmkfxWi6lXHCAcLL/bCqaYacCiIhsNnBVwO
	StPQ/r32tSeFrfKh79b90ghiPgzVciUI5Nmq5qFA5EYoBCT+9o9zGrEO165HVy2+f3+PIJ
	9AeSr8/2r653L1rYRVH23enVBw0kfkCNBi7AbyMA+AIFTAqqtoAbuXG+lIQjSM/PFvjpNR
	QHct/ioFJPNZBEg+o7nQDz2FfPXs7kjsdhYf38un0lQutEZxxNRpiMR5kLzI1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  gmpy.liaowx@gmail.com,
  kees@kernel.org,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Add check for kcalloc()
In-Reply-To: <20250202205456.40790-1-jiashengjiangcool@gmail.com> (Jiasheng
	Jiang's message of "Sun, 2 Feb 2025 20:54:56 +0000")
References: <20250202205456.40790-1-jiashengjiangcool@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Feb 2025 09:32:15 +0100
Message-ID: <87tt9bxwc0.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddvtdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvtdehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepjhhirghshhgvnhhgjhhirghnghgtohholhesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepghhmphihrdhlihgrohifgiesghhmrghilhdrtghomhdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrg
 hdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com

On 02/02/2025 at 20:54:56 GMT, Jiasheng Jiang <jiashengjiangcool@gmail.com>=
 wrote:

> Add a check for kcalloc() and print an error message if it fails.

Checking, yes, but logging, no. IIRC the core does it already if required.

> Fixes: 78c08247b9d3 ("mtd: Support kmsg dumper based on pstore/blk")

Cc: stable is missing

> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
>  drivers/mtd/mtdpstore.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
> index 7ac8ac901306..368997155c07 100644
> --- a/drivers/mtd/mtdpstore.c
> +++ b/drivers/mtd/mtdpstore.c
> @@ -423,6 +423,11 @@ static void mtdpstore_notify_add(struct mtd_info *mt=
d)
>  	longcnt =3D BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
>  	cxt->badmap =3D kcalloc(longcnt, sizeof(long), GFP_KERNEL);
>=20=20
> +	if (!cxt->rmmap || !cxt->usedmap || !cxt->badmap) {
> +		dev_err(&mtd->dev, "failed to allocate memory for map\n");
> +		return;
> +	}
> +
>  	/* just support dmesg right now */
>  	cxt->dev.flags =3D PSTORE_FLAGS_DMESG;
>  	cxt->dev.zone.read =3D mtdpstore_read;

What if register_pstore_device() fails? Your only partially fixing the
problem if you don't handle the free()s there as well.

Thanks,
Miqu=C3=A8l
