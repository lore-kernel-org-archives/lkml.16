Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE63262D13
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739301144; cv=none; b=dZue+i1cIn+gr4CrFpJJugjO+trLd5lLbQQVXtr8tmNN2IEHtedn16DNVLo9eaYQSgc+L7kd4FkqSuXrSk/sGAyPWN7GmCUmOPdsIKLVHWdvbCzPBbWhPCTgnSls1vbnQXZhQ0PxUa+gvWQJTmoMCFY+HUfENzGPbiaDt0MuHZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739301144; c=relaxed/simple;
	bh=X2lHVeiQCvgsTWG4ldShMFudcwDEqu2vU7n95Bksp1g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KYh50xuId/BZemRti59QfBY212exB5lFQp4VBLvhYt/LOTPGySqkYbD9IgonWoe29lnEFj0b4qE7vHEGMXi0rPqKQeo4KsaXSVhLj1g2UsD6j7PAq1QzwuVmw6f96kOMbBI5EONjUyafyj3Hk4F6jL/SilS4w1HI0f7tI3HF2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hMruvI1F; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hMruvI1F"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fa514fa6c7so6966615a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 11:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739301143; x=1739905943; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PTpX8vb40IrRH8tThk8Xp9PbVo3Mo5gqnSvnja00T+A=;
        b=hMruvI1FW0GCKBP2RLY0+6xuhau0c40Edo2TduE+nPuco9zAnVLytuvhmcDdSW7r+P
         a1DU++OIrY45CiKzMOHA8Wta4Zk/Mgn4VghV6U6Y3Lvc6Q89v3xYJr7OqfOPIQthredV
         wfs5GM7Nxsqp0GV+DcYZ/SsMnbm+RuK8Gmx3y5NRo3RaX5/4A8JkNQ65YiSKmBB7Z3CF
         5YwS6jX+QzyohXQz7lHrPvi8L36RKmUt8aamgUGAzIEYZHLJ8m4ry4AEVghKBSNrNaNW
         yRA7Rqp5nUEzwRaBKuCDBrh9KjXklKLNDxfheMEloCCvYAfUt/7cLKKlXViC5hxIIzRf
         ZLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739301143; x=1739905943;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTpX8vb40IrRH8tThk8Xp9PbVo3Mo5gqnSvnja00T+A=;
        b=KQ/GKK/2VhlDUQJbssCfPo4S3HdjnIOJj48mqgXsJ47BfShEkYi+arck7gKiA1Fiqi
         FOIJpC2RrrdcFKFaRxeduUFO+nAyWLo7tjXzAe1Xpra18rs44A5UTHwhu2GTfpwV7+P2
         LCUxtqOSodqBW4BGXvf1kNU26P3kmn2vEflt5XI9ZS+x2yVxgn2AksjJAIxIvu8scHF1
         zenGmgrKj9bXLzbxkqn0UeOlyGJ4guIsjlO8EKcjpr6x2OHtKCO+houq5Qs0G96a9aqY
         P+gjJq0B5thLwC+wdyXBFST4XCizGvVwtD1M4wTLV07hDB7K6yWyjZcaiTER3pClTmPz
         PcJg==
X-Forwarded-Encrypted: i=1; AJvYcCXB+I8ymWdPmrVq8xV0p2+PFNRBQK7hqCHP5J6aDNOo3pMxpXN66syASoUy2r4pFDRuQslbZQPQ51VSTPk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxBktDHi8XdXMRqpnpE/op2kXXAa2yUwReNOE8BkXsQaYorFu0
	nJ0rGLTGuWVs7DJzVd0nNzDTBmtmnBLKoP80DIAwUBYQAC/3U6Ay0sry5dKyhNLO2RMuewhk87A
	3Cw==
X-Google-Smtp-Source: AGHT+IGv8249oY83CM/3P+pInwQEw8t8wmWjTUc5E08ZmLN+aIBTlVARTrjh2oczuif83iwhrztL+xZK9vk=
X-Received: from pjbpm7.prod.google.com ([2002:a17:90b:3c47:b0:2ef:95f4:4619])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5485:b0:2f7:7680:51a6
 with SMTP id 98e67ed59e1d1-2fbf5bb578emr314150a91.6.1739301142742; Tue, 11
 Feb 2025 11:12:22 -0800 (PST)
Date: Tue, 11 Feb 2025 11:12:21 -0800
In-Reply-To: <20241127172654.1024-3-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241127172654.1024-1-kalyazin@amazon.com> <20241127172654.1024-3-kalyazin@amazon.com>
Message-ID: <Z6uhFYGdmcq_EWCU@google.com>
Subject: Re: [PATCH 2/2] KVM: x86: async_pf: determine x86 user as cpl == 3
From: Sean Christopherson <seanjc@google.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	vkuznets@redhat.com, xiaoyao.li@intel.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, roypat@amazon.co.uk, 
	xmarcalx@amazon.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 27, 2024, Nikita Kalyazin wrote:
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  arch/x86/kvm/x86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 8f784f07d423..168dcf1d4625 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -13360,7 +13360,7 @@ static bool kvm_can_deliver_async_pf(struct kvm_vcpu *vcpu)
>  	if (!kvm_pv_async_pf_enabled(vcpu))
>  		return false;
>  
> -	if (kvm_x86_call(get_cpl)(vcpu) == 0)
> +	if (kvm_x86_call(get_cpl)(vcpu) != 3)

Ugh, looking at the documentation (explicitly says "vcpu is in cpl == 0"), and
what KVM consideres "in kernel" in other flows, e.g. kvm_arch_vcpu_in_kernel(),
I think the existing code is working as intended.  The only thing that's "wrong"
is the name of KVM's internal variable.  Paolo will probably complain about
checking for a negative, but I think the below is actually what we want.  I'll
post a patch.

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b15cde0a9b5c..528057105c26 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -996,8 +996,8 @@ struct kvm_vcpu_arch {
                u64 msr_int_val; /* MSR_KVM_ASYNC_PF_INT */
                u16 vec;
                u32 id;
-               bool send_user_only;
                u32 host_apf_flags;
+               bool send_always;
                bool delivery_as_pf_vmexit;
                bool pageready_pending;
        } apf;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8e77e61d4fbd..c47cdccc7c5c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3544,7 +3544,7 @@ static int kvm_pv_enable_async_pf(struct kvm_vcpu *vcpu, u64 data)
                                        sizeof(u64)))
                return 1;
 
-       vcpu->arch.apf.send_user_only = !(data & KVM_ASYNC_PF_SEND_ALWAYS);
+       vcpu->arch.apf.send_always = (data & KVM_ASYNC_PF_SEND_ALWAYS);
        vcpu->arch.apf.delivery_as_pf_vmexit = data & KVM_ASYNC_PF_DELIVERY_AS_PF_VMEXIT;
 
        kvm_async_pf_wakeup_all(vcpu);
@@ -13378,8 +13378,7 @@ static bool kvm_can_deliver_async_pf(struct kvm_vcpu *vcpu)
        if (!kvm_pv_async_pf_enabled(vcpu))
                return false;
 
-       if (vcpu->arch.apf.send_user_only &&
-           kvm_x86_call(get_cpl)(vcpu) == 0)
+       if (!vcpu->arch.apf.send_always && kvm_x86_call(get_cpl)(vcpu) == 0)
                return false;
 
        if (is_guest_mode(vcpu)) {
