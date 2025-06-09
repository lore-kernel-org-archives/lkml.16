Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BA025A62D;
	Mon,  9 Jun 2025 14:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478441; cv=none; b=FlwhnVFFAua0ad9yDuiYidNGYvnJVdk/yEaQva+hr4+5Spn9zPxGVPCufGyhqbHfZt88fdzSVMwmWg87E68NWgW8kdRgT2yf893NKOatMGZuD+lecy+lKBuaDBU8VsbhVgiiRzfCMyJKrFSdjD/xcEsz7jF2btuOjflJFBExXiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478441; c=relaxed/simple;
	bh=qRwc+V22833uXLUk+aGciP92AVaKePA/6rxSGLy/Fx0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3cyTFvVVCNoXM5gSK0R2siZWYbPwX2wi0kFWEDtemoCzmUNBrV0GnRsRfFXlPmPG0iDiqJyq7ajqb9NOj/fHFtx45v6AihFCXcPT5g61R+pstpzAMMQIPFri0BAduGV65xFdK3ZbEh4POGyALhbWHL/6aOcG3Xh9mjFa7igRMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OvHAe8Yo; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OvHAe8Yo"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2766942EA6;
	Mon,  9 Jun 2025 14:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749478437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qRwc+V22833uXLUk+aGciP92AVaKePA/6rxSGLy/Fx0=;
	b=OvHAe8YoSQ8/mEnE+TrwB5HO9I42enWLdO29Zq5bqTvXSuBRgIf3cB8LhqB9RyesJcaYEZ
	piTFhrtRl64Yyuhh55zSdfmsGmbgeF9UkMbPNOSIeepYUnvk3GbgPfIpQAycUPN9vpAekA
	VxHK10r+qzisSvd4zl2QUzOj61AaPsooHl9m2ae6dvGJ5KsTXC7nCwrePiKD8ZN3PMbczE
	bj1qNrzV77M5HZnjA8+1MJIVXNV/AcvK1e9ekYR0PpoYTi2d3PiF0qbUT0cd1tTx3XhMaV
	0HhcY61Bjj6lFPna3YClhXi3t9uUVAGwMtwlJZyaYkx66pAPnzHVEe+tR62U7w==
Date: Mon, 9 Jun 2025 16:13:53 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Ayush Singh <ayush@beagleboard.org>
Cc: Andrew Davis <afd@ti.com>, xypron.glpk@gmx.de, Jason Kridner
 <jkridner@beagleboard.org>, Deepak Khatri <lorforlinux@beagleboard.org>,
 Dhruva Gole <d-gole@ti.com>, Robert Nelson <robertcnelson@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, David Gibson <david@gibson.dropbear.id.au>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>, Herve Codina
 <herve.codina@bootlin.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [Discussion] Global vs Local devicetree overlays for addon
 board + connector setups
Message-ID: <20250609161353.49214dee@booty>
In-Reply-To: <46bb7e4f-1e65-4510-a27f-19ae87c4c272@beagleboard.org>
References: <b1990c97-8751-4964-a3e8-9598f4cfac2a@beagleboard.org>
	<967bc855-76f3-4598-853c-d65ce142995d@ti.com>
	<46bb7e4f-1e65-4510-a27f-19ae87c4c272@beagleboard.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelgedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfefueegjefghfffteeigeegvefgkeduvdetffelhfdvgeeuleefgffhveeiiedvnecuffhomhgrihhnpehlphgtrdgvvhgvnhhtshdphihouhhtuhgsvgdrtghomhdpkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheprgihuhhshhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopegrfhgusehtihdrtghomhdprhgtphhtt
 hhopeighihprhhonhdrghhlphhksehgmhigrdguvgdprhgtphhtthhopehjkhhrihgunhgvrhessggvrghglhgvsghorghrugdrohhrghdprhgtphhtthhopehlohhrfhhorhhlihhnuhigsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepugdqghholhgvsehtihdrtghomhdprhgtphhtthhopehrohgsvghrthgtnhgvlhhsohhnsegsvggrghhlvggsohgrrhgurdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Andrew,

adding a bit more to the discussion.

On Thu, 5 Jun 2025 12:52:19 +0530
Ayush Singh <ayush@beagleboard.org> wrote:

[...]

> >> Basic Requirements
> >>
> >> *********************
> >>
> >>
> >> Here are some basic functionality that the chosen approach can do for=
=20
> >> it to be viable for the connector + addon board setups:
> >>
> >>
> >> 1. Dynamic device addition/removal from userspace
> >> =20
> >
> > I'm going to suggest we ignore the removal part. Not because it is too
> > difficult to solve, but because it is impossible to solve.
> >
> > A huge amount of drivers and devices do not actually allow for removal.
> >
> > The reason is because there is no need, hot-pluggable busses are the
> > exception, not the rule. The rare cases like USB are built to handle
> > this both in hardware and software. None of the connectors we have
> > talked about are actually hot-pluggable! I2C, SPI, etc.. none of
> > these are hot-pluggable. Even if you get away with yanking the cape
> > off a BeagleBone while it is running once or twice, it is violating
> > the electrical specifications and you will eventually break something.
> >
> > If we don't focus on the (non-valid) removal part, so many other parts
> > solutions become viable again. Right now we have no good way to even
> > *add* an add-on board, even statically, so let's not let "perfect" be
> > the enemy of good.. =20
>=20
>=20
> Not quite, removal is a very important part of the equation, specially=20
> for mikroBUS. mikroBUS iteself is not exactly hot-pluggable, but Beagle=20
> has a usecase of mikroBUS over greybus (over 6lowpan). Since the node=20
> can be removed, you now have a setup where mikroBUS becomes removable.

Removal is indeed valid.

There are use cases for removal, as discussed at LPC2024 [1][2]. And
for the use case Herv=C3=A9 and I am working on, mentioned at LPC, addition
without removal is totally useless.

Busses that are non-natively hotplug are surely tricky to handle but
they work if 1) the hardware is designed to be electrically safe against
removal (HDMI DDC is a simple example based on I=C2=B2C) and 2) the drivers
and related subsystems are resilient to removal. We are working on 2,
and I'm working particularly on DRM (some series I sent recently: [3],
[4]).

[1] https://lpc.events/event/18/contributions/1696/attachments/1404/3464/ce=
resoli-codina-hotplug-overlays.pdf
[2] https://www.youtube.com/watch?v=3DACDCiC1r8Xw
[3] https://lore.kernel.org/lkml/20250528-drm-bridge-convert-to-alloc-api-v=
4-1-f04e698c9a77@bootlin.com/
[4] https://lore.kernel.org/lkml/20250606-drm-bridge-alloc-doc-test-v9-0-b5=
bf7b43ed92@bootlin.com/

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
