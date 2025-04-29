Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3280518991E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934433; cv=none; b=Fpykq/gxLwS0oNwjb39MVY5IiEfFynNgghfrr9HU9MiZO9Q5DoY/dXym+18F5lT/p3q20up+x4X2BkjuGaQPSe/3Yys7QwpykIghrP2dYWPi8pwj7ljuIbflSA9uES27WOTWj6JcaVXazKwaZ7VJln88a4UaVtWPfMa5H12p+tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934433; c=relaxed/simple;
	bh=3TCRetitTdM6SSQpsZgJ3TdWcPHGJs/fr3ZwFvLIjFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5srhURrKrePU1i3nAGpA1SwFZpzC8jYTMh40RSZ+mWF3L7rNk/OtO0haod2IHcIj8UeWRBDx8wgIjqg+U+m6NZb0sgmbY0PJwrvkZT+EMgJqvCK4hKxqRzcPciltme23ck0rURnxMWzEXp/M8/UjClQ46PSUrnCC+zrdJw9Eio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PL9DJazo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PL9DJazo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2264c9d0295so129765ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745934431; x=1746539231; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fA3w93Erda+XJOmk0sPyV8UgKCS7MreAykhsx06cpPE=;
        b=PL9DJazoZh4xuZPPJT7/smED/Mk5jDhofOCjsqL3otSA+pHAWXgW0xFWEJl4rBR/WV
         sDOemClXrlF5y19gnR0KaPJjCCj7Ivfr2Wi3m4u5EKPj8PFklR9s7rTa2nRibFpAZ1qQ
         UgZPAVSTP20BePW602wSaZDNskgylysCALMVmwWm0zCZtpKYHO45ovWvL5Me1KAoTmpR
         tRj/KTdhapbMc4GgGzSooVjLbcbKrlkaIzxCoJ8+k+G1vmNEwQPlNXhZUoPSzoajum0J
         8vIcJJrDsjnRHwopKnuq9a9c2AbQr/csfW1m9gKVfHpgXtaLL9QTZ/HCEQkrcA8426AF
         ArRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934431; x=1746539231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fA3w93Erda+XJOmk0sPyV8UgKCS7MreAykhsx06cpPE=;
        b=YFsgIiO1xbjDy1Fa2g+elJAEsXbt2ip2Iwuisao9U0sDgJYfg/EOK8EBbqCW4JThGS
         dzIbiUQ5sEG9e/m7XF0go5Z11S2unbrx+04mwejuOwjmE5P2Xrl+7qbk0Dxpsin/8xzL
         8yBRNnwOdUZmqz8RRTok/uauE1SvmizbwDq1lcjmEYwzyIGPP3H1eOC6Hbe+n+FxZAkd
         g8l8tQlU3y4Sia9BC493WaNxeNJ7p5EHJF4EalAC+4iw0r3+3gs9vM9P2fiClFM4qGjy
         yvsNjPJxf/px/PbM+aa2pfATODy53/qX9MowVJcBbtL2IanI6QtvAlmlWDMklOa9CC31
         wzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn0u60BodcaeLb0re9HvacwiFbMhI10ArMFCcb91dzRVMIcT4TOYDS4fMhezIzWM6vPM4l6TlTdPwuskY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxt1c6gFffPPi5aSDOT+u1Ow/MZDdahHA8Zxak6vAT0Cf+xUu4
	7vQkzCQcSs6QR1/ExEJm4+uvSyD5xtn2aB4eie9V3puWZIZLuAGtiqsCIJ3zbNNHwkUuDj96HBi
	+bpbxP3q4PHvx+HOuBXY1T59L766DedZ9w46K
X-Gm-Gg: ASbGnctThoZNVVmvowqCWqlpe1a5VDcL8/9zbfqq6/Ke3fmnicnQo+nDWVZ5D/xL0Lf
	jzCnrIzrX+wgQ6DD/5QGz1lcsJkxgslmU7jDdlgv+ZXO+C333N3yRz2kLsxfUl6NW/rD/jcO3Mb
	ArN2lw0hzzsBW5TV9EXiDZMXvAb6X3D8yxviRHqVE4hITEB6I0JYL23/g=
X-Google-Smtp-Source: AGHT+IHiMZNgIIdFnVgiIRJi0fXdR+Bv4W8fc74XvKYOI8OTbqfcUV1Y9n5UrnWf3AkgyV8Qy8gzTEq4mN0fQJbvYRI=
X-Received: by 2002:a17:902:d490:b0:220:c905:689f with SMTP id
 d9443c01a7336-22de860f65amr2515515ad.25.1745934431074; Tue, 29 Apr 2025
 06:47:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250424030033.32635-1-yan.y.zhao@intel.com> <20250424030603.329-1-yan.y.zhao@intel.com>
 <CAGtprH9_McMDepbuvWMLRvHooPdtE4RHog=Dgr_zFXT5s49nXA@mail.gmail.com> <aBAiCBmON0g0Qro1@yzhao56-desk.sh.intel.com>
In-Reply-To: <aBAiCBmON0g0Qro1@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 29 Apr 2025 06:46:59 -0700
X-Gm-Features: ATxdqUEkaLaVII63hnsleMg67sq1kpfI2Fv8JpVpN0768laW2G7meeI9SsffK_s
Message-ID: <CAGtprH_ggm8N-R9QbV1f8mo8-cQkqyEta3W=h2jry-NRD7_6OA@mail.gmail.com>
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

