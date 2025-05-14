Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7220ADE6
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226309; cv=none; b=uiQuI2Wgf6fevi/iGE3mTNptYGIopcD6dCQITbuRi+Br9vm2jEhH86lBHFX65rOlyJLwzpvd0zzWNcodTdb4Eax6Ka0XxaA9jyDzwbzdPOs61h5x1DZpzSR9cJt8Prk9hzmfpnRFqvlMxdgQxmeS6YXT2B5GefaU5JaG49BYjjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226309; c=relaxed/simple;
	bh=j9+XZ+bw7t14t604iZV2M8SR46RjkO3CFgtXl+uo9fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5TAFqe6V4j5Ua68MK1CR8hdekN8mupFflfoaUxvoDXSb0McVsMo63ixpPQ5H+aUFMGmNCulHchXNLOX3vTQzmxP8Yl94OiSn9WwZQ+LuEFLh4+m4DpJ9/1S0E73E8sZyP3Ci5fVmixUKXbDONkRwfXxu7kVyzpActO6+hHsxzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrvlmqEu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrvlmqEu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DA7C4CEE9;
	Wed, 14 May 2025 12:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747226308;
	bh=j9+XZ+bw7t14t604iZV2M8SR46RjkO3CFgtXl+uo9fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrvlmqEuESmTorQOh12G23B9NASk8zHZm0Fu3T2+rtz2Umy6xJ77QWqYAiG+gbq1z
	 yhzl7A5w8pwBBbE/TzzFDDamaiw7eJB2qymXZIkTU7lxUWCNgVsGKSBFurX8ldEpIb
	 /vOgPkn8KNS3z8dxQNZRPtgqcgvujO3Q4sb51g6b8IMhLGFk2Y0a0uUNi/ELMNh/w9
	 wgC/i1HmQvy3yuC2VHE9A4WjkEqe06N4Jyh4yeuQm7Ie3mP0BtNmC3+/UeN6V7u1j2
	 Doop+WYWtPpq9Zww1QA1JicExnxi5EUP3gxBv8isveJJ13yaxOqiBBescdp4Zj0787
	 ifNi9jF/WFfkA==
Date: Wed, 14 May 2025 13:38:23 +0100
From: Will Deacon <will@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Radu Rendec <rrendec@redhat.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
Message-ID: <20250514123823.GA10606@willie-the-truck>
References: <20250509233735.641419-1-sean.anderson@linux.dev>
 <20250510-fresh-magenta-owl-c36fb7@sudeepholla>
 <f63c2be5-50e4-4c47-8a56-9a570977a6cf@linux.dev>
 <aCIVec7zl3tIh73h@J2N7QTR9R3>
 <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d67d893e-9c7e-487e-a14b-419a7cdc6158@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, May 12, 2025 at 11:56:28AM -0400, Sean Anderson wrote:
> On 5/12/25 11:36, Mark Rutland wrote:
> > On Mon, May 12, 2025 at 11:28:36AM -0400, Sean Anderson wrote:
> >> On 5/10/25 03:04, Sudeep Holla wrote:
> >> > On Fri, May 09, 2025 at 07:37:35PM -0400, Sean Anderson wrote:
> >> >> Cache geometry is exposed through the Cache Size ID register. There is
> >> >> one register for each cache, and they are selected through the Cache
> >> >> Size Selection register. If FEAT_CCIDX is implemented, the layout of
> >> >> CCSIDR changes to allow a larger number of sets and ways.
> >> >> 
> >> > 
> >> > Please refer
> >> > Commit a8d4636f96ad ("arm64: cacheinfo: Remove CCSIDR-based cache information probing")
> >> > 
> >> 
> >> | The CCSIDR_EL1.{NumSets,Associativity,LineSize} fields are only for use
> >> | in conjunction with set/way cache maintenance and are not guaranteed to
> >> | represent the actual microarchitectural features of a design.
> >> | 
> >> | The architecture explicitly states:
> >> | 
> >> | | You cannot make any inference about the actual sizes of caches based
> >> | | on these parameters.
> >> 
> >> However, on many cores (A53, A72, and surely others that I haven't
> >> checked) these *do* expose the actual microarchitectural features of the
> >> design. Maybe a whitelist would be suitable.
> > 
> > Then we have to maintain a whitelist forever,
> 
> There's no maintenance involved. The silicon is already fabbed, so it's
> not like it's going to change any time soon.

The list is going to change though and it introduces divergent behaviour
that I'd much rather avoid. The mechanism is there for firmware to
provide the information and it's hardly onerous compared with other
(critical) things that it's tasked to provide such as interrupt routing
and GPIOs.

> > and running an old/distro
> > kernel on new HW won't give you useful values unless you provide
> > equivalent values in DT, in which case the kernel doesn't need to read
> > the registers anyway.
> 
> Conversely (and far more likely IMO), running an old/distro devicetree
> on a new kernel won't give you usefult values. Bootloaders tend not be
> be updated very often (if ever), whereas kernels can (ideally) be
> updated without changing userspace.

Updating the device-tree shouldn't require updating the bootloader.

> > The architecture explcitly tells us not to use the values in this way,
> > and it's possible to place the values into DT when you know they're
> > meaningful.
> 
> Well, maybe we can just use these registers for the hundreds of existing
> devicetrees that lack values.

The fact that the device-tree files tend to omit this information is
quite telling as to how useful it actually is. What would you like to
use it for?

Short of having an immediate functional or performance benefit by
exposing this stuff, I wonder if we could add a kselftest for it
instead?

Will
