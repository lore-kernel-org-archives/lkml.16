Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B188172767
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 13:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744206552; cv=none; b=Pcf8aKh29K7q3F8qMXBCqOOaffP7YhiYW1UI5kkA+EF6fpx89zwbIMrTuK3rWe9Xn2QBBNz928bbVHRZMj/fI/STed8vQJf5omurs7L8S+XLpNj6Hw/wlSRjxUB3Z0vCX8Rxm+OSw/ssOS+eC2p9JT9wPdL0MZ3DQr7sBAbxpSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744206552; c=relaxed/simple;
	bh=qazo7pIcfpNl+Sm7ZFsywYC/dbBgkDLaEHB4F2bqny4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pJoAB7UQoPziUE2DTRfAdPD/SJV0ccGlsj3vgZkT00j6X7nI/F2F3Is0yRWujmwYWjnIkC1+2g8Lcfjj+Ig5ciRYUetoP17eXphJu0JDXHFYEnyLS/srP6pdjOvkbHY9A5lpaClXTbowncMHa5r/2VLPNBVmj3Z7D19u6YWm39o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WYnZG9LW; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WYnZG9LW"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2242ce15cc3so61320795ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 06:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744206550; x=1744811350; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y73w31igBWLsQE77UitAErwv5VKNvNqUriamUlq9OdQ=;
        b=WYnZG9LWY8CeJUE4GWka3xrM/6DHtfY6OSH/0OWqipqHuY3yPpaXzQa+FXbzpjSiXc
         TibkYABEoNr/doy+RgRNeyJqm5ajmwNd8ldrIoN9Lof6NmGUCA9RNeDDgfJibUP7OzxK
         l6q11kqhWUdS32RvXB2bw2u+Jc9irG7FWIISbxJiNzjf1Ec/FBVsSAhVSHCi4onTruwW
         KGhXL5ARVQ4fxGShfBfJHJRcuXbCiIBUzxOpHTp+rsnXZEdDoRTmG9w50Sp5jKsfQ2CD
         lP853Mi6LiJMdzPYvgQWQxWjrYbYNOIdiS4tJxkP0Z/x0y7LBV/ETEDL5S9kwMlAFMtQ
         UlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744206550; x=1744811350;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y73w31igBWLsQE77UitAErwv5VKNvNqUriamUlq9OdQ=;
        b=EZRkbjfJk56sAwQEP5EXlArf79xvRsd+oDEOqCZ0q9r1ljbbyu7UX03OZAcY5M2sB2
         sAaQBmyC5h4HvFjVJRtYd6HDdfiwvnooXuRiwZeVqIZXJfOiPr/FTMEVTzrjQfuKI+Hk
         6dJBtsXtr7Ge55UtK30tsPqrN82naQLx1sUqUSNrUBfBqKjkfyntb+OjfQe9EHTcIpAH
         7KYjBRTVv3SBU5JaueOo6A6VNVleozzSVTV9wTLJZzH84qS+hKVFmR9JXYb0q4Eyn4km
         9kH5RgSKdtfZBEM5odHGoTJLLpjbCeNpRJawaQHo9CyEjQEzE6llQ4U91j3tiLWlg94X
         iQig==
X-Forwarded-Encrypted: i=1; AJvYcCXuOLS3wvCexbn0IDcyIO1yK9ID2KH2X7KD6lL+yGCm2X6aIfmJdy9Lf075C0G5hWAqamQemJHpoxEEHfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDtjyVI9+FhkDIVL31LLidbUxGjKqQVW+b4BtnFMPqJ6tugbKz
	q0fXhJ688E/HAdYXPeeBPjs+eAY1akxZiOnIulRJKo+IzLm5BQ0QMARcB9joPsisJmEiNMykuXm
	mQw==
X-Google-Smtp-Source: AGHT+IE1olvuaLq50nGKQrjOpbHUBUDesPetDQk8Ddyx/FU4wlnq3LPxsqnE/CiEUPfY3sWR2RK3WNzBKwk=
X-Received: from plbkx11.prod.google.com ([2002:a17:902:f94b:b0:21f:56e1:c515])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ccc8:b0:224:c46:d162
 with SMTP id d9443c01a7336-22ac2992075mr42310655ad.20.1744206550496; Wed, 09
 Apr 2025 06:49:10 -0700 (PDT)
