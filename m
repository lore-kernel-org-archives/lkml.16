Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1EA2798ED
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746725267; cv=none; b=uDB2bj8UOEIyGAfAkM+iDBTPcGk+1iQFsEVXrWy4txq4BMVjebZ600ROpEl3HcL0urUOBIEL/bKNdphWDZwrknX3nYPetmJPcn2nTIZcZwQ6subGzObDYlWcIn/Ay9kuxisN0rMnCBjBrWxvNors+7Eb1B+5841v/hIMBYlKzxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746725267; c=relaxed/simple;
	bh=q/CVHbtrD8LFRt1M96CaOtCC7rahkGPa+7NR+zudvWM=;
	h=Date:Subject:In-Reply-To:Message-ID:Mime-Version:Content-Type:CC:
	 From:To; b=hMr7LHdSi8cTtxQL8BOKhH5n0qwwPzBTD1gUbY+ix0fV0qr/bHWNmbtryB5YlGMEELtadfuy7PUOKSpApjwtvFD78EwaxUDGcc8w9jR8yNQ7lPExIM2QWkeE+Q9/ppvC+V/giyCrmFjRbMArfuVw6Dq8YdWnRAqCxFO+8Wt9tjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=zlBPdRm0; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="zlBPdRm0"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af523f4511fso1003612a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746725263; x=1747330063; darn=vger.kernel.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lj7cyiQKL5aop0XuhE8HLNECrq0rmmRNxk3ltC9EqP0=;
        b=zlBPdRm0Xy2B+i4CQI9NEJOcUgHVuynnxrEAfsgsHE+tKcy3z5uHE/h8Vxb7Pzz17Z
         WrFB0eYdChreqVMSOS5+3yHY9sxGisjOaP2Q9ztGXlQUrKnHB9pqEL9nf6lFZuAShVU0
         AwZZdj/Bbi40uRB5vLBYBa+JobC+AJ8FwQX2wczT1FkEolqyWUp7g0bpEWDmri5+578X
         AndLujC1myGVB9rKqiDc43+P2BoOgpe3sW+iv+rsqjtADOan+iuLVLJOf1tI6vg6jC0P
         VgbRRdgxSCIVnVdYT1qdIddjAOWV3fMSGJFCONEXUCN+bDrHGw7tTe97ic3J5PQ0v09e
         3EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746725263; x=1747330063;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lj7cyiQKL5aop0XuhE8HLNECrq0rmmRNxk3ltC9EqP0=;
        b=YDC6BjU7K8AX/DOCRUe/z46e58BzHabCReRozNqNp32Popucvp5Nru7IQ6pMUH8hJi
         TxO1r4Bug2+odhS9g6RIkTcn2gQsdtH6IMLXHwMG9rO6Cix6wHO1cXaDFTl2WCWd7JuI
         lO3A6HNY6NcxfVOpnZA5M8h0eK7edBsWo/OaUmndInpRDx0OTH4gFkTc1FWuFTlQyks3
         Me6N5R0e0TAjcliN85RXg4t+6gYma1qNDBwPnkQfd7OVghkCBxJEP9LaTKzsly4e5a7e
         RZ7Gg8pYtj4jDZOiJgbwxJ3K0SbmlLn6pQ3Lhf8O2IWFGgwYufS07v7K/autVM83ddEt
         ZuYg==
X-Forwarded-Encrypted: i=1; AJvYcCW/myvlom9I5SChCpiPKTvuoTd6JMeoUWyTD/Gw2FqXI/6jT7kzv1R3KFC5VsSoFyya5NdkbSeTlPzL8fc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/KgW/enpJoJmiPV9WPw9rOMy0PiUYZff5V/n22NHPDIqskUM8
	mEQUJnmgc7kJp0waPHtZTGOa4ABcB6WFIijD7DRcyfuR4rogeYgVoHrzSxp+xmU=
X-Gm-Gg: ASbGnct9lWofAtiZbKCoRZejStSZZGPgiyLZjqKXsnf92heAcf9gq9Qxh30jRKv4c2o
	Fecxb68f5/ObkByHc4n78q+GikXI3KiVmwlmVcvo3K78GOO56UW8mPrgoCLvLqXRsmKcY1HlD0a
	MHp0FEVk2f+bYeVi9TQKJLdY8qwKE8T3FKy/VkbRszrWKwpvIksmXAbFk4x8FJxWBcyLo4pxwLf
	jRbATV7lGtDaP5DdQebl95Y35tvffyUpmtvhnH2IIBNwlCxhYt10M1g3wenDJEuZ0IlddbtNy72
	xIfw+EAvjyK1ZpLxFPLZT4XxaeEs0znKZQ==
