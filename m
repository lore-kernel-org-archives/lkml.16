Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D847223DD3
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292223; cv=none; b=JItArf2mDehI5plPRM3+0YVFYrPJxd06cBfcGWFyzgpuJpB8ncmtG4Jnr0fYCmaTwUJ7VlmLFg+kl1g/Rkysn9m47kJN+tVe0CbcmOXPj5Ug57XOl54J4nqzKbhoBmHxZ52palnYYORKCU/rN9ckSyimZsSE9jkFU9Hjrf1GzCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292223; c=relaxed/simple;
	bh=Qll8diZjQKEQnp7Bq5ZY7hVG43EA47fwhWoEUnz+qdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMkeYLSHGC+kwWS1dE7vF6XAWpFstS2Z8eC0WrCK13RVGvHO+AEe9gm3BhPBYpVoT4nTiN+gC5U1VpBESc2QY3df9gR7kuN9mdvqKRS+ZiLaKI48IQ3QQ0ymKBpwsoE1ncIq4X1u9kqkId0M7rbHdsRQpobFQtPiXVSWcDUuOo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYSAb5vA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYSAb5vA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82458C4CEED;
	Thu, 15 May 2025 06:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747292223;
	bh=Qll8diZjQKEQnp7Bq5ZY7hVG43EA47fwhWoEUnz+qdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sYSAb5vAzX3axD7HE+9pbRSZ4A0EklXtGTobFtDq2CMyLbpTNJd+evhktGfHRO3uH
	 0DlPKGiAFxE9GHsPvhBjiyUIcPKn5BbX9x1HURAtwv8yR7ubO+80OyQ8d1uoJyjS2B
	 NteJcptc+sa+4aE3SZs37hS9FieA0B8FtaeUcsQ4e3fT8DzZmZBAGY6NCYO6o9KQqk
	 yxMHZT1XU4OCQiCOyUJRoDjLkKSGNjQ9LbMXe0FrTFPuZ+yyqQy32SCEaUf5pVnoN5
	 UuwV+nsJguRVVHEz9ggR3m8LUx9e34aFE9k9GyR+KVM3hjo8wCWZkLqLYLarZLbT0z
	 0oeeSyh4AF+GQ==
Date: Thu, 15 May 2025 08:56:59 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v3 2/7] x86/cpu: Allow caps to be set arbitrarily early
Message-ID: <aCWQOzCla7i__iEl@gmail.com>
References: <20250514104242.1275040-9-ardb+git@google.com>
 <20250514104242.1275040-11-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514104242.1275040-11-ardb+git@google.com>


* Ard Biesheuvel <ardb+git@google.com> wrote:

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> cpu_feature_enabled() uses a ternary alternative, where the late variant
> is based on code patching and the early variant accesses the capability
> field in boot_cpu_data directly.
> 
> This allows cpu_feature_enabled() to be called quite early, but it still
> requires that the CPU feature detection code runs before being able to
> rely on the return value of cpu_feature_enabled().
> 
> This is a problem for the implementation of pgtable_l5_enabled(), which
> is based on cpu_feature_enabled(X86_FEATURE_5LEVEL_PAGING), and may be
> called extremely early. Currently, there is a hacky workaround where
> some source files that may execute before (but also after) CPU feature
> detection have a different version of pgtable_l5_enabled(), based on the
> USE_EARLY_PGTABLE_L5 preprocessor macro.
> 
> Instead, let's make it possible to set CPU feature arbitrarily early, so
> that the X86_FEATURE_5LEVEL_PAGING capability can be set before even
> entering C code.
> 
> This involves relying on static initialization of boot_cpu_data and the
> cpu_caps_set/cpu_caps_cleared arrays, so they all need to reside in
> .data. This ensures that they won't be cleared along with the rest of
> BSS.
> 
> Note that forcing a capability involves setting it in both
> boot_cpu_data.x86_capability[] and cpu_caps_set[].
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/kernel/cpu/common.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 6f7827015834..f6f206743d6a 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
>  }
>  
>  /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
> -__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> -__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> +__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
> +__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));

This change is not mentioned in the changelog AFAICS, but it should be 
in a separate patch anyway.

Thanks,

	Ingo
