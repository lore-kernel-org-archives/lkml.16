Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514F71E51D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745492455; cv=none; b=Dz8fdTPd+zsx800sZJs4/c0IwplwAaQUrBOJUyzu/QGFrizs49zZgKkMjQC7oglzd/0qmoLiG+mCxwAVHzbCIgtg4feDDhTDrNIV7kv+QwmpyU2lE1+TW2qbRktZ1MC7RRGnqtzTsI7gwVaP8jHtU5OVNl/AGkv51QUVHz4JOto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745492455; c=relaxed/simple;
	bh=ilVhurOAgxRINQp4J4plZnQ/Sve+oq9bjuZtm3BKBho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvC/6QPzI8D2uGEGLKZBk+6PWGQIXS7t4jaMO8B0CBDSMbcMmeDYlzRkr0J0wAjQnqZs3Po+TA0prftS7EcB4CHWx/RF+J2fXddDdMlA6Ir7dJXf40ObgAi2tJjP0ypZ/tPZ+qe5Ymll5AmEoU/iwKQ5gSzRfqTBsr3Il5OfZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Efqg4ej0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Efqg4ej0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so8124565e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745492451; x=1746097251; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zHHJnHHyOrnNtHHA6vr6DrZ0IO7tPD+NYSLx8YKZu70=;
        b=Efqg4ej0lfczL7FUZMe+hb4klNfVw/eDNsSA+9s0AdXbElMqmfSag5n8/TalQ4w67U
         rYN0sFThg8wrStkkiUfwGCTGnU6FCTOK27qaeiA5YrPR1prbXomZx3wkyWFhhULs6p+s
         e+rDC7xWWv5L8pP0W2VgLErtPHmcCWM89Av8+km5aujoYhqgM5pDHkZcHMlV1CRGzMct
         o824a2B4a24tvH/2Z6ozeTJbefOZ4O6ACD+9hCcd20FUkvOnS5gIhuCu6ob2/Npc8G3u
         5rjNFcXH3GTFfIMZw3F38cnncuzVp0g+eM3lKdBqPJhljMeoFyhvG1snvHKaWPaYAmaX
         nFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745492451; x=1746097251;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zHHJnHHyOrnNtHHA6vr6DrZ0IO7tPD+NYSLx8YKZu70=;
        b=RxB7f+7I8A1/WWIJ6/keUSEBlfIPnays9KVrWaeQomS2fUzTBgeM0M5Mcz7+/YdmpO
         uv0Qgi5pXz5qO8O+bkusYmEJMM7dwqn+PxDpvbmRwwzZwQLurHh3SruSIpw1UJoWMnZ4
         d3nwyQf3PMIqKSteLky0VAspk23VyGQ+t0qi4I8SB71E0Wbj1SapRrRg1KD6Y/OXIURH
         IsQW7IK4pgRCS62bDUPxMuWCV/VOdtK7sTvYM9OoUeOE7RMc5Vm/t67tVhg6oTqaCky2
         ZahjwwBJ7+ctooJfm6tanwgj7X4KrnOCmWCPbsDIPTQQtzqEAY/x7IxIfXQ+rkeyNXqL
         5EIg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Lagi5a2H2dL2q+izZqbh4d4F34CiQDrGVXXgB+q30q/TzP4L5Y1QwGADwHykrWONU282VIfbtIe+3/4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4VlyJpe79iVholg59QeRoqIlg6p3gvM9RZRecS8ZHnWlnls9f
	VlW8UZOVqj23eFHt143tsbmkJskJt9ny0W0kI6YUMz2uomrk5+cd8WWQroGl3rM=
X-Gm-Gg: ASbGnctk5yUtf2/xASAKUYbc2SWD+QurSTvr+fVOA7TmdqIXr2RFUWqxeWCmNJObJET
	NDa2gWiidSA2/IcVrOcKRtGQojs5wphsNixqEkPKnaZJlFsDbjLN0MtB/5hJh7dFvzOFUQfRH5A
	DfSv3swIOAb+nL6DAoWZsjyFqGa4uxTdYNrBMl7ncF6N8d1kRD6V8At8v/qKYvAIUIhY3mnj1Uv
	7rLPC40mNTad38Z7grvpyBIuQxoPawdqlWpT4AnGU+ERoNP8h5ZnLNBNtbY5wcRR7bZPDP7kBlK
	ZDiWhm9eIs2c4U0VengdrDysvKQxPamROG3jQYU=
X-Google-Smtp-Source: AGHT+IGP6Ut82q/OqGuYzCaYu8ri2NvYSY5EYxmJ9hg0Kbk3eysivoE/mXbwZrGhC5aaW7QaraDYhg==
X-Received: by 2002:a05:600c:3b9a:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-4409bd8a761mr17964535e9.30.1745492451468;
        Thu, 24 Apr 2025 04:00:51 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8479sm16884645e9.29.2025.04.24.04.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 04:00:51 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:00:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
Message-ID: <20250424-c85c9d2f189fe4470038b519@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417122337.547969-4-cleger@rivosinc.com>

On Thu, Apr 17, 2025 at 02:19:50PM +0200, Clément Léger wrote:
> This SBI extensions enables supervisor mode to control feature that are
> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> DTE, etc). Add an interface to set local features for a specific cpu
> mask as well as for the online cpu mask.
> 
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/sbi.h | 17 +++++++++++
>  arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 7ec249fea880..c8eab315c80e 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
>  				unsigned long asid);
>  long sbi_probe_extension(int ext);
>  
> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
> +			       unsigned long value, unsigned long flags);

I'm confused by the naming that includes 'local' and 'cpumask' together
and...

> +/**
> + * sbi_fwft_local_set() - Set a feature on all online cpus
> + * @feature: The feature to be set
> + * @value: The feature value to be set
> + * @flags: FWFT feature set flags
> + *
> + * Return: 0 on success, appropriate linux error code otherwise.
> + */
> +static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
> +				     unsigned long flags)
> +{
> +	return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value, flags);

...that something named with just 'local' is applied to all online cpus.
I've always considered 'local' functions to only affect the calling cpu.

Thanks,
drew
