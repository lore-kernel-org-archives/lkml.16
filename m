Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7A11CEEBE
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746594702; cv=none; b=PVkVFoguoL2e/sChLIkf2esn691exNe5vDkr1So3SO69QMKJJC48KA/bN1YsFqrVTiX/LZq3A8kt5cJHCB6Mc5tIvQxB/ld2e9e1Jkvs+e7UIV3uDttwovHh517sgjuqc5wnSh7oWB2T48hxiH6bn297ZW0em54XMSNQ/StGVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746594702; c=relaxed/simple;
	bh=BaGpJ8In1o8BB5Rgx+iNepD9flVIkaHMp+WnAyGSNsI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LQtEM4DB3zQcBiZptEgTZDHapBgd3mc21NEc72zB+VjXgWxEVMnJzCjOqV9wLW/pNEONYGcLRN2ee3rjFJoY8DuP/sdyoEcQjAWJ0VZgGb/fSDvotfwbVkd+TIUttNNTwYcld24ps3R2Ug4gvaNSpS63vVxMCwuW3vUmoZ2K8g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SVytVamG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=i/bZyTlK; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SVytVamG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="i/bZyTlK"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 57CFD13801B9;
	Wed,  7 May 2025 01:11:38 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 07 May 2025 01:11:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746594698;
	 x=1746681098; bh=/VJkA2ljjh7bExqOuqpzt5+0KVb/b7bbRfgmJSUTTzc=; b=
	SVytVamGX6CuvGRaeatOoPtoGDeNsDNFfwggg/ynEkAFVF9LSj6YQHvn70A39uun
	JhPdDKd5zyRARYNFRLldrjTM3OV/lAcZGoosUdIYrIXzZlpem80xwF5RcETsYQcJ
	7ZTmRD3myl/BZTD76xhlFOF/whAzfhvJAGH3XDCgEcf0XE3WypQdhUM2JU/YTxTg
	GRb8nzUMHpCOfQ03LJii84g1opSdzL8J2L9ykusjLp+Fo+vTmX99N/IepX4Rp0uj
	t6pHIls55fgRcQPszy21w4mBTVqtg/H/TEeSAqtPJtHKlgLElpkkpIc1kFi/O2eN
	n9v+VGqHt8hX2y5xly1+dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746594698; x=
	1746681098; bh=/VJkA2ljjh7bExqOuqpzt5+0KVb/b7bbRfgmJSUTTzc=; b=i
	/bZyTlK9ulgK0E0zdS9iYTGCfCZ6EEhJQDWs0pYP3y8aIlgvLfKq9SovPF6spfuT
	2P+7a430DTLnxNxgeLl57tXsUWJLKddoejg589hkckKk72FJqqn04GS88P8I9Bdn
	2Lq7KoDhx7abcYfysxQ5DDKL1QQElrFYUMKS3r5sIcm+UeNWBoo1621VOlytMdM3
	vx0D+pM+j16IVrTj81w8rWhUMyOF5U6d5wBA9SkKgHgwMTa4qlB8RrjNEFdEIoQv
	QePbTBQT3ZS+UqAOzUGybG8KOts1tjPu3/o6GBb9C2nnpcvqP99GzCByRqcDaGXs
	OY/62LZZ4QiFRCvLNG0iQ==
X-ME-Sender: <xms:iesaaE2b7fAuC6XLUs0chtTJpLTAy6UcKGuPgnRD7lCxSvlhJK-CsA>
    <xme:iesaaPFppEfn2NQtoKUE2mkIpEum3m4jDz7qyS0ZxoE4dPuxwnhZbr_N-K_XJ-N7y
    W4OX5tMDOyD-MRafUs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeehleekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:iesaaM75u9dFGyksZ7cLYvne98H8DoV_42vEOlPLPQNopv6wNZWO8g>
    <xmx:iesaaN3cQ_AlJnUOCHGERFtHdC4qohNUztv9l-slz1u1HQ3VnN_9xw>
    <xmx:iesaaHFcU8OM30E1VL8qoU4RSqAQzU4qCGwc3v9YvuO1E9e5k-Tg1w>
    <xmx:iesaaG9-nsZwBW7g82fPVJ7F-QtBi5WI-m3fr2fCs8nY78Xnc0PwQg>
    <xmx:iusaaP8p3MaQ27vee3HxzNd4onLz8SLC1Yt_r6t0gY9FJJdgG0yPfvQv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F36A71C20067; Wed,  7 May 2025 01:11:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T120ba0186dc1efcb
Date: Wed, 07 May 2025 07:11:16 +0200
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
Message-Id: <e1585615-e8bb-47bf-846c-b0d2696d0c1f@app.fastmail.com>
In-Reply-To: <20250506170924.3513161-14-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-14-mingo@kernel.org>
Subject: Re: [PATCH 13/15] x86/kconfig/64: Enable popular scheduler, cgroups and
 namespaces options in the defconfig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
> Since the x86 defconfig aims to be a distro kernel work-alike with
> fewer drivers and a shorter build time, enable a handful of
> popular scheduler and cgroups options that are typically enabled
> on major Linux distributions.
>
> The options enabled is a superset of the latest Ubuntu and Fedora
> kernel debugging configs, using Ubuntu's config-6.11.0-24-generic
> file, Fedora's kernel-x86_64-fedora.config and RHEL's
> kernel-x86_64-rhel.config from kernel-ark.git.

I think having a way to get something close to a distro config
is super userful for common options like this, but I wonder if
we could turn this into a kernel/configs/*.config fragment
instead that gets shared across architectures.

> +CONFIG_SYSFS_SYSCALL=y
> +CONFIG_EXPERT=y
>  CONFIG_KALLSYMS_ALL=y
>  CONFIG_PROFILING=y

I really don't like enabling CONFIG_EXPERT=y in a generic
defconfig. What changes if you turn this off?

Based on the help text for CONFIG_EXPERT, nothing we
consider the default should ever be guarded by it. If there
is something that distros commonly that is prevented by
EXPERT=n, it would be better to relay the dependency on that
particular thing.

    Arnd
