Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919F8235041
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697204; cv=none; b=BXkPfdZE61fUBGKHRtbh/n5XC63G93GNnmNiuhJ49m2fn+ZAGR0Kz50f4PNnwkFBxsWo5tEf+2tBhUL/vbtO+CjFLsfvX1ULx2p0R8Aqzr3TjsyAaFyVxQnWrHCl2ILMF3BoO3MdtktcCxBw6kHtpDdmlcLnuB4/EoDAq/Y6NaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697204; c=relaxed/simple;
	bh=PTkCH4bY0/JrT78kPVp8u6zIyFxZdruXqxwb9NjROfM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kO+YmZOty0y8jSh4sD3VnONndr1qA+oa4cQvV5VBMdTXw0I155biLBkjjFZU6Q8I3zqS4Y2sT6xfD0mzsKptrXsh9RZZLjeN7U18HmA+oEUx7MryB5CrHMAOKS6jCJiGFlMG+Lb+GcOxP6CrBfc7qWBrd5LxjKoHUctB/p3YDx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C674cHVi; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C674cHVi"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3132c1942a1so6143642a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750697203; x=1751302003; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7lKL+8FPzXbEzHdQK18UrqhFoWyJyqFhk5D3NzvCiSw=;
        b=C674cHViHZ3L2kC53vq2jVkNs9iPXHkJonvPLPpQyx1p51AIEe9XAyP/20aToX7kiG
         TSOR8jXR//Ow9sS4d6u0fIhA8Qy8YauJ7FbQDP6kiC36qdZ4V7TmQY5IqG5K8D398ZnS
         ln7NbifPB1XmIVIExx8jgXVRbrWCCYEZi1s71MA5tUw/NX+ajdWQFQtGXj++sPRrdXKI
         7PLDkoKVtZ2DyXGj0VdfmfvS3cTuHbsjWmNG2wCAZ6ZAgv9XZ1RMeZyH2fsjnCAp0nQC
         j+UKgDuWb4KoFmome+fwadsDytI3cmAaJefejkt+efTamY9QBUt6rXYZYP00cLG17NF1
         sSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697203; x=1751302003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lKL+8FPzXbEzHdQK18UrqhFoWyJyqFhk5D3NzvCiSw=;
        b=dZnysUuxD1JfSp8n23TO7VuphZjitdAkz9zOKgrsMtgT0EWT9864drPPdpPY5LjMKJ
         xOBHev8XpXJJ25f/qB4zTzIt5c+8tmrzBea4J7gdQopnNhGGktpnmll7MWWNzT/pR7Vk
         Uw326vhzF5ktYfnpK1TglUA93aklGfpEG84Bi21NT4iKl7WJzMpYSlpNiUXV5rym0zAT
         j0U6qZUdrrgnNY92ITqFGnB1JAFcrT1k0STsJEgi1WiPfcuMPjsdh+vWfwhI5lc2Vcyc
         nAQOEWNLD8PWpCZYTmJ+h5NKY4i+hPoLBhBpaWaFuUehcCuuXBZlPttS28Mx8tLSmvYe
         g6gg==
X-Forwarded-Encrypted: i=1; AJvYcCVYc2nsT6zVHm6RcsTQXvG6t/69/2zl8CHiOBSkr1co9+JN88MYyhMRSRIc17cCdbB4KD9qQdLN5moVC7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqp2dspu4WtkymP6xM82RQg6q/6zUv2Nh/Y9l5/EN5unAR6HCw
	Zihzg9K4OkMG2rJ2CWJr0JxaCOvS9GyhA9Ige9JyKpDw4Q+eV8sfCrDi/Rx4mp8Kc1rRKDGjG1Q
	JyR0m0A==
X-Google-Smtp-Source: AGHT+IFqQcKBEffd+/bm/pwSMxSA4pUyJvWSuTZaRbFIA4d7phi69ClHdBJaop2cLRhGg1gLy3XueS/nDgA=
X-Received: from pjd11.prod.google.com ([2002:a17:90b:54cb:b0:314:3153:5650])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d64f:b0:311:f684:d3cd
 with SMTP id 98e67ed59e1d1-3159d63d9e7mr24601590a91.12.1750697202941; Mon, 23
 Jun 2025 09:46:42 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:46:39 -0700
In-Reply-To: <20250326193619.3714986-4-yosry.ahmed@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev> <20250326193619.3714986-4-yosry.ahmed@linux.dev>
Message-ID: <aFmE7-osX2rmdGL5@google.com>
Subject: Re: [RFC PATCH 03/24] KVM: SVM: Add helpers to set/clear ASID flush
 in VMCB
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Rik van Riel <riel@surriel.com>, Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Mar 26, 2025, Yosry Ahmed wrote:
> Incoming changes will add more code paths that set tlb_ctl to
> TLB_CONTROL_FLUSH_ASID, and will eliminate the use of
> TLB_CONTROL_FLUSH_ALL_ASID except as fallback when FLUSHBYASID is not
> available. Introduce set/clear helpers to set tlb_ctl to
> TLB_CONTROL_FLUSH_ASID or TLB_CONTROL_DO_NOTHING.
> 
> Opportunistically move the TLB_CONTROL_* definitions to
> arch/x86/kvm/svm/svm.h as they are not used outside of arch/x86/kvm/svm/.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/include/asm/svm.h |  5 -----
>  arch/x86/kvm/svm/nested.c  |  2 +-
>  arch/x86/kvm/svm/sev.c     |  2 +-
>  arch/x86/kvm/svm/svm.c     |  4 ++--
>  arch/x86/kvm/svm/svm.h     | 15 +++++++++++++++
>  5 files changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/include/asm/svm.h b/arch/x86/include/asm/svm.h
> index 9b7fa99ae9513..a97da63562eb3 100644
> --- a/arch/x86/include/asm/svm.h
> +++ b/arch/x86/include/asm/svm.h
> @@ -171,11 +171,6 @@ struct __attribute__ ((__packed__)) vmcb_control_area {
>  };
>  
>  
> -#define TLB_CONTROL_DO_NOTHING 0
> -#define TLB_CONTROL_FLUSH_ALL_ASID 1
> -#define TLB_CONTROL_FLUSH_ASID 3
> -#define TLB_CONTROL_FLUSH_ASID_LOCAL 7

These should stay in asm/svm.h as they are architectural definitions.  KVM's
headers are anything but organized, but my goal is to eventually have the asm/
headers hold most/all architectural definitions, while KVM's internal headers
hold KVM-internal stuff.
