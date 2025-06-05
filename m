Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FCE1E47AD;
	Thu,  5 Jun 2025 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139035; cv=none; b=edOqtI4hX9SyRZ/lQc2O23A9ysvbgLtWo6A3tT+ASQ/UbBDUiTcbhBfFy8Z2mQEqdue56G/DzqUzARDP2MMH1eHLH5V1bpoKxcX9RgNMREXSgGnOGUoG9+E3sYAC4FYB7++1kVmDmanTB0q9+7b7827PBk4QDpXwOvJe9gcix3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139035; c=relaxed/simple;
	bh=3Jf/SJCCZMnPIW6ljfS/il7LMpnZ627rg6AgyFtW8dg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TgzHnaVZRDrVddfA4ekreznOOHYikDtnlECfmFkOtK3OAVt3oR0lVMzqieQyKO9WBQMbE6AWYqSzp3r9n0VEWQuXtBcrcxIulzWmMdKBGK+RvlP2K+eCXLMM4gYwZcZqQB2flX/biA2DqaHpHNWZmOkesX20LdUM2f16r9HUb6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=QpTguXxY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S6T+XHo7; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="QpTguXxY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S6T+XHo7"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 72978138031A;
	Thu,  5 Jun 2025 11:57:12 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Thu, 05 Jun 2025 11:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1749139032;
	 x=1749225432; bh=i36Nkr/BYr7tE7XmsmYgh9umetnEHRPzzI0WI95Neu8=; b=
	QpTguXxYJt+tlZ/cGftoTjnyeu8tvD8Dc/RJW/HFcC73A1okUfCdjdhfyuVB9W+/
	NSnxfWnwTPaQ7G+ru0qyyQF63hzqH/tmMpwZvzzPGdxIe4SJJMN7+yAbYa0K7mtT
	A2SWXWDqkQfT+cJzuM1wqdc02PWWKbRXwopnw678uVmALGhWDrtQ8dNOqe+jwAvE
	KMwtuGTCD18rQEBwzgAJ47AGwH43N2A0Y4ksPSQWB+kHz8GZ4tsT53QHDNg0WRSK
	fQF279Jn18ilNO055tdodh21OTQA1Jph3LjfwQovnxb0FBzCexbXWP5O4xs4gUG7
	eq+OCq/boUtWWFOx6hDXQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749139032; x=
	1749225432; bh=i36Nkr/BYr7tE7XmsmYgh9umetnEHRPzzI0WI95Neu8=; b=S
	6T+XHo7AwD6M4dmbUVcmICQCGk6iZZuDyUXaM48afdbLXgxx8XySadhmncA+oFop
	B8eAjx7dAEOdF9rL8BvLWB8xKEUuDtpdJyJKUE57NaffCakEs6QxrPO2MFfwkGSW
	34gDP9yeYLUYASomfCuIwucIBbfPk4oFExTUWFNWGHqFqrM7P46n5wcTXZY09muj
	NSe6UPj/RJJiRynAIvBj5tqvy4E2lB6+5pS0WbzvXgyC4OSMKR70MRwLGKZ2lwp6
	2fejhypXcJNGls8eLAU2Rkr/J1OphKRlcg/bJBZAwsmhr6i5yB1rk5xHCRG8RJt/
	STR++sohnI5NTeLLhR1sw==
X-ME-Sender: <xms:V75BaMAv4H3eukwV-sxwQaUFHdJdzQN6iXeiEtuL17FvMxWGjovVmg>
    <xme:V75BaOjwUNBBmjee_uephyNOFxaby04reLg8SFCVpOkdhFCe5a0GRZh7QVvGZpokz
    4-UPjsaZqTSFZsmA3o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefkeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueekfefh
    leeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghrufhiii
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
X-ME-Proxy: <xmx:V75BaPlaJ6iOAtj5fbammoZONO5J36WkP9qPoprU6AjpxYg3LuYAkQ>
    <xmx:V75BaCze7ATTTbjAyOdZWoqFKRDRu7YL_ULE-o6Y8vqQvQS2ILnuxA>
    <xmx:V75BaBTlSR1fyR4_SnZMWoWp5treq-hukxLoNwsFZa6pTmr4Arom_w>
    <xmx:V75BaNYdneM1M-ZUDFLrLtTM4NEaJvp2rhvL2zl7lrNnT-7qT051Dw>
    <xmx:WL5BaFcU5x9TKTJtIbko64iu5BV2QuPXtQgp0ELSXOmMjuNycj1-oWrP>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B31352CE0062; Thu,  5 Jun 2025 11:57:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T107eb5199b18744c
Date: Thu, 05 Jun 2025 11:56:51 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>, "Jonathan Corbet" <corbet@lwn.net>,
 ikepanhc@gmail.com, "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Armin Wolf" <W_Armin@gmx.de>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 linux-doc@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>
Message-Id: <63e00b35-361f-41ac-8341-f30c2e9dade9@app.fastmail.com>
In-Reply-To: <d6df0dcf-5786-0ad6-dd30-3a8c9f16426e@linux.intel.com>
References: <mpearson-lenovo@squebb.ca>
 <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
 <d6df0dcf-5786-0ad6-dd30-3a8c9f16426e@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ilpo

On Thu, Jun 5, 2025, at 4:03 AM, Ilpo J=C3=A4rvinen wrote:
> On Wed, 4 Jun 2025, Mark Pearson wrote:
>
>> Create lenovo subdirectory for holding Lenovo specific drivers.
>>=20
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>> Changes in v2:
>>  - Rebased to Linus's latest as requested
>>  - Updated documentation reference
>>  - Updated MAINTAINER file
>>  - Removed X86_PLATFORM_DRIVERS_LENOVO as I was worried about
>>    maintaining backwards compatibility for the distros.
>>  - Removed 2nd patch in series splitting out hkeys. That will be for
>>    the future
>
> +# Lenovo x86 Platform-Specific Drivers
> +# Lenovo X86 Platform Specific Drivers
>
> Any possibility to be consistent in formatting that? :-)
>
Ooops - yes. I'll fix.

> Why does the admin guide contain a history book?? It should be guide f=
or=20
> this version of kernel, not what was there in 2.6.x era ;-D. Please do=
n't=20
> add to that any more, preferrably remove the history part afterwards i=
n a=20
> separate change.
>

Sure. Will remove that change from the commit.

I was just trying to make sure I updated in all the right places and rea=
lised I hadn't checked the documentation files and found that reference.

> Other than those mentioned above, diffing per vs post seemed clean (I=20
> didn't check where the empty lines got added, Andy seemingly did alrea=
dy=20
> :-)).
>
Thanks for the review.
Mark
