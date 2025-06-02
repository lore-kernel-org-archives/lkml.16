Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA8A198845
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748868090; cv=none; b=YMdUGd6ikNiJEHSA2482Q97n1wndh5KA1VZjFwuj7O+tV7wkPjnUR2Z7dziGGj1yPl9jdGiJ16AyNOqyRi9CsO/k7d1p1m3WT0snrax70+24Z+9I9/TzamyOfHIPlriJt8+UTfwF9n5jG3u/Ii/ebEH3g8dlEjQydtVRuseuMm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748868090; c=relaxed/simple;
	bh=CR7L349m+OS3VyUqo6qAPgFPKUmQtKI4Di6yyys2mMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=td3srJxRWS+NgqsyRMD3LKCzmkhgRroljnco2N+ENCIkc0XZsztOOpOmC9y+mlJASA2IaomcbSJYNEbrCQ+amDeda7nXMTCY/ZtmDZmSHsq7qR94s2n5yp0hKT6YHGL0Z9WcAuFofUoiFVNFNrUpssaLzaJs2x7jYrbnvY66N6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WUltkMQ8; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WUltkMQ8"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb39c45b4eso699765366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 05:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748868086; x=1749472886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cOT1uUpIlDGUAtvWxLjBNHNBiAYsfm0VU4h8ns1ZHp4=;
        b=WUltkMQ8GArebFBTzISXDKZFrIwnLt2Nn2xyXMWeF585I8JqflJOnXcZwHMLV3AkZO
         mC1CkIrz6Cyca08Z+brgEkAxEJDXvTZ+cOUn7a8ufHjNI/jwKcjzgnhDJ0mOLpkjttVf
         Hq38Nv2kijv9pfEQJRzRG/ZQ18GP14RpU46+/OBk74/Cynaqku3s1mqXOZanT8m53EMw
         nVx+npahtJZFqk69LqSXBTP22on/NeD3dUVX2OJOfDnVePGjP8qOKWnfdckzseHCA/zo
         p9U2MAb9X7WAxouCl/IjC6XWiyk1IlRAHogqkvLhtSFOKGYdrgN+/peGGFFYzd3lIP3J
         CR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748868086; x=1749472886;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOT1uUpIlDGUAtvWxLjBNHNBiAYsfm0VU4h8ns1ZHp4=;
        b=QJ08HsvOWEgykruFQ6GkmEez1LjgFLd6e8+XoNNKnCbaRo1F4wAY8xq60WaG6wkoWQ
         M0GbjIQ+pikt+zs+3YB/gIqpC9S+Zvbte07r+WAuWH7bPtJCCMHir4PXZtCFs0j+Nw3D
         MkQYz5GGcYK0WG12HpMr+o8dmDQUoPFyvAMrPfxO504Y9c+DjEqsv4QJMGKQ++M/+OtG
         fwOVWslmW/WHmkyA3SzwdmhIsmoMT05j85Jyg43r0+XDcoAdugcolL4u035GIrcREA1q
         +hS7jTMPCCFkhZZdlN14VRpbvJzTCPX0R65QUE2Sa14fzQqnPj6Y/VqM25ugdB5Wl0xs
         u+qw==
X-Forwarded-Encrypted: i=1; AJvYcCXvSmeE+abr7cC1R+AWAZfcFvz2uZ4+mcAmcyA2J1ZrF+pbV1Zj0RHfTcoSoqL9+mxejz7FULw5OPlUQCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGaTaBvizO4B5x6DXPW4wyq/2ndaTc9w6GODs7sTsIB4LjUDlF
	b6FvyeU5jwKLZ/pxzQsJEABwunYSqP2iwZkZe/9Zhf+Hgmyas3bgbYo6hKXUYWo7XSs=
X-Gm-Gg: ASbGnctJ1i6ZJQidckAak+KT5rhPsEwUBN/dC6j5w1coF4aygYPNcRtPLCkUSa15MmU
	QIOnRvSuJJD9YBTHn07kC9ZvJr1UcGbpCc2pkLEELWS9pZv180wIa2mCO55OWvE2Lundm5OFkId
	hdR1Gdes7567HcDt3yL1Z2f5lQCPVKgjrtZ5MyF+a7LBv6sAktJU0/+WhCcCYu+TJC+EKd5YzsS
	85ab5N5zP56Ex8/GwpGGv12t3PluM5xlFTvBubEDiAyJPqYj272Ym2Ng/BthzK9qzorxYxSs++Z
	rdmLSxwOpTKyYle7a/u5DFNbJg82YWH6bK4XyMW5Kf6vUMrF1STT3Y3n
