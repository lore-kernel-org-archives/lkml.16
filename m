Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FBE146D6A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 00:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751503976; cv=none; b=GfV89WM3bIET1uhuK8/1yqg4rZClJRKD4N/4XFAKDlC0HgRwjTK0qyGKL6Oq0b7N2NhfvODEZqoSVTyjhRQ73s4X3gTUAM74GY9R+TiKf2tq0pIjdhwx1TdemsLQnlzKkQv/9WVOnINdhO9i8JxCN0Zz58TgiEjx4/4oSJi2FYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751503976; c=relaxed/simple;
	bh=3ip6s+5sm9dgYNEHV97RoKIsPdbndT+Fx9GX9Wu0fbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqgsKhrVXBwTrCGI3gpTn+XDtYvMTcMi43Vn0GaQOCG7ghzo1GbIWtdGJDtNtgmNo7iDMdZf5tqLdD09PoBkT6om0sGVM7IuYGeD1NkQRk4NNICF9KaRdyFTTbRbaGSlaenFB1z2y6pjJwYW3mi0zGUS9jb0qnBIAr9J40KDkpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jYoduaEe; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jYoduaEe"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2357c61cda7so47985ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 17:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751503974; x=1752108774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgLz/FoYLsgVHZArlQZ88/AwsvSWB8vESjOZVh7NJ98=;
        b=jYoduaEeK/PBIiL5Bl7n/FNYxDTirSL1kXJ72w9kYVWOCGuxAfXYZcetkcS6sAfNpq
         D28CMPrusB8oBfc634H8YpW1YMu1oVVEbAfvKxX0l92Uy737eZhrChz4C2tLJUK3oz45
         AginuNhBDBWVZzXHKn2PfKxh6dECZMB0tZbccrWjgsUMlM0V0CSMjgYqJUL5dx85AZbk
         gA38JpCEDLailiqEcNVDRVseNBdpXaWGQMAsIVL+4/PKwyjoMgTfvH9vzWz32VONnW7B
         4oqxMQQ9TgvkiwxOSMEnqpcgg4GLEo4Ty/5bXKFmHZOVkSYWZfUP/Azh15MYZyeriXrJ
         IOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751503974; x=1752108774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgLz/FoYLsgVHZArlQZ88/AwsvSWB8vESjOZVh7NJ98=;
        b=otJmvH7A4K9HV6EacCJRjg+2iQ/GJEUnPqNZE0joQzL2hh+4UcjTy4TQPxkEVXt6t0
         qQbsqnTXxvk1e48dYiVklpecSzx9u63k+SeKJ12AHwx3cUkf0fZpcJmr718zSiz28JO2
         J3HVTfQqKWTvHz9zkyeuHmQrzET3AwkcsRM2rh95HQ5VLUvZKEfbKrPxdaBKBIAXf6HG
         4BInwO2g6py1p6n7SmhjPmYJQ/ta9EbSmRmjt+7rKEkJKs1qlMGGHQGbeb97Blpltj0p
         Kpy4Pm82W1mNCLvTLwjkPPetcUME085i10yJNwHhVcGbq/AWx7FkhjE40rOxNPf1IaNL
         tITA==
X-Forwarded-Encrypted: i=1; AJvYcCXTcFW8IC6k0uJ28A/Tn+bY3BR2h/XotOfHNQz02CA8JyPpM4jMqAGdtQEYiCYc4pol7EVt1myQ7FF/hV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznll8dfCW5IXJqmX79LJAY/TPYmD6EcSW6gaZoT3AAEG4FneX2
	MJSqV8hclaGc882iuGQIuIAT5m7iKSgqkXkEi0qR6aTZY7/djMPKHxuN4BrTxxMvwvpK5YOLNCf
	0QkXNJdq+fw1sdLUwIOP1/VcYOb9/L5Z8nr78TCOR
X-Gm-Gg: ASbGnct1Of4xrGl1C4it6Xbq4mrhNVRhdwPd2C0/Fup7BqHJ83aI7v/ucS4BBXNSN6J
	mYxtV83jvaGcMSQOBeO6XKz/X6PvGiG/IeUfw3LcuZ/13NFoK2SXHdYIWB+9nQEcD4k27nYURvb
	Wj9gRBrananiV67IfU3xe1uL8HCqyojrDk9Ak9gxgnt7BgrAVWli71/EJhumlS+XC1hWEJP3L/
