Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F5B1A9B32
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666088; cv=none; b=WOw2wFu8iN72HKNpd4w8YsH7Ivd866EblT0dGxB7ahaaCyP726Da2QAuW7oPTyemXtn0GLmM+wTL5owKA1lozujOYsCiH8G6COIz2BTWzuMPm39FfbJ+7BSfxUgDsKYgi6f5tkIua4JuWbHqkRpaByP7VKssRnKrslja1066+54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666088; c=relaxed/simple;
	bh=r9QMx69Ue/A32d9Orge2I3CC4VQy+WnLS4rza5UZyOY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FHt/Gu7lsBPqVHAMFthYetc/aYpIpdOsJgnu8K1rRukfZ9xyJwreQ2ttYuoDsEXZQL8JgiD5j2VmpTvNSprXxO9DJOZ8HhaFFJlYUnWNoP+tJc5+9urL1ZkTYxMZgnJ3r6UNw+Q7VAnRBQcpjTDf3vLx5/EeUfuAt35HHXqpFSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TzpnEiVb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TzpnEiVb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749666085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F6DkECrmg8Fi611vvjkQjdL7MZfwTMP/mN8vE4LabKk=;
	b=TzpnEiVbcXXQ7lp5cz3nqzBD7fXIONmvBJtrd/133xKVaR3uhOIqhDBpI5mwK1eDHYdj/B
	yIP2MgR1UfAfYi/m9oRFeYNneNUHTYb/dxOzfErchqm/xhU28LIW8C677sPq3chUDafjaI
	qEciofGkn43LVXQCJ8CWkcAmgtRtM58=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-J5MBkUwdOSm5c3FmNkKGbQ-1; Wed, 11 Jun 2025 14:21:24 -0400
X-MC-Unique: J5MBkUwdOSm5c3FmNkKGbQ-1
X-Mimecast-MFC-AGG-ID: J5MBkUwdOSm5c3FmNkKGbQ_1749666083
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d9f96f61so439495e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666083; x=1750270883;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F6DkECrmg8Fi611vvjkQjdL7MZfwTMP/mN8vE4LabKk=;
        b=p1bF4S6MWUrZw8pMEEKmGdl7G6po6ocvIrwAatIKlfTLAwymy0raevQy2v9sAE6Di1
         FKEbgQNQfcc8jQuOjtpPSHQNAeL9PigDl1C7agapYTdhYmrfUkeRin0FUHPRlQQK+ouU
         CVXzOVXYp7hZA1TuAiQGqqMajRjBZDLvp1bRRizlNX7yEX0EbBEV/O2WggmA3mAkfXnH
         7JWuu4GMEfHe/feDaP2Zu8RThFeuhM81wQqPYqUfdRcmhcFvr2ZfTUgvnpkSIaFXO6iA
         KzSOsYxrrDZrFJ0xKDqqpfnOMjRTI8Nh1Wl9qSImXWS6joanEblFsAVylfuxD7946woW
         i31g==
X-Forwarded-Encrypted: i=1; AJvYcCWaJitD8gN7qypv8YGdVTLnSSOXK05QsyFYMYAwQvv/DX3AQo7UjiCNS9alDMmSuXUJ8UeuNT+qTc1fgro=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX4BNrp3ZQWU3YdcE+jdfDJZLGZMtC/hrAXxmsX5EKoA1TTbT7
	rziPS1p8WxSMNvo3dalrRmZpmekF+a6V052BkApHT7bVe391gNng8q8aDw40UjcuQlMKKx65Xrv
	ut5tnOFkPk7ScJEt4Ys2A2hGN0yZ8d/K4r3ewZNxkJnewR2AWtd0UGY8f8BXjRtclDg==
X-Gm-Gg: ASbGnctXMo3crgAaaz/xQqsH2MvZzqmHYdBXIngtQ2/5wksuvy3bN13NNjv37D2ytA7
	E+mqeFEX4ornvslZ3jdpcEw6alo7I2d6qYD1MMUSx7ZCUbnm+kMna0PWr3QrYSkIH4fE2Cxekdo
	OXdymiiEXP7dvTzTewXl3ESmiO2nsSgdurTfW+C67+zz6WIQ3W0T6HhP5+l5oQFjZExNDKYkpXS
	1/N8MrZjlyKVh+EXv5MhyMRk4GaCuAoj5PHtFi4MEa9Lrb/IuTNe9pS7YFdPQzLzJPiSy+Y+Bpe
	HEsegXnZY9NHOcgXhZ3CEHZ9
X-Received: by 2002:a05:600c:4f42:b0:451:833f:483c with SMTP id 5b1f17b1804b1-4532486c6bamr38606245e9.7.1749666083178;
        Wed, 11 Jun 2025 11:21:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvc+jqCQP8VEUhhjVzgaJaGVswkODLfEn56DbNZb/WArkguZZUdc9A0kIxhX3+sQC+uBPZ3Q==
X-Received: by 2002:a05:600c:4f42:b0:451:833f:483c with SMTP id 5b1f17b1804b1-4532486c6bamr38605995e9.7.1749666082741;
        Wed, 11 Jun 2025 11:21:22 -0700 (PDT)
