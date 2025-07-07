Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F11725E828
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878941; cv=none; b=dOs6MkSVESWvBCxbg6ORIYcwxVRLS76Y+CKoUKMN1nmFb1+c16E5scWlKgyqqxbCAjrG8rT3ZSd7suD3H0ibOa1LCuRYUlP5VeGga+Y4e/2F/qXc6O4aSi571VdrhnUQSZEobfmukGVt08d3gwD6vS7XxPRQ8exSAznwzO2m/XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878941; c=relaxed/simple;
	bh=bbHQIfoaj+AUv48i9JAD3wouIdZHUGlXCJP2vVov2ts=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jvpNNtZirpNteXS8YUA3jzaUNN5D9ZvXOy1u99cWm72ASOt7IQ1FNLeSiNqxDFjr0spVllxDLhNedXV9Qc5wkb6+Iofz60JHrfICBkOV0OlM+40hAmBJA7JoFLZb5kitKj70ymoAryVUz+nrLeFxFOhawW/ab2Q1qpBe+M9NuRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=MRPltjlH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VqAPi0DX; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="MRPltjlH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VqAPi0DX"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 85BCE1D00056;
	Mon,  7 Jul 2025 05:02:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 07 Jul 2025 05:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751878938;
	 x=1751965338; bh=x5RAfZVMPJFJCrDqrPzzBGj1iJyK9B75WsIFFR5pUZk=; b=
	MRPltjlH0iB5ABfrEAPz8jxlQzIzkA0C8NHl466fcTH0nM1xGALmLY6qJlzD72KS
	/OWvnjDSiOG0iC5X8m4V9b7TnFv+EHGgmMPXPs5MiPdD+ORGlO8h1u3dT/tGKAak
	3kRTwPmqFyGnAgg/2yJBtJfQw7lWapSc2IG4iylPyTBtGad2quSh/BpN/N2zKM0I
	rlC94nxlvPPe+7nfnPmdXK7WuRY35aI20QwdNEOlST65lpDUq04xA3+qurCG3YP8
	hg57oQds6lGOZfuMk1m+iGFC8LFXnZdXkyTywoEjjT+KSGfZcMYYP1Kd509Ubltc
	k0WFIyUNVW068evpVAxopA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751878938; x=
	1751965338; bh=x5RAfZVMPJFJCrDqrPzzBGj1iJyK9B75WsIFFR5pUZk=; b=V
	qAPi0DXwZHrfg5lhevVIl6pOXVVk98H1tYn136DOUIAgHs/zyKnWcpkwyz4HcBAW
	FnIp5nupq03Jz/ch7/xXB8c2vj3oQpXHKBCuvrgXqHd1Ohi+Ie7umjbeBmz5eT46
	Yme+IlFuFpwCbRp36hJ2idvW7TPZBdAv8fkLb+IxnmyDjjSRI9x+O6Fk3RygQ5rE
	jooN8W9So/hXGYZEUgpsScWYX8gGavy//kkHe8cenM26Ov4IZRaWQ9dN+f+kQ1NE
	nVenC44344PkcTjtn0ta3Tg+g0+B8CEbXzCX7PFMlwhsCvSJ+GEFIievAsqm/k1z
	i0Ugcxark8eVBaYjl95Ug==
X-ME-Sender: <xms:Go1raICblR90SCI6WKtE8UjdZexet7Og6r0H9PPLOCcUz8SGy7vsSQ>
    <xme:Go1raKhRXn5mxEuus7oJB1LK6aJykgDrVza7G1WiJF4hB9AyaknfhWllyzD6gzNqN
    r6sOzPJ3vT9PM9xjag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertd
    ertddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhn
    uggsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeegge
    etfefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtoh
    epiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkphesihhnthgvlhdrtgho
    mhdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhope
    grkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohgv
    qdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhope
    hlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Go1raNyFpFHXbUmeHAspkEPC1wKv1-1elgq7av2FHzeqx7ZfkvF5Rg>
    <xmx:Go1raK2CZK0XxpxLCXzqaUM6k5pGrVsxHfh99F3LB1WClE-TVKoiZA>
    <xmx:Go1raNx_Xi2G_320AHJVIVlnAtCnXdcmVSy-zLTdfMVEWlPKGmvumA>
    <xmx:Go1raBHtoCYbdKwNzASDDlfkkcQM7aN3iQge38PcKXJoD7bEiJHq3g>
    <xmx:Go1raB4fBUUMSyNdSJ4zr7Nfd6NOj3cjv_wF2_034T855DVAoTGXoTYQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E951F700065; Mon,  7 Jul 2025 05:02:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td6fd7ddbb462d16f
Date: Mon, 07 Jul 2025 11:01:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "kernel test robot" <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Linux Memory Management List" <linux-mm@kvack.org>
Message-Id: <a38f2413-b13b-411d-88eb-7bde2852f9c2@app.fastmail.com>
In-Reply-To: <202507071557.SDU74U31-lkp@intel.com>
References: <202507071557.SDU74U31-lkp@intel.com>
Subject: Re: mm/slub.o: warning: objtool: ___slab_alloc.isra.111.part.112+0x4c0: can't
 find jump dest instruction at .text.___slab_alloc.isra.111.part.112+0x68c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jul 7, 2025, at 09:56, kernel test robot wrote:
> commit: 4496e1c1354bd4837bcc1414f6e1a4d042857903 crash_dump, nvme: 
> select CONFIGFS_FS as built-in
...
>>> mm/slub.o: warning: objtool: ___slab_alloc.isra.111.part.112+0x4c0: can't find jump dest instruction at .text.___slab_alloc.isra.111.part.112+0x68c
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for HUGETLBFS
>    Depends on [n]: (X86 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || 
> BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
>    Selected by [y]:
>    - PPC_8xx [=y] && PPC32 [=y]
>

This is an existing bug on PPC_8xx that got exposed by my patch
but could already be triggered in randconfig builds without
CONFIG_SYSFS.

      Arnd
