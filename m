Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7359E184F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195711; cv=none; b=FM8FPPLGZK0Y+/HNjMll2QvCgyTisaiRryBsyFr30EL4hlf0mRlaeJqqzR/fhkqw5ewnVTesTM4tdnZnPBIlzZQNlQyuHXhOOX1er26odcQu7K+GOx/nMu2LfMZ9gLctDDMDpwEhdZyuvjF0L4HcAIzXU9vFcDZFYojrf4l7C9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195711; c=relaxed/simple;
	bh=HKvlKvSt24CDqpSjG5iF1rL0NDXN34ff0tmWvXkw3oY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JriEYCNCWSjOcb+JGhTJ3bwg9r5cqZCkIT/IuKav7rgwhtmWS2fficMJalFzUg5sfg6ALI4Ffs+iwty1VqkFp7qXKedanvBCyIUGBe7wTw96b5dn+rWaS8K1nLVYQWQDoZlmio+5waKSDr7ZQVDFsBMPls67vy7+5Z9cc/U75j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=aoAWlHrv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="aoAWlHrv"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso3853456f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744195708; x=1744800508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zB6DOhsNP54p+LWQrH/LyPAGXFe/doVAQelM4hY0fbY=;
        b=aoAWlHrvHlZT2V0NRIre8kE0jGtl9G4ZyVoB4ii/tmn1NJIXcsOhM75U0rvWcBw27h
         NyHir7KsCNadNtE/9YSX6EJPT0xdXIcIzGs1kJDsCvMhFDk13VaiQC3v39RVyIj9fYU6
         goni4n2TfVULPjOwMbRmDKbySYEukKCs5tQxJfRdEGPtDdR4DS5+sx/hLX3IgT/HZA5d
         /0x72VvNZwiyKIT8vqJHgSYIfYqCR7XLY+4mC46dQJIjWosWGvGSZxZAnnv9O3UPuzsV
         bku//x9Z86kRBL7mRR/eZqlTK30+UMlhxaguzWz5uxDBwui+nlej5Sc0uAfcqWUmfcLT
         kgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195708; x=1744800508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zB6DOhsNP54p+LWQrH/LyPAGXFe/doVAQelM4hY0fbY=;
        b=VnsXk5XDja4zk96bccCIz1ds31VKsm08lheeKOHHq1+YWxQX15RlW1ar4ySy3loXkv
         6BNsgA0HcsYJMOHa1zzh7a320spwFpIzqrMoIvjjWcSAF0sWHBN6y+gThDg1sk/9wgFn
         WAI056pUh6eczWDbPqtb8TJ5K/T1soYqVgbvZXG8fwEshPZI5I6AD69xan/fdLrrUjJ/
         pZgeRMy4gEo5S72/UA98JeZ0C5FwPe4PRYH0sdiOBrA55xknPGf9mZnKoNrdE4XJiN6R
         b9gE2Y9jP8uRzEWwYmno9HucgG2V+hNnVo2d/dpWWkhHeo8rDW90IcJtXF0ECviaJO8O
         h25g==
X-Forwarded-Encrypted: i=1; AJvYcCWUpGYN4ui95uKmCgRM83o76h4SfMLStEXJhxMNPBUSYUdLHRkyYMrGy9UEE8zhIpUrsDoIoEt3NXOaoJ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZ/FHc9YQIUItBLMq+DnWB9nAIHxdZOl66XFeoe51eOUZf1x6
	qqUTgDFzd6KsdHZVyKevdVuMW2IO9MH2pevO/YMOWCeD4IvSiiVbWtu35sec8pU=
X-Gm-Gg: ASbGncsgkyo5ao2T6c6ZBqxNJRcpsSxDVHVVc4nM4wKMdVNnYW5mh2RHioeZM4z4ixn
	fT/hdTEbK27HhgQULa8ZIKf8D8RgPSccNhCkyvRXADIxrpdsfF9eDJoghv7mCAH+BMsVH1b8F7H
	+cnNYIY93p0/U2EZuOVxfG7/uM09hKM78uDFniT5BJTnjOk6UncK7UyXZXzKTfezBBlzE26qSWD
	WquKIko6/lZ+66OmwShZr1g/VeRDbjWGzBmOnPagmSFAR0Gh5RXOG32Ayye6VUFzWfrsKF+ebbK
	CAh/AY8tR33JrmehgosO0MeGHGxa
X-Google-Smtp-Source: AGHT+IGYvUOkSdoe9+ZVfiFebJdaAtnsamOW1nCOk2I6rvSJl8ZT6oEiqCQdu/VJ4IJELPU1LDC7wQ==
X-Received: by 2002:a05:6000:1849:b0:391:31f2:b998 with SMTP id ffacd0b85a97d-39d88522729mr1855776f8f.6.1744195707253;
        Wed, 09 Apr 2025 03:48:27 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893f0a80sm1289556f8f.68.2025.04.09.03.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:48:26 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:48:25 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, charlie@rivosinc.com
Subject: Re: [PATCH] riscv: module: Optimize PLT/GOT entry counting
Message-ID: <20250409-c5cdd1190c498e9b594cf7d7@orel>
References: <20250409024519.454828-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409024519.454828-1-samuel.holland@sifive.com>