Received: from [192.168.10.81] ([151.49.64.79])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532518cc04sm28635245e9.25.2025.06.11.11.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 11:21:21 -0700 (PDT)
Message-ID: <5fee2f3b-03de-442b-acaf-4591638c8bb5@redhat.com>
Date: Wed, 11 Jun 2025 20:21:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] KVM: x86/mmu: Embed direct bits into gpa for
 KVM_PRE_FAULT_MEMORY
To: Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, rick.p.edgecombe@intel.com,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org, yan.y.zhao@intel.com,
 reinette.chatre@intel.com, kai.huang@intel.com, adrian.hunter@intel.com,
 isaku.yamahata@intel.com, Binbin Wu <binbin.wu@linux.intel.com>,
 tony.lindgren@linux.intel.com
References: <20250611001018.2179964-1-xiaoyao.li@intel.com>
 <aEnGjQE3AmPB3wxk@google.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 xsEhBFRCcBIBDqDGsz4K0zZun3jh+U6Z9wNGLKQ0kSFyjN38gMqU1SfP+TUNQepFHb/Gc0E2
 CxXPkIBTvYY+ZPkoTh5xF9oS1jqI8iRLzouzF8yXs3QjQIZ2SfuCxSVwlV65jotcjD2FTN04
 hVopm9llFijNZpVIOGUTqzM4U55sdsCcZUluWM6x4HSOdw5F5Utxfp1wOjD/v92Lrax0hjiX
 DResHSt48q+8FrZzY+AUbkUS+Jm34qjswdrgsC5uxeVcLkBgWLmov2kMaMROT0YmFY6A3m1S
 P/kXmHDXxhe23gKb3dgwxUTpENDBGcfEzrzilWueOeUWiOcWuFOed/C3SyijBx3Av/lbCsHU
 Vx6pMycNTdzU1BuAroB+Y3mNEuW56Yd44jlInzG2UOwt9XjjdKkJZ1g0P9dwptwLEgTEd3Fo
 UdhAQyRXGYO8oROiuh+RZ1lXp6AQ4ZjoyH8WLfTLf5g1EKCTc4C1sy1vQSdzIRu3rBIjAvnC
 tGZADei1IExLqB3uzXKzZ1BZ+Z8hnt2og9hb7H0y8diYfEk2w3R7wEr+Ehk5NQsT2MPI2QBd
 wEv1/Aj1DgUHZAHzG1QN9S8wNWQ6K9DqHZTBnI1hUlkp22zCSHK/6FwUCuYp1zcAEQEAAc0j
 UGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT7CwU0EEwECACMFAlRCcBICGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRB+FRAMzTZpsbceDp9IIN6BIA0Ol7MoB15E
 11kRz/ewzryFY54tQlMnd4xxfH8MTQ/mm9I482YoSwPMdcWFAKnUX6Yo30tbLiNB8hzaHeRj
 jx12K+ptqYbg+cevgOtbLAlL9kNgLLcsGqC2829jBCUTVeMSZDrzS97ole/YEez2qFpPnTV0
 VrRWClWVfYh+JfzpXmgyhbkuwUxNFk421s4Ajp3d8nPPFUGgBG5HOxzkAm7xb1cjAuJ+oi/K
 CHfkuN+fLZl/u3E/fw7vvOESApLU5o0icVXeakfSz0LsygEnekDbxPnE5af/9FEkXJD5EoYG
 SEahaEtgNrR4qsyxyAGYgZlS70vkSSYJ+iT2rrwEiDlo31MzRo6Ba2FfHBSJ7lcYdPT7bbk9
 AO3hlNMhNdUhoQv7M5HsnqZ6unvSHOKmReNaS9egAGdRN0/GPDWr9wroyJ65ZNQsHl9nXBqE
 AukZNr5oJO5vxrYiAuuTSd6UI/xFkjtkzltG3mw5ao2bBpk/V/YuePrJsnPFHG7NhizrxttB
 nTuOSCMo45pfHQ+XYd5K1+Cv/NzZFNWscm5htJ0HznY+oOsZvHTyGz3v91pn51dkRYN0otqr
 bQ4tlFFuVjArBZcapSIe6NV8C4cEiSTOwE0EVEJx7gEIAMeHcVzuv2bp9HlWDp6+RkZe+vtl
 KwAHplb/WH59j2wyG8V6i33+6MlSSJMOFnYUCCL77bucx9uImI5nX24PIlqT+zasVEEVGSRF
 m8dgkcJDB7Tps0IkNrUi4yof3B3shR+vMY3i3Ip0e41zKx0CvlAhMOo6otaHmcxr35sWq1Jk
 tLkbn3wG+fPQCVudJJECvVQ//UAthSSEklA50QtD2sBkmQ14ZryEyTHQ+E42K3j2IUmOLriF
 dNr9NvE1QGmGyIcbw2NIVEBOK/GWxkS5+dmxM2iD4Jdaf2nSn3jlHjEXoPwpMs0KZsgdU0pP
 JQzMUMwmB1wM8JxovFlPYrhNT9MAEQEAAcLBMwQYAQIACQUCVEJx7gIbDAAKCRB+FRAMzTZp
 sadRDqCctLmYICZu4GSnie4lKXl+HqlLanpVMOoFNnWs9oRP47MbE2wv8OaYh5pNR9VVgyhD
 OG0AU7oidG36OeUlrFDTfnPYYSF/mPCxHttosyt8O5kabxnIPv2URuAxDByz+iVbL+RjKaGM
 GDph56ZTswlx75nZVtIukqzLAQ5fa8OALSGum0cFi4ptZUOhDNz1onz61klD6z3MODi0sBZN
 Aj6guB2L/+2ZwElZEeRBERRd/uommlYuToAXfNRdUwrwl9gRMiA0WSyTb190zneRRDfpSK5d
 usXnM/O+kr3Dm+Ui+UioPf6wgbn3T0o6I5BhVhs4h4hWmIW7iNhPjX1iybXfmb1gAFfjtHfL
 xRUr64svXpyfJMScIQtBAm0ihWPltXkyITA92ngCmPdHa6M1hMh4RDX+Jf1fiWubzp1voAg0
 JBrdmNZSQDz0iKmSrx8xkoXYfA3bgtFN8WJH2xgFL28XnqY4M6dLhJwV3z08tPSRqYFm4NMP
 dRsn0/7oymhneL8RthIvjDDQ5ktUjMe8LtHr70OZE/TT88qvEdhiIVUogHdo4qBrk41+gGQh
 b906Dudw5YhTJFU3nC6bbF2nrLlB4C/XSiH76ZvqzV0Z/cAMBo5NF/w=
