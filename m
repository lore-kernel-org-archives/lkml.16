Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DE926FA70
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389484; cv=none; b=tiVBJQduVw9b1LO2I3Fw6MfXBlPkC/4t5sP08meupJLL/JNG0DHynQ0HcKIb+W1c37Y9lkyXWeGCUixSNUZdNBXvY9wE+qZ26k718NrlJU54j+PMPqDjY87SkPNglhFen2UewUMzdI5YNdzhN0YqU28CRzIc28txDBvWpz808yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389484; c=relaxed/simple;
	bh=6Qic+/KMzXTQcUJjsfNtI3eJbIyhTRTCYc9wUQJ7b0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+cuuvAWiz2NIck7PjS8eQt6glZsdiEXM9XBJ0TejFwtBKgq75Z2VzzM4ZgySO1OB+j+1wCUv5/NzHvepT9JBNZCTXVXjoeG/bdg4bgqWU60tlzlnoe7FAeRmdYGiKfqqjIaIBmcYkS82vezg3KLITZEcrel4ez8EIRP7OIcPww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a5aKyz8g; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a5aKyz8g"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a58197794eso194291cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751389481; x=1751994281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wmm+SBgWObvnarZW8fSMrMK7upMaElubl5ENC0Y8cTo=;
        b=a5aKyz8g3yvYWaJbGtMoHlBmPzL8Etihi6+mrwfaCvegjqv9TfOf4YLW3gN6RrwLVA
         RuKg8V0x1222MGiPvxokARMkxLGWPrWWF9GgbbImxeAoL5s6puLFZB7vf47VrqIIcyY0
         LJB2XfULQoh9g3vm2+QQVKVenrCiAIJr2DNsOAwvREF2aLhBx/0o4tP6/EuUXT/pJTeS
         QKY2QQtLfF/RGAzb0Ay28UdcfCoTyXgBbUKdsUshUpDQI7ozM7LjDHSJrEAFfehxqr4u
         2Bolwq8u9Hj7GizuA31xFqEtqk4+oPwcXBBusI/p0hiF/g76NCgBzfgD57G1j+iX/+jm
         D1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389481; x=1751994281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wmm+SBgWObvnarZW8fSMrMK7upMaElubl5ENC0Y8cTo=;
        b=MLbPtOTC6wqJVx8zLI/r4NEr/IQJdfaHmrniROs36gQc5+mLNCdkMHFxVVecKZMB6G
         ysckD65Fi058tRSpA8L6yo4SnBFC6DmdjFdTiBDsPozgfKi+dHdbZduDp8K0CIC1ffPz
         fB6DsT14qwVE/ez/pQpYe6b7ueunVqTfMc6imIPgp4lwP79ielPc13lF8RF+xMsCtLrm
         VVmZb/BIr5Kjb+ojs6bOvIN586c57FG/dzU9Rm/FX2yQbuPyF7N24uk3zcSeB2XF60uf
         BEUU+tfddNcChIat+OeFAFDPDuUaZwyK4lB2qu0P6vvirb79mFYSXp2WZuLXTfzDPxcS
         4Qqg==
X-Forwarded-Encrypted: i=1; AJvYcCX6aC7VVMnB8ZY1tuRYlR2p+f6t6TTJvv6XNULe2kfHvFg+w9h3p1CfUx8LghssbMIFQV/Bo32B9crV3zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsFrnuyRY9PPp6jLyWlW6LLTYX2XVcKfPX3ojTCwn4L2hW99lf
	s74pqmz8DfIwr1CUpXVmv9akd5gprF2/Y4Vcwa1eNxDrWuepH+kUb6qG9bRWDyAPmL2UPJjlE1S
	9blWBSlKX0sBPYQLcA99/ADPK4zb4vBHuV9BK4dFh
X-Gm-Gg: ASbGncuSv+VYhjG/6I/rkZz7rmYu5V44244cChs+Ken/hesfGlIywU8OrPQEyNXbVgm
	Oc6/OpOfZws4CVF1vK38/kCV6IjCYODHGlE6J61zhpRst3cMcP47v1U42fmUIyHMbZzEzbI4iR6
	uxxjUc/jhaNHgkT9fP4UVzhXwEOcxDMXEVI2BBWVLs8gvkJW4bvA2P2Mg3UVX1Su1cJJYN/qB95
	Q==
X-Google-Smtp-Source: AGHT+IE2nx1+TjsPOD4dd0RuCC9EDcfyRmIw9ZzZkLf0CkyETMBendDT5v5FRxLl4LmxKAj95iD32eLk684qZh4wTnc=
X-Received: by 2002:a05:622a:a609:b0:4a6:f9d2:b538 with SMTP id
 d75a77b69052e-4a87af83b27mr3590211cf.28.1751389480235; Tue, 01 Jul 2025
 10:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627154655.2085903-1-peterx@redhat.com> <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
