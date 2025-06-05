Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D78B1EF080;
	Thu,  5 Jun 2025 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749138854; cv=none; b=l3TkyzSXhFGRodEPehmAEMx6wzHKGoRpNEOxTEfjYoMUi18iqvDcrh4s91e5HOQaEw74bpkAGMPWHefOHKtrv9wHxMlC7CtzuEhU463+0B3HEKASmkvp4b76ETN56oHW14xUX65hC4VlaUY6GdwdXrzqndLtnxZ8NhmBoracIxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749138854; c=relaxed/simple;
	bh=XJ4OnNteacnUcBJgU18uNHRd0LUAn8+t4EqsM7xK1mk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NpR4iFQkF7RKxpxDO9kJG1/hmAJV2H9/OpXtcmozcJw+sDy0KRS+Hj0SQn/QVZ+GQqusllGh2lkmqAgVhXNsqItF0vUveYTyifbpbhkCJ509Kqn3A/dp2MARWaY38fFGPKhJMhXZBF33tDNyBiWzXMrzzjv7WkOFiCRoddqGrEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=CJN8AhF/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q4UPYCXi; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="CJN8AhF/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q4UPYCXi"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DF84D114011C;
	Thu,  5 Jun 2025 11:54:08 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-04.internal (MEProxy); Thu, 05 Jun 2025 11:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749138848;
	 x=1749225248; bh=Qn245qQSyJEYdSkDPOgQGR69RTFiYTcg/zViHoyBBD0=; b=
	CJN8AhF/P3whIfl3cMyusFbeq+OyGon/w+UuMXjXYLuqEntG2kSJKw+wI+h+Mw7u
	RGpFhyEGvhjOQZqM7eSmRjU63eBxFNAc2MZjmB4Uux3rgKETrdsp4vNBuHuUAdCd
	jN5jSqyPZ0OmPfq6BtIGMIvSYfQMBF4pj14SSxP9Zhrg/rnsfeVGbUNNNPbV0LIY
	EEy2RzoKUPFczRJUjwOGLg9FnuYkzua/gqyK9mW55ngEZgWIo+k07jW3FWcCCOX/
	sKJ+XcB3JagAiNaNsFr0O8k25rQYRtHECIJhKvV3YEKqZLG5F8HQf2BOXAiZgmOk
	8fan6C6YpQxTryE6SPmtpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749138848; x=
	1749225248; bh=Qn245qQSyJEYdSkDPOgQGR69RTFiYTcg/zViHoyBBD0=; b=Q
	4UPYCXiwOigcqrN1IPf0slad6+4inUQQ7hvSMvUvtvfmeK+Xz1zv8aX/6VEvucgY
	/nfphvyfeklslWllMNhy1nmHZ/LZKTi+hGZ2Oxhhbr7VE5Spz+bsYcm7qjU/C7IR
	/Q9ht/aql9AX2yEyZWzi0ZBkTKoz+UhWja+zyknVenmO7tTWgmQrkVKm2u6tYM0T
	BbB8fX56QqGVtTPjOHk11bnDpLDy4CcHgoqIbu1Dt9PlJFLgLS1P3vcrct2w+fgd
	1ZExkM4GFbchmcBhSZuCVf6iaoxjEmgtXNT02JzcBgcm8inIWwlg5nnhrE+XdSDK
	snIHOVyyGRoRXCDOOrOVA==
X-ME-Sender: <xms:n71BaNdKsqSkFYejiCh9O9VkXJHCclNIrkhmKoMMnLunqguDzhJ0fg>
    <xme:n71BaOcP2fNek97Kt4J29mon2CLdICSL2gV-gv1UCqg63oSF07501kjWvzoZClRYz
    Man1KChh1q_R3XxBCM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdeh
    tdevheduvdejjefggfeijedvgeekhfefleehkeehvdffheenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepihhkvghprghnhhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    figprghrmhhinhesghhmgidruggvpdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsg
    hrpdhrtghpthhtoheprghnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrd
    hinhhtvghlrdgtohhmpdhrtghpthhtohepihgsmhdqrggtphhiqdguvghvvghlsehlihhs
    thhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheptghorhgsvghtsehlfi
    hnrdhnvghtpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgt
    phhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:n71BaP_Sc7vGI49Jm4mDEDgCgnKZfkVX3D3G8rZ5knqlhvj7F6lZ3w>
    <xmx:n71BaClsV-_9JTLYIQ3KPOZ8qbJx4Ae6Xp6tKkBdgkD2qzFyssjA1A>
    <xmx:n71BaJ9kw8Hpi5UKvkYuaeTz7-gapc4ZU1hs8FQbuehokZC_dB-2bA>
    <xmx:n71BaIm7_x46AORl57uWXZz_OxDgddbvqq4GZ542URutTcglQ9L-dA>
    <xmx:oL1BaDNAU7hCoNSMfXjxgqO-lI7ASvmY4lBaEIeuE2GKton50KTiwpsA>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6D6222CE0061; Thu,  5 Jun 2025 11:54:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Thu, 05 Jun 2025 11:53:47 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 ikepanhc@gmail.com, "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <71f410f4-6ac6-41d2-8c99-2a02e0f05fed@app.fastmail.com>
In-Reply-To: <aEEyEfYgpPQm8Tlx@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <aEEyEfYgpPQm8Tlx@smile.fi.intel.com>
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Andy

On Thu, Jun 5, 2025, at 1:58 AM, Andy Shevchenko wrote:
> On Wed, Jun 04, 2025 at 01:36:53PM -0400, Mark Pearson wrote:
>> Create lenovo subdirectory for holding Lenovo specific drivers.
>
> ...
>
>> -F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
>> +F:	drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c
>
> You may follow the trick in the Makefile (see intel folder) to avoid repetition
> of the folder name in the file names. Note, the modules will be called the
> same (assuming no ABI breakages due to renames).
>
Interesting - I'll have to look at that a bit more.
Any objections if I leave that for a future change?

> ...
>
>> -# IBM Thinkpad and Lenovo
>> +# IBM Thinkpad
>
> This is a bit ambiguous now. It's IBM and Lenove for ThinkPad... Perhaps you
> should put some kind of date or so? Like
>
> # IBM Thinkpad (before 2007)
>
> (note, I speculated on the year, you may know better what to put there).
>

Sure. Realistically the thinkpad_acpi driver still works for the (pretty old now!) IBM Thinkpads so it's a bit messy.

Main reason I did this is those two IBM specific drivers aren't, to my understanding, active for Lenovo devices now, and it seemed wrong to move them. Not sure if anybody really cares though :) I just didn't want to step on any toes.

IBM sold the PC business to Lenovo in 2005, so I can put that date there unless anybody else has concerns.

> ...
>
>> +++ b/drivers/platform/x86/lenovo/Makefile
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +#
>> +# Makefile for linux/drivers/platform/x86/lenovo
>> +# Lenovo x86 Platform-Specific Drivers
>> +#
>> +obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
>> +obj-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+= lenovo-wmi-hotkey-utilities.o
>> +obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
>> +obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>> +obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>> +obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>> +obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
>> +obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
>
>> +
>> +
>
> No need to have even a single blank line at the end of file. Usually editors
> even complain about this.
>
My bad - I missed this one. Will fix in v2.

Thanks for the review
Mark
