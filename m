Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042226157E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744206771; cv=none; b=eGmVtNJrdMgw1TzYzQYIA8T8CrIn6sMJqYM05aNduZlMPaqZStOhKZzDBVYd1+7DqqTkIARofOUKxRjxcycgXWNsv81zjkHh6hiIK0IiVu+lZw25d+tPmliX5RltgKaCSwVnHK5Gm7ubAzK+VkJwldiRW10s6Zu1wp91M86JdtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744206771; c=relaxed/simple;
	bh=5h/5sj/ZKlG0LCQgwee6czUsmgrNzjlgmfYLZt7pkew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdA/tbQktu4yqnIEL0TWGmFPw++GzXz46iFdhcdqViy42MuKqxSU5CvEm20nhNbJfPd7LaPq+SfjIKLxSz3DwbAvgXbaX29vYSHVsNoIAYCG4bra0Iz/qvEiWnvlWg0lJqoetyHeX0aGHPKKUL2E6mbbU10DZawwpwH7vxs6sy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=C3w2lJO9; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C3w2lJO9"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-85b41281b50so185689739f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 06:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744206768; x=1744811568; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5pHe1ifA0DjRS4425Ek+vcz8cFHb7AV6SGKAGlf8Hs=;
        b=C3w2lJO9tQIYyc+DBq3wfGZ+KxgefjAJH6LXkkVQquEsdI8/JKSYz5psUaetp7HsIN
         xGI/WtBV7ZbEZopOUAE0PlnEr8bZcmKwaAm855/OHX8RpX/NcQhtGtB8qDAwC+CsNvs5
         a/4IFEhaZF5TOfSXQAw2TTmNOTU4Iu6L2pAxBsYsn2JHnSTxP/tMXt0daTXrvrBMZaBj
         NNa/VeRidZuAhuOqi6SuZbohM3AEdRWvhTSZ8WTYjQgQrTkzEp5IDPAz8ScJQ4xeYUlI
         XGLvxB0/vuUKD6ppc+vmDQsUzrIa099ifLne6E9DSa4pC/nyoaJAUWpZG5fSDN99iJTh
         efsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744206768; x=1744811568;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5pHe1ifA0DjRS4425Ek+vcz8cFHb7AV6SGKAGlf8Hs=;
        b=nlT5Ynt0lsfhUle8lFFEVPft71DFAsR8HnPVHnw5xFyOcpE1UugeqIGB3B+lMyqG//
         XfSUpcF5t5HYnlZb++ttxECf6SxoAnTmAx+ra6Fmx/Sqmkmt/8EWQWqc3UAobPwHkPi/
         MQzOk6yI8Tc3qoyi/0pEm9QPmv32rbBhHnDl/H/AoREE5UznR33T1eTZhn4P+TLHFCNL
         lFb4H4bSk51mx5Q3c5lL+qw2LG6wDaVZ7nJzQKC67kyu8LJQlL87zO4q7VNEwAj7z2Vc
         aF828aE/emVZUdrDNaXzkcZ75AXnlPw8v/hdtKTK7JMGG70VU81dt9J9FT4CZ3Ei30YV
         d7ew==
X-Forwarded-Encrypted: i=1; AJvYcCWUwEeD62rjKoXqjm1RoVgFpBL7IvMvU3DHAoiXNCHDmN/ITU4yJmkpC+3imFVOIjbMcLJPC3NAz1n5T1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB01+0YV4pPRjssOne78hiWymFGjXCiA5wS9+BKEKgweNYn0NS
	pTS6fjSSpY8oiDxcte7ia2uUzOirDGuzGh/b41o2d7KW12UVkmHLuIEMfhqMBIM=
X-Gm-Gg: ASbGncsgQo33zWb8lWLAECCwgxaX0vHI6Hk8g0LCeimh/cpxWGx16Ujv950U9xG2Q6I
	Pw4T+Ewo7xFHg1vYG0eXZdoZoJha5rc/QzqroswYm/wg6H/yIhtnnIzSQsc0YZhdGIGfZm3vsyB
	gReHLZO+ZesND7nk2CtcwiPB16lCaIXOttYvljWRNS6fneR2/emAHCgFMo7VOPrdKYiQhnY1/bd
	j7hkn9/oMqC2hK8aX/6DQRFdtLks++TGG9qrp/zMrsq1vYi1By7mIvM7OireP7+Hr5CkKy+s7tb
	0kgvipr8J6K/9yJQ6wUXoQNvIHjM0HCLrWPB7WQCZgpoOwDi3jwoeelV6xra3ctMt1Jy
X-Google-Smtp-Source: AGHT+IFWMoiTCjfnnzOhOhySi4L+SxY0UNNFxZHU8GLNuh8bo1Scfv/bNOSgJ7kJVRu0Vb2WaqVVyQ==
X-Received: by 2002:a05:6602:4802:b0:85b:538e:1faf with SMTP id ca18e2360f4ac-861611cc84dmr338497739f.7.1744206768541;
        Wed, 09 Apr 2025 06:52:48 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505d173c4sm248241173.36.2025.04.09.06.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 06:52:48 -0700 (PDT)
Message-ID: <cd48101d-cbb0-4fe0-88de-efda693e43e8@sifive.com>
Date: Wed, 9 Apr 2025 08:52:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: module: Optimize PLT/GOT entry counting
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 charlie@rivosinc.com
References: <20250409024519.454828-1-samuel.holland@sifive.com>
 <20250409-c5cdd1190c498e9b594cf7d7@orel>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250409-c5cdd1190c498e9b594cf7d7@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Drew,

