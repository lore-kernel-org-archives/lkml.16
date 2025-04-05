Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92ED71CD1F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743844608; cv=none; b=uzPW8kRSIECE9xg7HXdfCSs0GVo2cW0iKmj8qn8n5haj8zHnmdiv5eiQyRY0VQ287nkKBPDsxfue0vUbsEKRRo5Pnn7A4wTByxDBfshSe9zS4VY3XtwfZrtvB7uzM/BIX//ImzEJya9Y0NUuZBWgg7ujrB1rh//fTY4jwnVSWGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743844608; c=relaxed/simple;
	bh=8dZVrC21x4sNEoxcaPiodzEkucs1LufvZ3mrlPOFyXk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mFu4I8gR4lHfrJrSuddCF2OPnIaSUF8oSRBYR1/CX9WcjzguCj7xgNijTzXTf6WBgb/wkQyNmD6OpxuuC+UAiFFNhV038Zf7rVgmcvSdyyAHeWlFSQLdh7Dw224ZWRYARiQUGkgpt3dRGf28c600C+cRNCv2IFL7xVhwzH0ypB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=STgz+viE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=siPShLhn; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="STgz+viE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="siPShLhn"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2FCF0254014C;
	Sat,  5 Apr 2025 05:16:44 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Sat, 05 Apr 2025 05:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1743844604;
	 x=1743931004; bh=ZefRnKcg9csk1WVXJb5wsqwFMPldXUXsiKieW8/coqw=; b=
	STgz+viEhLjhEgumMyHT1EKQCekpeJJfz2ZaQveWeWZBJ9tNMmtdhPa0g82Duqwu
	DbXHy6EzS1MUVnQnducA3+m+AiLV325Y2cDTGwc+4V7EbO6WfcvOWamOCu7Bpgto
	fHx/RFaNtTBryd8h/ZKNZzD3PD9QK2VZkzZUm0FVeVuyx4YhD1YZRq53UPlKmGhJ
	9x1gRE3jW2bkAwzXgHjC/Mj5wgdhC2FT6Kwu/WG0YYHXsthHwgX9GNargNxaeDlT
	QhoSTApNlB48vKYl8EI3/e0FBN0vbKAQyZDaEfbk4fjpKPOsHUCoer7TdKZcS0eC
	1xDt4wGk+tigNz0+pTMP+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1743844604; x=
	1743931004; bh=ZefRnKcg9csk1WVXJb5wsqwFMPldXUXsiKieW8/coqw=; b=s
	iPShLhnlm1HtPtXIN1mCDx2Pj0BfvhjsptfzA8BZfmIMd1LkLTe61v/YbHC73hKE
	ROFrqkz6Adj2IyEbKS+gSE20lSLXXvhzqdlx2xTTljmt0W2jN3spEm4Os0NYWy38
	47aZzHz6c6pQppDrRAMzXO/5XVdi2ymznfEREhag02/3ZgFMuInkZR3u9z4O7nC1
	DJygpD/giOa8Rct6EoSbeoCRHf4VNNpC9SojE/rr/8QLGN044fPrpCfo37yslXBZ
	DBXeMehKvr0cxWxyI8bbgDCtDkuWJnEkx97hDxipmnuSYa/H3b07bJA8DxwOQG8S
	uFNh6vO+xf5QG4m05o+1g==
X-ME-Sender: <xms:-_TwZ-r4BbzppX0DuNM5bRss5bWuhvCi7mpcy7g1hJW7hFOq_UVuwg>
    <xme:-_TwZ8pT2xfd3oSDQRW0tE-gDk8g3NEw-fqkotcva5fEWvI8hqt8XqQh4v5Ur175F
    kg7e2srL5s68AGr1ME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleefleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepkedvuefhiedtueeijeevtdeiieejfeelveff
    feelkeeiteejffdvkefgteeuhffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehp
    vghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlohhnghhmrghnsehrvgguhhgrth
    drtghomhdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:-_TwZzOBQpcJZK9HIycH8yjdtPL6QLQcy4tvKNg2htkKcBK2omSXwA>
    <xmx:-_TwZ95ATME8to3ku065BjISs5uJs_S3ZT5QRzAZTyH-k5jg4oyy3g>
    <xmx:-_TwZ97WqlzZb7iwdYLR9B-p0QiRAMSiRGltZ0lJeVJV0B9jbb-mJA>
    <xmx:-_TwZ9iMVwvifRmdCwAugFY2meAr6qkYqsV7DyeZoddFGi0kAuMcgg>
    <xmx:_PTwZzFKUMcOuiLx2wYn6wJfnN1xcfBti16UfTkP37_3Z8WHThctASLp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 374062220073; Sat,  5 Apr 2025 05:16:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5984b91550484a78
Date: Sat, 05 Apr 2025 11:16:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org
Cc: "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Will Deacon" <will@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Waiman Long" <longman@redhat.com>
Message-Id: <52d144d1-ffda-4b41-9ed5-2a4fcd4f08d7@app.fastmail.com>
In-Reply-To: <20250404165204.3657093-1-andriy.shevchenko@linux.intel.com>
References: <20250404165204.3657093-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] sched/fair: Mark some static const with __maybe_unused
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025, at 18:52, Andy Shevchenko wrote:
> GCC considers that some static const defined in the lockdep_internals.h
> are unused, which prevents `make W=3D1` and CONFIG_WERROR=3Dy builds:
>
> kernel/locking/lockdep_internals.h:69:28: error:=20
> =E2=80=98LOCKF_USED_IN_IRQ_READ=E2=80=99 defined but not used=20
> [-Werror=3Dunused-const-variable=3D]
>    69 | static const unsigned long LOCKF_USED_IN_IRQ_READ =3D
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:63:28: error:=20
> =E2=80=98LOCKF_ENABLED_IRQ_READ=E2=80=99 defined but not used=20
> [-Werror=3Dunused-const-variable=3D]
>    63 | static const unsigned long LOCKF_ENABLED_IRQ_READ =3D
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:57:28: error: =E2=80=98LOCKF_USED_I=
N_IRQ=E2=80=99=20
> defined but not used [-Werror=3Dunused-const-variable=3D]
>    57 | static const unsigned long LOCKF_USED_IN_IRQ =3D
>       |                            ^~~~~~~~~~~~~~~~~
> kernel/locking/lockdep_internals.h:51:28: error: =E2=80=98LOCKF_ENABLE=
D_IRQ=E2=80=99=20
> defined but not used [-Werror=3Dunused-const-variable=3D]
>    51 | static const unsigned long LOCKF_ENABLED_IRQ =3D
>       |                            ^~~~~~~~~~~~~~~~~
>
> Fix this by marking them with __maybe_unused.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I posted as different patch for this a while ago:

https://lore.kernel.org/lkml/20250225200830.4031742-1-arnd@kernel.org/

Either of the two should be fine here, though I still like my
version a bit better.

       Arnd
