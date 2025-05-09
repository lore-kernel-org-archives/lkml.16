Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCF323643F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807478; cv=none; b=Au/VrnCjQVocJAyKKNvsJdkfLewWFq12ZPMVJZz+tNEJBJoo+mdBnboAs9xt+BIPyu8gN8U4KWDdyhwu8O2NOEUyzcJUFD6aHFpufJZXixpXvn2leCrhwEkyNZ+rrgrPmEQzz33l4VNqHEixPLa78E47t0mXZ0Xtu6Ofo/SZ30c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807478; c=relaxed/simple;
	bh=I3FQcqDoCcpXNgtGOu4TBQ/5BVpCPFEoDvuQhwL0NDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrbLcVvLa/gutabmIZ75lWBZXeRmrlug+Cgk4QfFRrqadSPLxu0e+A6HAuMpFK1ljkwWWIyFiJodpLezA4/aaCXjM2hk4/lgK9wmLpYHzhYl7meL44f2JT9XDoPalBksa7O3sTUXYjqvHG5LkcIeeLXrAz3AYRITWVJ8DXnFnR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9rRNZer; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9rRNZer"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F54DC4CEE4;
	Fri,  9 May 2025 16:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746807477;
	bh=I3FQcqDoCcpXNgtGOu4TBQ/5BVpCPFEoDvuQhwL0NDs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9rRNZer0SZ+VWi+gr0xN3LRWYR2kjlWR1u9/4YK0RrX7WUQDbJhT2n/qaqIh79Ku
	 RjihsxPY0QdwxJ2YBBuLHPG5/m+lCoVbYftUuepvtBiqwyIl/pzrneTUctRyzqRjzm
	 WGsvKG3sqQtRJWjjOow/hmD4Ntcg2wYQ0dARt2L5SkogglhlcvP7olsJ8HmwY2w7UY
	 wz2+35trVXZBWP+vzzt7KlcWuVlClUCSeRJK59ABcaf/MaTXKFny7VuvcCgBbRFTHe
	 gHLgWAp9ntjyy8YCkTYsVz167rOvA5a7LNZg2yAICN0oicojc93M/w04s+IIsJ7soB
	 RydBOJdVyfmQw==
Date: Fri, 9 May 2025 17:17:53 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ada.coupriediaz@arm.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64/debug: Drop redundant DBG_MDSCR_* macros
Message-ID: <20250509161752.GC5984@willie-the-truck>
References: <20250508044752.234543-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508044752.234543-1-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, May 08, 2025 at 10:17:52AM +0530, Anshuman Khandual wrote:
> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
> macros become redundant and hence can be dropped off completely. While here
> convert all variables handling MDSCR_EL1 register as u64 which reflects its
> true width as well.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.15-rc5
> 
> Changes in V2:
> 
> - Changed reg, val width to u64 in cortex_a76_erratum_1463225_svc_handler() per Ada
> - Changed mdscr register width to uint64_t in enable_monitor_debug_exceptions() and
>   install_ss() per Ada
>     
> Changes in V1:
> 
> https://lore.kernel.org/all/20250417105253.3188976-1-anshuman.khandual@arm.com/
> 
>  arch/arm64/include/asm/assembler.h            |  4 ++--
>  arch/arm64/include/asm/debug-monitors.h       |  6 -----
>  arch/arm64/kernel/debug-monitors.c            | 22 +++++++++----------
>  arch/arm64/kernel/entry-common.c              |  4 ++--
>  .../selftests/kvm/arm64/debug-exceptions.c    |  4 ++--
>  5 files changed, 17 insertions(+), 23 deletions(-)

Can you post the selftest change as a separate patch, please?

Will
