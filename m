Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0681E3780
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226314; cv=none; b=kNzn259MKoW+aJ7cW6ya3OXrOhE/ELQKT0Q9WvzNc26Ofylp/QHD6+EWTkLo6A4ZIQoq59EjM3bLV0Un1n5tN7x7kiebp+7nIXWySbEoP4c/mNZ39PMPFNL5ymykMl0/RtrdsVnoYINzAnyd2sTt6ThV+EIZtwM8CfXD97v1yec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226314; c=relaxed/simple;
	bh=KiRSwCAFpFwh6/OdLZP/Vsq5kZyUaUEKwSoMMzGB+hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ENHeZ3Q5rrGr/2uiKGUrTvkegocF6eadyyiF91PkXmuANkj6u+fNHQte7c4sT/jZea4oyDoadkE1QTkPd/LcK5cNO2ComAGLwv8KMZ3EV6Gb5K/yOBq0b+lnfc0E9qUcgvi0jZMw7642WgXqk33R34gfahRKlwzSKQx1CJErMI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=YWN32RU6; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YWN32RU6"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86135ac9542so2395439f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744226311; x=1744831111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFs2jcsC9hSq6N0o28lZcXuEAl76nY4kIVAVF5GbkWw=;
        b=YWN32RU6F3kZcjE8arXliPxxSNxcP6ryXa1X+KQeE/4jLM+R5aqXJd2P89YcJdEj6y
         s+cTbVXstTaiGIU+9F7w7SCXtrHZtMSJv3r5jUlqQd2PtyATrXYfkPTQQ9W5XUuPB7cg
         PoTzxWXebPrnv9R8D5ZShC2iebHkKMlSsZuuGET96nelBNAqYWp0sO2VqvHC67KB/01j
         nhaWFApRGCtTDur0ZdVrnopUvwLFVSFAlwh8dHJBRIOpmoRUXUnSrp+Ti9EFpidZk7gy
         LxIBP5TPGCTvLfbrSJ5t2tzGb5+pA5vs62/Et1wvQXZxiQsWYvZtWycfOj8TVAIvaAja
         NDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226311; x=1744831111;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFs2jcsC9hSq6N0o28lZcXuEAl76nY4kIVAVF5GbkWw=;
        b=mDfZEyh/yGLyHHz7LjBWoIXwNVTSQhC/2ZZGEF3xci6BJObuZuI6Cgt3ksEC2/osKB
         of3X6wS9kCihvIpcJdP7mZQmIAnhjnuaTlQZ+uDbrhWqNyMHB44Cb39f/E3P9xfQ+uez
         3jUkn5n8o3J+4nFzMWfNlArlA3gSp5QZtN0myYMdWYsxTMuWKBPkkw7hsSklMLDkCdoM
         NXRDEalmeziafHcXZKh5RbfrrcH/T/BIWKf+lh60rqJHzcOv9OaWdKWuD0/MYINnerjo
         UaewjEDVrxkO96BWiTIMWsTQnJ/RV+idO/Doe7CTaWRnzopp+OR59iVjofKA4DXAG6Wp
         LpRw==
X-Forwarded-Encrypted: i=1; AJvYcCW9EaFWFfy4mtlrVzYvdT2GO5gGMHuU4ivbHWvDpM4uVfXbOQ9jT6Nt5CTIpDK1/SW5hpmJVzOT/XT+fBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzIYTAEca+S7K4PqvHGY6oCZb9G8ZYzICSLrdxZFS2f6Xw4juQ
	2s+YCU4a5gRzooELFUfcsk1s/XNgf3P8ufsdOUQpttDOkkHxsY9OPYaqxWDH4iE=
