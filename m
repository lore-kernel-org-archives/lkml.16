Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689B7F7FC
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 21:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746825294; cv=none; b=MWLxEHD0woNR1OOhwhUgQ3paXhLk2BnFb+8lPXBWKRGysVqg7EWSEP1so/8RhA901/j3f4/ch8Z5DQAx9UuPqaU9j/AYdDs6nvM1n77LKGUpN1t9Dh65HNauF8bNQEFqPrWfW3y7W7JPKy0U7wBXmSwlQtPpJ8F/sD7kboRreu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746825294; c=relaxed/simple;
	bh=RKtcKAC4z5Rsnfw8n1F8tu6mdJuJ4qdz+KuTO46HHxs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RTbFsdSUKB6kqL8Mwf9U0Mpg0yBuGJqSJeJVFdBRHh8/Xi3a+aPXZJfUoKq23Dv9JR/NvNGPY9zuwgWtJO9FMxsTMHWYS7sUIvvpg4nYj5jjvGZxzC54X1GB5WgZmMXCExyOmS53yGh1qp+Yizd0G+Gig/OT/Ueq4qo2Xxj6w6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=aCALKmtz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gRy+gIoG; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="aCALKmtz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gRy+gIoG"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 39DF511400D7;
	Fri,  9 May 2025 17:14:51 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Fri, 09 May 2025 17:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746825291;
	 x=1746911691; bh=JIq/tNiqavgpIsJww8Tzyl40PQyssbo/EDz4zR0QCJw=; b=
	aCALKmtzDQpeWVQOLfPbc4gTd5SQUvEPA0vlE6qYwAuGhmtyefYLdlO0CM2Y92gd
	2ewE7QFwAwyAEmkaP60l6LCYO3mIWlH/cWFJ0qjfuh3O6wPSBbiWr86QFw3HQzvP
	jp01f+6nrqoV/9Od/mlx7hYrpi15U0oAjS3DGni2vn6L2VW3AFVxXKyFVJ2Z8wnw
	CAvk7lfrmEE9+ZjzsSw0kIc5o11SdHdF5/cDnbd4QHsWwsHs4ILwhNRSeuFizqwr
	Bg3rzWNBHNfaRIXF3a+XoRE2gpDV7Z/gtaai5vM4zIkIlnby12dufUL40LMIqQ5s
	V0Hr67/qgKiWevECA1yM3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746825291; x=
	1746911691; bh=JIq/tNiqavgpIsJww8Tzyl40PQyssbo/EDz4zR0QCJw=; b=g
	Ry+gIoGWYvR3RdoO+0KqBXs4CqMu5XshRKP9qU+2QVopqKAADTA8kp5uGsbig1Ov
	khWylT1S0sBYkcTvdQknoIdNGqFyrfZ7cb3cXUft0xtSol+poeDY6skmjY/AvOhH
	kt1/mIiRmmqd27hdwSL/XKC+4Huryp3FSNEiwAEcR8m6nZ7929dXL8IQu8Ib5nUe
	woda4qz+FFMPv6KjRGaTCYED8Se2UsLdwi4L9EHlZoa7ILFxsCzBiiRHnbxckjUL
	Vyme8tgYwywS4LYH5nTF/BL6j6VSyh6OviSagsyaIysSWRUt9U6d9x/iX3JUj3Rq
	SUhtoKbCI6WoIRXkyXjIA==
X-ME-Sender: <xms:SnAeaNu4URIQKDc92mKJGUTtkiugR5x50SO_dTTsF4CwdjonWQqRJw>
    <xme:SnAeaGeTutQBSYU9VQgsRend78nIK3fIS-lpXhx71wd_mfITwUsouOc94vW47rop_
    lMEGYHNQ2yMufaLdxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgrnhhnhhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtoheprghrmheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshho
    tgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgvnhhsrdifihhklhgrnhguvghrse
    hlihhnrghrohdrohhrghdprhgtphhtthhopehophdqthgvvgeslhhishhtshdrthhruhhs
    thgvughfihhrmhifrghrvgdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:SnAeaAylM2DIKs_Nvd3y5E0fot811lzLi-Ltoi3Gw0kZTZ5qylQE1A>
    <xmx:SnAeaEN6OTDV5jdowTwWuLxKzMx91eO42AB2mNfc6OKvRedNN4XeJQ>
    <xmx:SnAeaN8EWTiQBIHS3p8u3AdBGTHg-37GAAjRf7VPV_I8roEVIhgbUw>
    <xmx:SnAeaEUJwlhoOAsJ0ASmWlzylaNKWitUWdxpz4mEnnXLEXkYOYjoSg>
    <xmx:S3AeaMcH8Xyg4Oy4WZB6Mef70fK8YIQ8iSz0LEss3HXfgzglzQPPjDB8>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C464D1C20067; Fri,  9 May 2025 17:14:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T91d942121878fe31
Date: Fri, 09 May 2025 23:14:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jens Wiklander" <jens.wiklander@linaro.org>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 op-tee@lists.trustedfirmware.org, "Jann Horn" <jannh@google.com>
Message-Id: <e5bfb069-6adb-4757-a52c-bb3635990686@app.fastmail.com>
In-Reply-To: <20250509065114.GA4188600@rayden>
References: <20250509065114.GA4188600@rayden>
Subject: Re: [GIT PULL] TEE updates for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, May 9, 2025, at 08:51, Jens Wiklander wrote:
> ----------------------------------------------------------------
> Small TEE updates for v6.16
>
> - Remove an unnecessary NULL check before release_firmware() in the
>   OP-TEE driver
> - Prevent a size wrap in the TEE subsystem. The wrap would have been caught
>   later in the code so no security consequences.
>
> ----------------------------------------------------------------
> Chen Ni (1):
>       tee: optee: smc: remove unnecessary NULL check before release_firmware()
>
> Jann Horn (1):
>       tee: Prevent size calculation wraparound on 32-bit kernels
>

The second patch looks like it should be a bugfix for 6.15 instead,
any reason to have it only in 6.16?

      Arnd
