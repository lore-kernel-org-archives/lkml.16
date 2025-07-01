Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7FFEEBA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 13:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751376773; cv=none; b=KvNE2NmgLGHGXIpXrvnu3Dr6RD5/R3BzXAWlXfuf42/TTcSqB9nNrfp0v3C2kNffWARKHSYCRRVgaszrTLOxh9abObGErfo5tkC6MCh4KANJeWhyOdW0hl72xiCp4Lw7Mf8KNN7xJOgZm4vLkHTRVlWqOiVONfIA85iFL3EeWfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751376773; c=relaxed/simple;
	bh=ynymbXXmqQCfqites0P4IUA7UVoWDJGePQgacU+m3a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbV5fdGfe7D64MjU1iqYMUFJEnEIgg/YwAVUG0ZkgTpKCyyGuuuh5F50LCVleZYj+JQE6noYsVGXaP3PA745DO1VpV4CgsMAhj4SttuzZXAo+p8CnO/1RAxILrOjA3zkFLxLRGCWkOLHfudBfMVFe0j9NiNpnfaT7w+n81hYtTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zb0eajEm; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zb0eajEm"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235e389599fso220185ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 06:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751376771; x=1751981571; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynymbXXmqQCfqites0P4IUA7UVoWDJGePQgacU+m3a8=;
        b=Zb0eajEmnnNRGKDKAHOaJBuJLdtTEkWiOZvJEa7qwjd5z/NPzqBHehYBzB6dttrtyX
         EBPK5CxxJwjIe7QY3tigyHZTpzLrHB0HSfNyNeJoauepJHdUv3AHjOw7X23PPS3UI51D
         03XEgQJlvvq2BUMAkc/vlBFUwryFQMaPlNFACDjePrAGVqTatfFArSKMNuPlAzNLwE67
         zggdGkUTGNW7Dd0Qf7CnMiilShfC/E71PAZ8rLMeWFuiSaiOvsmHoya4TWJEPRJNmyhu
         8M3vNEaHlzQ197qlS+knyd1WEzVliB45Y5VPwIL+KFqM3GgI9pegAOlA/fD7aAjKoQ3R
         ZyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376771; x=1751981571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynymbXXmqQCfqites0P4IUA7UVoWDJGePQgacU+m3a8=;
        b=OQmsk2+OrGbJ01jvNiFWUHUcuXHhLeUo5MXzkk8HLwEfZkmOnfa+i0NnJN5oFGqDg7
         wzd5XOMy1DkxMxFfxhIqwFrWILyuEFggW7yfg2SRBWOWqpWzJttyW2hgHvFMc1zoGXUn
         orCOa4/Gbr7vun6hnKqz2w/6hEpQ7z1Jcqo/eEgNaYlxrJACPOUjpSZwLr579Ej+iemI
         +PIZMUGepNwFJvktdvC6tnNXk5Cj6Yxwj3Up34AnOKeGJqXHQpPLq73rp7diFSWrgrvB
         1ASZflrlvzv/O7697lzyuGjtooeQ4tbdE4n7nhzKVs8awrR/MvCccQ7TiWp2tN20J0As
         nsww==
X-Forwarded-Encrypted: i=1; AJvYcCUd/ilRu30hhO7fxACmcbCSAEk/SmybKugN1sHinIfkS647Qqi3SvHvrHeyASHcCG76Y7NIFL89E1aWzn8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxkqa1z8Y3l3h8mIEnpizmn0K6hsvzPkitYy3mcc3eFetKkoCbN
	lLc3R7ysVkezI8GfExH/9seYKTs7HyF6W5fto2fcsm6gUAKoV04/ac8MhN6HDwPL2OEkQAaouBX
	pQw/+z2jAZ5nb4fSDfwY6I7ijMjXiP2FVG+NbFYHo
X-Gm-Gg: ASbGncuCV/rXRCs1QOPc7VhFI7iq8l1k+M/Cp474hP5txaL0z5MBiu9MQ4c7WAb4aro
	2GSvpkmq1DEClucJigb4Hl3caE4oakSlbLoDP7xZLIAZzQUwC9gEZqegfq2ffFZbxIhoJ0lnYkq
	lGuzGQsNJcuTW81HOVODcZ/R9H/XF4cErtedU3rJrsmCUQzAixLWqkekltCosfzijWzQxWZcgJG
	AFAmYseyMotGQQ=
X-Google-Smtp-Source: AGHT+IEagAKqOyClH7SOAfBHMg3NoeEcgu+JB1EzrpoRe0zsCoMAbrQJFAr0ZOE+dMR9X3WzUkkDx4WrYIwLroz2FgU=
X-Received: by 2002:a17:903:b07:b0:234:bfa1:da3e with SMTP id
 d9443c01a7336-23c5ff04d7cmr1978595ad.5.1751376771126; Tue, 01 Jul 2025
 06:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c69ed125c25cd3b7f7400ed3ef9206cd56ebe3c9.camel@intel.com>
 <diqz34bolnta.fsf@ackerleytng-ctop.c.googlers.com> <a3cace55ee878fefc50c68bb2b1fa38851a67dd8.camel@intel.com>
 <diqzms9vju5j.fsf@ackerleytng-ctop.c.googlers.com> <447bae3b7f5f2439b0cb4eb77976d9be843f689b.camel@intel.com>
 <zlxgzuoqwrbuf54wfqycnuxzxz2yduqtsjinr5uq4ss7iuk2rt@qaaolzwsy6ki>
 <4cbdfd3128a6dcc67df41b47336a4479a07bf1bd.camel@intel.com>
 <diqz5xghjca4.fsf@ackerleytng-ctop.c.googlers.com> <aGJxU95VvQvQ3bj6@yzhao56-desk.sh.intel.com>
 <a40d2c0105652dfcc01169775d6852bd4729c0a3.camel@intel.com> <aGOr90RZDLEJhieE@yzhao56-desk.sh.intel.com>
