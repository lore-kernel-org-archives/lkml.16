Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BFF2BD1B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 03:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743566273; cv=none; b=a7N7f8Jx5zG57wZdkFgQVvMUVBWmS6mttSYR7aAaXWknGKt9fjXz8olPHHDG+VjX6/NfzOSiENWEBf23M9OVN618cRFsb9/9rI6UP7Cv2hKcMJoN/whLkw8C+9mTo+sk8iAHwt5vl4D9kzv5XaPkyevqB55NfqyPjhfV1JaLPGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743566273; c=relaxed/simple;
	bh=DH0xkte9wSZlLFbj86lkczi4h1F+DZB1Qssy9mm2Sps=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bl0Fl2bMzrx3hW2a7iTsvv5lNGxD4xwJTj2w45DeDbouaTm7ihv0ztcKUdghWFxx5qfsPXKMRamYPAyoZ0CG9n3SgmxkvF79S1GMYn45sySo+XVWrCPDx8EZ0FuKJGh+jcqGIi8fhbNrrQRu/zR9jsMtzAUO7VHWr85bZXfdq5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h13qjSew; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h13qjSew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743566269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3EHpwcZb7JUmljhMaKtSiGAnELfOUqWRS3brLGJeZJs=;
	b=h13qjSewOus44eq8Q5UPNFcCeCrVWSvmAxJoA/dbkWZvRLZyJtR6FvxKmEY7a1u5ww0E4f
	3aQMT7S7hmWp7jMDdYVQZNfw+vriZCi6z3Whwi6htKmmlnC0nXnxE//63Ia8ihEviGP3RG
	2BEHnUlvxcfxXqpDzThWXNI3GjEbxUg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-503-vDQtu9J1POiCrCJy63mJkg-1; Tue, 01 Apr 2025 23:57:48 -0400
X-MC-Unique: vDQtu9J1POiCrCJy63mJkg-1
X-Mimecast-MFC-AGG-ID: vDQtu9J1POiCrCJy63mJkg_1743566268
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eb1e240eddso108021546d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 20:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743566268; x=1744171068;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3EHpwcZb7JUmljhMaKtSiGAnELfOUqWRS3brLGJeZJs=;
        b=R2La4bNXHADc64y/aaPIXCdFzWsVli+sQPGVs4fWeht30DEMLTczChQHgVHl2q9HKD
         SsjBr69YTSX6l00FvR5SJ9BEhmMxRBQFc09WqLZSqY9bjqSLltxJT+ZojwDFSllwTUeR
         NDth6XLK+OmoIZ1LMGG3d6IIc6Mriw3CrjP+zmUbI7ufJ7oBoXQIXegNACo8oCmLgWFX
         ZnE9/NdgySC83zIpBFwP86UPpB04hAvf+WEIhkwHGu0rJiA57D8PnKzCLsRXlQXGcizU
         smSTXR3sHr60MDWdsPu64VAnrTVoFHqooYpUzdyU1JTHk04Yz/sivBGlGRXHMiuKBGQH
         38PA==
X-Forwarded-Encrypted: i=1; AJvYcCUUGYege/lSODz8/s4fVl4ZE1vv+YoviRSjcB/yTxnSgtoKHvwITkvuMAu+5/OFAbJCoAjbjMiYRXi+bBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB2uls48dOwCCNkCyUN0tg4NFv9MfyzIvN2EsR8l5Ld5tY+/FA
	t2NGofncjqJtuD6Tn0qyECB9IGMlGME5rgSS/L/G00MsUPN0HRbDlWYsRCCwBYe/zNg7X9qKzlP
	Sw/8deWa1ljVEPs8ipyYlnS/yf67aiIAhfusA9qbl69eh1fBf+38sF66FBpMPCQ==
X-Gm-Gg: ASbGnctZ3S22wYHJM1RP5IFN0BER9k7k7wt7VhSOT75dgHy7YAGNUbNE+eriCw2HtoH
	eEMhUr3Iw/krE0oxS8aFaICznc6pXIGJ2Zq2+HQPSaswNYxTUt7vC2b+jSAwPPnH0ul7rPAGbsH
	JdnjeCx9kE8t6H7/xlqQPIj/2OiPzvFzH1wRBA4XvUHYvE+T0fmAIMuDy/qCKnD5qd6Zbdag/oB
	hZFl56D1nFKBCCk04XdkRFIT7rIXvc6Wm85E3ZAC/VSG8ZB590uPltr1l4Hn4NBHHl1Z7bQFIOu
	OI3g9i1vS4s49sc=
X-Received: by 2002:a05:6214:2aa5:b0:6e8:9e8f:cfb with SMTP id 6a1803df08f44-6eed6206676mr224142886d6.24.1743566267944;
        Tue, 01 Apr 2025 20:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTy8f/TqXcAZv/pjj+xQyEtLlNlg8iTt+rX63O+3pxxtogDwH24TIpcDDtJ6plNopV6w6gMw==
