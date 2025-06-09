Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ABB1ACED5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749492984; cv=none; b=cBz4ufKIMkZXVovzwd8vnqoM4j+6xXtftvtgNHWWzR6f8+ZL10pUysyzrF52TfLkr6IdPHfCseadW8pmVJQpf+NOAUlCq388zvgGEdo2+56BmN3lQZGTWul+pVtUoYgy4x9FTy9RAmx12HpIAdzkVwgTNg/ZpBZFq2wEgdHgUKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749492984; c=relaxed/simple;
	bh=8vWO7A5v+6MgdxNh6sQBELz44kj7FxuJmbGyTiB7w2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ax79r657/hM0YSnrEz70alFbxE0qGtT7qMSJ45ZsJg+6ao6Cy5Kqbr9j4P4a7jwXnKjLVjW/dISJBK0p0QbAHFSvKcZsOXCy2IQOOXAasJ2+VagTzMqmjLD0t9CHz8SVrt4J5mRopCm8kUseDgIV8JhWy3Po1dZ3qJ+9bQhvVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y40lXtWW; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y40lXtWW"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so1616a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 11:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749492981; x=1750097781; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYkxLjn61b2SghFSVNz+hqS3VSd2oI4dmt4pvSqHM8U=;
        b=y40lXtWWQY9qBRoNUzJl48Cx36zYDxgbLXl7wnyhDLY44q9fVDxMUau9LoSnHeKKkr
         4LU8t64Zq7/lGa22ssKrzcv3jEvyoa3EK8mD1uuR7GNG4hl7buYhy0QMlIvOKTTfHGNq
         nn6Q36MSqoskcg8WRaaLc5d1cRU4CY4xGXwes6qyXSeA+5Uq3w2399Fg8/i8IbvWQ5wD
         LGoBsMigCGrdcB+x/MZKsIo82zjOxzcaMNsof9i43EMIWeC1j3w+jLWj6FLeJ5zDtpgO
         4I6aQAHNoY76M6Xq9LVJ0cFz6M6USXxrPxquU3tH2sbOKtR6pkoGfPHgwQaEJnwk0Tjk
         ItxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749492981; x=1750097781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYkxLjn61b2SghFSVNz+hqS3VSd2oI4dmt4pvSqHM8U=;
        b=YInzXKqfNSvrH/LFDIVdLvE2GDS0OHotx4C2sbbiQkeAx40KFsCj+tgHNRhvHSli9l
         4DYR3qBq+eNuBE32BTBlTWawPFTVspcByC5SUwJtGXXCEz5EICLIfQmr3cpCBdhg8573
         0NH1lUbDAFkusHhoPOD6yDprFHVyXnBJ0F9qsAgMfRvuN5xtJrvVWm/jY/99hyx49Tz6
         1vP82e2xJ+xoGkvXil1sI7sBifHYhTCOrzt16li0EH1BSoBwHAPRPQEAWi0rEvzLAWl0
         JgJDe86bB7tVdiNE5LCufOL8qVADGkp1799Z9ryKbvqk69/XCxyaEzIOy3dzymXUe28o
         FtJw==
X-Forwarded-Encrypted: i=1; AJvYcCVeROfbO3JadsS4vqzqd9YLFwWqWyzpTmX69tJVg2dAN19FR1NkuZ3eXY6cf4aj71ry8jPS/Uw+rE9uiA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyymxT26SclYQITxpcKAfaok70lmcdhEuuMZzGqHuZSYiOwaM
	B9HUO5k1n38tpVb2yjTpJhmnnMljzAzvr0zOJA/qQY7GDs1voGRKXmV8ovAuU99vWfGWukCGTEs
	CkJ8f2QcLVGOGCEAzkkRoMbMyPxm3LRb8BEw5N3Cr
X-Gm-Gg: ASbGncvZhL3MfEDabs+PxXI/SDOqOPWEdC5pFzc7vQXdJ6YjEF4WcHqdLQ4EVcn8YnY
	4s1mo4ObfB+E39AJryjFdGqf8NCLWZ4eL292ec9Tw/yQoiuxxsPyrKUS/WXQPzIc1e5+0O+Tgje
	dP9tBdhB0zDJ8TkqRDAkUBl9AU2kI//72NvFr2ZLmYv+8=
