Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17BF13D539;
	Tue, 15 Apr 2025 08:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744704502; cv=none; b=GIeuliAtejE8lp/LGjBsvp4KMLOtTe6NLFB3jOTzTfK/qQ7tdKOAf+LqHSB26tBD0pJ6mkKIUgYN1otmbmtqzq5+evgmD4TaO0uLrl35IjMTU2We9VkQFmUF2Qi9cOw5Qe2yTDpN+X/1OVsD9n+9B7v664AJK1hqWea8JaV9+O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744704502; c=relaxed/simple;
	bh=VY+BI83+U62fNIjSJ7wZ0e9O8YlwQ1ENtS67jWwGC38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5HUhE+3erMSwAgrfHJVJH3VHnMXJiNDsSu6qNcRZSChzDCAYyFFDchn3gpCsc4rvt28LYCJ4ed0iXytn0ffIsCehopnI9gwxKYy/NWv1s4l33j63d2qO12GozLEIygAyPoPe9WKBJaHGsqmBIw4CTxxAZycIu+J3rYZx0kBUdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2xyBPUq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2xyBPUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43F3C4CEDD;
	Tue, 15 Apr 2025 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744704501;
	bh=VY+BI83+U62fNIjSJ7wZ0e9O8YlwQ1ENtS67jWwGC38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e2xyBPUqMNLhOrAXNHcjWw0mRb6xsy8l2AiEhAO6HouM3bkxEj/JAgFDAKtQSlrs4
	 m93VH51bjGPzXvSEpII7CwhjYF/fGEDg8YYgiipRQBWlL4OXQxfa0mgLKSRMqHBnZL
	 T++QP26VRKNKwV4CbHFmvtAhGxF5kOteSdkZ5y4Ufzdjs8FW0BDDbhYrZs7OL4MOmR
	 VOyjclC5MFc9iwFRmUJ7teMM9Tqei4+e4iTVxaEpTe281mcc2QpksEp4bPhj5tIRvC
	 XvfU5vy3x9RSB0lfuCjM9N6J4a2FCW4BniGR7nR+YsGlAIcQeBJroWOE4stIFDqTOo
	 pT8CZt5Agg1gw==
Date: Tue, 15 Apr 2025 10:08:14 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ast@kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <Z/4T7lpXSFgomIai@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <Z/jgL52ZVdcxTEkP@lpieralisi>
 <87plhjrpit.ffs@tglx>
 <Z/kM/+uBsD9DAGjF@lpieralisi>
 <mcyioyevok6tixna2xwk5q3d6x5b5spyucc4fiiy3h4v5jwxbj@bw6ewonqm2ks>
 <Z/zGzjyrEMYMd8cI@lpieralisi>
 <4vtbkgtp5c7vdfdzof46l3fjwwsd66j3tynxub4png57zcau7h@k2treu5vgn42>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4vtbkgtp5c7vdfdzof46l3fjwwsd66j3tynxub4png57zcau7h@k2treu5vgn42>

On Mon, Apr 14, 2025 at 10:37:57AM -0400, Liam R. Howlett wrote:

[...]

> > I can go for an IDA unless someone see a point in pursuing the current
> > approach - that I would update according to feedback, at least with
> > this thread you get the full picture.
> 
> Eventually, we plan to swap out the backing of the IDA to use the maple
> tree.  I think we could add range support as part of this change.
> 
> If you were to add an interface to contiguous allocate a number of IDAs
> by putting your loop in the IDA interface, we'd be able to switch that
> to a range store during the conversion and keep the use case visible
> during the planning stages.
> 
> Having that interface would make it obvious the change is necessary and
> wouldn't be missed.

Yep understood but on the other hand it would force me to allocate a set
of contiguous IDs, which is a bit cumbersome with the current IDA
(alloc them one by one - if any fails to be contiguous restart, rince,
repeat - it is a double whammy).

I allocate a range because I know the maple tree handle them efficiently
and to be honest, a range allocator is all I need, there isn't any in
the core kernel (there are plenty - on purpose - range allocators, BPF
range tree and GICv3 ITS LPIs allocator are good examples, I could reuse
them instead of reinventing the wheel).

FWIW, when Alexei implemented the BPF arena he vetted other examples.

https://lore.kernel.org/bpf/20241105212001.38980-1-alexei.starovoitov@gmail.com/

I don't think the code I wrote is that complex either and it minimizes
entry storage waste - probably you don't want to see it in the kernel
because it is not a MT usage you'd expect - storage wise, I need to
measure it but I think it definitely requires fewer bytes than a
preallocated bitmap - when the IDA range API is in I would be glad
to swap to it.

> Unfortunately, I don't really have a timeline on changing the IDA to the
> maple tree.

I understand, it is a chicken and egg situation, see above.

> Please keep me Cc'ed on whatever you decide.

I'd need something promptly, so I will go for a simple solution (bitmap
or IDA 1-by-1) if the current MT one has to be scrapped.

Thank you,
Lorenzo
