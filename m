Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1924B2550D0
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037174; cv=none; b=urqb+TASprqczsouIRA43bRxO1Nwn59rGX/Cc7AmU1hYosAQAMKXmIPNO+z6nnYde3TmFDra0c1OmIGr8xF+ngAc8PZKcIhumoXaVCs2YMkWIQrP+nAGS2ybUZGcSY4FXkMH9SWFRbAzbo8zN8Y6/Sq7DUxpFvukQVZu+yNQD0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037174; c=relaxed/simple;
	bh=6Su+FdicuB1s+k4L4UfGamlUmXpW8bfoAArRyOv9WYE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JLzTBrDyO/GRnFxK1yYoozaPgJEikaXgFkpRuAc0X/On5RLAx7hv89LSJQ24RWfDt2Mhn+RBeAXWjgszuaSmUGrCx4s+xBgMjCDhUWz+kSF76lLWX9b1eOXhmrzA7Io0dJ9zIZRtcZmR+ip0stO5O5Xb8MGkTOyZ3tAWeqH/BF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TTQW3nRR; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TTQW3nRR"
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAEBD43A1F;
	Mon, 12 May 2025 08:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747037170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6k5IQ2owltrUjGvtqvStBVaUUNElR1qEISLexeVmvd0=;
	b=TTQW3nRRZYp7iyLU9B8gPDNQaOO0O+l6dtCt7l1TIU0xGoudYxkE88nL9oXKRiO+M8H8Gj
	C8WmsPlMTbw9XF3re3XQJ1xkBV51F3GwV4M3SpoyPHLYryIUY5OW9cmbbqtRuUc0L0ALr/
	I6iDbqta73W8+oMJ+KkduZsXLWx+Ha4Y1MZkEzL5s9gW0ZvKAANDZcdr4LB4hW3fnSvfJO
	IX+WaY3cJOO4XcuDFYG4cWl8cxs55NSdygup1jZ6929Ioi+YksbMTfar9hxC+lvoJPQcC/
	LBtG/V5qKlQxPLgsxkPqRGgNvfua0tIiG+tfROgRH6ugTBGy/CZ242/+HFNZJw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bence =?utf-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>
Cc: <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  =?utf-8?B?Q3PDs2vDoXMs?=  "Michael Walle" <mwalle@kernel.org>,  Richard
 Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: Verify written data in paranoid mode
In-Reply-To: <20250508183733.514124-3-csokas.bence@prolan.hu> ("Bence
	=?utf-8?B?Q3PDs2vDoXMiJ3M=?= message of "Thu, 8 May 2025 20:37:34 +0200")
References: <20250508183733.514124-3-csokas.bence@prolan.hu>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 10:06:09 +0200
Message-ID: <874ixqp826.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptghsohhkrghsrdgsvghntggvsehprhholhgrnhdrhhhupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtp
 dhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

On 08/05/2025 at 20:37:34 +02, Bence Cs=C3=B3k=C3=A1s <csokas.bence@prolan.=
hu> wrote:

> From: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
>
> Add MTD_PARANOID config option for verifying all written data to prevent
> silent bit errors being undetected, at the cost of some bandwidth overhea=
d.
>
> Signed-off-by: Cs=C3=B3k=C3=A1s, Bence <csokas.bence@prolan.hu>
> ---

...

> +int mtd_write_oob(struct mtd_info *mtd, loff_t to,
> +		  struct mtd_oob_ops *ops)
> +{
> +	int ret =3D _mtd_write_oob(mtd, to, ops);
> +
> +#if IS_ENABLED(CONFIG_MTD_PARANOID)
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D _mtd_verify(mtd, to, ops->retlen, ops->datbuf);
> +#endif // CONFIG_MTD_PARANOID
> +	return ret;
> +}

I'd prefer to extend mtd_write_oob() with a simple

    if (IS_ENABLED(CONFIG_MTD_PARANOID))
            mtd_verify();

It will also likely solve the kernel test robot report.

Thanks,
Miqu=C3=A8l
