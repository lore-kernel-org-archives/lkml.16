Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA4C1C84BB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 10:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744625522; cv=none; b=umAqEXMqypYmgBeA5aJFhMJlUg6YdTCpwhziiIhGfug6ad1RhxzUdt3dMkasteeeokhAlpVzN20V0XDi1qqTHcCnWxwuQCpAjYHFfChdbMzt25vTN9Dl9ZQHag0/m4jg4kPY/CJpefJkFqz+vTD+PJ7A9KoMQLi1FMZ59IayfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744625522; c=relaxed/simple;
	bh=Kk+qzTUu/LPz0tByaNoRzzWRhucCyoYiydWP055y6/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+Ixo2amiZUlbqu4n+osrPj2XC0fS9YhopRGPtZ6g9loGVR6Bqo3kpZBFkB1fXl5LvsAl8vKU/bAG+3bUbaQ7rMR44I+oph9EkECIrXbg9584N1xJ3xqXc/5zuUjT2BYN5e5obipxo/4Y1WK4R4CU0ezHE6yPgkOObU8RFm1WgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=PM+xjbmm; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="PM+xjbmm"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-399749152b4so2018130f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744625518; x=1745230318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekviSgQyoe64J8uN564Y99DCC6tdD4eOX0JG1pzrNnA=;
        b=PM+xjbmm1vWhOkJkznqvz4se8eCyjYkYnZ7jJxNk/3jq//yAd0xWrvoQlcSKKIlBcn
         gx2yfWZXE7/J7p96oqZ4z+TY8yEMvmgsyF9EprmFXO+5javf0pPsL1UjDwXkCV25UY+o
         xGK5P8HemOb/fALVfX31pt9ZW5UYTW2RG7fCpjstTXgrbIV23VYVqu5xVQnPP7pEfDr3
         F0TVltvzonKVVmL3nsrdDn3RSsJRhXgcSkbP3iF5cR52rxUNb19SvxdSj5c9vmUVt0Ni
         cpjsWs7zIBaCTbQpmTYCl/6cfDUbA5VuGTyHtnhcADnDG7mASEfGL2gOsgYkX36dmv2s
         oJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744625518; x=1745230318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekviSgQyoe64J8uN564Y99DCC6tdD4eOX0JG1pzrNnA=;
        b=bqUF3meqtEgNalzjQDtzvfEMrP1/uCOirH4SSGhWOe9gNApS7OrntZGhEZRFq+ivbF
         mruMH91mw0Q5ZSM2zj8UrCDSKz+ILYZoSsw7o3a/8IniSC52D9LVs2qk/00f0JBPrFGg
         NZ8R6B5vUj1Dhfiy6cw1tiHmu1DlIFFdD+jfLWMubf6lRoQWmUtw11kpKVKrElyCgZdl
         DlmUqutyuqMe279FqBkE85ErA+WhY4+jw1nI0BPYUbM98019JYqs0XtIHpHtmCdNjmfd
         u1htJp5rS4CWm2sNrrh9irW/wzFgDfPGkibOn9eGwFHjE5CKb7R5T9jTgvZOZQCVIMEa
         G1Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVDEIuJrK4z3jMV1WihtYst805ZWm62AJzzVJwFcKxO4wCrOiAulrUpLrJx4kNQDJfow14HnyWWT3zBTec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwynXRqjx5mMsTiw5MTLRXAa64XLYqLavvYuACk0f7FzLKF49E1
	jKmaX8R3EfunIt7ul4D+6hhrr/KZ4Ka7qRLFtC9U/lBD6OyiQaYzMvwA++C+ki9EeFpILsnKEnZ
	CjO8=
X-Gm-Gg: ASbGnct8Qj0w0P/jM+XtCn7RI97NHB48vQQrpbkUOa1Lcx1lnKnjD0CisB8vwFmLT6P
	DbO1d73nVCgzgzSZbMopxPor6Pa7Y3WcGeloYYIM78VKtr2Gse2aVF22tV0lNEpN4Dy/gbzU69l
	il1itTtqltO+NtJmzVUz67i9B/AKGTOCyOjd5L8yxVcMf+smtt0LcMbq6D1X8p52adVl4mV63fn
	dR12p7rmRufodlY2o2sO4ANcpsKqEEaf+UOH7zfjDPIaKYSrlVHb4RrUWngbqU8vJmWhI6tInPm
	1vQ0ndiSa+m5KRbXeo3dSslmT/78
X-Google-Smtp-Source: AGHT+IEq//Hd1trRvrPxeUyigXnYgKOvmpOmIQ7XVfTMtJYZ1CwhBQqistVDNwlAJ+Bgo1zIZ/GJzw==
X-Received: by 2002:a05:6000:184d:b0:39c:2264:fb22 with SMTP id ffacd0b85a97d-39eaaecda4amr9351240f8f.46.1744625518276;
        Mon, 14 Apr 2025 03:11:58 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96c70csm10678636f8f.38.2025.04.14.03.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 03:11:57 -0700 (PDT)
Date: Mon, 14 Apr 2025 12:11:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kernel test robot <lkp@intel.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: arch/riscv/lib/strncmp.S:11: Error: unrecognized opcode
 `__alternative_cfg("nop", "j strncmp_zbb",0,30,'
Message-ID: <20250414-5f143a94fdabfdef0191de46@orel>
References: <202504130710.3IKz6Ibs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504130710.3IKz6Ibs-lkp@intel.com>

On Sun, Apr 13, 2025 at 07:18:45AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b676ac484f847bbe5c7d29603f41475b64fefe55
> commit: 9343aaba1f256ff42730db5a61efc32a86149776 RISC-V: separate Zbb optimisations requiring and not requiring toolchain support
> date:   4 weeks ago
> config: riscv-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130710.3IKz6Ibs-lkp@intel.com/config)
> compiler: riscv32-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130710.3IKz6Ibs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504130710.3IKz6Ibs-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arch/riscv/lib/strncmp.S: Assembler messages:
> >> arch/riscv/lib/strncmp.S:11: Error: unrecognized opcode `__alternative_cfg("nop", "j strncmp_zbb",0,30,'
> >> arch/riscv/lib/strncmp.S:12: Error: junk at end of line, first unrecognized character is `0'
> --
>    arch/riscv/lib/strlen.S: Assembler messages:
> >> arch/riscv/lib/strlen.S:11: Error: unrecognized opcode `__alternative_cfg("nop", "j strlen_zbb",0,30,'
> >> arch/riscv/lib/strlen.S:12: Error: junk at end of line, first unrecognized character is `0'
> --
>    arch/riscv/lib/strcmp.S: Assembler messages:
> >> arch/riscv/lib/strcmp.S:11: Error: unrecognized opcode `__alternative_cfg("nop", "j strcmp_zbb",0,30,'
> >> arch/riscv/lib/strcmp.S:12: Error: junk at end of line, first unrecognized character is `0'
>

We're missing __ALTERNATIVE_CFG() for !RISCV_ALTERNATIVE && __ASSEMBLY__
and I see some other missing/broken macros on the !RISCV_ALTERNATIVE side.
I'll send a patch.

Thanks,
drew
