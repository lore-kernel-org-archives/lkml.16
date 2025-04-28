Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B650296159
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745866934; cv=none; b=I8xLssO3D3pEQ3AkHAbXRJazL4Lyy7tK+i+ZL3iG3fL2CeG5FkHea4znzYyoXHUBMvHLhK56JrhHa/EFRnhu+jn4FNtM01jplSsENant+2ZeEgFrjRuEXE19IDjhVSPC1pvBAjntOiQ/ALbYHGSrMZu2d5HyCi7c239dBJzToYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745866934; c=relaxed/simple;
	bh=dPbGPFboill6iT76EBtr4PZn6lvH5BMhMgDL2shmMZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcGi9hRe4X2CTRNHO3HcqVdhDakv9B3uVTwzwUZhWGgz0iMesDcFGNpZYdPDJdwXt1ofPl4N0b79FD+4/brl1/EgSDx8FKxjrtn8OShqqD5lbLtig9hndnI5tKtIpV/nf8sCt8+56IszVg9Ie/CxODMKGwKHqux27qnmYaSPTdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iQuiPrLy; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iQuiPrLy"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2242ac37caeso23285ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745866932; x=1746471732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0d6vKqkeMQuJL7A/bSp8ZFP6OrnkpLdgBb2QvNCbFNU=;
        b=iQuiPrLyQzMczzwkfGmQLBxtixjLOSO60zomBAo3cMFOsYCE41n7K6w6BPAce4HVCy
         fOuSoCs9U1wkhZv7qSaW/AFiiJhNh9cimvtaHIZl8k0+qkWFiGyWPjFBY4yn7TnGR+Kw
         grmEA62eDz5ttqA9WgxqZ1WDP6zwdOiBNpHaxjIt/PTtID/oEcnzAvAoK7eTkVW+PJyn
         DJD/x3SWCu/atUoh4ITJjdkMnnYVt/mJ+ZsIG374vsm2GnF/bzIap0DQmOVKbvFs5daQ
         +mr+QJk1LTuVQm9teLn4N5sNTWL+P29YiXmczoguTi5axlJhyWMsxj6egiuxezujIVUu
         XohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745866932; x=1746471732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0d6vKqkeMQuJL7A/bSp8ZFP6OrnkpLdgBb2QvNCbFNU=;
        b=xPDB+038dyZCwfqXBLkkQtY8SpCW0eM03ZW7v9SSBHvUI2LeTSZgjbwmhy2cc6x0Ag
         4Hj0hht/Ha2VwZLPC4x6aTBF05ri3accNP1VnEtg4fHaV/iZxY+Z5u9seQy0vKbdHnLn
         WjjsMDbj/+E5htyo1B85l6DCtjA6Tr/AkYtpTxdXgR9FmRc8RJ0d0QxbQcUFriNKl0/x
         VW0WZyqCx/HDOXon05E2ox9gZKi08L5Ph041E6rb9B2WHgZp4k52R/NDfi6b4xWV7K6O
         yy8hfBOx4+mEwYLgkrYiiYyJJ0Vu7p5Ga64umi27HG6iLCfL8Wxh09I4qEfhuLJFOQa1
         C2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrwIxSiba/zV9IhSfZzuMaGIpslzeSGbydp6h0TB7FnKoDDfcORA1ckIhD/2bhEl9xCF5QCBVITbxJbTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB5mrRAAIxrVAoSXxu3CC03qcG8b2tDcVJJ/w6im0iM2A49uM4
	wL6BOlRitji1msBwHaQrgpCRZlrjbtjjnUAi+x+xraMuYEtgGm3DsVOpf+NipBJGPDiJDaXGpdl
	WX919E+TdzXxMEx/J8Bmoo7RJFuMM9egzCWR9
