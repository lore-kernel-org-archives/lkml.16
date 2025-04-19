Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5644B79EA
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 01:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745024912; cv=none; b=CAfQfz1UNvAX0Lx0JQ67X1RlSLCP5ZTKlIy6cTEgzMn8Uyn4UiwDhuf+wl9ev1uekYKYgVn3ahdPq2Kzk+TW00foYqCZmRMY9U0mZUDhqqdYRzLqXuDaakaKnt14OvloBpzKxYQ3unyvjY+hunx6OZ4qf1O9JwfOgYrZeRCRD54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745024912; c=relaxed/simple;
	bh=cU2tHaXn2pOKzWFOKUzDs+vE1QW3JSZ+sVLoQvJ40U0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QiFlAdqJRpn4ve7guuiwWzcDUry1lItu/rkr4H06/3jYZ6e2nlGJdnkbjh4FQxEfmr6gI1H1qDXmNRGfW61NyJpeef0o0z/kZfVaY/IGK8I2rW381AaXjXgv8gGJ2dKwqSoh/jQyYqCQl/AFsU+rNuYrg5qrqxoA7fdk3P6BCUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AeolmxXk; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AeolmxXk"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30566e34290so2385731a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745024910; x=1745629710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIH8+9dmxep9+Z84JNZHTxNcz8JapbeaUZwNMPKkJbk=;
        b=AeolmxXkTz/xBvLtEZGsgN1mnu4UN5zLKyq1p5kJUzU5LhS5vgy9Scw7fKUWLF2mKe
         6N3ixiv3+13mbD/YCEuXGl7vg1BSi8INw7MoEYPMhT0U0dSzMBset4VxGmU9h1NKWQ5D
         CX5UTlNReSRT0mJkL64uNmsMSKnDn87IlY2ojLZPk64s8WvRQMKFhDsncfkr/uVqD+R8
         nkytNFRmYoiMPvmFzd2YxviWfFsL7GHwspSGWSKcyAmH0S5SLEjxvPz+SWU5ib6lOPDI
         eX0ok0KSX5Zx65BjCnl4Xz1NIyn1DhHlMui/2Xk7lHK8k2r4vDVJKZhahxnbamMypTkw
         Fg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745024910; x=1745629710;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mIH8+9dmxep9+Z84JNZHTxNcz8JapbeaUZwNMPKkJbk=;
        b=tvXUBESaVmMJrmyYyLuM2ewIv+8Cskvv4RFw/7AvpXDhBv2WdjWlv3kRBnxNwzyheS
         Xaokv9/lYQGaCg6Nt76RdUTGFKdNMfQqK/6MpkkcNjQGbKBhfRQtIzWGcbcTaukSrNsf
         DcTBMxLJFZgdpmKw4dvYCE7vzlPJ4ZkERfZMAdTe+TFkal1Hk3Rnufx8Dka0t4Txf0VX
         FqHesq6ZIEOy2uJpWHGQeXo8Mb6BjCe8EAHAclLC7vrWgaEgchkjczEdmkDdsDWY5M5e
         vcUvvPUbSpnD2R86KJrx47lPdtg3HCdv9u5uXy/snluHAEx8ivZ7/Oq6IA2uuKE20xBa
         MP+g==
X-Forwarded-Encrypted: i=1; AJvYcCV4nv34+1irKm6HrVdQ4K4KiP/BMb3VOR3gfznXJXRu8RCFq80fqypIs1M/WyM7YeB6F/OQpQHLoQNCpu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKg5otReqL0K/Yz3ca43E34u2aun/zqGYrgGCcBC5bMcYlgN3l
	UV7dDS+fThJpIK+QRu5vPBPL846+SOMZtO6K9hKOfVy0cxwgOxF1U/A+J4J6JELqBkRM39gfoHq
	ugQ==
X-Google-Smtp-Source: AGHT+IHZhSXXubTpCFlOOnEIvHU467QNmKjXZoPNQezYYBYMwUyEsWt9k+iXgKJhh/FN2m03pEsubHOIrwo=
X-Received: from pjyp13.prod.google.com ([2002:a17:90a:e70d:b0:2fc:2ee0:d38a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53c5:b0:2ee:8430:b831
 with SMTP id 98e67ed59e1d1-3087bb3e7a6mr7256764a91.2.1745024910614; Fri, 18
 Apr 2025 18:08:30 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:08:29 -0700
In-Reply-To: <CAGtprH8EhU_XNuQUhCPonwfbhpg+faHx+CdtbSRouMA38eSGCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250417131945.109053-1-adrian.hunter@intel.com>
 <20250417131945.109053-2-adrian.hunter@intel.com> <CAGtprH8EhU_XNuQUhCPonwfbhpg+faHx+CdtbSRouMA38eSGCw@mail.gmail.com>
Message-ID: <aAL3jRz3DTL8Ivhv@google.com>
Subject: Re: [PATCH V2 1/1] KVM: TDX: Add sub-ioctl KVM_TDX_TERMINATE_VM
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, pbonzini@redhat.com, mlevitsk@redhat.com, 
	kvm@vger.kernel.org, rick.p.edgecombe@intel.com, 
	kirill.shutemov@linux.intel.com, kai.huang@intel.com, 
	reinette.chatre@intel.com, xiaoyao.li@intel.com, 
	tony.lindgren@linux.intel.com, binbin.wu@linux.intel.com, 
	isaku.yamahata@intel.com, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com, 
	chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025, Vishal Annapurve wrote:
> On Thu, Apr 17, 2025 at 6:20=E2=80=AFAM Adrian Hunter <adrian.hunter@inte=
l.com> wrote:
> >
> > ...
> > +static int tdx_terminate_vm(struct kvm *kvm)
> > +{
> > +       int r =3D 0;
> > +
> > +       guard(mutex)(&kvm->lock);
> > +       cpus_read_lock();
> > +
> > +       if (!kvm_trylock_all_vcpus(kvm)) {
>=20
> Does this need to be a trylock variant? Is userspace expected to keep
> retrying this operation indefinitely?

Userspace is expected to not be stupid, i.e. not be doing things with vCPUs=
 when
terminating the VM.  This is already rather unpleasant, I'd rather not have=
 to
think hard about what could go wrong if KVM has to wait on all vCPU mutexes=
.
