Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972BE1A316C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917298; cv=none; b=VYcMU+yLXOzQPvGag/MXGeDVyLDH56wy+O9Yue6lI5djiAmrXDR6YQEUeX093QmvPu8FtnjLaCPyqIy3Lf2tgZYbzmUcxL0vIWkrOq57BIC38A5PUv4me14g3NVRGGrn8+9c2rJ0dGztF1Cvi0C36c8dywHdq9Fz05d3IYBcPCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917298; c=relaxed/simple;
	bh=31M3xpw7EncWsxNC4fymQYCkV2uAZxtqDe3BzGziPDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6feHj1K5T00jtXAHpMUSxo+qK6wpMGOdgG3lmfq6JO1dZsMjiQKue16FAhWBnIyQhSVBRvrzaNxZMBUQq1vNhwDtxOjSpKhQxAKu9cBxmEQud+P+GqkW0fvv/Q24z1USEkKaHubHzbRDgljN/pJgEnrSzkaTwdgJDucWLI8L+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw; spf=pass smtp.mailfrom=csie.ntu.edu.tw; dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b=HuEUgeUb; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b="HuEUgeUb"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b34a71d9208so413437a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1750917295; x=1751522095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rm0OfZ7AaG27+skvHa9GB/aO3szvxFuyhu1AGBEZrgc=;
        b=HuEUgeUb4zz5efTlXs61bdbZzjAU4LBMxT4305tqO4VmcGRX4rFTfsmz2brpDsHMip
         GBfNLaB2OCJNutvzoqqjr7T7/k25J7vqBL4mtOasNrTJ4g+ALj/z7sF5R64oLW9kh9GZ
         3acx3HVbpXqPAri2WonKjmXj3KduU6XNQGJoXeK8EA3qUUrc4XvCS5IWF4y8fkG9IR3x
         PMUq5FbAv5wmaBLAI0XUZNnIySxR6L9pfFj9V+3eivynyEh//9/qut0U7RvTsGDtMA1o
         QArJYMFq74mj/j6D9txw8VfQwocy3ueJZl6UJbkxX8wEO2DV75NgqPpDyX7OpxvL0CCg
         59wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750917295; x=1751522095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rm0OfZ7AaG27+skvHa9GB/aO3szvxFuyhu1AGBEZrgc=;
        b=SCKnHhGEGs9+ltreeKUHztdwF8IP1Cbi+DSAF48EN7HiBnEi0LsV8AqdJtRwLZU3rn
         yrq4V/4LaRD6Wk6MsiEHY++/TSkSv9+N4SXzepnMWyMrKpnvFMLtJdgMteQDiPyU29hJ
         V/2Bs0EFsaO/SwuumxDSXaBWej5SxLHqk87pkr5xSWsPu6n/YuLvCcayyALlww6qrGs+
         T9VElJo5wfUMo0HFOLY6xasDHqMMZ8cK+GpmKNeVOMmvzWewP53SJSROnCnSqLc6FwHn
         27kasSBd6mjjX22hA4u5xOaQQm6qt7P0TeVyVj7Bs4xwsjAXWy2DQuvGpVz26qWXptka
         dk6A==
X-Forwarded-Encrypted: i=1; AJvYcCXx6QzFN+KC1B/JTVj5HOMRjiVhs3hyW/vNp8+jZQbjGpq3k9Z/Cxk9uPV4FYxFt8DX7TTdSHad1MHxK8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNBjj3oU/telbNxg8CjybuLfXd8qXqDKzzPaJyFCRGFxiazbGE
	2+/TL7sGXGnIhQ22/B7WuME0qu2p8qXmP2M0Vv5decx2vYygW/3GEm96DFkEWWffOAZeI98wkCa
	U/38g4VYQHi4fRG5REgBj9HM+C34CwgEAHl/y1QIO0aQLucCs0Pi3qW7JYjY=