X-Gm-Gg: ASbGncsWFG5o2MIG+iQNUB+9wFKUs9kApeAxu59o05etLvy2+1ag+zbCbW6/h1ijaib
	WdYsBl9WIwdts2moaySoySAQ/P562Lpc5Dfray7VU/5FGDBwr4RF1AvfRPYRbpvFmkC2y2QbNMU
	yLrYo5/gXd189eTocKwUtytLYxAQaHDKH/0K3Pl8bm02GjDMRsguNsoM/enCs56Us=
X-Google-Smtp-Source: AGHT+IGHVt/gKeNNEkBuiDZ/WNCdhRReTsGIQqOMd5cCX92xfcbOewQ1LqrEb8wI4CAhtx4rSrkAMWhGeINdBb7YCZY=
X-Received: by 2002:a17:902:f54c:b0:215:65f3:27ef with SMTP id
 d9443c01a7336-22de6c47e20mr422765ad.12.1745866932074; Mon, 28 Apr 2025
 12:02:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z+6AGxEvBRFkN5mN@yzhao56-desk.sh.intel.com> <diqzh62ezgdh.fsf@ackerleytng-ctop.c.googlers.com>
 <aAmPQssuN9Zba//b@yzhao56-desk.sh.intel.com> <aAm9OHGt6Ag7ztqs@yzhao56-desk.sh.intel.com>
 <c4dae65f-b5e6-44fa-b5ab-8614f1d47cb5@intel.com> <aAnytM/E6sIdvKNq@yzhao56-desk.sh.intel.com>
 <CAGtprH-Ana5A2hz_D+CQ0NYRVxfpR6e0Sojssym-UtUnYpOPqg@mail.gmail.com>
 <diqz7c39zas0.fsf@ackerleytng-ctop.c.googlers.com> <aAsJZuLjOAYriz8v@yzhao56-desk.sh.intel.com>
 <diqzwmb7yi67.fsf@ackerleytng-ctop.c.googlers.com> <aA7UXI0NB7oQQrL2@yzhao56-desk.sh.intel.com>
In-Reply-To: <aA7UXI0NB7oQQrL2@yzhao56-desk.sh.intel.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 28 Apr 2025 12:02:00 -0700
X-Gm-Features: ATxdqUFfs0t7N5eWmI-1jNaKWhFko9iPatrQfOG5_SqVZrK0K5YoR1PgPQdgCTU
Message-ID: <CAGtprH8o=vE+_4maevXmFv4REg2+Ls-kKK8i0vjc7D6OYDCRkw@mail.gmail.com>
Subject: Re: [RFC PATCH 39/39] KVM: guest_memfd: Dynamically split/reconstruct
 HugeTLB page
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Chenyi Qiang <chenyi.qiang@intel.com>, tabba@google.com, 
	quic_eberman@quicinc.com, roypat@amazon.co.uk, jgg@nvidia.com, 
	peterx@redhat.com, david@redhat.com, rientjes@google.com, fvdl@google.com, 
	jthoughton@google.com, seanjc@google.com, pbonzini@redhat.com, 
	zhiquan1.li@intel.com, fan.du@intel.com, jun.miao@intel.com, 
	isaku.yamahata@intel.com, muchun.song@linux.dev, erdemaktas@google.com, 
	qperret@google.com, jhubbard@nvidia.com, willy@infradead.org, 
	shuah@kernel.org, brauner@kernel.org, bfoster@redhat.com, 
	kent.overstreet@linux.dev, pvorel@suse.cz, rppt@kernel.org, 
	richard.weiyang@gmail.com, anup@brainfault.org, haibo1.xu@intel.com, 
	ajones@ventanamicro.com, vkuznets@redhat.com, maciej.wieczor-retman@intel.com, 
	pgonda@google.com, oliver.upton@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 6:08=E2=80=AFPM Yan Zhao <yan.y.zhao@intel.com> wro=
