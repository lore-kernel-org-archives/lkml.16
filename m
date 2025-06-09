Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B1A2459FF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478990; cv=none; b=jtWOWO6P20Yk0XHC4sqkDr4HYowZuaxVmINoDvNyOyvoeQCHFZ1DGTNzniBCioKMg72NXWbWfmrL2Z89E+5d6v6+gZpSf1TeodewthumcQZkvjJt23PlwNPFJLrHWd0Dem7UAyeJL5iUgFzuNUD7Q5tLaaHfIJmiAUkr1H750bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478990; c=relaxed/simple;
	bh=Jj+Yt9zXtcRCfSDm7whUQ4ZIZ5JHddO5KlLP+fvfba4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AQGNFcQJtpSdtPe+UMmKjVxBW4G6OCOgRZ5QRgZ+f9dixcuXUAIGz46HvFnDA7InHxKMKoFjUF23Fozl9vmEtlP2eeLVQUl/7kriEdDip1D4ncdZl0GetXz8ZYdewyMTNzI5XH+TmpaciPm0mipUKJwLj1lEySoLevGK5q2Tb8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ix7v20EQ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ix7v20EQ"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2c38df7ed2so3133858a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749478988; x=1750083788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lLdTQdrM0ytHOS+CAmb5K/o5KQV3Zi0TqZM7kL4ZL0=;
        b=Ix7v20EQCfltUmRpI92FuSjgKVl5h/4BCa1w5LbO4E0rgxLmFWkosid6fR3GrVQNMw
         RS63T+ia7uv8xbcGvqglfCT/B2llC0OodQhdhBRJ/M9w1M7QLg2JJ3HBw/XKZsNVLTkB
         OpzQ37+0M4mX2jRiCe1COGqXnBjHIUJo/slqYGWZeiX4J4diRJ5TuhiX3YPTGnLApK78
         Qvl/LA/RlE3lz7o/duivPunW3TtyZebIvHenfFGSdwvjhHifrjRcRXBkyCqDr4bZiZI+
         BCwYn7DekeGjzLc9DVZRdopPgWtSdFyH6+bluN2AdSWy3tLeLFKmA5yZut4LV7KKu7KO
         BuMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749478988; x=1750083788;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7lLdTQdrM0ytHOS+CAmb5K/o5KQV3Zi0TqZM7kL4ZL0=;
        b=D/STd1u9Er5X55vjpAEqCuIgE0NZgUtza2pvmultPXAGtSo73N+wbO2BuqJGDYtdId
         DgdBEi3i5NrBJuIkG4rBijFsX1boazxV0K8eJdY34bcyuMDzXFQkAkNtq/MLtukSHO6K
         Cq+UbAgemqDlzXVxhZ+oVBWUja7rHtmGsM1KuEjpIH20dyCqyE5+1T+4UP7Z29onwNje
         n4WFuvidAz7WK5H+NP3IbhAQjKG8oL76kM7+bDaDjWsKkeopmJCkXLXXhFnxNoa1KKLd
         K5pUWW/jHjdy6DnKEq2DS14xT5hFI1XeXCbt35qaAx6xcAAp9RUifMyHpaSmBE7T+n6x
         wDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKOIWasHzy2x7eL9Q+0xnCtkczNh8uOlWqIhT4ljDotLe3YRgqxlDJWSEhjpZprA6xVseDlkE5TZ40EpI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeo+Zx7z/uy39vZvdX0lWDIpISgCc4gTN30k8zrv0bqySQ49h0
	77rZ6q2BsBiEz/uNU9jkajwMrxUSEv0Dh8XMqvFZbxh2bXrzj0InzPT8vXDPiFFfk5jZnQgjBwy
	HZY6SSQ==
X-Google-Smtp-Source: AGHT+IEXWjGA+7EHOmgVdxQCVZsaeyZ/Yk7vf9FpuYgFPmjBt1Dx/ah2+gxQKH2vNCJYIKyguPOQGlf/Vfs=
X-Received: from pjuj14.prod.google.com ([2002:a17:90a:d00e:b0:311:485b:d057])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5345:b0:311:ffe8:20e9
 with SMTP id 98e67ed59e1d1-31347308c79mr21849041a91.17.1749478988192; Mon, 09
 Jun 2025 07:23:08 -0700 (PDT)