On Tue, Apr 08, 2025 at 07:45:16PM -0700, Samuel Holland wrote:
> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
> inside module_frob_arch_sections(). This is because amdgpu.ko contains
> about 300000 relocations in its .rela.text section, and the algorithm in
> count_max_entries() takes quadratic time.
> 
> Apply two optimizations from the arm64 code, which together reduce the
> total execution time by 99.57%. First, sort the relocations so duplicate
> entries are adjacent. Second, reduce the number of relocations that must
> be sorted by filtering to only relocations that need PLT/GOT entries, as
> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
> optimizing PLT counting").
> 
> Unlike the arm64 code, here the filtering and sorting is done in a
> scratch buffer, because the HI20 relocation search optimization in
> apply_relocate_add() depends on the original order of the relocations.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/kernel/module-sections.c | 66 +++++++++++++++++++++++++----
>  1 file changed, 57 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
> index e264e59e596e..91d4f0fbd0af 100644
> --- a/arch/riscv/kernel/module-sections.c
> +++ b/arch/riscv/kernel/module-sections.c
> @@ -9,6 +9,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/moduleloader.h>
> +#include <linux/sort.h>
>  
>  unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
>  {
> @@ -55,19 +56,27 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
>  	return (unsigned long)&plt[i];
>  }
>  
> -static int is_rela_equal(const Elf_Rela *x, const Elf_Rela *y)
> +#define cmp_3way(a, b)	((a) < (b) ? -1 : (a) > (b))
> +
> +static int cmp_rela(const void *a, const void *b)
>  {
> -	return x->r_info == y->r_info && x->r_addend == y->r_addend;
> +	const Elf_Rela *x = a, *y = b;
> +	int i;
> +
> +	/* sort by type, symbol index and addend */
> +	i = cmp_3way(x->r_info, y->r_info);
> +	if (i == 0)
> +		i = cmp_3way(x->r_addend, y->r_addend);
> +	return i;
>  }
>  
>  static bool duplicate_rela(const Elf_Rela *rela, int idx)
>  {
> -	int i;
> -	for (i = 0; i < idx; i++) {
> -		if (is_rela_equal(&rela[i], &rela[idx]))
> -			return true;
> -	}
> -	return false;
> +	/*
> +	 * Entries are sorted by type, symbol index and addend. That means
> +	 * that, if a duplicate entry exists, it must be in the preceding slot.
> +	 */
> +	return idx > 0 && cmp_rela(rela + idx, rela + idx - 1) == 0;
>  }
>  
>  static void count_max_entries(Elf_Rela *relas, int num,
> @@ -87,11 +96,33 @@ static void count_max_entries(Elf_Rela *relas, int num,
>  	}
>  }
>  
> +static bool rela_needs_plt_got(const Elf_Rela *rela)
> +{
> +	unsigned int type = ELF_R_TYPE(rela->r_info);
> +
> +	return type == R_RISCV_CALL_PLT || type == R_RISCV_GOT_HI20;

I see these two are sufficient to support count_max_entries(), but Charlie
also added support for R_RISCV_PLT32. I don't know enough about relocation
types to know if we need to consider that one here and in
count_max_entries(), so I'm just pointing it out in case it was
overlooked.

> +}
> +
> +/* Copy PLT and GOT relas to the scratch array. */
> +static unsigned int partition_plt_got_relas(const Elf_Rela *relas, Elf_Rela *scratch,
> +					    unsigned int num_rela)
> +{
> +	int j = 0;
> +
> +	for (int i = 0; i < num_rela; i++)
> +		if (rela_needs_plt_got(&relas[i]))
> +			scratch[j++] = relas[i];
> +
> +	return j;
> +}
> +
>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  			      char *secstrings, struct module *mod)
>  {
>  	unsigned int num_plts = 0;
>  	unsigned int num_gots = 0;
> +	Elf_Rela *scratch = NULL;
> +	size_t scratch_size = 0;
>  	int i;
>  
>  	/*
> @@ -132,9 +163,26 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
>  			continue;
>  
> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
> +		/*
> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
> +		 * close together, so sort a copy of the section to avoid interfering.
> +		 */
> +		if (sechdrs[i].sh_size > scratch_size) {
> +			scratch_size = sechdrs[i].sh_size;
> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
> +			if (!scratch)
> +				return -ENOMEM;
> +		}
> +
> +		/* sort relocations requiring a PLT or GOT entry so duplicates are adjacent */
> +		num_rela = partition_plt_got_relas(relas, scratch, num_rela);
> +		sort(scratch, num_rela, sizeof(Elf_Rela), cmp_rela, NULL);
> +		count_max_entries(scratch, num_rela, &num_plts, &num_gots);
>  	}
>  
> +	if (scratch)
> +		kvfree(scratch);
> +
>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
>  	mod->arch.plt.shdr->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
>  	mod->arch.plt.shdr->sh_addralign = L1_CACHE_BYTES;
> -- 
> 2.47.0
>

Besides my question above,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew
