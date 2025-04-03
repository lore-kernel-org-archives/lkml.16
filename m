Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA03A25A64C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743710224; cv=none; b=VqbqHcQN8pdNq1Y7KHndYTGy/bMDjen4Jq4MgmXBFTk/oyKt6X7HtmFliPDXG4c0KfFDKkX8xRyBKotp3b8l8gNM9rNp1oyBn+xlFQUoVRaiUnLAbKZ5q6uc7iEeGiP/Djz3q5t1J/6ATiMBPsa0yGOd+Lxm6t/6/PH8DLcVQGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743710224; c=relaxed/simple;
	bh=XP6la/5I4vrerXRk12ckyABr65qx/Q0V+n/zX+V4iGE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rr+4UrYqjTCDR4zavzXyPhWIYDZ+dCE995lE31/cyka6IiqAKl5H8hoo/9ACoaK1eBjYSG4SYZeTO7E4ZJnOp2Of0QqqGSp3VEQlQO4jJ7jm1KE//EE/vk0lu1AHE6cQNEq7Pq+mLu2tywWH8ZgbL3vmpfcCfx2w6nzWhUoytQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WjkUXyhZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WjkUXyhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743710221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1wzSVzgHMpe559xrytJJz1DdoYHYjfgbIpwM8R8lgqw=;
	b=WjkUXyhZdA0hQbVAV7NrjHz2m45HPKtHMI/DPtV0dDQXtos1SJdTmc/bMfBIpg21xez6B1
	qOg+Lahn/AIy4Zp0WtXCW8qbwYpPrOycueldP+RHRpo0oDgXWCRF+QZ/Z/mxgdvQqNyX+5
	LrrtQxSStDrHExWU7zyyiHUVjSxmmt0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-zOpUjt3HMPeMxstCyj_EAA-1; Thu, 03 Apr 2025 15:57:00 -0400
X-MC-Unique: zOpUjt3HMPeMxstCyj_EAA-1
X-Mimecast-MFC-AGG-ID: zOpUjt3HMPeMxstCyj_EAA_1743710219
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e916df0d5dso21852156d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743710219; x=1744315019;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1wzSVzgHMpe559xrytJJz1DdoYHYjfgbIpwM8R8lgqw=;
        b=gB0x/IqtX4gKXQc29Jo4zATd5yXRjiuDkOqJRdQaBtchQhktDWeCR4x4TwCFVIYoDB
         N40F/hHN9zy2W8vqGi1qIpBTVwDQgec7inJeK0JAJmDEb/zun3nztejRbXFoS0FUaNz9
         PNKNub10wFNeWutlYTyrikBDA7Bia6JnOwyrtYUEYAPyuRajeCKLx1WUCcnSmsyGrfaw
         7SvsElcXDK6bLBF9FYzxq/L8fFJgtKQ0A2DOVCQyQgIKFa0CU5xW5fhEOjSVka57UT2R
         O+7h1bZNGsE+zXu9pSNdiV3ndq8W6m379a7h+j8xoVAKH4zPXYZ8z5EWoyYEVd46sOvk
         BD1A==
X-Forwarded-Encrypted: i=1; AJvYcCWMW0Ap//GNP9f0qaldKbw5vQ+EJplRvHlYEMqiJcEY4xakXX4LyxJ/afIgfz/D7Np6i4CET2CaVogqps4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy18j/TDCNQj6eJ3MyaGVgdXOWsRnXIRdi4Hk03enl2xJtAQ5ZF
	wvTnB2A9mrLhiux43vWdxnfMLPwrP1ShIhCIAgQ4ndF3bX/YM85llV4vTIujooIsSMKzwFNUksm
	IF0K7YtHsu49BnywpBLnyfI3yBL7FJ+sJDrLVBtHbMaynigsyMFLpJ2UKdD5mRg==
X-Gm-Gg: ASbGncvkILlTeEpBwknbNATczaDL7kVPO/RlTlfO18LtvwbMrdstR7TbHCWeFk0BF81
	e7Q+lp2hjvwZM0MZGLKv4y79vzv4bk44VkFjya5Bdc4PuwIkGrkslmslbI6pwh+AIeXyut+m8yo
	PLLRQN6AEQdOl6xOV3WfWbp9CCrXiqSMneU+eUbipXk7OSjxnES6hOJmBiAGK0rthUVqhYplnfz
	OysMwfMqbROefW78G6GsvwNDOCs3MaBTUDw+yfKLdw09XWdZSH2duJ5QscrtBYpv+IksYup1EWs
	bRVN9k9QLQVNOfo=
X-Received: by 2002:a05:6214:48e:b0:6e4:2c6e:7cdc with SMTP id 6a1803df08f44-6f00df30191mr10260326d6.25.1743710219679;
        Thu, 03 Apr 2025 12:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVIXRAK4HfdDj8AW0GRSVQfM3QvF38VAmhcghiRMazHZw/QKTjocVYWwH1sKoV4Gt6kbqVoA==
X-Received: by 2002:a05:6214:48e:b0:6e4:2c6e:7cdc with SMTP id 6a1803df08f44-6f00df30191mr10259966d6.25.1743710219402;
        Thu, 03 Apr 2025 12:56:59 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f13791esm11197956d6.77.2025.04.03.12.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:56:59 -0700 (PDT)
Message-ID: <91da48828941bd692b3b9372e57d312f938756bd.camel@redhat.com>
Subject: Re: [RFC PATCH 02/24] KVM: SVM: Use cached local variable in
 init_vmcb()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 15:56:58 -0400
In-Reply-To: <20250326193619.3714986-3-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-3-yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2025-03-26 at 19:35 +0000, Yosry Ahmed wrote:
> svm->vmcb->control is already cached in the 'control' local variable, so
> use that.

Microscopic nitpick: I usually mention that 'No functional change intended'.

> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/svm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 8abeab91d329d..28a6d2c0f250f 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -1367,12 +1367,12 @@ static void init_vmcb(struct kvm_vcpu *vcpu)
>  		avic_init_vmcb(svm, vmcb);
>  
>  	if (vnmi)
> -		svm->vmcb->control.int_ctl |= V_NMI_ENABLE_MASK;
> +		control->int_ctl |= V_NMI_ENABLE_MASK;
>  
>  	if (vgif) {
>  		svm_clr_intercept(svm, INTERCEPT_STGI);
>  		svm_clr_intercept(svm, INTERCEPT_CLGI);
> -		svm->vmcb->control.int_ctl |= V_GIF_ENABLE_MASK;
> +		control->int_ctl |= V_GIF_ENABLE_MASK;
>  	}
>  
>  	if (sev_guest(vcpu->kvm))

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



