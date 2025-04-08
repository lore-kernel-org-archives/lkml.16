Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44A224887
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744124923; cv=none; b=AOufoRBpL1phj6UmHvo5Hggah/49MysjvtOPp5YTGKUwSbNA67f0Rpl9r444ndL1DvktqMrKTKMtrPzAoJLDAEwKxC0b/zRrQVWfM5V98zUlPaIpOBPsMhft+pJ0Gx58879UXNjGugiX6pOkLcmC/OJnpYSX6u5KKc4A+OY3nEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744124923; c=relaxed/simple;
	bh=HNXnbhfmGDZM+xj/jEAWizg89ODfflpmEZ5rbDsSo8I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=st88s0cMNQErIPzf74yeVlOpO9jGwmrOEoAM+R78Rn6j7ywApflMbWZV/MnG5nxLl5hMrnTir1yzMfpAcVx3Z8048UrajVy5hyhdLrYnNWqR41agZaE5EU6vsTz3tjhJQM1keI+4CD3B3O8dyGaU/eNV080YmqtLgzGX7vUEt/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+irhamy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+irhamy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744124919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZrKnbR932NuSRMO08mOFLU+K3sEyi6GgonUlzMLmrM=;
	b=I+irhamyI9vnvV/QRvOZf9TE/OEPesJjKFOxi025ouQEvsZB4vQ7paBaMTWvuizeWA68Ya
	iiWfH2qCxeQhJ4kquzhMK+ti9DvrFyROiqhkQmlBzkx3elvQ8meVUJ3UerDlSAb9ypF/0U
	8oMh3a8bQEbp01OFuSZ+3ztojDPpnfM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-lmsstM-eNEGyQAjjlV84DA-1; Tue, 08 Apr 2025 11:08:37 -0400
X-MC-Unique: lmsstM-eNEGyQAjjlV84DA-1
X-Mimecast-MFC-AGG-ID: lmsstM-eNEGyQAjjlV84DA_1744124917
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c572339444so904365785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 08:08:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124917; x=1744729717;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZrKnbR932NuSRMO08mOFLU+K3sEyi6GgonUlzMLmrM=;
        b=OyWEyaKyOsRQQza0oAMXU8O2rw4YTmkhDqFJC0jyOyAlzwqxajUVLShtCmtOFW09za
         2e7eG1V0PJWAm/9Qpj2dt3je/ao6zHZ3sAo4PMK2ffXklbfA7Syc7BYl/zaD3LYZFeh9
         a0xrglIiwVxquxwGxmQ0MKKKC5JZ9clxKGLLgqEkGFPahsRuUQaOEjG6lqh5QhR0/XUg
         bQz1qHDw7j0VX85kfz0YzCbsg3+C1wjcWl3B4G2Cc3BotEDwW2//6dQ909fwRnEyKI0f
         ZfKKMNmNlrrIUwTXhhSO0XJH1PX0eOiRvxf71PB29KrNWPjtHHkksak/2TEmpGlXUyft
         AgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzLvLgW/dFws71V0hx0DRbElA6ht/GnPtrcl9vHW6l3LzELcP886pHx9EnFRzQxilp5TfHVb9zp37ZEEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJj63K52K6yuNvid6ZqWCLaFG7xoNM7RYOYo2RGmEMb4LC8l9z
	jAP+nRrrHZgpgIsya6FD5qGN2lvcgY3tR3TgKsUbyrfZuvvQ1j8nqO9aViAsRnDurQFRF/dc0l2
	PPz+D5IL96QwrlXyNhA05FU2CmHEFMqZBhNU8owPfiZ6WgRu8vh2H9YOym8EQEA==
X-Gm-Gg: ASbGncuUlQaQosKm7Xy5iV2NnbxxVbQl3v+Mxu/GmpwMvh4Ii9HqEm5LGmfeKJDLiVR
	ijMWFSNs1dflh74SzPA6U83LZOJOTZFn8oUI0daTyFUNnyTqSGzYut85o68NwGt+bu7MsYzN/9g
	5RBXWD3+Q65/DcKUyn0fDX+qKVqUkePiDuM33RlqyBtFEu0XKIQ7E8semmzzs2vkxaNG4GFZaxR
	T+2cqUvWPbqJNuJ/8a/GMLvs029m/gZJYi7WYP938DgvAEdVHrome1UMf2MeJWC701qsOjLardE
	zVHrd9U2Khzb1r8=
X-Received: by 2002:a05:620a:2953:b0:7c5:f6be:bdae with SMTP id af79cd13be357-7c77dd878d3mr1889955585a.20.1744124917231;
        Tue, 08 Apr 2025 08:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyjwRvAMPsc7+/yZsuoA8Vm8+KGnJEimLkd/evsKpNc1uqTkvyoDqNHIFRzfthudHDVbRBSw==
X-Received: by 2002:a05:620a:2953:b0:7c5:f6be:bdae with SMTP id af79cd13be357-7c77dd878d3mr1889951085a.20.1744124916873;
        Tue, 08 Apr 2025 08:08:36 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e5dc169sm778625785a.0.2025.04.08.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:08:36 -0700 (PDT)
