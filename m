Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFB1F1306
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252024; cv=none; b=OvlxqXPr62yTjsFq1KKiO1590VRGFORvIMvcovUF86fqyU625wpeL+ZfPKK4FrVJRcDhXO6ZnCTcu8JRCynCHuNAcaiQrYQb/Y0w03eoa6vSnRG+VbUhFTPIcJRm4bOh31ORx6k734oyBeBCkiUeQFej1xFXbW9qgmB5FFC5wVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252024; c=relaxed/simple;
	bh=VNGjzIqdxM0hPsySERyRHiMNfxA6daMLJ5evfjl4AIM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=daA54A1eL+AevhpA+VeX67Osd1OmMsq3bdb/hJnuU2YcmpJm8YOyhRnDC6rDO3khKZKqQE2DrBqUOrYNDA0zcetTYfw+3Gqeb19AnQFmUPzzcnWtWOGw+iIG+KvKt/Mj88kR5xBUaXR5DV7YpQe2KkYI3cfW5oTveT36Bq5pzsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WuM3B0Wn; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WuM3B0Wn"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C15743A02;
	Mon, 26 May 2025 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748252014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VNGjzIqdxM0hPsySERyRHiMNfxA6daMLJ5evfjl4AIM=;
	b=WuM3B0WnfHNs6ccX6I5aM4nduFC4O/ef01pD5zVPblEaKqtXjlapw/0gR5baNpfAYkzDIL
	wveUSDdjVivY6728+I8ADK374hMzfCZUcnnvc7WHA9SC0ssdvCx7L+4dnyzexbMaM8+kQo
	yAdevjFuAvnBPFjnxrprCeSsZEXWANAcJ9O+AnXMIbG9KlEidi6aLzAwsq5c8PXat0YShs
	E6//lLuVVPyQhknBkNYr8N5jCkx2EGRANwc93nmWybeHPjx5aw8lK0PxJdlWAO5BRPJi5h
	AS7smCvmCOPlbBoUNREJBOCUdA7exaj+DxVsB91EmFOoqDWW6hlL8Zy1d3S31A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez?= Rojas <noltari@gmail.com>
Cc: linux-mtd@lists.infradead.org,  dregan@broadcom.com,
  bcm-kernel-feedback-list@broadcom.com,  florian.fainelli@broadcom.com,
  rafal@milecki.pl,  computersforpeace@gmail.com,  kamal.dasu@broadcom.com,
  dan.beygelman@broadcom.com,  william.zhang@broadcom.com,
  frieder.schrempf@kontron.de,  linux-kernel@vger.kernel.org,
  vigneshr@ti.com,  richard@nod.at,  bbrezillon@kernel.org,
  kdasu.kdev@gmail.com,  jaimeliao.tw@gmail.com,  kilobyte@angband.pl,
  jonas.gorski@gmail.com,  dgcbueu@gmail.com
Subject: Re: [PATCH v5] mtd: rawnand: brcmnand: legacy exec_op implementation
In-Reply-To: <874ix74yrh.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 26
	May 2025 09:28:02 +0200")
References: <20250521080325.581366-1-noltari@gmail.com>
	<87wma74ceh.fsf@bootlin.com>
	<CAKR-sGeUGpUFBf_Zvg=7ro0EpGKy0dQVF58mAQt27YX+79qv1A@mail.gmail.com>
	<874ix74yrh.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 11:33:33 +0200
Message-ID: <871psb1zte.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujedujeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtsehttdertddtredtnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeegueetheejuefhteduueeltdfhtdeludfgleegfeeljefgkeetvdetuddugeelnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpvggttgdrrhgvrggunecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepnhholhhtrghrihesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepughrvghgrghnsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmr
 dgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopegtohhmphhuthgvrhhsfhhorhhpvggrtggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhgrmhgrlhdruggrshhusegsrhhorggutghomhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

>> AFAIK, the legacy functions were only using it for
>> NAND_CMD_SET_FEATURES, which we don't support:
>> https://github.com/torvalds/linux/blob/c86b63b82fde4f96ee94dde827a5f28ff5adeb57/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L1922-L1938
>>
>> The other uses I could find are already covered by our
>> chip->ecc.read/write functions.
>>
>> In any case I've tested the patch for reading, erasing and writing the
>> NAND and so far I haven't found any unsupported error apart from
>> NAND_CMD_GET_FEATURES with a Macronix NAND in the Sercom H500-s
>> (BCM63268).
>> I believe it's used for unlocking the NAND, which isn't needed in that
>> device.
>
> Well, you are restoring an old behavior so I won't ask for a better
> support, but you should normally allow software ECC engines (and even no
> engine at all) and in this case the core will require a write path. I
> honestly think it is not very complex to implement but if someone is
> lacking this feature it can be added later.
>
> Please just fix the braces in the for loop that was reported, but no
> hurry, I'll only take this after -rc1.

Nevermind, I'm applying now. You can send a follow-up patch for -rc1 if
you want.
