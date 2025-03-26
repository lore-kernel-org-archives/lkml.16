Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87530149C41
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743029269; cv=none; b=dBhYg8+L+G9gJLMNsWD/QWNMdVfe4AlO9aNMDK8egmkl2/LnOPzPlfGGAEsGswhYr0NCUigCLvBnhjNDAVL5JaS0WRgZWxmWYs0XelQTrSOyHut2Volqz/P4P0L4K/x2YrLLwD2aOhQ0BIy6KckLEQyAvr375CoEJMfDQx87jHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743029269; c=relaxed/simple;
	bh=dX0TnjfTRmrEh6KUb9pip/Kj3eupXHMYl1L+/L+n+O8=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=PthbyD+Xim4sHA+KUxo8ug774m+x0xb/49QuMOICYVHlcuBZb0QN8DFNS2h/Aq9rMc0uQD82in81yNyiBo6AXtIJonUHIjyG7vxGOsAuHVe9ltFpN8gatS8cUfcuitZJD6ryCDCuhhIccZu82foqq/vYuh7nXbzsxE52PF4OGdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=IZ69+VIe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="IZ69+VIe"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2239c066347so9174585ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743029266; x=1743634066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENYvbfpYW1FRwv+5fNWWoBDVfb51NMkn/35jJNBxxwA=;
        b=IZ69+VIeozB0TWY8k2GfcvetglzTlauehDWFELOboG5CauHiF9b221CFkPCZp/MenY
         il3MQEA/Eu+cZ1NiZFG0lRFWVb3p0Jk7Uq9IjFEtVNKkCITI8FOReWJ+v5UVBGRPF9S4
         2+iAJkpScaO9OMjTnl0cfKz0kC73rwqc8wYHL96N8ha7aPWmK7coRZA2ua0avEh3YI3j
         EYM0f868W8oldEFp/hPzF/F2opNDjsrUuiBhFzyuOhT8YourGThp+E3RLT0oz4bBhMfp
         44dlQHSvQNwoTvJC9Gvbd6ja6rKDnPq4/J2a1ae8fL7w/E1X0RYuAGxdZC1kfYzxIgwN
         7pIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743029266; x=1743634066;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENYvbfpYW1FRwv+5fNWWoBDVfb51NMkn/35jJNBxxwA=;
        b=sR5AmS7yuJyCeoF2OehSApCJPVb9Bx3Z4KY7YTw2tQDdGnJqOt2g3XWE5HamzpJ78j
         OL9W4Hk3JUXUUk1duAznmJ/M+KM7woxOs2jUy57woTxM3z1B1Zci6mwSAg0A+dzXPqct
         em5FLq3LZJpxmXhEpA2GgiQL63D1GomfTicLp1/rIsIFYgAJJuVqZyp9CZQCRfG4mvKX
         jTNdhJ2jv1vuAPJRcM7MAttv77NLqduVXt0A3BcfeDuUShb2VC86ZM4iZ+7kc/h/z6Ov
         tJfJ3wdY7DrsxmfbXYOTZkYC79Vwd+IkMA/l1WbR473HGm+uPAytRqSmigQdSkViOYLj
         SUtg==
X-Gm-Message-State: AOJu0Yy41VFeTFBfCNDDRT9mHC9t5YKcGh3ANpMHIv7iL50/IHFqCjbT
	vi3zOx3MraJAwVHhezgE5usXSnU1j5YH5vnb5pA32W1dGB1lrEOIoHvbhZnMzlKKdPw3vz0pwov
	HgoQ=
X-Gm-Gg: ASbGncsh7nEMz76EWZqlVLngheUH6H7knh8z+Z+iCG1bQ8uiKOCs6v5Wjry8QhtvCuh
	AJnZl8ZzwzCJNYiDP6gh/n6/zaNoabx+vW9875d+Pf+uCRvz9SquGyekVYSDjZANSlB0K6BtXro
	Undk5XARpAyAiU5wQgAhPYeEv9QeCi/upS1dBUGx8lh9IsQ6mi6JDBswRUjq1ZeNqvjzEIdAvF4
	owClohcly1IWza2aU4EuAbG4NSPDhCcwTUVrtjFqtmLCC2rXtk/SJYyQuGQBXpdxFXG+KhxxisS
	mf+8WpLnq9eg+swfYImR20jgDVOScaG+H1vLRciHbHNLLxOULEpe
