Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE48C205502
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954201; cv=none; b=Z2rzOQd1PJHDNOrXv3WWpphok1G5/FhRMH9EJh6/YFnYW2DyS7WVyYaWcfI7sop+4mGSM28fG35owPl1noWpn3PGM2ltywoMuRd2fQc76T4hzl+MgMFA6SsT1lty9cNfVFhaBDW0t1BnTlCzxGW+T38Eu+npwh48F1P+K9euvas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954201; c=relaxed/simple;
	bh=3dK9igG34LPxdpMV5UVh61EIuQaT+1ajbcjtbc7qkR0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ptSK+RpRTyt1GFGGyDZl8qqnK/oUasVmXDLLCCecNaywhmjQ8aCc0d46GBRCi7SWSSG1qgUR9efvtodjR4evFYCaF3mqV6iGLcO7AZMrk3IKwXS0qIHT8NDoJbUM4+JNXa8C7eN/NTPpA1YD4oKj9zfCUa4GTBWTJmHKcB+DGfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ga7WPov+; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ga7WPov+"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313ff01d2a6so1155107a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750954199; x=1751558999; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3koCSQ+MjDFXN15L8H0SZR0G6VhYzkxm2MTypvzZIY=;
        b=ga7WPov+qkOcBlFX11xGR2LYmqEeB1vcNWy2DNJz0MyqjwyJlRS2vWQ9oKON9WIzrv
         577dB+figq6cWHFiGI0LsDL5hLbZSFAkKssAPNrQ18ZQNSQHarP6hbT1Qvjz7Pl+0gHg
         gOhZkgsx1izb2wZow/T3XPMeipGczZKtKbFHmqFccWtDlcTyiZE8FlggIjEwYBhb4CS+
         CAD2biHlheBisBbQYUcFFaEcXd3MiUneQ34BajfR1UUGo+QO3CQSqIYQGELkwS4sqKps
         FFV1mA141m3ybxoukc4B/m7imgRlWqPOF9tHA1GjHOpZ1GqeRTeUFdVwDPCJT9rGS4nP
         q/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750954199; x=1751558999;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3koCSQ+MjDFXN15L8H0SZR0G6VhYzkxm2MTypvzZIY=;
        b=qSusSW6xUxNfFXi1Wl5Hk9xGDxcbtlH4L9y7rZOPcfzUU+EuZSOSiZogNBZalVim2Q
         prj1HbryF8icsu3jDppOs0P/bwrG/iVs82PfdB7tdr/BSjW7FOJeDCfqChl+rmZimYvL
         dRlbF6jBI3EvRXwd1U8Zzp/fY97rIH7XeGtUen38RbI2RxzEFljVmTPOBk/G2pgZx4yJ
         kn4Nncqe28HLEiHJqrhHbx2g2T+wd55w7E5GFsT2UTDgZlH0wwHlrDZNPAgmgx4V0PC9
         iH7mOJGsZutizhtxJy4pgplevYdSE8ARF7Z369/ojGIdESRXycC4P0KY3EobVDZbncbA
         0m+g==
X-Forwarded-Encrypted: i=1; AJvYcCVSjjbU09Du/DafXCUIJKBwxCFS8lmWcFuwFcCKEUUeKLx8LLI5mVcm9myqQIYH0Jph7JfpJYaFxS3wXiI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv8YxCs94jg5xVFPVV2k7y975eCXS+kNymQ2cYuf0mIjhTdki+
	UDTZc6HRWtCRmr59MMH3mgd9swOOwb7q4sy0Vfd5ql7Pxu3Q4y/rCRW+B6oSRFnOlf7iNGFKaFC
	v7/+LhA==
