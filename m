Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B051F4619
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 10:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676565; cv=none; b=XTXmMcqVU67HuI2ONPukllTjt86B7jugKsBoMgr44Z6oJ6oeezmfShvNA/CB66WMn0QdpRZ5WxOu6wzE7i1Ebv1Lr4U1qVcTOK/URivMlYe4BUCv12fPszSlZBgpuu5zHP22TFtdbfXoeT+pow9ovfV5Wf+mTJP3Q/nP+LKpGK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676565; c=relaxed/simple;
	bh=SVyRMOvqShyxvUphmfhBMzGZZWRZbGF7mY8qX+pxA+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pn4Ylkm5bTkQlGu6Itwzid2KpSjg1k+7R1pMAAUJwl9X/QYCUrT6/ic6gJ+y4f3cvBK9TrXVGKriiW3Jhz3fEqUzXJ+webnJMwJy7QDvb0+kU8o6+O7qZ+pQz5NDxUCG9vTYXE7Tv09vV1ZXAQVH1U2+EU2J2fqNiYbCUrtvDmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C20eoSCK; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C20eoSCK"
Received: by mail.gandi.net (Postfix) with ESMTPSA id E06E5432ED;
	Thu,  3 Apr 2025 10:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743676555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WHybtPrEE+zi5o3ljeKTwzS5wA2OXV70yRBDLljR35w=;
	b=C20eoSCK8YmsgFGWX7ymeJwf/cLoORxjYSJC+1tfnDfd6nDamJk+Oh94R6Anjcy5qeoT6K
	GpQS9iZYBRVH3/w7MegRlNwob+XJcbtO7+C9j75LwbdhYOnmZcecIyrdosCk6HTRIQly1p
	X9yX+5tVhSfetuDHT7VUtMQ1rgIXsQKHUO5tIZsV4KfTMiUw7yyLb+G71xEc9206GwwxE9
	ZPydJJuV5LIca/fmpNOfmJPH8awDgwdEmk8mB/eiLu2sk/91cFUvLf7A5TMXLvzeUwvy7q
	kTx2+XKI0TnZHn/cfTSbO1sxUHAq0i14giWgkTTzTwCjuirjbfCfNqyge67hYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 19/19] mtd: spinand: winbond: Add support for
 W35N02JW and W35N04JW chips
In-Reply-To: <05c0fc18-f50f-4f62-bc64-a297cbf927fd@linaro.org> (Tudor
	Ambarus's message of "Thu, 3 Apr 2025 11:13:36 +0100")
References: <20250403-winbond-6-14-rc1-octal-v2-0-7846bd88fe83@bootlin.com>
	<20250403-winbond-6-14-rc1-octal-v2-19-7846bd88fe83@bootlin.com>
	<05c0fc18-f50f-4f62-bc64-a297cbf927fd@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 03 Apr 2025 12:35:51 +0200
Message-ID: <875xjl352w.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekfeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeeftdefledvieegvdejlefgleegjefhgfeuleevgfdtjeehudffhedvheegueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeelvddrudekgedruddutddrudelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrudelledphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehsqdhkieesthhirdgtohhmpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopehmihgthhgrvghlseifrghllhgvrdgttgdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsthhlihhnvdesfihinhgsohhnugdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

On 03/04/2025 at 11:13:36 +01, Tudor Ambarus <tudor.ambarus@linaro.org> wro=
te:

> Hi, Miquel,
>
> On 4/3/25 10:19 AM, Miquel Raynal wrote:
>> These chips support single SPI, octal SPI and octal DDR SPI.
>>=20
>> For now, only the SDR protocols are supported.
>>=20
>> Tested with the W35N02JW variant, but the 04 one just has twice more
>> dies and is described in the same datasheet, so we can reasonably expect
>> that it will behave identically.
>>=20
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Checked patches 15-19 now, I'm ok with them. When applying, please
> substitute my Reviewed-by tag with Acked-by for patches from 7 to 21.
> I explained why in the reply of v2 14/19. Thanks.

Duly noted.

I checked the b4 log, I don't understand why it picked your R-by tag on
all these commits:

$ b4 trailers -Su
Finding code-review trailers for 22 commits...
Checking change-id "20250214-winbond-6-14-rc1-octal-6f7db6be0204"
Grabbing search results from lore.kernel.org
Analyzing 52 code-review messages
---
  + Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
    https://lore.kernel.org/all/cdc38266-18a9-4eff-bdad-c88b316310b3@linaro=
.org
  + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
    https://lore.kernel.org/all/4d36e51f-323c-451c-afeb-a6e378e3ed53@linaro=
.org
---
Press Enter to apply these trailers or Ctrl-C to abort
  mtd: spinand: Use more specific naming for the (dual output) read from ca=
che ops
    + Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=93 DKIM/li=
naro.org)
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: Use more specific naming for the (dual IO) read from cache =
ops
    + Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=93 DKIM/li=
naro.org)
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: Use more specific naming for the (quad output) read from ca=
che ops
    + Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=93 DKIM/li=
naro.org)
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: Use more specific naming for the (quad IO) read from cache =
ops
    + Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=93 DKIM/li=
naro.org)
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: Use more specific naming for the program execution op
    + Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=93 DKIM/li=
naro.org)
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: Use more specific naming for the (single) program load op
    + Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=93 DKIM/li=
naro.org)
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: Use more specific naming for the (quad) program load op
    + Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=93 DKIM/li=
naro.org)
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: winbond: Rename DTR variants
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: winbond: Add support for W35N01JW in single mode
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: Define octal read from cache operations
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: winbond: Add octal read support
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: Define octal load to cache operations
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: winbond: Add octal program support
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
  mtd: spinand: winbond: Add support for W35N02JW and W35N04JW chips
    + Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org> (=E2=9C=97 DKIM=
/linaro.org)
---
Invoking git-filter-repo to update trailers.
New history written in 0.17 seconds...
Completely finished after 0.38 seconds.
Trailers updated.


Thanks,
Miqu=C3=A8l
