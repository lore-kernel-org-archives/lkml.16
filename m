Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C805D28B4E1
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445720; cv=none; b=Mcn3VzqWaa6Oc+9PSXgnceiVOW7jc/nZRoqtZSY5q0thiVfDT3Q6IJC/mqol4dgP3+Ygry/MVSzdm7b8dibfvnH2MXocIsk4Xjl1+nqVIZZFHiAmZbvYk6vPSji3LSmiMA5i0jRGP2fuoY+6XOfLmxALWzTL3DRZXr5lyzyMp2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445720; c=relaxed/simple;
	bh=0L9FqIrWV1HH0CKjcDoLD6PMX4MXaZyCx+Isv4wqI6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiXU4tE1qS1/jT8fTISZr6QzPU3E13HorOQmXP7lqR88mB/LqrS8njU9lrnQTonuIvpQkE6VRd0Z3hoCEMKgmAsn2+8dhTiGMoofykiX5Mv2AvXlM7pERBGPmAStQtZyny0PmMlRdMZrGGBGmr0qAnsKTjNRJvzfCf9P0EFlRpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q7y8oo1+; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q7y8oo1+"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e7b3410e122so3676637276.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748445718; x=1749050518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32qgoYfovQ3gS/SAum8cU1W1nbKSlw2h8oFp1ZvYf5Q=;
        b=Q7y8oo1+2gzsQIi+PeqDcDAEwLJqN+KmeSdhlEh3Oi3GxiDgf1I5sJWOXGjVsF0iI3
         WvpuGJEz4EZwmJw7SAASjvpWF6xX9GVTVmSwI9JV+vJP0K9hxQ0RQZI941LbvGj9MVj9
         bJRxr3We937W2p75QhjIWt9fa1Hp9fqxL3XM5E5y7qLDKTa0jzbIq4itUfFTgLtNIedm
         j5L9ZtOAvfdeecYg2YWAvMxTNR4pDzqKtSNpAPWMiZ1IPBBkAtmw8bbXpWrGLvtrBCwA
         pjsZGKulykcsqmcS+pAF85LYpXUB86JQQ1JasA17T1omW96W4pdyjy/raBYdRZBZFRwv
         l/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445718; x=1749050518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32qgoYfovQ3gS/SAum8cU1W1nbKSlw2h8oFp1ZvYf5Q=;
        b=ngJqK+WrcdrkV3ksK7H56jGGmWGAeIehyuV+Cy+SzKhxpvO3Hu5jWlT3j+euelIULt
         h1BUJ+Klmd0Z61vrSJvLoZvEHoG2t6+nOXbJ4idXlej033KSQjVmk/uDuMYiF3cCcDC8
         p1CwbQtg2kO85seKZdbzrGXZbEYyZnVOGGTQHQ/n0guAW3cehDm+u/+mpGJp0TtvLHQr
         gXBW5Xu4Sb6uyQh0S3nP/c+I8S0++KKdJaPlIRdrgOuSzExaCFslUhxpCk/IHJQZ5ags
         IlS1zZflp0i/Te4tPcDzLiGqe/eGq+F4BBHUqi+j8tyVBOnoyzNlGdghf74NEgcqFTs/
         +a4w==
X-Forwarded-Encrypted: i=1; AJvYcCVogqyOdxYcJgZV3khcK1pWQ3M8NJ+L3kRD8oJ4+cY0LbAxi6pMtnyPHeD0O7f4EJaNWJpwFlXOnwtIhx0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmb1Y1g+l+WIqbVyND/Q0o61lBf/qaQmlyYvOSMpWL8bBNiHu0
	lO1BxL+qldcS+pGyd9PKxbPouFZUj4Q5nr0kyfjIx6Lo//EdMRYnLvNBj4Dd07ZXHKJIu/v/nXx
	cjw3HTFBTCUq1bVGeDjGYTvlPr6yUQE/pzxLVNwOE
