Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611511C8FBA
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750245698; cv=none; b=keea/5Ls2aBxOr5xLhg7wyjYlLuIbhMBGXNQrJkHVyh1f85bLNZdakrf/CS8sziAGOBXauc8WIgSecXoXfV3JZ94zH+8Ewkf7S1HS2wBrh8NIPU+hiY2DA5GdjiHb4zS2qmhR816cxhm9qxDz08mGndRRalosoWMY7ihOVer8NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750245698; c=relaxed/simple;
	bh=uRFsTOlfPhoDCoYACm33eaOXzBsPFtKKdeGwiQWwRAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjkvmPZbGxVUYEarvKes1Zl1Vkqv3e4Owp3RYT/FSRCadMShLLlFvoI3nc2/uZHA/+owPFG30ky/fOm2J5TNWRZr79M+UIZl/+Gba/s4/zFRP+mIFavBlMvGsIsi3wTbmC1jqKQlgf+N3dRhwRhWmLLbmb8g0PZ9yC85MmTDQQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=V+83k8Sy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DhQOndA5; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="V+83k8Sy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DhQOndA5"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 42C8325400E4;
	Wed, 18 Jun 2025 07:21:34 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Wed, 18 Jun 2025 07:21:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1750245694; x=1750332094; bh=xW1KECTkcj
	dvcmqcM1Jc+NvfWpHWFpgrCEQZ214S2+w=; b=V+83k8SyaXWHxa2oE8ouXX0CYN
	5ZTw1oBWA3zFN5uyZcBeTcgBajskfvb6HyhzZzN8KCW5NlcydO5cDidjirGeIPvg
	jtDdYYpKxpmqGn8F+5kZcB4wgpJRWl+xpP4hsmn+5m4LKX4u7ccpIton9PGwYfBD
	lek/8U5mogTp1OJKdH4GMhbKopzi7odL4Oq1qpQWrLrZDS7nKt+JfrHxfJQ0BMxY
	v9So5+tgMncxnEOvqKCxlIHwEz2Er99LydUQqkB/lggHN+Qqf6NbvQ67/rMX3Y+V
	Ez+cvzwkUNCiZ9W5E8cMQDs7KqO552ANMJqchb81d2gprVRsM+sbMidy4TRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750245694; x=1750332094; bh=xW1KECTkcjdvcmqcM1Jc+NvfWpHWFpgrCEQ
	Z214S2+w=; b=DhQOndA5tI8kWO7ztEdzUxqSbW0RpGtGUAgIDdz3PSkauO2+usk
	fcQTyYNeIQXouCECHfUgvypdpjLrWnqsi9IL1cWi6E3D0+mdkuYV6CyV0Y9DyK7U
	b1uAkqnhKQ80CGCZzevWOBwTzm6ubI8sdSwWwroEp65sO77AJm8XbDoTRxyEx6Lx
	v7PPDnPR2qlknqq7Y4fVUNYTwirzj4s7Fmieqli0q20mxuT+RGrNaOc4p/iLLvoq
	RJzgio5z7V87Y5oTaCP/vsbzU0reuT7vdZjzUt01cz3gecrCxrc7IRsmkzWIEjVJ
	+ux/XoOINNYB5bYa60SqJQkTjvNDbUkneVg==
X-ME-Sender: <xms:PaFSaG8gG1lyYknIY_n-LriJM4je0qxgCMNWWpTyDGhSMCjp_4ewEA>
    <xme:PaFSaGul-r-q0TvuPBOOkk3RMW5N9Ne2lSucPXsujwbhVJbs8JCkA3maQy5PZeZM2
    3UDmhd57LAz7Q>
X-ME-Received: <xmr:PaFSaMDoWi4mrJ3Rkzd2DQf3v9gDk0Dk1fdedtiQ_EOHzdKQesBL0ry240a9HJlNzk4U7xsHc5D99CK9Ofz4o0cHF1yPJNc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvhedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtoh
    eptghvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghl
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:PaFSaOcFtb9REpQZticDGBfjVJEsWvBIR7s2IRrU14OfQOO2hZZTXw>
    <xmx:PaFSaLPRmEKtwXzj794eSU-efP7HoROpkFdWyvnWUazWU64y9w71vw>
    <xmx:PaFSaIm3YrOfA4cmI58jnEz6qFDKFcVD1Jx36R-cg2MWiZx3sh55Wg>
    <xmx:PaFSaNvM1oTHntFZc1naYoiM7vxm6-Jjs1y4nUc_V-FM49xstIF5Gw>
    <xmx:PqFSaDU4cP71PhRW1ra14m1JP1YnRKr7ysVfNsYcxyjWEE8eBd4DClB2>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 07:21:33 -0400 (EDT)
Date: Wed, 18 Jun 2025 13:21:31 +0200
From: Greg KH <greg@kroah.com>
To: Juergen Gross <jgross@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: CVE-2025-38046: xen: Add support for XenServer 6.1 platform
 device
Message-ID: <2025061823-powdery-gauze-b705@gregkh>
References: <2025061830-CVE-2025-38046-3356@gregkh>
 <42f8eb9a-2807-4a7f-9e24-35e87a35c6f3@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42f8eb9a-2807-4a7f-9e24-35e87a35c6f3@suse.com>

On Wed, Jun 18, 2025 at 11:55:24AM +0200, Juergen Gross wrote:
> On 18.06.25 11:33, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@kernel.org>
> > 
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > xen: Add support for XenServer 6.1 platform device
> > 
> > On XenServer on Windows machine a platform device with ID 2 instead of
> > 1 is used.
> > 
> > This device is mainly identical to device 1 but due to some Windows
> > update behaviour it was decided to use a device with a different ID.
> > 
> > This causes compatibility issues with Linux which expects, if Xen
> > is detected, to find a Xen platform device (5853:0001) otherwise code
> > will crash due to some missing initialization (specifically grant
> > tables). Specifically from dmesg
> > 
> >      RIP: 0010:gnttab_expand+0x29/0x210
> >      Code: 90 0f 1f 44 00 00 55 31 d2 48 89 e5 41 57 41 56 41 55 41 89 fd
> >            41 54 53 48 83 ec 10 48 8b 05 7e 9a 49 02 44 8b 35 a7 9a 49 02
> >            <8b> 48 04 8d 44 39 ff f7 f1 45 8d 24 06 89 c3 e8 43 fe ff ff
> >            44 39
> >      RSP: 0000:ffffba34c01fbc88 EFLAGS: 00010086
> >      ...
> > 
> > The device 2 is presented by Xapi adding device specification to
> > Qemu command line.
> > 
> > The Linux kernel CVE team has assigned CVE-2025-38046 to this issue.
> 
> Please revoke this CVE, as this issue can't be triggered by an
> unprivileged user.

Now rejected, thanks for the review.

greg k-h
