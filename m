Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5250322FF37
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 10:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.167.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749723936; cv=none; b=HNrjz9TQSwtfzSKa4m5QNtxZeThLhQXwEgDkVeml954rJuhCSTULN1PoiMG8iJET3A8F2C77rSZCsCmLOnG5WMh7S5bfS7Ik4lK321FBDYt12jT3LLYsHOwtvuS574neFHeRpCF8Z2gen0VsMEBYRgVFvkC/LcJutKZ2readfqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749723936; c=relaxed/simple;
	bh=N5uh8KFkbrv+6Af3XcZHWYTGd/ZBd99yZKZLJTjY3OQ=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ovegd0IHbzJ7W1yLdn/SaanExO5wDJTXvTc8aI7jJkBymAeyyXUBG3X96dPywntA0fNY2QxgbZ2WDw4jF2sdP0wJN6aAKwbmJnpsLguk432l+bQThrj/fvWEgkXck8J7NpOCss1oq0dpxk/4SSZIiv2qzPVNLoxUo4KpbQNIdN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=fail smtp.mailfrom=nod.at; arc=none smtp.client-ip=116.203.167.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nod.at
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B2C8929473A;
	Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Xj8l1EkZv1wk; Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5326B298565;
	Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NFts6TOxXvra; Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1AD3329473A;
	Thu, 12 Jun 2025 12:25:31 +0200 (CEST)
Date: Thu, 12 Jun 2025 12:25:30 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Guenter Roeck <linux@roeck-us.net>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, 
	Karthik Poosa <karthik.poosa@intel.com>, 
	Reuven Abliyev <reuven.abliyev@intel.com>, 
	Oren Weil <oren.jer.weil@intel.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	DRI mailing list <dri-devel@lists.freedesktop.org>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1466250376.134375386.1749723930972.JavaMail.zimbra@nod.at>
In-Reply-To: <CY5PR11MB6366DA38B20B29C1662BDC76ED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250302140921.504304-1-alexander.usyskin@intel.com> <130790886.134361099.1749560056731.JavaMail.zimbra@nod.at> <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net> <877c1ivcym.fsf@bootlin.com> <1612313571.134371311.1749637592940.JavaMail.zimbra@nod.at> <CY5PR11MB636692EFD9BB99B6F2D959BFED75A@CY5PR11MB6366.namprd11.prod.outlook.com> <87y0tytjmj.fsf@bootlin.com> <CY5PR11MB6366DA38B20B29C1662BDC76ED74A@CY5PR11MB6366.namprd11.prod.outlook.com>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF139 (Linux)/8.8.12_GA_3809)
Thread-Topic: core: always create master device
Thread-Index: AQHbi35N9ptLZMK+/0+KHmcJoUKk0bP5FNKAgABXSdCAANahSoAAWdKAgACSaAOAACUigIAAFAQAgAAhxhCAAAxMAIAAXViAgADet1B87pkdB/wY57yAgAEiYbGAAA56AIAABaLggABFNgOAATvKgCORNoJK

----- Urspr=C3=BCngliche Mail -----
> Von: "Alexander Usyskin" <alexander.usyskin@intel.com>
> In general, it is fine for me - we have parent mtd initialized and partic=
ipating
> in power management.
>=20
> I can't see how to bend idr_alloc to allocate from the end and corner cas=
e
> of full idr range is also will be problematic.

I expected it to work because we can track the highest mtd ID and pass limi=
ts
to idr_alloc(), no?

Thanks,
//richard