X-Gm-Gg: ASbGncv0/tuCt5JptoO/gvMywKQEO/VCtUl26gfV3BR9AcRr2QS/dzonSQMtCrVmxXv
	nwyhCWYb2BxVqKBRE87B1F8rAR/MhrmUrHx5+abl2GpTXL0OXpE+6rqQEO4KRFQr3nvxq7m3cDv
	57B/sOnVLUa0FAvbeVk4y9RgDmB3ab2gvwtp2NXHvciPRdhb0gK0IojL1rDPujxdh2YiYap6l7F
	d4MFw==
X-Google-Smtp-Source: AGHT+IFSzzwtG0QBLjREdP8rJp3MI7Sye8YaM/FgQl/WLbT3PKgJS/6Q9/qQMcY7F2ocTfZADqMYbCZWjE0ffy1ogQw=
X-Received: by 2002:a05:6902:2b0c:b0:e78:f7a0:fd02 with SMTP id
 3f1490d57ef6-e7f61839725mr2840203276.37.1748445717406; Wed, 28 May 2025
 08:21:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-2-jthoughton@google.com> <aBqi7fDtnvxzxV1V@google.com>
In-Reply-To: <aBqi7fDtnvxzxV1V@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 28 May 2025 11:21:21 -0400
X-Gm-Features: AX0GCFti85Bmslv3UKy35YTx4AbsV0M4oMVo9TuLb01TfEKfWoCE-rNdRG1Yeks
Message-ID: <CADrL8HUMm0PUqx-xNdPvSMP6z4gzs2OTUJG1sdyy88D-XWxT3g@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] KVM: Add KVM_MEM_USERFAULT memslot flag and bitmap
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 8:01=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Jan 09, 2025, James Houghton wrote:
> > Use one of the 14 reserved u64s in struct kvm_userspace_memory_region2
> > for the user to provide `userfault_bitmap`.
> >
> > The memslot flag indicates if KVM should be reading from the
> > `userfault_bitmap` field from the memslot. The user is permitted to
> > provide a bogus pointer. If the pointer cannot be read from, we will
> > return -EFAULT (with no other information) back to the user.
>
> For the uAPI+infrastructure changelog, please elaborate on the design goa=
ls and
> choices.  The "what" is pretty obvious from the patch; describe why this =
is being
> added.
>
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> >  include/linux/kvm_host.h | 14 ++++++++++++++
> >  include/uapi/linux/kvm.h |  4 +++-
> >  virt/kvm/Kconfig         |  3 +++
> >  virt/kvm/kvm_main.c      | 35 +++++++++++++++++++++++++++++++++++
> >  4 files changed, 55 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 401439bb21e3..f7a3dfd5e224 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -590,6 +590,7 @@ struct kvm_memory_slot {
> >       unsigned long *dirty_bitmap;
> >       struct kvm_arch_memory_slot arch;
> >       unsigned long userspace_addr;
> > +     unsigned long __user *userfault_bitmap;
> >       u32 flags;
> >       short id;
> >       u16 as_id;
> > @@ -724,6 +725,11 @@ static inline bool kvm_arch_has_readonly_mem(struc=
t kvm *kvm)
> >  }
> >  #endif
> >
> > +static inline bool kvm_has_userfault(struct kvm *kvm)
> > +{
> > +     return IS_ENABLED(CONFIG_HAVE_KVM_USERFAULT);
> > +}
>
> Eh, don't think we need this wrapper.  Just check the CONFIG_xxx manually=
 in the