X-Received: by 2002:a05:6214:2aa5:b0:6e8:9e8f:cfb with SMTP id 6a1803df08f44-6eed6206676mr224142706d6.24.1743566267609;
        Tue, 01 Apr 2025 20:57:47 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9643e23sm70638476d6.26.2025.04.01.20.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:57:47 -0700 (PDT)
Message-ID: <1b0fbad5b2be164da13034fe486c207d8a19f5e7.camel@redhat.com>
Subject: Re: [PATCH v3 0/6] KVM: SVM: Fix DEBUGCTL bugs
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Ravi Bangoria
	 <ravi.bangoria@amd.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	rangemachine@gmail.com, whanos@sergal.fun
Date: Tue, 01 Apr 2025 23:57:46 -0400
In-Reply-To: <20250227222411.3490595-1-seanjc@google.com>
References: <20250227222411.3490595-1-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Thu, 2025-02-27 at 14:24 -0800, Sean Christopherson wrote:
> Fix a long-lurking bug in SVM where KVM runs the guest with the host's
> DEBUGCTL if LBR virtualization is disabled.  AMD CPUs rather stupidly
> context switch DEBUGCTL if and only if LBR virtualization is enabled (not
> just supported, but fully enabled).
> 
> The bug has gone unnoticed because until recently, the only bits that
> KVM would leave set were things like BTF, which are guest visible but
> won't cause functional problems unless guest software is being especially
> particular about #DBs.
> 
> The bug was exposed by the addition of BusLockTrap ("Detect" in the kernel),
> as the resulting #DBs due to split-lock accesses in guest userspace (lol
> Steam) get reflected into the guest by KVM.
> 
> Note, I don't love suppressing DEBUGCTL.BTF, but practically speaking that's
> likely the behavior that SVM guests have gotten the vast, vast majority of
> the time, and given that it's the behavior on Intel, it's (hopefully) a safe
> option for a fix, e.g. versus trying to add proper BTF virtualization on the
> fly.
> 
> v3:
>  - Suppress BTF, as KVM doesn't actually support it. [Ravi]
>  - Actually load the guest's DEBUGCTL (though amusingly, with BTF squashed,
>    it's guaranteed to be '0' in this scenario). [Ravi]
> 
> v2:
>  - Load the guest's DEBUGCTL instead of simply zeroing it on VMRUN.
>  - Drop bits 5:3 from guest DEBUGCTL so that KVM doesn't let the guest
>    unintentionally enable BusLockTrap (AMD repurposed bits). [Ravi]
>  - Collect a review. [Xiaoyao]
>  - Make bits 5:3 fully reserved, in a separate not-for-stable patch.
> 
> v1: https://lore.kernel.org/all/20250224181315.2376869-1-seanjc@google.com
> 


Hi,

Amusingly there is another DEBUGCTL issue, which I just got to the bottom of.
(if I am not mistaken of course).

We currently don't let the guest set DEBUGCTL.FREEZE_WHILE_SMM and neither
set it ourselves in GUEST_IA32_DEBUGCTL vmcs field, even when supported by the host
(If I read the code correctly, I didn't verify this in runtime)

This means that the host #SMIs will interfere with the guest PMU.
In particular this causes the 'pmu' kvm-unit-test to fail, which is something that our CI caught.

I think that kvm should just set this bit, or even better, use the host value of this bit,
and hide it from the guest, because the guest shouldn't know about host's smm, 
and we AFAIK don't really support freezing perfmon when the guest enters its own emulated SMM.

What do you think? I'll post patches if you think that this is a good idea.
(A temp hack to set this bit always in GUEST_IA32_DEBUGCTL fixed the problem for me)

I also need to check if AMD also has this feature, or if this is Intel specific.

Best regards,
	Maxim Levitsky

> 
> Sean Christopherson (6):
>   KVM: SVM: Drop DEBUGCTL[5:2] from guest's effective value
>   KVM: SVM: Suppress DEBUGCTL.BTF on AMD
>   KVM: x86: Snapshot the host's DEBUGCTL in common x86
>   KVM: SVM: Manually context switch DEBUGCTL if LBR virtualization is
>     disabled
>   KVM: x86: Snapshot the host's DEBUGCTL after disabling IRQs
>   KVM: SVM: Treat DEBUGCTL[5:2] as reserved
> 
>  arch/x86/include/asm/kvm_host.h |  1 +
>  arch/x86/kvm/svm/svm.c          | 24 ++++++++++++++++++++++++
>  arch/x86/kvm/svm/svm.h          |  2 +-
>  arch/x86/kvm/vmx/vmx.c          |  8 ++------
>  arch/x86/kvm/vmx/vmx.h          |  2 --
>  arch/x86/kvm/x86.c              |  2 ++
>  6 files changed, 30 insertions(+), 9 deletions(-)
> 
> 
> base-commit: fed48e2967f402f561d80075a20c5c9e16866e53


