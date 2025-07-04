Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E723AD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751658393; cv=none; b=QvrDOsv1moaWlCkrvLYOg7v0lKbyVVGI7+qrpdCYJWb7z/q2uoPAHtu74d2AGIgAfywAc0XochXRS2qlnbGKPVEcxxGpIwNI76tumeiMi1KiN57QsdGEZ9CItvU87C0JRPtxgij+slQJDdqVRd/iftRCSG+zH7/rTTU5Av1fFDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751658393; c=relaxed/simple;
	bh=Cz5o5jdZk1UsVK7l+hF5hjL+kmroRZbpDpggHIKg10Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAapnA78gOS8ME4ZaHxLv7EskjO/TVFvCNzSk0ore7LmvfLbd0yUe17uyzPDy0+goXnE6p9oilUsyNn6V5yV5NhIpiZdd4FVlJQf66wVoCrCITlhwRMKzP5p+AYz1eF5tsvybZEB9OREGxGkj5J0SzlEeoRURCojouXQxRheUZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=gctRnhdV; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="gctRnhdV"
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 826773F693
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 19:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751658385;
	bh=VLrA3L+1opa6K3kyWseF7FHmwqIbcBLyJ0FYSjgmPjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=gctRnhdVlghbB3tAhaQqyD2Jw04Dqq2Anf0FqhhTL2R0rE1kwIngEUNgE/nKR7Pfm
	 APUGCKEgnEGqVeuu70cHUDb4Zc8decN2mC4aHS1RGsnfcJq2nZJnN4B4Z2iKhsBnbp
	 OTQPaAUzfrC/irRNi3IXcmDqlTmylaEsl8hWlko53wdEUl9QFd8f9gaa/FvZIy9xcv
	 MIThSS7LrzFXQb9TT6qV3INxUx5JilHNq6zVgBEznctoncuUTR4MoMftckjo47IRPj
	 W22Hl75/OKogCHDIouz7w+GdrU7AHkSLsLyeTRKifbKCkX+NNyoupLt2gKz4Owrc9d
	 I78GwovhAlK6Q==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-607c91a207dso1143795a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 12:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751658385; x=1752263185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLrA3L+1opa6K3kyWseF7FHmwqIbcBLyJ0FYSjgmPjU=;
        b=fAuvvIbLRKu7VHUFl8YjbCaDB3PDY/wBxTTuPLYPNqK69Ao5IXIqAXXIiX6Zp4agfU
         l/Ksg8pK0Fmmk1Pb+A5xwT5iQSKEZMaG2o6JvZGCriKbPBfGL+vXvlrUgWy2HIPZ3Hmc
         EfjZ7j2o+rZERWaRPAqNsHCvzl7BvVNms9xzHItwVoC8O7HD1iqGYbD/oNx0D1n+lKRr
         X0ZpQ2qLScpUeTXDX/fRe0KOuBOXGeQAW30pDdoex4HrMNYTr/mSwW4SSHsp2afU+jkb
         rCDdr6iyCXVzRZe+Uq/CVG7PrXPPKJSnGDGR7Ukf7ZrW5zXyyI8qYJi7fpodEUiIC9bh
         b9VA==
X-Forwarded-Encrypted: i=1; AJvYcCWwrDORhIdIcT1QFVnYCLeimr2zvjNv1a3q6Ggb6daXTzAgP2O2mFMWaLbDuMoCqXiNjr6GakyDqs58+Ro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+uTFWLoVdCgIL611ndnDRmsyguaGcvmU5MxynHmp9jjplr8xq
	uxHTX32V2OSfF5YTDMLyV1yfztsXCQBGTncL9qyu37E2wVljcr/E9KH6SS6kClchpynxCm5yvuY
	FHGXY8tQOCFLk4FQPps83lGZekVlzZ3qgcfltU2NqwRjA7aFkeKWGpoUpBNQQ7X/lsDjcoFUQ3S
	j1cUWGrg==
