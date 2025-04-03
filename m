Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0587F7FC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689603; cv=none; b=nOE5E8CL9WxW96XTTvSP6NIrtafwu2AI0Ee1zrGnWL4CuCnh1c92+JihLyn4oOmaflH8OnlIx5fLass73bQfAqdSa9enMNzHqfImVSktJCIyfb+WZHYHh+u2T5RMaJmi8TUJ4Y2LEDivbp58A/DpE2nmar1Q3nf0eCY+57BZX3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689603; c=relaxed/simple;
	bh=/vMOGYJHU3N99XcnouH6J7FcQMuSYe+/VfJBY8ovNzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMPttwzPrADZhePrKob1BXqVS33uh85B2qNtCesLupEOY/mV8ueJhjZjBZoOR1iubM4mfIDTgXeQjlID2C5ewsneRunE3vQqqg2rKsFNQK+aviDqntVoS3vLrzMoTz9rdDFmQFrN8Cqfr1CEFgp4EzVg0Et5dGaiVGUbUkCpuvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+p6CC+g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+p6CC+g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035D5C4CEE3;
	Thu,  3 Apr 2025 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743689603;
	bh=/vMOGYJHU3N99XcnouH6J7FcQMuSYe+/VfJBY8ovNzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+p6CC+gU0sA+GjrzK/KJv1pZ28LBj4hRjALrTyZbw16A9CGhfbMug7igY/rxzRQV
	 /UxPjojecDRtbWVa9Efjv/g53zKGzhNpDUKjjGnQASZSdl7kOxE8igx9mw2rZF9xGn
	 qOC3O+xLy7oMbLEd3bipPxt20w0LqK1DDp+tYASP14qVXo5x/dWpWB5Z+bObiOn5fJ
	 fhiDEWaGO7x88pGpdoPwWpg6g2Ayo9E+Ul12jTcJlwZ+wKu18rNwiZqAegeBqgbejr
	 OHS+kVO31Da0hKq1Q5oHfiw3AB6ttxEo+CXVCUvqa6mJyNYZpEhPpu19QyH+CxDtTl
	 BYxMrp7QrYYXw==
Date: Thu, 3 Apr 2025 17:13:15 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/3] mm: Implement for_each_valid_pfn() for
 CONFIG_SPARSEMEM
Message-ID: <Z-6XexJWecbxnrmK@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-3-dwmw2@infradead.org>
 <Z-4phOInXZlxFwk9@kernel.org>
 <e465ba32fb34b31eddb18890587960671b73234f.camel@infradead.org>
 <380d9bff359150f67ca6e0468f99ee746c1abdea.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <380d9bff359150f67ca6e0468f99ee746c1abdea.camel@infradead.org>

On Thu, Apr 03, 2025 at 08:15:41AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 08:07 +0100, David Woodhouse wrote:
> > 
> > I'll see if I can make it neater. I may drop the 'ret' variable
> > completely and just turn the match clause into unlock-and-return-true.
> > I *like* having a single unlock site. But I think I like simpler loop
> > code more than that.
> 
> That's better (IMO).
> 
> And I note that pfn_valid() already doesn't follow the modern fetish
> for having only one unlock site even when it makes the surrounding code
> more complex to do so.
> 
> static inline bool first_valid_pfn(unsigned long *p_pfn)
> {
> 	unsigned long pfn = *p_pfn;
> 	unsigned long nr = pfn_to_section_nr(pfn);
> 	struct mem_section *ms;
> 
> 	rcu_read_lock_sched();
> 
> 	while (nr <= __highest_present_section_nr) {
> 		ms = __pfn_to_section(pfn);

Maybe move the declaration here:

 	struct mem_section *ms = __pfn_to_section(pfn);

> 
> 		if (valid_section(ms) &&
> 		    (early_section(ms) || pfn_section_first_valid(ms, &pfn))) {
> 			*p_pfn = pfn;
> 			rcu_read_unlock_sched();
> 			return true;
> 		}
> 
> 		/* Nothing left in this section? Skip to next section */
> 		nr++;
> 		pfn = section_nr_to_pfn(nr);
> 	}
> 
> 	rcu_read_unlock_sched();
> 
> 	return false;
> }

-- 
Sincerely yours,
Mike.
