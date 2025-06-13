Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702EB28EA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749773375; cv=none; b=e2lDBnvI4Pev5zbyvgJIOde700POecBNb7rL8ENis1bKHkL/hjzP9K0yOGecrnmuHp+9hpTOeevy/0AyFQMwBHntIMBw6kyF90lUybix3dmEhw0p0ZCeBHwSqqG4pN+uTN2M0aP/juaJAcVhTsfl6FL6RQhQziJ6YQqHIzCY2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749773375; c=relaxed/simple;
	bh=/ktH2xactQn7a2Lngut9MGuVtpiPv0SdsqRt9Mm857k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A244OpjLIs9OhpccPhEpkUtP4ytkWTzuiZe44EPXKgE6ZhTsKiBKDh2tKOXhGy9Dwkj/gSrj4oupq6BePa7LH2VY4Qy1TmBDm3/6V4pejUnvubJGHTkq89uhOpEdRdWIqNzQFa33W1bCAclS9boEkyF07CAyQ1DeqYxqWjaytcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XXqa7ICU; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XXqa7ICU"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-740774348f6so1412073b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749773374; x=1750378174; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjbKQe64dfg1fWMvIao4pEIryvItWqTHsDUghiEa5jk=;
        b=XXqa7ICU2K6RUBc9+LZnfZP1wbQywZiLUM2K7sXCBSH54KKr1iWi14GPTqAn6fW9Hn
         m309/otUnTvt2hI/hTm7EQPK8TQIIQVitQNCTcemQBs2pXgDpTAhvPRSXwliR35uyMxM
         FQ7SQW6mnXhJA0MyBMRlzYS92IosvF005nZIskQ9rgAJPPcJmRfuSBvH+sGQNfETeL90
         RrrVdBTwqB+2UIAg3cG3CNntka8bYVyoPr9J7ZuHpo9Sc7PLAD1ZL/HrGa0vlj0KAgWH
         tOMsA4RAENvZcq1y7sAYjRr9Yu8ULHb6+Y1EnjoJAVp5P8e1SHHcp0oG82V+PMl7j7wz
         iEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749773374; x=1750378174;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JjbKQe64dfg1fWMvIao4pEIryvItWqTHsDUghiEa5jk=;
        b=nwfyPk63U7decGUjpYal855L8mG5nccqkv8jHMQm1cBgSW78CrsWZVsMiJq/FrMJn0
         hifJ9XDvWoTuobzPAOA95OuxgwgLFRmAs5q3t0KEYJEx8JB/zw4e8NaUt+WuNw4CwckV
         MBT468y7qk2QIwM5H2sl2oRhK5vUHs15mJLIPRzGrh4riOsKlurCMfeGx7vx2VjKYUAj
         YRm0gdSeNp8rLtcxDdNYCXbeKayyAvH8cuoC5tqF2uCbhmRabGnJPwMN+K+cgDPf352I
         CMT0zcXeXopCzcmS9TLzV+pO8B9iMhseaDD2N/uPuqsGBfNoEdYwOukQ51phbFtpKMKU
         XK2A==
X-Forwarded-Encrypted: i=1; AJvYcCXTRNTiLQ8lxb4EQK2oTrC20xt28jocR27NxV9UWwLh1+zTaJerpypivg/g6ZVOFtD+0VrQNEVTg/qgUe0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5KQfGG5Fjf3YoyMF4z6FErKk03vWh+fESjRFycTe6xRlH3Noz
	e+2wlWyW2U7U20+PI5A4Vo021wYraZJmJ8qaIe+d3UUnEsGzYCj2NXoBl7ddAvnSWNCPSGVZOow
	Yrp9sTg==
