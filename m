Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB4E278177
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744225628; cv=none; b=tsP/MaMQcMxPmBPRkOuJDIk9VfHfVjAD+MGDEbkHhCmWDlhYSx61Nj8yAdOuiYD6/61jcvNNsAmKwUILaI0wDnpyoCi5InC5xRf9jvS6sFTGWDr4TK41f38SeeyxTKOmvQ8XUB82nSxZldcBH7KjZ1IE+6pRTDzkQdJpXV3SBDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744225628; c=relaxed/simple;
	bh=MbzWTXW5L7DFIiFhxP4aesccCXvPbYgV4IJeoiJbcaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmL6Y5hghpJFTV/z16Vq/lUAbN0HnH71D/yl5PEkVaKdeNfjRQb8WoGft7pj9hWSQr3KGjK08G6lgfRIz16w+0LbJkNhzxWS+cUy0kC2Dt50cQVmrZ95s3XSoveiWs+z3oc4LN+kU1KlEsi4XPawLaxIJz9DSgX6qG0bi9KeanY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Tis/M4lt; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Tis/M4lt"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso4288592f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744225625; x=1744830425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BDpH5Cg2hroK2o4IDN554HJ3Fr5FbZsmDQ5bD2HXl6Y=;
        b=Tis/M4ltCBkSDb7/lsw7F9nnWh/glF9tg3kc3b/0HRBLuRY0qPmaWW/fjKcf8TIlQH
         L6ct18r+6bDgXY0XYXQwJ9EfMP6BVsc5UMzWQwI7xg+Gp+XiJN4XL/r6BHvj6C5sKWja
         JOjwL6aN0I9rePWe1cwmvPihV95l4WIpkFl1Yr5YGDNiuH+Y72OMLN2wg74N2EFi6b2B
         A5VgAAGvH2UxLwfZ5L7fly/ktth+7ibAbyuDD8u/9/0X2N+mNJ6UIotgpeE3Q3ukkWzx
         KISEVvrBICv8WJR9aB9qgozK+zJNd/xkFwlaNmOKI58nCgnwiOqTrcgiRxtsFC71aKpz
         TMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744225625; x=1744830425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BDpH5Cg2hroK2o4IDN554HJ3Fr5FbZsmDQ5bD2HXl6Y=;
        b=rcqhbNdOC7zorZhhCTkYREes6XqzORu7vvaHSVTB3MtyUn1vo8pFa01nKbNI67/bXO
         kDYI0Vrkc5VOMFh1vA1Cnwg8B8dyjM14gcU2Gi5RoJY4UwnhRsoR7iIJDFXomrtP2Rp/
         XMQQV+8kKvo9hz7lAgJiIRQmW2vtlwTpKIRvT+fRKI/Fcs9ZwdL7ACkQO9gXjPrfvI7a
         EdnGRVxM3yWZykDp2Mfdtzc/rExSaE/Eg8YZjBk0DD6N7aAMixgviYWK70T1fSt1vHxv
         jcx1Qr8BZ2ojGvTnwJbHHc3DYTsGjspLjBknAVypqK0OE2aaK/9Lpiy+7VocUXGrmdVU
         ArnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw2l6hmikpYIB57rV9jMuzUr4WtIUWWcVVgNOAzRvXFLEbgjED0K7Cvp0MlpIRxwBJXsezLGp4eTEj7i8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYO13onHDhQAt9J0hL66HQwv7BgBJ/zcTG6w2hewoltegpCoCi
	hca6EmK95KOEyS/BCOVHI32GiBvGYrebKW/S8nmEJzolvK3YISXgN46cm/PMp+WVjYm1eDqjHPo
	z
X-Gm-Gg: ASbGncuDrIBCJhRaYtRU9owlxhgYdSMIwbwEyQp36V03I4fh9WWKstrRM+8c97/1/Zj
	XDx0np/q+4hTASFLSvdERqFaAkv01cs4ThR4BqChmNzGnGkBT9uN/ahJUxm9ua4Av/VAni06wsh
	hhmNxWpiuvMON2WkCqOzyO1xt0nueZ5Z4EAwVUuOvwxtJ0qiwYy/VpwAGt6lsvWFrHerqoMJxWK
	MD37RiOOsCqxkwf7+DQMmA6FLkGmbrQ/Mw2ZTTcXi8giO9obq5otAu4a46QUbnBIc39sGPd565O
	jJeskPJA7yEx7wajxJMzivmfUrzTzVIHmUkj9iU0skg05AWL2bdmlKGRsgUUOJXUff5oBw==
X-Google-Smtp-Source: AGHT+IGk1b2UhjU3Mst8QhR0QOkZwD6JG8okUMrRHSg9d1x+fnRHwWKeJm3fk035+4iF+CJXDmapXQ==
X-Received: by 2002:a5d:5847:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-39d87ac2fdamr3386517f8f.29.1744225624948;
        Wed, 09 Apr 2025 12:07:04 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecac8sm28928715e9.4.2025.04.09.12.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:07:04 -0700 (PDT)
