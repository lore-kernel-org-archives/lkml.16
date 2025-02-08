Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CEA19F11B;
	Sat,  8 Feb 2025 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739014035; cv=none; b=Tow7LlFH0cLB92q1JDytgbUQXTXvjqPAjhTjIoc1yIu+T8fAeQEZHL058o1kbnbJxXQqI7v1JwKb0V3VJ+l1UaijTPpnyJhy6iQ1Zk109ipCI4cCqYy4lx4ofNMIWdgqpKyk3Fxa9kVof4PI3DX4qHguD+vvT04lRCgDYGCyWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739014035; c=relaxed/simple;
	bh=qnz5zuMzIZq2h2eLlk26+f6hdHlDE7lsfYLFciY9oWw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZCPsHbfSIVSeodTNHSUtkUblO3Z3hiqJfYR4FW+701pzAApcUwknGK7DrpEOPlIVDaUZamsVMq+r9tEysjOG1jOHmuQipLRJnI4jdOo+iU/W+QEcTPjq38GPV1jQAXpJ18iC8jBVil8gHQcUjlPlJyuFIxUpqGuH+OHuFS7MysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=asvi8iCG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NFxMLVXw; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="asvi8iCG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NFxMLVXw"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0849611401EF;
	Sat,  8 Feb 2025 06:27:12 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Sat, 08 Feb 2025 06:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1739014032;
	 x=1739100432; bh=qnz5zuMzIZq2h2eLlk26+f6hdHlDE7lsfYLFciY9oWw=; b=
	asvi8iCGOQuMG5YU8COXvDZHh80Jb0VM3/BqgqvLUIpqh6QNePtF5aQxFvmcVqEw
	e4mNeXC3lbR5dasuBJ1/8Mg6al23JyscdkPSAX0day1vGs4CAAGve+5IckW4+GjD
	x9NUkVwq3hL5no/VlS6r5NlJ9oXL3g3YDY20bPCH6Uc3vQyqqid5nFjceIhOalya
	Y0seZ1oY8k9SvuLS7+phu0k+35vAjYounnvwYO9ZdJIg0yrYDizukOWadAnvtz2G
	yBW3unbh9jGtPi9sZFi9W0WMiBJVPFgCj7klv/0Ju6ZInWIxILjcm0GHGw429ogq
	shjSJ/wBOPjSFBfqk1jDbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739014032; x=
	1739100432; bh=qnz5zuMzIZq2h2eLlk26+f6hdHlDE7lsfYLFciY9oWw=; b=N
	FxMLVXwAXKjzTsxUB+hmxlErJeNmX/ElkhQp4VMiHS44XXEqVGrPtZ1VpuVEmQBt
	E5p/398sdppXkMTXvKAX9wv7jG0qXSsEqxsaU+TORUI73JqhDgKiYeeiZZonh2Ls
	wEfco6x+bK1OjM7r1i50cACfCAo1YCXiCFj5uwvGm/WVsYy4foEXZj3GfPVnm2+a
	A2nLGccJQiSgtUTuy7+YSd9NHzgYVgE5xV1AIv3TF2L8kuClxaJFhQQ2qOOAA30D
	OL39WV8mZ1uGlgoS7lcIqKVshKtbCeT36/uJOqTj4knLFrZXnDioRL3em+qLja9j
	mfaMfMoNUbHXcTE1IKNBQ==
X-ME-Sender: <xms:jz-nZ36O-9zKLnRpoOcUtGoivmJfu26AIGjYZGGy5c_WnaOV4O8i2w>
    <xme:jz-nZ877PgFiFWkPTJO5xIiI2o_JNE5PvnqI0aWACPiuyxaiW8jOjj07CD9YkansF
    sMKUfTA5DNC9PGJ_E4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehteeghedt
    hedtveehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlhhlohesrghmugdrtghomhdp
    rhgtphhtthhopehkuhhurhhtsgesghhmrghilhdrtghomhdprhgtphhtthhopehilhhpoh
    drjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhgu
    vghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnh
    gvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdq
    ughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jz-nZ-eiVNvAYKGvFYT9RQLYs1EjkDI9sQy2Drj9GWIhU0PPea6v-A>
    <xmx:jz-nZ4JSPDFszYuQyd8UKHnPATH9Ezfj0uhR1fMUskggHCpB226w2A>
    <xmx:jz-nZ7Kx6zD9DhU5zX8puzx3pblIukLZYHQnhmyZ_MTQ00eV0yO5xA>
    <xmx:jz-nZxwx_0I3vYzYkesTcSrxHkLYHhQpMRYKXqxiOWd0rtGOkmVLNQ>
    <xmx:jz-nZxjcnOWFnY-6mKO7QrWkWiDY9hY_SMnK0LcFUCguVjVexaaM7GGo>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 949B93C0066; Sat,  8 Feb 2025 06:27:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 11:26:51 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <aee5fbe6-4309-450f-bea3-c0842172b043@app.fastmail.com>
In-Reply-To: <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
 <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi platform
 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Kurt,

On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
> Hi Mark,
>
> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>> When reviewing and testing the recent platform profile changes I had
>> missed that they prevent the tpacpi platform driver from registering.
>> This error is seen in the kernel logs, and the various tpacpi entries
>> are not created:
>> [ 7550.642171] platform thinkpad_acpi: Resources present before probing
>
> This happens because in thinkpad_acpi_module_init(), ibm_init() is
> called before platform_driver_register(&tpacpi_pdriver), therefore
> devm_platform_profile_register() is called before tpacpi_pdev probes.
>
> As you can verify in [1], in the probing sequence, the driver core
> verifies the devres list is empty, which in this case is not because of
> the devm_ call.
>
>>
>> I believe this is because the platform_profile driver registers the
>> device as part of it's initialisation in devm_platform_profile_register,
>> and the thinkpad_acpi driver later fails as the resource is already used.
>>
>> Modified thinkpad_acpi so that it has a separate platform driver for the
>> profile handling, leaving the existing tpacpi_pdev to register
>> successfully.
>
> While this works, it does not address the problem directly. Also it is
> discouraged to create "fake" platform devices [2].
>
> May I suggest moving tpacpi_pdriver registration before ibm_init()
> instead, so ibm_init_struct's .init callbacks can use devres?
>

Yep - you're right. Moving it before the init does also fix it.

I can't see any issues with this approach, but I'll test it out a bit more carefully and do an updated version with this approach.

Thanks for the pointer.

Mark
