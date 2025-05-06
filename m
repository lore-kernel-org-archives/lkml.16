Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C64A2222D5
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551295; cv=none; b=eq/g81R47G7k3je3kD2K7FVc9X/luBB2OoKOep/ayeZTGcFc0T35sXN1m979BTQ9LR0v3CteRlFvQ620kS41xuDJZini5vorwhCvp3yPehs+0gZWTG0A26Adjw00the8EMyvHLa1BsxsahiYxF6crF3be5VSeWzjfzxEIUVQrEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551295; c=relaxed/simple;
	bh=5a+NpW5EBvacYYEjC4z+i6BbI8MSgu3EMw3HL+W23j8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSt/v4pH2RUFwfTCzvvn0rOY46IXKdorFLBZ5oINQOd/XFHzbBRDvIn4x9bm9Ein4TV/VTpLPoulVCDJlD3VC0qJFccLu3CO33yMFWLnHcZydKlVfueUgk8VDnTalBlSik/93HkYlqL9MwYDKAJYgfUJBW65KMNBU1MYkBQxtE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jwmuFDv+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jwmuFDv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5ECC4CEE4;
	Tue,  6 May 2025 17:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551294;
	bh=5a+NpW5EBvacYYEjC4z+i6BbI8MSgu3EMw3HL+W23j8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jwmuFDv+uytVPaYTLZZwpVbjtwpFQdYXjHipyF5JgfOvnIBi6qUeStxJ4ntiZsufw
	 zSFkTKZ49h3zKUWTvMBgh41i5cP1+wNVUR6KWR5lvl66pqjFk+9vnBqQIEKzw7iiDf
	 SpGt856oxpopvg2EoOujCRUX5SEkuXAPrKLU4bQd0U0KD+FbXZdQXONmv8wN01Swt8
	 J15BRrwReYMhVZG2C8ppV9iU1Mx3uFGOMfgZlCcPI7BWUPqLnHyIRbJbfYb7r13cjR
	 JZkdzFtGuNn3jSOGYDpnejuU2y2YQ+zuV8sAnwFFDP+my6EpokXscGj2uwooUdKLW8
	 0eUnAxOv27gSA==
Date: Tue, 6 May 2025 20:08:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm,mm_init: Mark set_high_memory as _init
Message-ID: <aBpB-dtL1hvd0TDi@kernel.org>
References: <20250506111012.108743-1-osalvador@suse.de>
 <aBnuzKw-zYDPwLE3@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBnuzKw-zYDPwLE3@localhost.localdomain>

On Tue, May 06, 2025 at 01:13:16PM +0200, Oscar Salvador wrote:
> On Tue, May 06, 2025 at 01:10:12PM +0200, Oscar Salvador wrote:
> > set_high_memory() touches arch_zone_lowest_possible_pfn which is
> > marked as _initdata, which creates a section mismatch.
> > Since the only user of the function is free_area_init() which is also marked
> > as _init, mark set_high_memory() as _init as well.
> > 
> > Signed-off-by: Oscar Salvador <osalvador@suse.de>
> 
> Of course, the second after I pressed intro I realized I missed:
> 
>  Reported-by: kernel test robot <lkp@intel.com>
>  Closes: https://lore.kernel.org/oe-kbuild-all/202505060901.Qcs06UoB-lkp@intel.com/
> 
> @Andrew: Any chance you could squeeze those? Or should I send v2?

I'll pick this one and add the tags, thanks Oscar.
 
> Thanks
> 
> 
> -- 
> Oscar Salvador
> SUSE Labs

-- 
Sincerely yours,
Mike.
