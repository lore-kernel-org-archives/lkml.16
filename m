Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8839E28934A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629784; cv=none; b=D5SIYqPRqYKLD+dqvabbY+7fKOpSdGwiNtUSwC/C5D3Gpvs7e5ybMuv81T5sw5nKvalojnT9VFI5KJRqd3d7fICtu6/V1DnzPbaMbx16CPs2lHxU/oCTD7bU3Pg0EAtAyuBpqZF2WXl+HOQdbWSd5LmY588tB9YXTCzGUeSYlM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629784; c=relaxed/simple;
	bh=K27oAefXMcxovF/muz2h6aBidpXaWFBVFXHHG1YFnk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uHVGyDubGWZvp+u/C5OhRw4j6Ia9fTmRZRJa0EDJg8mlyFElMyytdeVbAP1Vw2Buqhgpia+0Z/kKsdQf7viJHvX3nWrPdQ/oSa3ISxjMwrk9vYevc0LvSUrfiIykQFk12/crpQS2MX6mZ5ZjdSbEEWGBF87TBtzDkfq6RpCOhgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DO25z3Pv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DO25z3Pv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e39fbad5fso170515ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746629782; x=1747234582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K27oAefXMcxovF/muz2h6aBidpXaWFBVFXHHG1YFnk4=;
        b=DO25z3PvRCDuvUGAq1TuWZdbEx1HrKJyIhGD0IH/TaLZdLK+rJztBs+ts0lKYA0XxS
         7yiigAb2PNXozcO3KoGHUdJWDsjKGpIkbpgehPbj0HjXd8zEBpDCNlMbqr14pipBdw2B
         GKHwSWURwGttpCyllmlvQqc/YMjudcAVgvUDfjl+RL+w87jFFMVzKkEBVFvUWLz7KlbV
         iC2eohaIVxOtjDfHNlptSDz3J9WIkXpAnqakXFyc1DqWUCvREPehpj2cqJE7IWx1jtIw
         DTzHdmVD4WHFnwuS1YKxPcSzFqIsoPhsULOTnrPyNS+uR4xKDIWnCYACk3lzDXnTi7fd
         GGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629782; x=1747234582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K27oAefXMcxovF/muz2h6aBidpXaWFBVFXHHG1YFnk4=;
        b=C97hggJCYcdnwrfA1hIfZsIUp/SRAuvBUH2P/Ujrte+ooTDZOztN7W2UetZ8mJzYQQ
         bNjmLi6T8f4jnB4Z3SYPnm1lkwA55ftMtpxnatrNOvzNb6d+8zbNELzmj7F+wpwr+ngO
         7tlrHcv/TaFtVHY5Lbv1TIFidwYw3TqN9F+AtjN0a/QxGA1v5UApEuiqz8RqLvYJ4Rbp
         F0N9Hkv/3kgpgKkVmQ23XMdWM9X1MTUWKxrBR/bfIuwkjZjGlO9NfWvMW4+pvuwxiQxi
         dJxBzmFUsmUiFMHHSzUhD40LUAHzF0ENVVJb1KONsi3mWhrhMdcMAzq7ffkuSqkNaN3b
         ihVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAibdHYmA51EnYR6874S+dG10+UN2DvbaY8MiC9FJu70imDHQrp71HeNsCOAqvZ9uvvQIe547yd48KbNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6STn23UhVBD7R9W1+E0sQyDgLhV861ypqP+zgolJ20LzI6G/b
	ku6MgPVlGrH8UVhZO4eh+060IxcTwhJ8DarkSMMmxgI7J7EAigIEBwGCYIwb4gqLmh/7gymBnkw
	/HCM9uDPLIKbf5ZyxGyumNS8SMCfjjcqUQeYN
X-Gm-Gg: ASbGncux1rkDJ3YCZPM4eaGMpY1WK9cY2N8cEsrtpQ8zKGNIerfmx/1k7xeIAWozsY0
	1SCmnGfqAJq8eB1P3bVwl4df3ObWuB3fT2+S3UKKuzQHSiEiFoevbM00cgMmo2idgQiYI2smbC7
	JtotVngNOWHnj1za1D6psIc0LxpTMNQzoZ1uH+46HTqKUGvopBtp1S1PA=
