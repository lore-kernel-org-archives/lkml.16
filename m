Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0048A22423F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828884; cv=none; b=gOPU8ZcKC5QOCH20Lg9yLDjkW1tutCR5ic9T8Q/GPHPGuO9TOL97qjt+HHxQ/fXS1ulMc9atQrqTtNikNQD+4iZTwZ4zB9UP2s3Lm8KUu/YDV7iZe8I5aqcpkv+h1dia2vme3vlZpjjpFkMxsKpQcyOGYSaBORsiJsbavyyEJdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828884; c=relaxed/simple;
	bh=TIrX4iOVr8p9Oe1RYGhC6gRPmryUIhl+Oic6wxp+sfA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=YBKGANh0RRzWbzpn/QRdlGZZ5bX1ftl5JTlWDWBJ1uepKUHN+lDCEMcyH9S6VZqmSG6meKoZwm7/WPctMWDKGx5DQjhkog25/gpi6J25MyoSWJkYeMpnZdlaSKNNl01wmGI71dHGWO2TLPlzU4icgkARVtnye4Nhw2lAop1wF+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 57A49294730;
	Wed, 16 Apr 2025 20:41:19 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id sM60Dn9crzIu; Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 92068298566;
	Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IfrJQsT_emOt; Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 66DDC294730;
	Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
Date: Wed, 16 Apr 2025 20:41:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	=?utf-8?Q?Tam=C3=A1s?= Szentendrei <szentendrei.tamas@prolan.hu>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	pratyush <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <81225127.297167214.1744828878236.JavaMail.zimbra@nod.at>
In-Reply-To: <c56c52c0-a824-4ad7-9847-e0e973f811ed@prolan.hu>
References: <20250415180434.513405-1-csokas.bence@prolan.hu> <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org> <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu> <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at> <c56c52c0-a824-4ad7-9847-e0e973f811ed@prolan.hu>
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
Thread-Index: 316iU8/+hGzm5OegdVUSCxd/avO+wg==

----- Urspr=C3=BCngliche Mail -----
> Von: "Cs=C3=B3k=C3=A1s Bence" <csokas.bence@prolan.hu>
>> I'm not so sure whether it makes sense at all.
>> In it's current form, there is no recovery. So anything non-trivial
>> on top of the MTD will just see an -EIO and has to give up.
>> E.g. a filesystem will remount read-only.
>=20
> In our case, we use UBIFS on top of UBI, which in this case chooses
> another eraseblock to hold the data instead, then re-tests (erase+write
> cycles) the one which gave -EIO. Since the bus error is only transient,
> it goes away by this time, and thus UBIFS will recover from this cleanly.

Are you sure about that?

I'd expect UBI to go into RO mode via a call path like:
ubi_eba_write_leb() -> ubi_io_write() -> mtd_write()
If mtd_write() returns an EIO, UBI will go into RO mode immediately.

(I'm assuming, your SPI-NOR has no bad block support, so ubi->bad_allowed
is false).

Thanks,
//richard