X-Gm-Gg: ASbGncuqE3W5AketROFF4FHLkpegLX4DWlD1sQ0lD7JJpmcdWimAF2zR98bKoEL1dp4
	YN6m1idBjrRRDcee0skA5PAp3R0QytnB2JiYABVKPskLHTmtEDZmZdDGeOm93gqKEbUc8rX9TYe
	bS0t8eD3e/S8f3FR7jgI6X7pzqON55cu7217Vs70QObaFQDa5JAnAvN8UUksFF/2OB9mCFwC2Mi
	BqbqTgTesrNrCWh/6futDXBwnOIBCLCQInN3IAW8390pvsHpi9PyazaW63XfPDsAwkxkmt3bVQN
	Z6RJ09I4/BYoz3xclQu0VZubdUxXkp2LyU0+6FFNbUG9WKJsnQD2xNlvxWI6s3jJ1ROzQKJJFlK
	PDoK9ttthkGQ=
X-Received: by 2002:a17:906:f5a7:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae3fe78fd44mr368752266b.57.1751658384972;
        Fri, 04 Jul 2025 12:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbsxPqPhYYSbtLZBKO2k3ZdPJhfdbdyy0/f6vKPhOggzCylZPnmMjp2Q8zbaJhX5YMtK8lng==
X-Received: by 2002:a17:906:f5a7:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae3fe78fd44mr368750466b.57.1751658384601;
        Fri, 04 Jul 2025 12:46:24 -0700 (PDT)
Received: from ?IPV6:2a02:3035:6e0:a37c:f324:1674:f46a:492? ([2a02:3035:6e0:a37c:f324:1674:f46a:492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5643sm221184466b.74.2025.07.04.12.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 12:46:23 -0700 (PDT)
Message-ID: <42c6f9d7-ac1a-4f74-8b0b-ac8fb02de0b0@canonical.com>
Date: Fri, 4 Jul 2025 21:46:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RISC-V: KVM: Disable vstimecmp before exiting to
 user-space
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20250704153838.6575-1-apatel@ventanamicro.com>
 <20250704153838.6575-2-apatel@ventanamicro.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250704153838.6575-2-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.07.25 17:38, Anup Patel wrote:
> If VS-timer expires when no VCPU running on a host CPU then WFI
> executed by such host CPU will be effective NOP resulting in no
> power savings. This is as-per RISC-V Privileged specificaiton
> which says: "WFI is also required to resume execution for locally
> enabled interrupts pending at any privilege level, regardless of
> the global interrupt enable at each privilege level."
> 
> To address the above issue, vstimecmp CSR must be set to -1UL over
> here when VCPU is scheduled-out or exits to user space.
> 
> Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
> Fixes: cea8896bd936 ("RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc")
> Reported-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2112578
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Anup and Atish, thanks a lot for investigating.

I built upstream kernel 6.14.9 with the patches of this series and that 
resolved the problem reported in Launchpad bug report 2112578.

Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/kvm/vcpu_timer.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index ff672fa71fcc..85a7262115e1 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -345,8 +345,24 @@ void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
>   	/*
>   	 * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
>   	 * upon every VM exit so no need to save here.
> +	 *
> +	 * If VS-timer expires when no VCPU running on a host CPU then
> +	 * WFI executed by such host CPU will be effective NOP resulting
> +	 * in no power savings. This is because as-per RISC-V Privileged
> +	 * specificaiton: "WFI is also required to resume execution for
> +	 * locally enabled interrupts pending at any privilege level,
> +	 * regardless of the global interrupt enable at each privilege
> +	 * level."
> +	 *
> +	 * To address the above issue, vstimecmp CSR must be set to -1UL
> +	 * over here when VCPU is scheduled-out or exits to user space.
>   	 */
>   
> +	csr_write(CSR_VSTIMECMP, -1UL);
> +#if defined(CONFIG_32BIT)
> +	csr_write(CSR_VSTIMECMPH, -1UL);
> +#endif
> +
>   	/* timer should be enabled for the remaining operations */
>   	if (unlikely(!t->init_done))
>   		return;

