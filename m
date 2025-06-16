Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61B3F4ED
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084654; cv=none; b=u6dA+hECcmgd5FT3RLqzLg+xofcRdGk1uS3qCuCQDdvpcLKgzvG5IRZIIxTVVnVBEzcmK172Haba5soPpa+TBj70EPWk3BgjXzsB8wsBGerrvSFO6DuTXTsMbHdYEFS2ItHwuvrewfkQKPuN9F5uAh85xcVPXA4anRaqglpZe+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084654; c=relaxed/simple;
	bh=Tv1Lo6YhzFqNH8VTTXLCD9vFqIYM6L+1w8v2FhylPYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwTLmkZy3L/75rb4I07JYFqeQyXUGSph6TqTZA7LWsrKwdbxQzuQ+rItKEFigf0HwDCAiZ9eaAMsiCYOhf7Gy09O4kkajUoTzaRljufBBm4Pgf3nLEOPBX56fsG/lhwrNGoqTopQEYrEm4v5udSjuVR+D9TloJnFDeJpVNio9Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw; spf=pass smtp.mailfrom=csie.ntu.edu.tw; dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b=kbbLd2Nn; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b="kbbLd2Nn"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-879d2e419b9so4461788a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1750084651; x=1750689451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AkrvKj4WRhOO8zn50L5JIugDkJwYWJauK6qeewS2paw=;
        b=kbbLd2NnKIBxk+BW3HaKn00XMHhbqdQIRwwZ/l5bMP/Er9CeHPCJJptfaCCvGc9+s2
         GWuft1XSEVXPaW5Q5KDgG4Rd8/+B9n63tyc4ojje/Ne6AdJ/qmQRKLRRtJo0b832ezH0
         Bdu/7C0q8rB9iO/Gk7po0UW1GQOmp1Odq+BtD8OHWWL2We/WeCiNDktsPr877cTsyf2n
         7yFnc5t/k6KPNGtoIAc9t98RMKESEYGo7ADlF6v94d4sBgzNraO1O2UqDCvDQAv1xRjC
         CBy1yzFWI+vXY6pHTP+wqNNSjSBdHaAreICEkhxdSFb9k8am9vTYSYYAJexttVuuPqVU
         7/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084651; x=1750689451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkrvKj4WRhOO8zn50L5JIugDkJwYWJauK6qeewS2paw=;
        b=urA9g1ya/7XRKJDwhpLOFJ7U1brkOdiB4pQYQDWpMFkh0HT60r1dsPPWjhVhsRoKKu
         azF1SZm+mLbj3ddz8D4dMg8JeWKv1IAxCF5fNf3dIJV+eRQORH0a+oE+w382D8hbJgeB
         ywyN3WvWCFnXmPLy0R2jTH+Qm9eFU9UO6uV8SjCocANc9d/cwpkmFRkfa3e0/WX0+RDN
         J+A4XxD9S1x9pOuBjWMxTH/shwmD0U2HIQWSfuQsQde4Ud+MMdPiFMsbDspJXQhoxFQs
         MHTkEWO/RDa5UnvczGcs31zC1tfNoPvQxDIxXttQzUGlhah16Vp4BnkxJOKFYgs0tNJf
         176A==
X-Forwarded-Encrypted: i=1; AJvYcCWzmA+bWNvSMWQ9123UJkNhR7AHESEbIz13L60b7cqOkbkY9sd8MpFfiEGVVpK/r7xqNeI5Y3Q1Fo0sq+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTKA+ctcMZXJqvADeTD8ni8BhdHJoNgR8n4T0NZXUikW46hG+Q
	XX27MkDxUmqPPjvmIs7iXi84R0rmPVCXXfvfbxOjeFkyOlOd9XzyKJKs4a9RHNK4gOJodtLmhTE
	SmKiiFMMKduV5cC9yjPD6aaTCDZDMhmU2BPTQjWT13ttrG5ODAi4tpwJVyhg=
X-Gm-Gg: ASbGncv/GuzPbbSj3SdSTjTHhK6gcpVDeZlBU1CKeeN72x2zfSufJO+TbuTsmD67RX7
	EoQpuFFOPOwVKuk/5fIBucj18l9PcjVx2JwAfosBAMs0FOvtGCsODF25eFwTxQSsTcA0Dm8NJZX
	pnKi+NIzMNwCaBE25mrabIxFM4EomAIuO7MtnTa2Tgz1QR6sx6dwfig2m7FxmtUY6VxwlDROsXr
	Nx+wJvddaq7y9Zkzq74sgo+6B15Sr3YRCPdUjqBUDKNS4aFyhmp+48vC+ICJDfxArW1II2XEsvB
	mNIRSL0hJ/4OVW5TXfCFzP6ET9lZm8PT5ZKTvUmlK6318UAniZPF8/DuMSzZ5yEdSgH8M3s5U5z
	oiVcDZqtMzSRkqekZhkD3RcF7nAO3npkfRoE=
X-Google-Smtp-Source: AGHT+IHiHWhPvC3rzDccVIiloYznB+/CDW0xPfXegwCPoIernL0gBJI4EEGAaNyjQ6pQCOBf+YUk3g==
X-Received: by 2002:a05:6a21:600b:b0:218:76dd:a66 with SMTP id adf61e73a8af0-21fbd527f54mr16043044637.13.1750084651197;
        Mon, 16 Jun 2025 07:37:31 -0700 (PDT)
Received: from zenbook (36-228-20-239.dynamic-ip.hinet.net. [36.228.20.239])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe168a4b2sm6996769a12.61.2025.06.16.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:37:30 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:40:03 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jintack Lim <jintack@cs.columbia.edu>, Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix s_cpu_if->vgic_lr[] indexing in
 vgic_v3_put_nested()
Message-ID: <b5jwzhkkg2ensclxfj4uozpbibo5sgbcdm7tngharnjmqxswqc@ktywljdle6of>
References: <20250614145721.2504524-1-r09922117@csie.ntu.edu.tw>
 <aE-xyGGpHXdJ_pcF@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE-xyGGpHXdJ_pcF@linux.dev>
X-Gm-Spam: 0
X-Gm-Phishy: 0

On Sun, Jun 15, 2025 at 10:55:20PM -0700, Oliver Upton wrote:
> On Sat, Jun 14, 2025 at 10:57:21PM +0800, Wei-Lin Chang wrote:
> > s_cpu_if->vgic_lr[] is filled continuously from index 0 to
> > s_cpu_if->used_lrs - 1, but vgic_v3_put_nested() is indexing it using
> > the positions of the set bits in shadow_if->lr_map. So correct it.
> 
> The changelog is a bit too mechanical and doesn't actually add anything
> to the diff. Maybe:
> 
>   Shadow LRs may exist at different indices from the corresponding LRs
>   in the guest hypervisor's vgic, as the shadow LRs are populated
>   contiguously in vgic_v3_create_shadow_lr().
> 
>   Use the correct shadow LR index when forwarding vIRQ state back to the
>   guest hypervisor's vgic in vgic_v3_put_nested().
> 

Hi Oliver,

Although we're not taking this, I still appreciate your help on the
commit message.

Thanks,
Wei-Lin Chang

> Diff itself LGTM.
> 
> Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> 
> Thanks,
> Oliver