X-Google-Smtp-Source: AGHT+IG198J5XmfSPZMitL9d3FcAbULBcHuVy8v8Ee5QkIR46tmXRRtU6UF3dkNRuVzPV1IlHaErLL6ia9hlIQfVVi4=
X-Received: by 2002:a17:902:e788:b0:216:4d90:47af with SMTP id
 d9443c01a7336-23c7ac47467mr572075ad.29.1751503973594; Wed, 02 Jul 2025
 17:52:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529054227.hh2f4jmyqf6igd3i@amd.com> <diqz1prqvted.fsf@ackerleytng-ctop.c.googlers.com>
 <20250702232517.k2nqwggxfpfp3yym@amd.com> <CAGtprH-=f1FBOS=xWciBU6KQJ9LJQ5uZoms83aSRBDsC3=tpZA@mail.gmail.com>
In-Reply-To: <CAGtprH-=f1FBOS=xWciBU6KQJ9LJQ5uZoms83aSRBDsC3=tpZA@mail.gmail.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 2 Jul 2025 17:52:40 -0700
X-Gm-Features: Ac12FXxF97bn5vvTfJb7Vj8yqVTPgeruSo8qM9fM404AQ465bIDQRHsCOPgG6vA
Message-ID: <CAGtprH8xZLqx514XxvNSb2PfK53zGiCP9ARcbv9rbpF=OpBaRg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/51] KVM: guest_memfd: Introduce and use
 shareability to guard faulting
To: Michael Roth <michael.roth@amd.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, linux-fsdevel@vger.kernel.org, 
	aik@amd.com, ajones@ventanamicro.com, akpm@linux-foundation.org, 
	amoorthy@google.com, anthony.yznaga@oracle.com, anup@brainfault.org, 
	aou@eecs.berkeley.edu, bfoster@redhat.com, binbin.wu@linux.intel.com, 
	brauner@kernel.org, catalin.marinas@arm.com, chao.p.peng@intel.com, 
	chenhuacai@kernel.org, dave.hansen@intel.com, david@redhat.com, 
	dmatlack@google.com, dwmw@amazon.co.uk, erdemaktas@google.com, 
	fan.du@intel.com, fvdl@google.com, graf@amazon.com, haibo1.xu@intel.com, 
	hch@infradead.org, hughd@google.com, ira.weiny@intel.com, 
	isaku.yamahata@intel.com, jack@suse.cz, james.morse@arm.com, 
	jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, jhubbard@nvidia.com, 
	jroedel@suse.de, jthoughton@google.com, jun.miao@intel.com, 
	kai.huang@intel.com, keirf@google.com, kent.overstreet@linux.dev, 
	kirill.shutemov@intel.com, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, maz@kernel.org, 
	mic@digikod.net, mpe@ellerman.id.au, muchun.song@linux.dev, nikunj@amd.com, 
	nsaenz@amazon.es, oliver.upton@linux.dev, palmer@dabbelt.com, 
	pankaj.gupta@amd.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	pdurrant@amazon.co.uk, peterx@redhat.com, pgonda@google.com, pvorel@suse.cz, 
	qperret@google.com, quic_cvanscha@quicinc.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_tsoni@quicinc.com, richard.weiyang@gmail.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, roypat@amazon.co.uk, 
	rppt@kernel.org, seanjc@google.com, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, vbabka@suse.cz, 
	viro@zeniv.linux.org.uk, vkuznets@redhat.com, wei.w.wang@intel.com, 
	will@kernel.org, willy@infradead.org, xiaoyao.li@intel.com, 
	yan.y.zhao@intel.com, yilun.xu@intel.com, yuzenghui@huawei.com, 
	zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:46=E2=80=AFPM Vishal Annapurve <vannapurve@google.=
com> wrote:
> ...
> >
> > 2) There are some use-cases for HugeTLB + CoCo that have come to my
> >    attention recently that put a lot of weight on still being able to
> >    maximize mapping/hugepage size when accessing shared mem from usersp=
ace,
> >    e.g. for certain DPDK workloads that accessed shared guest buffers
> >    from host userspace. We don't really have a story for this, and I
> >    wouldn't expect us to at this stage, but I think it ties into #1 so
> >    might be worth considering in that context.
>
> Major problem I see here is that if anything in the kernel does a GUP
> on shared memory ranges (which is very likely to happen), it would be
> difficult to get them to let go of the whole hugepage before it can be
> split safely.

The scenario I was alluding to here:
guest trying to convert a subpage from a shared range backed by
hugepage to private.
