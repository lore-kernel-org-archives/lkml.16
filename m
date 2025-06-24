Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B62723BE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731638; cv=none; b=V6YT38tgk3mu31OREc4hWUzfd7zMMBk+RxfOFcOVRwRy/Dd9L4TS+k2IACaiHelm2AUeGSDPY9N7zCKVAG6m7BblS8oihG8EMTTUpVrEnlPlciolOFzIQKqKVKxssY5RpTys/Gl6oZ4kcy5TU+XczVzBSn3lZ/2mbUnHA/7wBg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731638; c=relaxed/simple;
	bh=9yqAtqbkhBFFDlPUCWUGkG7qvZrNOg4bCoakzHbJjp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WauYyHEtz8kPfhCRcFtVyIBF/waAiAlroNnCpj3lMJXxx+dXuAL8wkIIMtrZXvT9tS5O8FFGdRyCHtFdKeC19wkgp8PfbUhwNYsFCIMoCNPUm7Myi4/arLEFYx0Ju51TVEs0up2KIBCANE70IicK/Cl++3BDtxy1NdpBlRM+36w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=GvosAkrr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GvosAkrr"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23649faf69fso48672775ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1750731636; x=1751336436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5YqVdeSV0yOTW+tV5vI7yosNZnx86VsTnkNJEv82NrU=;
        b=GvosAkrruC6etbvJlKHWbPVpirFRslvGuNkcJt6Oifwc5TXPsdz6nuvDtl1vnGXb67
         D2g7+UhadzcShbB9y3gUZ4zbc2PH57Be4YM9Ej+tId6PFiKK6MC0JDK3m2DO2YwsSlPg
         AGXr+qn4mkB/i7sjo7rRrGXbpb3B/oZSKb5gsQ+hkSFz1J9/D3yHHPjkCVStyFJMLw+U
         +XVjTJdNuyhpka8HUdNGpP8xE+pfcPYd8ra95GG/+ZEwTXgw+JIvtcIQDA6AWYLLCe3y
         mL2nNFgrHgCqlNb8jYN4p5fOOQqhlNINFZ/9TwJwreidZO+Nm+pRCZ+nntj6V6iIZdJA
         dZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731636; x=1751336436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5YqVdeSV0yOTW+tV5vI7yosNZnx86VsTnkNJEv82NrU=;
        b=YXaVSKzZPVsYXCVJEBYLtg0KwXbkj2ZN6S0OOufxPOi9Kg6Z4zWtFQb6FtiVRj0jnA
         VWWMe7lDxg8c+rjhH9agLoNwYc7QALQWHMBuHE1Un8bMmQJX59j0XYqNKv8S36td2Woi
         FMj3XE8o0yLQ8l06MZyNOHlSspx+HT/99Pt3Ighk9f0kwsKHA7lY8QkWA/S3MuQK6kjR
         w7vHBtgaxH/WDjG1q3iVJeiHrPF0vXhODfl4OYoKA02vaDSCzGLL5f09eOOl/5w6E7m4
         PgtO2aH6O0z7O7v+jJLVYCszj1hvHiyJbxnQkwEwU5BYOEVYRSXKlhjhjFGuj4BD4PyI
         jbYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX3mGIS2aZ/iHpCNgf+RKs4o/frz44j4PpNUsy+BEoqR/3rR9zcisn0BTW/Ci43r02UboXn1t5n23tfyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmfWUtSBhvZnsTcargIBkw3DZE+V/m5EY/b3WTmVAd6WdqC+86
	2BMoxPeTVQYRSUk4Y1fuQkUeVp4sWspoP1eRIdfsaQMSmJ9feax4eQwvEIF8YY80mbI=
X-Gm-Gg: ASbGncupIxSR9aLsJ4b5NwCBW4dpF9f2Xt9onx4pXuE783+faNGpFcKnz0eYcqvr8o6
	WeTtk35WvkB31xRcXHlOJYhcEobVp+C1NHO9BjIWfkfocMx0+9aExtP3nMcpaB8/HGi/+lM2Y07
	M1NdXCrYWDWSprDBfwUwYFutLiD3Xr2R39ONc5miqe5c4voEJVp0z3kEkUG9+hyer9ixrDLqSDg
	OFJd64IU4CiK3navYafEC962J/TsrQ2c36oDhDwVYgdw6ifZMqNg8apOlEocvRQDXTZtbI87VDu
	hXmYs1JOWQBg8wDaC/QOKV5hW8OWqqhmm8xG5cmVLIE8A2/8LH538RN/7haPIuvQ60DNafM=
X-Google-Smtp-Source: AGHT+IHyunaVzpaVTgpP8rtS1XwQGBgASYHgCt65eo0OoSZXisCWYihwbZr6I/seC4YSyVWxsSsOzA==
X-Received: by 2002:a17:903:4b07:b0:234:8eeb:d834 with SMTP id d9443c01a7336-237d97fbc8fmr238805655ad.16.1750731636356;
        Mon, 23 Jun 2025 19:20:36 -0700 (PDT)
Received: from cyan-mbp ([136.226.240.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8608efasm94216845ad.133.2025.06.23.19.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:20:35 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:20:31 +0800
From: Cyan Yang <cyan.yang@sifive.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] riscv: Fix sparse warning in vendor_extensions/sifive.c
Message-ID: <aFoLb21xklpZoOzk@cyan-mbp>
References: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-dev-alex-fix_sparse_sifive_v1-v1-1-efa3a6f93846@rivosinc.com>

Hi Alexandre,

Sorry that I missed this patch. 

I believe there is already the v2 version to fix this warning at 
https://lore.kernel.org/lkml/20250516030310.16950-1-cyan.yang@sifive.com/

Regards,
Cyan

On Fri, Jun 20, 2025 at 12:08:11PM +0000, Alexandre Ghiti wrote:
> sparse reports the following warning:
> 
> arch/riscv/kernel/vendor_extensions/sifive.c:11:33: sparse: sparse: symbol 'riscv_isa_vendor_ext_sifive' was not declared. Should it be static?
> 
> So as this struct is only used in this file, make it static.
> 
> Fixes: 2d147d77ae6e ("riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505072100.TZlEp8h1-lkp@intel.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/kernel/vendor_extensions/sifive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/vendor_extensions/sifive.c b/arch/riscv/kernel/vendor_extensions/sifive.c
> index 1411337dc1e61aba0b844902f356625048c85abc..8fcf67e8c07facd1bfdbc0e18dd9b43102f22145 100644
> --- a/arch/riscv/kernel/vendor_extensions/sifive.c
> +++ b/arch/riscv/kernel/vendor_extensions/sifive.c
> @@ -8,7 +8,7 @@
>  #include <linux/types.h>
>  
>  /* All SiFive vendor extensions supported in Linux */
> -const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
> +static const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
>  	__RISCV_ISA_EXT_DATA(xsfvfnrclipxfqf, RISCV_ISA_VENDOR_EXT_XSFVFNRCLIPXFQF),
>  	__RISCV_ISA_EXT_DATA(xsfvfwmaccqqq, RISCV_ISA_VENDOR_EXT_XSFVFWMACCQQQ),
>  	__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
> 
> ---
> base-commit: e10a0dc2d21fd742c8d6ba042a98c05815011f9d
> change-id: 20250620-dev-alex-fix_sparse_sifive_v1-4e130e7e2833
> 
> Best regards,
> -- 
> Alexandre Ghiti <alexghiti@rivosinc.com>
> 
