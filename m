Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2059A17548;
	Thu,  5 Jun 2025 21:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749157421; cv=none; b=FPTWwuoBew3iiEwaOiS7dPjI6r5BogVlfOngpdBkYUJqB+WDvpKHpEWKbbRZoEMWw+AOGnyNaY8YB7GNbqmvoznqXRLVRKv8IuwdPjfJAewacFH9xsCgqdhBqbn2VM0CbgsUB685KXNR9CEEu0IsrR4UM0Wm1ocs2hucFYCm0WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749157421; c=relaxed/simple;
	bh=DxZuCT3zQTNmwF1w5Jm8UNNxG3gAbyWGaSO957EG0X0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=NFX/E9MhZbRZK8XCZn49S3ZW/9jo83RSzlGFJe4vnhDQwFV4anST5IBrksM/HKKnlhgFeQrRsnAUQafx2fjvtHUO7WqD3uVpgKiVAQEoUwV78/PkTeauHolGBZPQtBpkfd8QsNWmn2x9LT10LjQLevXko6lZBAOHzDYcYE7Iivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=lXP4G1Xq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eeiE05iw; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="lXP4G1Xq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eeiE05iw"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 934E825400A6;
	Thu,  5 Jun 2025 17:03:36 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Thu, 05 Jun 2025 17:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749157416;
	 x=1749243816; bh=zVXTQZbdvC/TAzsb8x4vqo9EMW+NlidVTsUt3AlM1ic=; b=
	lXP4G1Xq5ZjVlFKq7Gix18VYqGVRI/WRB0nc7KXjXTNDuuRMIHdVUkJd5GDrEqbn
	F0fBSSDKhriKiwnMEKUEKPSZwyHliTMH38NCC2h4d1UPa9P8Q0Jh5eEZXo1sRyXJ
	R1k7Y6xy0TIC3edWP5R2/Jz/IxHIFArRH9F6jB8rpgj3rmFk51OW0/RNAv24mVzW
	Tx4hNjMkzSGZRVPDZ5M4CddPVoG7OF//c1EDNtFfWif/UglsuUfsG6mUA5dVtORf
	vOKyBhq10IhVRJvBTcZpOq89utXSmCajHfH1d+F61dSeroEHmBMtsr3SqLsWTY+R
	nQasJAaVFhP9l0DurRyrUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749157416; x=
	1749243816; bh=zVXTQZbdvC/TAzsb8x4vqo9EMW+NlidVTsUt3AlM1ic=; b=e
	eiE05iwGYDaO3E/O8JDndkKK0VxO6F1x6Hm+rFuL2llSHoH1UAXlJuLOflOElRMD
	9v1rv9b6bzgasRmeA7aJcU4Zs4VT0vvmr+BFoSt72hzIn1uKN/Ndex6j3ViGtWoo
	8LHA0abS9VAUTl6Z1bZ9hLdClhmLfyZfFm/6ZdIThtPeiIHVlp7ja5A+RCaB6zU9
	Uf6JQHymBioylFyLYZt+gaZnBAC0jEG+/hWGDmwmE8avbY7hJwwGeG6pqZOmIvac
	IUZ29rY7b6Fs2cSdiR6WRg0LH+3jqwBeJTzHHdpDBd55rTY1gyeAHZ/l9Yyl4yw8
	KDt0c+rhum9FGvMTmGmxA==
X-ME-Sender: <xms:JwZCaNOYXk3GU1KfdHQwcm5gjtm0nFK96JEChOWimEFb3Xsf0z7tDw>
    <xme:JwZCaP-_DhP4kX2MeE_ciRlbqT7TmRQtQ8NoFCUmBoRJ5UsTBbFMUu9073LjeT52O
    ktUjF2kVaSwlzXyEuY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegudegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:JwZCaMQxO3al6dnB9sAdgd8ehpyzlkre8wKXr_4f6tlTNw8GmhNm2Q>
    <xmx:JwZCaJu0faNmirli2wnJb6Qgxyczz_r6eaqfNJ85KVD4rGjFJ2wxTA>
    <xmx:JwZCaFfs8LEfV22mhfqxO6oZU_Bd1x-r8bDhi14rhokQhsQUNLo5yw>
    <xmx:JwZCaF1nBQuTKr9assGbqRn69EmcugK5WfAevgrNEySn17TCeyC7tw>
    <xmx:KAZCaB89Oo0mEfqAobynotnzf2EN0r0SWxl4WmYtyFEH5vw3KrU3ka-W>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BFFF82CE0060; Thu,  5 Jun 2025 17:03:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Thu, 05 Jun 2025 17:03:15 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 ikepanhc@gmail.com, "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>, linux-doc@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <dd3b79e3-a0d1-4413-8c69-58ca6b4fb8c9@app.fastmail.com>
In-Reply-To: <aEHzYT4XqhzIpO5k@smile.fi.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <aEEyEfYgpPQm8Tlx@smile.fi.intel.com>
 <71f410f4-6ac6-41d2-8c99-2a02e0f05fed@app.fastmail.com>
 <aEHzYT4XqhzIpO5k@smile.fi.intel.com>
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Andy

On Thu, Jun 5, 2025, at 3:43 PM, Andy Shevchenko wrote:
> On Thu, Jun 05, 2025 at 11:53:47AM -0400, Mark Pearson wrote:
>> On Thu, Jun 5, 2025, at 1:58 AM, Andy Shevchenko wrote:
>> > On Wed, Jun 04, 2025 at 01:36:53PM -0400, Mark Pearson wrote:
>> >> Create lenovo subdirectory for holding Lenovo specific drivers.
>
> ...
>
>> >> -F:	drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
>> >> +F:	drivers/platform/x86/lenovo/lenovo-wmi-hotkey-utilities.c
>> >
>> > You may follow the trick in the Makefile (see intel folder) to avoid repetition
>> > of the folder name in the file names. Note, the modules will be called the
>> > same (assuming no ABI breakages due to renames).
>> >
>> Interesting - I'll have to look at that a bit more.
>> Any objections if I leave that for a future change?
>
> IF it's nearest future :-)
>
I got this implemented - I'll include it with v3. It's less complicated than I thought when I initially looked. 
Thanks for the suggestion.

Mark
