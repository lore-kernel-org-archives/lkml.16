Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A813426E172;
	Thu,  8 May 2025 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714602; cv=none; b=Z/TDaIouis5Go18UKYxGjpzqjm+2llTwMsd60C+88VL3pvtADBjyG2rdY5mnF1/nIkEsJS51w506PZl+p5L8Ek5Hf5Jn5fydbcM5eLhHQ8LguohlUVmEQEOlq/j+BysU76qOyZOXXWXWX9ktq6kVIB1T1mk1Ida8hQ8WPk+s6qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714602; c=relaxed/simple;
	bh=mxMrupDGu++mczPi4P6UZWwUlCMWWF7Ia1zLsbP8uKg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=mlzxm4yyaz1x95A0fhNZSMg2sTB8RQ7jK4oX+pVZDd6B95Fyx0ynnm8xkGpyuIWbpIoNdV6/JdVZneoB0v/s2ebWdtGDEWSet7iWK9YWMp2mhcLCLfDXnLlI21KKhlx2Xvx94sHTQoA+LLnt6A68nyMo1hfxZ739LQgLZJTJz/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=FqoEeRH0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XbQXS9BR; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="FqoEeRH0";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XbQXS9BR"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A9DFB11400D7;
	Thu,  8 May 2025 10:29:59 -0400 (EDT)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-12.internal (MEProxy); Thu, 08 May 2025 10:29:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1746714599;
	 x=1746800999; bh=DcHjOqdnh+Xex6RmxNcgjS2apgt7qHKdJ+jb4u1qvVM=; b=
	FqoEeRH0h7idbGeEW/ut26OgMbCHLp4XoWqIs6ePtXkChQ4CL52wPa/zO8mKSpJy
	sAyqnShiRQe4C+o9lxMO1tszz5dC1yP9f1RKYMEkhR3CBPRQnN6UgNARUrRWhKD9
	CLO6q4YYAL9+XQprDJKVZmxECXI5x6hJ1umWl6oRoF7yDhULbmDtAnAedXQuOw5o
	510VdKVJpFxqiSMCdnMc2WS6nqLovQ8S5APNWF4KFZ4xKrW3xHxK++rkr4DfrJA5
	bCJx2UiM0WqghuG1Wk5RWt2bL4R04YrFiQzNiHdkx2j9qGvA++XKbHmuiT5cTZWH
	IiF7JX5uxABrj6vMbCrFBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746714599; x=
	1746800999; bh=DcHjOqdnh+Xex6RmxNcgjS2apgt7qHKdJ+jb4u1qvVM=; b=X
	bQXS9BRltyXY6kajquFPzeFVhafGC1o3miMRRctXAaVxBy7bkaOZlzLMZDPAOreH
	zLu+rk3c+G6tXB47Z8EOcnXXV4PsWX2Oe4h5T9A5IFDu57ukEUYWbi6VSdmmXOmE
	6xG1BSBbw2TNThqk1IDoHzlqYhGb7hazhx1/EplF/Gx/yU3bQ8KKPM+7P+K07v+i
	j7vhQzLeVdRtl+qw3rmQbqIDAZ2w1IluX5JjZlqw1F9XFzrbNENZhPcLhBHGEO+l
	0F2z78WCaxVOZrNa8mjU2wXc0eyEaSe47hn3llgJhVm6rxCNQCsKp3kQkWVWfvov
	F3VvhEzwb6cMIgGWKhMDQ==
