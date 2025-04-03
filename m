Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0502425B668
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743710462; cv=none; b=Fch+Q3RbUmKKmk7UXZdCuCTr+uc+q/7jWbPSsvSJza+85hr09KriF4b5IOiH0qRm67BIyU0+O7RYOu/Xl/cHrN5xPNb/gF2fbcvp+GeopFPczuXU6UqofUPh/H+NsZ9ek/DWr0hpFIbJR/5sdHGzTdvEMdhWR2sf/2xi8tjqLmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743710462; c=relaxed/simple;
	bh=jENm0PzduFiv1vZoirItmU6tAvlLg945YnZLX4j2QN4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KaFgKMW0Fxa1ogO5adsqhJ4EfJtM29TQFSvD9MpBNvMl+TGgE/CNMAF5jO144BSdLOBPmoS6XdsvisvtoC3/FT1JaUvShHYUDk+3VgzpTcmy77obeZW+xCnEiTldtxPE/jBsdfc2ma6ZOafHg2vd63ffftOqAYrcXNNjvSOg+2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hqDYXBZI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hqDYXBZI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743710459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RR9uwOcgkho9bkZAm9hKk3bpEctgLrbkB+0hOh9pF5s=;
	b=hqDYXBZITOgRmQ9Zp6SoCNryNowJ4nodQ2/o/OXufe3wSwHLAvdBuD/mCzEquQ9e7oPiLK
	BNijp7MCy1NaJZlPQlvR+h6TlvRFKZPbdTIlwGkkLUKcoTorcNAChpamUYTZo/tZEpHhg0
	X5CMIGlGleKQ8uXa2dtUhIig4ZH+cUM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-bd6MSjj8M_GWoxqChqmaEg-1; Thu, 03 Apr 2025 16:00:58 -0400
X-MC-Unique: bd6MSjj8M_GWoxqChqmaEg-1
X-Mimecast-MFC-AGG-ID: bd6MSjj8M_GWoxqChqmaEg_1743710458
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4766e03b92bso23642841cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743710458; x=1744315258;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RR9uwOcgkho9bkZAm9hKk3bpEctgLrbkB+0hOh9pF5s=;
        b=l3JLQJ+TQVdgSqnEica/kTFDtB9KcsvF0/eHNhyMyH90lkSX7APn21x+qgKpGtiWdv
         njJPpoHjessA/ybLBFsaAdZzMqA7z+rzSdVzswI5IeHMP5i6pRsfMFUb/UmCE3ntOrLY
         lIBq/vbd5lZKM8Gi+Gng5gjszJ1bXYhZMDchBTEaKdM8IN87RoyzHLNLGujJdBC9CCt9
         2q6hOT4tZ+I8qCqEYPl3B7kKLvwAZbCuGFDipTSyYSWeeHXJ+v0LE8ol1zXtn4ZIqYfD
         bvcuR6G6MPdIW7lyvPqbOxTIOqUmz75BU1xQxLyOjwqozEEAWT7toCkKoNtpdzleWKTc
         9aEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjbOfovY0WI0eP41qzG1vox/NeYnyhY5tz9ed2FDPAdBU30wf1WLJ5UEdppztXjVEn1ED34E9BcIq8PX0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6m3PXWUfx2V+w7se+mOdnAGF4ZGFZwaQDFukWXnF8oadoK79O
	U8IoCUob7rs6OOh/SUllbmQjkWm28vruCxKtX9nt8++PiZ9nLkKLuRs+dYfYAWo9yxqXK1pRrdU
	6kTXpZ8+poTBOdVHOZbB1QZpQVxTrEJi2kzRs4705Tje2TsXgNyPPuxF+i0r/ow==
X-Gm-Gg: ASbGncvzd3z2k/+qwsvv6++/aKZ3B70h+43NJg58fmC2unzL3mPV20sZkSWZIMTlIdp
	K19iv0/nOtr3FzANSq5l4tq3mcO9ZqZHk4Bfv2o5Ph8ikzyVoiOA2YJW5mMB3x4ssc7axISZVhZ
	ckcmWO/AyoVp7ddp7MaQhD1skcTBS5kPM6imqd1Qh0W86f6sS/hT0JDCF3hhtWomcHjYuXOLetJ
	zOvu14Uqf2cJWN6Z3oajEwprZ+n9PNi5K9mEiY34ps39iWN2HGxCovndhIbTDP1J4AZrXZv0KyW
	mF6qVkRJJwkgr14=
X-Received: by 2002:ac8:590f:0:b0:477:6f1f:690b with SMTP id d75a77b69052e-47924919137mr12296791cf.5.1743710457986;
        Thu, 03 Apr 2025 13:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqGtoAQvzzPSjWhn27Wmfxn7Klkq1YoJpZcHdAtWoVXhMGLG23JAtW/8HipHKEvzkQV/redQ==
X-Received: by 2002:ac8:590f:0:b0:477:6f1f:690b with SMTP id d75a77b69052e-47924919137mr12296211cf.5.1743710457597;
        Thu, 03 Apr 2025 13:00:57 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b057d37sm11536941cf.9.2025.04.03.13.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:00:57 -0700 (PDT)
Message-ID: <3ab79e6f97a0a3610c4841e52b6233248d1a76a8.camel@redhat.com>
Subject: Re: [RFC PATCH 05/24] KVM: SVM: Flush the ASID when running on a
 new CPU
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:00:56 -0400
In-Reply-To: <20250326193619.3714986-6-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-6-yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2025-03-26 at 19:36 +0000, Yosry Ahmed wrote:
> Currently, when a vCPU is migrated to a new physical CPU, the ASID
> generation is reset to trigger allocating a new ASID. In preparation for
> using a static ASID per VM, just flush the ASID in this case (falling
> back to flushing everything if FLUSBYASID is not available).
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/svm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 5f71b125010d9..18bfc3d3f9ba1 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -3626,12 +3626,12 @@ static int pre_svm_run(struct kvm_vcpu *vcpu)
>  	struct vcpu_svm *svm = to_svm(vcpu);
>  
>  	/*
> -	 * If the previous vmrun of the vmcb occurred on a different physical
> -	 * cpu, then mark the vmcb dirty and assign a new asid.  Hardware's
> -	 * vmcb clean bits are per logical CPU, as are KVM's asid assignments.
> +	 * If the previous VMRUN of the VMCB occurred on a different physical
> +	 * CPU, then mark the VMCB dirty and flush the ASID.  Hardware's
> +	 * VMCB clean bits are per logical CPU, as are KVM's ASID assignments.
>  	 */
>  	if (unlikely(svm->current_vmcb->cpu != vcpu->cpu)) {
> -		svm->current_vmcb->asid_generation = 0;
> +		vmcb_set_flush_asid(svm->vmcb);
>  		vmcb_mark_all_dirty(svm->vmcb);
>  		svm->current_vmcb->cpu = vcpu->cpu;
>          }

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky




