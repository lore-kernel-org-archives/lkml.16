Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A5A288CA5;
	Mon, 16 Jun 2025 17:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750096231; cv=none; b=f0Veu7K5ZinQ4e4+emC6+e9s6L6oGlsySOkPkVFsvcmUcQqALPBnSnjRaNVLZNHy01PJZB3zDkRXpysF+ucrnpRcFpH0slASfECNKBV9m1Nq6sUnuv5fY5jQmEStuQ8026jYM1XT7X8Mj2clHQ3e1YReQXFTKyChagDwLNcKt3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750096231; c=relaxed/simple;
	bh=ZH0omtETsKuyn5ulbuxDWU51+MWKmkLDhZHvmjw4mmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gt9t33xnhK+XWxpXTdpVRuBGgErC59pAbzlWu14OzTzQiAZOteAdm+oZpn7kM1iUe39aAar3wMQUCkqMv+1bmQUYaz/zqqZlTo2GQYQWM/6xrm9Ejj0UqQcT3O7SOY7R5jaeNGRdD9aT5VAAlzNi4SuQi93x/gCu8J9DlgABmew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xlan4KEP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xlan4KEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7A4C4CEEE;
	Mon, 16 Jun 2025 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750096231;
	bh=ZH0omtETsKuyn5ulbuxDWU51+MWKmkLDhZHvmjw4mmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xlan4KEPrx+MN4NwKxLS3+Zn0vkWvwMZxmQJ7WtxiManS0nrIrk0i5WG0WYjuq2A2
	 e5SW4jw5CZm34+NYrNaZHIlklOvUvvQx90t8ViXUaNxSqnC4AzPaceD4d8gZdtluvK
	 VoawFm1/X+RVed3rERc8e/gFrDDvwvXC165XhKCYv7QDq/V3oJV0xVkHYjyasCP1lX
	 0KEcaenhxBgeFOw8jn52Z65S/LLfMcIgvMlqOWE4uVOnN8LAgZowhwtOz0cPEjge8m
	 30zAm1VdI6S+FRWadr5PY1vMNifST5ry3NGbZ/PTMXzKlzTs4nV9cKVZnphzj6Qzpc
	 ndriVVnA8sMMQ==
Date: Mon, 16 Jun 2025 10:50:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>
Subject: Re: ld.lld: error: Cannot export BSS symbol __inittext_end to
 startup code
Message-ID: <20250616175026.GA1187576@ax162>
References: <202506150602.qswx7ZzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506150602.qswx7ZzQ-lkp@intel.com>

On Sun, Jun 15, 2025 at 06:13:33AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   8c6bc74c7f8910ed4c969ccec52e98716f98700a
> commit: dc0a083948040ff364d065da8bb50c29f77a39ad arm64: Work around convergence issue with LLD linker
> date:   12 days ago
> config: arm64-randconfig-004-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150602.qswx7ZzQ-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150602.qswx7ZzQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506150602.qswx7ZzQ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: Cannot export BSS symbol id_aa64isar1_override to startup code
> >> ld.lld: error: Cannot export BSS symbol id_aa64isar2_override to startup code
> >> ld.lld: error: Cannot export BSS symbol id_aa64mmfr0_override to startup code
> >> ld.lld: error: Cannot export BSS symbol id_aa64mmfr1_override to startup code
> >> ld.lld: error: Cannot export BSS symbol id_aa64mmfr2_override to startup code
> >> ld.lld: error: Cannot export BSS symbol id_aa64pfr0_override to startup code
> >> ld.lld: error: Cannot export BSS symbol id_aa64pfr1_override to startup code
> >> ld.lld: error: Cannot export BSS symbol id_aa64smfr0_override to startup code
> >> ld.lld: error: Cannot export BSS symbol id_aa64zfr0_override to startup code
> >> ld.lld: error: Cannot export BSS symbol arm64_sw_feature_override to startup code
> >> ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
> >> ld.lld: error: Cannot export BSS symbol _ctype to startup code
> >> ld.lld: error: Cannot export BSS symbol swapper_pg_dir to startup code
> >> ld.lld: error: Cannot export BSS symbol _etext to startup code
> >> ld.lld: error: Cannot export BSS symbol __start_rodata to startup code
> >> ld.lld: error: Cannot export BSS symbol __inittext_begin to startup code
> >> ld.lld: error: Cannot export BSS symbol __inittext_end to startup code
> >> ld.lld: error: Cannot export BSS symbol __initdata_begin to startup code
> >> ld.lld: error: Cannot export BSS symbol __initdata_end to startup code
> >> ld.lld: error: Cannot export BSS symbol _data to startup code

This version of ld.lld is from early April, which does not contain
Fangrui's fix [1], so this is expected given the stubbing out of ASSERT
that Ard did in commit e21560b7d33c ("arm64: Disable LLD linker
ASSERT()s for the time being") does not happen due to the version.
Please upgrade to a newer version of LLVM main to avoid triggering this,
I can confirm that I do not see an error with a current version.

[1]: https://github.com/llvm/llvm-project/commit/5859863bab7f

Cheers,
Nathan
