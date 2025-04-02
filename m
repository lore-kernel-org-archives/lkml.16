Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A51E1C29
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596418; cv=none; b=RVNp5hrGG8Q+a9cbZJ6sA4/bvJ7w3KqNNuAaG+Qh6iHXdz3YO4q28j5Wq9i8V/HPYUoxYLiPjKF8shpClN6yrcXsdjU/xifv02aO4IYJ1AVbu0yX+73dF8HGMZTqLteZZ7BMvG2NLAzqpMkp5BlD3KX6+qsDqNryCj9M7PhjCLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596418; c=relaxed/simple;
	bh=2bqiVwG6B9b93pHmMU3Wt9WeVY2w2INe21iLiS7fKnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fv6DPPpYV3fY/Exxh5x4T2MyGZvKq6lnfs99sJZMgs68xLrRAQOajE2cAlNXMOTLkRWyHXi3YkSyEzPtUYevqugvb6YoHpg9g2SaozTO2YpzjfxMaC+iTSzNd6HIpi7vil933nKTD6/xAHMB68K0jKzn0iuFr/ys79N2nQMOStQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ul1s+NGl; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ul1s+NGl"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso8471930a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1743596416; x=1744201216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWJxBNwkAmqL2G8fzcWM9thfWI+FACEvfsrq+gEk/S0=;
        b=Ul1s+NGlPF2GqNKPp1xdCWj+kSUqbvHYVWTO5lTTf6IS04xFPpnB4fVrDjc8IS/FCM
         aItwAASZoDeYz7APR8kOhp07jBbeRRkmHxSJFXCcAxygO+ceDduJD+mGcKD2176a7C1M
         8fEYVum0/giaj7ClXK55hutpT9HjcMwY0Pd5YjHh1Ajdf/sW0w4alRpQ7P/gY2CdKAya
         KzI+55YPGBR1jlnxHpfKnzFcOuSzp8sC7alqDA+tS0nHc5RJqtnH4JJ9/B841GLjfLR2
         klHb8L4OTduRpVb32LCoEMT1agt41YaZJI0YGHCXPRiQ0mGO7VPziSlDD1NYvcFNenwV
         cBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596416; x=1744201216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWJxBNwkAmqL2G8fzcWM9thfWI+FACEvfsrq+gEk/S0=;
        b=vUKTmlbA7I5wDDzAmZu+mPpgZaWy5xTBAs3g0VNMDdK2e9RHN+EfKc/GBTxhW+l8AS
         ori/oLZydMs0upysQzstc7HZ/A6JFsRUiauEt4dSZegJ65BFmWbyt2tErpTbvfUqMFoX
         Ju5dOzW+GNCUuhRXmyC3OtlGf2LjazgJvW+9YKB/q7Sf5Zb8Svl4aor6aKNxImVGZjeB
         VvzbrWygqMv0vUDU0i6KJ911SnokRNaMrYnSJjA4hZ932oKpA7d1zfZBJ2P2Mo7O9K3I
         HfTovjRFlvFoFKYK1MffiQAfQqU4ct3JEDovZyh8unxA3F4QDR4Tw/uZoiYrspso3p7h
         5G7w==
X-Forwarded-Encrypted: i=1; AJvYcCUEwmASXfC+i01nxDSW9WK1wNbO9Cgcdh7pB/fjMmdWHpdtXOKNTARgzkqlwYLNPacORSpgSHGEqsl1VH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPdgWI/gpUeuTEmMlEE7cVxbrnHmhKHyx4d5ZvBIRSAuFFr6t
	/1pAMzQ0HyGjcOPiMxT23jkppuZI7Nr1REfsZSvnASS8GoHxJJtbrgzN7YuFuA9ltH0zq0QDnLv
	UPnMOFq3kjVI7loBr4m4TIz88RSsRO9Lucde7dw==
X-Gm-Gg: ASbGncvwXzqCCYd2Qu11Wl/IY8FaOTBNSDQi6WAkUXV94pfVj5ChF55M8Tq2+2xDdV2
	EgT6aTETD+dXpmM6rm0tZJjLylW3VhMYoHw5JwOs3qsY6rFE48Tv7fgYGFNkK/I9ztriNNev3WW
	HUTg+VX4rb+LFqylI4XjR6p5FB6iOG3/629Ce77Q+PKXedP23KJQ==
