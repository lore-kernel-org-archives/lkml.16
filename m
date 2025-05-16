Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AA723C50B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399155; cv=none; b=BscZynz020I5CF7tUIU5LmggB9dwoRKydl3YjFHGfGBM8UGd7+NGMi8FLbp2cvRu4XGhlZ28QygNrFSOOkKK6HsRB653HGq5tpCkfrNd5fuLWDVIgoYli/+okcIlVdRZQtnXRpG/NXRXec4+isUkKX2L15scjGUdUWoJo3S2JTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399155; c=relaxed/simple;
	bh=EJwk/S74Tk8TsCRaHdTbe0SsIDSdi41vlf8wb2CeuBA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=guEMPBeReKy0CZez1KwzURWSM0jf26PCDgAHf8ihuzmcCLM2V8simqhWDmcvpfImQ9TX4tTflpfIeAFMqMGn0K3MV5OOLan3n8oGGYnUcTpPGON8P3k3QJfqS5PgSt6AwQA1tJ29H7h9qKT2Vwt/lr7g3CfGPVzJ7e9pcDdvaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Qt/ouTEV; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Qt/ouTEV"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad51ba0af48so286922666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747399150; x=1748003950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7oP/zLljTZnogybPTM7wMGdNzWkdEVn7QUgHEuDqyw=;
        b=Qt/ouTEVLJDsHQ9aQJ3monBHWNLyVJTQHLcYS8FPvlnRdtdrRNNo/lUwrHdLggSrkW
         MJ+b94Ly1n5d7TWn8Wzr3L5ZhLA0XeNEWdRe6tWUVg7Evr8EMFTKBi1ZXxerUHQJJJrL
         xe/exjxZsZTSuYzosqot1huz+xrqUIgoZjV1A89+/a93ScE9jFeyI3P1GedxjcNTvN5t
         px+4yOWUzff90Pm8XJlrTV9NSZjVCT1ZAAUzc0/Nhq65efj9q3JUMX8qYrklmXNjn15J
         +6AtTKSBaViyM5F1+71Q8GrPve6d3rVOjHz2ZQiVjWCLRbCHh5UMSSDGQvHG8n+IPi0w
         auqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399150; x=1748003950;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b7oP/zLljTZnogybPTM7wMGdNzWkdEVn7QUgHEuDqyw=;
        b=hbbWrQm3UTFtnaCPXm9rNcwxoqlzsTL4KbuDxDOJxpw0b2THv8O1TXl+K9Tgu4RWG6
         bzOOtZL3RIDIurgXgwXZMEg7lxuAujFpGrZa+lIPUsb+66SSYrakTXjopFArXb6S3AwD
         /BG3WpWdXV9A3esxjbO4tSQ7DAJC98QfTuwmJrBaqvzrHSrlyQB9JFnvg5sbxTyhP9KL
         3swXH4vaz5wg8THHLFbSftfvT6GiKZ6wqeeH1r0LrSNEvCPJv9rJUy4ZrM6m3bJh5WPh
         OcovI2eEBhvHzmOkN7lLGYi5X9j+GxLgEYFicbA2xCWCvtAH2kEh4p5IoI70/wmcePVS
         f5ow==
X-Forwarded-Encrypted: i=1; AJvYcCWxHd9ztFNqtoMj6ipmnRzM41t/pi2eCbEvpEhLM151lwR5kNw8Q0lpPNESEyaCtn6d7MkBcU2TWGDL4yM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxftVnwE1pWrMSBkg/3JgxZmEODaBKUBxZVxP3x7c7AAh1nUAp3
	cEh4hMiyic26GEKPZsXZVJLfzPKuYObnudMpyjGqLdQfv8/xi3/BoJn4EWkh/uMxxek=
X-Gm-Gg: ASbGnct/TWpFQPe8wKealQq4lt4JyxQheVbutlEHEGCdArp2+nasUa5KdxPYlSyuQVK
	80OlLOE/OeTJglf2ECuWvRpzAwMKoP7S7HgSjr3BNE449bsNSN91twy7UjTsJmat9yunpvwGOck
	TyX60uEm2spCCZnykN+s0w4DJADlcsb5+YzeAT7BcwFkDviZAzDhYUli4tD5/V8GyFjqBkIa006
	elpAyHN6xQlDFK0qBE+boIWUnkqXB1Jt2bTcWMIrY6GJ3TWcTl7crc+RVC4lvDjzvEFqkkZunGu
	pRSu3YvF02+1OGLxZVRZRRYISIaHMcqGRCQu85JtnykYHR3o4FcywXofdA==
X-Google-Smtp-Source: AGHT+IEIP3JUo4/gXsU3fbvKdiE+stLoARyyOdwaLPtOpDK0xW0RFEgVI9pNgG5UTxsDu4I2grbQIg==
X-Received: by 2002:a17:907:3fa0:b0:ad4:f5f1:28cf with SMTP id a640c23a62f3a-ad50f82067fmr632543466b.25.1747399150339;
        Fri, 16 May 2025 05:39:10 -0700 (PDT)