X-Google-Smtp-Source: AGHT+IGl1GhUW5I8KeyIhe30RLYNUE0AclIq68sDRcY3/pkUWT0ma5zJRYH9NIn4KxCiDUzu5GNxbNFmNL+XbWxUW78=
X-Received: by 2002:a50:d756:0:b0:608:203f:196f with SMTP id
 4fb4d7f45d1cf-608203f1a64mr4016a12.3.1749492980731; Mon, 09 Jun 2025 11:16:20
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20211207095230.53437-1-jiangshanlai@gmail.com>
 <51bb6e75-4f0a-e544-d2e4-ff23c5aa2f49@redhat.com> <4a66adfa-fc10-4668-9986-55f6cf231988@zytor.com>
 <aEbuSmAf4aAHztwC@google.com>
In-Reply-To: <aEbuSmAf4aAHztwC@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 9 Jun 2025 11:16:08 -0700
X-Gm-Features: AX0GCFsJwyV-ZLeMzaw3jddTz_eVE6C2E36fVcqLczw7JomWy3wX466MFUhrcy4
Message-ID: <CALMp9eSA0u5+_dPA7-M4oZgqt4sv-qez4fMuZ6S5X4rUp=33xQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: X86: Raise #GP when clearing CR0_PG in 64 bit mode
To: Sean Christopherson <seanjc@google.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Lai Jiangshan <laijs@linux.alibaba.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Joerg Roedel <joro@8bytes.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 7:23=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Jun 06, 2025, H. Peter Anvin wrote:
> > On 2021-12-09 09:55, Paolo Bonzini wrote:
> > > On 12/7/21 10:52, Lai Jiangshan wrote:
> > > > From: Lai Jiangshan <laijs@linux.alibaba.com>
> > > >
> > > > In the SDM:
> > > > If the logical processor is in 64-bit mode or if CR4.PCIDE =3D 1, a=
n
> > > > attempt to clear CR0.PG causes a general-protection exception (#GP)=
.
> > > > Software should transition to compatibility mode and clear CR4.PCID=
E
> > > > before attempting to disable paging.
> > > >
> > > > Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
> > > > ---
> > > >   arch/x86/kvm/x86.c | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > > > index 00f5b2b82909..78c40ac3b197 100644
> > > > --- a/arch/x86/kvm/x86.c
> > > > +++ b/arch/x86/kvm/x86.c
> > > > @@ -906,7 +906,8 @@ int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned
> > > > long cr0)
> > > >           !load_pdptrs(vcpu, kvm_read_cr3(vcpu)))
> > > >           return 1;
> > > > -    if (!(cr0 & X86_CR0_PG) && kvm_read_cr4_bits(vcpu, X86_CR4_PCI=
DE))
> > > > +    if (!(cr0 & X86_CR0_PG) &&
> > > > +        (is_64_bit_mode(vcpu) || kvm_read_cr4_bits(vcpu,
> > > > X86_CR4_PCIDE)))
> > > >           return 1;
> > > >       static_call(kvm_x86_set_cr0)(vcpu, cr0);
> > > >

Isn't this redundant with the "if (cs_l)" check above?

> > > Queued, thanks.
> > >
> >
> > Have you actually checked to see what real CPUs do in this case?
>
> I have now, and EMR at least behaves as the SDM describes.  Why do you as=
k?
>
>
> kvm_intel: Clearing CR0.PG faulted (vector =3D 13)
>
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index f79604bc0127..f90ad464ab7e 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -8637,6 +8637,23 @@ void vmx_exit(void)
>         kvm_x86_vendor_exit();
>  }
>
> +static noinline void vmx_disable_paging(void)
> +{
> +       unsigned long cr0 =3D native_read_cr0();
> +       long vector =3D -1;
> +
> +       asm volatile("1: mov %1, %%cr0\n\t"
> +                    "   mov %2, %%cr0\n\t"
> +                    "2:"
> +                    _ASM_EXTABLE_FAULT(1b, 2b)
> +                    : "+a" (vector)
> +                    : "r" (cr0 & ~X86_CR0_PG), "r" (cr0)
> +                    : "cc", "memory" );
> +
> +       pr_warn("Clearing CR0.PG %s (vector =3D %ld)\n",
> +               vector < 0 ? "succeeded" : "faulted", vector);
> +}
> +
>  int __init vmx_init(void)
>  {
>         int r, cpu;
> @@ -8644,6 +8661,8 @@ int __init vmx_init(void)
>         if (!kvm_is_vmx_supported())
>                 return -EOPNOTSUPP;
>
> +       vmx_disable_paging();
> +
>         /*
>          * Note, hv_init_evmcs() touches only VMX knobs, i.e. there's not=
hing
>          * to unwind if a later step fails.
>
