Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C9F25E448
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749635802; cv=none; b=UZhxJs2ifl7jwTei8NIKn0u9IdipG0SATGf0JjMTkA94zve2djTTtlFXgW9fkad4++Jy923IbIy1yi/ECyupH/n0Ep9FE7iSmFpdd4i6H81R5cNxYV7oXAJCKAqoi+n8sWXdgBCioltFsk9w+9I4osk3rSTZKhX5nt7zmxHkGwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749635802; c=relaxed/simple;
	bh=dTWVYcBwptCdDBnF3kGmXjZmZTDyF4Frz+J6o+FH2MA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IHRIdl1Vvxwlmd6iySp48lak6WzNOnkvI82tMP+DqYkaSvLvnTEeh2fLtpNEBHbM+YjdHk8OidBh/9DRv7W/iF+JuU3VA5VtD//ZlZG2rOCVEY8Wr2zhjBd+7qx+5DVKOYZM1DQaTiAFB+YBls2ajYr+JcBPkRytuDE2+Iz+cko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lvwelx4k; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lvwelx4k"
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [IPv6:2001:4b98:dc4:8::236])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 58A0B580985
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:34:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F5F043892;
	Wed, 11 Jun 2025 09:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749634467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTWVYcBwptCdDBnF3kGmXjZmZTDyF4Frz+J6o+FH2MA=;
	b=lvwelx4kVGW22Z4IvdtLWkF3fN2blgoJPRxQOY3wdzY/CH7Q/4PPHRwf3I3eeiOvInNLLm
	lx5EWeemSQaEK6K+gyrHSocE852TsxYM1RAyPtQ1Q/CX+BBB+pyGZbsLzgh/H+cdRSOcyj
	GiLrUfiWQDI6Fxj3ZdcukmRhRKMAmVh2W8fG4MqSwKX0h/XGen9CK1h0X0xEmbTZxCD0i6
	RVFjX+gznOqxAnIaLbvbfSJ0n6A/uHVszsZ/jAq1oWSDRbotgFnUJ0LZEjk8FyZMyI29fz
	VSp6WxG4MfGhU7gdxoqrqqRhGRlUr7c3tmB6UePCDNSgZy31zn2t4PX0uUxNlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Weinberger <richard@nod.at>,  Alexander Usyskin
 <alexander.usyskin@intel.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr?=
 =?utf-8?Q?=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  Rodrigo Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Tvrtko Ursulin <tursulin@ursulin.net>,
  Karthik Poosa <karthik.poosa@intel.com>,  Reuven Abliyev
 <reuven.abliyev@intel.com>,  Oren Weil <oren.jer.weil@intel.com>,
  linux-mtd <linux-mtd@lists.infradead.org>,  DRI mailing list
 <dri-devel@lists.freedesktop.org>,  intel-gfx
 <intel-gfx@lists.freedesktop.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
In-Reply-To: <c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net> (Guenter
	Roeck's message of "Tue, 10 Jun 2025 09:15:25 -0700")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
	<87ikl5xnbc.fsf@bootlin.com>
	<CY5PR11MB63660CFA966BCA1B44528BB1ED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<4d55ac06-c357-4d78-b8b8-5b26486ce529@roeck-us.net>
	<CY5PR11MB63662D21B2C7B1A1C2E6BC4BED6BA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<2e5ebbdd-2a57-4f1f-85c6-7c2dff127b50@roeck-us.net>
	<1176847729.134356549.1749504429656.JavaMail.zimbra@nod.at>
	<CY5PR11MB6366B2B40E0C357D6C0935C2ED6AA@CY5PR11MB6366.namprd11.prod.outlook.com>
	<130790886.134361099.1749560056731.JavaMail.zimbra@nod.at>
	<c90c8bad-9c7a-4bf7-8282-ebefebba90a3@roeck-us.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 11 Jun 2025 11:34:25 +0200
Message-ID: <877c1ivcym.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduvddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddvpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtoheprghlvgigrghnuggvrhdruhhshihskhhinhesihhnthgvlhdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepthhhohhmr
 ghsrdhhvghllhhsthhrohhmsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh

On 10/06/2025 at 09:15:25 -07, Guenter Roeck <linux@roeck-us.net> wrote:

> On 6/10/25 05:54, Richard Weinberger wrote:
>> ----- Urspr=C3=BCngliche Mail -----
>>> Von: "Alexander Usyskin" <alexander.usyskin@intel.com>
>>> Richard, I've reproduced your setup (modulo that I must load mtdram man=
ually)
>>> and patch provided in this thread helps to fix the issue.
>>> Can you apply and confirm?
>> Yes, it fixes the issue here! :-)
>>=20
>
> It doesn't seem to fix the issue if the partition data is in
> devicetree.

I had a look at the patch again. The whole mtd core makes assumptions on
parenting, which is totally changed with this patch. There are so many
creative ways this can break, I don't believe we are going to continue
this route. I propose to revert the patch entirely for now. We need to
find another approach, I'm sorry.

Alexander, can you please remind me what was your initial problem? I
believe you needed to anchor runtime PM on the master device. Can you
please elaborate again? Why taking the controller as source (the
default, before your change) did not work? Also why was selecting
MTD_PARTITIONED_MASTER not an option for you? I'm trying to get to the
root of this change again, so we can find a solution fixing "the world"
(fast) and in a second time a way to address your problem.

Thanks,
Miqu=C3=A8l