X-Google-Smtp-Source: AGHT+IFXwbjM4oDIwmPdzscX9O1w56wIpTr8nYp+sZTHMOrRZlH4oDVSgH+zuzgjruKpjoKdW0j9fA==
X-Received: by 2002:a17:907:3e1f:b0:ad5:d7bc:6623 with SMTP id a640c23a62f3a-adb32264a08mr1256324466b.7.1748868086402;
        Mon, 02 Jun 2025 05:41:26 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb497704a5sm400208166b.83.2025.06.02.05.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 05:41:25 -0700 (PDT)
Message-ID: <f77eaadc-b458-4d3d-bf31-0fef6d9d8ca3@suse.com>
Date: Mon, 2 Jun 2025 15:41:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/32] x86/boot/e820: Clean up
 e820__setup_pci_gap()/e820_search_gap() a bit
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-21-mingo@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20250515120549.2820541-21-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/25 15:05, Ingo Molnar wrote:
> Apply misc cleanups:
> 
>   - Use a bit more readable variable names, we haven't run out of
>     underscore characters in the kernel yet.
> 
>   - s/0x400000/SZ_4M
> 
>   - s/1024*1024/SZ_1M
> 
> Suggested-by: Andy Shevchenko <andy@kernel.org>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/x86/kernel/e820.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index ee8b56605e4a..d00ca2dd20b7 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -680,7 +680,7 @@ static void __init e820__update_table_kexec(void)
>   /*
>    * Search for a gap in the E820 memory space from 0 to MAX_GAP_END (4GB).
>    */
> -static int __init e820_search_gap(unsigned long *gapstart, unsigned long *gapsize)
> +static int __init e820_search_gap(unsigned long *gap_start, unsigned long *gap_size)
>   {
>   	u64 last = MAX_GAP_END;
>   	int idx = e820_table->nr_entries;
> @@ -697,9 +697,9 @@ static int __init e820_search_gap(unsigned long *gapstart, unsigned long *gapsiz
>   		if (last > end) {
>   			unsigned long gap = last - end;
>   
> -			if (gap >= *gapsize) {
> -				*gapsize = gap;
> -				*gapstart = end;
> +			if (gap >= *gap_size) {
> +				*gap_size = gap;
> +				*gap_start = end;
>   				found = 1;
>   			}
>   		}
> @@ -719,29 +719,29 @@ static int __init e820_search_gap(unsigned long *gapstart, unsigned long *gapsiz
>    */
>   __init void e820__setup_pci_gap(void)
>   {
> -	unsigned long gapstart, gapsize;
> +	unsigned long gap_start, gap_size;
>   	int found;
>   
> -	gapsize = 0x400000;
> -	found  = e820_search_gap(&gapstart, &gapsize);
> +	gap_size = SZ_4M;
> +	found  = e820_search_gap(&gap_start, &gap_size);
>   
>   	if (!found) {
>   #ifdef CONFIG_X86_64
> -		gapstart = (max_pfn << PAGE_SHIFT) + 1024*1024;
> +		gap_start = (max_pfn << PAGE_SHIFT) + SZ_1M;
>   		pr_err("Cannot find an available gap in the 32-bit address range\n");
>   		pr_err("PCI devices with unassigned 32-bit BARs may not work!\n");
>   #else
> -		gapstart = 0x10000000;
> +		gap_start = 0x10000000;

nit: gap_start = SZ_256M;

>   #endif
>   	}
>   
>   	/*
>   	 * e820__reserve_resources_late() protects stolen RAM already:
>   	 */
> -	pci_mem_start = gapstart;
> +	pci_mem_start = gap_start;
>   
>   	pr_info("[gap %#010lx-%#010lx] available for PCI devices\n",
> -		gapstart, gapstart + gapsize - 1);
> +		gap_start, gap_start + gap_size - 1);
>   }
>   
>   /*

