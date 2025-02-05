Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2540825A650;
	Wed,  5 Feb 2025 06:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738737519; cv=none; b=P8Q4beBvgSbeQr3E+pKsRhk+hFvtfmiWqvZ3/j9v9eK39OWxuBIMzzS06msMasJJDWbMqnn6ysDyalhvjEUVu6sVDV9y6NCje5utydi7UIv8y69VGIThay8Tq5JexB2yMuBfP1g6NxdF4BBU7V0qepbw/KVkz9mOwBRnopFGdeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738737519; c=relaxed/simple;
	bh=oGGEoTbhUslddBF7TXm4peqQH5LwAUTJzBsVa7uU3nw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hiAFAL0geqJb5vB9BhFC6j7L266IDCgG/RrtrzyJRtlsH8jVGNMxTgIKPHQIethuf7/G4JZIuJabxtxG3uKprM+rcEBVY8Lo7FrJJzXRnCurvxNtQuCrlsqaiu2wA3OEzgwOcWB+FiEPIbo1LEkZ7LW9dembrlvxwddBODY4tYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu; spf=pass smtp.mailfrom=astier.eu; dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b=4mneROW1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bV/Gz4v/; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astier.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b="4mneROW1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bV/Gz4v/"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E4B9811401B2;
	Wed,  5 Feb 2025 01:38:35 -0500 (EST)
Received: from phl-imap-06 ([10.202.2.83])
  by phl-compute-01.internal (MEProxy); Wed, 05 Feb 2025 01:38:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=astier.eu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1738737515;
	 x=1738823915; bh=oGGEoTbhUslddBF7TXm4peqQH5LwAUTJzBsVa7uU3nw=; b=
	4mneROW1H/IX5MKJLxWnp/hOy3Z8/tSjkE+2l0Nrc2gt3h7UqM5QFVXvaAOyS3OL
	dVfIJfjfWkO7ns4VAZGAU90nTRQBvRDXq0duN+smwXlp6cXQq8BQ0NNBcXfy5BEU
	Q5afYbY33y3EgijMaKtraPzIb0c+vKrutrXNkttUWcrByHOqKgCcsYonHde1vvsz
	R392rm42YVSh7hL9eujwDymu+9NWaAPinDbRktAEwN3Eq4YT1R88ehIGtCNLpUkd
	/2U7dk97u9Cd2EXoBG4dJeEVp9e12z6oP4z2afgEHtpicX1WHZ055waCtjDPnFJl
	vJL/tmTx7ol2H5zq4dQd5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738737515; x=
	1738823915; bh=oGGEoTbhUslddBF7TXm4peqQH5LwAUTJzBsVa7uU3nw=; b=b
	V/Gz4v/TUbcnXxc+EJU4ym2v8A5YD1D+9/qCRCGmXBIjg47KLqLOPqMtabl+KHz3
	jHAlKQhMVCQl5O6lHX22SwkprRqSLYROU8FM2oSGZwl9i9tcbjtG5D5zfFiOl9+g
	rj0d6R2a4VN8cWXZg63/Fr7FLuxvm46PGuFlC8NSUO2aO+mbx2fdC27qhsCeSX+x
	xUdxrMNPHeBRkv+X39xt0TSXDNBnlWTEzidBsjnlU9RAzAUSAKlLa49rKvdIM2TG
	R+wpiJWzyO3sN6qXOauwoJIdePrvKBjLAkpQwKyzTLqzQOrklmBucKS6/4EubXw8
	1nJgFq3Ea8NLd7fxVnjsA==
X-ME-Sender: <xms:awejZ4WKsKdO1P9-RTrDUwWk8eoGAYNvR4Tdp3ZKTwdwizs1Jw5dEA>
    <xme:awejZ8mUMFOfYv1y6YLHKx8rY-56Ivu-wVyDkIYGULv7OelM21jOQyZ4ot8tChYtW
    TJ4C0RjhbU8Hdmssng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdejfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:awejZ8ZHCID8xwg6zXZfxIyGHbVD1LNgzUc49RtIdgRRlcQ0kW5Quw>
    <xmx:awejZ3XfbRdWeDMnsDFCCctbs9DEIewjG8QztEu3yC_M3TDF2UAKCw>
    <xmx:awejZykHq2Lmth-IPFCPXcQRlXQjKfUV60ORGfGPvCDiq-Io75W6hA>
    <xmx:awejZ8d-81P0ledixWQ38kemKHSrEhhygNcmx-C6lmnC_Fj9gA-kUQ>
    <xmx:awejZwabmURMLsdbghyPCMuY_iYDGTq0EpnFeuKxLpL_GD-u2aOxRfuP>
Feedback-ID: iccec46d4:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5D48129C006F; Wed,  5 Feb 2025 01:38:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 05 Feb 2025 07:37:49 +0100
From: "Anisse Astier" <anisse@astier.eu>
To: "Joseph, Jithu" <jithu.joseph@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Hans de Goede" <hdegoede@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 tony.luck@intel.com, ashok.raj.linux@gmail.com
Message-Id: <6b2479c7-e82a-4239-a329-10082c4e7e80@app.fastmail.com>
In-Reply-To: <b6157185-9c9e-49f2-9e4d-03ad6e26f898@intel.com>
References: <20250131205315.1585663-1-jithu.joseph@intel.com>
 <50ba78dc-f60d-63de-80fd-ef9b1fc68c72@linux.intel.com>
 <2ab4c849-dfc2-4427-b6df-2f2c070e7933@intel.com>
 <f33148f4-f9f2-4b7c-81df-346b750eb2dc@app.fastmail.com>
 <b6157185-9c9e-49f2-9e4d-03ad6e26f898@intel.com>
Subject: Re: [PATCH] platform/x86/intel/ifs: Update documentation with image download
 path
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



Mer 05 f=C3=A9vr 2025, =C3=A0 07:31, Joseph, Jithu a =C3=A9crit=E2=80=AF:
> On 2/4/2025 9:50 PM, Anisse Astier wrote:
>>=20
>> Thanks for the update, and the Reported-by tag.
>>=20
>> Does this patch mean you got confirmation that the scan tests firmwar=
e images will stay restricted to Intel customers with an NDA?
>
> On the contrary, Intel is making the images publicly available.=20
> A new section has been added towards the end of the page[1], allowing=20
> anyone to download the images without requiring an NDA.

Wow, that's great news!
(I had read the page a bit too quickly, sorry!)

I see the download link for EMR, does it mean SRF and GNR are upcoming? =
What about SPR?

Kind regards,

Anisse=20