X-Google-Smtp-Source: AGHT+IFUU4yzvy+tJUcjxTcjBUFWePAje5whBo7gqMHLyMsjuVgDeBEqOGRf5+tCoh6FoJpeOfgbXCVhk4Zvschc6ao=
X-Received: by 2002:a17:903:181:b0:216:7aaa:4c5f with SMTP id
 d9443c01a7336-22e629b88a2mr2321595ad.3.1746629781200; Wed, 07 May 2025
 07:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424030033.32635-1-yan.y.zhao@intel.com> <20250424030603.329-1-yan.y.zhao@intel.com>
 <CAGtprH9_McMDepbuvWMLRvHooPdtE4RHog=Dgr_zFXT5s49nXA@mail.gmail.com>
 <aBAiCBmON0g0Qro1@yzhao56-desk.sh.intel.com> <CAGtprH_ggm8N-R9QbV1f8mo8-cQkqyEta3W=h2jry-NRD7_6OA@mail.gmail.com>
 <aBldhnTK93+eKcMq@yzhao56-desk.sh.intel.com> <CAGtprH9wi6zHJ5JeuAnjZThMAzxxibJGo=XN1G1Nx8txZRg8_w@mail.gmail.com>
 <aBmmirBzOZfmMOJj@yzhao56-desk.sh.intel.com> <CAGtprH9fDMiuk3JGSS12M-wFoqRj+sjdtEHJFS_5QfKX7aGkRQ@mail.gmail.com>
 <aBsNsZsWuVl4uo0j@yzhao56-desk.sh.intel.com>
In-Reply-To: <aBsNsZsWuVl4uo0j@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Wed, 7 May 2025 07:56:08 -0700
X-Gm-Features: ATxdqUHU0nZLAD5PmXeD87cInGxxOkrVQuKswPEoCIsWOPO_kTikScUha6SsdjY
Message-ID: <CAGtprH-+Bo4hFxL+THiMgF5V4imdVVb0OmRhx2Uc0eom9=3JPA@mail.gmail.com>
Subject: Re: [RFC PATCH 08/21] KVM: TDX: Increase/decrease folio ref for huge pages
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: pbonzini@redhat.com, seanjc@google.com, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, x86@kernel.org, rick.p.edgecombe@intel.com, 
	dave.hansen@intel.com, kirill.shutemov@intel.com, tabba@google.com, 
	ackerleytng@google.com, quic_eberman@quicinc.com, michael.roth@amd.com, 
	david@redhat.com, vbabka@suse.cz, jroedel@suse.de, thomas.lendacky@amd.com, 
	pgonda@google.com, zhiquan1.li@intel.com, fan.du@intel.com, 
	jun.miao@intel.com, ira.weiny@intel.com, isaku.yamahata@intel.com, 
	xiaoyao.li@intel.com, binbin.wu@linux.intel.com, chao.p.peng@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 12:39=E2=80=AFAM Yan Zhao <yan.y.zhao@intel.com> wro=
te:
>
> On Tue, May 06, 2025 at 06:18:55AM -0700, Vishal Annapurve wrote:
> > On Mon, May 5, 2025 at 11:07=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com>=
 wrote:
> > >
> > > On Mon, May 05, 2025 at 10:08:24PM -0700, Vishal Annapurve wrote:
> > > > On Mon, May 5, 2025 at 5:56=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.c=
om> wrote:
> > > > >
> > > > > Sorry for the late reply, I was on leave last week.
> > > > >
> > > > > On Tue, Apr 29, 2025 at 06:46:59AM -0700, Vishal Annapurve wrote:
> > > > > > On Mon, Apr 28, 2025 at 5:52=E2=80=AFPM Yan Zhao <yan.y.zhao@in=
tel.com> wrote:
> > > > > > > So, we plan to remove folio_ref_add()/folio_put_refs() in fut=
ure, only invoking
> > > > > > > folio_ref_add() in the event of a removal failure.
> > > > > >
> > > > > > In my opinion, the above scheme can be deployed with this serie=
s
> > > > > > itself. guest_memfd will not take away memory from TDX VMs with=
out an
> > > > > I initially intended to add a separate patch at the end of this s=
eries to
> > > > > implement invoking folio_ref_add() only upon a removal failure. H=
owever, I
> > > > > decided against it since it's not a must before guest_memfd suppo=
rts in-place
> > > > > conversion.
> > > > >
> > > > > We can include it in the next version If you think it's better.
> > > >
> > > > Ackerley is planning to send out a series for 1G Hugetlb support wi=
th
> > > > guest memfd soon, hopefully this week. Plus I don't see any reason =
to
> > > > hold extra refcounts in TDX stack so it would be good to clean up t=
his
> > > > logic.
> > > >
> > > > >
> > > > > > invalidation. folio_ref_add() will not work for memory not back=
ed by
> > > > > > page structs, but that problem can be solved in future possibly=
 by