Received: from ?IPv6:::1? ([2a00:11b1:101e:447e:2959:9e3d:ac05:c19d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4383a6sm153554466b.120.2025.05.16.05.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:39:09 -0700 (PDT)
Date: Fri, 16 May 2025 14:39:06 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>
CC: Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] RISC-V: KVM: Remove scounteren initialization
In-Reply-To: <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
References: <20250515-fix_scounteren_vs-v3-1-729dc088943e@rivosinc.com> <CAAhSdy38s0WWc7Cv4KF+0_pGC3xKU3_PLgeedz7Pu04-xKm4jw@mail.gmail.com>
Message-ID: <70DD7215-76A0-493C-87CA-60A605842B44@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 16, 2025 2:18:18 PM GMT+02:00, Anup Patel <anup@brainfault=2Eorg> wr=
ote:
>On Fri, May 16, 2025 at 4:41=E2=80=AFAM Atish Patra <atishp@rivosinc=2Eco=
m> wrote:
>>
>> Scounteren CSR controls the direct access the hpmcounters and cycle/
>> instret/time from the userspace=2E It's the supervisor's responsibility
>> to set it up correctly for it's user space=2E They hypervisor doesn't
>> need to decide the policy on behalf of the supervisor=2E
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc=2Ecom>
>> ---
>> Changes in v3:
>> - Removed the redundant declaration
>> - Link to v2: https://lore=2Ekernel=2Eorg/r/20250515-fix_scounteren_vs-=
v2-1-1fd8dc0693e8@rivosinc=2Ecom
>>
>> Changes in v2:
>> - Remove the scounteren initialization instead of just setting the TM b=
it=2E
>> - Link to v1: https://lore=2Ekernel=2Eorg/r/20250513-fix_scounteren_vs-=
v1-1-c1f52af93c79@rivosinc=2Ecom
>> ---
>>  arch/riscv/kvm/vcpu=2Ec | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/arch/riscv/kvm/vcpu=2Ec b/arch/riscv/kvm/vcpu=2Ec
>> index 60d684c76c58=2E=2E9bfaae9a11ea 100644
>> --- a/arch/riscv/kvm/vcpu=2Ec
>> +++ b/arch/riscv/kvm/vcpu=2Ec
>> @@ -111,7 +111,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>>  {
>>         int rc;
>>         struct kvm_cpu_context *cntx;
>> -       struct kvm_vcpu_csr *reset_csr =3D &vcpu->arch=2Eguest_reset_cs=
r;
>>
>>         spin_lock_init(&vcpu->arch=2Emp_state_lock);
>>
>> @@ -146,9 +145,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>>         if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
>>                 return -ENOMEM;
>>
>> -       /* By default, make CY, TM, and IR counters accessible in VU mo=
de */
>> -       reset_csr->scounteren =3D 0x7;
>> -
>>         /* Setup VCPU timer */
>>         kvm_riscv_vcpu_timer_init(vcpu);
>>
>>
>> ---
>> base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
>> change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
>> --
>
>Overall, this looks good=2E
>
>Reviewed-by: Anup Patel <anup@brainfault=2Eorg>
>
>Currently, the scounteren=2ETM bit is only set by the Linux SBI PMU
>driver but KVM RISC-V only provides SBI PMU for guest when
>Sscofpmf is available in host so we need the below hunk to
>completely get rid-off scounteren initialization in KVM RISC-V=2E
>
>diff --git a/arch/riscv/kernel/head=2ES b/arch/riscv/kernel/head=2ES
>index 356d5397b2a2=2E=2Ebdf3352acf4c 100644
>--- a/arch/riscv/kernel/head=2ES
>+++ b/arch/riscv/kernel/head=2ES
>@@ -131,6 +131,12 @@ secondary_start_sbi:
>     csrw CSR_IE, zero
>     csrw CSR_IP, zero
>
>+#ifndef CONFIG_RISCV_M_MODE
>+    /* Enable time CSR */
>+    li t0, 0x2
>+    csrw CSR_SCOUNTEREN, t0
>+#endif
>+
>     /* Load the global pointer */
>     load_global_pointer
>
>@@ -226,6 +232,10 @@ SYM_CODE_START(_start_kernel)
>      * to hand it to us=2E
>      */
>     csrr a0, CSR_MHARTID
>+#else
>+    /* Enable time CSR */
>+    li t0, 0x2
>+    csrw CSR_SCOUNTEREN, t0
> #endif /* CONFIG_RISCV_M_MODE */
>
>     /* Load the global pointer */
>
>I have queued this patch for Linux-6=2E16 with the above hunk squashed=2E
>
>Thanks,
>Anup
>
>--=20
>kvm-riscv mailing list
>kvm-riscv@lists=2Einfradead=2Eorg
>http://lists=2Einfradead=2Eorg/mailman/listinfo/kvm-riscv

Yup, I had planned to post something like that too, but didn't get to it=
=2E

Thanks,
drew
