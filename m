Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060932FCFD5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751635577; cv=none; b=JQvPhL2NG+SzGssQDb4S9n23JhN0CYeW/6/aaeBbKs8+hTpmEERndFywRHa4J5wKLBDztldz0JM7PP3x7qvqE8y1Cm4R2NZV9zOTrGnCf8nO8EbS9qpU5kjJqCYR2fY/mUYtbXMyiP4Cy8U8s9FyL7/E0aet535FA4y/b0VevlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751635577; c=relaxed/simple;
	bh=VX6+07OlBvdVurIFaLW6+V8PisoR+MfJjrSzNSpsWn4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FBLIpRBO2dMSvpXDJLNM0wh4biBLdoM2Stx3qvQL7e8Pqe4LLgUTQMVrJGW9Dt7kpVV2FuKywcwfgOIdof3CUp1PW32jY1sjDC0dZc/3x7g4dJK6kzIjYXq1hEZloLC5BqZYpuhCeLz8e+cDLuoniI1QA031Y7F1QXdvHg7JqFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=TxHwJsRC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G3iiHkaG; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="TxHwJsRC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G3iiHkaG"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 17F351400050;
	Fri,  4 Jul 2025 09:26:14 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 09:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751635574;
	 x=1751721974; bh=0ZloyuLti+veXdRAqh8wc/WuvsauFNQxMlfrmRS7W0g=; b=
	TxHwJsRCHUOzfzsTeu2BPVdO9p05HOyeIz19I/U9cIgAlszv0w52NsG1tdqsAlQD
	RLqzTYCk+DVj0uX6F+cvcM8TfKZ0RUKmbcV9aJjiMoKwaGkWEPM+14TVhx8Dgma+
	9Wd7dZltVA4lC6QZ3/jYZJIGUYxrsZlw/tsj5xo/D/fhURE2y85nEkga/T3oAbpF
	yZPWkCnlP3wau+OUP9ueIdlp+Qz2xcC3fTfaTGbo7Nr2P0+mhKtmQkudjbemcEqt
	jPI0/S1cPbmcWNmMZeJt4pe0cr5m/W6EYz6wmWJqcGgdAvCsuJ8EF9O6DBJdfkhx
	NWSQmoCqIkDNNVxEZ6N7KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751635574; x=
	1751721974; bh=0ZloyuLti+veXdRAqh8wc/WuvsauFNQxMlfrmRS7W0g=; b=G
	3iiHkaGZ9iOdyeRUnW4rZSRNcwRs9J27kG2jxwETdfosEtoQFR8Oirs5O6OJTxL9
	kPewPt5DGO8K4bISq1QCsko/Jvlf/p3Np1HuXcoKOg9B9+wo46haeu253UPnIBqy
	gkWC6O65o1IrngFDF8wHWl0U1XjctkgMWqRIlvEjbrIvlN/3WvdcuHYvP3hXFISQ
	W+s3ZPsCYhQufEa+RiSJdGeHnWPvYoeDxUQ2pwSA6cd6M1fRsUbFEmSZiiVsz5wh
	HValx4RxUkTgMh6xKmqyhq0Yo73DAwO+4Fm4ZrnXqsCtXtAANPamfX/cqAOtHZj5
	v25WrR2zr4LXq3oA+kzWQ==
X-ME-Sender: <xms:ddZnaAQnamOPys1BQV-Vw4NUQK6i7ymWoaSKouhRAqsFJxZxHtESwg>
    <xme:ddZnaNxQ5mqd7ABzpw9eXqAjbg2ywwZvnIOW_KePA9f9Dqsrl1ftETBc6mbCmfICj
    krVVoqP8HbZi_J90ec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhpohhimhgsohgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehjvghffhdrjhhohhhnshhonhesohhsshdrqhhurghltghomh
    hmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:ddZnaN1t5robpXRhlpLyT0AraYqu7ZBWUrMxpucXaYuteBRJ44mScw>
    <xmx:ddZnaEDBcM06oG9t1-XarfxuM2XVxYhjP5yZhGN73FDqRRYZ2t1t1w>
    <xmx:ddZnaJiM5anMk-eF_HBtAdh24F9h2Hvmn3U8wOHflDx-KO5SPltUjA>
    <xmx:ddZnaAoJFIAZGk5SqsHrhLvMCA96ykBUHfQfrFGIlZipqDCS6f9UYg>
    <xmx:dtZnaG037kqTpa3nXDSNir5wHHWvaPHHBHmxZnLA7SySe4om1AnELnV->
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8FDC1700065; Fri,  4 Jul 2025 09:26:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T64ccb58220bb6c4f
Date: Fri, 04 Jul 2025 15:25:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jeff Johnson" <jeff.johnson@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, "Peter Zijlstra" <peterz@infradead.org>,
 "Josh Poimboeuf" <jpoimboe@kernel.org>
Message-Id: <617201f8-1ad7-4403-b195-8c80d35ea30f@app.fastmail.com>
In-Reply-To: <8362b484-ea77-4825-8ccb-d5acad660102@oss.qualcomm.com>
References: <8362b484-ea77-4825-8ccb-d5acad660102@oss.qualcomm.com>
Subject: Re: build failure with crosstools gcc 15.1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jun 23, 2025, at 21:52, Jeff Johnson wrote:
> I've been using crosstools gcc 14.2.0.
>
> Today I saw that gcc 15.1.0 has been added to crosstools:
> https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/15.1.0/
>
> But when I try it I'm getting an error:
>   LD      vmlinux.o
> vmlinux.o: warning: objtool: ncsi_process_next_channel() falls through 
> to next function ncsi_channel_monitor.cold()
> vmlinux.o: error: objtool [elf.c:1360]: elf_write: elf_update failed: 
> invalid section alignment
> make[5]: *** [scripts/Makefile.vmlinux_o:72: vmlinux.o] Error 1
> make[5]: *** Deleting file 'vmlinux.o'
> make[5]: Target '__default' not remade because of errors.
> make[4]: *** [Makefile:1217: vmlinux_o] Error 2
> make[4]: Target 'all' not remade because of errors.
> make[3]: *** [debian/rules:80: build-arch] Error 2
> make[3]: Target 'binary' not remade because of errors.
> dpkg-buildpackage: error: make -f debian/rules binary subprocess 
> returned exit status 2
> make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
> make[1]: *** 
> [/local/mnt/workspace/jjohnson/kernel/laptop-debug/Makefile:1635: 
> bindeb-pkg] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> make: Target 'bindeb-pkg' not remade because of errors.
>
> This is with a simple x86 make C=1 W=1 -j8 bindeb-pkg
>
> Any thoughts?

Hi Jeff,

Sorry for the late reply, have you figured it out in the meantime?

I couldn't immediately reproduce it, so it may already be fixed
in linux-next.

My best guess is that this is an objtool issue, as new compiler
versions tend to trigger new cases that were not previously covered
in objtool.

     Arnd
