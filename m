Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE9478F5E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830803; cv=none; b=HbzUV58FlDJ02NQjsCGCsEdkSGyazHd4SmSafxx5QlPTV2zJS8PjHaIDd4ebxMGDORZxGiShp3RtkRHr1niSvhEUYZhaLP+ETM0ofVMgLwwMSHWARDX1HtEMioWyi3fZtOPDwZkAjDcDwJ4gSpwSNxxNg/F1QqFU3e9kqMM3y2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830803; c=relaxed/simple;
	bh=/NeY+ngXyMi+qDIzTnS/XqlwdHQph8t9i32nDq+xGlc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fwkyTVT0H93/D2W7oONd2Nt9EBgAg4cC8KuPESobhX+/1OjO50agg/3yPDFnFFP6N+lGcOHUMXDyXMCyEqom+MeT2K0kBO7AfpE+o2uZFOs5abjNF6WtN5oZQkFc5s1Y91k1ioMPhvKl0I4VEZhHwMyW6LgJHrcAMvSLKfChg2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mU3EcCeQ; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mU3EcCeQ"
Message-ID: <24c4dfe9-ae3a-4126-b4ec-baac7754a669@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749830788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I2N7u3LdY6tKY81X57d2CYxFMGFItj7ixzsiGoxXQJM=;
	b=mU3EcCeQaLSTLm2rizFes01egO1u2Q33TnpqKl6SQT1ldDUf+cYna0OnlnEQ/aTt68Vszz
	eabfq0djvZPbgjCkWLa1HRyfv/JItxfUbZ3gSrXoq+zT3fEvNCv+2cf3pFSgxNDmmA/SN+
	CB83LX1kFsLv9EaXRnOE4rSyRq8UUtA=
Date: Fri, 13 Jun 2025 12:06:23 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [RFC] comparing the propesed implementation for standalone PCS
 drivers
To: Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Russell King <linux@armlinux.org.uk>,
 Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 Kory Maincent <kory.maincent@bootlin.com>, Simon Horman <horms@kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>, Lei Wei <quic_leiwei@quicinc.com>,
 Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Robert Hancock <robert.hancock@calian.com>, John Crispin <john@phrozen.org>,
 Felix Fietkau <nbd@nbd.name>, Robert Marko <robimarko@gmail.com>
References: <aEwfME3dYisQtdCj@pidgin.makrotopia.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aEwfME3dYisQtdCj@pidgin.makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 6/13/25 08:55, Daniel Golle wrote:
> Hi netdev folks,
> 
> there are currently 2 competing implementations for the groundworks to
> support standalone PCS drivers.
> 
> https://patchwork.kernel.org/project/netdevbpf/list/?series=970582&state=%2A&archive=both
> 
> https://patchwork.kernel.org/project/netdevbpf/list/?series=961784&state=%2A&archive=both
> 
> They both kinda stalled due to a lack of feedback in the past 2 months
> since they have been published.
> 
> Merging the 2 implementation is not a viable option due to rather large
> architecture differences:
> 
> 				| Sean			| Ansuel
> --------------------------------+-----------------------+-----------------------
> Architecture			| Standalone subsystem	| Built into phylink
> Need OPs wrapped		| Yes			| No
> resource lifecycle		| New subsystem		| phylink
> Supports hot remove		| Yes			| Yes
> Supports hot add		| Yes (*)		| Yes
> provides generic select_pcs	| No			| Yes
> support for #pcs-cell-cells	| No			| Yes
> allows migrating legacy drivers	| Yes			| Yes
> comes with tested migrations	| Yes			| No
> 
> (*) requires MAC driver to also unload and subsequent re-probe for link
> to work again
> 
> Obviously both architectures have pros and cons, here an incomplete and
> certainly biased list (please help completing it and discussing all
> details):
> 
> Standalone Subsystem (Sean)
> 
> pros
> ====
>  * phylink code (mostly) untouched
>  * doesn't burden systems which don't use dedicated PCS drivers
>  * series provides tested migrations for all Ethernet drivers currently
>    using dedicated PCS drivers
> 
> cons
> ====
>  * needs wrapper for each PCS OP
>  * more complex resource management (malloc/free) 
>  * hot add and PCS showing up late (eg. due to deferred probe) are
>    problematic
>  * phylink is anyway the only user of that new subsystem

I mean, if you want I can move the whole thing to live in phylink.c, but
that just enlarges the kernel if PCSs are not being used. The reverse
criticism can be made for Ansuel's series: most phylink users do not
have "dynamic" PCSs but the code is imtimately integrated with phylink
anyway.

> 
> phylink-managed standalone PCS drivers (Ansuel)
> 
> pros
> ====
>  * trivial resource management

Actually, I would say the resource management is much more complex and
difficult to follow due to being spread out over many different
functions.

>  * no wrappers needed
>  * full support for hot-add and deferred probe
>  * avoids code duplication by providing generic select_pcs
>    implementation
>  * supports devices which provide more than one PCS port per device
>    ('#pcs-cell-cells')
> 
> cons
> ====
>  * inclusion in phylink means more (dead) code on platforms not using
>    dedicated PCS
>  * series does not provide migrations for existing drivers
>    (but that can be done after)
>  * probably a bit harder to review as one needs to know phylink very well
> 
> 
> It would be great if more people can take a look and help deciding the
> general direction to go.

I also encourage netdev maintainers to have a look; Russell does not
seem to have the time to review either system.

> There are many drivers awaiting merge which require such
> infrastructure (most are fine with either of the two), some for more
> than a year by now.

This is the major thing. PCS drivers should have been supported from the
start of phylink, and the longer there is no solution the more legacy
code there is to migrate.

--Sean
