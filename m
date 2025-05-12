Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2457847B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747038344; cv=none; b=ffCOaRCTq1It357GtQ5ro2PWB7N2sr6JJFslHeZuKPpsuJiLWexM2CSra7I3GgwahADaF3zByGTbmtOPhBouBNViADHgAtIWQ+6QKlwIudzrnS1vH8oVAjAMnk0sYEwrah5lg7KAdIPxUfO1/+Rtck8lL5ztMpd+Tf6rTMqiOW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747038344; c=relaxed/simple;
	bh=l2qcaezvUijlLrPepDLPt+ZkioXMpqZt1fzdlF4KZU4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=huYvTfgqh+HfbK5AoTmbnDOMfvwHzzSrqodDYYBMwlazEvYBPXHkzpz4wCJQPfXlBYzLPdIOsTjW9HElsXJsDTHx28yJZ1dymWcoynEjX/lmcn1MG97oekfOMamwFjI5Ada+o8VzeUTOBaqMSIOBp1jxPrSHhPvVeSk4xUDauII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JSI/NrHB; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JSI/NrHB"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63EE541DF6;
	Mon, 12 May 2025 08:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747038333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2qcaezvUijlLrPepDLPt+ZkioXMpqZt1fzdlF4KZU4=;
	b=JSI/NrHBSE2uOOYf6wgoEo5MwwgbaBwxNA0sEXTud+uUjAxlnaN0jn/9BH9bPaKI++c2nu
	ltcKsBAnJErln2qSlEgCTFhm6l7v+HyVeK/JGP+0SUaHxpFAs6j17RQVdYEHIgz6EHZ/xa
	1sIkGhBhKiTTg7ihvxkxXQJgfkqmdqxZW7UKPMIyTh4EY6YgSTouQ36JmD4dIJnYO3gSro
	/fZAFXJg9yPo0ETiQCWEEUtpDxzQMKV3Ch7ntAwwt1b7ef0/ariqY9uQ78VYtHMXARJJnt
	zSFfK4seEkDsrSESg0q8u7YdmlvtkydqXriGcO9WLrn8KUPRkqM7d3BE9C4wfg==
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
In-Reply-To: <CY5PR11MB6366C40CC20B3519476DD8E2ED892@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Tue, 6 May 2025 11:07:21 +0000")
References: <20250326152623.3897204-1-alexander.usyskin@intel.com>
	<20250326152623.3897204-2-alexander.usyskin@intel.com>
	<87ldrjtj7n.fsf@bootlin.com>
	<CY5PR11MB6366C40CC20B3519476DD8E2ED892@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 10:25:31 +0200
Message-ID: <87h61qnslg.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddtjeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrtghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrt
 ghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com

Hello Alexander,

On 06/05/2025 at 11:07:21 GMT, "Usyskin, Alexander" <alexander.usyskin@inte=
l.com> wrote:

>>=20
>> On 26/03/2025 at 17:26:12 +02, Alexander Usyskin
>> <alexander.usyskin@intel.com> wrote:
>>=20
>> > Create master device without partition when
>> > CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>> >
>> > This streamlines device tree and allows to anchor
>> > runtime power management on master device in all cases.
>> >
>> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>=20
>> Applied to mtd/next. Thanks!
>>=20
>> Miqu=C3=A8l
>
> Thanks a lot!
>
> Miquel, would you pick patches from this series for files that are
> in the mtd tree?
> I can send separate patch series for this.
> In this case the i915/Xe patches can be merged in parallel via Xe
> tree.

I read several times that these patches should go through drm somehow,
so I provided my Ack. I do not think build would be broken if patch 1
goes through mtd and the others through drm anyway, especially since drm
has some structural slowness which means once applied to drm-misc(-next)
they may be part of the main tree a release later (iiuc).

However, I might drop this patch and reapply the one from v9, because I
apparently messed up with the version count. There is no action required
on your side.

Thanks,
Miqu=C3=A8l
