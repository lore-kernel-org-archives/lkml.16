Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5891922D4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200728; cv=none; b=X6L88ahk84keiuJZfv9rpeZq0sRhwLCkIEnbazgkPEEGGYGypixWIWn5ZN1Sp6xMNaw69xLfEJWy91WI7eR8jiUPDQiMdFSid0YO0sICETu7aGNXjAWYbk9VhuOu04BukLLdQokQiQdIdvCXCyjczQAYpx5cLhEk+CtoQP60e2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200728; c=relaxed/simple;
	bh=RmbnE6dGkEyy0e7t6qDoqc6F/Sp1/EoAlKg80SGoiI4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VhoBMDDHeVXc6uLvO+zZ+xii8SkSZF+SVCuXp5I2sVH7iAu6sUvX/43B6QwtGw5KJoXbYWyZQQdq7Hye3R4cqNBwn6iWyQBil/OBqk9ze+dOM7mjZJ7Tz3bO+PeUEfEpSVR8zE0Hb0oKInjxMHYYASHoKqH7532cyl950d6WngU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oNT/8TrM; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oNT/8TrM"
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 0E8B613833E1;
	Fri, 28 Mar 2025 18:25:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Fri, 28 Mar 2025 18:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743200725; x=1743287125; bh=iILOKpx8HQDRieoVLBVus3RkWjr4hi7ARLj
	1oIRPGEY=; b=oNT/8TrMgKqdmZEXbtWHvOAQRmrdyeA/UVKvtT5qqkoI00StbGw
	4xl20gXBkabiIFcKGiHiH0n3mYbf+lNlw97Dlvh+gGYfrtkHrmO5wQaTquKmZjGB
	QCU1MdtgYrCUCtXQb6HcSZJbbV9KzySLiogBok7skFYBsJ/d5k0UIUIBVo0evsWm
	vm+Gt6eDVe4+RtB4utZUmPk3JycLxrGOLXI54QnWlR3n28NqYo9gWUsq1MtkEN+I
	07CjFFzHVoC5SZ2up8WWFyVdivL2V1k1X+fms7I462TWyiRrK43aMWlW9ZlvwkMz
	juO5XnRV6C5/DbWZtsSYYZ/mjzweYiM4WwQ==
X-ME-Sender: <xms:1CHnZ57gjS_2ChBQs9f_uDyxvbNVbBLERANQANxPHaNLrjYkz1Z0Lg>
    <xme:1CHnZ26z1BQtxIRqtRGxYE4daMUxq3UMV4aBpxcHlGxGqsqEs-MlBXOLkPoblzY-j
    m6fkkGka1HeLOi_R3E>
X-ME-Received: <xmr:1CHnZweSjbwspc7pAQkqGQEOZqwc6qyQckPHIRLuee-IEzkE2RA_jTUeVNFUgyGzzv3JHbrU6VdrvP7omOfpubM0n3DxBoQn1bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedvgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevufgjkfhfgggtsehttdertddttddv
    necuhfhrohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheike
    hkrdhorhhgqeenucggtffrrghtthgvrhhnpeelueehleehkefgueevtdevteejkefhffek
    feffffdtgfejveekgeefvdeuheeuleenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhn
    sggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrh
    htsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopegurghnihgvlhestdigtdhf
    rdgtohhmpdhrtghpthhtoheplhhinhhugidqmheikehksehlihhsthhsrdhlihhnuhigqd
    hmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhk
    vghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:1CHnZyLj0G6hAP1Zuj19_ADRpp1kuGa5ad2SNUShyeOCNEOGgv_VCg>
    <xmx:1CHnZ9IFnfbnk7aZ4R0BQhAVYMaYn-NFVkCCBOOG1gR_BWGRE-0y5Q>
    <xmx:1CHnZ7zClA4h46yJJDiJkMwLk53_TXd6ccHMkSQnIf0LvSHRWGH2Xg>
    <xmx:1CHnZ5JjOdxzSf1pVxwZ7feULHJejJ9Sv1mahTY7alyscrngZyLgpw>
    <xmx:1SHnZ91D9BRmwvQz9ZpRKucTiTUa3IaTkzfjPw2r5e_unm00Bng8Rkl7>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Mar 2025 18:25:21 -0400 (EDT)
Date: Sat, 29 Mar 2025 09:25:28 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
cc: Daniel Palmer <daniel@0x0f.com>, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k/mvme147: Don't unregister boot console needlessly
In-Reply-To: <CAMuHMdUxe3gwsWdb37P+SOxL3twEf9_Fdr82naR+R3yxHCObOA@mail.gmail.com>
Message-ID: <b8150223-8bce-32fb-c146-e14bcaa91134@linux-m68k.org>
References: <54c8046f6ffcb16b3e4e7aa1a6fedbc4e576f16a.1743114940.git.fthain@linux-m68k.org> <CAMuHMdUxe3gwsWdb37P+SOxL3twEf9_Fdr82naR+R3yxHCObOA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Fri, 28 Mar 2025, Geert Uytterhoeven wrote:

> > --- a/arch/m68k/kernel/early_printk.c
> > +++ b/arch/m68k/kernel/early_printk.c
> > @@ -60,7 +60,7 @@ early_param("earlyprintk", setup_early_printk);
> >
> >  static int __init unregister_early_console(void)
> >  {
> > -       if (!early_console || MACH_IS_MVME16x)
> > +       if (!early_console || MACH_IS_MVME147 || MACH_IS_MVME16x)
> >                 return 0;
> >
> >         return unregister_console(early_console);
> 
> Perhaps the whole function and the late_initcall() can just be removed?
> 

A comment in arch/m68k/kernel/early_printk.c gives the reason why that 
code exists: debug_cons_nputs() lives in .init.text. Platforms like MVME 
which don't use that function to implement earlyprintk don't have to worry 
about this.

I suppose MACH_IS_FOO is not a great way to encode that requirement. But 
it don't think it has to be self-documenting. It does have to be 
consistent with the conditionals in head.S.