On Mon, Apr 28, 2025 at 5:52=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wro=
te:
>
> On Mon, Apr 28, 2025 at 05:17:16PM -0700, Vishal Annapurve wrote:
> > On Wed, Apr 23, 2025 at 8:07=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com>=
 wrote:
> > >
> > > Increase folio ref count before mapping a private page, and decrease
> > > folio ref count after a mapping failure or successfully removing a pr=
ivate
> > > page.
> > >
> > > The folio ref count to inc/dec corresponds to the mapping/unmapping l=
evel,
> > > ensuring the folio ref count remains balanced after entry splitting o=
r
> > > merging.
> > >
> > > Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> > > Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> > > Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> > > ---
> > >  arch/x86/kvm/vmx/tdx.c | 19 ++++++++++---------
> > >  1 file changed, 10 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > > index 355b21fc169f..e23dce59fc72 100644
> > > --- a/arch/x86/kvm/vmx/tdx.c
> > > +++ b/arch/x86/kvm/vmx/tdx.c
> > > @@ -1501,9 +1501,9 @@ void tdx_load_mmu_pgd(struct kvm_vcpu *vcpu, hp=
a_t root_hpa, int pgd_level)
> > >         td_vmcs_write64(to_tdx(vcpu), SHARED_EPT_POINTER, root_hpa);
> > >  }
> > >
> > > -static void tdx_unpin(struct kvm *kvm, struct page *page)
> > > +static void tdx_unpin(struct kvm *kvm, struct page *page, int level)
> > >  {
> > > -       put_page(page);
> > > +       folio_put_refs(page_folio(page), KVM_PAGES_PER_HPAGE(level));
> > >  }
> > >
> > >  static int tdx_mem_page_aug(struct kvm *kvm, gfn_t gfn,
> > > @@ -1517,13 +1517,13 @@ static int tdx_mem_page_aug(struct kvm *kvm, =
gfn_t gfn,
> > >
> > >         err =3D tdh_mem_page_aug(&kvm_tdx->td, gpa, tdx_level, page, =
&entry, &level_state);
> > >         if (unlikely(tdx_operand_busy(err))) {
> > > -               tdx_unpin(kvm, page);
> > > +               tdx_unpin(kvm, page, level);
> > >                 return -EBUSY;
> > >         }
> > >
> > >         if (KVM_BUG_ON(err, kvm)) {
> > >                 pr_tdx_error_2(TDH_MEM_PAGE_AUG, err, entry, level_st=
ate);
> > > -               tdx_unpin(kvm, page);
> > > +               tdx_unpin(kvm, page, level);
> > >                 return -EIO;
> > >         }
> > >
> > > @@ -1570,10 +1570,11 @@ int tdx_sept_set_private_spte(struct kvm *kvm=
, gfn_t gfn,
> > >          * a_ops->migrate_folio (yet), no callback is triggered for K=
VM on page
> > >          * migration.  Until guest_memfd supports page migration, pre=
vent page
> > >          * migration.
> > > -        * TODO: Once guest_memfd introduces callback on page migrati=
on,
> > > -        * implement it and remove get_page/put_page().
> > > +        * TODO: To support in-place-conversion in gmem in futre, rem=
ove
> > > +        * folio_ref_add()/folio_put_refs().
> >
> > With necessary infrastructure in guest_memfd [1] to prevent page
> > migration, is it necessary to acquire extra folio refcounts? If not,
> > why not just cleanup this logic now?
> Though the old comment says acquiring the lock is for page migration, the=
 other
> reason is to prevent the folio from being returned to the OS until it has=
 been
> successfully removed from TDX.
>
> If there's an error during the removal or reclaiming of a folio from TDX,=
 such
> as a failure in tdh_mem_page_remove()/tdh_phymem_page_wbinvd_hkid() or
> tdh_phymem_page_reclaim(), it is important to hold the page refcount with=
in TDX.
>
> So, we plan to remove folio_ref_add()/folio_put_refs() in future, only in=
voking
> folio_ref_add() in the event of a removal failure.

In my opinion, the above scheme can be deployed with this series
itself. guest_memfd will not take away memory from TDX VMs without an
invalidation. folio_ref_add() will not work for memory not backed by
page structs, but that problem can be solved in future possibly by
notifying guest_memfd of certain ranges being in use even after
invalidation completes.


>
> > [1] https://git.kernel.org/pub/scm/virt/kvm/kvm.git/tree/virt/kvm/guest=
_memfd.c?h=3Dkvm-coco-queue#n441
> >
> > > Only increase the folio ref count
> > > +        * when there're errors during removing private pages.
> > >          */
> > > -       get_page(page);
> > > +       folio_ref_add(page_folio(page), KVM_PAGES_PER_HPAGE(level));
> > >
> > >         /*
> > >          * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matc=
hing
> > > @@ -1647,7 +1648,7 @@ static int tdx_sept_drop_private_spte(struct kv=
m *kvm, gfn_t gfn,
> > >                 return -EIO;
> > >
> > >         tdx_clear_page(page, level);
> > > -       tdx_unpin(kvm, page);
> > > +       tdx_unpin(kvm, page, level);
> > >         return 0;
> > >  }
> > >
> > > @@ -1727,7 +1728,7 @@ static int tdx_sept_zap_private_spte(struct kvm=
 *kvm, gfn_t gfn,
> > >         if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, le=
vel) &&
> > >             !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))=
 {
> > >                 atomic64_dec(&kvm_tdx->nr_premapped);
> > > -               tdx_unpin(kvm, page);
> > > +               tdx_unpin(kvm, page, level);
> > >                 return 0;
> > >         }
> > >
> > > --
> > > 2.43.2
> > >