Message-ID: <1371fec40588247a5f3d42f1b0f21cf4d0f5bc4e.camel@redhat.com>
Subject: Re: [PATCH v3 0/6] KVM: SVM: Fix DEBUGCTL bugs
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Ravi Bangoria
	 <ravi.bangoria@amd.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	rangemachine@gmail.com, whanos@sergal.fun
Date: Tue, 08 Apr 2025 11:08:35 -0400
In-Reply-To: <1b0fbad5b2be164da13034fe486c207d8a19f5e7.camel@redhat.com>
References: <20250227222411.3490595-1-seanjc@google.com>
	 <1b0fbad5b2be164da13034fe486c207d8a19f5e7.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2025-04-01 at 23:57 -0400, Maxim Levitsky wrote:
> On Thu, 2025-02-27 at 14:24 -0800, Sean Christopherson wrote:
> > Fix a long-lurking bug in SVM where KVM runs the guest with the host's
> > DEBUGCTL if LBR virtualization is disabled.  AMD CPUs rather stupidly
> > context switch DEBUGCTL if and only if LBR virtualization is enabled (not
> > just supported, but fully enabled).
> > 
> > The bug has gone unnoticed because until recently, the only bits that
> > KVM would leave set were things like BTF, which are guest visible but
> > won't cause functional problems unless guest software is being especially
> > particular about #DBs.
> > 
> > The bug was exposed by the addition of BusLockTrap ("Detect" in the kernel),
> > as the resulting #DBs due to split-lock accesses in guest userspace (lol
> > Steam) get reflected into the guest by KVM.
> > 
> > Note, I don't love suppressing DEBUGCTL.BTF, but practically speaking that's
> > likely the behavior that SVM guests have gotten the vast, vast majority of
> > the time, and given that it's the behavior on Intel, it's (hopefully) a safe
> > option for a fix, e.g. versus trying to add proper BTF virtualization on the
> > fly.
> > 
> > v3:
> >  - Suppress BTF, as KVM doesn't actually support it. [Ravi]
> >  - Actually load the guest's DEBUGCTL (though amusingly, with BTF squashed,
> >    it's guaranteed to be '0' in this scenario). [Ravi]
> > 
> > v2:
> >  - Load the guest's DEBUGCTL instead of simply zeroing it on VMRUN.
> >  - Drop bits 5:3 from guest DEBUGCTL so that KVM doesn't let the guest
> >    unintentionally enable BusLockTrap (AMD repurposed bits). [Ravi]
> >  - Collect a review. [Xiaoyao]
> >  - Make bits 5:3 fully reserved, in a separate not-for-stable patch.
> > 
> > v1: https://lore.kernel.org/all/20250224181315.2376869-1-seanjc@google.com
> > 
> 
> Hi,
> 
> Amusingly there is another DEBUGCTL issue, which I just got to the bottom of.
> (if I am not mistaken of course).
> 
> We currently don't let the guest set DEBUGCTL.FREEZE_WHILE_SMM and neither
> set it ourselves in GUEST_IA32_DEBUGCTL vmcs field, even when supported by the host
> (If I read the code correctly, I didn't verify this in runtime)
> 
> This means that the host #SMIs will interfere with the guest PMU.
> In particular this causes the 'pmu' kvm-unit-test to fail, which is something that our CI caught.
> 
> I think that kvm should just set this bit, or even better, use the host value of this bit,
> and hide it from the guest, because the guest shouldn't know about host's smm, 
> and we AFAIK don't really support freezing perfmon when the guest enters its own emulated SMM.
> 
> What do you think? I'll post patches if you think that this is a good idea.
> (A temp hack to set this bit always in GUEST_IA32_DEBUGCTL fixed the problem for me)
> 
> I also need to check if AMD also has this feature, or if this is Intel specific.

Any update?

Best regards,
	Maxim Levitsky

> 
> Best regards,
> 	Maxim Levitsky
> 
> > Sean Christopherson (6):
> >   KVM: SVM: Drop DEBUGCTL[5:2] from guest's effective value
> >   KVM: SVM: Suppress DEBUGCTL.BTF on AMD
> >   KVM: x86: Snapshot the host's DEBUGCTL in common x86
> >   KVM: SVM: Manually context switch DEBUGCTL if LBR virtualization is
> >     disabled
> >   KVM: x86: Snapshot the host's DEBUGCTL after disabling IRQs
> >   KVM: SVM: Treat DEBUGCTL[5:2] as reserved
> > 
> >  arch/x86/include/asm/kvm_host.h |  1 +
> >  arch/x86/kvm/svm/svm.c          | 24 ++++++++++++++++++++++++
> >  arch/x86/kvm/svm/svm.h          |  2 +-
> >  arch/x86/kvm/vmx/vmx.c          |  8 ++------
> >  arch/x86/kvm/vmx/vmx.h          |  2 --
> >  arch/x86/kvm/x86.c              |  2 ++
> >  6 files changed, 30 insertions(+), 9 deletions(-)
> > 
> > 
> > base-commit: fed48e2967f402f561d80075a20c5c9e16866e53


