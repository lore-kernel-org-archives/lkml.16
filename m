Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA022367DC;
	Fri, 11 Apr 2025 12:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375048; cv=none; b=hGfEpHG7hp/xC6chlHY7bZtzgQHfmR0LPSWk32MtpJ5SgbQAZKienckz57RqF2oRt6ayHmAJtV5wKcv7bsljm0e/0mVUrYDnj4iRXpEYD5bXXXMorHy1PY9KttqredfrA6jJUVh2gFzyPd3UNN8Br0xFrswrx6YB2euoRoQUSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375048; c=relaxed/simple;
	bh=Mkt4qwEL6YZZPNOG+fEpra9ZqeqLpa49F4xR9I37838=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilGnqY2deRFpgbp/431Wvsh5dYhsKD6RcVGrXbsvPKDnTaTJrCNVg4GMNvciZyfaPbPTL4q1D8urGYI60tpTsKETgdW3RDkGb+x1rA8UtoJrt1cklYJ06vrPr/Cfhx2m/ptKZ8ZucpP+DgfoDLDf2SNZLZ6gfKIYuzw9JX9nHDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rnv/jlUV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rnv/jlUV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7698AC4CEE2;
	Fri, 11 Apr 2025 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375047;
	bh=Mkt4qwEL6YZZPNOG+fEpra9ZqeqLpa49F4xR9I37838=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rnv/jlUVLyD5vk/IaJ1ada8t08ATiZdgJxHz/RdcuXsdj+gyFU7hOuNkqMTIsyd4w
	 Yyv+ruvjy8kL51NOhv95ua7VxZbm5JYxkqP6hUqV4MYgL7CFgrt7Mt1ilO8bga3tZU
	 yLFrymZuRPK/Q0PTYjg+/02u4T3Oy+g6OgnVDuZTV75CMiRcUATUd/fWyTHwW+ZxtV
	 eNmEtAUhetYQMFPXOKtEgD6WIOkDy/Qn0uBlawp1dQ53CrzQCXPi0XGZKByDw4qpPi
	 iVeHisRqPtNphh4uzdQFvAlHJ48QxWeCkiEPh/KpXQlrxWNTOralCrQ+YqIYr20AkF
	 YV7YQ/Gv++Z7Q==
Date: Fri, 11 Apr 2025 14:37:19 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Liam.Howlett@oracle.com, ast@kernel.org
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Message-ID: <Z/kM/+uBsD9DAGjF@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
 <Z/jgL52ZVdcxTEkP@lpieralisi>
 <87plhjrpit.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plhjrpit.ffs@tglx>

On Fri, Apr 11, 2025 at 11:55:22AM +0200, Thomas Gleixner wrote:
> On Fri, Apr 11 2025 at 11:26, Lorenzo Pieralisi wrote:
> > On Tue, Apr 08, 2025 at 12:50:19PM +0200, Lorenzo Pieralisi wrote:
> >> Maple tree entries are not used by the driver, only the range tracking
> >> is required - therefore the driver first finds an empty area large
> >> enough to contain the required number of LPIs then checks the
> >> adjacent (and possibly occupied) LPI ranges and try to merge them
> >> together, reducing maple tree slots usage.
> >
> > The maple tree usage for this purpose is an RFC at this stage.
> >
> > Added Alexei because I know BPF arena used the maple tree in
> > a similar way in the past and moved to a range tree because
> > the BPF arena requires a special purpose mem allocator.
> >
> > As Thomas already pointed out a plain bitmap could do even though
> > it requires preallocating memory up to 2MB (or we can grow it
> > dynamically).
> >
> > We could allocate IDs using an IDA as well, though that's 1 by 1,
> > we allocate LPI INTIDs 1 by 1 - mostly, upon MSI allocation, so
> > using an IDA could do (AFAIU it works for 0..INT_MAX we need
> > 0..2^24 worst case).
> 
> The point is that you really only need a 1-bit storage per entry,
> i.e. used/unused. You won't use any of the storage functions of maple
> tree, idr or whatever.

IDA does use the XArray entries (i.e. the pointers) to store bitmaps,
the only drawback I see is that it allocates IDs one by one (but that's
not really a problem).

I wonder if it is used in the kernel for IDs larger than 16 bits, it
should work for 0..INT_MAX.

> So the obvious choice is a bitmap and as you said, it's trivial to start
> with a reasonably sized one and reallocate during runtime if the need
> arises.

Yes I can do that too but to avoid fiddling with alloc/free ranges crossing
bitmap chunks we need a single bitmap, AFAICS that may require realloc+copy,
if the need arises.

> The reallocation happens in domain::ops::alloc() which is fully
> preemptible context, i.e. no restrictions vs. allocations.

Yes point taken.

> For the top-most domain, the callers hold domain::mutex, which excludes
> concurrency vs. ops::alloc/free(). If the bitmap is in a domain further
> down the hierarchy then you need your own mutex there.

Thanks for confirming Thomas, I do rely on the topmost mutex to be held
for dynamic IST table entries updates (LPI top domain).

Thanks,
Lorenzo