X-Gm-Gg: ASbGncsFQRmdZBOOOc38biQPbqkfHclE/GtZVy00/l38b8zTc+980RcXh1941lVlI80
	hmG491iFvHt654IQgpxaeSPiOVV9mZtZUhcoU3MhrOFmcLxtJlY08GKfa4nXoZVnnqdyXUkVgKl
	J9VtKzjKFtb+GSMTuv/LGf6iM+wLp6RmyGtgrB4gpiKrSBDqYdgRTQz4/VOtJrXLiho3K2MfbLK
	r9pKmI3lpp6B+ATG/HLtrRFr2jJ0Hw+H6+rRe8uyHaxf7yNmiDV7AiV5q0MAkueat9z4w52rUuQ
	XGRTDeJZ7J122n/oqhtnfx1WR4j8+HApxn0BODMI2tJg5HmMRURHQf/LtZbFtdiPjivYljpTFSL
	MBjKYd5iBbZwHdpjCtn1pY6cO
X-Google-Smtp-Source: AGHT+IErD6u0GnnyBjjoDbBvoZW5tms9xrqBq7DEY79r1vA3q8cM8NFq9ggAKD/BsmxJillbjalycg==
X-Received: by 2002:a17:903:41c1:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-2382409b0eemr108270405ad.53.1750917294720;
        Wed, 25 Jun 2025 22:54:54 -0700 (PDT)
Received: from zenbook (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d87182c8sm152907285ad.232.2025.06.25.22.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:54:54 -0700 (PDT)
Date: Thu, 26 Jun 2025 13:57:17 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jintack Lim <jintack@cs.columbia.edu>, 
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix MI line level calculation in
 vgic_v3_nested_update_mi()
Message-ID: <w6yfzeynleghp7sxwscbrq6ko4244c5iphtqw6e4ar5dndqs3m@37jouplavkpw>
References: <20250625084709.3968844-1-r09922117@csie.ntu.edu.tw>
 <864iw3db3h.wl-maz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864iw3db3h.wl-maz@kernel.org>
X-Gm-Spam: 0
X-Gm-Phishy: 0

On Wed, Jun 25, 2025 at 05:45:06PM +0100, Marc Zyngier wrote:
> On Wed, 25 Jun 2025 09:47:09 +0100,
> Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
> > 
> > The state of the vcpu's MI line should be asserted when its
> > ICH_HCR_EL2.En is set and ICH_MISR_EL2 is non-zero. Using bitwise AND
> > (&=) directly for this calculation will not give us the correct result
> > when the LSB of the vcpu's ICH_MISR_EL2 isn't set. Correct this by first
> > adjusting the return value of vgic_v3_get_misr() into 1 if it is
> > non-zero.
> > 
> > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> > ---
> >  arch/arm64/kvm/vgic/vgic-v3-nested.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > index 4f6954c30674..ebffad632fd2 100644
> > --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > @@ -400,7 +400,7 @@ void vgic_v3_nested_update_mi(struct kvm_vcpu *vcpu)
> >  
> >  	level  = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) & ICH_HCR_EL2_En;
> >  	if (level)
> > -		level &= vgic_v3_get_misr(vcpu);
> > +		level &= !!vgic_v3_get_misr(vcpu);
> >  	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
> >  			    vcpu->kvm->arch.vgic.mi_intid, level, vcpu);
> >  }
> 
> Very well spotted, once more. Where were you when I posted all these
> patches? ;-)

Thanks ;)

> 
> We could make it even clearer with this:
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> index a50fb7e6841f7..679aafe77de2e 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> @@ -401,9 +401,7 @@ void vgic_v3_nested_update_mi(struct kvm_vcpu *vcpu)
>  {
>  	bool level;
>  
> -	level  = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) & ICH_HCR_EL2_En;
> -	if (level)
> -		level &= vgic_v3_get_misr(vcpu);
> +	level = (__vcpu_sys_reg(vcpu, ICH_HCR_EL2) & ICH_HCR_EL2_En) && vgic_v3_get_misr(vcpu);
>  	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
>  			    vcpu->kvm->arch.vgic.mi_intid, level, vcpu);
>  }
> 
> If you're OK with it, I'll use this, keeping your authorship of
> course.

Yes this is more straightforward, with this the commit message should be
rephrased too. I'm ok with keeping my authorship but really feel free to
adjust if you think some other credit is more appropriate.
I'm just glad that I'm able to help a little :)

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.
