Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A84199FAF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749706474; cv=none; b=kFPz2WBSfPCcHZL9qlpN8l4NiOejtgVBXMB3tVDnvu/BrlWGnlamK0B22uCvLCRo3ShAWSrXxev9G9wX2FQKJ2FJjbGqOdwacp7JPhzG6anPSYA4eiQG0GPejYEALeFuXzgJT/YsOLSW5VfsmYqkT2OzLQqGoh+qWPmsb9bgEhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749706474; c=relaxed/simple;
	bh=UiEigjrBL/PVRdzjBTfpiW4C3SupfyiHMu4I/EEz5WM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I12fb2VcUKLIUcDI4ryU50Hnuw7lk+D48DBLPgxiG5IrzzGGCHoXaXK6FPQ6rg0YRzJLtRTaAUbjzxqLRFCangbVjUsB5S3UcACb89wXmwEVwNj9TGH9vomXysQfoKMUv/xnRdHNjujSwVr0D2SsfHAUWNJgp6pcTCg0JeSMOpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PtifOTOw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PtifOTOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749706470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8X+KEMlrQPZXbF8BZWuOrHRVf8Is3K9LsdqXqaOk30o=;
	b=PtifOTOwEMGKX9hsspPN7/tUDGzY43BtnC0677bpOmtDJkBFT1qiZphUw7lQXc3zLkjNQJ
	2VdTYJYlfWuoYF7iV5TN3DKcSc6TfcJnIOKmSRWkf1oeGPOZHESZKUuK2TDLhOsSeGbIVt
	A8z+WSzz5rtGke5y+l+Nn6529Ul6puI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-zPtLtPuYOXCRGyyir2Nkkg-1; Thu, 12 Jun 2025 01:34:29 -0400
X-MC-Unique: zPtLtPuYOXCRGyyir2Nkkg-1
X-Mimecast-MFC-AGG-ID: zPtLtPuYOXCRGyyir2Nkkg_1749706468
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a5281ba3a4so205778f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749706468; x=1750311268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8X+KEMlrQPZXbF8BZWuOrHRVf8Is3K9LsdqXqaOk30o=;
        b=NVxN1BE+SIVVoynjD798ylxBvCjnZwoLJJcORVUkAorV+YBAkWbaMv+92PxIP1UMmc
         ezvMpB0srLVtzCShdnbYtdFfYpMiSZQXzD337XFEOaqtD1lw4hkTokpR12kx6tFczzgS
         YFSMNcNERn7hwpGBe9cmzOmv1tzPsianqey3LzqpvDnkCvUF9S239M8Fbpb0qeGVd752
         gyZNu02/+H16cQLxPBPHv8dcwY0eVS4LU/hh49qGP3vgWC9/CmOtpcLCGxrIh/Ih/eEw
         nLzoAr1VLfpzw5MPKqnnGx0X4ZuvkbTExcJR1wfnr+Cs1rIbT4c8vCi1JL+x4bkVqhPj
         fyQg==
X-Gm-Message-State: AOJu0YxRxcRSMl/U2OacQyBVTW4VVmPdSZgg3/6xQHEc8GYkSVU6gfXx
	g7kafWpw5V/zd1q9d5l5LL6HI+ZJb60nxq5NRrIscZz3gmLRQ7t7MWNdvDRe4S+FAOktd2r8IMG
	8izKxiQXgjIq4RPs5wjczAqBCl02As15AKO/hU1Fs+KY1VDvQwMZDISzhXH5iCFSukASGgyChke
	7YkRwRiSG4ut9qPIxxP7bTb1qXqa2GUpLyF5CymTK5
X-Gm-Gg: ASbGncuNIjkQZFTDf2Je+HDook8z6KjsL1jlLBvEbccEyqyD74q+pm0Hh/nDP7I2YdM
	9kpQ/IC4uC/7Mpgq6RhCWUTilDYn3L4Zi1mvqQXhdM3VfDc2CQXaNMZB3yCR+oRQl9k5rEPbwtj
	kbxQ==
X-Received: by 2002:a05:6000:400e:b0:3a4:c909:ce16 with SMTP id ffacd0b85a97d-3a56078014fmr1332776f8f.49.1749706467820;
        Wed, 11 Jun 2025 22:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUoDrNCJSqWMpRx7BQZQqyz9zBR8eq3rCWjxL1Aa1yJ0Qp62fxKUknBXS+/RHNgWEzx4rc4+UKHNvsCfYaKls=
X-Received: by 2002:a05:6000:400e:b0:3a4:c909:ce16 with SMTP id
 ffacd0b85a97d-3a56078014fmr1332754f8f.49.1749706467425; Wed, 11 Jun 2025
 22:34:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612044943.151258-1-pbonzini@redhat.com> <cfd99e56-551b-49c5-b486-05c9f6d8cf11@intel.com>
In-Reply-To: <cfd99e56-551b-49c5-b486-05c9f6d8cf11@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 12 Jun 2025 07:34:12 +0200
X-Gm-Features: AX0GCFvR7ruY-7CJzAvpxNmfdGIN_rQ_TTVqOWRNjhewrDtkRemeydBZiVKiJtU
Message-ID: <CABgObfafukOFkeR09krA5GVb3itfpHNHjBM0aRZj5t4EKJv7Dw@mail.gmail.com>
Subject: Re: [PATCH] KVM: x86/mmu: Reject direct bits in gpa passed to KVM_PRE_FAULT_MEMORY
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, seanjc@google.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 7:29=E2=80=AFAM Xiaoyao Li <xiaoyao.li@intel.com> w=
rote:
>
> On 6/12/2025 12:49 PM, Paolo Bonzini wrote:
> > Only let userspace pass the same addresses that were used in KVM_SET_US=
ER_MEMORY_REGION
> > (or KVM_SET_USER_MEMORY_REGION2); gpas in the the upper half of the add=
ress space
> > are an implementation detail of TDX and KVM.
> >
> > Extracted from a patch by Sean Christopherson <seanjc@google.com>.
> >
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ---
> >   arch/x86/kvm/mmu/mmu.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index a4040578b537..4e06e2e89a8f 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4903,6 +4903,9 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vc=
pu *vcpu,
> >       if (!vcpu->kvm->arch.pre_fault_allowed)
> >               return -EOPNOTSUPP;
> >
> > +     if (kvm_is_gfn_alias(vcpu->kvm, gpa_to_gfn(range->gpa)))
> > +             return -EINVAL;
>
> Do we need to worry about the case (range->gpa + range->size) becomes ali=
as?

No, because the function only processes a single page and everything
in the non-aliased part of the address space *can* be prefaulted.

KVM's generic kvm_vcpu_pre_fault_memory() call will see the EINVAL on
a later invocation and will stop processing the part of the request
that is has the shared/direct bit set.

Paolo

>
> >       /*
> >        * reload is efficient when called repeatedly, so we can do it on
> >        * every iteration.
>

