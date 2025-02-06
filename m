Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DB813AD22
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811033; cv=none; b=sBEJsV5U8ypKy2EPhAcHsa4NrPoGjhCOenZhQD/+OLARs5t9lfrCXayB9nO/7yBvxgLrm3Xgv5YB9VpnuSsTBgaAp1F14LROLQ0mpLVYofl+Kskov+uGxzWwl8aQE5FtdW0OEEhSyUZODOQ3vQYMgbnW6c3vR2bZqhI71gWZD0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811033; c=relaxed/simple;
	bh=uWYCf3pwgrm6Qnxlc8KhlGf+nYQNgw4hfAGDDjyIZYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFn+GPhVKr7hkp7ucxnuJZM7K431dan4mRJyFTW5U+mtaHKLN6x6PuBl6NPkxRcVRXzZCg25yJ6sM1GTao4drJC9rUE+L0Pgj1VEKIxOEg438l0/gCe6Tq5lXtpO633bwZTLPrYYpngTCiok7MgtrhOUcrBcKa1ni2wO44Xv2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=chaQladH; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="chaQladH"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4678c9310afso61701cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738811030; x=1739415830; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqtRnsVhyH+vzmD6JdDF4krTMwhYQH59/osiMu3zvUs=;
        b=chaQladHGCcYj2RMDa6LL7tC2AUO52WkUl9mNV49ZXhqIMIx5S7MzK+p1VxzwZm8ZX
         6P8K04OSnFUI8humK9BStk7GyVgZEQry9S47UEl04oTIPseoeyYcnJFN84Yk6eT1at4D
         gcXra7ZwVZzbKnG2PIFbRn2moPnyxLaDFfLtFMdLNJKEx7UJ+CGaEN5k/Amh3I9sCp+I
         j4EBEaYUgISt/bHr2w2wbaSxB2QTGUCQ2GcqK0UXvTmPKuVTUddlOL4I8RhtzZAfluq6
         3eRZURGT47V7ryLAgG2PjzUE3nhxrn9bvHQedVKe1/DE8L2WeEqSQApAkQ94NEdCtfH6
         44Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811030; x=1739415830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqtRnsVhyH+vzmD6JdDF4krTMwhYQH59/osiMu3zvUs=;
        b=kGOiH3y13FYulvUZ4OF50q3xU86pU9fbrku5uug9iJAcr5bTUPlbh1wXGSAnlYXCi3
         Dp645404hsgvBOJN1jcAy3MpgSZ0ZqF5NDPd3iK83s6D6W8qrb7waKqvznYVTiEAiZvo
         A4vF9p49aNFep+a5u8AxQOOtNReepOPc9AeFinp9lMA04m3vVM6CYk4GtkTris/o8FBA
         Oiz8HP4BeVIUUbmqjG4RvwadmM+MoLyPqnq7lrGE+6S+H45RUvKmcDTebwzWXSuuQt1S
         RMexXq4UQlsu23MJk7eaMh/CWeYsJf+wIoZqnUBxRiPS51MNxuHLCUelMGr9GnDwpOZR
         mzUg==
X-Forwarded-Encrypted: i=1; AJvYcCVXapnZpkWARYqoYVcsLkq0vWlhpe4mMQjCRTHIXbsitEK7IHx4fi1Sq2n4gHIMXQBvGuw4s5f1GkjC+pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQJx608a/TPs80G8PKvAjokIm00GUtTC5+ArzuxCCsolMt/Ik
	KFcwPU+kzGPmTA+sRvYadiE0FwfjLu3sgBmWs4mPalMiQ3Ot1AZ3vAMS9Dz3JHQgwYXsYN3Dmhu
	T8QxsO6vq/9Gwvc7UTT/rEfdnU93u2cjClcbm
X-Gm-Gg: ASbGncvcvjqqCx1zjpX4Gncf+iQNb+xduDRKm4VQQEsfcuxYdeMQ3cxeZf03hBHQJ9o
	fUuBX8hgR8ttPybNZeX9o3nBujAmRK6pArvMPKfgaW+ka31TtyHTdMq5YFSPReglwoGMN7Mnmsc
	6QyWPRIlGAtGuGEP/zjVgpBjvR9RU=
