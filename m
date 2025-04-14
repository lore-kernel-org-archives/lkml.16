Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD96F1A5B94;
	Mon, 14 Apr 2025 08:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619222; cv=none; b=EkFSCzOk7NrplABR0OdFL1yizt0JAbIPHL3Y3EclVvOc2AHbfSwE0DG6iZJPmsMxKeJp5Q576JAw9oPj41lM088UBvj/pPwp6J5lRXma64785tiokODsrLNHx45MvTt7dEjfNJR5lC3fRGcWZFmrLVFYJBX7QPOF2TR5MXimVWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619222; c=relaxed/simple;
	bh=RofbViZGosLj5CtM3MzeJy2VAcecwtpspL17FRMtiMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0tGo/LrWW8kHN80Zu8W67IlNPKPqqOU76ugNRgUDhxXMzRnhPkcYpwndBCjmluu010zRTs0MCFsgX3g3XbR94ng6iaIv9YoyR/9S8xvBqw/V5EirAjbwWF0rdQF50uIlyXlOqBB5y+q9TCFx/EH10DAv/5ncyfRhvj6OMczoE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDfFvfPN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDfFvfPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A82C4CEE2;
	Mon, 14 Apr 2025 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744619222;
	bh=RofbViZGosLj5CtM3MzeJy2VAcecwtpspL17FRMtiMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDfFvfPNz8yFnnXfEAmwAEshO5h94EAyNmGCYgylH60yroaEvk/LNai251/t8esqG
	 l+yW6sUDJeEPHWHNC9YX9E3lTL1bcQ7c7ucIYn8k+Bi5dm/9rtxC5EbxzO+Y5Fnwlg
	 0HdVzP0gfMD1RlUXa7FzNNjUcqxOe4ANry+yjVpiOktryqbMopI58LAwHjeatIBYwe
	 omHbkiBD5ZQJFOUqFhyG+0royDMdzyw55yTTXgpcU5gAw/sG1d8588rdZpk/llFAST
	 7KZJ3LLfGXUrOYjeUBPL0iLuwIuni6Zs6Q08CFqaec7CIQPYCBprPhjzeEYkJB7MmC
	 svMBfkufjV0Kw==
Date: Mon, 14 Apr 2025 10:26:54 +0200
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
Message-ID: <Z/zGzjyrEMYMd8cI@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <Z/jgL52ZVdcxTEkP@lpieralisi>
 <87plhjrpit.ffs@tglx>
 <Z/kM/+uBsD9DAGjF@lpieralisi>
 <mcyioyevok6tixna2xwk5q3d6x5b5spyucc4fiiy3h4v5jwxbj@bw6ewonqm2ks>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mcyioyevok6tixna2xwk5q3d6x5b5spyucc4fiiy3h4v5jwxbj@bw6ewonqm2ks>

On Sat, Apr 12, 2025 at 09:01:18AM -0400, Liam R. Howlett wrote:
> * Lorenzo Pieralisi <lpieralisi@kernel.org> [250411 08:37]:
> 
> Thanks for the Cc.
> 
> > On Fri, Apr 11, 2025 at 11:55:22AM +0200, Thomas Gleixner wrote:
> > > On Fri, Apr 11 2025 at 11:26, Lorenzo Pieralisi wrote:
> > > > On Tue, Apr 08, 2025 at 12:50:19PM +0200, Lorenzo Pieralisi wrote:
> > > >> Maple tree entries are not used by the driver, only the range tracking
> > > >> is required - therefore the driver first finds an empty area large
> > > >> enough to contain the required number of LPIs then checks the
> > > >> adjacent (and possibly occupied) LPI ranges and try to merge them
> > > >> together, reducing maple tree slots usage.
> > > >
> > > > The maple tree usage for this purpose is an RFC at this stage.
> > > >
> > > > Added Alexei because I know BPF arena used the maple tree in
> > > > a similar way in the past and moved to a range tree because
> > > > the BPF arena requires a special purpose mem allocator.
> > > >
> > > > As Thomas already pointed out a plain bitmap could do even though
> > > > it requires preallocating memory up to 2MB (or we can grow it
> > > > dynamically).
> > > >
> > > > We could allocate IDs using an IDA as well, though that's 1 by 1,
> > > > we allocate LPI INTIDs 1 by 1 - mostly, upon MSI allocation, so
> > > > using an IDA could do (AFAIU it works for 0..INT_MAX we need
> > > > 0..2^24 worst case).
> > > 
> > > The point is that you really only need a 1-bit storage per entry,
> > > i.e. used/unused. You won't use any of the storage functions of maple
> > > tree, idr or whatever.
> > 
> > IDA does use the XArray entries (i.e. the pointers) to store bitmaps,
> > the only drawback I see is that it allocates IDs one by one (but that's
> > not really a problem).
> > 
> > I wonder if it is used in the kernel for IDs larger than 16 bits, it
> > should work for 0..INT_MAX.
> > 
> > > So the obvious choice is a bitmap and as you said, it's trivial to start
> > > with a reasonably sized one and reallocate during runtime if the need
> > > arises.
> 
> I think the IDA or the bitmap for space saving would be better - the
> xarray does do something under the hood for IDA space savings.
> 
> If you want to compare, I can suggest some changes to your maple tree
> code (mas_{next/prev}_range might help).

Thank you.

> > Yes I can do that too but to avoid fiddling with alloc/free ranges crossing
> > bitmap chunks we need a single bitmap, AFAICS that may require realloc+copy,
> > if the need arises.
> 
> That is the advantage of the IDA or maple tree, the expansion is handled
> for you. I'd be inclined to suggest using the IDA, but I'm not sure how
> important storing an entire range is for your usecase?

The point is, IDs represent interrupt IDs. We allocate them in batches,
whose length varies, it can be 1 but it can also be a larger vector
(ie 1024).

It is obviously faster to allocate a range than allocating them 1 by 1,
that's the only reason why we have not used an IDA (and also because I
did not know whether an IDA is recommended for a larger ID space > than,
say, 2^16 - but I think it is because it is designed to cover 0..INT_MAX
and I noticed that -mm folks may even ask to extend it).
> 
> Are there other reasons you want to use the maple tree besides the range
> support?

We used the maple tree because it handles ranges, we have not found a
sound usage for the 8 byte entry pointer (there may be some but it is
overengineering), that's why I try to merge adjacent ranges on
allocation, for vectors that are length 1 or 2 it is gross to waste
8 bytes for nothing.

Using an IDA and allocating 1 by 1 has its advantages (ie if the ID
space is fragmented it is easier to find free IDs - even though,
again, given the expected allocation pattern, freeing IRQ IDs is rarer
than allocating them so I am not sure we would end up having a very
sparse ID space).

All in all, other than looking sloppy (allocating 1 by 1 when we could
allocate a range), using an IDA would work.

In terms of memory space efficiency, I think this depends on allocation
patterns (and what I did minimise wasting slot entries for nothing).

I added Alexei because, memory allocation notwithstanding, handling
ranges is what the BPF range tree does:

commit b795379757eb

the reason a range tree was implemented to replace a MT was the
memory allocation requirements - they were using a maple tree before
(with unused entries).

I can go for an IDA unless someone see a point in pursuing the current
approach - that I would update according to feedback, at least with
this thread you get the full picture.

Thanks !
Lorenzo
