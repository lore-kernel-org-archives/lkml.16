Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F45307AD0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466773; cv=none; b=t/EfSf5PssDVV1W4td6gBg0Y10lqZuhzvsxCtSzE8V39Ow24H4m1dq/qhlr/lEnF0tsUfJcmfzh6JbHIGBZ+GTphj63C5vX7E9XTmtF4+xoxyRn2pUxge/pA2lWtcHOJ0gedFn2UCEiywDD/e3NZ7aLrLm5dw3JtQiEeL6ajaFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466773; c=relaxed/simple;
	bh=2Xp9LKnZCCcV5QzGeE+WbMP668C5qrnyaJjRwCYTCkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ail6CgnfiFhmGqpOGIGnDFl9Q3NYEOisC463wpp5fJ96JGCviKYvup6j5c0NtoNiqoxruN+4JtGVqoOac6xnONdV5NrlsJp+AOBFdz5e53oZgQDoT8NANA23Zgx7GlZ1/0NE8lxgs86kS/tePR4gZNCic7V0XFDj/cz+0P08WGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VQueI3ZW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VQueI3ZW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-237f18108d2so425215ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751466771; x=1752071571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqqnRujRE2SdSp3Ji3lnU4lMv7Si9SLf3Ig6FroSxIY=;
        b=VQueI3ZWJ0ILSZjHBnp+xric/rzGi6APYEPxLxl4WlaRYvt5v2yyeG8uQBarENAnsS
         OttyY22vK/89om0oFs4mYNDKpwSy6JNPjkaSxCPAtAjZnJwvZ/tFfn7PUB0ksO2PED6o
         EFeGXhHH4cCLsD/LutdtwLL7A/TQ7j5HVLgvg7qdzQPbZJpVy4JGKIEmypJTT2CgYig1
         184bKCS4E+KEFLpbaoh4OKNSUjk/+22HsAbHzakZxeS6GSEZV5deCYyRV7WC8avBZQL2
         BHeOrwePll61eePmIxPnaVT5hZdk6EmPGZvUJk7Nyq2QvnDzycxGQbEW9+ZCq6ZaHKvS
         5g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466771; x=1752071571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqqnRujRE2SdSp3Ji3lnU4lMv7Si9SLf3Ig6FroSxIY=;
        b=kjvNV5LuX4w/t7nPb3a3TOJe9y61rOg1hz2SMQvuoIYlczHs2y4wCC+yk5sAg+j2Wo
         kRWlfK2CuCGP6VfNgAmjD4MZwW0/v8H96V7EcAnejeBZ9czgnDjKWXlJ3xfReMuawknK
         jzAAP/X7K8wRHMG1H9mQrQKnzYn7yiQOxB9WZ1urTheTrlBymN/7fo/uVH/kxq2MwSZB
         GjTQAhSA+JKn733ZF2Qqd/RdqEZ/6K0J6b5KOejtLbnKA3mFjQG0tQ3+fH6ANXXQA/tE
         Fe+CEoXtSi3Ynqy9z+hDu7fdj5YeT4rRYaOZUCvlyWNz9tIV09A5T5YHbYTANenyEuxL
         I1RA==
X-Forwarded-Encrypted: i=1; AJvYcCVXpPzhPXkknYPnvET19v2z98rYfOrMH+lPxEexA8PHl0Ha3lngy/rstyppVMbCrLnnlXVyjpmBD+/3Xw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYdw55i/Kf6w86mEz+3JeARintv0/03qknsNcrHdZT5qvsi2dT
	O/KIQdw66XKf5X4Sz2H/RVoiKmCJExaYY6VqGMLq8gJ5cvTaQcVV735nKcRWvnbhVzFvxPgZUly
	Hn04qJ9cSJny9Lzl+VY0KkLSCisj7168FPgVHmEju
X-Gm-Gg: ASbGncvKkXVIt5/FTweE9SPpThPwFWH8m7jCZtdqQLSJv7pd55dpKZXcUhcQaqzH1nO
	RtTmiwchHEuhrJSKU/jzd1Gpm3+aTcvqc7HQi2B3z/zv3s6k/DMXbar09hT0Qeu3DhJ76ZP0MXF
	lve2m3xPLvC26AIWyktMP1LJb95tMgsc+ukojjIzmAmYl2/NPJ7FCVwPbWocdvzaCEZhuw0Hu5o
	/qK
X-Google-Smtp-Source: AGHT+IGoIHXKMSNgSYMoVATe9zftjUbnEF1aXjzvZLi/NINKt4JogRrvHG2G1VAsWUCf6cD0R3CJCF3RSOi1f9/p6D4=
X-Received: by 2002:a17:902:c407:b0:215:42a3:e844 with SMTP id
 d9443c01a7336-23c5ffbdd35mr6602435ad.17.1751466769703; Wed, 02 Jul 2025
 07:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d3832fd95a03aad562705872cbda5b3d248ca321.1747264138.git.ackerleytng@google.com>
 <CA+EHjTxtHOgichL=UvAzczoqS1608RSUNn5HbmBw2NceO941ng@mail.gmail.com>
 <CAGtprH8eR_S50xDnnMLHNCuXrN2Lv_0mBRzA_pcTtNbnVvdv2A@mail.gmail.com>
 <CA+EHjTwjKVkw2_AK0Y0-eth1dVW7ZW2Sk=73LL9NeQYAPpxPiw@mail.gmail.com>
 <CAGtprH_Evyc7tLhDB0t0fN+BUx5qeqWq8A2yZ5-ijbJ5UJ5f-g@mail.gmail.com>
 <9502503f-e0c2-489e-99b0-94146f9b6f85@amd.com> <20250624130811.GB72557@ziepe.ca>
 <CAGtprH_qh8sEY3s-JucW3n1Wvoq7jdVZDDokvG5HzPf0HV2=pg@mail.gmail.com>
 <aGTvTbPHuXbvj59t@yzhao56-desk.sh.intel.com> <CAGtprH9-njcgQjGZvGbbVX+i8D-qPUOkKFHbOWA20962niLTcw@mail.gmail.com>
 <20250702141321.GC904431@ziepe.ca>