X-Google-Smtp-Source: AGHT+IEYd58LeJ0u1CUxMuwZxbkluf8OhO7J3QPqaVyoyBSF/i0V/aUwiGK86VABZzmA4Z6qekYbEw==
X-Received: by 2002:a17:902:d54a:b0:224:26f5:9c1e with SMTP id d9443c01a7336-22fc8b3e307mr2450145ad.2.1746725263193;
        Thu, 08 May 2025 10:27:43 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7741515sm2031635ad.95.2025.05.08.10.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:27:42 -0700 (PDT)
Date: Thu, 08 May 2025 10:27:42 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:26:58 PDT (-0700)
Subject:     Re: [PATCH v6 11/14] RISC-V: KVM: add SBI extension init()/deinit() functions
In-Reply-To: <20250424173204.1948385-12-cleger@rivosinc.com>
Message-ID: <mhng-0c7b576b-882d-4020-996d-adb1b2bbcc4b@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
CC: cleger@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
  anup@brainfault.org, atishp@atishpatra.org, shuah@kernel.org, corbet@lwn.net,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
  kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, cleger@rivosinc.com,
  samuel.holland@sifive.com, ajones@ventanamicro.com, debug@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org, Atish Patra <atishp@rivosinc.com>

On Thu, 24 Apr 2025 10:31:58 PDT (-0700), cleger@rivosinc.com wrote:
> The FWFT SBI extension will need to dynamically allocate memory and do
> init time specific initialization. Add an init/deinit callbacks that
> allows to do so.
>
> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  9 +++++++++
>  arch/riscv/kvm/vcpu.c                 |  2 ++
>  arch/riscv/kvm/vcpu_sbi.c             | 26 ++++++++++++++++++++++++++
>  3 files changed, 37 insertions(+)

There's 4 KVM patches in here without an Ack from Atish or Anup.  
They're all tied up in the SBIv3 stuff, so just LMK if you want me to 
take them into that staging branch or if you want me to wait.

For now I'm going to go look at other stuff, no rush on my end.

>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> index 4ed6203cdd30..bcb90757b149 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -49,6 +49,14 @@ struct kvm_vcpu_sbi_extension {
>
>  	/* Extension specific probe function */
>  	unsigned long (*probe)(struct kvm_vcpu *vcpu);
> +
> +	/*
> +	 * Init/deinit function called once during VCPU init/destroy. These
> +	 * might be use if the SBI extensions need to allocate or do specific
> +	 * init time only configuration.
> +	 */
> +	int (*init)(struct kvm_vcpu *vcpu);
> +	void (*deinit)(struct kvm_vcpu *vcpu);
>  };
>
>  void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
> @@ -69,6 +77,7 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
>  bool riscv_vcpu_supports_sbi_ext(struct kvm_vcpu *vcpu, int idx);
>  int kvm_riscv_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run);
>  void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu);
>
>  int kvm_riscv_vcpu_get_reg_sbi_sta(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  				   unsigned long *reg_val);
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 60d684c76c58..877bcc85c067 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -185,6 +185,8 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
>
>  void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
>  {
> +	kvm_riscv_vcpu_sbi_deinit(vcpu);
> +
>  	/* Cleanup VCPU AIA context */
>  	kvm_riscv_vcpu_aia_deinit(vcpu);
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index d1c83a77735e..3139f171c20f 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -508,5 +508,31 @@ void kvm_riscv_vcpu_sbi_init(struct kvm_vcpu *vcpu)
>  		scontext->ext_status[idx] = ext->default_disabled ?
>  					KVM_RISCV_SBI_EXT_STATUS_DISABLED :
>  					KVM_RISCV_SBI_EXT_STATUS_ENABLED;
> +
> +		if (ext->init && ext->init(vcpu) != 0)
> +			scontext->ext_status[idx] = KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE;
> +	}
> +}
> +
> +void kvm_riscv_vcpu_sbi_deinit(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
> +	const struct kvm_riscv_sbi_extension_entry *entry;
> +	const struct kvm_vcpu_sbi_extension *ext;
> +	int idx, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sbi_ext); i++) {
> +		entry = &sbi_ext[i];
> +		ext = entry->ext_ptr;
> +		idx = entry->ext_idx;
> +
> +		if (idx < 0 || idx >= ARRAY_SIZE(scontext->ext_status))
> +			continue;
> +
> +		if (scontext->ext_status[idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE ||
> +		    !ext->deinit)
> +			continue;
> +
> +		ext->deinit(vcpu);
>  	}
>  }