X-Google-Smtp-Source: AGHT+IEXGhN1wiJhI/iDpHCWE3OOyLOFM/JC7uhg6dBjOBVuy9VTffWNjr0xrOA+SMXj4Dk+83aXPKc8UqLhcyjPQwA=
X-Received: by 2002:a05:622a:1898:b0:467:84a1:df08 with SMTP id
 d75a77b69052e-47106cc6068mr662351cf.23.1738811029558; Wed, 05 Feb 2025
 19:03:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net> <20250115111334.GE8385@noisy.programming.kicks-ass.net>
 <20250115160011.GG8385@noisy.programming.kicks-ass.net> <20250117154135.GA17569@willie-the-truck>
 <20250127140915.GA25672@willie-the-truck> <CAJuCfpFuZt7h3gd5Oih74oC_VsSpt=psSoPoBLJWoSam7TFgPQ@mail.gmail.com>
 <CAJuCfpHJedxhZuuoKkKaQXsT-3tPSkhUwHadJRGEdTxSkzRc_w@mail.gmail.com>
In-Reply-To: <CAJuCfpHJedxhZuuoKkKaQXsT-3tPSkhUwHadJRGEdTxSkzRc_w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 5 Feb 2025 19:03:38 -0800
X-Gm-Features: AWEUYZnQDk6XVm__O0Og-sXi_DUYAqWnBd9fWPKyBkrKIw852XdoDL4KwZxh59Q
Message-ID: <CAJuCfpGeHaQu_F6mJo70S+cxWD_PvhDCvfBsD-UXWqwMuOTRYA@mail.gmail.com>
Subject: Re: [PATCH] refcount: Strengthen inc_not_zero()
To: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, boqun.feng@gmail.com, mark.rutland@arm.com, 
	Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 3:51=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Jan 27, 2025 at 11:21=E2=80=AFAM Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> >
> > On Mon, Jan 27, 2025 at 6:09=E2=80=AFAM Will Deacon <will@kernel.org> w=
rote:
> > >
> > > On Fri, Jan 17, 2025 at 03:41:36PM +0000, Will Deacon wrote:
> > > > On Wed, Jan 15, 2025 at 05:00:11PM +0100, Peter Zijlstra wrote:
> > > > > On Wed, Jan 15, 2025 at 12:13:34PM +0100, Peter Zijlstra wrote:
> > > > >
> > > > > > Notably, it means refcount_t is entirely unsuitable for anythin=
g
> > > > > > SLAB_TYPESAFE_BY_RCU, since they all will need secondary valida=
tion
> > > > > > conditions after the refcount succeeds.
> > > > > >
> > > > > > And this is probably fine, but let me ponder this all a little =
more.
> > > > >
> > > > > Even though SLAB_TYPESAFE_BY_RCU is relatively rare, I think we'd=
 better
> > > > > fix this, these things are hard enough as they are.
> > > > >
> > > > > Will, others, wdyt?
> > > >
> > > > We should also update the Documentation (atomic_t.txt and
> > > > refcount-vs-atomic.rst) if we strengthen this.
> > > >
> > > > > ---
> > > > > Subject: refcount: Strengthen inc_not_zero()
> > > > >
> > > > > For speculative lookups where a successful inc_not_zero() pins th=
e
> > > > > object, but where we still need to double check if the object acq=
uired
> > > > > is indeed the one we set out to aquire, needs this validation to =
happen
> > > > > *after* the increment.
> > > > >
> > > > > Notably SLAB_TYPESAFE_BY_RCU is one such an example.
> > > > >
> > > > > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > > > ---
> > > > >  include/linux/refcount.h | 15 ++++++++-------
> > > > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > > > >
> > > > > diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> > > > > index 35f039ecb272..340e7ffa445e 100644
> > > > > --- a/include/linux/refcount.h
> > > > > +++ b/include/linux/refcount.h
> > > > > @@ -69,9 +69,10 @@
> > > > >   * its the lock acquire, for RCU/lockless data structures its th=
e dependent
> > > > >   * load.
> > > > >   *
> > > > > - * Do note that inc_not_zero() provides a control dependency whi=
ch will order
> > > > > - * future stores against the inc, this ensures we'll never modif=
y the object
> > > > > - * if we did not in fact acquire a reference.
> > > > > + * Do note that inc_not_zero() does provide acquire order, which=
 will order