X-Gm-Gg: ASbGnctzm498TCUKBY5uMui4st6u/K4YJArdAi3/uNI97zoWDAOra9LgLl/V+wHm9Vs
	rni0Gv+lZxZPUGBVXuLuawkkAtGFjCs8vRLoCwZyeLZUxiBaOYCDTIoGThiEQPz+5OZQTUKsdge
	RW1110oJHcSEpdwAO17XCW3Cg54GLCl1Z5HDmUribtcHyDxFPILiCQMr1YV3bZun2GsPPrv5usl
	wBBp9aUi71tBUhgRrTiv40Osgt7IDb1F+gvKB2W7H7+k1T7gOH97FI6eSbv+yWmvp6UJGjeBCuu
	RDauCCW4zzjZ0mSZr86RPmxTxVbaGp8fo4O+efzOxI++1PzYit6mHwSvhA==
X-Google-Smtp-Source: AGHT+IGYpxRkSx3E2EazAyHnEuRS9W8r8vN1zJ7kUcYvc6Jr3BvS4y68UVPW2fgdqphAGXRzj+AMFw==
X-Received: by 2002:a05:6602:3790:b0:85b:3c49:8812 with SMTP id ca18e2360f4ac-8616cd31002mr87252639f.8.1744226311315;
        Wed, 09 Apr 2025 12:18:31 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8616543a934sm31022139f.26.2025.04.09.12.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 12:18:30 -0700 (PDT)
Message-ID: <64d11a0f-dbae-41dd-a156-cda8a83a2fa4@sifive.com>
Date: Wed, 9 Apr 2025 14:18:29 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] riscv: module: Optimize PLT/GOT entry counting
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org
References: <20250409171526.862481-1-samuel.holland@sifive.com>
 <20250409171526.862481-3-samuel.holland@sifive.com>
 <20250409-aa536deeef59c7a2862d906f@orel>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20250409-aa536deeef59c7a2862d906f@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Drew,

Thanks for the review again!