On 2025-04-09 5:48 AM, Andrew Jones wrote:
> On Tue, Apr 08, 2025 at 07:45:16PM -0700, Samuel Holland wrote:
>> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
>> inside module_frob_arch_sections(). This is because amdgpu.ko contains
>> about 300000 relocations in its .rela.text section, and the algorithm in
>> count_max_entries() takes quadratic time.
>>
>> Apply two optimizations from the arm64 code, which together reduce the
>> total execution time by 99.57%. First, sort the relocations so duplicate
>> entries are adjacent. Second, reduce the number of relocations that must
>> be sorted by filtering to only relocations that need PLT/GOT entries, as
>> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
>> optimizing PLT counting").
>>
>> Unlike the arm64 code, here the filtering and sorting is done in a
>> scratch buffer, because the HI20 relocation search optimization in
>> apply_relocate_add() depends on the original order of the relocations.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  arch/riscv/kernel/module-sections.c | 66 +++++++++++++++++++++++++----
>>  1 file changed, 57 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
>> index e264e59e596e..91d4f0fbd0af 100644
>> --- a/arch/riscv/kernel/module-sections.c
>> +++ b/arch/riscv/kernel/module-sections.c
>> @@ -9,6 +9,7 @@
>>  #include <linux/kernel.h>
>>  #include <linux/module.h>
>>  #include <linux/moduleloader.h>
>> +#include <linux/sort.h>
>>  
>>  unsigned long module_emit_got_entry(struct module *mod, unsigned long val)
>>  {
>> @@ -55,19 +56,27 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
>>  	return (unsigned long)&plt[i];
>>  }
>>  
>> -static int is_rela_equal(const Elf_Rela *x, const Elf_Rela *y)
>> +#define cmp_3way(a, b)	((a) < (b) ? -1 : (a) > (b))
>> +
>> +static int cmp_rela(const void *a, const void *b)
>>  {
>> -	return x->r_info == y->r_info && x->r_addend == y->r_addend;
>> +	const Elf_Rela *x = a, *y = b;
>> +	int i;
>> +
>> +	/* sort by type, symbol index and addend */
>> +	i = cmp_3way(x->r_info, y->r_info);
>> +	if (i == 0)
>> +		i = cmp_3way(x->r_addend, y->r_addend);
>> +	return i;
>>  }
>>  
>>  static bool duplicate_rela(const Elf_Rela *rela, int idx)
>>  {
>> -	int i;
>> -	for (i = 0; i < idx; i++) {
>> -		if (is_rela_equal(&rela[i], &rela[idx]))
>> -			return true;
>> -	}
>> -	return false;
>> +	/*
>> +	 * Entries are sorted by type, symbol index and addend. That means
>> +	 * that, if a duplicate entry exists, it must be in the preceding slot.
>> +	 */
>> +	return idx > 0 && cmp_rela(rela + idx, rela + idx - 1) == 0;
>>  }
>>  
>>  static void count_max_entries(Elf_Rela *relas, int num,
>> @@ -87,11 +96,33 @@ static void count_max_entries(Elf_Rela *relas, int num,
>>  	}
>>  }
>>  
>> +static bool rela_needs_plt_got(const Elf_Rela *rela)
>> +{
>> +	unsigned int type = ELF_R_TYPE(rela->r_info);
>> +
>> +	return type == R_RISCV_CALL_PLT || type == R_RISCV_GOT_HI20;
> 
> I see these two are sufficient to support count_max_entries(), but Charlie
> also added support for R_RISCV_PLT32. I don't know enough about relocation
> types to know if we need to consider that one here and in
> count_max_entries(), so I'm just pointing it out in case it was
> overlooked.

Yes, R_RISCV_PLT32 should be included. Today if a module were to include a
R_RISCV_PLT32 relocation against a unique symbol, it would hit a BUG_ON in
module_emit_plt_entry() because there would be no space in the PLT. If there was
also a R_RISCV_CALL_PLT relocation against the same symbol, the code would
silently succeed.

Regards,
Samuel

>> +}
>> +
>> +/* Copy PLT and GOT relas to the scratch array. */
>> +static unsigned int partition_plt_got_relas(const Elf_Rela *relas, Elf_Rela *scratch,
>> +					    unsigned int num_rela)
>> +{
>> +	int j = 0;
>> +
>> +	for (int i = 0; i < num_rela; i++)
>> +		if (rela_needs_plt_got(&relas[i]))
>> +			scratch[j++] = relas[i];
>> +
>> +	return j;
>> +}
>> +
>>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  			      char *secstrings, struct module *mod)
>>  {
>>  	unsigned int num_plts = 0;
>>  	unsigned int num_gots = 0;
>> +	Elf_Rela *scratch = NULL;
>> +	size_t scratch_size = 0;
>>  	int i;
>>  
>>  	/*
>> @@ -132,9 +163,26 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
>>  			continue;
>>  
>> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
>> +		/*
>> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
>> +		 * close together, so sort a copy of the section to avoid interfering.
>> +		 */
>> +		if (sechdrs[i].sh_size > scratch_size) {
>> +			scratch_size = sechdrs[i].sh_size;
>> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
>> +			if (!scratch)
>> +				return -ENOMEM;
>> +		}
>> +
>> +		/* sort relocations requiring a PLT or GOT entry so duplicates are adjacent */
>> +		num_rela = partition_plt_got_relas(relas, scratch, num_rela);
>> +		sort(scratch, num_rela, sizeof(Elf_Rela), cmp_rela, NULL);
>> +		count_max_entries(scratch, num_rela, &num_plts, &num_gots);
>>  	}
>>  
>> +	if (scratch)
>> +		kvfree(scratch);
>> +
>>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
>>  	mod->arch.plt.shdr->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
>>  	mod->arch.plt.shdr->sh_addralign = L1_CACHE_BYTES;
>> -- 
>> 2.47.0
>>
> 
> Besides my question above,
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew

