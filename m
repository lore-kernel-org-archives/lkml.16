Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FA938F80;
	Wed, 21 May 2025 13:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747835813; cv=none; b=Ot1SpTW2M0JVunwMfGPO57/dzTJvgkAvta3quyfWz2xuW/Mz4roLDNFcTPkeEcmH/N1v0CEw4MLupkcHfgvPA8H1hQfOyOJ81+RdltsG79f9fZfKTzSmMWIr3qKd7ooJLcAViCEWgMAebyIUtO6eme/f3WYTjYwbE0C2WAIvfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747835813; c=relaxed/simple;
	bh=K6Oqp9F5rMonkOFa3DWG+jhMVLCdnYW1GzBi5erRm0s=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OiogKbPYWDfd0Q5wDWVhBzTrTX39sCGnjG8+8F8xiiZOoO5cnii4zYqgV/QZL6ZTYvtX7T6xKLJ+Z759Fq0hrwyFpQkh4pYVtQKlisxd+qkZOKGRVmISXGnPvGYdl0xzSYzLZUG1urexI3PLmnS4+PH0IpIPR1CtDPVaWtJkKd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Lun5uQga; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GtimHuS8; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Lun5uQga";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GtimHuS8"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8B41A1140162;
	Wed, 21 May 2025 09:56:49 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 21 May 2025 09:56:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747835809;
	 x=1747922209; bh=ZMvZQ7v5Is6kVNWL3Keg7NmNm84v9UkKMJ3j+BK9Lb4=; b=
	Lun5uQgajLAhuM2pfX4LISO0EGQekoMe+/tyYhrsSzmVvVzt79ghWB0SHHjPgrjN
	+LcZvUxB/0cIC6Md8YSs9jHGWj+eohOZGJ4lAWmIpeDarKnWC3+idZP2HckXk5nE
	L78qqb+81Ft4FhmjDIGWd4kpjyTQeUoMRRdFhgvp6ogC2uBXDRU2LZ2SpcB0u/BZ
	YQnn5yaHaNlCMY85JP0wnEbyp6VFJbh32oIXXvVKLR6fq7MWauJvSbPA9XO/qZPI
	COMm6bE/mkT3e0rFlqDfIkRKSlyfBFYgavJI4lXYCNwdkWvLJbVsViS1AckfUSkP
	QqEBqJur+cJXKRAvadGcZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747835809; x=
	1747922209; bh=ZMvZQ7v5Is6kVNWL3Keg7NmNm84v9UkKMJ3j+BK9Lb4=; b=G
	timHuS8q9oFyIN9726+wfhwVlBH3uURVS83bR66E5RaDmNxKhRKkHVkRxz0lsSN2
	ayJvV9mn4Q0lf+oPf1F2RM/vV0/pXH9tukKFalyVZ/1HCaZNaC+YE/FC3a/Z5sQe
	HmevSQeHRiR2H6CIjxcloVrrwJKTMwrjmYCUl7VV0iTgr/Q4757x1KD6XwujfZwe
	kI6kMdPHgXwY9wfdvL3AG0Yhv8nTaIfmCtIZC9hNWWojGJh2mpKYrQhqw6CHNiHl
	U4P/tkOWroGpV1rJd57gkel/zgAGtUePVvPo9dSiiX5bedrGtuxBMfU2nlzowifW
	5sgEcj1USlenfDgtZFUWA==
X-ME-Sender: <xms:oNstaN1lwp6ghc0pEVxJJrGi1Ys2C9reKeT9d2Gduf5RAKjN0sQyYA>
    <xme:oNstaEEJ_BX0n6lPoF29bkUGd2Ub4H0BOdFTE_-Pfhvvexm37Z6E5Ub9rWBG6n6b7
    IpgP9jqW4jo6yLuAUo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefvdeiucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuc
    eorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedu
    keetgefggffhjeeggeetfefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdp
    nhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrnh
    gusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdroh
    hrghdprhgtphhtthhopehpvghrvgigsehpvghrvgigrdgtiidprhgtphhtthhopehquhhi
    tggpfigthhgvnhhgsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepthhifigrihessh
    hushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:oNstaN6u7Km_vfAFhjKj6ECmQnmDeHBFduD55TM9zVEOy0quTmd1SA>
    <xmx:oNstaK1UbfweH4-c7aAs9F_r5YYQdQ7_iQ2vp-XJ6c87l-cstrNIDw>
    <xmx:oNstaAFAYAbVzTghcNv0ERO20uv1hz27xqcMx1GsIbLTHg8HkeYNTQ>
    <xmx:oNstaL_CTpBRHdurzOxBOe3F2n_Pk4OftzgMNUIudsmIMnkmH5EHsw>
    <xmx:odstaPJkKtcs985p2OoOkt3_YTN_4qhX3fTdQegocwDCG3FOqv0sPOzI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CCB0F1060060; Wed, 21 May 2025 09:56:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Te2f939405235d867
Date: Wed, 21 May 2025 15:56:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <8f26081d-e44d-4674-a122-5e711943d06f@app.fastmail.com>
In-Reply-To: <2025052115-flagman-parmesan-9f9f@gregkh>
References: <20250505052032.1811576-1-arnd@kernel.org>
 <a60b3290-a535-4666-9f0e-18a3621e70dd@app.fastmail.com>
 <2025052115-flagman-parmesan-9f9f@gregkh>
Subject: Re: [PATCH] ALSA: usb-audio: qcom: fix USB_XHCI dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, May 21, 2025, at 14:33, Greg Kroah-Hartman wrote:
> On Mon, May 05, 2025 at 07:59:21AM +0200, Arnd Bergmann wrote:
>> 
>> Sorry, this should have been USB_XHCI_HCD, not USB_XHCI. I have some
>> more patches for this driver that I'm still testing I'll include
>> a fixed version when I send the rest, or you can fix it up yourself
>> when applying this one.
>
> Can you send a fixed up one?
>

Done, sorry I had forgotten about this one by the time I had
finished the other three.

      Arnd
