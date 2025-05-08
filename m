Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C50251785;
	Thu,  8 May 2025 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714290; cv=none; b=qIwgaHClMRCvxg80Glt3ocKYpELXmhrmG2A73ono8KXy/mIuHAz1Rxe5imnIlFdd3eOSO3TqZ1fTERjLkVANYSbViE1JxPGkh/Gue0WDtt/JWRno4D/HK6zqaTN8ycxeyLB5daOGRi2ABe9EZstqRqlpGhJPWOIIRoYT9HaniIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714290; c=relaxed/simple;
	bh=Sm22wXtmKZQtfd+hSw+DQFlJs4OyDw1ovJXItERNn7U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CvBPMcX9WPvYQ3PF2YPJ2mng6Byk+UcTtwiQbtQhTMTgXjWyaSjXWz3JzO8j1nBo1cKIt5rCHKedGF2bNVTtyFINjxFmYQoT+c+nNsklRQhSuaXMUaLBwxcDOAEpqR/vkaOczaWCM4XRlEXWsxd2CWEwOueg2Q4FFAeaW+z16LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=FQsq2XS5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hXYaV1kg; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="FQsq2XS5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hXYaV1kg"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id E985C13802BC;
	Thu,  8 May 2025 10:24:45 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-12.internal (MEProxy); Thu, 08 May 2025 10:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1746714285;
	 x=1746800685; bh=Q0vNQd2Navs1dNhoZrI0O4YE+DAKDw3Xmj33t2DJSJs=; b=
	FQsq2XS5/co2bITztDh089EDWC4W37xb52Q7sSU8jXVkSa/EKf0tKuCJJ0Y6FdIQ
	BjjlUgbexMwClKOW2rmV4zOS4WgO4h/xL2iLXDk+kQ2skpdlh8rBy4mansGFKFjt
	LKY2sg3TiOr9yPnMSJnHZFKezs9pGZ1G8qQH1DIzVug3EgYaSeHYSUC+drewvI8z
	eK6q0oYYEb/s5BPxs1ouJjLabGJpyCXr5ZkaN8nYC9TpFqsFEhzY2bhbM0B1V+S0
	bwHroBChMWu/sR1J8IvZbjD2sHSDKELk616uR7w8XY3Mal2xX7e3cGIr3SI2OWQV
	Y8gfiMom5/D4YD7c4floEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746714285; x=
	1746800685; bh=Q0vNQd2Navs1dNhoZrI0O4YE+DAKDw3Xmj33t2DJSJs=; b=h
	XYaV1kgDFdobPupy8zBJH/SvzpJfNlO2/Tctx8hlc8zBVm/wfs7i8MckEkhU0r9V
	fYCew9KSvlQ5lEvSwfqqmoR2KZ6Nk+qz/ZM1fcD2S84vCJ51xm8mHj+QBZJOmf20
	rGUlm8k3CDXIezCIznSp8qxqX6rn9SPut99gmevB7h66MXcHKP130hkFcyWLBj1l
	YntrMJNpS6YKtKxpwSovileBbY6IiUjMS3TpZHZOMW2hIDDy9+AtLNf293GlRbNn
	xTxj/XGmr954Csj6Kfk9txzqr8/jqNLNIgssno+Nz5SHFU2ntJFUsrcCDzTkpA5x
	r3UBQ1lm2/UqdvrBqZwKg==
X-ME-Sender: <xms:rb4caKc9DNiWDiKKwSGq0YrfTzwJNZyueeMgct_yaksgqErWJbCBSA>
    <xme:rb4caENmhOy3XwWZrurUdynBABfBqwreFEbGxyHlc3Q0Rh3rIEROAv06vwa2O77-Z
    LHDwSU69n3WdP0shdE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelleejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueek
    fefhleeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehikhgvphgrnhhhtgesghhmrghilhdrtghomhdprhgtphhtthho
    peifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopegrnhgurhhihidrshhhvghvtg
    hhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhj
    rghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqd
    grtghpihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgt
    phhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhl
    rghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:rb4caLgUZP_3e46bl1oOhOHCfi2UCqDCrsiwTvHK8X2DSM66g2i0fw>
    <xmx:rb4caH-OvZaPmVG8DeHsYoORSfHCd1BZJ1tfmtWeKyDnCYb8_nua8w>
    <xmx:rb4caGuKEziKBeW7cEFW0hOWRajsnAWTqP8amv05Dswkj2jtn0nrYg>
    <xmx:rb4caOGtOFSclgaDN-ZbZnerTslv0wkAkOk1oAmiaqsWLfnizB0zUw>
    <xmx:rb4caADtx346jJ0GYDqPX-1vaCv__rLG9KhYn0mUmqjyJC21FPqixo5A>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0A6E93C0069; Thu,  8 May 2025 10:24:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Thu, 08 May 2025 10:23:47 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, ikepanhc@gmail.com,
 "Armin Wolf" <W_Armin@gmx.de>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net
Message-Id: <6d4f3523-0d3a-4f1a-bec9-d053fad8a509@app.fastmail.com>
In-Reply-To: <09a628d3-5903-5d5d-b874-5e77bbdf939a@linux.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
 <09a628d3-5903-5d5d-b874-5e77bbdf939a@linux.intel.com>
Subject: Re: [PATCH 1/2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks Ilpo,

On Thu, May 8, 2025, at 10:01 AM, Ilpo J=C3=A4rvinen wrote:
> On Wed, 7 May 2025, Mark Pearson wrote:
>
>> Move all Lenovo specific files into their own sub-directory as part
>> of clean-up exercise.
>> Longer term goal is to break-up thinkpad_acpi to improve maintainabil=
ity
>> and perhaps share more functionality with other non thinkpad Lenovo
>> platforms.
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>> Some questions that I didn't want to put in the commit comment:
>>=20
>>  - I didn't know if now was a good time to propose this change. I
>>    realise it could cause headaches for anybody with patches being
>>    worked on.
>
> Don't worry too much about other changes, if you don't recall anything=20
> immediately, there likely isn't anything that significant. If we always
> postpone useful reorganizations in fear that some hypothetical work wo=
uld=20
> have to rebase, it never gets done :-).
>
>>    Please let me know what makes it easiest for maintainers
>>    and other developers. If there is a particular branch that would be
>>    better to do this against also let me know.
>
> Once I've merged fixes branch into for-next (I should do that at lates=
t=20
> early next week if not already this week), it should be pretty=20
> straightforward to handle such move without conflicts.
>

OK - thanks. If there's anything I can do to help let me know.


>>  - Should I be updating the MAINTAINERS file? I'm still not sure what
>>    the protocol there is. I'm very happy to help review anything in t=
he
>>    lenovo directory, but I didn't want to make assumptions.
>
> You should certainly update MAINTAINERS in the same patch to the new=20
> paths. If you want to make other changes, put them such as add your na=
me=20
> into some entry or create a generic LENOVO entry, put those into own=20
> patch after the move please.
>

OK - I'll submit a v2 with that change. Thanks for the guidance

>>  - I have tested on multiple platforms but I don't have any ideapads I
>>    can use.
>
> Given it's just moves file to new place, the threat of breaking someth=
ing=20
> that isn't detected by simple build test, isn't that high.
>
Agreed - thanks for the review.

Mark
