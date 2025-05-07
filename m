Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2707114884C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 05:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596671; cv=none; b=SWMkJjYb1TA1zCWEFxY0JCRO0g/6x73k+iqnEP7CGBlSGf0/MUFbxa6XDmNigWNeMyrxAE07S4la3wn3QXqRRhyXWugmLpqT5FhrZzBNN4tFzvhRvExSw1AUT5/kWo05amBss19UK66/k/VLcocAbdQF1RmZJI54lwPp/ep44TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596671; c=relaxed/simple;
	bh=KPBoQL0ylIAnLG0wRYS21DXL8j+LIo3GFqd0/PZ2T2U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FawQrV+3tVKnLC2KraSez1nwFC4rfL7PpsHNQXT6xdYuAVEQKtPllc89EeGcfI/G7inkbgJGqLjOvmHJ6t8c1ZTCBv7YGksSlKeqx5oOCF7UqlWa54voCJl+bsBq+gtgPk14hpCNUVAoULJLGXGRe3P0EgELrLDQVsRMHI3sejk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=or9V5GoJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WvjP0AnB; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="or9V5GoJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WvjP0AnB"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 05A0511401D4;
	Wed,  7 May 2025 01:44:29 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 07 May 2025 01:44:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746596669;
	 x=1746683069; bh=LKBIs/dRAt14qDvy0dxUZojjV4ghFeutXbz3h4nTrKE=; b=
	or9V5GoJc0Z6S6oxIWoJakZSoQSPhkg552t2/QAYvZUytGoDOB4q5up7sALJDjSu
	t810N784i2Sk1eDq7yprZcrnBF7wV8qengH+GUHGS588yH+qkG/t8zp11odFh6tZ
	GTacQKt/j+iIN1ySRZ5zYWvhUrVF8lBLMY/E2kF4K1QHQ1utRT5vefsDYU/sPIYo
	XXcZ8pX92fznG1jLAXsgzwRsmuDg7vPyhWEavSCoUu4/yrPcB+AtwiQKwVGyp1hi
	JsSfLDomWeLgfdwAa8eLK8lMiPnRYJYs/93KXhnKHS41burxmSx/4I3wdYKF9eJP
	sFCjomZBGHpHbN0YSEGdfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746596669; x=
	1746683069; bh=LKBIs/dRAt14qDvy0dxUZojjV4ghFeutXbz3h4nTrKE=; b=W
	vjP0AnBCLSX9vyvKfmv1oaRaaYYx90zhfR77wxemtKWBjREOa3nIXi28DZo7MV5H
	mXZCrkld/iuoRVnDzTKcgh/irt9azaCxfGYtdMgubfkiylYKU4y9qorPWGU6++JH
	/Yuis9ETLzsv6iw/GKPFQDIpXxSimWo+eyCOAjQV7PfylPbHombPtk4xUNrpwlkX
	UsO7b8fFP3Iqr/7tPCiZ9rNScose7znuNnC2PF6eoErFAFu6rBlUXuUwC1hK3kqR
	x8LppJV0Zze3E+Lj3CxTsBsf6QLnfzJPtVeo35Cb7rsWH4Uh0P47uNMQuRbC5QBU
	2L6B9uuAd+pzH0irCSVjA==
X-ME-Sender: <xms:PPMaaIs_O6ZRZtYKp4EvPYM2IkayejYsPuBizLCV5XID6N5uXA-Fnw>
    <xme:PPMaaFcMa2iQt7Oc0hZ7qqnuhveNCTjSG2y_NhIXJyDmLEVmVRjca3X16Q1J-U3WF
    oxMShDC-lpEWlj3sI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeitdehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:PPMaaDzDPmx2h-aCJSg6UyglHEZiqsFPoEwgyqOZN92ZFqqUDbFgYw>
    <xmx:PPMaaLN0VMJ7SlnfouQgYQLVNHcwuygzMgeY_zLXM6t7jcPIVA4ywg>
    <xmx:PPMaaI9GFqrkSGTXXN98fqvSkOiPnVg7thfWMq2xCLGx2NE0_eXOuw>
    <xmx:PPMaaDUhm_2p4W5aqFAYvtYz9dVA5GWSSbEcApQSK5flvU1W-hQOUA>
    <xmx:PPMaaOXIRnKzkqB82ZO-1vGmFSI8fjXj9drw3E8J6gLlvJtghL-fDJnU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 99C3D1C20067; Wed,  7 May 2025 01:44:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T29c54119c216f9b9
Date: Wed, 07 May 2025 07:44:06 +0200
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
Message-Id: <cd541739-4ec5-4772-9cef-e3527fc69e26@app.fastmail.com>
In-Reply-To: <20250506170924.3513161-5-mingo@kernel.org>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-5-mingo@kernel.org>
Subject: Re: [PATCH 04/15] x86/kbuild: Introduce the 'x86_32' subarchitecture
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
> 
>  # Additional ARCH settings for x86
> -ifeq ($(ARCH),i386)
> +ifeq ($(ARCH),x86_64)
>          SRCARCH := x86
>  endif
> -ifeq ($(ARCH),x86_64)
> +ifeq ($(ARCH),x86_32)
> +        SRCARCH := x86
> +endif
> +ifeq ($(ARCH),i386)
>          SRCARCH := x86
>  endif

Would it be possible to just remove the entire SRCARCH hack
for x86? It's not clear from the changelog what the intention
was in 2007 when it was added, but my impression was that
this should be a temporary workaround to users doing
'make defconfig' on i386 would still get a 32-bit config
by default and didn't have to change there scripts.

I would guess that even in a 'setarch --32bit' environment,
most users today would want to build a 64-bit kernel, having
the special case for that seems to add more confusion that
it avoids.

Also, I don't think there are any systems that return
'x86_32' from 'uname -m', so your added special case
would never be used by default, only when cross-compiling
from some other architecture.

      Arnd
