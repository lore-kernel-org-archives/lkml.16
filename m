Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD2629A9CC;
	Thu, 15 May 2025 13:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314808; cv=none; b=oCFNOuQY8gaKihjyJ5PdwPPKn5Y5f3y6Mk/aLIDuPutEOb1+rEVErn9vwWJ/ZyRcdh+j3DcMHtt44DkFoAExPZsfe/TscCK8ReRRsFmAuf42nHyznUz8nonXSlPsKoXaAVw4X6fjDxciP0XAwWdaHy3VJxFdYF5ICuuRGvKxvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314808; c=relaxed/simple;
	bh=Y5x0Q5wwhg5x4WNJLlfJSj3Na3CIMpE00k8kQT2PRPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VkCCj0VGqXviD5VQjJ8HjLFb7qzK1YDyIRy38Re2wUwIHD4nW8Xex4R0j2GUys0kNhCPt117z9MiFZ16v5H5+7mkRy+MZBoogBYqimT1vlXI79PpiWAU3H3t6x8eO9jBWVyfkNhdvsyH7079m3IAOxia94JbcVnK8eo4Zj/f88Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwdgySrB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwdgySrB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79970C4CEE7;
	Thu, 15 May 2025 13:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747314807;
	bh=Y5x0Q5wwhg5x4WNJLlfJSj3Na3CIMpE00k8kQT2PRPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwdgySrBFpBknjowQX5Hoxv6LObSUmuFtYmiMRQUWj5s+X6Oy28kwmAvXM9dgeFUh
	 aMypFFt2AEPp2VpYL84MmhfFffQ/5mBFY4/cVxpYuBxhdiHpsZ0EcTn2DhcDowf1ub
	 qmUW/bBpIMjI2vN/rIBFu8dEt9FgLc5HUQwIBkumjALsrJLzuK4EeqFya30Fpn17c6
	 zLBIDd5DOyFcuLW5bNPAiNaGxfyDxX3X45eFzAQWxZtUtXk3YN8u1ZeJqeNKWv9LwL
	 9rPgr6PcheBYjnKRyQ71wIieMzBIChgrPx17FUGtbor72kdQ3ci2DtM5UZWXKSRH6n
	 sbolT6KimcIaQ==
Date: Thu, 15 May 2025 14:13:21 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <20250515131321.GG2936510@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
 <20250509140957.GD2492385@google.com>
 <aCRZzwW0w8oVWLUp@finisterre.sirena.org.uk>
 <20250515071357.GD2936510@google.com>
 <aCWfre2-n_PSuhxR@finisterre.sirena.org.uk>
 <20250515092000.GF2936510@google.com>
 <aCW0822BVpfKV2NL@finisterre.sirena.org.uk>
 <8beeddcf-1dc7-4af8-b287-4c896852b258@gmail.com>
 <aCXQUu97HL_yrH89@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aCXQUu97HL_yrH89@finisterre.sirena.org.uk>

On Thu, 15 May 2025, Mark Brown wrote:

> On Thu, May 15, 2025 at 01:28:15PM +0200, Artur Weber wrote:
> > On 5/15/25 11:33, Mark Brown wrote:
> > > On Thu, May 15, 2025 at 10:20:00AM +0100, Lee Jones wrote:
> 
> > > > I can go with 2 in this case.  Applying in dribs-and-drabs as Acks come
> > > > in would be sub-optimal and would likely end up in a mess.
> 
> > > Well, then just going a head and applying them on a branch with a tag
> > > seems easier than delaying then.
> 
> > I can split the patchset into two parts (one for MFD, one for regulator)
> > if it helps.
> 
> There's still a dependency on the MFD bits whatever happens.

Right.  That won't help since you need to describe the deps.  Submitting
them as a set was the correct thing to do.

-- 
Lee Jones [李琼斯]
