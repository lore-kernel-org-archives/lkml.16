Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F2E1F3FF8
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744381010; cv=none; b=e4hhRNfSNaHvPCwV3Yc28ukIPinj4uo23Lvb2oCVqcuwICCdWvzNTBilI8A/1/uly1398N/bRybSVthRKr4x0Mjuc4Vw+YKkDRW51S2gEcRSTcf9f4SpyDRD0EaDRuc5N5sbnOMy8QEhlLl5M3o2OaHiCdlm9TFFcqnPbgvxlKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744381010; c=relaxed/simple;
	bh=vn+VKp3Ay36aECIQWn3gk7Kfab8dWu7P+S0abFwbfXI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lYd+kwMohPqIpEBSxAI/uTRKrLeQSMhnXLVDorRgShkcFXBPSpAMYbJw6swvxyvJ7H/5EMhu98BlCTmtrxVlXHa8U5reTeQQPsg5XpXV6RXJYzCkDhqwm0RX6/DQJmQr5kPGMmab6tvevAPOHupY3E5gFFTJrCFy0Y8wnRUaXyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ieKWUleD; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ieKWUleD"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso2605220a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744381008; x=1744985808; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7WLm9nSzf8mbzQ6eRy3dVX2xRtWadZfn8/wglqYhatY=;
        b=ieKWUleDgvrLZ85Y+btrpulYJz2W73ySmXwIpXBuZLuE+nKh5AbvI00trIHlTRogHX
         KHThdqDLAkMmDUZWjm+1mK6UZdKFhSkswcNIg+C06snNoP9y41Bi9tGrcvr4IhbOOiqB
         2Vy0lfGV0f5KBqsmLmTr8I2G4u7eEqa3ZnV8HC7abHqu7ko1XHVM+ruJGJbyEqtPlBGM
         RSEYX6iUcwzKPKkeB8hE1zFXUnhzKIh0YdBUsmx8g5NQWRDvXwI6HXnO8gxDtUAJi6Eu
         DmVNIDFyXdT0eWIQfYlMPa2hP2zJOyFqpu+qyOwp3y4gMFLCugqcnvmvK/8FsqztZby3
         /HnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381008; x=1744985808;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WLm9nSzf8mbzQ6eRy3dVX2xRtWadZfn8/wglqYhatY=;
        b=WGKLDvAte0NaCfyYmoHqp/Q3WhEyuB+iZLYlGbGepP5jms6aYS5H+zSvD7zW7D27jW
         DxhHZ7OZDJgwldJ/Y9NzRvQmZOMtzgrECR85OqfmXnd4vNDbyWwRydT8YmR4oo1bU+Ql
         8hhmtWN7rJeiHQzn0N+7+n3ndq4E72Y0PUNNdmtjNXlBuzd7vCzjFsCDWfRDZqE9Sqcu
         AdJnIiuyg8c3f6upPQ9btXwpaTniTRbUthFxvOD6Tc4Lrdaum7ZTHm9RnMUK7Lj67/8W
         1LREPSj5qF35MRrMkqEi7/iRl8wk3nBqv/SRx9KLLIUr4I9DF0z/78h8TlXPPpquwHlK
         4RUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNYZZP/iXCxPiR5d+DAfeLerrtLp9DTjyg7TqM6xv1g9of03BYi5Vujj2QSdyawY31/q6NhPTRaznAkqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLi6lu8dZd21jfdYdctxj4a8epX/pmvUDAfpu25AekbQd181r1
	nmZDNKx70ZFEWWHEoOIxNTTZC2E0051RiROEN3xn+qGUqKL45RaRGhorHCFpCOUBc3Vr74vyBtk
	+Ew==
X-Google-Smtp-Source: AGHT+IFATnSMfrlSoDr0AZ6VmD2LhVdWjxVhiNFsnVuSJSTgsZ8GDkGzqSkWXdTOGULav9ok7fnrCtR9H0A=
X-Received: from pjtq5.prod.google.com ([2002:a17:90a:c105:b0:305:2d68:2be6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2703:b0:2fe:b735:87da
 with SMTP id 98e67ed59e1d1-3082354ee9amr6053899a91.0.1744381008123; Fri, 11
 Apr 2025 07:16:48 -0700 (PDT)
Date: Fri, 11 Apr 2025 07:16:46 -0700
In-Reply-To: <ad53c9fe-a874-4554-bce5-a5bcfefe627a@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com> <20250404193923.1413163-3-seanjc@google.com>
 <ad53c9fe-a874-4554-bce5-a5bcfefe627a@amd.com>
Message-ID: <Z_kkTlpqEEWRAk3g@google.com>
Subject: Re: [PATCH 02/67] KVM: x86: Reset IRTE to host control if *new* route
 isn't postable
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Naveen N Rao <naveen.rao@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 11, 2025, Sairaj Kodilkar wrote:
> On 4/5/2025 1:08 AM, Sean Christopherson wrote:
> > @@ -991,7 +967,36 @@ int avic_pi_update_irte(struct kvm *kvm, unsigned int host_irq,
> >   		}
> >   	}
> > -	ret = 0;
> > +	if (enable_remapped_mode) {
> > +		/* Use legacy mode in IRTE */
> > +		struct amd_iommu_pi_data pi;
> > +
> > +		/**
> > +		 * Here, pi is used to:
> > +		 * - Tell IOMMU to use legacy mode for this interrupt.
> > +		 * - Retrieve ga_tag of prior interrupt remapping data.
> > +		 */
> > +		pi.prev_ga_tag = 0;
> > +		pi.is_guest_mode = false;
> > +		ret = irq_set_vcpu_affinity(host_irq, &pi);
> > +
> > +		/**
> > +		 * Check if the posted interrupt was previously
> > +		 * setup with the guest_mode by checking if the ga_tag
> > +		 * was cached. If so, we need to clean up the per-vcpu
> > +		 * ir_list.
> > +		 */
> > +		if (!ret && pi.prev_ga_tag) {
> > +			int id = AVIC_GATAG_TO_VCPUID(pi.prev_ga_tag);
> > +			struct kvm_vcpu *vcpu;
> > +
> > +			vcpu = kvm_get_vcpu_by_id(kvm, id);
> > +			if (vcpu)
> > +				svm_ir_list_del(to_svm(vcpu), &pi);
> > +		}
> > +	} else {
> > +		ret = 0;
> > +	}
> 
> Hi Sean,
> I think you can remove this else and "ret = 0". Because Code will come to
> this point when irq_set_vcpu_affinity() is successful, ensuring that ret is
> 0.

Ah, nice, because of this:

		if (ret < 0) {
			pr_err("%s: failed to update PI IRTE\n", __func__);
			goto out;
		}

However, looking at this again, I'm very tempted to simply leave the "ret = 0;"
that's already there so as to minimize the change.  It'll get cleaned up later on
no matter what, so safety for LTS kernels is the driving factor as of this patch.

Paolo, any preference?
