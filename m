Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680417BA5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750859798; cv=none; b=JEmmhb2yf0T7/2TOBlFIW3w9UN6tEEq5nuBwq6nJT8X1B7eRP15cRw0iOT8aLE/Woszs8NdYndS15eDLqKY4oteeyFgMCpNL4TsPEzGFUtIgzMyDdfMzVvW/Q077ddSdu+FtWB+1K03Sh7aJNn4V/XyI+YqfALojhhz64cXzKzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750859798; c=relaxed/simple;
	bh=+gUAhtmwSc+Dx/LA8sXseXAxP2H95zpoHM9G3f1eS1o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nrzrzqv94u64vp2GS5LUTmytLgU55Ux99GHW0dZwXuHJkfTt3FF88y1AuSDvjBb1mXc6oDn8WaF8r2Q2K+vXMozpONbwMFJC/RjAMSmMxQaM44en9DifdUIrk1Ylz5z488OVDG2dD5iSzz/kqBSEQOF/zWfm6EgntYtL1Infn70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=it+WIuud; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="it+WIuud"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2356ce55d33so26550675ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750859795; x=1751464595; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYRYqT/bXAL8k2LO9qK1rydTyzlSzlDY+mdu4otHhRA=;
        b=it+WIuudSA6omDLq6utjYwjmI4vvZsilUkbLH0PLf6eArtGaLsKPGSv+OLvi/GTwLp
         uznFV0UY0pMOuLuIjKvZcllsu6j6UWT4ixqeo0i6L2hp96bXplCEUbCEShF+/uZTeWmX
         253KjJQCxm5Rd+1NYr3r47nbTvtR2dsDAU798NMCn236jkfKJY20tUXaPPeazdRWamTA
         pmPCODaX881Yu2JUYBs1xS1kSLDgztfYKLyON95D3ilWYGzhdDYnVbNel7iOO5KNcduz
         K/9ofhGGdHa2LuqegO6KNkPSR0htLLtg+OdDlftzWM3VFEfGId7itejvnu8DqreCtUTr
         hlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750859795; x=1751464595;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYRYqT/bXAL8k2LO9qK1rydTyzlSzlDY+mdu4otHhRA=;
        b=pAAMArNO7ubOHzxIU85jQY0gHcaCPxz43jgRzMD2DD1i+C4nn+Nwc8PResx64fv41Y
         cIa20j39/DuKvFEzjCQN+VWPaTos8gvRoyWxNlhEdzKkYnC+Sk4EH1TRHPBvZ+RJI7FA
         s35MzZ0Ittc2DvPx3HhCstc/+jVPBMFXFAhv5y0iRFuabv+4bzZDYF0N0u0Jou5QBe/K
         bp5QCmNK0XitrMpGzeAPAxLOIwl/4nJuIoRp1pNtAYEbqs41K0fRa4aCzaF/zxMrx5nB
         X8YPAO6PGflaqzesvSNosITXen8qTJPEZdup2UBetYXYsXwDk2U84n46KRBym6l1ADpL
         gWUg==
X-Gm-Message-State: AOJu0Yzj627gITU3hUkfhoZ1hKnRL3DKJOBlqtHv0C6bqRTHnMv1npZI
	x7AfnJeAa/JdhJHmfftq8acFx2oXYNC4Ev394gAgDAU0edw9wKP3ww1Jp4w/2GdZ+Ajx0cvMSLX
	Mk6kI3A==
X-Google-Smtp-Source: AGHT+IEpjJNtqFiEYRWcClwvn4omIwDUPMHmUWiHGbZoFEdpFnjJvDByLlczHO/ibArdo0tkOI3NS0mkejY=
X-Received: from plmm20.prod.google.com ([2002:a17:902:c454:b0:234:c2e4:1e08])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce8a:b0:235:caa8:1a72
 with SMTP id d9443c01a7336-23824031f58mr54507795ad.30.1750859794872; Wed, 25
 Jun 2025 06:56:34 -0700 (PDT)
Date: Wed, 25 Jun 2025 06:56:33 -0700
In-Reply-To: <20250610175424.209796-8-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610175424.209796-1-Neeraj.Upadhyay@amd.com> <20250610175424.209796-8-Neeraj.Upadhyay@amd.com>
Message-ID: <aFwAESoVcldwpaCR@google.com>
Subject: Re: [RFC PATCH v7 07/37] KVM: lapic: Rename lapic get/set_reg() helpers
From: Sean Christopherson <seanjc@google.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, tglx@linutronix.de, 
	mingo@redhat.com, dave.hansen@linux.intel.com, Thomas.Lendacky@amd.com, 
	nikunj@amd.com, Santosh.Shukla@amd.com, Vasant.Hegde@amd.com, 
	Suravee.Suthikulpanit@amd.com, David.Kaplan@amd.com, x86@kernel.org, 
	hpa@zytor.com, peterz@infradead.org, pbonzini@redhat.com, kvm@vger.kernel.org, 
	kirill.shutemov@linux.intel.com, huibo.wang@amd.com, naveen.rao@amd.com, 
	francescolavra.fl@gmail.com, tiala@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 10, 2025, Neeraj Upadhyay wrote:
> In preparation for moving kvm-internal __kvm_lapic_set_reg(),
> __kvm_lapic_get_reg() to apic.h for use in Secure AVIC apic driver,
> rename them to signify that they are part of apic api.
> 
> While at it, fix line wrap in kvm_apic_get_state().

Nit, please don't bill this as a "fix".  There is absolutely nothing wrong with
the existing code.  I have no objection to the new code, I just don't want to
give KVM developers the impression that wrapping at ~80 chars when they feel it
makes the code more readable is somehow bad/wrong.

I'd just drop this line.  The function name is being shortened; adjusting the
wrapping to account for that is completely natural and doesn't need to be called
out.

> @@ -3099,8 +3099,7 @@ int kvm_apic_get_state(struct kvm_vcpu *vcpu, struct kvm_lapic_state *s)
>  	 * Get calculated timer current count for remaining timer period (if
>  	 * any) and store it in the returned register set.
>  	 */
> -	__kvm_lapic_set_reg(s->regs, APIC_TMCCT,
> -			    __apic_read(vcpu->arch.apic, APIC_TMCCT));
> +	apic_set_reg(s->regs, APIC_TMCCT, __apic_read(vcpu->arch.apic, APIC_TMCCT));
>  
>  	return kvm_apic_state_fixup(vcpu, s, false);
>  }