> one or two places where code isn't guarded by an #ifdef.
>
> >  struct kvm_memslots {
> >       u64 generation;
> >       atomic_long_t last_used_slot;
> > @@ -2553,4 +2559,12 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_v=
cpu *vcpu,
> >                                   struct kvm_pre_fault_memory *range);
> >  #endif
> >
> > +int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot=
,
> > +                   gfn_t gfn);
> > +
> > +static inline bool kvm_memslot_userfault(struct kvm_memory_slot *memsl=
ot)
>
> I strongly prefer kvm_is_userfault_memslot().  KVM's weird kvm_memslot_<f=
lag>()
> nomenclature comes from ancient code, i.e. isn't something I would follow=
.
>
> > +{
> > +     return memslot->flags & KVM_MEM_USERFAULT;
>
> I think it's worth checking for a non-NULL memslot, even if all current c=
allers
> pre-check for a slot.
>
> > @@ -2042,6 +2051,9 @@ int __kvm_set_memory_region(struct kvm *kvm,
> >               if (r)
> >                       goto out;
> >       }
> > +     if (mem->flags & KVM_MEM_USERFAULT)
> > +             new->userfault_bitmap =3D
> > +               (unsigned long __user *)(unsigned long)mem->userfault_b=
itmap;
>
>         if (mem->flags & KVM_MEM_USERFAULT)
>                 new->userfault_bitmap =3D u64_to_user_ptr(mem->userfault_=
bitmap);

Applied this change to the other cast (where we do access_ok()) as well, th=
anks!

>
> >       r =3D kvm_set_memslot(kvm, old, new, change);
> >       if (r)
> > @@ -6426,3 +6438,26 @@ void kvm_exit(void)
> >       kvm_irqfd_exit();
> >  }
> >  EXPORT_SYMBOL_GPL(kvm_exit);
> > +
> > +int kvm_gfn_userfault(struct kvm *kvm, struct kvm_memory_slot *memslot=
,
> > +                    gfn_t gfn)
>
> I think this series is the perfect opportunity (read: victim) to introduc=
e a
> common "struct kvm_page_fault".  With a common structure to provide the g=
fn, slot,
> write, exec, and is_private fields, this helper can handle the checks and=
 the call
> to kvm_prepare_memory_fault_exit().
>
> And with that in place, I would vote to name this something like kvm_do_u=
serfault(),
> return a boolean, and let the caller return -EFAULT.

Returning 'true' from kvm_do_userfault() without a
kvm_prepare_memory_fault_exit() looked a bit strange at first, but I
don't have strong feelings. I'll add a small comment there.

>
> For making "struct kvm_page_fault" common, one thought would be to have a=
rch code
> define the entire struct, and simply assert on the few fields that common=
 KVM needs
> being defined by arch code.  And wrap all references in CONFIG_KVM_GENERI=
C_PAGE_FAULT.
>
> I don't expect there will be a huge number of fields that common KVM need=
s, i.e. I
> don't think the maintenance burden of punting to arch code will be high. =
 And letting
> arch code own the entire struct means we don't need to have e.g. fault->a=
rch.present
> vs. fault->write in KVM x86, which to me is a big net negative for readab=
ility.
>
> I'll respond to the cover letter with an attachment of seven patches to s=
ketch out
> the idea.

Looks great! Thanks very much!

>
> > +{
> > +     unsigned long bitmap_chunk =3D 0;
> > +     off_t offset;
> > +
> > +     if (!kvm_memslot_userfault(memslot))
> > +             return 0;
> > +
> > +     if (WARN_ON_ONCE(!memslot->userfault_bitmap))
> > +             return 0;
>
> '0' is technically a valid userspace address.  I'd just drop this.  If we=
 have a
> KVM bug that results in failure to generate usefaults, we'll notice quite=
 quickly.
>
> > +
> > +     offset =3D gfn - memslot->base_gfn;
> > +
> > +     if (copy_from_user(&bitmap_chunk,
> > +                        memslot->userfault_bitmap + offset / BITS_PER_=
LONG,
> > +                        sizeof(bitmap_chunk)))
>
> Since the address is checked during memslot creation, I'm pretty sure thi=
s can
> use __get_user().  At the very least, it should be get_user().

Thanks! I agree, __get_user() should be fine.

>
> > +             return -EFAULT;
> > +
> > +     /* Set in the bitmap means that the gfn is userfault */
> > +     return !!(bitmap_chunk & (1ul << (offset % BITS_PER_LONG)));
>
> test_bit()?

Thanks for all the feedback and applying it for me in those patches
you sent back. :)