In-Reply-To: <aEnGjQE3AmPB3wxk@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On Wed, Jun 11, 2025 at 8:10 PM Sean Christopherson <seanjc@google.com> wrote:
> > +     direct_bits = 0;
> >       if (kvm_arch_has_private_mem(vcpu->kvm) &&
> >           kvm_mem_is_private(vcpu->kvm, gpa_to_gfn(range->gpa)))
> >               error_code |= PFERR_PRIVATE_ACCESS;
> > +     else
> > +             direct_bits = gfn_to_gpa(kvm_gfn_direct_bits(vcpu->kvm));
>
> Eww.  It's bad enough that TDX bleeds it's mirror needs into common MMU code,
> but stuffing vendor specific GPA bits in common code goes too far.  Actually,
> all of this goes too far.  There's zero reason any code outside of TDX needs to
> *explicitly* care whether mirrors or "direct" MMUs have mandatory gfn bits.
>
> Back to the main topic, KVM needs to have a single source of truth when it comes
> to whether a fault is private and thus mirrored (or not).  Common KVM needs to be
> aware of aliased GFN bits, but absolute nothing outside of TDX (including common
> VMX code) should be aware the mirror vs. "direct" (I hate that terminology; KVM
> has far, far too much history and baggage with "direct") is tied to the existence
> and polarity of aliased GFN bits.
>
> To detect a mirror fault:
>
>   static inline bool kvm_is_mirror_fault(struct kvm *kvm, u64 error_code)
>   {
>         return kvm_has_mirrored_tdp(kvm) &&
>                error_code & PFERR_PRIVATE_ACCESS;
>   }
>
> And for TDX, it should darn well explicitly track the shared GPA mask:
>
>   static bool tdx_is_private_gpa(struct kvm *kvm, gpa_t gpa)
>   {
>         /* For TDX the direct mask is the shared mask. */
>         return !(gpa & to_kvm_tdx(kvm)->shared_gpa_mask);
>   }

My fault - this is more similar, at least in spirit, to what
Yan and Xiaoyao had tested earlier:

diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 52acf99d40a0..209103bf0f30 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -48,7 +48,7 @@ static inline enum kvm_tdp_mmu_root_types
  static inline struct kvm_mmu_page *tdp_mmu_get_root_for_fault(struct kvm_vcpu *vcpu,
  							      struct kvm_page_fault *fault)
  {
-	if (unlikely(!kvm_is_addr_direct(vcpu->kvm, fault->addr)))
+	if (unlikely(fault->is_private))
  		return root_to_sp(vcpu->arch.mmu->mirror_root_hpa);

and I instead proposed the version that you hate with such ardor.

My reasoning was that I preferred to have the pre-fault scenario "look like"
what you get while the VM runs.

> Outside of TDX, detecting mirrors, and anti-aliasing logic, the only use of
> kvm_gfn_direct_bits() is to constrain TDP MMU walks to the appropriate gfn range.
> And for that, we can simply use kvm_mmu_page.gfn, with a kvm_x86_ops hook to get
> the TDP MMU root GFN (root allocation is a slow path, the CALL+RET is a non-issue).
>
> Compile tested only, and obviously needs to be split into multiple patches.

Also obviously needs to be delayed to 6.17, since a working fix can be a
one line change. :) (Plus your kvm_is_gfn_alias() test which should be
included anyway and independently).

What do you hate less between Yan's idea above and this patch? Just tell me
and I'll handle posting v2.

Paolo