X-Google-Smtp-Source: AGHT+IEvfSNx2MTIGs9zRZWnO+a9xVhIHUWPkCsnktSUFR08Nvt4dHmTB1CxMd7JQI0Vq45VV1vpNv+gKmY=
X-Received: from pgbbo5.prod.google.com ([2002:a05:6a02:385:b0:b2f:63c8:753d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:8093:b0:21a:e091:ac25
 with SMTP id adf61e73a8af0-21fac8e62b3mr872991637.6.1749773373878; Thu, 12
 Jun 2025 17:09:33 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:09:32 -0700
In-Reply-To: <02ee52259c7c6b342d9c6ddf303fbf27004bf4ef.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611001018.2179964-1-xiaoyao.li@intel.com>
 <aEnGjQE3AmPB3wxk@google.com> <aErGKAHKA1VENLK0@yzhao56-desk.sh.intel.com> <02ee52259c7c6b342d9c6ddf303fbf27004bf4ef.camel@intel.com>
Message-ID: <aEtsPEnQTRBoJYtw@google.com>
Subject: Re: [PATCH] KVM: x86/mmu: Embed direct bits into gpa for KVM_PRE_FAULT_MEMORY
From: Sean Christopherson <seanjc@google.com>
To: Rick P Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Y Zhao <yan.y.zhao@intel.com>, Kai Huang <kai.huang@intel.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	"tony.lindgren@linux.intel.com" <tony.lindgren@linux.intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025, Rick P Edgecombe wrote:
> On Thu, 2025-06-12 at 20:20 +0800, Yan Zhao wrote:
> > What about passing is is_private instead?=C2=A0=20
> >=20
> > static inline bool kvm_is_mirror_fault(struct kvm *kvm, bool is_private=
)
> > {
> > =C2=A0	return kvm_has_mirrored_tdp(kvm) && is_private;
> > }
> >=20
> > tdp_mmu_get_root_for_fault() and kvm_tdp_mmu_gpa_is_mapped() can pass i=
n
> > faul->is_private or is_private directly, leaving the parsing of error_c=
ode &
> > PFERR_PRIVATE_ACCESS only in kvm_mmu_do_page_fault().
>=20
> General question about the existing code...
>=20
> Why do we have the error code bits separated out into bools in struct
> kvm_page_fault? It transitions between:
> 1. Native exit info (exit qualification, AMD error code, etc)

This step should be obvious :-)

> 2. Synthetic error codes
> 3. struct kvm_page_fault bools *and* synthetic error code.

A few reasons.

 a. The error_code is used in other paths, e.g. see the PFERR_IMPLICIT_ACCE=
SS
    usage in emulator_write_std(), and the @access parameter from FNAME(gva=
_to_gpa)
    to FNAME(walk_addr_generic) (which is why FNAME(walk_addr) takes a sani=
tized
    "access", a.k.a. error code, instead of e.g. kvm_page_fault.
 b. Keeping the entire error code allowed adding kvm_page_fault without hav=
ing
    to churn *everything*.
 c. Preserving the entire error code simplifies the handoff to async #PF.
 d. Unpacking error_code into bools makes downstream code much cleaner, e.g=
.
    page_fault_can_be_fast() is a good example.
 e. Waiting until kvm_mmu_do_page_fault() to fill kvm_page_fault deduplicat=
es a
    _lot_ of boilerplate, and allows for many fields to be "const".
 f. I really, really want to make (most of) kvm_page_fault a structure that=
's
    common to all architectures, at which point tracking e.g. exec, read, w=
rite,
    etc. using bool is pretty much the only sane option.

> Why don't we go right to struct kvm_page_fault bools? Or just leave the
> synthetic error code in struct kvm_page_fault and refer to it? Having bot=
h in
> struct kvm_page_fault seems wrong, at least.

I actually like it.  It's like having both the raw and decoded information =
for
CPUID or RDMSR output.  All of the relevant fields are "const", so there's =
very
little chance of the state becoming out of sync.

I suppose an alternative would be to create union+bitfield overlay, but tha=
t
wouldn't work if/when pieces of kvm_page_fault are shared with other archit=
ectures,
and even without that angle in play, I think I actually prefer manually fil=
ling
bools.
