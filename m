Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA2339A1
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519650; cv=none; b=o5He4MjHMV3J3VgXL4aGiJvl0vJB9V23ufKGoCN6zPuxlLwyk427rN7sSTPYPph4umzOctCFAAa9lloLYu1DOHjFAOsfQLXzwtANDKOJ4KCWqH3rnJhsx2vpw+6W4gWYW0KqVmN7yOS3sTb8qkwImCzqT/hxzkcdBZcXEJdPO+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519650; c=relaxed/simple;
	bh=z6SUzGcMkPKel2Eccn/jYaKzkfn5nDr4VwnUJsYHcl0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Qj/ialVwYoar1HvzSZ8Bitq/Dxnkde0iNXUVyPRlMDCDRO1SGaUY7ubA2OxXfAuuPRxcYUf2ziKQ+SvFuYy0IhRJiJtR0hIaGdHzbgyVjwDoVKB/xRrQ51jfwBcKMI6/ZGaXM0GoI5742VfSRzkvgcGrSUveaoUabOx+bAyT9HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GMFYHBDm; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GMFYHBDm"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 921F5441C8;
	Tue,  1 Apr 2025 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743519646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6SUzGcMkPKel2Eccn/jYaKzkfn5nDr4VwnUJsYHcl0=;
	b=GMFYHBDmkQqPnwkmOAvUpfp7X/+LmL7dcjdsCjsTdJynnH4itkSn1hQxCz5+SCHo1uaclf
	DhgtZjY4wTeHh3eozM/vo5clyziidRAKCKFpzukdJ18oiayB6OHyD0IAd2+Luv1CSMp1gD
	zY/JN/ez/OxbyQY0KoB1rJxDH4cgB5kVBny+R9Xqxu+BqgxnjIxQ7QpvHp8Jrrz21EIWBv
	8JOX6UARWLuysU9uR3cJezATqmPZbdx1VtrBi/dHC/aKYZWjiGqymqvGJBV9Qw7YGDO25i
	GAc2Rla0P/hRZ+f7DASVPsS87VlZylgntjN5l/aSlpNhYftOGqddTvQHiMmsfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  Karthik Poosa <karthik.poosa@intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Oren Weil <oren.jer.weil@intel.com>,
  linux-mtd@lists.infradead.org,  dri-devel@lists.freedesktop.org,
  intel-gfx@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 01/12] mtd: core: always create master device
In-Reply-To: <20250326152623.3897204-2-alexander.usyskin@intel.com> (Alexander
	Usyskin's message of "Wed, 26 Mar 2025 17:26:12 +0200")
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
	<20250326152623.3897204-2-alexander.usyskin@intel.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 01 Apr 2025 17:00:43 +0200
Message-ID: <87ecycrko4.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeftdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrdduuddtrdduleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduleefpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvl
 hdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Alexander,

On 26/03/2025 at 17:26:12 +02, Alexander Usyskin <alexander.usyskin@intel.c=
om> wrote:

> Create master device without partition when
> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>
> This streamlines device tree and allows to anchor
> runtime power management on master device in all cases.
>
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

I successfully tested it, this patch will be applied at -rc1 to the
mtd/next tree.

I was wondering, do you think it would be possible to keep the creation
of mtd_master and make it a symbolic link to mtdx when
MTD_PARTITIONED_MASTER=3Dy or when there is no partition? In short, always
having mtd_masterx, because I fear at some point we'll have problems
otherwise :-)

Right now we have:

- Without partition:
mtd0 (mtd0ro mtdblock0)
- With partition and MTD_PARTITIONED_MASTER=3Dn
mtd0 (mtd0ro mtdblock0)
mtd_master0
- With partition and MTD_PARTITIONED_MASTER=3Dy
mtd0 (mtd0ro mtdblock0) [this is the master]
mtd1 (mtd1ro mtdblock1)

I am suggesting:
- Without partition:
mtd0 (mtd0ro mtdblock0)
mtd_master0 -> link to mtd0
- With partition and MTD_PARTITIONED_MASTER=3Dn
mtd0 (mtd0ro mtdblock0)
mtd_master0
- With partition and MTD_PARTITIONED_MASTER=3Dy
mtd0 (mtd0ro mtdblock0) [this is the master]
mtd1 (mtd1ro mtdblock1)
mtd_master0 -> link to mtd0

What do you think? Or maybe even always mtd_master in the first place.

Richard, your point of view on this?

Thanks,
Miqu=C3=A8l