Date: Wed, 9 Apr 2025 06:49:09 -0700
In-Reply-To: <112c4cdb-4757-4625-ad18-9402340cd47e@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250402001557.173586-1-binbin.wu@linux.intel.com>
 <20250402001557.173586-2-binbin.wu@linux.intel.com> <40f3dcc964bfb5d922cf09ddf080d53c97d82273.camel@intel.com>
 <112c4cdb-4757-4625-ad18-9402340cd47e@linux.intel.com>
Message-ID: <Z_Z61UlNM1vlEdW1@google.com>
Subject: Re: [PATCH 1/2] KVM: TDX: Handle TDG.VP.VMCALL<GetQuote>
From: Sean Christopherson <seanjc@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Kai Huang <kai.huang@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Chao Gao <chao.gao@intel.com>, 
	Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	"mikko.ylinen@linux.intel.com" <mikko.ylinen@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Tony Lindgren <tony.lindgren@intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yan Y Zhao <yan.y.zhao@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="us-ascii"

On Wed, Apr 02, 2025, Binbin Wu wrote:
> On 4/2/2025 8:53 AM, Huang, Kai wrote:
> > > +static int tdx_get_quote(struct kvm_vcpu *vcpu)
> > > +{
> > > +	struct vcpu_tdx *tdx = to_tdx(vcpu);
> > > +
> > > +	u64 gpa = tdx->vp_enter_args.r12;
> > > +	u64 size = tdx->vp_enter_args.r13;
> > > +
> > > +	/* The buffer must be shared memory. */
> > > +	if (vt_is_tdx_private_gpa(vcpu->kvm, gpa) || size == 0) {
> > > +		tdvmcall_set_return_code(vcpu, TDVMCALL_STATUS_INVALID_OPERAND);
> > > +		return 1;
> > > +	}
> > It is a little bit confusing about the shared buffer check here.  There are two
> > perspectives here:
> > 
> > 1) the buffer has already been converted to shared, i.e., the attributes are
> > stored in the Xarray.
> > 2) the GPA passed in the GetQuote must have the shared bit set.
> > 
> > The key is we need 1) here.  From the spec, we need the 2) as well because it
> > *seems* that the spec requires GetQuote to provide the GPA with shared bit set,
> > as it says "Shared GPA as input".
> > 
> > The above check only does 2).  I think we need to check 1) as well, because once
> > you forward this GetQuote to userspace, userspace is able to access it freely.

(1) is inherently racy.  By the time KVM exits to userspace, the page could have
already been converted to private in the memory attributes.  KVM doesn't control
shared<=>private conversions, so ultimately it's userspace's responsibility to
handle this check.  E.g. userspace needs to take its lock on conversions across
the check+access on the buffer.  Or if userpsace unmaps its shared mappings when
a gfn is private, userspace could blindly access the region and handle the
resulting SIGBUS (or whatever error manifests).

For (2), the driving motiviation for doing the checks (or not) is KVM's ABI.
I.e. whether nor KVM should handle the check depends on what KVM does for
similar exits to userspace.  Helping userspace is nice-to-have, but not mandatory
(and helping userspace can also create undesirable ABI).

My preference would be that KVM doesn't bleed the SHARED bit into its exit ABI.
And at a glance, that's exactly what KVM does for KVM_HC_MAP_GPA_RANGE.  In
__tdx_map_gpa(), the so called "direct" bits are dropped (OMG, who's brilliant
idea was it to add more use of "direct" in the MMU code):

	tdx->vcpu.run->hypercall.args[0] = gpa & ~gfn_to_gpa(kvm_gfn_direct_bits(tdx->vcpu.kvm));
	tdx->vcpu.run->hypercall.args[1] = size / PAGE_SIZE;
	tdx->vcpu.run->hypercall.args[2] = vt_is_tdx_private_gpa(tdx->vcpu.kvm, gpa) ?
					   KVM_MAP_GPA_RANGE_ENCRYPTED :
					   KVM_MAP_GPA_RANGE_DECRYPTED;

So, KVM should keep the vt_is_tdx_private_gpa(), but KVM also needs to strip the
SHARED bit from the GPA reported to userspace.
