Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D5A24C084;
	Thu,  3 Apr 2025 13:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743688724; cv=none; b=cg8gQEJYrW0NnOBMgUUuojyDYS8Vm6pMKR8KhIRcwmmweyMKldLpafXct1bzSbwB2IN1Mpkue/cg5mZiMAt6zjSVEK/J+XjtYHup3d/Uzf2q/Khb5983rCwoGv1Nerj/DKQJPlIAHpXZHanIfLJlAzjifhY1LMpgInAm1fwFI2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743688724; c=relaxed/simple;
	bh=BrgR3NVGaMIq0cDdSFPpPKZhtRzYxdIHTZqfFmuVPko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ojVhhfoz/UJ5XTTJvTNrvZwNd4GBqdxuzZa+pco4cbqc4asB6IYQrk6wneFPgDwBvTAtsZ/4zrH9CMH4xE09FLgMDcDo5umGjQTUhnSUGqmQolXiMcyQSaNx/QxuJDyVUD0tj45G3ShSumUect3joSn6bM35Ywl0BAlzRwOcpHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umP7ldLW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umP7ldLW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F347C4CEE5;
	Thu,  3 Apr 2025 13:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743688723;
	bh=BrgR3NVGaMIq0cDdSFPpPKZhtRzYxdIHTZqfFmuVPko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=umP7ldLW1m+GF85JZqxyEuuOLUb1h9mCQmDzKwZnrLKraN0WoXYL/1EVjHchIjzNi
	 0EYgu0oTZkxDRRI0C/+454BgBCgu6Wp1xaBiO1psabHDO+DVSl06T+0+KmSX8LKwrR
	 jrvg7uZujTiRZGfAtk5Vp16S0TECDoHWQJdL+vdqSuKODi1li1JujZTSCkme3ilZ03
	 DJQwIa7PPVlTdeESBd9x+fbDtbMZE3vlRUKmeWFWG7cqIjFvPxdpQysNR3RcA1D55z
	 KBVyUhIHai5T1wt9w9qkpNFzkXFgek1AKaTqZ5Z16Z6W0LmZmj0YT1OK6FXYhjcHrd
	 tMFW218IYwAWQ==
Date: Thu, 3 Apr 2025 16:58:27 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z-6UA3C1TPeH_kGL@kernel.org>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403114209.GE342109@nvidia.com>

On Thu, Apr 03, 2025 at 08:42:09AM -0300, Jason Gunthorpe wrote:
> On Wed, Apr 02, 2025 at 07:16:27PM +0000, Pratyush Yadav wrote:
> > > +int kho_preserve_phys(phys_addr_t phys, size_t size)
> > > +{
> > > +	unsigned long pfn = PHYS_PFN(phys), end_pfn = PHYS_PFN(phys + size);
> > > +	unsigned int order = ilog2(end_pfn - pfn);
> > 
> > This caught my eye when playing around with the code. It does not put
> > any limit on the order, so it can exceed NR_PAGE_ORDERS. Also, when
> > initializing the page after KHO, we pass the order directly to
> > prep_compound_page() without sanity checking it. The next kernel might
> > not support all the orders the current one supports. Perhaps something
> > to fix?
> 
> IMHO we should delete the phys functions until we get a user of them

The only user of memory tracker in this series uses kho_preserve_phys()
 
> Jason

-- 
Sincerely yours,
Mike.