In-Reply-To: <20250702141321.GC904431@ziepe.ca>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 2 Jul 2025 07:32:36 -0700
X-Gm-Features: Ac12FXxsJnd1Ik5yTb-XA10TvLxSoUfxXWhX4Ea1BvmrwrYFJWzxZ35OP06jBy4
Message-ID: <CAGtprH948W=5fHSB1UnE_DbB0L=C7LTC+a7P=g-uP0nZwY6fxg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/51] KVM: guest_memfd: Introduce
 KVM_GMEM_CONVERT_SHARED/PRIVATE ioctls
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yan Zhao <yan.y.zhao@intel.com>, Alexey Kardashevskiy <aik@amd.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, linux-fsdevel@vger.kernel.org, 
	ajones@ventanamicro.com, akpm@linux-foundation.org, amoorthy@google.com, 
	anthony.yznaga@oracle.com, anup@brainfault.org, aou@eecs.berkeley.edu, 
	bfoster@redhat.com, binbin.wu@linux.intel.com, brauner@kernel.org, 
	catalin.marinas@arm.com, chao.p.peng@intel.com, chenhuacai@kernel.org, 
	dave.hansen@intel.com, david@redhat.com, dmatlack@google.com, 
	dwmw@amazon.co.uk, erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, 
	graf@amazon.com, haibo1.xu@intel.com, hch@infradead.org, hughd@google.com, 
	ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz, 
	james.morse@arm.com, jarkko@kernel.org, jgowans@amazon.com, 
	jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com, 
	jun.miao@intel.com, kai.huang@intel.com, keirf@google.com, 
	kent.overstreet@linux.dev, kirill.shutemov@intel.com, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, maz@kernel.org, 
	mic@digikod.net, michael.roth@amd.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, pdurrant@amazon.co.uk, 
	peterx@redhat.com, pgonda@google.com, pvorel@suse.cz, qperret@google.com, 
	quic_cvanscha@quicinc.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_tsoni@quicinc.com, richard.weiyang@gmail.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, roypat@amazon.co.uk, 
	rppt@kernel.org, seanjc@google.com, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, vbabka@suse.cz, viro@zeniv.linux.org.uk, 
	vkuznets@redhat.com, wei.w.wang@intel.com, will@kernel.org, 
	willy@infradead.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:13=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Wed, Jul 02, 2025 at 06:54:10AM -0700, Vishal Annapurve wrote:
> > On Wed, Jul 2, 2025 at 1:38=E2=80=AFAM Yan Zhao <yan.y.zhao@intel.com> =
wrote:
> > >
> > > On Tue, Jun 24, 2025 at 07:10:38AM -0700, Vishal Annapurve wrote:
> > > > On Tue, Jun 24, 2025 at 6:08=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.=
ca> wrote:
> > > > >
> > > > > On Tue, Jun 24, 2025 at 06:23:54PM +1000, Alexey Kardashevskiy wr=
ote:
> > > > >
> > > > > > Now, I am rebasing my RFC on top of this patchset and it fails =
in
> > > > > > kvm_gmem_has_safe_refcount() as IOMMU holds references to all t=
hese
> > > > > > folios in my RFC.
> > > > > >
> > > > > > So what is the expected sequence here? The userspace unmaps a D=
MA
> > > > > > page and maps it back right away, all from the userspace? The e=
nd
> > > > > > result will be the exactly same which seems useless. And IOMMU =
TLB
> > > >
> > > >  As Jason described, ideally IOMMU just like KVM, should just:
> > > > 1) Directly rely on guest_memfd for pinning -> no page refcounts ta=
ken
> > > > by IOMMU stack
> > > In TDX connect, TDX module and TDs do not trust VMM. So, it's the TDs=
 to inform
> > > TDX module about which pages are used by it for DMAs purposes.
> > > So, if a page is regarded as pinned by TDs for DMA, the TDX module wi=
ll fail the
> > > unmap of the pages from S-EPT.
>
> I don't see this as having much to do with iommufd.
>
> iommufd will somehow support the T=3D1 iommu inside the TDX module but
> it won't have an IOAS for it since the VMM does not control the
> translation.
>
> The discussion here is for the T=3D0 iommu which is controlled by
> iommufd and does have an IOAS. It should be popoulated with all the
> shared pages from the guestmemfd.
>
> > > If IOMMU side does not increase refcount, IMHO, some way to indicate =
that
> > > certain PFNs are used by TDs for DMA is still required, so guest_memf=
d can
> > > reject the request before attempting the actual unmap.
>
> This has to be delt with between the TDX module and KVM. When KVM
> gives pages to become secure it may not be able to get them back..
>
> This problem has nothing to do with iommufd.
>
> But generally I expect that the T=3D1 iommu follows the S-EPT entirely
> and there is no notion of pages "locked for dma". If DMA is ongoing
> and a page is made non-secure then the DMA fails.
>
> Obviously in a mode where there is a vPCI device we will need all the
> pages to be pinned in the guestmemfd to prevent any kind of
> migrations. Only shared/private conversions should change the page
> around.

Yes, guest_memfd ensures that all the faulted-in pages (irrespective
of shared or private ranges) are not migratable. We already have a
similar restriction with CPU accesses to encrypted memory ranges that
need arch specific protocols to migrate memory contents.

>
> Maybe this needs to be an integral functionality in guestmemfd?
>
> Jason
