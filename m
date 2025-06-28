Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C26199E9D;
	Sat, 28 Jun 2025 19:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751139082; cv=none; b=nI9vAPoLzrDYULWbo+RW6Wvz9qbOjHFriTeaq6+z2irm4y4HCETImRHEPIrpdW4M0DqPBik0FzYNC8QkrQ/m6YY6OfsVJczJdh9xzeHABteTo/ykz7w9kaqmjsu8b47hrW9QwCTFpSaIZnV6O6hjdagOJocuJZ84mQxKdcnTvyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751139082; c=relaxed/simple;
	bh=uOYCiYiAz42Pngpg17/dzjQRFe79DpQ/pXMHbzFGk1I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=SHoiL+tXzopsnAuQQD/VOyMEQOnXPiwt68eb4fhWHfpL29yLgr67mnAVtYKbgy01LPi6lfuBogb8/pkHsifOlUrH2Rw9EYVxuPI8yNhBzFTXiVvOtnhAf3kSBF91RH5TYL7AMLbhxQwx66hbFjd1ephOZ93SPk2MvIkAdbFHMcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=rrQNBgxt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bmFI7jsK; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="rrQNBgxt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bmFI7jsK"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EEE4D7A0034;
	Sat, 28 Jun 2025 15:31:15 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Sat, 28 Jun 2025 15:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1751139075;
	 x=1751225475; bh=Z4KDOcf1S4rmW5n/LuGllt1l0vlhC0C68v2kevGDAyw=; b=
	rrQNBgxtS1glu8/ERATXSTFAwrPA/xJS5qC5S+rRIFBlR9FJzCrtc6Sw+4Nzhsj3
	itT7PdmmNxizooZobs+KDrxvx74v3Bm/g4m6EKbIlZ0SVOtmND06/DNiBx9kynx1
	ZBMnJqPTND/LoKWt24w9Z+jufME27zUZxt2jbqIeOyQ8a4fRL2AKXEPoPsQmHusS
	DMKmYSK+Bidk6DS3XPp/ZgOvxd+ukVwbsWEmqTrIVkHr39WCXoxc/zvjbURHzqrk
	TSScopR8mY45e0CoylSmLO1qqwKVYeAXcCNL3K1OBAaVTPrhw96F+uhhEaNE754x
	eB/oARmEtiCKQZ7NDgbQHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751139075; x=
	1751225475; bh=Z4KDOcf1S4rmW5n/LuGllt1l0vlhC0C68v2kevGDAyw=; b=b
	mFI7jsK4377db7wp1+akHIUtkyFUlmdYNrNVPih/6tkTyOojYFU1vKis/OiwABKV
	7ZkG2pBT4p+oeKV5NRMOcVipVi7PDXggvUOB7a0DvoVxGVA6p+7DUmX03gFMTriw
	wf9RO9gHHlouKsShBrTBtKic9PNzn+3punhz2VSumM48qvpE3lmDD6uj2zFh6ZEZ
	bfN1mKOATLtm6UgXOA03bU85t6olzFL5R7ImIH9pIsK0i2yivp467vqMmL2Nwiku
	lthB/IeUB/fjrLF5Un0LzymaH4qu+16fIulHGZ7GtR8HBlxzxt6n5Q+IsWz7n/yR
	GWPBTJqnirFjo132LFO9Q==
X-ME-Sender: <xms:A0NgaAMRThns9MD6F6F-ic1wlxm3AlAqLfQY2HT9R0Ywjep-mOlyMw>
    <xme:A0NgaG8MQHqQABYU_740TAL0WwH0q9c_WYbl7TnEr9qkY8Rweh6roMT0058G436Hj
    oRB-9v-YsmPsMF974c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeijeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhkucfr
    vggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrqe
    enucggtffrrghtthgvrhhnpefhuedvheetgeehtdehtdevheduvdejjefggfeijedvgeek
    hfefleehkeehvdffheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggp
    rhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkuhhurhhtsg
    esghhmrghilhdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhn
    uhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrth
    drtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:A0NgaHRdJUien0kP8ooDR3D56mhdqAyQfO6Xm-Rip58dTqTmEVmkUg>
    <xmx:A0NgaItusk1a7r_emDohe_N3fWJ1mDVqCHsT8cod6oQTcuXh0ZD0qQ>
    <xmx:A0NgaIe3sRJ5BcCEvUnyzhNR8FrixVVZExu2Q6cSxsp5NfJpt8v0iw>
    <xmx:A0NgaM0K6WOj6dLeHAJ-gHcmzEwZ5Igj0mkRwd_0ZbEBaprnGwljuQ>
    <xmx:A0NgaMzJ30nx-2FHProyrcUFOYcRUemQwOXzq2AMPbCNpc2j3Gnmwe_A>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8AFC52CE0071; Sat, 28 Jun 2025 15:31:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5da989ce10471263
Date: Sun, 29 Jun 2025 04:30:54 +0900
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Kurt Borja" <kuurtb@gmail.com>, "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <ffee2d20-f2c3-4976-bb64-8d442c7c5d05@app.fastmail.com>
In-Reply-To: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
References: <20250628-lmi-fix-v1-0-c6eec9aa3ca7@gmail.com>
Subject: Re: [PATCH 0/3] platform/x86: think-lmi: Fix resource cleanup flaws
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Kurt,

On Sat, Jun 28, 2025, at 2:00 PM, Kurt Borja wrote:
> Hi all,
>
> First patch is a prerequisite in order to avoid NULL pointer
> dereferences in error paths. Then two fixes follow.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
> Kurt Borja (3):
>       platform/x86: think-lmi: Create ksets consecutively
>       platform/x86: think-lmi: Fix kobject cleanup
>       platform/x86: think-lmi: Fix sysfs group cleanup
>
>  drivers/platform/x86/lenovo/think-lmi.c | 92 ++++++++++++---------------------
>  1 file changed, 33 insertions(+), 59 deletions(-)
> ---
> base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
> change-id: 20250628-lmi-fix-98143b10d9fd
> -- 
>  ~ Kurt

The patches all look good to me:
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

The only caveat is I tried a build and system won't boot. I don't think it's related to your changes, but it means I've not been able to actually test them to confirm all working normally. I'll dig a bit more and figure out what is going on.

Mark
