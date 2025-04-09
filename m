Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF4E2676D2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744214032; cv=none; b=Um40DsCgEEcw2ob2tTn9e2YBn7M7QeIhSjS33zGDnSjGZMEAM7in3rAEBG61tLCy/1JzudoLTJ7L0w5Wta+UfJyuBKIr29vCgEZoV04mgHb4jvD1zhgWw6pwy5wrNGHvchBeGWymcS8y9oEZu6myovcCxpU6cTXTqnE32hyuuiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744214032; c=relaxed/simple;
	bh=pNhG0EnmVdwrwDGtyQTXiwAzMhCmXiv4+lJrCm20IjY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jHrzpMW08oGiKUqAe0BW57Dy0v4j3v0da9LBS9bpYk+3OACQmr8AlDos/gGKNjm+O0avhDvFC90f8AGFr16Zf8OomT7irztjdRPy50NgdlYLMIx98IyPSFcKqLRFL9O6Ibe+xXqKDlvkxos54t2TFbl14zOjwFA0nE6mWTSLCP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=dbgG1MTF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Hc+yfnnA; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="dbgG1MTF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Hc+yfnnA"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id E65DF11401B2;
	Wed,  9 Apr 2025 11:53:48 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 11:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744214028;
	 x=1744300428; bh=v6mbfjpSQ9BZF9kQphoQ0+rTxnitlIMWjcst3JYDbGs=; b=
	dbgG1MTFw36UU9ion06aA11dqMwzDAdOywB14qK0VnKZQ7E+wtxB8KpfvBD6XW69
	x808/C3oOW0mnuPXeB0pceD4SH5sPVBO+f+GCsG2hKdWCtKj6nhTYLbY9z8/QSqy
	ahclIYiHzNhM8oI+Gr5W8fjSrn5Wy/J+VOF2QOUQSGVT+faBMlX4UIlJMwxNKDt1
	N9TSAyLBkKfeIKbupZuygexRnPSjc1I31342IZEn3iZveIld9XJXpCKKRdOdeC9N
	jf2gbTmW41Og6RUNx5z4+CBEKes8DID9OfVCLADGpLBFGWlBYzqOkTZNBf3qy4yS
	UFNKgoPxuUiSzMTWs8QnGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744214028; x=
	1744300428; bh=v6mbfjpSQ9BZF9kQphoQ0+rTxnitlIMWjcst3JYDbGs=; b=H
	c+yfnnApQ27JDr0XkcBVtgkQBtL8/mbiyVmoJex2v0Z7ETTgjTrf0lY4Auqrk96S
	oLQG6QfyHUWHKyzq6ofIXy5xTK/M71555wAmPv6RC58V5MX4X0Mk8W8NfmaEZa3v
	o9j85DYur+Xii4X9sz6RAcxsFDT741kUAbKnMZdJneaTSYqYbxsukeXq9NmzrQic
	V6oVFxR55mZ3mpDT3+TBNyQHu1yF5hBPAFxHjbltIGiU8YlGmmCc8cyvfdMA0CXG
	zl6hGNpcFRzUaLmAHBApm0QJ/TQYml9LrYTGagPnXk8zeicb8oJ6KULXmv3eZspK
	jMYqKqGILDop0cgiQ6vQQ==
X-ME-Sender: <xms:C5j2Z2x4xrJHrrVbc8LBimBqLjZ4U3SVSMbA6OmVELeNNr16y3KqIw>
    <xme:C5j2ZyRqOGKVNBvCPTBpwMnjOyG2Pu2nE255UCihlP9uuPjkc_sWjzUYn427n1sXr
    mEtF3XxIffcB9755yo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeigeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegthhhrihhsrdhprggtkhhhrg
    hmsegrlhhlihgvughtvghlvghsihhsrdgtohdrnhiipdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsvghrgh
    hiohdrphgrrhgrtghuvghllhhoshesghhmrghilhdrtghomhdprhgtphhtthhopehmrghr
    khhushdrshhtohgtkhhhrghushgvnhesghhmgidruggvpdhrtghpthhtoheprghrnhguse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpd
    hrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkiheslhhinhgrrhhordho
    rhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:C5j2Z4Xh8YlDeuSfq5YlPbTbsY_kn9yrAEPMJ3BTzcCfjE646H0hYA>
    <xmx:C5j2Z8jvGY6al2JV2Z7ZlQP5I74mpwV343eFEvJ0jHL4KVWsqYk-dw>
    <xmx:C5j2Z4CMHIfKwFX_zA9bLsqwX0t3GRJs_NNbvFUSmkNwKda2lIQleQ>
    <xmx:C5j2Z9JuSTQMjpgyQjyuLfbHmR3E9y0mUoxAD4WkyabSS2PU6MyjOA>
    <xmx:DJj2Z3y37IR9uowz3zJO5rpx9eIw7H7de8ArEccZURD4spN6-DfVjDsU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CB9552220073; Wed,  9 Apr 2025 11:53:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T8e29516e39cd4cc0
Date: Wed, 09 Apr 2025 17:53:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Markus Stockhausen" <markus.stockhausen@gmx.de>,
 "Chris Packham" <chris.packham@alliedtelesis.co.nz>,
 "Mark Brown" <broonie@kernel.org>, linux-kernel@vger.kernel.org
Message-Id: <ec655d05-f56c-4ee1-a26c-53d0207dc559@app.fastmail.com>
In-Reply-To: <Z_aSrU0oHAvFfyBW@smile.fi.intel.com>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
 <20250409122314.2848028-2-arnd@kernel.org>
 <Z_aSrU0oHAvFfyBW@smile.fi.intel.com>
Subject: Re: [PATCH 02/10] [v2] clocksource: atmel_tcb: fix kconfig dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 9, 2025, at 17:30, Andy Shevchenko wrote:
> On Wed, Apr 09, 2025 at 02:22:54PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> Build-testing this driver on arm without CONFIG_OF produces a warning:
>> 
>> drivers/clocksource/timer-atmel-tcb.c:368:34: error: 'atmel_tcb_of_match' defined but not used [-Werror=unused-const-variable=]
>>   368 | static const struct of_device_id atmel_tcb_of_match[] = {
>>       |                                  ^~~~~~~~~~~~~~~~~~
>> 
>> Change the dependency to allow build-testing on all architectures but
>> instead require CONFIG_OF to be present.
>
> I;m a bit puzzled, maybe due to my misunderstanding of the first line...
>
>>  config ATMEL_TCB_CLKSRC
>>  	bool "Atmel TC Block timer driver" if COMPILE_TEST
>
> ...^^^ of the dependencies.
>
>> -	depends on ARM && HAS_IOMEM
>> -	select TIMER_OF if OF
>> +	depends on ARM && OF && HAS_IOMEM
>
> But doesn't this still mean that "all architectures" (from the commit message)
> do not apply here (it's all about ARM)?

You are right, my mistake:

v1 of the patch allowed building on all architectures, but that
turned out to run into other bugs, so I changed the contents but
forgot to change the changelog.

I've sent a v3 patch now.

      Arnd
