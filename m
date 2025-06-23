Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183CB289E1C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692611; cv=none; b=XHKYxx19+LY2hbOCTsMV/sUUJs5rL/u+QgiVIizfzQR2ZUXN4U7+O0vAUAGQ5KhAP8DUjtcXl+3NitClAc6XL560VnbOP3EVgssPoujbd9JFHmekeCsQBgK9JcuccdKsOdDZ4scu6DQzruwI1y5qMKaLBp0mgQ0hCX4bbL47uvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692611; c=relaxed/simple;
	bh=L/cfSGnSX28XY4cLKESl0PHduhleGIW8TtQJ6a7uSMg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N1ZbX6oSqcqjL9zgavD02hMUuHHYHmjkUk7HopoV6cZaViVVHIVWh25nwGKW1Q2HWCzW68GzVjlSKAVytj62QMtOjd+DXck5rK5OeShIZ6AnvFbONzJtoZHXLkY8KqjainvXBPMfVgN4AYIt5OW0Y8lzfZuv7hIYcRhHBSQPU1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gnu2gg9K; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gnu2gg9K"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-234f1acc707so39431095ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750692608; x=1751297408; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KdWZjBOZrnoU5S/xxe3p4LyXR96yMFXC81nKL3+yk3w=;
        b=Gnu2gg9K5VjoJqa4XV+g1WVNR4O5UeHDp7z0gkgKanaOuUXvXyMpDpbz07hty8YCPt
         AzT7R69Com6vzX9utR74L5eogxBnheU5Y9/xe7P8Gi9FDuSOhY73N33yk6E4DeNtbz7j
         +1b/66QBtJS2oci/Air/YkcxlEk64OVSh6ohapZVd5Qrm13FMfOFC6L5PhAweIkUdJ2g
         4O2Kg2Ft23Y77nlc6AY4Fnt9yGMV8c7c+7r/mZasMz0hVzK2CNlSm2IOyS+OILIswN9B
         SIh8uI6ADHz3/19Q2+oWxpcs99XtlH6bU09IgNdmgFqBxnmc2eAH5UV4/mQqC/a0FDie
         3pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692608; x=1751297408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdWZjBOZrnoU5S/xxe3p4LyXR96yMFXC81nKL3+yk3w=;
        b=Xf33ghpK1FHvq629VMazqEAvaq2G5RpA3vEbWmU73xhMUbirdE4UQGQtkGSiHJgrZr
         SFadUX8f8GIoyc6awiNRgMbK8wK29yB3BQwpJlP0snLf2qMYvc9BJeQhEuYPHXNQFE5E
         LngyiXYOYHL5N+hz7Q7C59EcvVX9D2Njg0SM/cNVn9eVH9COJK70R6gTwj/eKlnVReGe
         2cX6Ee+IUtAAGbcZP4P8Kcp0ctEaiFCUhvt8SAIQU41Yh0M/jxlLvwk7EL8ZYuCSYQB0
         qjdtF7WDF52KdGJrzfmIJ52qYmre+m0S9VBBW8KgtCrhH91vAA2YUHLcrR3Qm7120BC8
         8epg==
X-Forwarded-Encrypted: i=1; AJvYcCVZPc8vL97eSiJ9vVbkgzK65GjOiEfHsMamELY1uI0vGomn23Ly9idc4FXa7aHeNoYhscpB5cDaQ9s91Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk0RIGhsDdijPqhIK1UXMsRorYdQLi+6ee+mrJha1ok7B3fH+o
	bkSR9K0zbabZkNJL8Ugy2LAuCu/vcul+yp5n6E6pHQsQfiuTcxaM8jWbAt2wo+o3f2ueVKNVTkb
	+4FEimw==
X-Google-Smtp-Source: AGHT+IEMdoRNFqlp7zHt8uHjKfPleNVgWrvxFNisVXQLf3SXuV2EWfHq7AYIrMPraED+yf8roaT/XGVYptg=
X-Received: from plhw5.prod.google.com ([2002:a17:903:2f45:b0:234:a456:85ba])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da8c:b0:236:6e4f:d439
 with SMTP id d9443c01a7336-237d9965716mr203757385ad.23.1750692608274; Mon, 23
 Jun 2025 08:30:08 -0700 (PDT)
Date: Mon, 23 Jun 2025 08:30:07 -0700
In-Reply-To: <jskiyda3defofthrtniugcdbcoftx4o5yvgt47koswq64qf7d7@2pzrr5v5yssy>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com> <20250611224604.313496-20-seanjc@google.com>
 <jskiyda3defofthrtniugcdbcoftx4o5yvgt47koswq64qf7d7@2pzrr5v5yssy>
Message-ID: <aFly_5c0aqTOGEem@google.com>
Subject: Re: [PATCH v3 18/62] KVM: SVM: Disable (x2)AVIC IPI virtualization if
 CPU has erratum #1235
From: Sean Christopherson <seanjc@google.com>
To: Naveen N Rao <naveen@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Jun 23, 2025, Naveen N Rao wrote:
> On Wed, Jun 11, 2025 at 03:45:21PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
> > index 48c737e1200a..bf8b59556373 100644
> > --- a/arch/x86/kvm/svm/avic.c
> > +++ b/arch/x86/kvm/svm/avic.c
> > @@ -1187,6 +1187,14 @@ bool avic_hardware_setup(void)
> >  	if (x2avic_enabled)
> >  		pr_info("x2AVIC enabled\n");
> >  
> > +	/*
> > +	 * Disable IPI virtualization for AMD Family 17h CPUs (Zen1 and Zen2)
> > +	 * due to erratum 1235, which results in missed GA log events and thus
> 							^^^^^^^^^^^^^
> Not sure I understand the reference to GA log events here -- those are 
> only for device interrupts and not IPIs.

Doh, you're absolutely right.  I'll fix to this when applying:

	/*
	 * Disable IPI virtualization for AMD Family 17h CPUs (Zen1 and Zen2)
	 * due to erratum 1235, which results in missed VM-Exits on the sender
	 * and thus missed wake events for blocking vCPUs due to the CPU
	 * failing to see a software update to clear IsRunning.
	 */
