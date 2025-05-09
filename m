Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBBC221555
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814268; cv=none; b=dYnpaaVPut/y5L+/asToR2+cgNSLcoZR1bfdMkS62umxAovWExtIN8C8qwxuAtTeA/O6AfaP4guoBObTnp1zieV0y9686SycKU/Mj11YBRC5zl4gG49AxgydNwnjMlhrC47deHA/HLvrsR6ncLAuvggLApxgvJGC5KYkk0FDC2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814268; c=relaxed/simple;
	bh=IHswMfD/4h9FJlWmDNxxkF3W1uRzW83XyGTRs96hBXs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BL0t6AsQpPSqPoy0XQccdiTt7JwGeqmlHX7RCVhp0BzYQklawAEYFwnW9e8LaeYro2w8SNxpWL0Arx1lQpGISCkDmChtII2JagdalF7uicYXhSv6Pi5rVMZRuvS9ZZrjsm8yiL1HwjqdS6O7y3aMaJ0Rz7w9n4GvA9bizrK+sh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=T26jt3K+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hggC5kD2; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="T26jt3K+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hggC5kD2"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 056D6138023B;
	Fri,  9 May 2025 14:11:06 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 14:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746814266;
	 x=1746900666; bh=hCyr4hHLMIL/WvQboLwqBJI2QWQKbpJLuuDWaopC16U=; b=
	T26jt3K+nJqRjpV04LNtgjKrpWkgy7B/IOleT/Xjzss/UNiSjYkt/GKnB8QXfVE/
	MGG1gMQqadJ/R5WSMlOxcDMno5Wdvm8Ivu+rKhyukw0l/nYOYOL81syofu8IlqtQ
	7KSwzFLA+B5+G/oazNPUgXmoI3vwizxgt/hUZqgG038LCrsczLhKSiDyUauq5K5F
	H67ua4HNidIHOuRlCOz1aBNTkIPF+yP+yCsvJa5u7JNNSC/AC3CGlKXNgPV+VipS
	gOq+Cr/cCOUH+dcU0pU4UnPAawQlO43KUpUlz5TDVKrss1vUwApaJStEgy2E7Sfb
	Bc8FWkEx6vgw+GM/BuVfVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746814266; x=
	1746900666; bh=hCyr4hHLMIL/WvQboLwqBJI2QWQKbpJLuuDWaopC16U=; b=h
	ggC5kD2h3PGKu95dLQkXVXKIixnzz8jeAWlVi7EzUVxSEOPq6w/Nt76v3vwwkup0
	eMimIbxQkb4uei7orv9Mm41zERgY2Ge2ThsRpYul6HggDmHDQ1hxTZl521lb8CqB
	WNtuvQsG+HH/WIaBIuqFY0MQkH3d71bQ6Z8g2uRD9EiYGAYUwvWPU9Ky1qfM8OXr
	bfWcW6+Tvp3Z7vxbrC3GDAgFdRHCgBJbE/80Sz8tKbriSWZcKay4xyYecoWb5qU0
	0K6RG/1SkpRO7CeyBbCSmRPu7G6yVi47kkz+nLNPV3PWHVshJtUpniGhFMyKJ1a0
	Z795zbnNivFsFGLWEXGzw==
X-ME-Sender: <xms:OUUeaFJbirSW1SJtlcGW388AkqSvcWTlOoUNKvv5irjqmj1NunWLQA>
    <xme:OUUeaBKqgsC9JXQntiKQ1Xz20v4NxP5dVSTcgIl-JOnEe5-BCIG76eUWSYSww8WMj
    qYaODsKlpZucMTmDDM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleeffedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegufihmfiesrghmrgiiohhnrdgtohdruhhkpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghruggssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehtohhrvhgrlh
    gusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhitghh
    rghlrdhlkhhmlhesmhgrrhhkohhvihdrnhgvthdprhgtphhtthhopehvkhhuiihnvghtsh
    esrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:OUUeaNvtZrheHiYfzq11eTUktMhtF1WCIu9mUNdUE_x_TWpZtIhRqw>
    <xmx:OUUeaGZ0TXKfjC_DFuyWn9Lr_Ad_B36NXU09B2DixHJhlSQP5fVQsA>
    <xmx:OUUeaMb32T-gwwGzumf6SnTQY77y9YJt8eEQlU9k1C72k9RwcokNng>
    <xmx:OUUeaKD_2KPsWsGRXG_dU6lttjD2IJE0M24TNcsQyt18Guss0pByvw>
    <xmx:OUUeaOAKwpZegxld4ZVA8hOPmfu9pSsZDj8FcIv_mydP0xGQLGYaVsZ0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 475A81C20067; Fri,  9 May 2025 14:11:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tac3cca25115b04a4
Date: Fri, 09 May 2025 20:10:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ingo Molnar" <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Peter Zijlstra" <peterz@infradead.org>, "Borislav Petkov" <bp@alien8.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vitaly Kuznetsov" <vkuznets@redhat.com>, "Ard Biesheuvel" <ardb@kernel.org>,
 "David Woodhouse" <dwmw@amazon.co.uk>,
 "Masahiro Yamada" <yamada.masahiro@socionext.com>,
 "Michal Marek" <michal.lkml@markovi.net>
Message-Id: <0591fcab-fb19-451f-a27b-1b449b2af4b9@app.fastmail.com>
In-Reply-To: <20250506170924.3513161-4-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-4-mingo@kernel.org>
Subject: Re: [PATCH 03/15] x86/kconfig: Rename x86_64_defconfig to defconfig.x86_64 and
 i386_defconfig to defconfig.i386
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
> Editing the defconfigs with shell filename completion is unnecessarily
> hard due to bad naming: if one remembers 'arch/x86/config/defconfig',
> it won't lead to the right files, because the defconfigs are
> prefixed with $(ARCH)_.
>
> Under the principle of 'higher order names should go first', prefix
> them with 'defconfig' and postfix them with .$(ARCH), and thus make
> all x86 configs match the arch/x86/config/defconfig.* pattern.

I think this patch should be dropped completely, it as it causes
multiple problems:

- it breaks existing scripts that use 'make x86_64_defconfig'
- it breaks 'make help' automatically printing the names
  of the defconfigs
- it's inconsistent with the other architectures

       Arnd
