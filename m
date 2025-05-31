Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B1194080
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 19:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748720489; cv=none; b=tYiTvx3wG/NA3zSao1oR6jbQJsLb6cjQuVujLtq9NbQLfo8fLSm3hAgbLscY4hHtdVYl0JYkj2kyYHtTJ5w22r8nx8aCGEsYiNqK+zpZdNFY54CefoYBowUSBfjMYQ7C4l04zFj+k/DsayRDBoJq/tAyaf3jZkjHQTNvJJXtxuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748720489; c=relaxed/simple;
	bh=Tc6i91jv4D6JPTrOu0U8fXhsABJE+HG6hiR88UajpIE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=V/5fBJLvHkRUTjxX7Niqf2VJ2uXnNx8Ptki6lfR8ClRdPWbc3i81MayQjen3MjFCCPJgojPl1LLodWCPkhyt+HHnvN0XUUsqTLJac10fbftkExv2Fz+5B9rhVTJGFhKu2My1nZZnA/nx8hcZUnqqOk+kHkxFhei/kYD4LvJQbEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=gBEYy4N5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lEkohKbf; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="gBEYy4N5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lEkohKbf"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E310111400E8;
	Sat, 31 May 2025 15:41:25 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 15:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748720485;
	 x=1748806885; bh=lGyxiWQu246vWq6BDCxMPVmSxDCFx4n0GPMaz0otyRM=; b=
	gBEYy4N5RrRnL55M+SEhI8sgMTbEwGw2Mp8z3wyb003JS/4a2OtDNuQTGfTH2H4d
	+ynBrm3uUjTVRUKofXZQSxp/KSTenAqLGwIkufGrRwl9t4L03t2VuzopJZ5s9Ysz
	ZXgi6V4fHTiw9dbd3jEHo0q75wgxMmsGvrx1mw75DdMZ+fdzkNq5dHJTAHId1UA3
	b7e2Z2ez3Z2ZfQnDG0omdQRAw3w1/LBtV/F0htxCNR6Y7lfu23a7ghq5luKgo8hv
	NqVaECm6Pd73yGoWsjk/mI0DhAEvlfDs2XLvXnC5E65rNB8QHS8caRkS5oK0YC5O
	Q9dGiR/osUlWCtWlZKz4Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748720485; x=
	1748806885; bh=lGyxiWQu246vWq6BDCxMPVmSxDCFx4n0GPMaz0otyRM=; b=l
	EkohKbfTe4PhtyMv152UftnIuF/lvYa+EqBTmz27UO1JT2Xj8SLeFXWNhXU2sUAB
	uIjKwbJkntGC6lujkGJQnBHcfCb9iTGt5afydayP4SF926luB5/DGhkPCYwCuZNc
	wVxc5tO1CtI8EIdunFhFG+szfR4Axf7sBflfBilNhpWAWPbVuCK4VksoZSLgcB5Z
	wxpAXrThLxBK4RTEVmu+6xp7wGzZ0agYEMzWftScV3m0tNtK+vliDMonfHOJ0FXX
	brFDFIO/XThUzGsAY0L0I3nLDNcFKk92UZVWp6oDfgwWTCb5bU3H/LtaQ8MKfn94
	lGfZpAfgi/FyvpcdfIOnA==
X-ME-Sender: <xms:ZVs7aLFi20kOcjITXYO6R76E1m9ZZijnFa-anCtS9jqQeUGXLkEnew>
    <xme:ZVs7aIUnNk5xrYGQyzIYbmJW8DI94DW-tieVVgGyeC5ckKCY2UwYnlGPX7HxSouDU
    3fAedPdkvXFIfznbF8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefvdejjeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeeh
    udekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
    pdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtoh
    hrvhgrlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ZVs7aNKpjLDa1aeJbB-w18mBxHQKnqxXdd1LsuTluYlYkW1g1Ylzmg>
    <xmx:ZVs7aJFm8nqNo55ni2jyl5kRid-cS5FNhgKC61FeeZPlIKdRy4r-FQ>
    <xmx:ZVs7aBW2S6l8i2NkWn5x-Zs7w9AiQEEHtwZesoM9nBUx3tUovY2vFA>
    <xmx:ZVs7aEMBFq2gN0M6rey7SzWHDVrGW756B6ciXOxKF_XwY1ASDCoaDQ>
    <xmx:ZVs7aLv9tRsBXX6fPBFYDezR00vfJlBvbAGhDlLT7eHv7FsWAo_HQ4BR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4AA27700060; Sat, 31 May 2025 15:41:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Td417e939653861c2
Date: Sat, 31 May 2025 21:41:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <8b69d0ec-448c-4552-b445-a5f387bef459@app.fastmail.com>
In-Reply-To: 
 <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
 <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
 <CAHk-=wgHeidY7Y65-4N9AJEy69jEJRo1S9yQzEJ7_J6jpJMfVg@mail.gmail.com>
Subject: Re: [GIT PULL 4/5] soc: devicetree updates for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, May 31, 2025, at 17:14, Linus Torvalds wrote:
> On Sat, 31 May 2025 at 02:07, Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> There are 11 newly supported SoCs [...]
>
> .. and then you go on to list ten of them. Or 12 if you count Amlogic
> S6/S7/S7D individually.
>
> Just checking that I'm awake?

I'll pretend that this was intentional and the number included
the extra SoC from [GIT PULL 5/5]...

     Arnd
