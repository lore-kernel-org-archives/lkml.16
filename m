Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7871B289E1F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421035; cv=none; b=q50xnlh2nCBxcAF5bX3gGDWSiTASG1tECgl8FiVe7B0AwYViSPgD0zlvuZniIyMlzoPpMM2wS7sWU0+6Yp7h7JE4tJRCH4H2iyrj0Fr/9TEf4H31iwH4NXTkvgAfET+uv7L1roYBylMFo5CoMryEyUKtuIlHsmX2qz/LwDOEGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421035; c=relaxed/simple;
	bh=FAqGh+Ap3WVTnB3giMA2j55BTztyBeGG/4uN29HFZ7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbNcypDUgDENCLPpHzVJOg/kOSF8owMCic/rTbbDCIiQo7a23QZjf+bxp0Io8bm8nY+F0i/AryP8+q7gNjtUdnAIRdY8rB85eQrDkYCq5SEtlFKKyAF5AC3CE2ajP/OCSiBASRGLkhxQnvgrkVA49xslE9X7wZp3czeAoojPcZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W/eYAA/C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W/eYAA/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750421032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hRiX5hP6eSsbI68Jfq5YDPv8YMSSHRs8HbY7Wk8t+xQ=;
	b=W/eYAA/CYRJV/Z5eANwSVc1iP02rGlXBjlwB/aJBeuLhC5gKFBedNXiqMAk0volwp2KMZh
	3wjgr5gxhrofmNiRZbg/Umu8aRezof5oRdm3aRqAOjpCpKRV0OT3qj/Akd3WsNL+8gPxLh
	AhZN40yBRzksQwLIs5r0UuQ3Faj2qY4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-cEgIK2ZSMaq2mqju_3Sulw-1; Fri, 20 Jun 2025 08:03:50 -0400
X-MC-Unique: cEgIK2ZSMaq2mqju_3Sulw-1
X-Mimecast-MFC-AGG-ID: cEgIK2ZSMaq2mqju_3Sulw_1750421029
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso999676f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 05:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421029; x=1751025829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hRiX5hP6eSsbI68Jfq5YDPv8YMSSHRs8HbY7Wk8t+xQ=;
        b=SqAp6rEePLjHfJEZ/S+pyRRFemX6re3YFs2EGoFuxZVTwmA04vF58w5N5I34g0j/rj
         ewGOUSBM6YCmu33JYbHSF8qWFkPVhGRs6A4aCaInaby1laNVSdyLPBDoJQudoiAI54M9
         q/4f/fsS6O+OsBi9aRfk53wfu4lq4OIo+QKZqkViySieDgGKPV1KLSJEZsDQAYJEZIqD
         QGc6pR0NTxqRycVrp6qBGGRX/fNaWbCuK3TJ/uhxDNBWURuGAgTKUmFuD+jnOhuzQS78
         M4tu8dc9JY/qckK01e9dNYYVVsnk96zdx05Urt14vIDPq4DCxEZc8A6gnO4JEC5GQexF
         PW9Q==
X-Gm-Message-State: AOJu0Yxg8IAJ36nqh6nHLSBAjgohHpz4tsUlId59B2J3Vnv7JGL6Ix/m
	rcd4a+ubzYM8rHdk9lARUjR0P6CokvdIgXorS0FSztTYhc4NprHtWAs8Z/BG9r400k6X3twf7Nn
	tHHwJTRbBIXMzrlG3wCq4EN5whImiXJeJfMZmMllvDamkgXDhLviSRwkCECZIAvuAFOIpi5p2eo
	pJ+vjG3SN8+6tIWUJTzYv9RDV1bomWX7gJd25amOhD5ZIViEaJ
X-Gm-Gg: ASbGncsC0hYc/gwygZrbltpg9DUjO92SZAkBVeUHgvZ0FGo6deK9itpRQI/beddHBER
	c/IXNfkAZaIOiV1hZDAAuvMHLouVi44wjbZCyFzAIZbravXRUGgzcZTLMBRMyTYkJy6CLrlqyYS
	eXCbM=
