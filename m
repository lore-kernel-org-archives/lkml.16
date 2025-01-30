Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CE318FDC5
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227025; cv=none; b=GJ4ZD/Red8j8f3z8clm0ldlV8u174ersGaelsUEUozZMjLMoFDszgDEfCWIafZ0HXD7BeJ0ocl8i6wYBLce1mtJsWbLtxH32hWlA/mK97CNvNGYBmqLO254bpci629BuKBTgV2yI4P78eWBhjRBhG++q0J7Gm1+ALah66IM7q0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227025; c=relaxed/simple;
	bh=l1Opr4boPN/nyhUljDuiqObrJzE1y9lh35ZzM12FkRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elrf0E1gdMFVBRizSr3QAEAJmYzFNgzfsbfl4cOWb+u/BCK+cR8jdy42FOr4aOi58cyxxi41C427DycVBW7b9zj8V7Q46vF4A3RhpjgTzPoKkkXWH2GJNtX6HFVmSaE2EeIv7oAFIOWrczi+kcEqSTrCj2u5upG+ZGOw3RBEVmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=AZ/SH9Fs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="AZ/SH9Fs"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a88ba968aso439868f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738227022; x=1738831822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dsy4uJKogIVKQPzs6Ct+upQYMgDG3MEIF1C0cRa7EYs=;
        b=AZ/SH9Fs7Hq/0uP9Dh9LYDXT7K+IPXR8zaLbhyMJ5SmBTvXEwxhPRfs8rn0wEsoW2b
         voSClV7a/1Hld8V/Bayzl5om6U+Vm1b12e6OhgpoJURQuTvLih0VeglOwk7WOkm5mZCD
         f2LuiwYFvK6VRa2p39Nm77OdQFqDK7PyU33T1JvQwbF9sbQ469xvlBpIy4y8thnCatTA
         xwoxLx+pQG8sK6f4AWRYf5yf+c7tiG9GUTwjWg5zlhDEOTCgjjO1Ga10/7BKWrGqc3F3
         PKht9Lt/5cruh1JZ2IQz7NS7ueI1MDhpJkzdQJY77xucrIFnjXLgiHe3jTylqudVYTME
         UPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738227022; x=1738831822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dsy4uJKogIVKQPzs6Ct+upQYMgDG3MEIF1C0cRa7EYs=;
        b=huF5RmSzUy0Cg5TKpyCOj+f9V1Beyn244FHcfLmsMW/6zy2JBLfvq1PGK3cFMpUrZY
         RbjuALCdK6P7hJGdh0XD94xqNls2eAB51z3M2iDoC1g8hQCKMDEpeMpGi9KCCzmQDWa6
         lwxQhkLDtLsDWRkqo3FNmzFf1K2Gcy4qbX2WPG7KeYvaf5ljmnfs73+QdZ0HrO3z2byH
         iQ/HTMBOGyfotiwkKoM3aXdo0Hcb4PYgd7eUu/utvxq/izqgmVK8sYllcl72Fcr0oDJs
         1doUfpnlsIwMZMbTGn4kPrr4mN+j1s3F44+UVwtLb6zSqgANigSIVhS66bb6uLlhjMHT
         AXtA==
X-Forwarded-Encrypted: i=1; AJvYcCWNkFWTd6t3WkfkcPuHeJgkIxYZZ1cozpXotgBDSwXzpCesoYAjcILbvUuxJcD68C1LomOyZbt/CvIB/F4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3dwbY2PCZXafaGHpTUXYreXpj4GBVu3FgNd8r0J5kJn6YW7ys
	5kkIbCgxcf6GEaHeHTW6/U/AT5X+eCRr6h3+hD+h7+exwG8OgPHaFFf8ld+f5aI=
X-Gm-Gg: ASbGnctKZ+EpJm2ew3ch3wSO56ewZbHFKnLzW0pLD7Xti/jijwRSd+fil6h7lY9mp4+
	i3ad6Lz9wNvjVF7gNI8w84S/Qz4R9mrOhPgd05s4lgfwNrC66Y33fq5zwfhBkLbl4POo237OJG2
	tt2xar1yKazd+MH9EpBX6h3y03kQkjZu2s3ZG+KBUGF1RXcHhkd3vgpnJltpBTiGSl+NgRH1lYN
	/ohj1SGFDrwOSMqL384ZHJLriVbquAWbXnkrAjLnfoAoNJN3lvWrtcmsHALYUUsr/uqemJGOacq
	S28=
X-Google-Smtp-Source: AGHT+IGFTRL2KbdYIq3lZmW40A2vF/C6ptAw5dWdjhbhxqUZ/ka0NH0NQk5FJYnWzTdk9Dk9H8tYmQ==
X-Received: by 2002:a5d:47cd:0:b0:385:e88a:7037 with SMTP id ffacd0b85a97d-38c51939740mr5747204f8f.6.1738227021805;
        Thu, 30 Jan 2025 00:50:21 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::76fd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec7e6sm1332565f8f.19.2025.01.30.00.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 00:50:21 -0800 (PST)
Date: Thu, 30 Jan 2025 09:50:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Chin Yik Ming <yikming2222@gmail.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, charlie@rivosinc.com, samuel.holland@sifive.com, 
	cleger@rivosinc.com, andybnac@gmail.com, alexghiti@rivosinc.com, 
	peterlin@andestech.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Simplify base extension checks and direct boolean
 return
Message-ID: <20250130-77bf6cf799f468b43fb5382e@orel>
References: <20250129203843.1136838-1-yikming2222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129203843.1136838-1-yikming2222@gmail.com>

On Thu, Jan 30, 2025 at 04:38:43AM +0800, Chin Yik Ming wrote:
> Reduce three lines checking to single line using a ternary conditional
> expression for getting the base extension word. In addition, the
> test_bit macro function already return a boolean which matches the
> return type of the caller, so directly return the result of the test_bit
> macro function.
> 
> Signed-off-by: Chin Yik Ming <yikming2222@gmail.com>
> ---
>  arch/riscv/kernel/cpufeature.c        | 6 ++----
>  arch/riscv/kernel/vendor_extensions.c | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index c0916ed318c2..32525b69ab99 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -49,9 +49,7 @@ struct riscv_isainfo hart_isa[NR_CPUS];
>   */
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap)
>  {
> -	if (!isa_bitmap)
> -		return riscv_isa[0];
> -	return isa_bitmap[0];
> +	return !isa_bitmap ? riscv_isa[0] : isa_bitmap[0];
>  }
>  EXPORT_SYMBOL_GPL(riscv_isa_extension_base);
>  
> @@ -72,7 +70,7 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
>  	if (bit >= RISCV_ISA_EXT_MAX)
>  		return false;
>  
> -	return test_bit(bit, bmap) ? true : false;
> +	return test_bit(bit, bmap);
>  }
>  EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
>  
> diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
> index a8126d118341..62f55bc779e9 100644
> --- a/arch/riscv/kernel/vendor_extensions.c
> +++ b/arch/riscv/kernel/vendor_extensions.c
> @@ -51,6 +51,6 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
>  	if (bit >= RISCV_ISA_VENDOR_EXT_MAX)
>  		return false;
>  
> -	return test_bit(bit, bmap->isa) ? true : false;
> +	return test_bit(bit, bmap->isa);
>  }
>  EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);
> -- 
> 2.34.1
>

Since the changes are harmless and I do prefer the way the code looks
with them,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

but these types of changes are pretty much just pointless churn...

Thanks,
drew