> > > > > + * future load and stores against the inc, this ensures all subs=
equent accesses
> > > > > + * are from this object and not anything previously occupying th=
is memory --
> > > > > + * consider SLAB_TYPESAFE_BY_RCU.
> > > > >   *
> > > > >   * The decrements will provide release order, such that all the =
prior loads and
> > > > >   * stores will be issued before, it also provides a control depe=
ndency, which
> > > > > @@ -144,7 +145,7 @@ bool __refcount_add_not_zero(int i, refcount_=
t *r, int *oldp)
> > > > >     do {
> > > > >             if (!old)
> > > > >                     break;
> > > > > -   } while (!atomic_try_cmpxchg_relaxed(&r->refs, &old, old + i)=
);
> > > > > +   } while (!atomic_try_cmpxchg_acquire(&r->refs, &old, old + i)=
);
> > > >
> > > > Hmm, do the later memory accesses need to be ordered against the st=
ore
> > > > part of the increment or just the read? If it's the former, then I =
don't
> > > > think that _acquire is sufficient -- accesses can still get in-betw=
een
> > > > the read and write parts of the RmW.
> > >
> > > I dug some more into this at the end of last week. For the
> > > SLAB_TYPESAFE_BY_RCU where we're racing inc_not_zero() with
> > > dec_and_test(), then I think using _acquire() above is correct as the
> > > later references can only move up into the critical section in the ca=
se
> > > that we successfully obtained a reference.
> > >
> > > However, if we're going to make the barriers implicit in the refcount
> > > operations here then I think we also need to do something on the prod=
ucer
> > > side for when the object is re-initialised after being destroyed and
> > > allocated again. I think that would necessitate release ordering for
> > > refcount_set() so that whatever allows the consumer to validate the
> > > object (e.g. sequence number) is published *before* the refcount.
> >
> > Thanks Will!
> > I would like to expand on your answer to provide an example of the
> > race that would happen without release ordering in the producer. To
> > save reader's time I provide a simplified flow and reasoning first.
> > More detailed code of what I'm considering a typical
> > SLAB_TYPESAFE_BY_RCU refcounting example is added at the end of my
> > reply (Addendum).
> > Simplified flow looks like this:
> >
> > consumer:
> >     obj =3D lookup(collection, key);
> >     if (!refcount_inc_not_zero(&obj->ref))
> >         return;
> >     smp_rmb(); /* Peter's new acquire fence */
> >     if (READ_ONCE(obj->key) !=3D key) {
> >         put_ref(obj);
> >         return;
> >     }
> >     use(obj->value);
> >
> > producer:
> >     old_key =3D obj->key;
> >     remove(collection, old_key);
> >     if (!refcount_dec_and_test(&obj->ref))
> >         return;
> >     obj->key =3D KEY_INVALID;
> >     free(objj);
> >     ...
> >     obj =3D malloc(); /* obj is reused */
> >     obj->key =3D new_key;
> >     obj->value =3D new_value;
> >     smp_wmb(); /* Will's proposed release fence */
> >     refcount_set(obj->ref, 1);
> >     insert(collection, key, obj);
> >
> > Let's consider a case when new_key =3D=3D old_key. Will call both of th=
em
> > "key". Without WIll's proposed fence the following reordering is
> > possible:
> >
> > consumer:
> >     obj =3D lookup(collection, key);
> >
> >                  producer:
> >                      key =3D obj->key
> >                      remove(collection, key);
> >                      if (!refcount_dec_and_test(&obj->ref))
> >                          return;
> >                      obj->key =3D KEY_INVALID;
> >                      free(objj);
> >                      obj =3D malloc(); /* obj is reused */
> >                      refcount_set(obj->ref, 1);
> >                      obj->key =3D key; /* same key */
> >
> >     if (!refcount_inc_not_zero(&obj->ref))
> >         return;
> >     smp_rmb();
> >     if (READ_ONCE(obj->key) !=3D key) {
> >         put_ref(obj);
> >         return;
> >     }
> >     use(obj->value);
> >
> >                      obj->value =3D new_value; /* reordered store */
> >                      add(collection, key, obj);
> >
> > So, the consumer finds the old object, successfully takes a refcount
> > and validates the key. It succeeds because the object is allocated and
> > has the same key, which is fine. However it proceeds to use stale
> > obj->value. Will's proposed release ordering would prevent that.
> >
> > The example in https://elixir.bootlin.com/linux/v6.12.6/source/include/=
linux/slab.h#L102
> > omits all these ordering issues for SLAB_TYPESAFE_BY_RCU.
> > I think it would be better to introduce two new functions:
> > refcount_add_not_zero_acquire() and refcount_set_release(), clearly
> > document that they should be used when a freed object can be recycled
> > and reused, like in SLAB_TYPESAFE_BY_RCU case. refcount_set_release()
> > should also clarify that once it's called, the object can be accessed
> > by consumers even if it was not added yet into the collection used for
> > object lookup (like in the example above). SLAB_TYPESAFE_BY_RCU
> > comment at https://elixir.bootlin.com/linux/v6.12.6/source/include/linu=
x/slab.h#L102
> > then can explicitly use these new functions in the example code,
> > further clarifying their purpose and proper use.
> > WDYT?
>
> Hi Peter,
> Should I take a stab at preparing a patch to add the two new
> refcounting functions suggested above with updates to the
> documentation and comments?
> If you disagree with that or need more time to decide then I'll wait.
> Please let me know.

