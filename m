Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE274254875
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749845802; cv=none; b=cv8bE82C3XB9ucxqMVDRISpCLnWazLlvNFuCaeq7ZHO4k55rbdqLLkJrR2qzwGDK90QpR/qcxTAFjKv3LARuxBNeaT1wpg7SbetiicOjJoqDIUpXFoeKgMaKDyD37yoJjxEpTR6xLz/fxjvTAaE1GVsaHKVMaRjpZHaxyZlmrFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749845802; c=relaxed/simple;
	bh=gTVV+suu80KdrU+ps4JrdTsQfs2Hxb28mx4LhYC0YzQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AQ6QU3xl3oei7CM/vD14K2bS0l3eWtJP2UxBR2RlNIvnVH3t2NL1R+7ss506bllVtS0iAJJJPoK747OgvWyh1QfZnzmPD/ZUp6949JXaL7LKUji5vzjLwfVIXxj9cQj5zLO/LwbEvRhGffWPr3WwH1xCmqwGZRIH4YssOx5Sbvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=00ugCWC1; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="00ugCWC1"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2c36d3f884so1745582a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749845800; x=1750450600; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j8crcznM3ZaoYwyfolgyowPDywStqZX/ibW9wOaZqL8=;
        b=00ugCWC1fpA2Ul4ARDGjOUed634VE0k0+51HQsI9zW+DYBPEG33789xxWhBqxjKJTS
         1e5/6H0qdBkcK7C60+oyD/8Pfzds1bqWAG+xetGahT+q1GNvFcZzEGq/mgGw7pSsRmXB
         u20WcfNI7aJ3w5a6gNMwwx5rl0Ica6jQUspJnlK26AAvsnyFJlTs43+c0EmjHuoiu5ee
         rkoANT7OZXP7f7KzdC6keg4kTvgub8NJhYXdoz5nwEOkCVhbxGG8740EZjeatfDlUoVn
         x/98iwA9a0XUTVWu3V585AhP6F9o4N0SEkLN8GG5dxAc6WHp78oa8MTRt1mGIjitovzV
         ay9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749845800; x=1750450600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8crcznM3ZaoYwyfolgyowPDywStqZX/ibW9wOaZqL8=;
        b=X1s8h/D2jIZyvrtKXzejZZy24tjEiPUFrmNXZRF0kwk24d/2TBdukyoORDgQQatefu
         0CFA0I1eV981makITC4RAN+uDe+YEwEq9QhWJtd+OMX2BkNY0dNw5bz5nvobKteDXaUQ
         oukRgBXQ0Yj/gU/qle46AzWFIE1Jknjia4Pou4wcSMZ7cZZXWS/d4MkcfvT1ZiVE7jGB
         IqFkS1uzkqaOGsFML1ofqOfyVG0+y2meHC7WQwZP4jbzZSYW0wPwLC4/8IyIzcpzom/u
         iO9+4qjBxp732Lr8V7JROlb6pjPh9lE9Ay0nNV3odTlDAXTzNXzitTDdqs5IcHD3j1RF
         lxZw==
X-Forwarded-Encrypted: i=1; AJvYcCUilBNKt36/zPsYVzX8yUNF3hUnHakfNArSNT5+QZFAdV7/8u0a6NW7EvKUZWIoRAVzQVur4MzFO5BgMY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzl/R9IGL/DV+kfUpoavj3W2yM3mg19DS3BHJ330lAyEy4xcpD
	C7GkGCMpFaTGIu2l99jDfuRaHCpBKzkbJeSPqLri4SYXijeStuGiJqsBm2an3mOT6QGVPXKdumD
	3wwA1Pg==
X-Google-Smtp-Source: AGHT+IEiAetaI+89aihaa4gzEoo2ZAl9jtG5VdIpcIRh8HZt4Cs8pqUG+YboDBBirpw/HkYzrzcdv9vN4Q4=
X-Received: from pgbct9.prod.google.com ([2002:a05:6a02:2109:b0:b20:93aa:6141])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1512:b0:21e:eb3a:dc04
 with SMTP id adf61e73a8af0-21fbd495d28mr946071637.3.1749845800007; Fri, 13
 Jun 2025 13:16:40 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:16:38 -0700
In-Reply-To: <aEuURZ1sBmSYtX9P@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250612044943.151258-1-pbonzini@redhat.com> <aEuURZ1sBmSYtX9P@yzhao56-desk.sh.intel.com>
Message-ID: <aEyHJuxo4aPUlmgV@google.com>
Subject: Re: [PATCH] KVM: x86/mmu: Reject direct bits in gpa passed to KVM_PRE_FAULT_MEMORY
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	xiaoyao.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 13, 2025, Yan Zhao wrote:
> On Thu, Jun 12, 2025 at 12:49:43AM -0400, Paolo Bonzini wrote:
> > Only let userspace pass the same addresses that were used in KVM_SET_USER_MEMORY_REGION
> > (or KVM_SET_USER_MEMORY_REGION2); gpas in the the upper half of the address space
> > are an implementation detail of TDX and KVM.
> > 
> > Extracted from a patch by Sean Christopherson <seanjc@google.com>.
> > 
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >  arch/x86/kvm/mmu/mmu.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index a4040578b537..4e06e2e89a8f 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4903,6 +4903,9 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >  	if (!vcpu->kvm->arch.pre_fault_allowed)
> >  		return -EOPNOTSUPP;
> >  
> > +	if (kvm_is_gfn_alias(vcpu->kvm, gpa_to_gfn(range->gpa)))
> > +		return -EINVAL;
> > +
> Do we need the same check in kvm_vm_ioctl_set_mem_attributes()?

Yeah, we probably should disallow aliases there.  It should be benign?  Because
memslots disallow aliases, and so the aliased gfn entries in the xarray will never
actually be consumed.
