Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1694A25D525
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052561; cv=none; b=JSrhn8+TWqQgc+WJwrYKwNtqeGlCXXBlpnyjYMuDdwAwZImuP/v6jDj0jN3gyQx59fxw2UCB0ccWnxqXli2WpQhI4GI2Skw4T399HHNMwW/xJeS8cfgpFXSsCstvI0sd9qGPssZo6XMCfulKXa91pnOVrmB5sQ4gent2ElrNxuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052561; c=relaxed/simple;
	bh=svc4DcTkLa9xLLdF7y21glNY6sBMo2gsG0Mc+7dkW78=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uD/3jHqIaqAy/mxwT0Iu2EBu1BgVCB/kluAsjpS5NHEo/S77gCtGb0AU8CVlMFPbBDPcZCtLZZG4N7fmRP7sMDjxUJEOPqT5fRK4yhQW+iQviUPoBlYFExpMPgKt3IlN11txE+XJVAgMaaLEU8HInZw//ah6h3m764ecDaF+tbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=IpoS32TM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DLkd2VJ7; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="IpoS32TM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DLkd2VJ7"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id DB938138134B;
	Mon,  7 Apr 2025 15:02:37 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Mon, 07 Apr 2025 15:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744052557;
	 x=1744138957; bh=bCo1qyJ6rZTiBfA+a51RdFo714rHFIPWspJfKngp7mU=; b=
	IpoS32TM2GnPNE8jNWp6Yxp5PoAZZ1OMYqFmOP/lmXEjsxbNamh0lZ6yrpD2dVKA
	WWCQweWeVuhzc2Pg+9QRByz5/uvT/HZFFnnbBmTXTbLIQICIPl1CSxG+3fkV4CKB
	8LRFcmpLsPg2E8Gpz24O/EEnrNGZMU2MAOsutpv+5xWiaDbNXmr62KdUIaQixDeQ
	tjuey6T7gZuL6Bo10i6c2EZyVYK1+2NKjiDOqEfrQRRg3wN61TeisjQ6oWMmkHey
	eN93pUPLtd0cDZUzYNzDSKXBIV16Oq/S1kZAR1NHg4bzgLTxdz3mi5p/l4vayKCF
	Urjo5NqY4U6twx007ihGuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744052557; x=
	1744138957; bh=bCo1qyJ6rZTiBfA+a51RdFo714rHFIPWspJfKngp7mU=; b=D
	Lkd2VJ7beZ5HHqDsQ69haYdUKdbhUW+vTzPtKMLui8vsiN6c4aYYQRsPeB8wTqVH
	la+9NpAwsbslNrHrISasLf4EfN2/VTZCQhMolxHV2e4gMQKdSgfI7bdryGkZLEUv
	kfRdnQ7rmk18ZCRjTPWOic/G71fPAEkHrJqzsiRtwfHudOcV9pqG1t209zuQmE2t
	ZJRJcdIF8huxbtRBGvh4KTY+YBqTwz7MSS3il8zgo0G55eXGe5YL5HOe9xvmJUpW
	YzUddTCmWDZCUP2S2+1Bm44irlAGBOBKuzdc3xhiNmlgwqJ6uzumj/4bv7TIlE71
	Oqs9ed3kNfsARPKR8F40g==
X-ME-Sender: <xms:TSH0Z3QKE0m2joPGDvtjPwxtKcFqHlhBx5FzewDaUBacNWue_5v7pA>
    <xme:TSH0Z4zHZbuNI-fk5frE4xc_deIbcX55RkINwLJnm1PCdJGFN9PXamLCgUY8hQJho
    64Lq_GHYAYdHo3WHz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvrdhprhiihiifrg
    hrrgesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhr
    ghdruhhkpdhrtghpthhtoheprhhosggvrhhtrdhjrghriihmihhksehfrhgvvgdrfhhrpd
    hrtghpthhtoheprghltghhrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhrgho
    jhhirghnrdiihhhurghnghesghhmrghilhdrtghomhdprhgtphhtthhopehkrhiikheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrd
    hinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishht
    shdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:TSH0Z80WDpD9n7QYR6u06DYm7i-oCpVlSUDHOOTFSl2Doc_16VEgNw>
    <xmx:TSH0Z3BPWw4u6xEYbpDDusC3mTnWnkIL6Q2Ui596DKGEn1dWCpl7sQ>
    <xmx:TSH0Zwg3w70j6V51hHBnHO1aAGRspv6bll-Ld8ZdSy2exAP4xSLCIg>
    <xmx:TSH0Z7o61lvIp-0iMWrlAHHPrn-sjT0O_REA_Kzy-5lQGQOLO8DfFQ>
    <xmx:TSH0ZwtbPXSiP36-fUYJ42TP6UKSmhyfmOU7arb2HfwqrRW6bUUo3x5T>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2F08D2220073; Mon,  7 Apr 2025 15:02:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T689809fba064b46a
Date: Mon, 07 Apr 2025 21:02:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Davis" <afd@ti.com>, "Andre Przywara" <andre.przywara@arm.com>,
 "Russell King" <linux@armlinux.org.uk>, "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Alexey Charkov" <alchark@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Stefano Stabellini" <sstabellini@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-Id: <d4a4f00f-ef52-4635-bd81-659e8dcf9fde@app.fastmail.com>
In-Reply-To: <20250407185650.411887-1-afd@ti.com>
References: <20250407185650.411887-1-afd@ti.com>
Subject: Re: [PATCH v5 0/5] Switch more ARM plats to sys-off handler API
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 7, 2025, at 20:56, Andrew Davis wrote:
> Hello all,
>
> Continuing the quest to remove the legacy pm_power_off() global
> function handler. Remove uses from arch/arm/ using the helper
> register_platform_power_off().
>
> These have been sent for several cycles without feedback, not
> sure if there are anymore active platform maintainers who
> can take these individually, maybe these remaining could
> go in directly though the arm-soc tree?

Sure, can you send them to soc@lists.linux.dev in a few
days, with any final Acks you may get? That way it ends up
in patchwork and I can trivially pick them up.

Since it's only a few one-line changes that all do the
same thing, you can also combine them into a single patch.

     Arnd