X-Google-Smtp-Source: AGHT+IEvXt3oSJ/F1fAesg3sth848fXdJQyiT5KFcCnd7670HL/7uTbeEUUKEITdtFQDQ4zqX3fqHg==
X-Received: by 2002:a05:6a00:3a1e:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-739610bdb9dmr1453432b3a.15.1743029266324;
        Wed, 26 Mar 2025 15:47:46 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390615618fsm13249198b3a.146.2025.03.26.15.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 15:47:45 -0700 (PDT)
Date: Wed, 26 Mar 2025 15:47:45 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Mar 2025 15:45:24 PDT (-0700)
Subject:     Re: [PATCH 0/6] riscv: Relocatable NOMMU kernels
In-Reply-To: <60900b42-298c-4b9f-86cf-af31aa5a02d3@sifive.com>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  akpm@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>, alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-517c0318-c8fb-4c4a-aa0e-0d08f8d34d78@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 26 Feb 2025 07:22:51 PST (-0800), samuel.holland@sifive.com wrote:
> Hi Palmer,
>
> On 2025-02-13 8:17 AM, Palmer Dabbelt wrote:
>> On Sat, 26 Oct 2024 10:13:52 PDT (-0700), samuel.holland@sifive.com wrote:
>>> Currently, RISC-V NOMMU kernels are linked at CONFIG_PAGE_OFFSET, and
>>> since they are not relocatable, must be loaded at this address as well.
>>> CONFIG_PAGE_OFFSET is not a user-visible Kconfig option, so its value is
>>> not obvious, and users must patch the kernel source if they want to load
>>> it at a different address.
>>>
>>> Make NOMMU kernels more portable by making them relocatable by default.
>>> This allows a single kernel binary to work when loaded at any address.
>>>
>>>
>>> Samuel Holland (6):
>>>   riscv: Remove duplicate CONFIG_PAGE_OFFSET definition
>>>   riscv: Allow NOMMU kernels to access all of RAM
>>>   riscv: Support CONFIG_RELOCATABLE on NOMMU
>>>   asm-generic: Always define Elf_Rel and Elf_Rela
>>>   riscv: Support CONFIG_RELOCATABLE on riscv32
>>>   riscv: Remove CONFIG_PAGE_OFFSET
>>>
>>>  arch/riscv/Kconfig               | 10 +---
>>>  arch/riscv/Makefile              |  1 -
>>>  arch/riscv/include/asm/page.h    | 27 ++++-----
>>>  arch/riscv/include/asm/pgtable.h |  6 +-
>>>  arch/riscv/mm/init.c             | 97 ++++++++++++++++----------------
>>>  include/asm-generic/module.h     |  8 ---
>>>  6 files changed, 68 insertions(+), 81 deletions(-)
>>
>> I'm getting some build failures
>>
>> riscv64-unknown-linux-gnu-ld: arch/riscv/errata/sifive/errata.o: relocation
>> R_RISCV_HI20 against `tlb_flush_all_threshold' can not be used when making a
>> shared object; recompile with -fPIC
>> riscv64-unknown-linux-gnu-ld: arch/riscv/errata/thead/errata.o: relocation
>> R_RISCV_HI20 against `riscv_cbom_block_size' can not be used when making a
>> shared object; recompile with -fPIC
>
> What toolchain and config do you see failures with? I have tried building this
> series on top of v6.14-rc4 with GCC 14.2.1 and
>  * defconfig
>  * defconfig + NOMMU + S-mode
>  * defconfig + NOMMU + M-mode
>  * defconfig + 32-bit
>  * defconfig + 32-bit + NOMMU + S-mode
>  * defconfig + 32-bit + NOMMU + M-Mode
>  * nommu_k210_defconfig
>  * nommu_k210_sdcard_defconfig
>  * nommu_virt_defconfig
> and all succeed.

rv32 allmodconfig does it.

I don't actually know what's going on, but it seems that something in 
Kconfig land has flipped over and ended up building medlow with these.  
The erata handling can't be proper PIC (see 8dc2a7e8027f ("riscv: Fix 
relocatable kernels with early alternatives using -fno-pie")), but that 
one was just wrong -- they need to be medany, otherwise they're 
very-non-relocatable.

I feel like it's possible to construct Kconfigs that break this without 
your patch set, but not 100% sure there.  Either way I sent a patch
<https://lore.kernel.org/all/20250326224506.27165-2-palmer@rivosinc.com/>

>
> Regards,
> Samuel