In-Reply-To: <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 1 Jul 2025 10:04:28 -0700
X-Gm-Features: Ac12FXwfFgZZMGO4zvKP1fjXn5pQj6YbRBID6NH0mn3wXkQNXe7zdoAupyIKrSw
Message-ID: <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, Muchun Song <muchun.song@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	James Houghton <jthoughton@google.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Michal Hocko <mhocko@suse.com>, 
	David Hildenbrand <david@redhat.com>, Andrea Arcangeli <aarcange@redhat.com>, 
	Oscar Salvador <osalvador@suse.de>, Axel Rasmussen <axelrasmussen@google.com>, 
	Ujwal Kundur <ujwal.kundur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:16=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Jun 27, 2025 at 11:46:52AM -0400, Peter Xu wrote:
> > Introduce a generic userfaultfd API for vm_operations_struct, so that o=
ne
> > vma, especially when as a module, can support userfaults without modify=
ing
> > the core files.  More importantly, when the module can be compiled out =
of
> > the kernel.
>
> I'm not sure I understand this. One VMA 'especially when as a module'?
>
> This whole sentence is really unclear.
>
> So it seems to me that you want to be able to allow more than just:
>
> - anonymous memory
> - shmem
> - hugetlb
>
> To support userfaultfd correct?
>
> >
> > So, instead of having core mm referencing modules that may not ever exi=
st,
> > we need to have modules opt-in on core mm hooks instead.
>
> OK this sounds reasonable.
>
> >
> > After this API applied, if a module wants to support userfaultfd, the
> > module should only need to touch its own file and properly define
> > vm_uffd_ops, instead of changing anything in core mm.
>
> Yes this also sounds reasonable, _as long as_ :) the module authors are
> aware of any conditions that might exist in the VMA that might be odd or
> confusing.
>
> For instance, if locks need to be held etc.
>
> I am generally slightly wary of us giving VMAs in hooks because people do
> crazy things with them that
>
> >
> > Note that such API will not work for anonymous. Core mm will process
> > anonymous memory separately for userfault operations like before.
>
> Right.
>
> >
> > This patch only introduces the API alone so that we can start to move
> > existing users over but without breaking them.
>
> Sounds sensible.
>
> >
> > Currently the uffd_copy() API is almost designed to be the simplistic w=
ith
> > minimum mm changes to move over to the API.
>
> A good approach.
>
> >
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  include/linux/mm.h            |  9 ++++++
> >  include/linux/userfaultfd_k.h | 52 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 61 insertions(+)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index ef40f68c1183..6a5447bd43fd 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -576,6 +576,8 @@ struct vm_fault {
> >                                        */
> >  };
> >
> > +struct vm_uffd_ops;
> > +
> >  /*
> >   * These are the virtual MM functions - opening of an area, closing an=
d
> >   * unmapping it (needed to keep files on disk up-to-date etc), pointer
> > @@ -653,6 +655,13 @@ struct vm_operations_struct {
> >        */
> >       struct page *(*find_special_page)(struct vm_area_struct *vma,
> >                                         unsigned long addr);
> > +#ifdef CONFIG_USERFAULTFD
> > +     /*
> > +      * Userfaultfd related ops.  Modules need to define this to suppo=
rt
> > +      * userfaultfd.
> > +      */
> > +     const struct vm_uffd_ops *userfaultfd_ops;
> > +#endif
> >  };
>
> This shouldn't go in vm_ops like this. You're basically changing a
> fundamental convention here - that _ops structs define handlers, now you
> can have somehow nested ones?
>
> It seems more appropriate to have something like:
>
> struct vm_uffd_ops *(*get_uffd_ops)(struct vm_area_struct *vma);
>
> This then matches e.g. mempolicy's get_policy handler.
>
> >
> >  #ifdef CONFIG_NUMA_BALANCING
> > diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_=
k.h
> > index df85330bcfa6..c9a093c4502b 100644
> > --- a/include/linux/userfaultfd_k.h
> > +++ b/include/linux/userfaultfd_k.h
> > @@ -92,6 +92,58 @@ enum mfill_atomic_mode {
> >       NR_MFILL_ATOMIC_MODES,
> >  };
> >
> > +/* VMA userfaultfd operations */
>
> Are we sure this should be operating at the VMA level?
>
> I mean are the operations going to be operating on VMAs or VM fault
> structs? If not, then this surely belongs to the file operations no?
>
> > +struct vm_uffd_ops {
>
> I'd comment on the naming, but 'vm_operations_struct' is so bad that it
> seems we have no sensible convention anyway so this is fine :P
>
> > +     /**
> > +      * @uffd_features: features supported in bitmask.
> > +      *
> > +      * When the ops is defined, the driver must set non-zero features
>
> I don't think the 'when the ops are defined' bit is necessray here, you'r=
e
> commenting on the ops here, you can safely assume they're defined.
>
> So I'd just say 'must be a subset (or all) of: VM_UFFD_MISSING|WP|MINOR.'
>
> > +      * to be a subset (or all) of: VM_UFFD_MISSING|WP|MINOR.
> > +      */
> > +     unsigned long uffd_features;
> > +     /**
> > +      * @uffd_ioctls: ioctls supported in bitmask.
> > +      *
> > +      * Userfaultfd ioctls supported by the module.  Below will always
> > +      * be supported by default whenever a module provides vm_uffd_ops=
:
> > +      *
> > +      *   _UFFDIO_API, _UFFDIO_REGISTER, _UFFDIO_UNREGISTER, _UFFDIO_W=
AKE
> > +      *
> > +      * The module needs to provide all the rest optionally supported
> > +      * ioctls.  For example, when VM_UFFD_MISSING was supported,
> > +      * _UFFDIO_COPY must be supported as ioctl, while _UFFDIO_ZEROPAG=
E
> > +      * is optional.
>
> I'm not sure why we need this field? Isn't this implied by whether handle=
rs
> are set or NULL?
>
> > +      */
> > +     unsigned long uffd_ioctls;
> > +     /**
> > +      * uffd_get_folio: Handler to resolve UFFDIO_CONTINUE request.
> > +      *
> > +      * @inode: the inode for folio lookup
> > +      * @pgoff: the pgoff of the folio
> > +      * @folio: returned folio pointer
> > +      *
> > +      * Return: zero if succeeded, negative for errors.
> > +      */
> > +     int (*uffd_get_folio)(struct inode *inode, pgoff_t pgoff,
> > +                           struct folio **folio);
>
> Not sure uufd_ prefix is needed in a struct that's obviously about uffd
> already? I'd strip that.
>
> Also this name is really confusing, I think it should contain continue in
> some form, such as 'handle_continue()'?
>
> This really feels like it shouldn't be a VMA function as you're dealing
> with inode, pgoff, and folio and not VMA at all?
>
>
> > +     /**
> > +      * uffd_copy: Handler to resolve UFFDIO_COPY|ZEROPAGE request.
> > +      *
> > +      * @dst_pmd: target pmd to resolve page fault
> > +      * @dst_vma: target vma
> > +      * @dst_addr: target virtual address
> > +      * @src_addr: source address to copy from
> > +      * @flags: userfaultfd request flags
> > +      * @foliop: previously allocated folio
> > +      *
> > +      * Return: zero if succeeded, negative for errors.
>
> Can you please ensure you put details as to VMA lock state here. Uffd has
> some very tricky handling around stuff like this.
>
> > +      */
> > +     int (*uffd_copy)(pmd_t *dst_pmd, struct vm_area_struct *dst_vma,
> > +                      unsigned long dst_addr, unsigned long src_addr,
> > +                      uffd_flags_t flags, struct folio **foliop);
>
> Do we not need a uffd_ctx parameter here?
>
> It seems like we're assuming a _lot_ of mm understanding in the underlyin=
g
> driver here.
>
> I'm not sure it's really normal to be handing around page table state and
> folios etc. to a driver like this, this is really... worrying to me.
>
> This feels like you're trying to put mm functionality outside of mm?

To second that, two things stick out for me here:
1. uffd_copy and uffd_get_folio seem to be at different abstraction
levels. uffd_copy is almost the entire copy operation for VM_SHARED
VMAs while uffd_get_folio is a small part of the continue operation.
2. shmem_mfill_atomic_pte which becomes uffd_copy for shmem in the
last patch is quite a complex function which itself calls some IMO
pretty internal functions like mfill_atomic_install_pte(). Expecting
modules to implement such functionality seems like a stretch to me but
maybe this is for some specialized modules which are written by mm
experts only?

>
> What if we change how we handle page tables in future, or the locking
> changes? We might not know to go and update x, y, z driver.
>
> This is concerning.
>
> > +};
> > +typedef struct vm_uffd_ops vm_uffd_ops;
> > +
> >  #define MFILL_ATOMIC_MODE_BITS (const_ilog2(NR_MFILL_ATOMIC_MODES - 1)=
 + 1)
> >  #define MFILL_ATOMIC_BIT(nr) BIT(MFILL_ATOMIC_MODE_BITS + (nr))
> >  #define MFILL_ATOMIC_FLAG(nr) ((__force uffd_flags_t) MFILL_ATOMIC_BIT=
(nr))
> > --
> > 2.49.0
> >
