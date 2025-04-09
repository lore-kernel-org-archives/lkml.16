Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F4D1C5D63;
	Wed,  9 Apr 2025 19:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225673; cv=none; b=Gshc2u025qa7iY/vC7fKEOdwKFil21865U/Wo5fJ0GFxFLkFMHGoObKH+O8vrmg2QZ1o7BrVpaJcfSMOooSxxKomgzEyS+PuYP11DlUThFaIYArlM40RtfJO4+6j5A2ViLb66Q3oq5Y12zxbg43GdekK0HY2q018FH1Aug5v/uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225673; c=relaxed/simple;
	bh=dl5uLSuNC8uCXh11glbtSL+ymr4zIZd45x54/NtbZmY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=m3IcgvfuPbtaxtWEaZGdgD4LMjSpmY67asEvmvVHjdQIeCv4B/5vBtaG2QYotbDGelUZNRgI3rTHJDv64OWBmLNGqLectkjJlkoCa0pw/NOd0YqcccedsFCXcAeKE4dP8cLfHrt2l49t6EVXPMrHaJvIsCu3OTfxF95OVvETtaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=CYpfg/wT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WGw//NOx; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="CYpfg/wT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WGw//NOx"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 7D8281380166;
	Wed,  9 Apr 2025 15:07:49 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 15:07:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744225669;
	 x=1744312069; bh=q7Q4vnZxipqxBE7b5KNTkx//7Z3Iiwcu0vonfeK0zkA=; b=
	CYpfg/wT4OyA9T/uEuKIC+zTRLwceHAnwiqQ38fMKpyCDQiH6hztZil0K/PkqDmK
	rZ0WASxrjtDSUlYCxt511twyz30Jk88OyXrUr1am5UQ26pkmt5EOjohq+8lrazVO
	VwnWBMOQYPEbEZMoIGBwCwIKIlXNzjd3FvBd+HezfCiEUF55dOX5at6dYqIbzxtF
	xM3e9RhAtfbZk7/hKgXx1WZpdZWt+FOIOObgNfBD738i8DKUpG9FRiPKcy9X0AUs
	+FT5g5+/t7HoD/+hY2NEFsMhvTYU1bTM9iqO3/BK/JKtechDrcZZ/wIKZqPrcJS3
	Q5Sb16K8M46pYhchVEf5aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744225669; x=
	1744312069; bh=q7Q4vnZxipqxBE7b5KNTkx//7Z3Iiwcu0vonfeK0zkA=; b=W
	Gw//NOx0cNuV/xeR4dfhptnL0xkHWgDY256AqNNPxTKNhKsJtMt4B8xBWv9TjjwF
	/cvuGeg+A1yS5tRIyM0n7DpOKJGRYJXOnaxX0M4yfl4ckP4KauvvqIHIsqn90UIV
	Sflt8oEheH6JQxcnaGC/v9hGROJ/Uq7YyNaHNjbsfL5X8GeaA/dBG0L+MLqfzH7G
	qI/3n4Tuah8XhBziALH9h0fbBj34P7wEHdLws/xHQ7oIkCsYBB4NMEQcbr8FIxq1
	Q0p5plYE1QBrpMPiuguqhZ8cU8ghZ8YHZ01Ryv7QRnK29b1floNf8VNWS3Di+1O/
	BPOdVlIrBwSCkI3zrkqkw==
X-ME-Sender: <xms:hMX2Z2tSn9zCt2v3eNvJN6vN8gVn9Rx7-8K7RcGIfrtDDjz5mcZ0DA>
    <xme:hMX2Z7dVfCD9Te5Ln82JBbSCeM9DF0ZswfVqt9oKCh2opQZhsZ5syMvHL6Of7WeAk
    u8f3pYLPUUPQF5TLzM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeikedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedv
    vdegjedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhhtohhnrdhivhgrnhhovh
    estggrmhgsrhhiughgvghgrhgvhihsrdgtohhmpdhrtghpthhtoheplhhoghgrnhhgsegu
    vghlthgrthgvvgdrtghomhdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhise
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrghnugho
    nhhishesghhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtohepughinhhguhihvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    humheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrihgthhgr
    rhgusehnohgurdgrth
X-ME-Proxy: <xmx:hMX2ZxxBBzjNZvGOjTwKXdp3d3rjjPU_-j-_gdtjv5gLfmYIj1B38Q>
    <xmx:hMX2ZxNNSfJuvAxDp9xO0SWnE-fS-BXNmQC58QhzWw6zdg6N_mdO1g>
    <xmx:hMX2Z2-nPMiDODoA32x8v_0dKdjR_nnG-oLQHkp3Q9M4e6aKkVE78Q>
    <xmx:hMX2Z5Wge92GtyaDEGLI183cU08bOwRg4SO1HkNtRsT7GqRIXWthog>
    <xmx:hcX2Z7N9Ktx2fDKJkAO2JgajqSKTD_M2mC25xHyhiM5sboGm52Uxnvkx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 62B552220074; Wed,  9 Apr 2025 15:07:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tbf81c49526c64944
Date: Wed, 09 Apr 2025 21:07:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "FUJITA Tomonori" <fujita.tomonori@gmail.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 "Logan Gunthorpe" <logang@deltatee.com>,
 "Stephen Bates" <sbates@raithlin.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Dinh Nguyen" <dinguyen@kernel.org>
Message-Id: <ab0490cc-ce86-4492-a088-fd2ae03f1475@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdWtgSjxeGYJVNzeWPOCd9nUWeKQnCtFQaROQ1o=r_-QwQ@mail.gmail.com>
References: <20250409061129.136788-1-fujita.tomonori@gmail.com>
 <CANiq72mbci8kxEx5jrq=HVc6WKuJqq8NCLzNsjH1wFcJNoHm+w@mail.gmail.com>
 <CAMuHMdWtgSjxeGYJVNzeWPOCd9nUWeKQnCtFQaROQ1o=r_-QwQ@mail.gmail.com>
Subject: Re: [PATCH v1] um: fix incompatible argument type in iounmap()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025, at 19:07, Geert Uytterhoeven wrote:
>
> On Wed, 9 Apr 2025 at 16:48, Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
>> On Wed, Apr 9, 2025 at 8:16=E2=80=AFAM FUJITA Tomonori
>> <fujita.tomonori@gmail.com> wrote:
>> >
>> > Align iounmap() signature with other architectures.
>>
>> Most indeed have `volatile`, but nios2 and m68k don't -- Cc'ing them
>> just in case.
>
> Indeed. Apparently the volatile keyword has not always been there...
> Why does iounmap() need the volatile keyword?
> Why does pci_iounmap() not have the volatile keyword?

In the old days, a lot of drivers marked MMIO pointers
as 'volatile void *' rather than 'void __iomem *', so iounmap()
and the readl() family of accessors need to be compatible
with that type to avoid a warning.

By the time we introduced pci_iomap()/pci_iounmap(), this was
no longer common, so they never needed it.

In theory we could go through all the old drivers and
also remove the 'volatile' markers from struct members that
store __iomem pointers, but there is no practical benefit to
that.

     Arnd
