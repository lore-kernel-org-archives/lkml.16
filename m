Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837912701D0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406864; cv=none; b=DVFooxGrlsrbu9fJwOg7kfRBWE+2Lm3QhpEeAeSArOc1pFKCYRP9g48TEofcesUG12SHyM0JZgmeY1IN53Dq+MR6KVB4260tf/YbMr29WBaJEYHH/M7BcxYhFKz/NLlEooljjXeH/dpNrwNX9I3CGxTKtbV3LNmRBWZ88E+S05g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406864; c=relaxed/simple;
	bh=OXIT2Mkp/X1FfEchdqAzjOM5PYg0vflOSJBG7v9Aedw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIsF9jm3stKVoW5tKMUOW3VT+ZxfWgTsgA1zyiL93Za1lXUb4c/zZnaDADMweQEvWWXTSCiCG884QTAR672yK8UfxWXfvOrHFG0Lvjmr/Irex90kdb4jr90TRQg6aHj1mq02zkoKtHOtZRJwdYAtbJCm2/7kl/ZC1tDEhj/V8vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQ5nyM23; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQ5nyM23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3D1C4CEEB;
	Wed, 23 Apr 2025 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745406864;
	bh=OXIT2Mkp/X1FfEchdqAzjOM5PYg0vflOSJBG7v9Aedw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQ5nyM23wz9ka7GGbET2QYg8DsE98EZupnkR/JcsxsgSQazsyxKH8ikhqvsaIHste
	 O0Py5pCACuZp+UTH9JTXs4gmWeSyncmjD9VXWVHM5AClBTcCTQ9OP0M8w2xr0TDjOU
	 LCnMBd/4GcmXm+g7k9JTR2NrOQ/W9lAiX6hdPi4WHfrRds1oA4f9PqvShPiIRY7Lc8
	 AknZKbth2cHCDBzYAxZHhCpZvPTzicdQZhYvCOOwvayh8pSmj756RIs8I3HzzN7qFo
	 v+V763+IrJMEvGePqKJ0Ize7tYzouTcooirZSmUU+x2cbGLR1qqTr3MJeBNN3fb4nQ
	 p3XqyRWHL3yBw==
Date: Wed, 23 Apr 2025 14:14:15 +0300
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
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Ruihan Li <lrh2000@pku.edu.cn>
Subject: Re: [PATCH v3 7/7] mm/mm_init: Use for_each_valid_pfn() in
 init_unavailable_range()
Message-ID: <aAjLhzrW3KsThGwF@kernel.org>
References: <20250423081828.608422-1-dwmw2@infradead.org>
 <20250423081828.608422-8-dwmw2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423081828.608422-8-dwmw2@infradead.org>

On Wed, Apr 23, 2025 at 08:52:49AM +0100, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Currently, memmap_init initializes pfn_hole with 0 instead of
> ARCH_PFN_OFFSET. Then init_unavailable_range will start iterating each
> page from the page at address zero to the first available page, but it
> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
> won't pass.
> 
> If ARCH_PFN_OFFSET is very large (e.g., something like 2^64-2GiB if the
> kernel is used as a library and loaded at a very high address), the
> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
> long time, and the kernel will look stuck at boot time.
> 
> Use for_each_valid_pfn() to skip the pointless iterations.
> 
> Reported-by: Ruihan Li <lrh2000@pku.edu.cn>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  mm/mm_init.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 

-- 
Sincerely yours,
Mike.
