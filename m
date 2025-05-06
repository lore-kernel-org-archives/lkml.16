Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370E04B1E64;
	Tue,  6 May 2025 08:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520703; cv=none; b=LK4eX/maofnzM08fWOHhpf7PhpMnuyaP6pEYbLN4EIPNNX/YWr0NLtWVuT8rElYfeASi2MX6udVDxkd9ZqAjc2fnkYJviaq4/NXZBpOTVMv/xYy1bYTmWvcb1QMRbFKML617yyZi9m0GSQ4MweWkUzpdXWRpdY+b+CAlcHrv76I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520703; c=relaxed/simple;
	bh=HCBVYf2JMJWR3GoHejTM7OGYZaXCmQYccfV/iaPHr1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFQq5ujFeS3DVzkj8d5KR8/+X7RMvqV8s4jGWdBsymU92uttrwNie/CU7zUrxN54FRZISiqgMVksFYzFEnxNMwRLvr8ARK3ldSoYbnD8I/Fk0xAZnaAuknlkRCR2jnS/HIJpOfy37mXqoDuavyZssV7nfMetd9KYgjqZKL6N/uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiGPFrRQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiGPFrRQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0C6C4CEE4;
	Tue,  6 May 2025 08:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746520702;
	bh=HCBVYf2JMJWR3GoHejTM7OGYZaXCmQYccfV/iaPHr1k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiGPFrRQDHJXvCLQr4uYQNho+SZ+sUk9+jDsnXfAnjQaV7BAArJpXZi5l+xILIGdV
	 WszqdUWNxudwsRinCGRQHdD3TaiW7t/lU6Iz+q6dBruuWyjDbN1tJdv+nWx+ot1hCN
	 U0IjowaKQWBvJZha6wBTTlGqWC2PZZ2Jh2VAbZ5iWIupIpt5JWvAWH5dXR4AzuWuAa
	 Gk61C+7e0NEk4RT3jw71qkYeFRMiECd45B1jBsZKTp2tFp5OiD4b4nurHd1KAHHsWj
	 VTTHnapjMomhthZV0a6xnJS/rhz2pLLVrZ9i4G6phXRAJV+xLnL1BzUG/5EA33I/wK
	 cGWyhu8ZC6R7Q==
Date: Tue, 6 May 2025 11:38:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Oscar Salvador <osalvador@suse.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: WARNING: modpost: vmlinux: section mismatch in reference:
 set_high_memory+0x8c (section: .text.unlikely) -> zone_movable_pfn (section:
 .init.data)
Message-ID: <aBnKeD-KxlPoAJWM@kernel.org>
References: <202505060901.Qcs06UoB-lkp@intel.com>
 <aBm6RKy_AO5iISh1@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBm6RKy_AO5iISh1@localhost.localdomain>

On Tue, May 06, 2025 at 09:29:08AM +0200, Oscar Salvador wrote:
> On Tue, May 06, 2025 at 09:42:54AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   01f95500a162fca88cefab9ed64ceded5afabc12
> > commit: e120d1bc12da5c1bb871c346f741296610fd6fcb arch, mm: set high_memory in free_area_init()
> > date:   7 weeks ago
> > config: arm-randconfig-r062-20250506 (https://download.01.org/0day-ci/archive/20250506/202505060901.Qcs06UoB-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505060901.Qcs06UoB-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202505060901.Qcs06UoB-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > >> WARNING: modpost: vmlinux: section mismatch in reference: set_high_memory+0x8c (section: .text.unlikely) -> zone_movable_pfn (section: .init.data)
> 
> Perhaps?

Looks right, thanks for a quick fix!
Care sending a formal patch?
 
>  diff --git a/mm/mm_init.c b/mm/mm_init.c
>  index 80a5370ac6ab..5efec0399e18 100644
>  --- a/mm/mm_init.c
>  +++ b/mm/mm_init.c
>  @@ -1785,7 +1785,7 @@ static bool arch_has_descending_max_zone_pfns(void)
>   	return IS_ENABLED(CONFIG_ARC) && !IS_ENABLED(CONFIG_ARC_HAS_PAE40);
>   }
>  
>  -static void set_high_memory(void)
>  +static void __init set_high_memory(void)
>   {
>   	phys_addr_t highmem = memblock_end_of_DRAM();
> 
> 
> -- 
> Oscar Salvador
> SUSE Labs
> 

-- 
Sincerely yours,
Mike.
