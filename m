Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0873586321
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 02:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738634414; cv=none; b=E/A/MyBGGdvvmw3cveoFK3+mNH8PWEpqShxEjkvH3yUIfa6/8k+aWAbqaOcwQFdOZrA5c3yg4la5ApvCxLIvmfKWF/c2TgrwYXYRC/HeysBm8RxrdP40ThmPU7Xgu0xA5T3sGQQsUmHIdgB9AsegMW4uvht3tkb2plh8laen+2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738634414; c=relaxed/simple;
	bh=LcUOXjH8eIbcE3PKBSEu/PpFrNnBo1CT9+chUuHKUB8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GdP4vxKsAOfm+FQ58spF2iJqLeouwM9+8QChG9ZHoKBXw9xU+HUr5WbLcNVB9HG3R57q9qQUI3u6ObUPqENOvyg/n1WSJLBos4ANlRVo7W6xOX/QIn/Uiq+mBNackHu7CvxarmZwZ29NImDFcfZWK0WaY7Wwtqx2zv+0ZYBKCHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wb/tz8x+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wb/tz8x+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738634411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0LGY+6/g3x0XBxaXTlefV2q5SDTNkHreDKjZyKb49XA=;
	b=Wb/tz8x+yHAngp8qzKpyYzDlO83vJw1j5naIgiZ174X1PZj97yrj1EV6v4mXto5yucSg6s
	bAqgsBzoqJ9jiGHupR78pIc+3QXfum4GhAviftth5qTGBPY3JM1+JfGDXCwT1yoUsiuNNO
	p8+W0L7JCsR7iuymbVrh6uuQS5Hvc5A=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-3KXDQAQnNr2J_4rHsjUlwg-1; Mon, 03 Feb 2025 21:00:10 -0500
X-MC-Unique: 3KXDQAQnNr2J_4rHsjUlwg-1
X-Mimecast-MFC-AGG-ID: 3KXDQAQnNr2J_4rHsjUlwg
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8e6046f0fso78948356d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 18:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738634410; x=1739239210;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0LGY+6/g3x0XBxaXTlefV2q5SDTNkHreDKjZyKb49XA=;
        b=RpIW7mGldDmID22MMVmJAr1H1W9UrfD2Iw4X8yVzjmbUmcGzTXXi07UrttpD9a/oPL
         Utc5FpsjcZyDjWaejPKjs8d1dZ2o06Vf57yJwOu9iSAeY6ox4NjaMeO2KTnTyNM3kmWw
         K89JZXLL5M2vET6YVS5OZwPq5hPMBmiJ42Zg9tL0ar3BeAfZUze3WV7BzkYSpZ/C5lSo
         zLXWt8X7fXJOM+Kxm7Puyq2V4pniWk+8i+yMPKtbjFqkDrQfbARkMxg2nc3nTyp2sBSM
         8qUCa6Y08FuFRHsCVt38I7wGF4MuK2uG/ZGJmahwCtHp0gBftAg7IxEAkfcg2G3A98FE
         0udg==
X-Forwarded-Encrypted: i=1; AJvYcCXBzQnbItBWh5Njp0wU1CN3CnRz4IoGQ5nWOG6T15jyLVCfNt5sgJ2hXKGd7TFe4GhUSbHpg7hB8TGZ/pc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQ433EnW1+nU7oCc6OL57Kb4/8aDMfUwFYnSZP00vVeZlATKV
	u4Z96SRH2AoCKR9/bLruRWh1E8+qlnrAzUTvm7J9TnAtUXCpz8DbJgLNSx3LNnaHWv92twt48WH
	uUgVPTg5NfaLVNSwtHX0PbdETgQaJm2fW7oxZRkBCjk5qlJyZMFezGZ289AMqug==
X-Gm-Gg: ASbGnct2va4QHJWoHWIkq9aaYGu9xa3QlEnhjLiThc7f2otAjQ4rrNVorViLOBuCFd3
	1hr/L7AZjyvJ5NncoJ3n+KzWLGFmVoJ+XiYDfbaqMAG3ZEVrGzA2DmFYmOPyLPWPeiDPdI/utAL
	ozQO5s7fdB/FddsdVyljJi+GZeJcx1zXU3fvaDDqg7zlu98MZrHVlP0AwPQ/E+ZtZftFwe/IF6n
	xuqFysGkuVdE+Pgz8SQ2I5NcowXNWZdAHVMok9itWiigvjguGwrxDhVbWvos/hrUzazRzozWALm
	D7q6
X-Received: by 2002:a0c:aa10:0:b0:6e2:4b52:ee21 with SMTP id 6a1803df08f44-6e24b52ef3amr229229196d6.9.1738634408541;
        Mon, 03 Feb 2025 18:00:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCeGl8IrpYydYNSTiAGp5mqvo57QRPgrWXedi9jJu3JucaqYaIT8IzzEz1g678fg0vmKpFjg==
X-Received: by 2002:a0c:aa10:0:b0:6e2:4b52:ee21 with SMTP id 6a1803df08f44-6e24b52ef3amr229228146d6.9.1738634406610;
        Mon, 03 Feb 2025 18:00:06 -0800 (PST)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e25495e831sm57070446d6.123.2025.02.03.18.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 18:00:06 -0800 (PST)
Message-ID: <30fc469b5b2ec5e2d6703979a0d09ad0a9df29e1.camel@redhat.com>
Subject: Re: [PATCH 2/3] KVM: x86: Remove use of apicv_update_lock when
 toggling guest debug state
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>,  Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Vasant Hegde <vasant.hegde@amd.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Mon, 03 Feb 2025 21:00:05 -0500
In-Reply-To: <dc6cf3403e29c0296926e3bd8f0d4e87b67f4600.1738595289.git.naveen@kernel.org>
References: <cover.1738595289.git.naveen@kernel.org>
	 <dc6cf3403e29c0296926e3bd8f0d4e87b67f4600.1738595289.git.naveen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Mon, 2025-02-03 at 22:33 +0530, Naveen N Rao (AMD) wrote:
> apicv_update_lock is not required when querying the state of guest
> debug in all the vcpus. Remove usage of the same, and switch to
> kvm_set_or_clear_apicv_inhibit() helper to simplify the code.

It might be worth to mention that the reason why the lock is not needed,
is because kvm_vcpu_ioctl from which this function is called takes 'vcpu->mutex'
and thus concurrent execution of this function is not really possible.

Besides this:

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky

> 
> Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> ---
>  arch/x86/kvm/x86.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index b2d9a16fd4d3..11235e91ae90 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -12038,19 +12038,14 @@ static void kvm_arch_vcpu_guestdbg_update_apicv_inhibit(struct kvm *kvm)
>  	struct kvm_vcpu *vcpu;
>  	unsigned long i;
>  
> -	if (!enable_apicv)
> -		return;
> -
> -	down_write(&kvm->arch.apicv_update_lock);
> -
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		if (vcpu->guest_debug & KVM_GUESTDBG_BLOCKIRQ) {
>  			set = true;
>  			break;
>  		}
>  	}
> -	__kvm_set_or_clear_apicv_inhibit(kvm, APICV_INHIBIT_REASON_BLOCKIRQ, set);
> -	up_write(&kvm->arch.apicv_update_lock);
> +
> +	kvm_set_or_clear_apicv_inhibit(kvm, APICV_INHIBIT_REASON_BLOCKIRQ, set);
>  }
>  
>  int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,




