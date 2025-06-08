Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E312194137
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749411481; cv=none; b=MtYo4eJkdkxIsGffVsoVCfnktlGae+YRtlhjbk6srrSvJqVMf3vJaoyGt5cXd1oE7zrIrvfxepYlY17CitjgOwtcdaqe+a/ddjR5q/dgY2+dnCb/QHyaEHjpIv2Cb5nxaH9+DH2fonUyVuMlZWN0SxGBmhMcKTIeBLoG+sqJBFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749411481; c=relaxed/simple;
	bh=d0C38mLCm+B9BYKlJOfWEN5xHVublMuXuPu2d0ZlfFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cd+7JFlCL3gJEgQ8Fek9yRUuuC11aQwiOM47OeqBbYKySURE/wiNovOfupH1fHRmxtCFbG9t0yUjsoa2+r0qA89KHKGf4g+pdaypCo6CaD6DwfWpNcD414DOdrc1Wj5wWIvT8vtqbCR+Hy8xgfjGpxhcl6nx5tUB6LjFnvuOFJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=apERh0s0; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="apERh0s0"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B2EF1F65B;
	Sun,  8 Jun 2025 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749411471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d0C38mLCm+B9BYKlJOfWEN5xHVublMuXuPu2d0ZlfFs=;
	b=apERh0s0k3od83+QhMpwchNQIJ68iMqfauWwLQajqeK0OLqfQe0qCTOhbHgY8Lg3lFAWb/
	PrGlv/fQ4yn+EoIK/s6JX+uB4aESNNFFPnmRaneuXp6XSXYPoYXNCxD0xwXtPRAgwV4dsX
	GmY0qNmjzrxY++3/tqNaSn3oX/KWB8/hE1pcsGkMND8dizfsAfPdeU+fzXW1wIhtqJmyP6
	2thPoIWeRrMYfaEf/lOLQs3QBtuqib6PCRHZ1yx4tRHe24naVN92oAumepTddhT/zpHx9U
	JtPDG0eC3sgouznOdM/85r7oPee2vOlzwkKrQq+76qoG09aeEbSdCbsH/Wbb5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  "Vivi, Rodrigo"
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
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
In-Reply-To: <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
	(Alexander Usyskin's message of "Sun, 8 Jun 2025 07:00:10 +0000")
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
	<20250302140921.504304-2-alexander.usyskin@intel.com>
	<9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
	<CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Sun, 08 Jun 2025 21:37:47 +0200
Message-ID: <87bjqyja7o.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdekvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedutedtfeelvefgjeevuedukefhtefgiefftdekffffteduheduheelgedutdetueenucffohhmrghinhepughtshhirdhishenucfkphepledvrddukeegrdelkedrvddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrddvtdegpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehluhgtrghsrdguvghmrghrtghhihesihhnthgvlhdrt
 ghomhdprhgtphhtthhopehthhhomhgrshdrhhgvlhhlshhtrhhomheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehrohgurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Guenter,

On 08/06/2025 at 07:00:10 GMT, "Usyskin, Alexander" <alexander.usyskin@inte=
l.com> wrote:

>> Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
>>=20
>> Hi,
>>=20
>> On Sun, Mar 02, 2025 at 04:09:11PM +0200, Alexander Usyskin wrote:
>> > Create master device without partition when
>> > CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>> >
>> > This streamlines device tree and allows to anchor
>> > runtime power management on master device in all cases.
>> >
>> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>=20
>> Several of my qemu boot tests fail to boot from mtd devices with this pa=
tch
>> in the mainline kernel. Reverting it fixes the problem. As far as I can
>> see this affects configurations with CONFIG_MTD_PARTITIONED_MASTER=3Dy
>> when
>> trying to boot from an mtd partition other than mtdblock0, with the
>> mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi).
>> Is there a guidance describing the changed behavior, by any chance,
>> and how the boot command line now needs to look like when using one of
>> the flash partitions as root file system ?
>>=20
>> Thanks,
>> Guenter
>
> I've tried to make is as transparent as possible for the existing users.
> Only change is that now every partition has master that is not partitione=
d.
> Is the CONFIG_MTD_PARTITIONED_MASTER=3Dn fixed the problem for you?

No change is expected, can you please describe the devices that you
observe with and without the patch? Maybe there is something wrong in
the core logic.

Thanks,
Miqu=C3=A8l
