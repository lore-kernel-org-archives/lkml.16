Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A5F24EA95
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743690315; cv=none; b=Uq7U+luK2nr5JDambkbobWOnmjlg6NlQsoztj9J/OyC2ByBFNedV8Fu1YnFrmUiPlxYJPhnw5KPz9OwToSqriY2fMrvYS964rpwiGfOzqCTHVGjd0M23djCqMOxPlEWT/W9ZXNvWFRpEtdHRhwKyFBB7h5ZUJwYXf+mIdRtM1uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743690315; c=relaxed/simple;
	bh=tkMdYu9t5824/EU4dyTb0cxwDhM/gxde1CbSplGldzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udacb6Q2U0N4kltAFGkgtLmTCG/AvI/AzQWtE37n0l2HV5sGGqGqB2/MzPmtM3Xx8cLZCVAWAdVvp0CdgSgvJ4jKFIq6y6DwlgVhHd77Qhkbqu6TbQu6Lh7+5dAsZ+9Z3Y9erN9WHHpGPifi4tux/rhdBSGmJB9FcRY04Op80vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ka40iZjP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ka40iZjP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908ADC4CEE3;
	Thu,  3 Apr 2025 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743690315;
	bh=tkMdYu9t5824/EU4dyTb0cxwDhM/gxde1CbSplGldzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ka40iZjPw89KP7aEPQCTzPyRorfgRmK7zTLjMQrT4UuOS8V2Bbk/H20fNhAlXnUvt
	 mOAyIGNrj/h0x0BxRGyLZ3CLoNKMQ4UKu2PcRBnC98hblDubLwHjV5NTv/ZiQ2xggF
	 bydhXqc2xYMsTTG5PBELGVSAomByAJbFYT1KsFupzIsBPw0MJ8YybS0T2xAOb2uYwU
	 LHnoy8zABqx9FxwcvkcCzb+aWKu4BWGaQuzCpzq3Z2lG5GToYbBTt41AAD8bOZfF50
	 Xjg49Bl0RfFtF77JKdgvgirBQlNJL/qgQFCxudletSKhQ+MJ76sO5fJBVD2pnuUgf1
	 SGTkEH3ZqJ1fg==
Date: Thu, 3 Apr 2025 17:25:06 +0300
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
Message-ID: <Z-6aQjOB_aU4CEAp@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-3-dwmw2@infradead.org>
 <Z-4phOInXZlxFwk9@kernel.org>
 <e465ba32fb34b31eddb18890587960671b73234f.camel@infradead.org>
 <380d9bff359150f67ca6e0468f99ee746c1abdea.camel@infradead.org>
 <Z-6XexJWecbxnrmK@kernel.org>
 <0d89238f3ad9444abfc905a79ff14388a61cf00d.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d89238f3ad9444abfc905a79ff14388a61cf00d.camel@infradead.org>

On Thu, Apr 03, 2025 at 03:17:44PM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 17:13 +0300, Mike Rapoport wrote:
> >  
> > > static inline bool first_valid_pfn(unsigned long *p_pfn)
> > > {
> > >  	unsigned long pfn = *p_pfn;
> > >  	unsigned long nr = pfn_to_section_nr(pfn);
> > >  	struct mem_section *ms;
> > > 
> > >  	rcu_read_lock_sched();
> > > 
> > >  	while (nr <= __highest_present_section_nr) {
> > >  		ms = __pfn_to_section(pfn);
> > 
> > Maybe move the declaration here:
> > 
> >  	struct mem_section *ms = __pfn_to_section(pfn);
> 
> Ack.
> 
> https://git.infradead.org/users/dwmw2/linux.git/shortlog/refs/heads/for_each_valid_pfn

Fine with me, keep the RB tag :)


-- 
Sincerely yours,
Mike.
