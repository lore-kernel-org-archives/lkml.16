Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961B25EFAA
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 09:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043499; cv=none; b=bs00YtfLfbNC36g0FFy1tHEJvpoP0PjVIltheytUei4qS0CefaZj0jotI+YEOzADeqyQNKCdIYA+KoNC0DxH/86GWAc5imo8v2QXlPOy55k3Gws+BrJITilocd1a4wGs/E6u9ILO+76MiE0qDEBz3iRM+KSnpve3H1gXDapyj4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043499; c=relaxed/simple;
	bh=S5shwbLrSs/BeHf8psSSdhDXYgSoCLJx7c3Xwp2Nrxs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Yl2VcRjT+Brto4LdANG/QD0PaNN9foCGRQ43rEXvApVzrZCLvxdXVZmEr6inGgA3EdB+fq8CepzbFqaOTe0WEWfv3Ho0hiejDH5FU5jxHvOt5nK5yWSv1pos94kKL5wW17XdTAweprbAYFx5P9yNDjaqCqrPY0wxAHtagKpmL+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5BEE5294730;
	Mon, 12 May 2025 11:45:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id UIaDJ1vK0JpE; Mon, 12 May 2025 11:45:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0AF27298563;
	Mon, 12 May 2025 11:45:15 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NPwyG4Fo_tZg; Mon, 12 May 2025 11:45:14 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D73EE294730;
	Mon, 12 May 2025 11:45:14 +0200 (CEST)
Date: Mon, 12 May 2025 11:45:14 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <328640247.29680292.1747043114691.JavaMail.zimbra@nod.at>
In-Reply-To: <87frhambri.fsf@bootlin.com>
References: <20250512084033.69718-1-csokas.bence@prolan.hu> <87frhambri.fsf@bootlin.com>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF138 (Linux)/8.8.12_GA_3809)
Thread-Topic: Verify written data in paranoid mode
Thread-Index: eln+2YgBQKlJyCVwub6wSu0FYk52RQ==

----- Urspr=C3=BCngliche Mail -----
> Von: "Miquel Raynal" <miquel.raynal@bootlin.com>
>> +config MTD_PARANOID
>> +=09bool "Read back written data (paranoid mode)"
>> +=09help
>> +=09  This option makes the MTD core read back all data on a write and
>> +=09  report an error if it doesn't match the written data. This can
>> +=09  safeguard against silent bit errors resulting from a faulty Flash,
>> +=09  controller oddities, bus noise etc.
>> +
>> +=09  It is up to the layer above MTD (e.g. the filesystem) to handle
>> +=09  this condition, for example by going read-only to prevent further
>> +=09  data corruption, or to mark a certain region of Flash as bad.
>> +
>> +=09  If you are unsure, select 'n'.

I still have a hard time seeing the benefit of this.
To me it looks like you're working around broken hardware.

Thanks,
//richard