> > > > > With current TDX code, all memory must be backed by a page struct=
.
> > > > > Both tdh_mem_page_add() and tdh_mem_page_aug() require a "struct =
page *" rather
> > > > > than a pfn.
> > > > >
> > > > > > notifying guest_memfd of certain ranges being in use even after
> > > > > > invalidation completes.
> > > > > A curious question:
> > > > > To support memory not backed by page structs in future, is there =
any counterpart
> > > > > to the page struct to hold ref count and map count?
> > > > >
> > > >
> > > > I imagine the needed support will match similar semantics as VM_PFN=
MAP
> > > > [1] memory. No need to maintain refcounts/map counts for such physi=
cal
> > > > memory ranges as all users will be notified when mappings are
> > > > changed/removed.
> > > So, it's possible to map such memory in both shared and private EPT
> > > simultaneously?
> >
> > No, guest_memfd will still ensure that userspace can only fault in
> > shared memory regions in order to support CoCo VM usecases.
> Before guest_memfd converts a PFN from shared to private, how does it ens=
ure
> there are no shared mappings? e.g., in [1], it uses the folio reference c=
ount
> to ensure that.
>
> Or do you believe that by eliminating the struct page, there would be no
> GUP, thereby ensuring no shared mappings by requiring all mappers to unma=
p in
> response to a guest_memfd invalidation notification?

Yes.

>
> As in Documentation/core-api/pin_user_pages.rst, long-term pinning users =
have
> no need to register mmu notifier. So why users like VFIO must register
> guest_memfd invalidation notification?

VM_PFNMAP'd memory can't be long term pinned, so users of such memory
ranges will have to adopt mechanisms to get notified. I think it would
be easy to pursue new users of guest_memfd to follow this scheme.
Irrespective of whether VM_PFNMAP'd support lands, guest_memfd
hugepage support already needs the stance of: "Guest memfd owns all
long-term refcounts on private memory" as discussed at LPC [1].

[1] https://lpc.events/event/18/contributions/1764/attachments/1409/3182/LP=
C%202024_%201G%20page%20support%20for%20guest_memfd.pdf
(slide 12)

>
> Besides, how would guest_memfd handle potential unmap failures? e.g. what
> happens to prevent converting a private PFN to shared if there are errors=
 when
> TDX unmaps a private PFN or if a device refuses to stop DMAing to a PFN.

Users will have to signal such failures via the invalidation callback
results or other appropriate mechanisms. guest_memfd can relay the
failures up the call chain to the userspace.

>
> Currently, guest_memfd can rely on page ref count to avoid re-assigning a=
 PFN
> that fails to be unmapped.
>
>
> [1] https://lore.kernel.org/all/20250328153133.3504118-5-tabba@google.com=
/
>
>
> > >
> > >
> > > > Any guest_memfd range updates will result in invalidations/updates =
of
> > > > userspace, guest, IOMMU or any other page tables referring to
> > > > guest_memfd backed pfns. This story will become clearer once the
> > > > support for PFN range allocator for backing guest_memfd starts gett=
ing
> > > > discussed.
> > > Ok. It is indeed unclear right now to support such kind of memory.
> > >
> > > Up to now, we don't anticipate TDX will allow any mapping of VM_PFNMA=
P memory
> > > into private EPT until TDX connect.
> >
> > There is a plan to use VM_PFNMAP memory for all of guest_memfd
> > shared/private ranges orthogonal to TDX connect usecase. With TDX
> > connect/Sev TIO, major difference would be that guest_memfd private
> > ranges will be mapped into IOMMU page tables.
> >
> > Irrespective of whether/when VM_PFNMAP memory support lands, there
> > have been discussions on not using page structs for private memory
> > ranges altogether [1] even with hugetlb allocator, which will simplify
> > seamless merge/split story for private hugepages to support memory
> > conversion. So I think the general direction we should head towards is
> > not relying on refcounts for guest_memfd private ranges and/or page
> > structs altogether.
> It's fine to use PFN, but I wonder if there're counterparts of struct pag=
e to
> keep all necessary info.
>

Story will become clearer once VM_PFNMAP'd memory support starts
getting discussed. In case of guest_memfd, there is flexibility to
store metadata for physical ranges within guest_memfd just like
shareability tracking.

>
> > I think the series [2] to work better with PFNMAP'd physical memory in
> > KVM is in the very right direction of not assuming page struct backed
> > memory ranges for guest_memfd as well.
> Note: Currently, VM_PFNMAP is usually used together with flag VM_IO. in K=
VM
> hva_to_pfn_remapped() only applies to "vma->vm_flags & (VM_IO | VM_PFNMAP=
)".
>
>
> > [1] https://lore.kernel.org/all/CAGtprH8akKUF=3D8+RkX_QMjp35C0bU1zxGi4v=
1Zm5AWCw=3D8V8AQ@mail.gmail.com/
> > [2] https://lore.kernel.org/linux-arm-kernel/20241010182427.1434605-1-s=
eanjc@google.com/
> >
> > > And even in that scenario, the memory is only for private MMIO, so th=
e backend
> > > driver is VFIO pci driver rather than guest_memfd.
> >
> > Not necessary. As I mentioned above guest_memfd ranges will be backed
> > by VM_PFNMAP memory.
> >
> > >
> > >
> > > > [1] https://elixir.bootlin.com/linux/v6.14.5/source/mm/memory.c#L65=
43
