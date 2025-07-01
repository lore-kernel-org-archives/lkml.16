Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3021D5BC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374303; cv=none; b=jm5Ap1cxcQLQg7UjMKK7VP8cMt0WzKflTpHS1DnJr7SymEm2ybkEnqFBKnNp/evC+WdXjoxCP2N7rzcjak+4h4F6zcWzi4d29kjzPScFXUhbjSMT04l4DRzhWro1YLI9TwbXsi+jWYTyE2WVYMM/yJ/s55IvfIjhNVVgESD0kCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374303; c=relaxed/simple;
	bh=c+4c+g5QJfhyC+UXQix6d3ko58wc2ZtIIOw1DxZ0qcM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lELwg5RJkfZcZ2PaOGfHlsDS15CBRyIPausHsew2tl2tba+x/YQOrXM0tfShyJwFZKKdTgJ+C6QX4pwHFtzEY5CwLgG2QPDvlviZf90zAqE2lw/kw6GpU8PqzKkN5dyJTlUJiEUSxFKSunp0X1zR9beC1XN10898PR5rxbDDQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cwbNa/ul; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cwbNa/ul"
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2F154424C;
	Tue,  1 Jul 2025 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751374293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+4c+g5QJfhyC+UXQix6d3ko58wc2ZtIIOw1DxZ0qcM=;
	b=cwbNa/ulZeyBqE/Afx6KxKecnKJXH6g0zoZYET/B6cuUD+qx84sK+owpBM6wUTtCB8kxWL
	7xFDF7Tow7WgtB6WD6lJaibV98kgtmzh6hBp7t+w9VSUiqISPaNGKOcW48eKThTfEUrViP
	ME79fVcszUk2/wJ8oASxs1xSrsop9FX1it1/+D9aKBmwbtSFbxKT9Vh/avEnx66zA7cpYf
	M+bDikFmx4P/K6qiYempyctg2+SGVGwV9r7QRkCLZUl7M0MHR3U5iV0yaoR6fZz04j5kmB
	U5enoet4yQe41GfIFtTt54LKZuZEWw7zesYyesxZlvdLLvSZNjw2GYyj7agUEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Alexander Dahl <ada@thorsis.com>,  Boris
 Brezillon <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: Fix dma_mapping_error() address
In-Reply-To: <20250701114427.24910-2-fourier.thomas@gmail.com> (Thomas
	Fourier's message of "Tue, 1 Jul 2025 13:44:23 +0200")
References: <20250701114427.24910-2-fourier.thomas@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 01 Jul 2025 14:51:31 +0200
Message-ID: <878ql8qdkc.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeehkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepfhhouhhrihgvrhdrthhhohhmrghssehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpr
 hgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehurdhklhgvihhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopegruggrsehthhhorhhsihhsrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Thomas,

Thanks for the patch!

On 01/07/2025 at 13:44:23 +02, Thomas Fourier <fourier.thomas@gmail.com> wr=
ote:

The subject prefix should be 'mtd: rawnand: atmel:'

> It seems like what was intended is to test if the dma_map of the
> previous line failed but the wrong dma address was passed.
>
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand
> driver")

Missing:

Cc: stable@vger.kernel.org

> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---

Otherwise looks good to me!

Thanks,
Miqu=C3=A8l
