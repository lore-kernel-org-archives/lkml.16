Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD6D165F1A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226661; cv=none; b=QsTBFW60UYPPFT1FCGfuWRCOsY6d75CvDoPyyzDOoa9xSbwf9bV/AZEjfVyEuDAsHgxbyHFCeQHXxUdCkWpgPuamHrB8UM0buYw9Ht5OdFEylDYqqzmD0dlMyD44tEtCQiJ+fDlSwlhhiTwA9/te32i75VBUYL2/OmREt8QTzYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226661; c=relaxed/simple;
	bh=FWKmhEPZuvSURm+fK3L5t96Qx1CC8rkepbs4NN1x4Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JhbgHHaUZd1kX9ZlBiNeYtVjqEfm7oor8y0k0RN3NHtJHYQ31YGHHWc03z3tINXpGIFZZoM0Z0DniOlCNMO0SogxGSOy/erGbdC8EcXEMvj1SwQzm0z95pQmwNGbHacHMUTFV3eSaFQntSF3S70kbaXJ96RTZ+D68l2Gv2V3yzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=n4+n21jz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="n4+n21jz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so8216355e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744226656; x=1744831456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8FxhE3NP9+CvB5k4cj29sIhuHMLfRzDVwZlEFBnlow=;
        b=n4+n21jz3jIKrD5DPoYsUuHy5O0wMSVb8/Ec//qGcg4/2YVrs7QGKLFO6xitylVkz/
         NNGhZ4Xc3EmLD9PG0Oo9VItkbRqvBBG2sQEFYyGnQhtcTOD9UPe2EW6lYhdN+YnKfu5d
         qPsgRPCHXlDn1b8jPOivr++PY09QKH4/7s8jpFY4iNbhp9/D2EaMJEA4N2q2ccXR9Ka/
         Sp6OWprgncgrntTli5jclbo66vhwqq8GPFDl8m4KNnhz+PkaQSLJsSWmdz9+78RvVKlH
         vVL9D6TYHh40hCloe7oaJhgcedlcQYVF6f0eR6aY4bcmMcG/S1Aj/g3RhbfVW8tTUi5b
         LpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226656; x=1744831456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8FxhE3NP9+CvB5k4cj29sIhuHMLfRzDVwZlEFBnlow=;
        b=LjEz6062aLbUnSKhN3fBsEO3hiFOrRm7kClo6cpDeiKklicDb5jUMhuTxn8v2w1pPF
         96eBnXrNHFcOWqnyYxlpgFJ11wSBBmFrqo751NC4Digmpsfplajcfd3FnBIFrXEpyeFv
         imXuy1aps4ZQNdwx4c607F8AbEN9z4JP7AHlsgAcmd1jFeVrrkYO9rN+uoVt+fI/9zS2
         o4QjJVZsH2uN6n/OkQbmNwo96unGwQUKaWoP4u5Y54g0e56ORpRSX4u/Uyn5RVCsKNMX
         S0XQx1D8vHaZfWrzl+M6X2DjUwfN1XPRGGfvQgFSh50kFdIQ5utA9oMfYWfR4YlR3KfH
         5Gzw==
X-Forwarded-Encrypted: i=1; AJvYcCWJge64kN+B+mtRl9zMym6r16xoEIJtIdP8LGPJrsW4dmmLvmZL0DRYovgaUnt5vLzpu2Fw4hrfvSWiUnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYjLU36G4Gml9YOnC4OFfeVVhfSdMqosbnT6DwBR+7S3beiloN
	LmdIIzcOAJwK9aD/jXMlLk+M9nEfrpJJmJdYT016XdpcbKlcLmI/LQUyIQCZBfg=
X-Gm-Gg: ASbGncs8VkR8rdu1Y+sSVMhVlLtPneH+3nAiwGiMhP5ot27dLw1rqS8dALq4uhoJOia
	RjakbKiXklbp6lRGmPls7RPS3201tJvKDMTcucRpyZh5ZZkt2kqPOYJRM5y3lHGidc/1+3Cmxhd
	cZw/ZImENkwA7E9/qHLm226gICzo40hy/Ul2yu7JNq9LrNDAntHrGt+XLu8TD+5mQwu1Qx+vOZW
	1Ls1/bSsSSznt8+Iht6ABT4kp7dLRWIUf4fK3d7SqbZbvpbKh0ZTMhuMOcEXsDS+S23uw8AaJB0
	KU++vqoCsL60H7E16pyEiOLBTq0Nr4iUqDOoBDi8suIVAFnQMh6JDxshfITfkqq9FCF5aQ==