Not sure if "--in-reply-to" worked but I just posted a patch adding
new refcounting APIs for SLAB_TYPESAFE_BY_RCU here:
https://lore.kernel.org/all/20250206025201.979573-1-surenb@google.com/
Since Peter seems to be busy I discussed these ordering requirements
for SLAB_TYPESAFE_BY_RCU with Paul McKenney and he was leaning towards
having separate functions with the additional fences for this case.
That's what I provided in my patch.
Another possible option is to add acquire ordering in the
__refcount_add_not_zero() as Peter suggested and add
refcount_set_release() function.
Thanks,
Suren.


> Thanks,
> Suren.
>
>
> >
> > ADDENDUM.
> > Detailed code for typical use of refcounting with SLAB_TYPESAFE_BY_RCU:
> >
> > struct object {
> >     refcount_t ref;
> >     u64 key;
> >     u64 value;
> > };
> >
> > void init(struct object *obj, u64 key, u64 value)
> > {
> >     obj->key =3D key;
> >     obj->value =3D value;
> >     smp_wmb(); /* Will's proposed release fence */
> >     refcount_set(obj->ref, 1);
> > }
> >
> > bool get_ref(struct object *obj, u64 key)
> > {
> >     if (!refcount_inc_not_zero(&obj->ref))
> >         return false;
> >     smp_rmb(); /* Peter's new acquire fence */
> >     if (READ_ONCE(obj->key) !=3D key) {
> >         put_ref(obj);
> >         return false;
> >     }
> >     return true;
> > }
> >
> > void put_ref(struct object *obj)
> > {
> >     if (!refcount_dec_and_test(&obj->ref))
> >         return;
> >     obj->key =3D KEY_INVALID;
> >     free(obj);
> > }
> >
> > consumer:
> >     obj =3D lookup(collection, key);
> >     if (!get_ref(obj, key)
> >         return;
> >     use(obj->value);
> >
> > producer:
> >     remove(collection, old_obj->key);
> >     put_ref(old_obj);
> >     new_obj =3D malloc();
> >     init(new_obj, new_key, new_value);
> >     insert(collection, new_key, new_obj);
> >
> > With SLAB_TYPESAFE_BY_RCU old_obj in the producer can be reused and be
> > equal to new_obj.
> >
> >
> > >
> > > Will
