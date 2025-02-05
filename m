Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4AC21D597;
	Wed,  5 Feb 2025 05:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738734652; cv=none; b=QqWtPLMmmR7qVtb6uV45ptGIqyvynW7wxLnAswbjzAzqy6zWMntXmsRhiSO9RCQ2/ho7h9gWp9zkIUTTLzyaNc8CvFibkrvCoFL6VbqfacF5hB0MWWujcnfU11Z0cwshL16XGx5X20hFupUJ+OVfyW/d3Bf70g/NDGN5qyctGNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738734652; c=relaxed/simple;
	bh=cLr4iYqJiMgxPThR0EwaYSmoWZxZS/Cfa4/3x+SuUeE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AugSpIPW8CAM6zVbPPjs1kU7ts3kjlDo/3uoQDQISCDEM+BJiFF4UpmLALhVOxLBA471t8la16+XeNQ4Vr6E8dPFNvuE4fB2SEcmEd597iqyhsaixUZOfy0VDPq8nyvjYy0bHjAGn+XXOWcUl6RWEGSycBFnXHCLu66JZcR0ltQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu; spf=pass smtp.mailfrom=astier.eu; dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b=G0ZNG59O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FFiB5MXy; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astier.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b="G0ZNG59O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FFiB5MXy"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B643E25401B0;
	Wed,  5 Feb 2025 00:50:48 -0500 (EST)
Received: from phl-imap-06 ([10.202.2.83])
  by phl-compute-01.internal (MEProxy); Wed, 05 Feb 2025 00:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=astier.eu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1738734648;
	 x=1738821048; bh=mgLlWBpsfhLoLswmkshRBzxurIXhuTKDbsJTVWV9ivk=; b=
	G0ZNG59OQBkaT7tpkK+T353ZFVNDfCmx/dD4ZedIRuEL0XHB+w2ha0n/mP6XnRK8
	SakNAY9Qi1UpaNTPkFWu/L/9EsGijEjrG8klvsXoNdGudKPP7RtU4SzO5aJ1qMIs
	Y3JE4GqWTScXuN8zk0gSSrKuuripnL9nK8kN4iN6rWpvvMLXO4RX4qUnimAsrqYn
	+xwG3i0r7xSPWER0DtRHwYghmUbwuuOSA8izEpc5v75fYoSGPHNdhYmN7o+ZeEYm
	cVeNGHkHr8JpeFA4U1nR/D/lovUhLgb5lLxo7xwyNl00qDUWsgfQww9oZEFpf+qf
	4QKH2PEeWzyflfhD5enh0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738734648; x=
	1738821048; bh=mgLlWBpsfhLoLswmkshRBzxurIXhuTKDbsJTVWV9ivk=; b=F
	FiB5MXyeEkFP6dprUEV0yw6z2Y6c0oJqg80U7Mnsh1iClffSGxrnwioWIFYC1VyS
	sMx93UBWCgRoSEgnQVII9lItA4xD+AIctRiIPwlHJlX27o4oQh6Al08WL9Nrn6og
	8lszqWIOg6HvG2TL/wBjCZTdFd7sTZO9HBhgPbYr37B0bCBvQSMBpPmsEygKO6IM
	wbDsIos85KH4RpjlmJFPI5NgSdArfzGU2tTWDt1o+pHx6A4VXYsNdeKrQZt74WOq
	mrSHlLCpbvetR0LMb3V0ay5fikgkbYx2F+k6lTUD8rLXi9LtaEeJgnRMxUndfI3u
	sfY9dJyPn5wXzrEix64SA==
X-ME-Sender: <xms:OPyiZ32v5t3opbQvxvbF4q_E2tnPA4YSQkZ--lCQB-kR7clIwufvhA>
    <xme:OPyiZ2EiFTJNMmssXu5CuJKj3TLkgjttzne0VTq0ILeQHJ4hOrBMf-4W_7Mo3cNsL
    huPnnyVPiw2p0thaUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdetnhhishhsvgcutehsthhivghrfdcuoegrnhhishhsvgesrghsth
    hivghrrdgvuheqnecuggftrfgrthhtvghrnhepkeevuddtgefhveefveejhfdvhfdtheet
    teefvdfgvdfffeevueefudeutefhgeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghnihhsshgvsegrshhtihgvrhdrvghupdhnsggprhgt
    phhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrshhhohhkrdhrrg
    hjrdhlihhnuhigsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhithhhuhdrjhhoshgv
    phhhsehinhhtvghlrdgtohhmpdhrtghpthhtohepthhonhihrdhluhgtkhesihhnthgvlh
    drtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhht
    vghlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:OPyiZ34hrxY8YFU-_-4er241uzm2oj7z0chXKpZQY-967VQz90R_3A>
    <xmx:OPyiZ83is2momIjGzdHXK9vhA0T7942bfAU8KeLPJC0Gk8iHWfFcBg>
    <xmx:OPyiZ6GDm7aNWQc6dNy04DyBFUfRZ_v4-nHCzBsIiQ9l3APtWkoJKA>
    <xmx:OPyiZ99NzO9EUYJI0wwJdBeR2fqajx-yxYrJEvSdQECe2ZSqJco_Kw>
    <xmx:OPyiZ_7tAjVDsv-gTIkOQqjtD6I7CLNqDp6mwI6gRYqTbSoAUnvkTBWl>
Feedback-ID: iccec46d4:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 453F729C006F; Wed,  5 Feb 2025 00:50:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 05 Feb 2025 06:50:28 +0100
From: "Anisse Astier" <anisse@astier.eu>
To: "Joseph, Jithu" <jithu.joseph@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 tony.luck@intel.com, ashok.raj.linux@gmail.com
Message-Id: <f33148f4-f9f2-4b7c-81df-346b750eb2dc@app.fastmail.com>
In-Reply-To: <2ab4c849-dfc2-4427-b6df-2f2c070e7933@intel.com>
References: <20250131205315.1585663-1-jithu.joseph@intel.com>
 <50ba78dc-f60d-63de-80fd-ef9b1fc68c72@linux.intel.com>
 <2ab4c849-dfc2-4427-b6df-2f2c070e7933@intel.com>
Subject: Re: [PATCH] platform/x86/intel/ifs: Update documentation with image download
 path
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jithu,

Mar 04 f=C3=A9vr 2025, =C3=A0 22:10, Joseph, Jithu a =C3=A9crit=E2=80=AF:
> On 2/4/2025 12:07 AM, Ilpo J=C3=A4rvinen wrote:
>> On Fri, 31 Jan 2025, Jithu Joseph wrote:
>>=20
>>> The documentation previously listed the path to download In Field Sc=
an
>>> (IFS) test images as "TBD".
>>>
>>> Update the documentation to include the correct image download locat=
ion.
>>> Also move the download link to the appropriate section within the do=
c.
>>>
>>> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
>>=20
>> I've applied this patch into the fixes branch with Anisse added as
>> Reported-by.
>
> Thank you, Anisse,  for reporting this, and apologies for missing the=20
> Reported-by tag.
>
> Thanks Ilpo for taking the patch and Tony for your inputs on how to go=20
> about this.
>
>>=20
>> Thanks Anisse for raising this issue and Jithu for getting the gears=20
>> moving to provide an useful resolution.

Thanks for the update, and the Reported-by tag.

Does this patch mean you got confirmation that the scan tests firmware i=
mages will stay restricted to Intel customers with an NDA?

Regards,

Anisse
