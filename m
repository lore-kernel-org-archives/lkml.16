Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACAACA5A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745797030; cv=none; b=CWIqceeKjzsdu9JjWj0SFpxxzAbslYnp3l86CK2kPsN7QAPNelpmv7PAIR1f/IPokHmY8PqOwb+3fIYjm90WyUR8hDdgi5LrCi5RMiM1FAgZunzIfyB2xvQkxqpc3joJGjZTNiw7jy+zh7O89i8azHGJU0ysJ7mAQw5dBwF8o3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745797030; c=relaxed/simple;
	bh=qtRjSKLfiQMiS15ic3ebxNl4OsQFpBgv0v/cD3OGpQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InaKDiEl2x1Jxx53IHzH00Fn+u20ewNfs2onkEuwRZMhiS5dgq37O4aw+lEzScZRzYQLUJHc9XzCg3AucpR8V69kZewjTJvqyV3GO9+DW8V8FrgmQK0CZ1KOab+4iEjZjDkwXrxjEo2/5M4jI8FMEI5oYaaBdAzOjgbG+GyWNAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2416C4CEE3;
	Sun, 27 Apr 2025 23:37:08 +0000 (UTC)
Message-ID: <ac188e54-7f23-4ecd-805c-c0437a53247a@linux-m68k.org>
Date: Mon, 28 Apr 2025 09:37:04 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Daniel Palmer <daniel@0x0f.com>, geert@linux-m68k.org,
 linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
References: <20250416114240.2929832-1-daniel@0x0f.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250416114240.2929832-1-daniel@0x0f.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 16/4/25 21:42, Daniel Palmer wrote:
> Allow the experimental dead code elimination config to be enabled.
> 
> For my 68000 nommu config this frees up a few hundred K of memory
> so seems worth while.
> 
> Boot and build tested on nommu and mmu enabled configs.
> 
> Before:
> Memory: 5388K/8192K available (1986K kernel code, 114K rwdata,
> 244K rodata, 92K init, 41K bss, 2624K reserved, 0K cma-reserved)
> 
> After
> Memory: 5684K/8192K available (1714K kernel code, 112K rwdata,
> 228K rodata, 92K init, 37K bss, 2328K reserved, 0K cma-reserved)
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

Nice. It worked fine on ColdFire builds as well (both nommu and mmu).

Acked-by: Greg Ungerer <gerg@linux-m68k.org>

I notice that some other architectures (arm and powerpc) have version
checks on gcc or ld in the config. Do you know if there is any version
limitations for m68k here?

Regards
Greg



> ---
>   arch/m68k/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index eb5bb6d36899..11835eb59d94 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -32,6 +32,7 @@ config M68K
>   	select HAVE_ASM_MODVERSIONS
>   	select HAVE_DEBUG_BUGVERBOSE
>   	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED
> +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>   	select HAVE_MOD_ARCH_SPECIFIC
>   	select HAVE_UID16
>   	select MMU_GATHER_NO_RANGE if MMU