On 2025-04-09 2:07 PM, Andrew Jones wrote:
> On Wed, Apr 09, 2025 at 10:14:51AM -0700, Samuel Holland wrote:
>> perf reports that 99.63% of the cycles from `modprobe amdgpu` are spent
>> inside module_frob_arch_sections(). This is because amdgpu.ko contains
>> about 300000 relocations in its .rela.text section, and the algorithm in
>> count_max_entries() takes quadratic time.
>>
>> Apply two optimizations from the arm64 code, which together reduce the
>> total execution time by 99.58%. First, sort the relocations so duplicate
>> entries are adjacent. Second, reduce the number of relocations that must
>> be sorted by filtering to only relocations that need PLT/GOT entries, as
>> done in commit d4e0340919fb ("arm64/module: Optimize module load time by
>> optimizing PLT counting").
>>
>> Unlike the arm64 code, here the filtering and sorting is done in a
>> scratch buffer, because the HI20 relocation search optimization in
>> apply_relocate_add() depends on the original order of the relocations.
>> This allows accumulating PLT/GOT relocations across sections so sorting
>> and counting is only done once per module.
>>
>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>> Changes in v2:
>>  - Include R_RISCV_PLT32 relocations when computing the PLT size
>>  - Accumulate PLT/GOT relocations across relocation sections
>>
>>  arch/riscv/kernel/module-sections.c | 81 +++++++++++++++++++++++------
>>  1 file changed, 65 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
>> index 91d0b355ceef..75551ac6504c 100644
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
>> @@ -55,44 +56,70 @@ unsigned long module_emit_plt_entry(struct module *mod, unsigned long val)
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
>> -static void count_max_entries(Elf_Rela *relas, int num,
>> +static void count_max_entries(const Elf_Rela *relas, size_t num,
>>  			      unsigned int *plts, unsigned int *gots)
>>  {
>> -	for (int i = 0; i < num; i++) {
>> +	for (size_t i = 0; i < num; i++) {
>> +		if (duplicate_rela(relas, i))
>> +			continue;
>> +
>>  		switch (ELF_R_TYPE(relas[i].r_info)) {
>>  		case R_RISCV_CALL_PLT:
>>  		case R_RISCV_PLT32:
>> -			if (!duplicate_rela(relas, i))
>> -				(*plts)++;
>> +			(*plts)++;
>>  			break;
>>  		case R_RISCV_GOT_HI20:
>> -			if (!duplicate_rela(relas, i))
>> -				(*gots)++;
>> +			(*gots)++;
>>  			break;
>> +		default:
>> +			unreachable();
>>  		}
>>  	}
>>  }
>>  
>> +static bool rela_needs_plt_got_entry(const Elf_Rela *rela)
>> +{
>> +	switch (ELF_R_TYPE(rela->r_info)) {
>> +	case R_RISCV_CALL_PLT:
>> +	case R_RISCV_GOT_HI20:
>> +	case R_RISCV_PLT32:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>>  int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  			      char *secstrings, struct module *mod)
>>  {
>> +	size_t num_scratch_relas = 0;
>>  	unsigned int num_plts = 0;
>>  	unsigned int num_gots = 0;
>> +	Elf_Rela *scratch = NULL;
>> +	size_t scratch_size = 0;
>>  	int i;
>>  
>>  	/*
>> @@ -122,9 +149,10 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  
>>  	/* Calculate the maxinum number of entries */
>>  	for (i = 0; i < ehdr->e_shnum; i++) {
>> +		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
>>  		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
>> -		int num_rela = sechdrs[i].sh_size / sizeof(Elf_Rela);
>>  		Elf_Shdr *dst_sec = sechdrs + sechdrs[i].sh_info;
>> +		size_t scratch_size_needed;
>>  
>>  		if (sechdrs[i].sh_type != SHT_RELA)
>>  			continue;
>> @@ -133,7 +161,28 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>>  		if (!(dst_sec->sh_flags & SHF_EXECINSTR))
>>  			continue;
>>  
>> -		count_max_entries(relas, num_rela, &num_plts, &num_gots);
>> +		/*
>> +		 * apply_relocate_add() relies on HI20 and LO12 relocation pairs being
>> +		 * close together, so sort a copy of the section to avoid interfering.
>> +		 */
>> +		scratch_size_needed = (num_scratch_relas + num_relas) * sizeof(*scratch);
>> +		if (scratch_size_needed > scratch_size) {
>> +			scratch_size = scratch_size_needed;
> 
> Maybe not worth it, but when i is less than ehdr->e_shnum - 1 (we still
> have more sections to look at) we could use scratch_size_needed * 2, or
> something, in order to hopefully reduce the number of times kvrealloc()
> is called.

I tried to keep the code as simple as possible, so I suppose it's not obvious
what's going on here. The current code takes advantage of the fact that one of
the relocation sections (.rela.text) is generally an order of magnitude or more
larger than the others, is usually the first section processed, and much fewer
than half of the relocations require a PLT/GOT entry. So in the common case:

  num_relas (.rela.text) > num_scratch_relas (all sections) + num_relas (any
other section)

and there will only be one allocation, for .rela.text.

Regards,
Samuel

>> +			scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
>> +			if (!scratch)
>> +				return -ENOMEM;
>> +		}
>> +
>> +		for (size_t j = 0; j < num_relas; j++)
>> +			if (rela_needs_plt_got_entry(&relas[j]))
>> +				scratch[num_scratch_relas++] = relas[j];
>> +	}
>> +
>> +	if (scratch) {
>> +		/* sort the accumulated PLT/GOT relocations so duplicates are adjacent */
>> +		sort(scratch, num_scratch_relas, sizeof(*scratch), cmp_rela, NULL);
>> +		count_max_entries(scratch, num_scratch_relas, &num_plts, &num_gots);
>> +		kvfree(scratch);
>>  	}
>>  
>>  	mod->arch.plt.shdr->sh_type = SHT_NOBITS;
>> -- 
>> 2.47.0
>>
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Thanks,
> drew

