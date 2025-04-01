Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055881EF39A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 10:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743502354; cv=none; b=X7w8FVJSjHgX5xGBKdQNSVyxYCks5VizwYfwLQpiAb+opoTHlaOhhiDcOoqtCpK3QPkikp9AsdtcoUquHzlqU2Q9Gi3CaoCfH36ckWz8S3x0H5FpU7qe4180AzYY6zEl5RfwcrAGlG67ewCEK4SYfgoPMWoUYbXSUZvh8YBaZvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743502354; c=relaxed/simple;
	bh=xAL++FE93adr27VON8GPMhrsRR7Iv7WswJqOqriBV4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J38TRQ+zrZPhljc+Y7mpdjKB+NdqaMIn2JjvXG4QgGZ411gE3/pJaaiaNKl2Vw5zeWACYFxRLz7AsEfOOfH6X1HdxLw6p3LLiTxoalmXg/LPDcDDIfRhWSCBuFk3bT0hteYWrytEj9w7zKr1TQOrdV2ubLjhBCXWbaRwf/qAc9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uq2D60Pq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uq2D60Pq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFCFC4CEE4;
	Tue,  1 Apr 2025 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743502353;
	bh=xAL++FE93adr27VON8GPMhrsRR7Iv7WswJqOqriBV4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uq2D60Pquq75DNTPmBUzl9Z6jk0WPoeHehqBemxUhzoWGEi06gLXQ9bhsONLjzpqB
	 inffZewEWMlf4GFNfJiGoGjxhdHXW11fKYUI8ZvN9ZDsATUM3CYcef7qWX8KsFnqfL
	 2mF/hs0YkqJ1Lzvddbt6MtnUg4Hnsf3HIu89tnmYCS/q7jFmgFNGGMOM0PtpCmXX1v
	 RWlfIHRPGUyYlRlJsiJSEYSTTEsGRt6nn1OI7TEIJ9fP2y5815f0naaUTAUoBGMfqv
	 hpoWTYQwQ7WTfB6BFAE8FSJtBiQ+lmFiHIwpGLHM3nX1yJVgC1kPcFGQitiizyI7y4
	 RsLJuufRUFzTA==
Date: Tue, 1 Apr 2025 13:12:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org,
	gshan@redhat.com, steven.price@arm.com, suzuki.poulose@arm.com,
	tianyaxiong@kylinos.cn, ardb@kernel.org, david@redhat.com,
	urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Message-ID: <Z-u8Cc7i_l0xM5TT@kernel.org>
References: <20250328062103.79462-1-dev.jain@arm.com>
 <Z-cnmklGUojMzsUF@kernel.org>
 <deedf5e2-4a25-4c1f-a5d8-a661a2eb16d2@arm.com>
 <Z-jzouwNZwk8Ft-j@kernel.org>
 <0aac96b5-b3ac-47ee-97af-7ca5d927bdd0@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aac96b5-b3ac-47ee-97af-7ca5d927bdd0@arm.com>

Hi Ryan,

On Tue, Apr 01, 2025 at 10:43:01AM +0100, Ryan Roberts wrote:
> On 30/03/2025 03:32, Mike Rapoport wrote:
> > On Sat, Mar 29, 2025 at 09:46:56AM +0000, Ryan Roberts wrote:
> >> On 28/03/2025 18:50, Mike Rapoport wrote:
> >>> On Fri, Mar 28, 2025 at 11:51:03AM +0530, Dev Jain wrote:
> >>>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> >>>
> >>>                                                      for vmalloc mappings ^
> >>>
> >>> arm64 does not allow changing permissions to any VA address right now.
> >>>
> >>>> which does not support changing permissions for leaf mappings. This function
> >>>> will change permissions until it encounters a leaf mapping, and will bail
> >>>> out. To avoid this partial change, explicitly disallow changing permissions
> >>>> for VM_ALLOW_HUGE_VMAP mappings.
> >>>>
> >>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>
> >> I wonder if we want a Fixes: tag here? It's certainly a *latent* bug.
> > 
> > We have only a few places that use vmalloc_huge() or VM_ALLOW_HUGE_VMAP and
> > if there was a code that plays permission games on these allocations, x86
> > set_memory would blow up immediately, so I don't think Fixes: is needed
> > here.
> 
> Hi Mike,
> 
> I think I may have misunderstood your comments when we spoke at LSF/MM the other
> day, as this statement seems to contradict. I thought you said that on x86 BPF
> allocates memory using vmalloc_huge()/VM_ALLOW_HUGE_VMAP and then it's
> sub-allocator will set_memory_*() on a sub-region of that allocation? (And we
> then agreed that it would be good for arm64 to eventually support this with BBML2).

I misremembered :)
They do allocate several PMD_SIZE chunks at once, but they don't use
vmalloc_huge(), so everything there is mapped with base pages.

And now they are using execmem rather than vmalloc directly, and execmem
doesn't use VM_ALLOW_HUGE_VMAP anywhere except modules on x86.
 
> Anyway, regardless, I think this change is useful first step to improving
> vmalloc as it makes us more defensive against any future attempt to change
> permissions on a huge allocation. In the long term I'd like to get to the point
> where arm64 (with BBML2) can map with VM_ALLOW_HUGE_VMAP by default.
> 
> Thanks,
> Ryan

-- 
Sincerely yours,
Mike.
