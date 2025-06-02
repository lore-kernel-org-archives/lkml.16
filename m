Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A658F6E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748884255; cv=none; b=a0/T0qWYsGqJD0+jf4ihvUCFt9WaA89rM366UnFld5W0yz1XJeuN9W9ZpI9K4Qv2ubOl24BpJ+aMZ6zPM6H0ZRs5811M9uYVk9Lzfd2bNw84CFCB0NTd2HBdwatAYX7ZMX+TS4PYbCeJASJyBXaVUrCS08A3oQHTKFY0EAjEaos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748884255; c=relaxed/simple;
	bh=v0XE2JFU3PXQw1oYBcQG5l6MPvAm2M5g2to2E2+f2Yc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oB1I3nlczmblor6uWaWD4Zj7dUY4Y9KnPgkGf8WPF5yjEapGL+cIvGftgrUd1aI1wP1Rm1z2J/NYrQKHu12/QHZqQTjolVmX9+v6dZ1qxV8KpujKuiLtRC7VpEX8IZ5xJuikto2wdfRwb9GA3dLAGazDB0c5B80VmjfJ58X7QOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h4fxPBFw; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h4fxPBFw"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31171a736b2so7008936a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748884253; x=1749489053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEZapm8fiWqKuDBlb4/ws27a3eN39EKuHvs9QfnS6cE=;
        b=h4fxPBFwp2vXAZgrmPJd+w0gcP99sg96vLww51OaVSqpPSBblEReozKpTDytdO41BH
         SZP9kcfltFKFvhwR7T4W5pzQvsPQrgzh3BpDNvybpc6mQ9+Rb9xWhv2fRyVLF1SIuCeN
         pn0h23ynw36BviuW+gWhyTJahC9lZe9k62Sv6s7/fnXIhUtUBqiEfYQtj/JiITFqgdL4
         bIAJq7lopojHoLGlBAWkHx7s+dDFJmL/B9RTuROuVDcDNdEOPoBU3J5j1/vJBSn2TF0t
         tUxowg5Xdl0q+zJ1qgrz+PcGLtPx/rx7C/u9f0dAGhGMymlTqVUcsssca6mwAOo2i91B
         m1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748884253; x=1749489053;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GEZapm8fiWqKuDBlb4/ws27a3eN39EKuHvs9QfnS6cE=;
        b=JxxYtNnQMhMYMfXgU9Dyckw2k/2Z4/R8MX86C8t+cKcuELFqU+F21D7aKTUZSGimWw
         w6ExhrmsickZXubedDUyylLc+KOdB2InggoQn7hav7nJbktmJEBt7UJ1/ksQACSBmgpx
         tnfM0y1NExVZAnQktARWEim+WWU5ofyxVbzIm5RA8eSpBNK6/gXCrkZ8MV0Au4lXWkNg
         7WZppc+0PxeENYGhxaBVTPTd/lG0SBVs2pnEgd39lmfi9UMC3V+EiWcXULoKbMwECG4e
         Gxe8Iyl+yBquJr+KKtf0IKWymq+vN+CcVftULM70+Y5gTSlUSk/VAUBe0vQB6tZ63gBi
         KJNg==
X-Forwarded-Encrypted: i=1; AJvYcCWPau06mrDdaP55BMJ+d9YHCn4tkNP5Cidd4cOsnhA5oT3n4CblglSW7jzIbjJMICPqgSivdgfo6doi2VU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyvRms3ox8+UmVcOwIxnswUyEcCLsdKvIA+KKbb6RypgeMP05a
	cHYsShz+5QUFJC6PB12Rozsgb7ARTY/YOEeIMCFzyUb17ujtGV+TUbcZzA38dP53oL1vhv/kYN6
	+xJgs6w==
X-Google-Smtp-Source: AGHT+IGtPRo3fW4cHMqcCN7uH/TGK3HbpFpsizomYXt9Zj04sUjf3sES8XZPqN19AiOl8JNCngkzOInECOc=
X-Received: from pjbse6.prod.google.com ([2002:a17:90b:5186:b0:311:a4ee:7c3d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cd0:b0:30e:8c5d:8e4
 with SMTP id 98e67ed59e1d1-3127c73d4e1mr16039502a91.16.1748884252968; Mon, 02
 Jun 2025 10:10:52 -0700 (PDT)
Date: Mon, 2 Jun 2025 10:10:51 -0700
In-Reply-To: <04e4c088-46f9-41fe-a681-cf494bdbdb03@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com> <20250529234013.3826933-17-seanjc@google.com>
 <04e4c088-46f9-41fe-a681-cf494bdbdb03@zytor.com>
Message-ID: <aD3bGxdrrplf0YvT@google.com>
Subject: Re: [PATCH 16/28] KVM: VMX: Manually recalc all MSR intercepts on
 userspace MSR filter change
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025, Xin Li wrote:
> > +
> > +	if (vcpu->arch.xfd_no_write_intercept)
> > +		vmx_disable_intercept_for_msr(vcpu, MSR_IA32_XFD, MSR_TYPE_RW);
> > +
> > +
> > +	vmx_set_intercept_for_msr(vcpu, MSR_IA32_SPEC_CTRL, MSR_TYPE_RW,
> > +				  !to_vmx(vcpu)->spec_ctrl);
> > +
> > +	if (kvm_cpu_cap_has(X86_FEATURE_XFD))
> > +		vmx_set_intercept_for_msr(vcpu, MSR_IA32_XFD_ERR, MSR_TYPE_R,
> > +					  !guest_cpu_cap_has(vcpu, X86_FEATURE_XFD));
> > +
> > +	if (boot_cpu_has(X86_FEATURE_IBPB))
>=20
> I think Boris prefers using cpu_feature_enabled() instead =E2=80=94 maybe=
 this
> is a good opportunity to update this occurrence?

Yeah, I'm comfortable squeezing in that change.

> > +		vmx_set_intercept_for_msr(vcpu, MSR_IA32_PRED_CMD, MSR_TYPE_W,
> > +					  !guest_has_pred_cmd_msr(vcpu));
> > +
> > +	if (boot_cpu_has(X86_FEATURE_FLUSH_L1D))
>=20
> Ditto.
>=20
> > +		vmx_set_intercept_for_msr(vcpu, MSR_IA32_FLUSH_CMD, MSR_TYPE_W,
> > +					  !guest_cpu_cap_has(vcpu, X86_FEATURE_FLUSH_L1D));
> > +
> > +	/*
> > +	 * x2APIC and LBR MSR intercepts are modified on-demand and cannot be
> > +	 * filtered by userspace.
> > +	 */
> > +}
