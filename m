Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CE12C9A;
	Mon, 10 Feb 2025 00:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739148890; cv=none; b=M161L2hEcUTvSNkMrzywAwpwqwMhtJouYP07Iy2ytkaOb6nlKFWbb42meek49xmkRZoBwuRK1y/3jbXfgGsdFxmOKolMzN2v+wz2mTzDdKUGO9DOY9hvG8ctmrExWMtkE3jJV64s2Q5m6d2by6hzfiQY8GFRmCdWsDUHRpYObh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739148890; c=relaxed/simple;
	bh=INE/y+diy6rB8cV30VSYLcs5n6iEuyvICq/OuyASUw4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pUvTgeykqC/oJMg86ZGLt5puj0RThz/SAcobtgeF3x/F/1kUwvpt2YYuoPWOTBR/Xm9JMmJXkWjFfpUeSgPPxUCdQIIU9k4KNh0+BLM27zKSB8iCAnk2e7Kca7O34I39nAFWL4HvB9AgJNucjQ/CMzYEW6mVTbSGXZGw1ueVvRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=w3DNxuTG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q2E91zgi; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="w3DNxuTG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q2E91zgi"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9CB8C114017C;
	Sun,  9 Feb 2025 19:54:46 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Sun, 09 Feb 2025 19:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1739148886;
	 x=1739235286; bh=INE/y+diy6rB8cV30VSYLcs5n6iEuyvICq/OuyASUw4=; b=
	w3DNxuTGHnSqZUg83pMkx0A4JDr5G5elPX8eYsGKcZDJfHd3vwyeh7eU/3+2lnHK
	k7EDcowrNwNsa59evCQ/6a9R89FDrmBIEfTUnZ3XwijnElniqhCvxPwr3faQxYBX
	Tig7TPGhtDGrb7GSPGMl9VJ6tj80gwxwVrNoWDu2nA/BtyEZAq0+mBnuVaVQg0Fz
	bml8oMMAGErcHiJsPc/IZ5/bBs1UzNcZwqq20UPzPyGAOlHesiYlPX/2CAs6xWgw
	iWZvcW9Ri/Wppo7m4lgVrlfQpIQnY8cqSLGggshyR3bY6QD3O0noJ3XOS4z1nRDM
	G7L/duUqQ183SwGIcJSvqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739148886; x=
	1739235286; bh=INE/y+diy6rB8cV30VSYLcs5n6iEuyvICq/OuyASUw4=; b=Q
	2E91zgie+4ai2ReBkr6pDuDxuGTcJdg5zJAbkUwRPquhrSXpvxwHJEVrdb/F4KH+
	R/3+BcsOw2kaAwYnnvEgPjZ5OOC8sV5DfmOJSJKIGPt5vtKcG/TnnX2cP2WKbWbS
	GEeu1R9kuVKhi7ui1URy3HSb+Ag+rje2juWM/BjY3kbjRkuZdU3SOJFVhnmBha3D
	Mig1N+3rDVFCZTXkO2HHNad/9vaD3t4lHqzKW/RiVjtU2/B8T6kvZpN9pJgYao0O
	+vxoSfUkfmskQZ8+iL0IcQCiRu3WjMEH63k6Ln2m7qOtkjUbSrQvwtRyc5daGAWW
	npIeAcl3e4jCsRvG56stw==
X-ME-Sender: <xms:Vk6pZ3EUIzzqgZ_yMEzWUQsCsudIx4WIUU0Q8-gcFYoeMmBD27cwEg>
    <xme:Vk6pZ0VWbz1jjAxQEn0NOZjhmsQFO_iSknEjOyO5KLKygI32bMP-yM1wQ7MJdhzbM
    yJL919n7Iy8otE5T0E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefieeiiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Vk6pZ5IR5oQCU2IjpOW0CHdr9lLY3T755XIIcwXuFBZ8ORmM1cJlAw>
    <xmx:Vk6pZ1ETOl2QBMKG2CLPMmFsz7Xhtvt7gikb--DQC_EIPLpYvXYWVg>
    <xmx:Vk6pZ9XDBCiCRq0j2Q0gkY_e22fGJ1dI27ZzTXPv9lXNc8Ymb4jbow>
    <xmx:Vk6pZwNcOxHjRs0HoCOZi6WV0_HLpift3vL9Ybcw6esEVDl5ml1VcA>
    <xmx:Vk6pZ7fzHvMu1uG6vwDBkNSjWgzgY4Mw4ZlpLn7fMwdE-D-MBq2RGPxb>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 20AA83C0066; Sun,  9 Feb 2025 19:54:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 09 Feb 2025 19:54:04 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <be3804af-339a-4b5b-927a-06d98dfadc11@app.fastmail.com>
In-Reply-To: <D7N45UX5LBMY.NCG1A7Y0SKXF@gmail.com>
References: <mpearson-lenovo@squebb.ca>
 <20250208091438.5972-1-mpearson-lenovo@squebb.ca>
 <D7MSPR52PB4E.N0X1UFVQOODZ@gmail.com>
 <aee5fbe6-4309-450f-bea3-c0842172b043@app.fastmail.com>
 <D7N45UX5LBMY.NCG1A7Y0SKXF@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix registration of tpacpi platform
 driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Kurt,

On Sat, Feb 8, 2025, at 8:54 AM, Kurt Borja wrote:
> On Sat Feb 8, 2025 at 11:26 AM -05, Mark Pearson wrote:
>> Thanks Kurt,
>>
>> On Fri, Feb 7, 2025, at 11:56 PM, Kurt Borja wrote:
>>> Hi Mark,
>>>
>>> On Sat Feb 8, 2025 at 4:14 AM -05, Mark Pearson wrote:
>>>> When reviewing and testing the recent platform profile changes I had
>>>> missed that they prevent the tpacpi platform driver from registering.
>>>> This error is seen in the kernel logs, and the various tpacpi entries
>>>> are not created:
>>>> [ 7550.642171] platform thinkpad_acpi: Resources present before probing
>>>
>>> This happens because in thinkpad_acpi_module_init(), ibm_init() is
>>> called before platform_driver_register(&tpacpi_pdriver), therefore
>>> devm_platform_profile_register() is called before tpacpi_pdev probes.
>>>
>>> As you can verify in [1], in the probing sequence, the driver core
>>> verifies the devres list is empty, which in this case is not because of
>>> the devm_ call.
>>>
>>>>
>>>> I believe this is because the platform_profile driver registers the
>>>> device as part of it's initialisation in devm_platform_profile_register,
>>>> and the thinkpad_acpi driver later fails as the resource is already used.
>>>>
>>>> Modified thinkpad_acpi so that it has a separate platform driver for the
>>>> profile handling, leaving the existing tpacpi_pdev to register
>>>> successfully.
>>>
>>> While this works, it does not address the problem directly. Also it is
>>> discouraged to create "fake" platform devices [2].
>>>
>>> May I suggest moving tpacpi_pdriver registration before ibm_init()
>>> instead, so ibm_init_struct's .init callbacks can use devres?
>>>
>>
>> Yep - you're right. Moving it before the init does also fix it.
>>
>> I can't see any issues with this approach, but I'll test it out a bit more carefully and do an updated version with this approach.
>
> Thinking about it a bit more. With this approach you should maybe create
> the tpacpi_pdev with platform_create_bundle() (I'm pretty sure you can
> pass a NULL (*probe) callback) to avoid races.
>
> platform_create_bundle() only returns after the device has been
> successfully bound to the driver.
>
Unfortunately having a null probe callback doesn't work - you end up with an oops for a null pointer dereference.

Thanks
Mark
