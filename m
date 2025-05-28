Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9054018DB03
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748426648; cv=none; b=qKfaufhTxAttehzhu4jktXy9NGUBpP7uZiyXny1libaH/yHK0DKL1EWVDgcLoznPL9weYL3HYO85olm2u/f34xyXg3kXV/9wKJ4mLvpnjqKc6Q1YqV9IKu1Sx+x8CtxO1usFRFx6vl4x8i1vCgH+9koVfFgieg4zOjVLroZLP30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748426648; c=relaxed/simple;
	bh=cxMhNSA7YFBb8MzIwBHUr29JpB+FgIinMUdGqLaC5zA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CAQ9GGDczmHTiNKBhHO8yOIdX80m/siyxvtdVc6xLtkSp2FYxM64SNltqIqKwRi2an0nuBaAXourzASfCiWcRgOQoXvucEPNsiHo8b7zU6WuCY+Jkt8rrr2/5DxWj4P2P3ibOxjNoK+g5GD0RhrQFQp+yqAOY1zUDUjeGozEpsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ly37Zask; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hNnqbfIw; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ly37Zask";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hNnqbfIw"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 185FD2540182;
	Wed, 28 May 2025 06:04:04 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 28 May 2025 06:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1748426643;
	 x=1748513043; bh=DdqNUWHK+3KtA5rMoqugrHpTxGmQgyC2mzb11PVWk48=; b=
	ly37ZaskxbhqjBjflAx0xO4yF6euWNRBLSukyUOY7Y4mPVvhAGcB9NTvbMXjF1uZ
	R6lbabU0OjFT5nDwH915JAaHfIsikwAr/fK+q4mijc2XeyEJvbaWJD/u/JbcJc2q
	OcdwfmyhWsC/IvZCh+D/WLhmckZofeowLa3+gqGovleroYLHr/pGdChZY0S9Kpcv
	/SxgD1wwPXmUH8O4w1lmx0orEysYlRqfdqBYnJoCLe7sH7dz9YQ0TZO5aR1B0W57
	yb2rPe3GUqYCMsdP6oDlnmq3ewsvmBlehvVcx57tzPZ8/IqKnUBlBd5nfgLxsMpo
	2NjPFak4M5szt3XSmzPtgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1748426643; x=
	1748513043; bh=DdqNUWHK+3KtA5rMoqugrHpTxGmQgyC2mzb11PVWk48=; b=h
	NnqbfIwVoEIQ5xyWWROA+8wrBUitc3WIvjX/SCnlbt/rkFyWZVclaWXQgNbL7eDl
	hnYNCl9B9/VXGoutViD+QQPulLkNqA96qgUJxWAlOng0lnf7i9vnzGhpUeJ9JEvB
	9JnxreLAWvGMmB7ZN9kmxZoa0/NTezcND8TrhbmR15LDCMWCpZ90rvpnv/Ez0LqH
	lTSaidZsMPZxj7+c4p6hYtaaOy8EJa85wW1Gr8wScfGcs10Oay4eyndLm12Qh2xQ
	Bz918zQLzi6CdI6/GuycN3KzsznKBVa1DnjUlf2iPaaWGN0M1m7LewRse1UZ6xMQ
	5lGJKESwtiXNoM9zsjh6g==
X-ME-Sender: <xms:k982aKHYGhoMP0jnCGCWDL_hSQnO3HqkRdHo_8vkuGVZZ1TfMPdx2w>
    <xme:k982aLX-cNZHka7KnbWDxsfh1BBilWPSq5K3kw0HQHrV4ALq-N0I1dGx5ZY7Vu4qa
    u4KjmMru_vZYiXYv4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvvdeljeculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    jghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfd
    cuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeeh
    udekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
    pdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsh
    himhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhl
    rdgtohhmpdhrtghpthhtohephhhimhgrlhdrphhrrghsrggurdhghhhimhhirhgrhiesih
    hnthgvlhdrtghomhdprhgtphhtthhopehimhhrvgdruggvrghksehinhhtvghlrdgtohhm
    pdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehinhhtvghlrdgtohhmpdhrtg
    hpthhtohepmhgrthhthhgvfidrsghrohhsthesihhnthgvlhdrtghomhdprhgtphhtthho
    pehmihgthhgrvghlrdhjrdhruhhhlhesihhnthgvlhdrtghomhdprhgtphhtthhopehroh
    gurhhighhordhvihhvihesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:k982aEJpL4_3GWPnK1oqeKTn6WarLOQlBM94cmDPgotwBXZH-T1GfA>
    <xmx:k982aEGJfBlV3Xy4WwHfQTCaDWdZgQ9gOh8Hh2-gRqNFFJvOf8yXLg>
    <xmx:k982aAWbht-hN00qrA987d9SIO3LKOtOqAWyt3-JQB6uLtPLXXppgg>
    <xmx:k982aHMbGdv56or7uIA4Q1yiaLCwkVHY07jHDdvhqJnH0VfhbdmQrg>
    <xmx:k982aCRLqOQPFP8g47PNqMJg0Ft17WaYnEin7FVC_pepEH7he5TdeJOy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A12D7700060; Wed, 28 May 2025 06:04:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tea118988e335f97b
Date: Wed, 28 May 2025 12:03:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Matthew Brost" <matthew.brost@intel.com>,
 "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>,
 "Imre Deak" <imre.deak@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-Id: <704fd2b9-04da-4ec8-b854-22bc3ce9058e@app.fastmail.com>
In-Reply-To: <aDbYs7QZRfr2i80A@smile.fi.intel.com>
References: <20250523121106.2231003-1-arnd@kernel.org>
 <j7yodlrk7wh3ylvb2z622ndlzm4guhahmakdb6l5d6qtv5sabo@w4bfiehtmaab>
 <aDbYs7QZRfr2i80A@smile.fi.intel.com>
Subject: Re: [PATCH] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, May 28, 2025, at 11:34, Andy Shevchenko wrote:
> On Tue, May 27, 2025 at 03:55:46PM -0500, Lucas De Marchi wrote:
>> On Fri, May 23, 2025 at 02:10:46PM +0200, Arnd Bergmann wrote:
>
> ...
>
>> > +	depends on INTEL_PLATFORM_DEVICES || !(X86 && ACPI)
>> 
>> 		   ^
>> Did you mean X86_PLATFORM_DEVICES here?

Yes, my mistake.

> Why do we need to depend on the whole thingy (yes, it will be enabled at the
> end) if we only talking about Intel?

I don't understand what you mean with 'the whole thing'. My change
changed the existing 'select X86_PLATFORM_DEVICES if X86 && ACPI'
into the corresponding dependency, in order to change it the
least.

The dependency itself is needed because of

       select ACPI_WMI if X86 && ACPI

and this in turn is needed for

       select ACPI_VIDEO if X86 && ACPI

>> With that, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> 
>> I see several drivers selecting
>> X86_PLATFORM_DEVICES though. Maybe they should also be translated to
>> dependencies instead?
>
> I think so, selecting that sounds wrong.

Agreed. Overall, what I'd really like to see is to remove
all those 'select' of drivers from other subsystems. I think
ACPI_VIDEO is at the center here, and changing all the
'select ACPI_VIDEO if ACPI' instances to
'depends on ACPI_VIDEO || !ACPI_VIDEO' would solve a lot of
the recurring dependency loop problems in drivers/gpu/.

Actually doing it without regressions is going to be
nontrivial though, because any change in this area is likely
to trigger another dependency loop somewhere.

     Arnd