X-Google-Smtp-Source: AGHT+IFSZzhJ9866tYSp/eoyfPKaCAcmw7qQUIkxrlVQcA7QgprWbn2wLiKEhQi9YPH+OPNL4mZ+Sw==
X-Received: by 2002:a05:600c:1e17:b0:439:4c1e:d810 with SMTP id 5b1f17b1804b1-43f2c5d6fd9mr6034695e9.9.1744226655978;
        Wed, 09 Apr 2025 12:24:15 -0700 (PDT)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075a65dsm30249435e9.31.2025.04.09.12.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:24:15 -0700 (PDT)
Date: Wed, 9 Apr 2025 21:24:14 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Darshan Prajapati <darshan.prajapati@einfochips.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: module: Optimize PLT/GOT entry counting
Message-ID: <20250409-2341cb315aa65a258ecb268a@orel>
References: <20250409171526.862481-1-samuel.holland@sifive.com>
 <20250409171526.862481-3-samuel.holland@sifive.com>
 <20250409-aa536deeef59c7a2862d906f@orel>
 <64d11a0f-dbae-41dd-a156-cda8a83a2fa4@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64d11a0f-dbae-41dd-a156-cda8a83a2fa4@sifive.com>

On Wed, Apr 09, 2025 at 02:18:29PM -0500, Samuel Holland wrote:
> Hi Drew,
> 
> Thanks for the review again!
> 
> On 2025-04-09 2:07 PM, Andrew Jones wrote:
> > On Wed, Apr 09, 2025 at 10:14:51AM -0700, Samuel Holland wrote:
> >> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
> >> inside module_frob_arch_sections(). This is because amdgpu.ko contains
> >> about 300000 relocations in its .rela.text section, and the algorithm in
> >> count_max_entries() takes quadratic time.
> >>
> >> Apply two optimizations from the arm64 code, which together reduce the
> >> total execution time by 99.58%. First, sort the relocations so duplicate
> >> entries are adjacent. Second, reduce the number of relocations that must
> >> be sorted by filtering to only relocations that need PLT/GOT entries, as
> >> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
> >> optimizing PLT counting").
> >>
> >> Unlike the arm64 code, here the filtering and sorting is done in a
> >> scratch buffer, because the HI20 relocation search optimization in
> >> apply_relocate_add() depends on the original order of the relocations.
> >> This allows accumulating PLT/GOT relocations across sections so sorting
> >> and counting is only done once per module.
> >>
> >> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> >> ---
> >>
> >> Changes in v2:
> >>  - Include R_RISCV_PLT32 relocations when computing the PLT size
> >>  - Accumulate PLT/GOT relocations across relocation sections
> >>
> >>  arch/riscv/kernel/module-sections.c | 81 +++++++++++++++++++++++------
> >>  1 file changed, 65 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
> >> index 91d0b355ceef..75551ac6504c 100644
> >> --- a/arch/riscv/kernel/module-sections.c
> >> +++ b/arch/riscv/kernel/module-sections.c
> >> @@ -9,6 +9,7 @@
> >>  #include <linux/kernel.h>
> >>  #include <linux/module.h>
> >>  #include <linux/moduleloader.h>
> >> +#include <linux/sort.h>
> >>  
> >>  unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
> >>  {
> >> @@ -55,44 +56,70 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
> >>  	return (unsigned long)&plt[i];
> >>  }
> >>  
> >> -static int is_rela_equal(const Elf_Rela *x, const Elf_Rela *y)
> >> +#define cmp_3way(a, b)	((a) < (b) ? -1 : (a) > (b))
> >> +
> >> +static int cmp_rela(const void *a, const void *b)
> >>  {
> >> -	return x->r_info == y->r_info && x->r_addend == y->r_addend;
> >> +	const Elf_Rela *x = a, *y = b;
> >> +	int i;
> >> +
> >> +	/* sort by type, symbol index and addend */
> >> +	i = cmp_3way(x->r_info, y->r_info);
> >> +	if (i == 0)
> >> +		i = cmp_3way(x->r_addend, y->r_addend);
> >> +	return i;
> >>  }
> >>  
> >>  static bool duplicate_rela(const Elf_Rela *rela, int idx)
> >>  {
> >> -	int i;
> >> -	for (i = 0; i < idx; i++) {
> >> -		if (is_rela_equal(&rela[i], &rela[idx]))
> >> -			return true;
> >> -	}
> >> -	return false;
> >> +	/*
> >> +	 * Entries are sorted by type, symbol index and addend. That means
> >> +	 * that, if a duplicate entry exists, it must be in the preceding slot.
> >> +	 */
> >> +	return idx > 0 && cmp_rela(rela + idx, rela + idx - 1) == 0;
> >>  }
> >>  
> >> -static void count_max_entries(Elf_Rela *relas, int num,
> >> +static void count_max_entries(const Elf_Rela *relas, size_t num,
> >>  			      unsigned int *plts, unsigned int *gots)
> >>  {
> >> -	for (int i = 0; i < num; i++) {
> >> +	for (size_t i = 0; i < num; i++) {
> >> +		if (duplicate_rela(relas, i))
> >> +			continue;
> >> +
> >>  		switch (ELF_R_TYPE(relas[i].r_info)) {
> >>  		case R_RISCV_CALL_PLT:
> >>  		case R_RISCV_PLT32:
> >> -			if (!duplicate_rela(relas, i))
> >> -				(*plts)++;
> >> +			(*plts)++;
> >>  			break;
> >>  		case R_RISCV_GOT_HI20:
> >> -			if (!duplicate_rela(relas, i))
> >> -				(*gots)++;
> >> +			(*gots)++;
> >>  			break;
> >> +		default:
> >> +			unreachable();
> >>  		}
> >>  	}
> >>  }
> >>  
> >> +static bool rela_needs_plt_got_entry(const Elf_Rela *rela)
> >> +{
> >> +	switch (ELF_R_TYPE(rela->r_info)) {
> >> +	case R_RISCV_CALL_PLT:
> >> +	case R_RISCV_GOT_HI20:
> >> +	case R_RISCV_PLT32:
> >> +		return true;
> >> +	default:
> >> +		return false;
> >> +	}
> >> +}
> >> +
> >>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
> >>  			      char *secstrings, struct module *mod)
> >>  {
> >> +	size_t num_scratch_relas = 0;
> >>  	unsigned int num_plts = 0;
> >>  	unsigned int num_gots = 0;
> >> +	Elf_Rela *scratch = NULL;
> >> +	size_t scratch_size = 0;
> >>  	int i;
> >>  
> >>  	/*
> >> @@ -122,9 +149,10 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
> >>  
> >>  	/* Calculate the maxinum number of entries */
> >>  	for (i = 0; i < ehdr->e_shnum; i++) {
> >> +		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
> >>  		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
> >> -		int num_rela = sechdrs[i].sh_size / sizeof(Elf_Rela);
> >>  		Elf_Shdr *dst_sec = sechdrs + sechdrs[i].sh_info;
> >> +		size_t scratch_size_needed;
> >>  
> >>  		if (sechdrs[i].sh_type != SHT_RELA)
> >>  			continue;
> >> @@ -133,7 +161,28 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
> >>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
> >>  			continue;
> >>  
> >> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
> >> +		/*
> >> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
> >> +		 * close together, so sort a copy of the section to avoid interfering.
> >> +		 */
> >> +		scratch_size_needed = (num_scratch_relas + num_relas) * sizeof(*scratch);
> >> +		if (scratch_size_needed > scratch_size) {
> >> +			scratch_size = scratch_size_needed;
> > 
> > Maybe not worth it, but when i is less than ehdr->e_shnum - 1 (we still
> > have more sections to look at) we could use scratch_size_needed * 2, or
> > something, in order to hopefully reduce the number of times kvrealloc()
> > is called.
> 
> I tried to keep the code as simple as possible, so I suppose it's not obvious
> what's going on here. The current code takes advantage of the fact that one of
> the relocation sections (.rela.text) is generally an order of magnitude or more
> larger than the others, is usually the first section processed, and much fewer
> than half of the relocations require a PLT/GOT entry. So in the common case:
> 
>   num_relas (.rela.text) > num_scratch_relas (all sections) + num_relas (any
> other section)
> 
> and there will only be one allocation, for .rela.text.

Sounds good.

Thanks,
drew

> 
> Regards,
> Samuel
> 
> >> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
> >> +			if (!scratch)
> >> +				return -ENOMEM;
> >> +		}
> >> +
> >> +		for (size_t j = 0; j < num_relas; j++)
> >> +			if (rela_needs_plt_got_entry(&relas[j]))
> >> +				scratch[num_scratch_relas++] = relas[j];
> >> +	}
> >> +
> >> +	if (scratch) {
> >> +		/* sort the accumulated PLT/GOT relocations so duplicates are adjacent */
> >> +		sort(scratch, num_scratch_relas, sizeof(*scratch), cmp_rela, NULL);
> >> +		count_max_entries(scratch, num_scratch_relas, &num_plts, &num_gots);
> >> +		kvfree(scratch);
> >>  	}
> >>  
> >>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
> >> -- 
> >> 2.47.0
> >>
> > 
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > 
> > Thanks,
> > drew
> 