te:
>
> On Fri, Apr 25, 2025 at 03:45:20PM -0700, Ackerley Tng wrote:
> > Yan Zhao <yan.y.zhao@intel.com> writes:
> > ...
> > >
> > > For some memory region, e.g., "pc.ram", it's divided into 2 parts:
> > > - one with offset 0, size 0x80000000(2G),
> > >   positioned at GPA 0, which is below GPA 4G;
> > > - one with offset 0x80000000(2G), size 0x80000000(2G),
> > >   positioned at GPA 0x100000000(4G), which is above GPA 4G.
> > >
> > > For the second part, its slot->base_gfn is 0x100000000, while slot->g=
mem.pgoff
> > > is 0x80000000.
> > >
> >
> > Nope I don't mean to enforce that they are equal, we just need the
> > offsets within the page to be equal.
> >
> > I edited Vishal's code snippet, perhaps it would help explain better:
> >
> > page_size is the size of the hugepage, so in our example,
> >
> >   page_size =3D SZ_2M;
> >   page_mask =3D ~(page_size - 1);
> page_mask =3D page_size - 1  ?
>
> >   offset_within_page =3D slot->gmem.pgoff & page_mask;
> >   gfn_within_page =3D (slot->base_gfn << PAGE_SHIFT) & page_mask;
> >
> > We will enforce that
> >
> >   offset_within_page =3D=3D gfn_within_page;
> For "pc.ram", if it has 2.5G below 4G, it would be configured as follows
> - slot 1: slot->gmem.pgoff=3D0, base GPA 0, size=3D2.5G
> - slot 2: slot->gmem.pgoff=3D2.5G, base GPA 4G, size=3D1.5G
>
> When binding these two slots to the same guest_memfd created with flag
> KVM_GUEST_MEMFD_HUGE_1GB:
> - binding the 1st slot will succeed;
> - binding the 2nd slot will fail.
>
> What options does userspace have in this scenario?

Userspace can create new gmem files that have aligned offsets. But I
see your point, enforcing alignment at binding time will lead to
wastage of memory. i.e. Your example above could be reworked to have:
- slot 1: slot->gmem.pgoff=3D0, base GPA 0, size=3D2.5G, gmem_fd =3D x, gme=
m_size =3D 3G
- slot 2: slot->gmem.pgoff=3D0, base GPA 4G, size=3D1.5G, gmem_fd =3D y,
gmem_size =3D 2G

This will waste 1G of memory as gmem files will have to be hugepage aligned=
.

> It can't reduce the flag to KVM_GUEST_MEMFD_HUGE_2MB. Adjusting the gmem.=
pgoff
> isn't ideal either.
>
> What about something similar as below?
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index d2feacd14786..87c33704a748 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -1842,8 +1842,16 @@ __kvm_gmem_get_pfn(struct file *file, struct kvm_m=
emory_slot *slot,
>         }
>
>         *pfn =3D folio_file_pfn(folio, index);
> -       if (max_order)
> -               *max_order =3D folio_order(folio);
> +       if (max_order) {
> +               int order;
> +
> +               order =3D folio_order(folio);
> +
> +               while (order > 0 && ((slot->base_gfn ^ slot->gmem.pgoff) =
& ((1 << order) - 1)))

This sounds better. Userspace will need to avoid this in general or
keep such ranges short so that most of the guest memory ranges can be
mapped at hugepage granularity. So maybe a pr_warn could be spewed
during binding that the alignment is not optimal.

> +                       order--;
> +
> +               *max_order =3D order;
> +       }
>
>         *is_prepared =3D folio_test_uptodate(folio);
>         return folio;
>
>
> > >> Adding checks at binding time will allow hugepage-unaligned offsets =
(to
> > >> be at parity with non-guest_memfd backing memory) but still fix this
> > >> issue.
> > >>
> > >> lpage_info will make sure that ranges near the bounds will be
> > >> fragmented, but the hugepages in the middle will still be mappable a=
s
> > >> hugepages.
> > >>
> > >> [1] https://lpc.events/event/18/contributions/1764/attachments/1409/=
3706/binding-must-have-same-alignment.svg
