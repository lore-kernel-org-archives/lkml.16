Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532731DA62E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743534270; cv=none; b=nutqyXv5FXN/sxDeRntMKtwEoBJoRqjdldHxF4iDEhEhfwntvNCmbi+wleLuti2RalDiItWHafusvqbNka/vvye/Bo1cF+NLg2N512U6H+zCdrQxHkqxkS6KuUkyXPy500BLlv+geBx21Q3vnDVaajR4c2lpOFCknxgNdqCh5K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743534270; c=relaxed/simple;
	bh=ZA8WLLQSRnBdeI7oPmhuG3QFKCFrkE3uu8PKti+PBHQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ij5NAUxmH2rPttLv+T68QutS6Uo+VncKWZM/os5mbwth1EBVC8iIBO7FncQH/OqeR7416SVPgObUCVRyeqn/1k3Bc1TcbpPzCUl4RqWuCrWtmY8k4O/bItwWqx8llW55ehIdIEVXOaO5TUiQWkOB55D9Fb7O2Yngz9U5vy2z5MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HX1/3oSN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HX1/3oSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743534267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LKDYucSS97pnhgHvj6/5ba13WSnYs1hpEZo6Z/7tAc=;
	b=HX1/3oSNAU8cOUJyV2L/SBjqjjR+v+94rdoDS7A0lLyIhBeJELd7o/g3ugMXNn+/m9+47M
	hF5/3cLPH7f1emeJr8c9zjGMdlswsRq/mhkGFTBJWlGLeYhrsFRn6DQkVGJ9jm/uod1upB
	UWYTxQyAcvaN5G3NlW3yoVgmzPOODUw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-Qwojy8qXNMK1CPmrJ61LlA-1; Tue, 01 Apr 2025 15:04:26 -0400
X-MC-Unique: Qwojy8qXNMK1CPmrJ61LlA-1
X-Mimecast-MFC-AGG-ID: Qwojy8qXNMK1CPmrJ61LlA_1743534266
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8feea216aso2923296d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 12:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743534265; x=1744139065;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LKDYucSS97pnhgHvj6/5ba13WSnYs1hpEZo6Z/7tAc=;
        b=XJFGXwzGr8K36vqV3VeAyZs1itlPdl1+hhq2GxsGhXlKPdWyrKXTbGf3mQCc8M2v+w
         zzFvN6oxh1j1065PcEkbXwoaeWxg/NnKoxBelRYs97Et5Q5BMXfQj+ozYdggB0nDai7d
         hPRfkj+puAUpm4+nAdcpejD7L1Xr31z6MLO4szyyNCuOuJUwCUh4THN2PGvgT39yrfZs
         yIZ2E8noYIvG0MDfWV8FwJQVQNn5u7/xztdtmuyqUVmI+0jsqunfgp8a6svzL0HNo6Zw
         mG5DFEzQxnyB++vw1VRAAo3nRku9OZiNTR0Vc3eUiZxVX6sW+2r5Vtx9bgJdHTX0Q0tB
         SEEg==
X-Forwarded-Encrypted: i=1; AJvYcCXADei72I8H0ExZSuqXHyO2qs2+ieannXPF1xIa+25ZBAVwy7wbEmZYn7ahlF4G9lCN2NNgdn/D6tmjYWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAS1EqhyZgxUsv9LCEPMrQuAxo2FM0oI1NdtbMzMfxs0eH3/Oo
	f9C37t6PJs+Wy8TA64Rgi+OPSTFNaqOFAVi3I0x78eM5tRiTbzNPNCjztCFSi+WezPQ8bwRp9B+
	BxsKCJ8bJjJHpJ4b8AN+dWiNL1+UvALzou9NMaP+OH2xGaqs3WFrpdkHoizdbYQ==
X-Gm-Gg: ASbGncsgKN5xEGhL6Yf/6pFVoYoRadB6QDHKkVYVafTMgxhhuCV/gYJTovU6yFeQ7dk
	066MnO3ioAGbrfF8uaLBOjYzsoRvoKcnhChSEWiM8LpKcsAkdkZBnxi3ea3a+izh2BdZIfR0QWj
	1gjuYp2kd6kZPCHe3gYF7ff8jkBNzHjzaz+cCYjZIwjarW4Z4miawFLFKbb5kN4zBod2ORVk4L2
	6/2lHe0Weo+k45Sjm3wE9E8W8GdXXj0i6DJ6pgHNnBppq5e6Y7PiIPK9trOsLRjM083xBF1ojRg
	C7wlmZ0Iy+wio5o=
X-Received: by 2002:a0c:ed2f:0:b0:6e8:f387:e0d2 with SMTP id 6a1803df08f44-6ef007f4899mr13121736d6.11.1743534265653;
        Tue, 01 Apr 2025 12:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECRXXZWchA57oOedz8AT78HpF5eHX9r+gsD8ZcFuy0bS8m37e7vAC5QG33T44tol8BiKAbdw==
X-Received: by 2002:a0c:ed2f:0:b0:6e8:f387:e0d2 with SMTP id 6a1803df08f44-6ef007f4899mr13121496d6.11.1743534265400;
        Tue, 01 Apr 2025 12:04:25 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec965a40bsm64992426d6.61.2025.04.01.12.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:04:25 -0700 (PDT)
Message-ID: <7ddba836af37493764c56098a46aad7ee202b6ba.camel@redhat.com>
Subject: Re: [PATCH 1/2] KVM: VMX: Assert that IRQs are disabled when
 putting vCPU on PI wakeup list
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Yan Zhao
	 <yan.y.zhao@intel.com>
Date: Tue, 01 Apr 2025 15:04:24 -0400
In-Reply-To: <20250401154727.835231-2-seanjc@google.com>
References: <20250401154727.835231-1-seanjc@google.com>
	 <20250401154727.835231-2-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, 2025-04-01 at 08:47 -0700, Sean Christopherson wrote:
> Assert that IRQs are already disabled when putting a vCPU on a CPU's PI
> wakeup list, as opposed to saving/disabling+restoring IRQs.  KVM relies on
> IRQs being disabled until the vCPU task is fully scheduled out, i.e. until
> the scheduler has dropped all of its per-CPU locks (e.g. for the runqueue),
> as attempting to wake the task while it's being scheduled out could lead
> to deadlock.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/posted_intr.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
> index ec08fa3caf43..840d435229a8 100644
> --- a/arch/x86/kvm/vmx/posted_intr.c
> +++ b/arch/x86/kvm/vmx/posted_intr.c
> @@ -148,9 +148,8 @@ static void pi_enable_wakeup_handler(struct kvm_vcpu *vcpu)
>  	struct pi_desc *pi_desc = vcpu_to_pi_desc(vcpu);
>  	struct vcpu_vmx *vmx = to_vmx(vcpu);
>  	struct pi_desc old, new;
> -	unsigned long flags;
>  
> -	local_irq_save(flags);
> +	lockdep_assert_irqs_disabled();
>  
>  	raw_spin_lock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
>  	list_add_tail(&vmx->pi_wakeup_list,
> @@ -176,8 +175,6 @@ static void pi_enable_wakeup_handler(struct kvm_vcpu *vcpu)
>  	 */
>  	if (pi_test_on(&new))
>  		__apic_send_IPI_self(POSTED_INTR_WAKEUP_VECTOR);
> -
> -	local_irq_restore(flags);
>  }
>  
>  static bool vmx_needs_pi_wakeup(struct kvm_vcpu *vcpu)


Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky

