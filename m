Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87CC2BF00B
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084351; cv=none; b=S+QUkVMpC1EoLgkO4+4Cko8vihmtNvEQMcQwpclON+Q1C108wAZ7Hwbl5zaXNMfFTNXahnw5iAPOBHI8LyIN7kf+ut37NI290HlzCzC3YyiVU76u6BhkJ5YLXcYq2DRbjsZIDiuKlIaMsrUjc6fQ8xFJcarwbu8OYAhtNgK0ooI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084351; c=relaxed/simple;
	bh=mXtnEzO/AQsXD5F9xbtyvPg4mcL6gsQJ5aFsJnDhKKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXpBha0st7R/1Ffra6PkwuROUzLqoDfRnI+oTKAlIbiuQKfvEu6+41Xj2004CmKVvLNiCceuGWqOW8C1j84MIFi2gajNmBwMOxQ7YbNUlWQlcomnVZ0ydxxrvSkPLjHOPtqEcRiHfTRs8pN5bZ1Xm3U/sA7KnhAGcIL3PKNIZT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw; spf=pass smtp.mailfrom=csie.ntu.edu.tw; dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b=E0sgt0Tx; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b="E0sgt0Tx"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2366e5e4dbaso14984605ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1750084347; x=1750689147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AwRGa0XFsqqIwrjVkk74Q1qsmmr8uiY3g/0R4Yfi5MQ=;
        b=E0sgt0TxhN9TvoqeAF0rJ/XRYw1G9C4Oq1pJZRBQBUIOIkmt0ixfclcgsBiONVroDm
         SAfIZkPvULDk6HD+sgilFMeu8MXyMQ/9QhmJmXgVNdzMCxXBw9CeDlh2EK08yKF9RF36
         8jH+fnhMTbnF3ONr+Av3lFWYNn8YGpEGsXRcLM28wr5mtSP/qkTtWmyJ7vyxcr3iinXC
         m/xOzxJqnwTlo6q8Hmrb55RIA7OaqLzdxoc9Pzo59+tZV+CJG0KpjlgeZXE/sw3g/p2b
         oUsKNOrRUH2lDLUEl24b6gCyLftNUl5OzEVSD04wR7t1RVP8G6fqrEtkSI9R2G/ZdZ7x
         3p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084347; x=1750689147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwRGa0XFsqqIwrjVkk74Q1qsmmr8uiY3g/0R4Yfi5MQ=;
        b=qWJj5/CHmwYPf5kWMhGEzl9u7KelQY6R2GjEgx+G1fia2z3KkUYvNEl2DDuF3w50Vr
         5PKj3bdj6cqe63U/lP/NeGc3DXlwqhaB8++QR3zKIDgpyS4wuJn5N+AjBEpP9UaYzAu3
         BmMoY1bVncS+43TOXLmr3yoxt08Ll3fsh7ogXT4qiDATrReqh76+cJycM46WHNkWZ46s
         5c1US3hZsnGrRUfcYp2BnDgIAUfCio4xi3/qcj4QPLQGTPZTNiWp0k0vIKGo1h+D1NUX
         YBnvoFXNVIgM9yoVAwKg4YlYznYrErCrZ02uTGV5T3oRveSkBLHtuXN7Cben0jSxYcHy
         YcqA==
X-Forwarded-Encrypted: i=1; AJvYcCXh8LQCY3f12TkPjExHipSzfDJZjLHl68wz5vASYHbuu5NmwZKylo5Oa/Cx6SCXAiv9qucfJY78P2NlobE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX7mpRD2slkh+GBM+e822jjMSS3KLjCdx1Zqt6hr69kY6i0hDx
	Xko9akx1cVfu0O/yhFHYBAVqasFkYHZ62f7wEO6OvNWHvY34EgVMfxViEYR8RSUxEsVYnRS7Jl2
	ALG72Zz2oiZBPNFgyiXoehr+7eD5IGaf646pvVdDxEhkgcLFjtYc/ARr4fFk=
