Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F8A86321
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 01:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738632621; cv=none; b=k8J8odUyRMYXIzLnRlq6F/6HAqFCdnoj/0obhpvw96Ge2n3u44X7pv1s5XlP01+p042BMR/04MfWZfPm9geFrwXYqpiCLVdcY0AF2HDr4WWlNvkfgz+u+wquzMBNaUYpOhLes9/f5HtFUe3/StynT5idk9aJMBZUL9C9BYqsFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738632621; c=relaxed/simple;
	bh=N6TvDM0nH2INUzLNGVXaAxn7onjgXAPxe6GC5SoRom8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WdkAuC/cUgjepQk2t4VSJsORIbPZaBWi9i2QFjmy2+QEw1pS8qlY1CsuPiIKsXsUS7PsSeFQpzs8WQ2Te/VWb4wnnMO0g9wF1SroKrI32AMbF4tU4tUWgQQI9ekTM19YeIureq7CGQMDuneBrboqTiIGhA2XhKLz3TxualRetFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VbAQW7v9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VbAQW7v9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738632618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kEtPGmySAsT90Cn4z+YrK/aQ/5zLEgEGFrzIckWzW40=;
	b=VbAQW7v9/LOmKaavuVNDltnIonTmlr2Rf/esqtHQ2U+qW95X/261QRCuqXcckH+yKelVpa
	W/GoJAEJ+Ue28T4F/T6XSLpjLy2ulQGJVJrTr+c/dLl62Tpyg+pKTu0cezPASQ200cSx85
	8PFPW7jBRI+Cwhz4O1u+QB3l66XbyZE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-jxxra08ZOQiCNCgR54lPtQ-1; Mon, 03 Feb 2025 20:30:15 -0500
X-MC-Unique: jxxra08ZOQiCNCgR54lPtQ-1
X-Mimecast-MFC-AGG-ID: jxxra08ZOQiCNCgR54lPtQ
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6f943f59dso823157085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 17:30:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738632615; x=1739237415;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kEtPGmySAsT90Cn4z+YrK/aQ/5zLEgEGFrzIckWzW40=;
        b=kIMsLZLmqmHV8AqWPQuaWhoZY2XYR4ADdmhIvHxBIul/JYXMtY2v/di9p1Yvdn5Pwf
         YRnTBxKqeT6bgr3l3mmMhcu+DtD8Q/E+OUd9W2RfStxKW6csrue1kFpmNVYBIKs/WidP
         AGFmLhP5IrZdzq8UOLOytg204x3MPxlK4F+TSirZFiAi0vWLfx3zycjtAo/5eRi/45D9
         w9+9OfgAyVvbI4TY5jNW4fFAPxti7C/B9IDRGGuXGu4OoNKsbgQEPHEPgQfpsCG8NJxx
         hcu3iovOVRS31AJ4qasPsc+Zq+1Q7woRKgUCykDlUiOkCK3bA8X4cBor0ZklwCLPunqh
         4y2w==
X-Forwarded-Encrypted: i=1; AJvYcCX3T3dV+SmGqdRooffYo4wIABiuvmDJUtpsQxOQOSLStIeF4SUiX2E9BA4T6q3tGGBxWi0KHjjPclXFJiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbFH+W1qaRRfSdtbcOlbthj7+Cn5EMaCc4ix06S9KWB5qCgddr
	NR5kX/anaqED8yzd2GZ9R3Y/jqKwl9dr2aZzg4eUQIiESU6BxJWhVFAyd73JtM5QIEHLajZElPs
	YDZYrHvzfZl6fSpB4qVeUkr1j4VFyPFecX59Qtp7O4AzSNhI0lFrjRpZxDrskxg==
X-Gm-Gg: ASbGncss5RJDezIl9TZBdogVHvEPgxnoMGe7mYX5zKfbie2EbIx2iPvm5Lehg3H8kJG
	X57QWVHZePeqGUT1sj+9SRRUTxrF27RngWGZv3RYZAAktAGVfrsLhP2qK4TBkgH32q61N0s4kNt
	eRkk0rhVIpxXJa6/qAnUHJ7gPT6k0FS1pGBNmcosSq+W6KA+ToMFWGHFPwKZX7ouXS0SUYEsFr+
	DfxQrlU1Mytw/JpGPcdyXbYdqfWCDN0ijiqWf9l71tjFA6BMNAiwtRLKcLA5VWyy4VRZfyLV4d8
	DE2+
X-Received: by 2002:a05:620a:d8d:b0:7b6:d026:293 with SMTP id af79cd13be357-7bffccc5cf2mr3294139285a.9.1738632615179;
        Mon, 03 Feb 2025 17:30:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlYIWzD9OzwmupzIB0M8wCq/FE/w99pzSNI+Y/G8BzsEVGCc3Nn2YWiDO+Q8F6Zyh0IV6L/g==