X-ME-Sender: <xms:578caNcCgRfu7tHEAqf9VUvsO2A73_FRa3UDdgc-5alj_VcyZZB6vA>
    <xme:578caLN7pULQKe5zvMI_TBwHRWifLWtVCrVAPiNNGqFnk6jO7EvuZ4_LvxUXLad9k
    OiOnJSa8NUUIWPbFzc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeelleekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlh
    gvnhhovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueek
    fefhleeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhho
    vhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopehikhgvphgrnhhhtgesghhmrghilhdrtghomhdprhgtphhtthho
    peifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopegrnhgurhhihidrshhhvghvtg
    hhvghnkhhosehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhlphhordhj
    rghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqd
    grtghpihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgt
    phhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhl
    rghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:578caGjV_EdeQ-Nj0GG9cFf-jNl2q25_a8UBFzmIaxG9pK5GBUGNNQ>
    <xmx:578caG-5Jf_glbov0agCyaA79uJ49hZ0Bb4KJbJnzqcS9kE8ZBk4lA>
    <xmx:578caJtyQfgrOZJQqyO-c-zwj1OQAmdwnrVb54Ib_XbrM2BAo4ujAQ>
    <xmx:578caFGqnxJzIgYynYwY9IoqKt8DGaOX2fsozpbwi0a2NLR5qua6bA>
    <xmx:578caHCmjUvJfeyPUChZ-tBKSg8JoEq0yhxAmw5oyUrvDP_ks2a8clok>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5FE7F3C006B; Thu,  8 May 2025 10:29:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Thu, 08 May 2025 10:29:39 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, ikepanhc@gmail.com,
 "Armin Wolf" <W_Armin@gmx.de>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net
Message-Id: <4bc5e9f7-0ab7-4bdd-b822-34f8a0587f57@app.fastmail.com>
In-Reply-To: <2640c7dc-5870-f57d-e1cd-535f5c48d950@linux.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250507190456.3004367-1-mpearson-lenovo@squebb.ca>
 <09a628d3-5903-5d5d-b874-5e77bbdf939a@linux.intel.com>
 <6d4f3523-0d3a-4f1a-bec9-d053fad8a509@app.fastmail.com>
 <2640c7dc-5870-f57d-e1cd-535f5c48d950@linux.intel.com>
Subject: Re: [PATCH 1/2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025, at 10:27 AM, Ilpo J=C3=A4rvinen wrote:
> On Thu, 8 May 2025, Mark Pearson wrote:
>> On Thu, May 8, 2025, at 10:01 AM, Ilpo J=C3=A4rvinen wrote:
>> > On Wed, 7 May 2025, Mark Pearson wrote:
>> >
>> >> Move all Lenovo specific files into their own sub-directory as part
>> >> of clean-up exercise.
>> >> Longer term goal is to break-up thinkpad_acpi to improve maintaina=
bility
>> >> and perhaps share more functionality with other non thinkpad Lenovo
>> >> platforms.
>> >>=20
>> >> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> >> ---
>> >> Some questions that I didn't want to put in the commit comment:
>> >>=20
>> >>  - I didn't know if now was a good time to propose this change. I
>> >>    realise it could cause headaches for anybody with patches being
>> >>    worked on.
>> >
>> > Don't worry too much about other changes, if you don't recall anyth=
ing=20
>> > immediately, there likely isn't anything that significant. If we al=
ways
>> > postpone useful reorganizations in fear that some hypothetical work=
 would=20
>> > have to rebase, it never gets done :-).
>> >
>> >>    Please let me know what makes it easiest for maintainers
>> >>    and other developers. If there is a particular branch that woul=
d be
>> >>    better to do this against also let me know.
>> >
>> > Once I've merged fixes branch into for-next (I should do that at la=
test=20
>> > early next week if not already this week), it should be pretty=20
>> > straightforward to handle such move without conflicts.
>> >
>>=20
>> OK - thanks. If there's anything I can do to help let me know.
>>=20
>>=20
>> >>  - Should I be updating the MAINTAINERS file? I'm still not sure w=
hat
>> >>    the protocol there is. I'm very happy to help review anything i=
n the
>> >>    lenovo directory, but I didn't want to make assumptions.
>> >
>> > You should certainly update MAINTAINERS in the same patch to the ne=
w=20
>> > paths. If you want to make other changes, put them such as add your=
 name=20
>> > into some entry or create a generic LENOVO entry, put those into ow=
n=20
>> > patch after the move please.
>> >
>>=20
>> OK - I'll submit a v2 with that change. Thanks for the guidance
>
> Yes but please wait until I've done the merge so you can base v2 on to=
p of=20
> it. Thanks.
>

Will do

Mark
