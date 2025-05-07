Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A900D139E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746595898; cv=none; b=lq5o8doJU0eGpVy2OMCkHWMnNCV//ugGvoQGd/vfgmHwXa3g8vszyINQ3oGg9H4GX4Ser/cOFzvY11Kl1wVS8wkVJ9IjgjhRiuacQbxq2/HByAn4y27JMTC3mm0zByNk7XtmCLMgLY7EhSY5Mxaw9oN1xEDOYifEpDKhxffNWCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746595898; c=relaxed/simple;
	bh=5A5NaulSUrLZ35MhnuHH3jciSFTjI2t6J548x8Z7K9o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IAvIjKstKWUaUU1Hf5yq+dN0JrvXO9zt35hNTiANhl35+x8nedKXqnMjq7QLMZ10MkenvCnr9XpjXBE4jKtKJ4dLBvqwy9anDPMkNczL/N9/L+AyTqcKbdBNz3AZDaR1+Je1pWwvPX7djfGFyadR/49rWRnv3K/my+J8zYTuoCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=0linh6Xt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gj4qDgY/; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="0linh6Xt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gj4qDgY/"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 9C9571380467;
	Wed,  7 May 2025 01:31:35 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 07 May 2025 01:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746595895;
	 x=1746682295; bh=M8FF/aZp1pEnKZgGodEsA2xQ6QBS7Kfct64j2IXFUSc=; b=
	0linh6XtqyBLxJI1ovhRdvecmYM8FEu8RXEMvrXNiIEPijVHQ4SYaJ3MXkKkYdYI
	l6TL0TyY1jW5txXAO0C0gE+abA+zAZ6FD6xIXD3cOZAGyfQkNMmWxQmeNlzQltvj
	pN/G9J12yJO3IEO25pjWoJSZ3tDdOm+NTsWehGR1EXODheLVTYokD/IHBZ5TgwN1
	lPKXoKoKZIOz8bhQD77xk1r95p13ticI7tAwjE5bd5TpMNflTxe5pE58wQD3ix5M
	/TY9EgcjCZ09O1kR54EMmlTHdV3d3ANPoZf9COA6fl8bK5ucGMim1HvFsDeBZbgc
	NjHfW3utFVquqS79h3IeLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746595895; x=
	1746682295; bh=M8FF/aZp1pEnKZgGodEsA2xQ6QBS7Kfct64j2IXFUSc=; b=G
	j4qDgY/JgI4XFNN7biI7+ZufQioDoNoUJ6GaxlSskCdD1K4xjTjrf8EwFbPNHWIK
	k6pMFHlG9706jaJ9Iny6Z7G+aL4ofaoWasYBcdLGj1ebtFu64gmwAxjWz3LP8phD
	5tm1SgVfEYSOrYcgQGcnCHH78iJxgDG+iMzPbDyUi8qxGsoW/NJLHXVD8gUqhjEs
	yBeaf5bGHlSC7RvR3F75V9qyHmveIutQ1eRHXkYN+GGogxVi35NG61fOQ4C+gly/
	gcrMCc/+Xmug4wUnpEPNVvanv/GGuKqG7xbki7WEDdz0wBX+gu687Cs+T7esSZ2B
	g3t6IF8+CrqDON3ogcy1Q==
X-ME-Sender: <xms:N_AaaL9ANEF6SYwICy-pVgAae1trRGEX21hxRdVtQFDXCAXsrTyhQA>
    <xme:N_AaaHtHdU-JcmEEfxmwikSur6eAScgtvigk-dyBl3EBf_MuqTQN59HbxCCRSav4c
    lIO9CxU-4ArATuXWyo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeitddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegufihmfiesrghmrgiiohhnrdgtohdruhhkpdhrtghpthhtohepphgv
    thgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghruggssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphht
    thhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehtohhrvhgrlh
    gusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhitghh
    rghlrdhlkhhmlhesmhgrrhhkohhvihdrnhgvthdprhgtphhtthhopehvkhhuiihnvghtsh
    esrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:N_AaaJBJ7LlyUa8Mn6Ho1uFz8XDIwph4xPdUWkvgxE8yi_Aa_GR5kQ>
    <xmx:N_AaaHceVmlKqaZguYHNm4ytepwUdebUKOQvSoXq4ebU5lvW97illQ>
    <xmx:N_AaaAOnAb2EkuQp_uo5uo5Zh8-j5NyXD85rLSCR6_2jY_4htjsNgg>
    <xmx:N_AaaJlqawebiPCuoSFdJLVcOkevDwmEC1Bs3_F2WiH3uGNBMVD8TA>
    <xmx:N_AaaAl_QFmjCxnfTcwMzKPZQyVmeM-1M-MOmHQJfFIlIbsHjXNQsZaW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5E7311C20067; Wed,  7 May 2025 01:31:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5300fa22c9e0840d
Date: Wed, 07 May 2025 07:31:15 +0200
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
Message-Id: <5700be74-71e3-41bd-97e2-ac0c33b1c83c@app.fastmail.com>
In-Reply-To: <20250506170924.3513161-2-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-2-mingo@kernel.org>
Subject: Re: [PATCH 01/15] x86/kconfig/64: Refresh defconfig
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
> @@ -63,9 +62,7 @@ CONFIG_BINFMT_MISC=y
>  # CONFIG_COMPAT_BRK is not set
>  CONFIG_NET=y
>  CONFIG_PACKET=y
> -CONFIG_UNIX=y
>  CONFIG_XFRM_USER=y
> -CONFIG_INET=y
>  CONFIG_IP_MULTICAST=y
>  CONFIG_IP_ADVANCED_ROUTER=y
>  CONFIG_IP_MULTIPLE_TABLES=y

Any idea what happened here? I don't see anything selecting UNIX
and INET, and leaving them at the default-off state seems like a
bad idea.

      Arnd