X-Received: by 2002:a05:620a:d8d:b0:7b6:d026:293 with SMTP id af79cd13be357-7bffccc5cf2mr3294135585a.9.1738632614765;
        Mon, 03 Feb 2025 17:30:14 -0800 (PST)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a9205f4sm588926385a.114.2025.02.03.17.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 17:30:14 -0800 (PST)
Message-ID: <dc784d6e4f6c4478fc18e0bc2d5df56af40d0019.camel@redhat.com>
Subject: Re: [PATCH 1/3] KVM: x86: hyper-v: Convert synic_auto_eoi_used to
 an atomic
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>,  Suravee Suthikulpanit
 <suravee.suthikulpanit@amd.com>, Vasant Hegde <vasant.hegde@amd.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>
Date: Mon, 03 Feb 2025 20:30:13 -0500
In-Reply-To: <3d8ed6be41358c7635bd4e09ecdfd1bc77ce83df.1738595289.git.naveen@kernel.org>
References: <cover.1738595289.git.naveen@kernel.org>
	 <3d8ed6be41358c7635bd4e09ecdfd1bc77ce83df.1738595289.git.naveen@kernel.org>
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
> apicv_update_lock is primarily meant for protecting updates to the apicv
> state, and is not necessary for guarding updates to synic_auto_eoi_used.
> Convert synic_auto_eoi_used to an atomic and use
> kvm_set_or_clear_apicv_inhibit() helper to simplify the logic.
> 
> Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> ---
>  arch/x86/include/asm/kvm_host.h |  7 ++-----
>  arch/x86/kvm/hyperv.c           | 17 +++++------------
>  2 files changed, 7 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 5193c3dfbce1..fb93563714c2 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1150,11 +1150,8 @@ struct kvm_hv {
>  	/* How many vCPUs have VP index != vCPU index */
>  	atomic_t num_mismatched_vp_indexes;
>  
> -	/*
> -	 * How many SynICs use 'AutoEOI' feature
> -	 * (protected by arch.apicv_update_lock)
> -	 */
> -	unsigned int synic_auto_eoi_used;
> +	/* How many SynICs use 'AutoEOI' feature */
> +	atomic_t synic_auto_eoi_used;
>  
>  	struct kvm_hv_syndbg hv_syndbg;
>  
> diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
> index 6a6dd5a84f22..7a4554ea1d16 100644
> --- a/arch/x86/kvm/hyperv.c
> +++ b/arch/x86/kvm/hyperv.c
> @@ -131,25 +131,18 @@ static void synic_update_vector(struct kvm_vcpu_hv_synic *synic,
>  	if (auto_eoi_old == auto_eoi_new)
>  		return;
>  
> -	if (!enable_apicv)
> -		return;
> -
> -	down_write(&vcpu->kvm->arch.apicv_update_lock);
> -
>  	if (auto_eoi_new)
> -		hv->synic_auto_eoi_used++;
> +		atomic_inc(&hv->synic_auto_eoi_used);
>  	else
> -		hv->synic_auto_eoi_used--;
> +		atomic_dec(&hv->synic_auto_eoi_used);
>  
>  	/*
>  	 * Inhibit APICv if any vCPU is using SynIC's AutoEOI, which relies on
>  	 * the hypervisor to manually inject IRQs.
>  	 */
> -	__kvm_set_or_clear_apicv_inhibit(vcpu->kvm,
> -					 APICV_INHIBIT_REASON_HYPERV,
> -					 !!hv->synic_auto_eoi_used);
> -
> -	up_write(&vcpu->kvm->arch.apicv_update_lock);
> +	kvm_set_or_clear_apicv_inhibit(vcpu->kvm,
> +				       APICV_INHIBIT_REASON_HYPERV,
> +				       !!atomic_read(&hv->synic_auto_eoi_used));

Hi,

This introduces a race, because there is a race window between
the moment we read hv->synic_auto_eoi_used, and decide to set/clear the inhibit.

After we read hv->synic_auto_eoi_used, but before we call the kvm_set_or_clear_apicv_inhibit,
other core might also run synic_update_vector and change hv->synic_auto_eoi_used, 
finish setting the inhibit in kvm_set_or_clear_apicv_inhibit,
and only then we will call kvm_set_or_clear_apicv_inhibit with the stale value of hv->synic_auto_eoi_used and clear it.

IMHO, knowing that this code is mostly a precaution and that modern windows doesn't use AutoEOI
(at least when AutoEOI deprecation bit is set), instead of counting, we can unconditionally
inhibit the APICv when the guest attempts to use AutoEOI once.
But as usual I won't be surprised that this breaks *some* old and/or odd windows versions.

Best regards,
	Maxim Levitsky





>  }
>  
>  static int synic_set_sint(struct kvm_vcpu_hv_synic *synic, int sint,