X-Google-Smtp-Source: AGHT+IG9C4OmAcA1BcvJZJK8vgSK/DWCvtCqpq1tzxaqNCtVF3YEFGKjwNPiS170vkEx7SYXHsTEXZvGHRmNASAO4vI=
X-Received: by 2002:a17:90b:28c4:b0:2ff:58a4:9db3 with SMTP id
 98e67ed59e1d1-3053215d8aemr22113172a91.35.1743596415763; Wed, 02 Apr 2025
 05:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325144252.27403-1-luxu.kernel@bytedance.com>
 <9F043708-3BB6-46CF-BEC3-2636E9A388B7@jrtc27.com> <CAPYmKFtAWNz7nCDDD7rjGeV2fRBgy5Kt6KR60pEyXAM=bb7r4g@mail.gmail.com>
 <20250401154412.GI186258@ziepe.ca> <20250401220201.1fa3ec76@pumpkin>
In-Reply-To: <20250401220201.1fa3ec76@pumpkin>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Wed, 2 Apr 2025 20:20:04 +0800
X-Gm-Features: AQ5f1JoCpzXNEfUDVMpNcZU9VBfEeMyRz89Td3As3soGZh_OUSrxjWt-F5xQW4s
Message-ID: <CAPYmKFtOV6JfAudcw4gfWpgQv8k3Q6dNrTynqYo2tSdZEAwKHA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] iommu: riscv: Split 8-byte accesses on 32
 bit I/O bus platform
To: David Laight <david.laight.linux@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Jessica Clarke <jrtc27@jrtc27.com>, tjeznach@rivosinc.com, 
	joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, alex@ghiti.fr, 
	lihangjing@bytedance.com, xieyongji@bytedance.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

All these 64 bit registers are updated during initialization (when
allocating page table and iommu queues) and destruction (when
disabling interrupts and iommu queues) in the existing iommu driver.
There won't be multiple cpu operating simultaneously.

Some 64 bit pmu registers are also updated during pmu event
initialization and overflow handling in the oncoming iommu pmu
driver[1]. There will also be no concurrency issues due to the pmu
framework unless the ACPI/DTS is misconfigured and two iommus get the
same register resources.

So maybe a lock is not necessary. Please correct me if I missed anything.

[1] https://lore.kernel.org/all/20250115030306.29735-1-zong.li@sifive.com/

Best regards,
Xu Lu

On Wed, Apr 2, 2025 at 5:02=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 1 Apr 2025 12:44:12 -0300
> Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> > On Wed, Mar 26, 2025 at 11:26:07AM +0800, Xu Lu wrote:
> > > Hi Jessica,
> > >
> > > > Is such a platform conformant to the specification?
> > >
> > > We have talked about this before [1]. I think the IOMMU spec does not
> > > mandate the implementation of 8-byte access functionality. The relate=
d
> > > sentences are listed below:
> > >
> > > "The 8-byte IOMMU registers are defined in such a way that software
> > > can perform two individual 4-byte accesses, or hardware can perform
> > > two independent 4-byte transactions resulting from an 8-byte access,
> > > to the high and low halves of the register, in that order, as long as
> > > the register semantics, with regard to side-effects, are respected
> > > between the two software accesses, or two hardware transactions,
> > > respectively."
> >
> > I think the commit message should explain an anyalsis that the code is
> > safe against the mentioned side effects due to ordering.
> >
> > And a comment should explain this:
> >
> > +#define riscv_iommu_writeq(iommu, addr, val) \
> > +       ((addr =3D=3D RISCV_IOMMU_REG_IOHPMCYCLES) ? \
> > +        lo_hi_writeq_relaxed((val), (iommu)->reg + (addr)) : \
> > +        hi_lo_writeq_relaxed((val), (iommu)->reg + (addr)))
> >
> > As the naive reading of the above spec paragraph doesn't seem like
> > there are exceptions or why one register has to be the opposite order.
> >
> > Also missing () around addr
>
> It is also double-evaluating (addr).
>
> I hope there is a lock, interleaved accesses from multiple cpu
> may not work.



>
>         David
>
> >
> > Jason
> >
>