Date: Wed, 9 Apr 2025 21:07:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: module: Optimize PLT/GOT entry counting
Message-ID: <20250409-aa536deeef59c7a2862d906f@orel>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
 <20250409171526.862481-3-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409171526.862481-3-samuel.holland@sifive.com>

On Wed, Apr 09, 2025 at 10:14:51AM -0700, Samuel Holland wrote:
> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
> inside module_frob_arch_sections(). This is because amdgpu.ko contains
> about 300000 relocations in its .rela.text section, and the algorithm in
> count_max_entries() takes quadratic time.
> 
> Apply two optimizations from the arm64 code, which together reduce the
> total execution time by 99.58%. First, sort the relocations so duplicate
> entries are adjacent. Second, reduce the number of relocations that must
> be sorted by filtering to only relocations that need PLT/GOT entries, as
> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
> optimizing PLT counting").
> 
> Unlike the arm64 code, here the filtering and sorting is done in a
> scratch buffer, because the HI20 relocation search optimization in
> apply_relocate_add() depends on the original order of the relocations.
> This allows accumulating PLT/GOT relocations across sections so sorting
> and counting is only done once per module.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v2:
>  - Include R_RISCV_PLT32 relocations when computing the PLT size
>  - Accumulate PLT/GOT relocations across relocation sections
> 
>  arch/riscv/kernel/module-sections.c | 81 +++++++++++++++++++++++------
>  1 file changed, 65 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
> index 91d0b355ceef..75551ac6504c 100644
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
> @@ -55,44 +56,70 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
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
> -static void count_max_entries(Elf_Rela *relas, int num,
> +static void count_max_entries(const Elf_Rela *relas, size_t num,
>  			      unsigned int *plts, unsigned int *gots)
>  {
> -	for (int i = 0; i < num; i++) {
> +	for (size_t i = 0; i < num; i++) {
> +		if (duplicate_rela(relas, i))
> +			continue;
> +
>  		switch (ELF_R_TYPE(relas[i].r_info)) {
>  		case R_RISCV_CALL_PLT:
>  		case R_RISCV_PLT32:
> -			if (!duplicate_rela(relas, i))
> -				(*plts)++;
> +			(*plts)++;
>  			break;
>  		case R_RISCV_GOT_HI20:
> -			if (!duplicate_rela(relas, i))
> -				(*gots)++;
> +			(*gots)++;
>  			break;
> +		default:
> +			unreachable();
>  		}
>  	}
>  }
>  
> +static bool rela_needs_plt_got_entry(const Elf_Rela *rela)
> +{
> +	switch (ELF_R_TYPE(rela->r_info)) {
> +	case R_RISCV_CALL_PLT:
> +	case R_RISCV_GOT_HI20:
> +	case R_RISCV_PLT32:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  			      char *secstrings, struct module *mod)
>  {
> +	size_t num_scratch_relas = 0;
>  	unsigned int num_plts = 0;
>  	unsigned int num_gots = 0;
> +	Elf_Rela *scratch = NULL;
> +	size_t scratch_size = 0;
>  	int i;
>  
>  	/*
> @@ -122,9 +149,10 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  
>  	/* Calculate the maxinum number of entries */
>  	for (i = 0; i < ehdr->e_shnum; i++) {
> +		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
>  		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
> -		int num_rela = sechdrs[i].sh_size / sizeof(Elf_Rela);
>  		Elf_Shdr *dst_sec = sechdrs + sechdrs[i].sh_info;
> +		size_t scratch_size_needed;
>  
>  		if (sechdrs[i].sh_type != SHT_RELA)
>  			continue;
> @@ -133,7 +161,28 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
>  			continue;
>  
> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
> +		/*
> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
> +		 * close together, so sort a copy of the section to avoid interfering.
> +		 */
> +		scratch_size_needed = (num_scratch_relas + num_relas) * sizeof(*scratch);
> +		if (scratch_size_needed > scratch_size) {
> +			scratch_size = scratch_size_needed;

Maybe not worth it, but when i is less than ehdr->e_shnum - 1 (we still
have more sections to look at) we could use scratch_size_needed * 2, or
something, in order to hopefully reduce the number of times kvrealloc()
is called.

> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
> +			if (!scratch)
> +				return -ENOMEM;
> +		}
> +
> +		for (size_t j = 0; j < num_relas; j++)
> +			if (rela_needs_plt_got_entry(&relas[j]))
> +				scratch[num_scratch_relas++] = relas[j];
> +	}
> +
> +	if (scratch) {
> +		/* sort the accumulated PLT/GOT relocations so duplicates are adjacent */
> +		sort(scratch, num_scratch_relas, sizeof(*scratch), cmp_rela, NULL);
> +		count_max_entries(scratch, num_scratch_relas, &num_plts, &num_gots);
> +		kvfree(scratch);
>  	}
>  
>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
> -- 
> 2.47.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew
