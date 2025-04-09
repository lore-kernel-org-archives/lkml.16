Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4360E1DC991
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192803; cv=none; b=XNj5NUxI4w5Vco+RbP42MeTCA7UI6QGLQp9pmFkrSlxyKqi9436KVnv+6igU/7rMgK2zln0pP1Obz5jaW2+7whXGWYMW7GiIGYiVRY863dCs3gZWUd7XwC7oU4kKseTgo0X8hM0WtuYTgudJurJxQxLHHoALJVMSpKahMiEgxS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192803; c=relaxed/simple;
	bh=JbConos7mjcfP3FYJsI0LP/QcnEV6gac33lIOBxoVwo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B+97v92e39fcqLVnejkb/3n4EceUmqVMiF0qykP4j0NpEwIbT2somMe82HC4qmW8M6Jmn4I1qd5w5Y0bQgmh+YWaBhxOiBZP5LGaleurrp4EWrpQG4xjyb2jOZlr2jRaFSydJT+rJ7wYeFqInBZyLo2s3JWa5MIF67bUG6Biqx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NuefhDuZ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NuefhDuZ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90F6344387;
	Wed,  9 Apr 2025 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744192799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JbConos7mjcfP3FYJsI0LP/QcnEV6gac33lIOBxoVwo=;
	b=NuefhDuZ58M7ukgd0rEHcn7PjJC6ysu1fg9mQd0y0l0GoJcRc/078oc/pL16kVQZDXAEH4
	D8QtJCGqZF7lR9IOWpc46o2qMi+21f+63j2e2draKsgyvACU6QCOSvH2jXUGyJl8itCr1W
	dVJdNr0h07DqUE4ZKLboyDk7vqdVGbp/znB7aQ6Nsa2o3dIeAEmfwS/gOx+iaKLOwjWpmB
	00NL2c2kGo/gjhC4+NU5sgSjPj6KTXzlQmnnoddnqnP8kGNcij5LYTF5jmkv7jskxYoWvI
	D7XmkCKtDHwAD5Zf98ReHNfTeIO530Z8Spx76f1JoETuMuJtG29Jyw4zWku5NQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "De Marchi, Lucas" <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  "Vivi,
 Rodrigo"
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  "Poosa, Karthik" <karthik.poosa@intel.com>,  "Abliyev, Reuven"
 <reuven.abliyev@intel.com>,  "Weil, Oren jer" <oren.jer.weil@intel.com>,
  "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
  "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
  "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 01/12] mtd: core: always create master device
In-Reply-To: <CY5PR11MB63661044DCB37577A12B5DF9EDAA2@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Mon, 7 Apr 2025 12:47:07 +0000")
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
	<20250326152623.3897204-2-alexander.usyskin@intel.com>
	<87ecycrko4.fsf@bootlin.com>
	<CY5PR11MB63661044DCB37577A12B5DF9EDAA2@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 11:59:57 +0200
Message-ID: <87zfgpejtu.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehjedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepvddttddumeekiedumedvtdgtfeemsggufhdtmegvgehftdemfhejudhfmehfsggrvdemkegufhejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumedvtdgtfeemsggufhdtmegvgehftdemfhejudhfmehfsggrvdemkegufhejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrt
 ghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello,

> The mtd_master is completely different class to avoid mtd tree disturbanc=
es.
> It is real kernel device object, I'm not sure how we can do 'link to'
> magic here.

Maybe we can add that later if someone needs.

> About MTD_PARTITIONED_MASTER - we can treat it as another partition and=20
> create master device plus whole device partition as it's child with all o=
ther
> partitions as children of master device.
> For unpartitioned device this mean that we create master device and parti=
tion
> regardless of MTD_PARTITIONED_MASTER flag.

I am not sure I follow you. I am proposing to create the mtd_master
device in all cases. I believe this is the future-proof approach. Can
you make this change?

Regarding the hierarchy, I indeed agree with what you propose:
mtd_master parent of whole partition device (if any) parent of
partitions.

Thanks,
Miqu=C3=A8l
