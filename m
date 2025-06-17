Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490872F530F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197541; cv=none; b=L5un3paGXuOrQOA2jsaZhkETMHnEpjD6DMffF/JSD+AwPkZrYiOOe0+3jlKCowVcuH6vnOwBExsG/P7EHJDPN+KPnfGTJxhk8/Xrc19E1kW9A9CosGVHns/8ODgdpZr4Ki8GWnUTBId/E3i9LeS8BBuhTdZEQTaQIGfOjKWTLXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197541; c=relaxed/simple;
	bh=MoVzKIXxcztBjecG02u5F9uUal41Ei1Y+kC17xZXZ2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQ413wrzvCtitrO1r3QCYvwNr3jgOfIhKDly1GsMuS1G+cynvsU55vO10IxXTOZ+2fXZPkoWg9PzXAO2kMTZDtZbLeTBEonUzrcLrlbwZRg9jZq47ufeUcp58rf+3+hN4pXKcsawMGM97qBWkhNxONyf7WDNY7w4SNezX8qUMXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=kdtOwvy3; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="kdtOwvy3"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bMLNv0dfCz9t7Z;
	Tue, 17 Jun 2025 23:58:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1750197535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8KGlUuLqIAraPNE6+k/JFDEoNyAOBztkK8YvDc47oJc=;
	b=kdtOwvy3IiqxOmFyM3hzk27AsqTdPfT5pNZbvL2ckyEglV4BThClFF6iV4Y5fgZSTlchAS
	/sKSkjQvv3DFTh49vbsdi6To3IpvLRoFInFnF89ewoVOJoWYzfyPbbWLjirdCGHufxOrTh
	sHILb6QyYbk5asM4LBkRccb+8pPcZ15ZXS14uOgek1NQo7IRsT42jBS2ILZlut8cMO3+ZI
	cOfDu9TOEyr6NuT/3SS5mBdJRL+4LvMs2MQxKGLor7HiFNcKEaGUBPj5wNrwKN+Ztq/RWT
	oTfnAV9gjfgQvLYTX24dOR5QNn5WOCJ3Z0/isnyaW9tGbewSmAs0wvx7DxXsug==
Date: Wed, 18 Jun 2025 03:28:51 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: Failing to build mainline kernel for arm
Message-ID: <2l4mufrnhf6vka4cp7q5pcqphlk6b3gfd4m5c7yelczhubpwta@mkn2a7olzjh3>
References: <s6pt2qblbwmw5uz7u27ypyyercpm4fbd7qt7qaabceasxdtd3x@jucvfmzzcueg>
 <2fb06649-f2e7-4ad1-a831-f8b6b0dbafee@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2fb06649-f2e7-4ad1-a831-f8b6b0dbafee@app.fastmail.com>
X-Rspamd-Queue-Id: 4bMLNv0dfCz9t7Z

On 17.06.2025 23:36, Arnd Bergmann wrote:
> On Tue, Jun 17, 2025, at 23:23, Brahmajit Das wrote:
> > Hello developers,
> >
> > I was trying to build the mainline kernel (top commit
> > 4663747812d1a272312d1b95cbd128f0cdb329f2) and came across a build
> > failure with allyesconfig.
> >
> > $ make ARCH=arm CROSS_COMPILE=arm-none-eabi-
> 
> The problem is likely that you use a baremetal toolchain, rather
> than an arm-linux-gnueabi or arm-linux-gnueabihi toolchain.
> 
> There is some logic that tries to decide if uint32_t should
> be 'unsigned int' or 'unsigned long' based on included headers,
> and it seems that your compiler comes to a different conclusion
> here.
> 
> If this is a freestanding compiler, can you try adding
> -fno-freestanding to the cflags?
> 
>      Arnd

That makes sense, its a crossdev[0] environment/compiler that I built.
I'll try adding -fno-freestanding.

[0]: https://wiki.gentoo.org/wiki/Crossdev
-- 
Regards,
listout