X-Google-Smtp-Source: AGHT+IE7rsD7356Nl+vRDhGo8NRkVod7EnT+hBgAUIZ+abYCwm7vR4tFPCrzIC8Kmhqp/KsxB8p468JM0aQ=
X-Received: from pjbnb6.prod.google.com ([2002:a17:90b:35c6:b0:311:8076:14f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5201:b0:311:fde5:c4c2
 with SMTP id 98e67ed59e1d1-315f261389emr9800147a91.1.1750954199184; Thu, 26
 Jun 2025 09:09:59 -0700 (PDT)
Date: Thu, 26 Jun 2025 09:09:57 -0700
In-Reply-To: <mqeuxn4in7pscni5odii2qvzoils5ce3jdzvmp45w3bg462buj@4elenf2mxaro>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250619200442.1694583-1-riel@surriel.com> <20250619200442.1694583-5-riel@surriel.com>
 <mqeuxn4in7pscni5odii2qvzoils5ce3jdzvmp45w3bg462buj@4elenf2mxaro>
Message-ID: <aF1w1RLgA9w7tRUg@google.com>
Subject: Re: [RFC PATCH v4 4/8] x86/apic: Introduce Remote Action Request Operations
From: Sean Christopherson <seanjc@google.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	bp@alien8.de, x86@kernel.org, nadav.amit@gmail.com, tglx@linutronix.de, 
	mingo@kernel.org, Yu-cheng Yu <yu-cheng.yu@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 26, 2025, Kirill A. Shutemov wrote:
> On Thu, Jun 19, 2025 at 04:03:56PM -0400, Rik van Riel wrote:
> > From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> > 
> > RAR TLB flushing is started by sending a command to the APIC.
> > This patch adds Remote Action Request commands.
> > 
> > Because RAR_VECTOR is hardcoded at 0xe0, POSTED_MSI_NOTIFICATION_VECTOR
> > has to be lowered to 0xdf, reducing the number of available vectors by
> > 13.
> > 
> > [riel: refactor after 6 years of changes, lower POSTED_MSI_NOTIFICATION_VECTOR]
> 
> But why? Because it is used as FIRST_SYSTEM_VECTOR?

The Posted MSI Notifications vector should be the lowest of the system vectors
so that device IRQs are NOT prioritized over "real" system vectors.

> > Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> > Signed-off-by: Rik van Riel <riel@surriel.com>
> > ---
> >  arch/x86/include/asm/apicdef.h     | 1 +
> >  arch/x86/include/asm/irq_vectors.h | 7 ++++++-
> >  arch/x86/include/asm/smp.h         | 1 +
> >  arch/x86/kernel/apic/ipi.c         | 5 +++++
> >  arch/x86/kernel/apic/local.h       | 3 +++
> >  5 files changed, 16 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/include/asm/apicdef.h b/arch/x86/include/asm/apicdef.h
> > index 094106b6a538..b152d45af91a 100644
> > --- a/arch/x86/include/asm/apicdef.h
> > +++ b/arch/x86/include/asm/apicdef.h
> > @@ -92,6 +92,7 @@
> >  #define		APIC_DM_LOWEST		0x00100
> >  #define		APIC_DM_SMI		0x00200
> >  #define		APIC_DM_REMRD		0x00300
> > +#define		APIC_DM_RAR		0x00300
> 
> Hm. Do we conflict with APIC_DM_REMRD here?

Yes and no.  Yes, it literally conflicts, but it's easy enough to define the behavior
of APIC_DM_{REMRD,RAR} based on feature support.  E.g. KVM is likely going to add
support for Remote Read, which would conflict with KVM's bastardization of
APIC_DM_REMRD for PV kicks.  But as Paolo pointed out[*], KVM's PV unhalt/kick
can simply be gated on KVM_FEATURE_PV_UNHALT.  Any code that cares should be able
to do the same thing for RAR.  E.g. KVM's code could end up being something like:

	case APIC_DM_REMRD:
		if (guest_pv_has(vcpu, KVM_FEATURE_PV_UNHALT)) {
			result = 1;
			vcpu->arch.pv.pv_unhalted = 1;
			kvm_make_request(KVM_REQ_EVENT, vcpu);
			kvm_vcpu_kick(vcpu);
		} else if (guest_has_rar(vcpu)) {
			<magic!>
		} else {
			<emulate legacy Remote Read>;
		}
		break;

For the kernel itself, there's nothing to do, because Linux doesn't use Remote Read.

[*] https://lore.kernel.org/all/CABgObfadZZ5sXYB0xR5OcLDw_eVUmXTOTFSWkVpkgiCJmNnFRQ@mail.gmail.com
