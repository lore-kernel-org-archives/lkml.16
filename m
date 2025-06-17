Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A9B2F5302
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750196202; cv=none; b=fk6afzau1oP4Y+vfxlgoGo9kAENDU2o9Jkj4hoCiWKKDE1xw2SwgiU0Dd5/z4DYMAGvR/MRQ/fC0eGe4X/9jhHbtXlXQ0Vkmg2P7wxM4ci+qSDn5ekWaMCqsvfhTreFRbapOqJt9iKwhZyNUOWRyR0ycNzXvsE86Ki+CQiO+SKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750196202; c=relaxed/simple;
	bh=e7TaazZc+zr3LVASqClUTJrQnF06QP8M7bfla2TSJao=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HG9PDGQWvj/n3bsjBjEo2DKJO7W2ODU2BjdyZalbQz4u8OSQAyRX5M/LqSTEfGjF2OtuNjlkw202AwJcIgGoaNFs02iKY6Dj3kx019wTz8rJZxEojDB8EsiXxux4M7LMvXOlAfMmPM/m7yCrU6iCFBNUZFg5Lr8bRZ75Ugi6UXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KCjegC3K; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M31XUbFx; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KCjegC3K";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M31XUbFx"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 6911411400E3;
	Tue, 17 Jun 2025 17:36:36 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 17 Jun 2025 17:36:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750196196;
	 x=1750282596; bh=QIYfd0T/j5SBPcpX/gdIeYqVuIXA6uYpUuJ16WL2Nwc=; b=
	KCjegC3K6flBXwulOVll3KWf/EzEdmW1BAz5X8DrAd8kLr0JFE+UdMCgNIRCSilg
	5s31hfinqhmq0VC34XOkvlpkw2/OXFFjKVvpUDmHvS2AhguBjABkSSC6wYygf4sG
	I8afwjoTbGY4fK6F2bKznSpS6RfA/aw6+L1xbPbH/VhVhbiBRUnxzJ16K9IkV8DH
	EitJkBJUDaEptHsp01MYHKmPNqrv3KzM7vYZRxZ8GUQALnhWhIxPaIkOL1ATJQIr
	+eBc/NXC6FZIhTqenY4bkYEBtPESQebYRwx0VDkxexLH5KzPy5UOq687QUYx96GF
	Rf4+rMZLwfipv8IHy5ecWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750196196; x=
	1750282596; bh=QIYfd0T/j5SBPcpX/gdIeYqVuIXA6uYpUuJ16WL2Nwc=; b=M
	31XUbFx01m41pY0aPUUcTAF2bPy3sI+44y2YHWSmAL0hg4ULnXy1ugm6s0LVf07x
	p9aG8R7JyaXtLj/5IeM4+R7756OP+q03gmnw0hqkHcIVMUhyL6OOd14DaEARrAzR
	GKZW667tWvSopXS+acodde2KTmSxaD/OQkcySVhax3QiR/mP4sffRpRUSVRmB7ip
	ncaVmqTmYXVEBSAYRudWdFIXe/AnU9e9rLtpQlXY/PfoKw5svNpBSNfpuD18VNta
	+B25tVAtfcESITXspx1+D4tDXVe7pRlIveG7aEMNMA3RX3HhKQc5E2OjKaG4G44O
	1aj7gbVodAWn60XNGf/5w==
X-ME-Sender: <xms:499RaEZD_DlwPXCnsdyogv7IV5w7uPrQLjTfvqiLKRbRUxj5sdDxgw>
    <xme:499RaPakV1Wq3hwDWLkIgQO6_xRrd6sqHJu7MPYaM_bAcS-NMqMImq-itkOp-HJn_
    nRBMJuRsm7gt7xAQKg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefoggffhf
    fvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgr
    nhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhtdfhvd
    dtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusg
    druggvpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprghkphhmse
    hlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhsthhouhht
    sehlihhsthhouhhtrdighiiipdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvg
    hlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:499RaO-YrnKBr6kD2zpEtZj8WFHNNs16X2XwlKriRaTyIwsXKatIxA>
    <xmx:499RaOpD9TSGIyXm5Wyt2wflEPxnhYF70iqyO1R5h19OGosdJgQxcw>
    <xmx:499RaPrqbauIWDLrHOiD3aGrYOzP9PWPDpT0FyfK_jq8SQzdj9w87g>
    <xmx:499RaMRESKoovWdkB_o--liF-aHtyJDhPXGI6IB4sC24oxqcJadqrw>
    <xmx:5N9RaMUQuUeyhdGj81brsjrmx5va47oZdymrgrrGOLa8EzP2Bv5pHvCy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BE505700063; Tue, 17 Jun 2025 17:36:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5ccd62e2b06e7e21
Date: Tue, 17 Jun 2025 23:36:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brahmajit Das" <listout@listout.xyz>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Andrew Morton" <akpm@linux-foundation.org>
Message-Id: <2fb06649-f2e7-4ad1-a831-f8b6b0dbafee@app.fastmail.com>
In-Reply-To: 
 <s6pt2qblbwmw5uz7u27ypyyercpm4fbd7qt7qaabceasxdtd3x@jucvfmzzcueg>
References: <s6pt2qblbwmw5uz7u27ypyyercpm4fbd7qt7qaabceasxdtd3x@jucvfmzzcueg>
Subject: Re: Failing to build mainline kernel for arm
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jun 17, 2025, at 23:23, Brahmajit Das wrote:
> Hello developers,
>
> I was trying to build the mainline kernel (top commit
> 4663747812d1a272312d1b95cbd128f0cdb329f2) and came across a build
> failure with allyesconfig.
>
> $ make ARCH=arm CROSS_COMPILE=arm-none-eabi-

The problem is likely that you use a baremetal toolchain, rather
than an arm-linux-gnueabi or arm-linux-gnueabihi toolchain.

There is some logic that tries to decide if uint32_t should
be 'unsigned int' or 'unsigned long' based on included headers,
and it seems that your compiler comes to a different conclusion
here.

If this is a freestanding compiler, can you try adding
-fno-freestanding to the cflags?

     Arnd