X-Gm-Gg: ASbGncu92lafNAvx2Lk/e2Q3w+d7FNKcH/imHbQLFdoMfX1BRddg1j2sIEh0gy2OhQw
	5FdUzzlec4ibeta65C63kdaAqmE5aoAZ1m1sSdVW4TGcSMOVJN05/m9h/1b3Gqzlf/t4G6IOaiL
	wDkborG0KynJyQ3FC/Z8js6f1yftqirgmhGHA8uHCwY8aJqwwJkWHClFHJgWGREJG+DH2t6b4E8
	ouOqR5Ju03bByRb3EG11JoNyg16NIQdCfCvKQWKk6y59HKPiTcYUgV9aUzfh7RYHNdzRQcy1/H0
	ObgYjVIo0npLVZUF+6MA/YXRigr83FmS0S1gmPhs8bwCYHAwls0sleQS2+oh3x4/iEtau/l/yxg
	M6dSSTDxHZSbw0DEgEJnTwXDl
X-Google-Smtp-Source: AGHT+IEtkJExy6WPafNCco+WTYoFOLE/6qqMQggbf4cftPJzDAhAGmjRrQdyLE0tM9+TfIxVnZRz4w==
X-Received: by 2002:a17:903:2ac7:b0:235:278c:7d06 with SMTP id d9443c01a7336-2366ae00e80mr158071555ad.8.1750084346886;
        Mon, 16 Jun 2025 07:32:26 -0700 (PDT)
