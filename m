Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B562BA45
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749371532; cv=none; b=lggXsqoJidCiljxOrUxjExUPzcp6qPk9zdjRNZaX7puNIr7AoR7kLl6u2F2IRajGlqixj9CVvzGP9+cHIfs+S6z91oJWC1qqBFVodCzrGV4CFWllYoW6mXZ3uxO0GfHHLxNszB/vF/OU27NNBZLhAIwxDaKerjcO5JxsG9CGS6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749371532; c=relaxed/simple;
	bh=I3KsMDwr5qvkZ4rDykXuWvFT+KsLZrNF+UPrBdhe35g=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GPL4tWn4imwP631dqDmgeJnnfJ+bVuAKrDaIj4b5vTtDLiidzt3sC5oeDPUN3s4A9de64VbbNKOr/yT/p4OYEzKXbC80UkOzbqiaWIHaGzCVyg7ak6L+NyzXA9h4BIP6D/7+5UQ78wks6y3R8FYCDGLZnpb7UQXOglyUjpOi4Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m3hsCSS/; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m3hsCSS/"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 6C08B11400AC;
	Sun,  8 Jun 2025 04:32:08 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sun, 08 Jun 2025 04:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749371528; x=1749457928; bh=mZgu0Rm94Z01tFsvuUU3DItJrThYzWjRwqJ
	DNhTfGCc=; b=m3hsCSS/I1/rfvttRsMmxQIcA1bTYr+sFUhmhOhD8DKwFkHpZwT
	3d621oVGwDq9+lbfU0RkTd+izF11/GQIp7eGrBOnzF7lMWQD5w/rrbZgFTpomZdJ
	LWTh21iq4cwbfZqStSmF2iYn8zMLwajEudbK01JNRsLhxghu+8lbIPYnoJtIjEN5
	9JS+Jz8kRDvchr9k+1bTw1ww7dP3MSXSiNkvzFl9Q0NP/UIpfBUYfmJTzRXrRrzF
	kqJ3hq/WgVs5bTy2sDfrm4AfbSgMX6TOQoxlu6ujVPsYS6usWqMiwuiovO5KvwI7
	QuoW89onxOwqxLoZpVXj0QTlcYgjAk1oxVg==
X-ME-Sender: <xms:h0pFaIQo26DnZV-tZu9c3IFE28_dzbrz-x48NyNQG9Zavm3b5qsbpQ>
    <xme:h0pFaFz0XH2ayXIqTk04MzCzQVrzLi_lxs-bypcdK52Gr6HjvxVa_3eq2XQbvvMkm
    gJwxT2C0jNWntRv_5I>
X-ME-Received: <xmr:h0pFaF0LT-gJ_7RShfgoHvgBMmKX0Demm2p0sh9ljqmuWBqqDHPUDSYMYytcBFisVACGv6IuUI7a_7pirkFL6DGKlztammWI3e4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdejieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecu
    hfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrd
    horhhgqeenucggtffrrghtthgvrhhnpeefieehjedvtefgiedtudethfekieelhfevhefg
    vddtkeekvdekhefftdekvedvueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfhhthhgrihhn
    sehlihhnuhigqdhmieekkhdrohhrghdpnhgspghrtghpthhtohephedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtohepghgvrhhgsehlihhnuhigqdhmieekkhdrohhrghdprhgt
    phhtthhopegurghnihgvlhestdigtdhfrdgtohhmpdhrtghpthhtohepghgvvghrtheslh
    hinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhs
    thhsrdhlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:h0pFaMDQfFL9-yz1KYi88jO2r8G-6N6EM1mepSojDgU1QsgIDKKINQ>
    <xmx:h0pFaBgm9W8SboiLemchfIDzcKLtHULznbP66fs8iF-zZ5vkLQu74A>
    <xmx:h0pFaIpkoVpJzo0ZUBZ-5oWaWN0dAAdYkqGqVx2IwNzy3pkYlL7r0w>
    <xmx:h0pFaEhc4WT8JfhV4MhYH19j71DH77rfdoGF5-zWduIDMBiwPEKoJA>
    <xmx:iEpFaFxaxYb6PwEetBev1A6BsQCmFEhvxVkMCiMJAfzcQrhofOpFY1Ww>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jun 2025 04:32:04 -0400 (EDT)
Date: Sun, 8 Jun 2025 18:32:52 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Greg Ungerer <gerg@linux-m68k.org>
cc: Daniel Palmer <daniel@0x0f.com>, geert@linux-m68k.org, 
    linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Enable dead code elimination
In-Reply-To: <42674c5a-42fe-4846-bf90-340310393fea@linux-m68k.org>
Message-ID: <5bc4ad99-3432-c7e1-32a7-e9f9db86f94a@linux-m68k.org>
References: <20250416114240.2929832-1-daniel@0x0f.com> <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org> <CAFr9PXmrVUL1HubP04iHR1ObhaNo+mObg7FC+-HpTF7QR0og3g@mail.gmail.com> <42674c5a-42fe-4846-bf90-340310393fea@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Tue, 29 Apr 2025, Greg Ungerer wrote:

> On 29/4/25 10:04, Daniel Palmer wrote:
> > 
> > On Mon, 28 Apr 2025 at 08:37, Greg Ungerer <gerg@linux-m68k.org> wrote:
> >> I notice that some other architectures (arm and powerpc) have version 
> >> checks on gcc or ld in the config. Do you know if there is any 
> >> version limitations for m68k here?
> > 
> > I'm not sure about that. I'll try to work out why they have the checks 
> > and see if that affects m68k too. I'm using GCC13 so probably new 
> > enough that most things work.
> 
> FWIW, the oldest toolchain I had lying around was based on gcc 8.3.0 and 
> binutils 2.32. This patch worked fine on that.
> 

I was going to try the patch with gcc-6.4.0 but apparently that's too old 
to build stock linux-6.15 (see below). Documentation/admin-guide/README.rst 
says I should have "at least gcc 5.1".

Anyway, I think this patch should not cause any unpleasant surprises, 
given that "make oldconfig" says dead code elimination is EXPERIMENTAL.


  CC      mm/vmscan.o
In file included from <command-line>:0:0:
mm/vmscan.c: In function 'read_ctrl_pos':
././include/linux/compiler_types.h:557:38: error: call to '__compiletime_assert_469' declared with attribute error: min(tier, 4U - 1) signedness error
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
././include/linux/compiler_types.h:538:4: note: in definition of macro '__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~
././include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^~~~~~~~~~~~~~~~~~~
./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
./include/linux/minmax.h:93:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(!__types_ok(ux, uy),  \
  ^~~~~~~~~~~~~~~~
./include/linux/minmax.h:98:2: note: in expansion of macro '__careful_cmp_once'
  __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
  ^~~~~~~~~~~~~~~~~~
./include/linux/minmax.h:105:19: note: in expansion of macro '__careful_cmp'
 #define min(x, y) __careful_cmp(min, x, y)
                   ^~~~~~~~~~~~~
mm/vmscan.c:3166:37: note: in expansion of macro 'min'
  for (i = tier % MAX_NR_TIERS; i <= min(tier, MAX_NR_TIERS - 1); i++) {
                                     ^~~
make[4]: *** [scripts/Makefile.build:203: mm/vmscan.o] Error 1
make[3]: *** [scripts/Makefile.build:461: mm] Error 2
make[2]: *** [Makefile:2003: .] Error 2
make[1]: *** [/home/fthain/src/kernel.org/linux/Makefile:369: __build_one_by_one] Error 2