In-Reply-To: <aGOr90RZDLEJhieE@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 1 Jul 2025 06:32:38 -0700
X-Gm-Features: Ac12FXznEEaVgTq1KoEMvIM8DzuAoBbETAFwoD_TfWy7Ms2Xt9Fv1vPaChxyp8s
Message-ID: <CAGtprH86-HkfnTMmwdPsKgXxjTomvMWWAeCuZKSieb5o6MvRPQ@mail.gmail.com>
Subject: Re: [RFC PATCH 08/21] KVM: TDX: Increase/decrease folio ref for huge pages
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	"ackerleytng@google.com" <ackerleytng@google.com>, "Shutemov, Kirill" <kirill.shutemov@intel.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"Hansen, Dave" <dave.hansen@intel.com>, "david@redhat.com" <david@redhat.com>, 
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "tabba@google.com" <tabba@google.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "quic_eberman@quicinc.com" <quic_eberman@quicinc.com>, 
	"michael.roth@amd.com" <michael.roth@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"Peng, Chao P" <chao.p.peng@intel.com>, "Du, Fan" <fan.du@intel.com>, 
	"Yamahata, Isaku" <isaku.yamahata@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, "Weiny, Ira" <ira.weiny@intel.com>, 
	"Li, Zhiquan1" <zhiquan1.li@intel.com>, "jroedel@suse.de" <jroedel@suse.de>, 
	"Miao, Jun" <jun.miao@intel.com>, "pgonda@google.com" <pgonda@google.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 2:38=E2=80=AFAM Yan Zhao <yan.y.zhao@intel.com> wrot=
e:
>
> On Tue, Jul 01, 2025 at 01:55:43AM +0800, Edgecombe, Rick P wrote:
> > So for this we can do something similar. Have the arch/x86 side of TDX =
grow a
> > new tdx_buggy_shutdown(). Have it do an all-cpu IPI to kick CPUs out of
> > SEAMMODE, wbivnd, and set a "no more seamcalls" bool. Then any SEAMCALL=
s after
> > that will return a TDX_BUGGY_SHUTDOWN error, or similar. All TDs in the=
 system
> > die. Zap/cleanup paths return success in the buggy shutdown case.
> All TDs in the system die could be too severe for unmap errors due to KVM=
 bugs.

At this point, I don't see a way to quantify how bad a KVM bug can get
unless you have explicit ideas about the severity. We should work on
minimizing KVM side bugs too and assuming it would be a rare
occurrence I think it's ok to take this intrusive measure.

>
> > Does it fit? Or, can you guys argue that the failures here are actually=
 non-
> > special cases that are worth more complex recovery? I remember we talke=
d about
> > IOMMU patterns that are similar, but it seems like the remaining cases =
under
> > discussion are about TDX bugs.
> I didn't mention TDX connect previously to avoid introducing unnecessary
> complexity.
>
> For TDX connect, S-EPT is used for private mappings in IOMMU. Unmap could
> therefore fail due to pages being pinned for DMA.

We are discussing this scenario already[1], where the host will not
pin the pages used by secure DMA for the same reasons why we can't
have KVM pin the guest_memfd pages mapped in SEPT. Is there some other
kind of pinning you are referring to?

If there is an ordering in which pages should be unmapped e.g. first
in secure IOMMU and then KVM SEPT, then we can ensure the right
ordering between invalidation callbacks from guest_memfd.

[1] https://lore.kernel.org/lkml/CAGtprH_qh8sEY3s-JucW3n1Wvoq7jdVZDDokvG5Hz=
Pf0HV2=3Dpg@mail.gmail.com/#t

>
> So, my thinking was that if that happens, KVM could set a special flag to=
 folios
> pinned for private DMA.
>
> Then guest_memfd could check the special flag before allowing private-to-=
shared
> conversion, or punch hole.
> guest_memfd could check this special flag and choose to poison or leak th=
e
> folio.
>
> Otherwise, if we choose tdx_buggy_shutdown() to "do an all-cpu IPI to kic=
k CPUs
> out of SEAMMODE, wbivnd, and set a "no more seamcalls" bool", DMAs may st=
ill
> have access to the private pages mapped in S-EPT.

guest_memfd will have to ensure that pages are unmapped from secure
IOMMU pagetables before allowing them to be used by the host.

If secure IOMMU pagetables unmapping fails, I would assume it fails in
the similar category of rare "KVM/TDX module/IOMMUFD" bug and I think
it makes sense to do the same tdx_buggy_shutdown() with such failures
as well.
