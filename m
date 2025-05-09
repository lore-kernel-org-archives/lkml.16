Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621BA283FF8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782919; cv=none; b=LS5BZy3yFNPOwCg29qjghTwJ4BoS47OS7M7OJImXrNkhiTQr5wCmLeMVo/ORhuIw3JLsYdRxtGtrxi3Y7T2YvBhdIbaAlQEciIEfL16cbhU+v1aSqZBYbWAlqvVC7MezVYJ5UjveVX7e/5pGN6UhxmOADWPjoqVi6zJI5aGD5F0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782919; c=relaxed/simple;
	bh=z15afqnSZ3avseRb+hX3bOV+QNP5+3t8At9bgSSKGro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=fij3zH/SzBEJVgiWVQvZmu0W/ArhqHotNGzEhGmVgmK/UK41bbjxGin3QePu4xFogwNloHdZqbVFKpB+jxuuKq0DVUicP91tL62GTxhMPOXd7VXwm26gaN7qxoqD/RZTdaV8k3n9GmMD8hBZafgJ29JNKZgGcvKzQjjr2pj8kSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cacheline.de; spf=pass smtp.mailfrom=cacheline.de; dkim=pass (2048-bit key) header.d=cacheline.de header.i=@cacheline.de header.b=FkKZQHDx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=A5NLLivB; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cacheline.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cacheline.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cacheline.de header.i=@cacheline.de header.b="FkKZQHDx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="A5NLLivB"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 8BA351380193;
	Fri,  9 May 2025 05:28:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 09 May 2025 05:28:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cacheline.de; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1746782916; x=1746869316; bh=dIWWiS5nyaNIyDc7xgCSC
	GutcHi9+SeN0U3LvBIU+fI=; b=FkKZQHDxBesZOi30ZGZduC7+QMwxaBLVifIP3
	SqvTdMxz0HcOc8d0DGZdwfktW3zhBBQ8+TQaf6Gry9zIw9PvxPOWWTkq9p8ITj2E
	dRFkXT93kcvczxzXY0AQgBNecouNqtx3q78Xi5tPKtPuJwMtkGu0t7DoEW4Gjh0u
	njm9AFPGYwTvqHWEv5upetg3jyOY1RiBCbnLOFvXh4VIwZ5XNDCeEjz3K0xWBP87
	sqKoyqncDcCKWZhmQTGNQ09yX3iCyWD7d0mVZqkfUS7NawkUi9qr/CsLVvTO5Jhm
	wC/Bg8HiJ8LpJAR3xHz6bnBDhd3mtUyUu+gaD/dCdqSHOlleQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746782916; x=1746869316; bh=dIWWiS5nyaNIyDc7xgCSCGutcHi9+SeN0U3
	LvBIU+fI=; b=A5NLLivB+rEI8f1qIWrO6qt/Y5sMNBdVOq4hrQVRYL5krlww7jd
	9L+6hg82T2SHhp+afeWac7ypr4NIan/sAzQb+ACsjpSi+TTGj/ZzMay5aj3BqeYA
	xs39rDleTy/ZAVYD6z/6b3txVtu3wXpZ7gRoSWTkxuf0ZZmcBk1EqkySpLotzCe5
	g340LUGFgby2N1QIA4+8QTXWitzssddvzsayimkL4dE5QcOeImfarDcmM30H2Tlq
	nO6wfc4Wf4mVx8lDs7d+p8Hcdf9bC2Fo64Zc3P4xnBJOzcCDMhR9qKdaihISWgGM
	gDD6EjCsiVB/2FitA/g0thgsBu8UU60Do0A==
X-ME-Sender: <xms:xModaK-eL-K39NxfSS4ipyQDKeMvRaDz7sRF_1IUfq1XJx6FPRuciQ>
    <xme:xModaKvmIWrb1CKc7leCFBCPDl452jQAK4oy3FqfbjgZXn0TXli7iR72t7cXyZS0I
    FmmfK77gJSgAtEc3fQ>
X-ME-Received: <xmr:xModaAAxsYzbnfksQDP4VtqKA7FxP_LfdAlbpRtX3mkqeJr2n66ww7IR5NOHuBKBlWEg_MbhRVJ_bIpgGVCq0SyKoeo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvledvvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkgggtuggjfgesthdtredttder
    vdenucfhrhhomhepfdethhhmvgguucfurdcuffgrrhifihhshhculdguvghvmddfuceoug
    grrhifihdruggvvhestggrtghhvghlihhnvgdruggvqeenucggtffrrghtthgvrhhnpedt
    ledtkeekffekleefudekgeeukeejhefffeeuteeujeeuvdetvdfhhedvudevueenucffoh
    hmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepuggrrhifihdruggvvhestggrtghhvghlihhnvgdruggvpd
    hnsggprhgtphhtthhopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggr
    rhifiheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehmihhnghhosehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphht
    thhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnse
    hlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepthhglhigsehlihhnuhhtrhho
    nhhigidruggvpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigi
    drtghomhdprhgtphhtthhopehhphgrseiihihtohhrrdgtohhmpdhrtghpthhtohepjhho
    hhhnrdhoghhnvghssheslhhinhhuthhrohhnihigrdguvg
X-ME-Proxy: <xmx:xModaCdJW4oDYsvTxPK9lt5hR7jVmlIlU9esWhN21Q07V7uobIsSHA>
    <xmx:xModaPPzzmraYTqPkM3J-RWyXdDAKe52Y1jFkl6tr4iS7IcT32aOJg>
    <xmx:xModaMnMNIj5x6mtRVXPjtoID25j7Txvr2UwCrMEPlvWZlYnp7-VzA>
    <xmx:xModaBtZYfiEMHc6TNllwj6oPA82rK6hoqrVmeIRtgIZ3VJbZxL2vA>
    <xmx:xModaM9ZBZ46VW8xghtdbFyfa9NnUs4-onxW2_taQTCaEzLv65-rapKd>
Feedback-ID: i7c5149e1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 May 2025 05:28:33 -0400 (EDT)
Date: Fri, 9 May 2025 11:28:31 +0200
From: "Ahmed S. Darwish (dev)" <darwi.dev@cacheline.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 00/26] x86: Introduce centralized CPUID model
Message-ID: <aB3Kvx1lC93972Q9@lx-t490>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBsor3iOb0SJsLSQ@lx-t490>
User-Agent: Mutt/2.2.14 (516568dc) (2025-02-20)

On Wed, 07 May 2025, Ahmed S. Darwish wrote:
>
> On Tue, 06 May, Ingo Molnar wrote:
> >
> > Wrt. <asm/cpuid/api.h>, we'll need a few followup cleanups there too
> > I think, such as migrating to the cpuid_*() namespace:
> >
>
> Perfect, then I'll move ahead and do a "CPUID headers cleanup" patch
> queue /before/ moving into a v2 of this series.
>

Sent at:

    [PATCH v1 0/9] x86/cpuid: Headers cleanup
    https://lore.kernel.org/lkml/20250508150240.172915-1-darwi@linutronix.de

Thanks!
~ Ahmed