Received: from zenbook (36-228-20-239.dynamic-ip.hinet.net. [36.228.20.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea8d1asm61456935ad.162.2025.06.16.07.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:32:26 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:34:58 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jintack Lim <jintack@cs.columbia.edu>, 
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix s_cpu_if->vgic_lr[] indexing in
 vgic_v3_put_nested()
Message-ID: <2p4urq6ij5zq77c7viydmqqaj2doeyja43khvcjgn5pkpe7saz@eyfvuykscn22>
References: <20250614145721.2504524-1-r09922117@csie.ntu.edu.tw>
 <86qzzkc5xa.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86qzzkc5xa.wl-maz@kernel.org>
X-Gm-Spam: 0
X-Gm-Phishy: 0

On Mon, Jun 16, 2025 at 11:54:57AM +0100, Marc Zyngier wrote:
> On Sat, 14 Jun 2025 15:57:21 +0100,
> Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
> > 
> > s_cpu_if->vgic_lr[] is filled continuously from index 0 to
> > s_cpu_if->used_lrs - 1, but vgic_v3_put_nested() is indexing it using
> > the positions of the set bits in shadow_if->lr_map. So correct it.
> > 
> > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> > ---
> >  arch/arm64/kvm/vgic/vgic-v3-nested.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > index 4f6954c30674..29741e3f077b 100644
> > --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > @@ -343,7 +343,7 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
> >  	struct shadow_if *shadow_if = get_shadow_if();
> >  	struct vgic_v3_cpu_if *s_cpu_if = &shadow_if->cpuif;
> >  	u64 val;
> > -	int i;
> > +	int i, index = 0;
> >  
> >  	__vgic_v3_save_vmcr_aprs(s_cpu_if);
> >  	__vgic_v3_deactivate_traps(s_cpu_if);
> > @@ -368,10 +368,11 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
> >  		val = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> >  
> >  		val &= ~ICH_LR_STATE;
> > -		val |= s_cpu_if->vgic_lr[i] & ICH_LR_STATE;
> > +		val |= s_cpu_if->vgic_lr[index] & ICH_LR_STATE;
> >  
> >  		__vcpu_sys_reg(vcpu, ICH_LRN(i)) = val;
> > -		s_cpu_if->vgic_lr[i] = 0;
> > +		s_cpu_if->vgic_lr[index] = 0;
> > +		index++;
> >  	}
> >  
> >  	shadow_if->lr_map = 0;
> 
> Nice catch, thanks a lot for tracking it down.
> 
> However, I think we should get rid of this double-indexing altogether,
> or at least make it less error-prone. This thing is extremely fragile,
> and it isn't the first time we are getting bitten with it.

Hi Marc,

Yes agreed, making this more robust is better than just the bug fix.
Thanks for the effort.

> 
> Looking at the code, it becomes pretty obvious that the shadow index
> is always the number of bits set in lr_map, and that we could
> completely drop the 'index' thing if we simply counted these bits
> (which isn't that expensive).
> 
> I came up with the (admittedly much bigger) following fix.
> 
> Thoughts?

Just one nit below:

> 
> 	M.
> 
> From 2484950b8fc3b36cca32bf5e86ffe7975a43e0e7 Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Sun, 15 Jun 2025 16:11:38 +0100
> Subject: [PATCH] KVM: arm64: nv: Fix tracking of shadow list registers
> 
> Wei-Lin reports that the tracking of shadow list registers is
> majorly broken when resync'ing the L2 state after a run, as
> we confuse the guest's LR index with the host's, potentially
> losing the interrupt state.
> 
> While this could be fixed by adding yet another side index to
> track it (Wei-Lin's fix), it may be better to refactor this
> code to avoid having a side index altogether, limiting the
> risk to introduce this class of bugs.
> 
> A key observation is that the shadow index is always the number
> of bits in the lr_map bitmap. With that, the parallel indexing
> scheme can be completely dropped.
> 
> While doing this, introduce a couple of helpers that abstract
> the index conversion and some of the LR repainting, making the
> whole exercise much simpler.
> 
> Reported-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/20250614145721.2504524-1-r09922117@csie.ntu.edu.tw
> ---
>  arch/arm64/kvm/vgic/vgic-v3-nested.c | 81 ++++++++++++++--------------
>  1 file changed, 42 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> index d22a8ad7bcc51..bd22e42ce9112 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> @@ -36,6 +36,11 @@ struct shadow_if {
>  
>  static DEFINE_PER_CPU(struct shadow_if, shadow_if);
>  
> +static int lr_map_idx_to_shadow_idx(struct shadow_if *shadow_if, int idx)
> +{
> +	return hweight64(shadow_if->lr_map & (BIT(idx) - 1));
> +}
> +
>  /*
>   * Nesting GICv3 support
>   *
> @@ -209,6 +214,29 @@ u64 vgic_v3_get_misr(struct kvm_vcpu *vcpu)
>  	return reg;
>  }
>  
> +static u64 translate_lr_hw_bit(struct kvm_vcpu *vcpu, u64 lr)

I believe translate_lr_pintid() better describes what this function is
doing.

For everything else, I don't spot any issues after review.

Reviewed-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>

> +{
> +	struct vgic_irq *irq;
> +
> +	if (!(lr & ICH_LR_HW))
> +		return lr;
> +
> +	/* We have the HW bit set, check for validity of pINTID */
> +	irq = vgic_get_vcpu_irq(vcpu, FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
> +	/* If there was no real mapping, nuke the HW bit */
> +	if (!irq || !irq->hw || irq->intid > VGIC_MAX_SPI)
> +		lr &= ~ICH_LR_HW;
> +
> +	/* Translate the virtual mapping to the real one, even if invalid */
> +	if (irq) {
> +		lr &= ~ICH_LR_PHYS_ID_MASK;
> +		lr |= FIELD_PREP(ICH_LR_PHYS_ID_MASK, (u64)irq->hwintid);
> +		vgic_put_irq(vcpu->kvm, irq);
> +	}
> +
> +	return lr;
> +}
> +
>  /*
>   * For LRs which have HW bit set such as timer interrupts, we modify them to
>   * have the host hardware interrupt number instead of the virtual one programmed
> @@ -217,58 +245,37 @@ u64 vgic_v3_get_misr(struct kvm_vcpu *vcpu)
>  static void vgic_v3_create_shadow_lr(struct kvm_vcpu *vcpu,
>  				     struct vgic_v3_cpu_if *s_cpu_if)
>  {
> -	unsigned long lr_map = 0;
> -	int index = 0;
> +	struct shadow_if *shadow_if;
> +
> +	shadow_if = container_of(s_cpu_if, struct shadow_if, cpuif);
> +	shadow_if->lr_map = 0;
>  
>  	for (int i = 0; i < kvm_vgic_global_state.nr_lr; i++) {
>  		u64 lr = __vcpu_sys_reg(vcpu, ICH_LRN(i));
> -		struct vgic_irq *irq;
>  
>  		if (!(lr & ICH_LR_STATE))
> -			lr = 0;
> -
> -		if (!(lr & ICH_LR_HW))
> -			goto next;
> -
> -		/* We have the HW bit set, check for validity of pINTID */
> -		irq = vgic_get_vcpu_irq(vcpu, FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
> -		if (!irq || !irq->hw || irq->intid > VGIC_MAX_SPI ) {
> -			/* There was no real mapping, so nuke the HW bit */
> -			lr &= ~ICH_LR_HW;
> -			if (irq)
> -				vgic_put_irq(vcpu->kvm, irq);
> -			goto next;
> -		}
> -
> -		/* Translate the virtual mapping to the real one */
> -		lr &= ~ICH_LR_PHYS_ID_MASK;
> -		lr |= FIELD_PREP(ICH_LR_PHYS_ID_MASK, (u64)irq->hwintid);
> +			continue;
>  
> -		vgic_put_irq(vcpu->kvm, irq);
> +		lr = translate_lr_hw_bit(vcpu, lr);
>  
> -next:
> -		s_cpu_if->vgic_lr[index] = lr;
> -		if (lr) {
> -			lr_map |= BIT(i);
> -			index++;
> -		}
> +		s_cpu_if->vgic_lr[hweight64(shadow_if->lr_map)] = lr;
> +		shadow_if->lr_map |= BIT(i);
>  	}
>  
> -	container_of(s_cpu_if, struct shadow_if, cpuif)->lr_map = lr_map;
> -	s_cpu_if->used_lrs = index;
> +	s_cpu_if->used_lrs = hweight64(shadow_if->lr_map);
>  }
>  
>  void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
>  {
>  	struct shadow_if *shadow_if = get_shadow_if();
> -	int i, index = 0;
> +	int i;
>  
>  	for_each_set_bit(i, &shadow_if->lr_map, kvm_vgic_global_state.nr_lr) {
>  		u64 lr = __vcpu_sys_reg(vcpu, ICH_LRN(i));
>  		struct vgic_irq *irq;
>  
>  		if (!(lr & ICH_LR_HW) || !(lr & ICH_LR_STATE))
> -			goto next;
> +			continue;
>  
>  		/*
>  		 * If we had a HW lr programmed by the guest hypervisor, we
> @@ -277,15 +284,13 @@ void vgic_v3_sync_nested(struct kvm_vcpu *vcpu)
>  		 */
>  		irq = vgic_get_vcpu_irq(vcpu, FIELD_GET(ICH_LR_PHYS_ID_MASK, lr));
>  		if (WARN_ON(!irq)) /* Shouldn't happen as we check on load */
> -			goto next;
> +			continue;
>  
> -		lr = __gic_v3_get_lr(index);
> +		lr = __gic_v3_get_lr(lr_map_idx_to_shadow_idx(shadow_if, i));
>  		if (!(lr & ICH_LR_STATE))
>  			irq->active = false;
>  
>  		vgic_put_irq(vcpu->kvm, irq);
> -	next:
> -		index++;
>  	}
>  }
>  
> @@ -368,13 +373,11 @@ void vgic_v3_put_nested(struct kvm_vcpu *vcpu)
>  		val = __vcpu_sys_reg(vcpu, ICH_LRN(i));
>  
>  		val &= ~ICH_LR_STATE;
> -		val |= s_cpu_if->vgic_lr[i] & ICH_LR_STATE;
> +		val |= s_cpu_if->vgic_lr[lr_map_idx_to_shadow_idx(shadow_if, i)] & ICH_LR_STATE;
>  
>  		__vcpu_assign_sys_reg(vcpu, ICH_LRN(i), val);
> -		s_cpu_if->vgic_lr[i] = 0;
>  	}
>  
> -	shadow_if->lr_map = 0;
>  	vcpu->arch.vgic_cpu.vgic_v3.used_lrs = 0;
>  }
>  
> -- 
> 2.39.2
> 
> 
> -- 
> Without deviation from the norm, progress is not possible.
