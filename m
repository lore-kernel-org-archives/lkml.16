Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6F71367
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809443; cv=none; b=FcT8zYXpzs1L3twNyMs7EcIMBjRnkPRTKX58sL9gTnbNVLGSwC0AItKuOu/tE2B5yZVklKY+nben98/dzdwnssnumOe06b2mIQZjXSp2gBA6oik1NvWeVV6CI9zvGiln8KqjFpHy2kk1STLhYOylirE0rcfwte9WqLvL9iWS3VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809443; c=relaxed/simple;
	bh=eEQyWOwpQcKlBy3G/4Du62DyNtQujjB6ykj5fhh6QwQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=RpNAF4PMyP+6xAX32LEX6Frbi43SP8lGzr6+gxdb3rUjizKxE8wCL+MEVAh+5CJeG090rI1QlkHpKfhYBc8XUUD4UZUp096s0rXLQvc0ISDB5QH7lnzeGounL9oYjWQF60khJp4T/3TRVeOlg5AyuSTCQDzqJOleLaFuIZHVMR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C482E294730;
	Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vqjfnlm228wd; Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 67B63298566;
	Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id u3ActQa5Oaya; Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3E1EB294730;
	Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Date: Wed, 16 Apr 2025 15:09:03 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	=?utf-8?Q?Szentendrei=2C_Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	pratyush <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at>
In-Reply-To: <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
References: <20250415180434.513405-1-csokas.bence@prolan.hu> <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org> <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
Subject: Re: [PATCH] spi-nor: Verify written data in paranoid mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF136 (Linux)/8.8.12_GA_3809)
Thread-Topic: spi-nor: Verify written data in paranoid mode
Thread-Index: 93VulI8MDViHseErL85xPb6FAYhpBQ==

----- Urspr=C3=BCngliche Mail -----
> Von: "Cs=C3=B3k=C3=A1s Bence" <csokas.bence@prolan.hu>
>>> Add MTD_SPI_NOR_PARANOID config option for verifying all written data t=
o
>>> prevent silent bit errors to be undetected, at the cost of halving SPI
>>> bandwidth.
>>=20
>> What is the use case for this? Why is it specific to SPI-NOR
>> flashes? Or should it rather be an MTD "feature". I'm not sure
>> whether this is the right way to do it, thus I'd love to hear more
>> about the background story to this.
>=20
> Well, our case is quite specific, but we wanted to provide a general
> solution for upstream. In our case we have a component in the data path
> that can cause a burst bit error, on average after about a hundred
> megabytes written.

Hmm. So, there is a serve hardware issue you're working around.

> We _could_ make it MTD-wide, in our case we only have a NOR Flash
> onboard so this is where we added it. If it were in the MTD core, where
> would it make sense?

I'm not so sure whether it makes sense at all.
In it's current form, there is no recovery. So anything non-trivial
on top of the MTD will just see an -EIO and has to give up.
E.g. a filesystem will remount read-only.

Thanks,
//richard
