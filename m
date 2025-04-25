Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63AB18BC3D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597638; cv=none; b=Hw7m0SOQNdRjXgdELvtC3yvNq+3U6/7/vCjzfxLn/tAlBTND8lA5b8X1CYBAEBi1VW12unCwd5CbwQbq5H6Rhfqz6YlYGbJWUxqR/nXJm1fPiFa7pceBGgx8JueEqu/DFSpG4rRJ1WN8Wk4+x746SMvcdILlHPF1C3xDxiqwIKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597638; c=relaxed/simple;
	bh=z2qcIReGdWDgjaVsRflVHOmsmwfsRCsphenb425LUUQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dLZvNC8wQh72tl151xNcKYLNFXFxDHiEVxYrr/6eqAhwwX+kGzq7WdRr3/jGfUtOQ9UAk4ZfkM98aRinRci+PgaSZjbWruAX4ebWNGODk7WjEnd4fhI/QTX9CGG245692SkoEbns0LtOuD8ns2bStUMrt4+Ny6reZK8tBD2/B5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Naad5GFe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lp6aCUm/; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Naad5GFe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lp6aCUm/"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 87A6013803F8;
	Fri, 25 Apr 2025 12:13:54 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Fri, 25 Apr 2025 12:13:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745597634;
	 x=1745684034; bh=Yvg2W7pOPhvpDT95VcvdJxrIJY08qpA5cIKwqfTORTY=; b=
	Naad5GFeWYwQrTjdLfyOV77bbd2AkMddHFS2vgyO9i1KrLIGD/+LDdmVJbs0ASqm
	lDprKhuAOVbVNaIWeRqnYqJFjtMCESkrtWiHkQuY7CO6o5GVzBm133gLWtpYpG8/
	dpyEjvBa4/dARmhYiiiu35CJgVHruzBap+1J73pv3TsbUwjscNx+iJD4uIUpbuV9
	Y9FOw2Nt+KcNCls4py4oTDFo0cEjUsU2lhhxhVoTnNdvKx/8m5GS7TzU7w85t61y
	Or+klb2b6lp4/CJ9iiErJSO8CGah/I5mERH7s+z/ZfxVN2opGK/76chVJ/q+g2lA
	jLULe/s7RxKAFtYvaCFpHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745597634; x=
	1745684034; bh=Yvg2W7pOPhvpDT95VcvdJxrIJY08qpA5cIKwqfTORTY=; b=L
	p6aCUm/0PsRC5l8WdrWL3golhsxVaDBgp7c/rPDw9Q5q/NFWU0VdmlY5+jNt0QTu
	qdnY/QUzZvh3x1vEkhEY9slS8t8b3Zh4hluJIM+g70vk+tIw1ioFR2yR3eGZTShu
	Z/fCPeM9oU5zYeGsDrAW0YJFEmuVzAOKA3WZh41REcXoGOpJF57BtuxAKTYyfzZk
	G97qJl3UiwvvRFCOM2LAVHjYy1dqFCAw3/sIVrJVnNG5xa4jRRu+mT0JedQLdeWJ
	h5pT6B3KVj5cpOBJDEqMHVMSiCyOYAQaHulDmdCE8rfyKcluoGG275vS+78HfGyy
	bP8wo8G1/cwwia5SqXHXA==
X-ME-Sender: <xms:wLQLaHp2tb94smK6g90t71KWpC6jZx2bDxPng9mKqywhqdxDC-nw6Q>
    <xme:wLQLaBoqI_UZqWP1YDLAa4zTp3rx6Qs_G2MinX485YfeaV2dL48ka7WuuughkAmuQ
    5ud796Q1yfgs6ZK_Nk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pegrlhgvgigrnhguvghrrdhushihshhkihhnsehinhhtvghlrdgtohhmpdhrtghpthhtoh
    eprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    igkeeisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhn
    ihigrdguvgdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehlihhnuhigrdhinhhtvg
    hlrdgtohhm
X-ME-Proxy: <xmx:wLQLaEOhJEv0oYYsVYfyzmYUSp9pAhgUhKJ2Ri2uYxyOFqLYX4bM4Q>
    <xmx:wLQLaK5HIvDo_c-bsOw4b-cSc-jjR7kfO-CPlpDbHW-o9cebCPLPqA>
    <xmx:wLQLaG6dqj8QzvQpBZRwzX5_KhFyy6YmgAENRQv-2M-16qCk0ECsjA>
    <xmx:wLQLaCh4ZGvLeTwKKeSXf_0llKg28o3D8ev4AHtW93IuQmmMeFFDIg>
    <xmx:wrQLaHfI90MILvt6A9aWTPE1_R_OExpxtVSaC1qUMNPKYNP5eKO0tR1R>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A08062220073; Fri, 25 Apr 2025 12:13:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T6ef4c78fde3bfaf8
Date: Fri, 25 Apr 2025 18:13:31 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "H. Peter Anvin" <hpa@zytor.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: "Juergen Gross" <jgross@suse.com>,
 "Boris Ostrovsky" <boris.ostrovsky@oracle.com>,
 "Alexander Usyskin" <alexander.usyskin@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 "Mike Rapoport" <rppt@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-Id: <09e26f91-9a62-45c8-b94e-eddb307251f4@app.fastmail.com>
In-Reply-To: <7CEE8E85-D7B1-4066-AD4D-747CA4340F65@zytor.com>
References: <20250425141740.734030-1-arnd@kernel.org>
 <7CEE8E85-D7B1-4066-AD4D-747CA4340F65@zytor.com>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Apr 25, 2025, at 17:34, H. Peter Anvin wrote:
> On April 25, 2025 7:15:15 AM PDT, Arnd Bergmann <arnd@kernel.org> wrote:
>
> I really don't like testing an unrelated feature (CMOV for PAE); 

How about a new symbol with the opposite polarity, e.g. CONFIG_CPU_586?
In that case, X86_HAVE_PAE and X86_CMOV could both depend on that
not being set.

I only picked the X86_CMOV symbol because it already exists in .config
files, but that is not the important bit here.

> furthermore, at least some old hypervisors were known to have
> broken PAE.

I'm not following. What does that have to do with my patch?

     Arnd