X-Received: by 2002:a05:6000:2282:b0:3a4:d79a:35a6 with SMTP id ffacd0b85a97d-3a6d12e34b9mr2465322f8f.14.1750421026440;
        Fri, 20 Jun 2025 05:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEtw8HSbD5c31bjPnNG3AKWy62fuJMXkjNiI7W5B8OEByPQc05lu178uJKqVYi+04d45VIy1BAwLE5B8oF7v8=
X-Received: by 2002:a05:6000:2282:b0:3a4:d79a:35a6 with SMTP id
 ffacd0b85a97d-3a6d12e34b9mr2465273f8f.14.1750421025914; Fri, 20 Jun 2025
 05:03:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619180159.187358-1-pbonzini@redhat.com> <3133d5e9-18d3-499a-a24d-170be7fb8357@intel.com>
In-Reply-To: <3133d5e9-18d3-499a-a24d-170be7fb8357@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 Jun 2025 14:03:30 +0200
X-Gm-Features: Ac12FXwlP3mB0d4H_A3QTPM4diBtAL8jRHpn6HbJoT9oX8REYeRb2oG13FSy0CE
Message-ID: <CABgObfaN=tcx=_38HnnPfE0_a+jRdk_UPdZT6rVgCTSNLEuLUw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] TDX attestation support and GHCI fixup
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: "Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	"Huang, Kai" <kai.huang@intel.com>, Adrian Hunter <adrian.hunter@intel.com>, reinette.chatre@intel.com, 
	"Lindgren, Tony" <tony.lindgren@intel.com>, "Yamahata, Isaku" <isaku.yamahata@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, mikko.ylinen@linux.intel.com, 
	"Shutemov, Kirill" <kirill.shutemov@intel.com>, "Yao, Jiewen" <jiewen.yao@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Il ven 20 giu 2025, 03:30 Xiaoyao Li <xiaoyao.li@intel.com> ha scritto:
>
> On 6/20/2025 2:01 AM, Paolo Bonzini wrote:
> > This is a refresh of Binbin's patches with a change to the userspace
> > API.  I am consolidating everything into a single KVM_EXIT_TDX and
> > adding to the contract that userspace is free to ignore it *except*
> > for having to reenter the guest with KVM_RUN.
> >
> > If in the future this does not work, it should be possible to introduce
> > an opt-in interface.  Hopefully that will not be necessary.
>
> For <GetTdVmCallInfo> exit, I think KVM still needs to report which
> TDVMCALL leaf will exit to userspace, to differentiate between different
> KVMs.


The interface I chose is that KVM always exits, but it initializes the
output values such that userspace can leave them untouched for unknown
TDVMCALLs or unknown leaves. So there is no need for this.

Querying kernel support of other services can be added later, but
unless the GHCI adds more input or output fields to TdVmCallInfo there
is no need to limit the userspace exit to leaf 1.


Paolo

>
> But it's not a must for current <GetQuote> since it exits to userspace
> from day 0. So that we can leave the report interface until KVM needs to
> support user exit of another TDVMCALL leaf.
>
> > Paolo
> >
> > Binbin Wu (3):
> >    KVM: TDX: Add new TDVMCALL status code for unsupported subfuncs
> >    KVM: TDX: Handle TDG.VP.VMCALL<GetQuote>
> >    KVM: TDX: Exit to userspace for GetTdVmCallInfo
> >
> >   Documentation/virt/kvm/api.rst    | 62 ++++++++++++++++++++++++-
> >   arch/x86/include/asm/shared/tdx.h |  1 +
> >   arch/x86/kvm/vmx/tdx.c            | 77 ++++++++++++++++++++++++++++---
> >   include/uapi/linux/kvm.h          | 22 +++++++++
> >   4 files changed, 154 insertions(+), 8 deletions(-)
> >
>