Date: Mon, 9 Jun 2025 07:23:06 -0700
In-Reply-To: <4a66adfa-fc10-4668-9986-55f6cf231988@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20211207095230.53437-1-jiangshanlai@gmail.com>
 <51bb6e75-4f0a-e544-d2e4-ff23c5aa2f49@redhat.com> <4a66adfa-fc10-4668-9986-55f6cf231988@zytor.com>
Message-ID: <aEbuSmAf4aAHztwC@google.com>
Subject: Re: [PATCH] KVM: X86: Raise #GP when clearing CR0_PG in 64 bit mode
From: Sean Christopherson <seanjc@google.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Lai Jiangshan <laijs@linux.alibaba.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 06, 2025, H. Peter Anvin wrote:
> On 2021-12-09 09:55, Paolo Bonzini wrote:
> > On 12/7/21 10:52, Lai Jiangshan wrote:
> > > From: Lai Jiangshan <laijs@linux.alibaba.com>
> > >=20
> > > In the SDM:
> > > If the logical processor is in 64-bit mode or if CR4.PCIDE =3D 1, an
> > > attempt to clear CR0.PG causes a general-protection exception (#GP).
> > > Software should transition to compatibility mode and clear CR4.PCIDE
> > > before attempting to disable paging.
> > >=20
> > > Signed-off-by: Lai Jiangshan <laijs@linux.alibaba.com>
> > > ---
> > > =C2=A0 arch/x86/kvm/x86.c | 3 ++-
> > > =C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > > index 00f5b2b82909..78c40ac3b197 100644
> > > --- a/arch/x86/kvm/x86.c
> > > +++ b/arch/x86/kvm/x86.c
> > > @@ -906,7 +906,8 @@ int kvm_set_cr0(struct kvm_vcpu *vcpu, unsigned
> > > long cr0)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !load_pdptrs(v=
cpu, kvm_read_cr3(vcpu)))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
> > > -=C2=A0=C2=A0=C2=A0 if (!(cr0 & X86_CR0_PG) && kvm_read_cr4_bits(vcpu=
, X86_CR4_PCIDE))
> > > +=C2=A0=C2=A0=C2=A0 if (!(cr0 & X86_CR0_PG) &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (is_64_bit_mode(vcpu) || =
kvm_read_cr4_bits(vcpu,
> > > X86_CR4_PCIDE)))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static_call(kvm_x86_set_cr0)(vcpu, cr0=
);
> > >=20
> >=20
> > Queued, thanks.
> >=20
>=20
> Have you actually checked to see what real CPUs do in this case?

I have now, and EMR at least behaves as the SDM describes.  Why do you ask?


kvm_intel: Clearing CR0.PG faulted (vector =3D 13)


diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f79604bc0127..f90ad464ab7e 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8637,6 +8637,23 @@ void vmx_exit(void)
        kvm_x86_vendor_exit();
 }
=20
+static noinline void vmx_disable_paging(void)
+{
+       unsigned long cr0 =3D native_read_cr0();
+       long vector =3D -1;
+
+       asm volatile("1: mov %1, %%cr0\n\t"
+                    "   mov %2, %%cr0\n\t"
+                    "2:"
+                    _ASM_EXTABLE_FAULT(1b, 2b)
+                    : "+a" (vector)
+                    : "r" (cr0 & ~X86_CR0_PG), "r" (cr0)
+                    : "cc", "memory" );
+
+       pr_warn("Clearing CR0.PG %s (vector =3D %ld)\n",
+               vector < 0 ? "succeeded" : "faulted", vector);
+}
+
 int __init vmx_init(void)
 {
        int r, cpu;
@@ -8644,6 +8661,8 @@ int __init vmx_init(void)
        if (!kvm_is_vmx_supported())
                return -EOPNOTSUPP;
=20
+       vmx_disable_paging();
+
        /*
         * Note, hv_init_evmcs() touches only VMX knobs, i.e. there's nothi=
ng
         * to unwind if a later step fails.

