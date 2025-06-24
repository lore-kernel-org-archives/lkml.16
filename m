Received: from forward502d.mail.yandex.net (forward502d.mail.yandex.net [178.154.239.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC9A79F2;
	Tue, 24 Jun 2025 05:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750743296; cv=none; b=RzpqdRAa+mhB+61mQ7GTZSM2B4UOulTpZm3LIZ/cdYBkyZaYFPAhfLAD0BoMHTQr1eKL7FWMkRoDL6b13nCDmZ7q7g2DDiNL3mAGz0WTPgdqybMZLYIbwuMJC8kyRWd4mw0y+6seIZlxKKr+IHyKoWlij5pHlypZ4izyysWpSW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750743296; c=relaxed/simple;
	bh=lra60Ls2eKXsXJk06ybPuj1zDNkCSmk0022rbcjgbOw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=spzDJBVJ+iga7tSWmMydg+ZeuGoRPKE6zV1u6WgSF987rtXJSTBmBOp+EbRc4Qx5Y6MXzQPY3tMZoS+ZP6tcJM27MFM7ZH8veOM/GAkdTcmWNQC/eiK2ZNx+3j72PoJC+8tbNspfRXbN+D8+jnOCcu6sRQIzRVN6yPYG4RebXN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=otevBcHE; arc=none smtp.client-ip=178.154.239.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="otevBcHE"
Received: from mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:82a4:0:640:9cc1:0])
	by forward502d.mail.yandex.net (Yandex) with ESMTPS id A5509618BE;
	Tue, 24 Jun 2025 08:34:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id dYLDVH5LgmI0-qFurcHQw;
	Tue, 24 Jun 2025 08:34:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750743283;
	bh=xgCDRYHkt6LzTAG6GH5/CdfqgQ9u0lD5pfFMgfxmQdk=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=otevBcHEZsniS3eCzAaT4D3+qYH1IZ7OzE2mP5sD9BGO5O+3g3aJjNmu0F79z+Uvo
	 R2hYw2qFVTSCwIIYx96hsOZVU8Jmxg4XZs7GlD/gVDsL9POzqg103ZrWUJCKN8ZcTD
	 mBlB6WblmMQUPDUOITxgqxgg7WyJv7Kzh1jX6jS4=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Tue, 24 Jun 2025 08:34:37 +0300
From: Onur <work@onurozkan.dev>
To: "Benno Lossin" <lossin@kernel.org>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <gary@garyguo.net>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <dakr@kernel.org>,
 <peterz@infradead.org>, <mingo@redhat.com>, <will@kernel.org>,
 <longman@redhat.com>, <felipe_life@live.com>, <daniel@sedlak.dev>,
 <bjorn3_gh@protonmail.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <lyude@redhat.com>
Subject: Re: [PATCH v5 2/3] implement ww_mutex abstraction for the Rust tree
Message-ID: <20250624083437.1e50d54c@nimda.home>
In-Reply-To: <DAUARTYJ118U.YW38OP8TRVO3@kernel.org>
References: <20250621184454.8354-1-work@onurozkan.dev>
	<20250621184454.8354-3-work@onurozkan.dev>
	<DASY7BECFRCT.332X5ZHZMV2W@kernel.org>
	<aFlQ7K_mYYbrG8Cl@Mac.home>
	<DATYHYJVPL3L.3NLMH7PPHYU9@kernel.org>
	<aFlpFQ4ivKw81d-y@Mac.home>
	<DAU0ELV91E2Q.35FZOII18W44J@kernel.org>
	<aFmKsE_nJkaVMv0T@tardis.local>
	<DAUARTYJ118U.YW38OP8TRVO3@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 01:22:05 +0200
"Benno Lossin" <lossin@kernel.org> wrote:

> On Mon Jun 23, 2025 at 7:11 PM CEST, Boqun Feng wrote:
> > On Mon, Jun 23, 2025 at 05:14:37PM +0200, Benno Lossin wrote:
> >> On Mon Jun 23, 2025 at 4:47 PM CEST, Boqun Feng wrote:
> >> > On Mon, Jun 23, 2025 at 03:44:58PM +0200, Benno Lossin wrote:
> >> >> I didn't have a concrete API in mind, but after having read the
> >> >> abstractions more, would this make sense?
> >> >> 
> >> >>     let ctx: &WwAcquireCtx = ...;
> >> >>     let m1: &WwMutex<T> = ...;
> >> >>     let m2: &WwMutex<Foo> = ...;
> >> >> 
> >> >>     let (t, foo, foo2) = ctx
> >> >>         .begin()
> >> >>         .lock(m1)
> >> >>         .lock(m2)
> >> >>         .lock_with(|(t, foo)| &*foo.other)
> >> >>         .finish();
> >> >> 
> >> >
> >> > Cute!
> >> >
> >> > However, each `.lock()` will need to be polymorphic over a tuple
> >> > of locks that are already held, right? Otherwise I don't see how
> >> > `.lock_with()` knows it's already held two locks. That sounds
> >> > like a challenge for implementation.
> >> 
> >> I think it's doable if we have 
> >> 
> >>     impl WwActiveCtx {
> >
> > I think you mean *WwAcquireCtx*
> 
> Oh yeah.
> 
> >>         fn begin(&self) -> WwActiveCtx<'_, ()>;
> >>     }
> >> 
> >>     struct WwActiveCtx<'a, Locks> {
> >>         locks: Locks,
> >
> > This probably need to to be Result<Locks>, because we may detect
> > -DEADLOCK in the middle.
> >
> >     let (a, c, d) = ctx.begin()
> >         .lock(a)
> >         .lock(b) // <- `b` may be locked by someone else. So we
> > should // drop `a` and switch `locks` to an `Err(_)`.
> >         .lock(c) // <- this should be a no-op if `locks` is an
> > `Err(_)`. .finish();
> 
> Hmm, I thought that we would go for the `lock_slow_path` thing, but
> maybe that's the wrong thing to do? Maybe `lock` should return a
> result? I'd have to see the use-cases...
> 
> >>         _ctx: PhantomData<&'a WwAcquireCtx>,
> >
> > We can still take a reference to WwAcquireCtx here I think.
> 
> Yeah we have to do that in order to call lock on the mutexes.
> 
> >>     }
> >> 
> >>     impl<'a, Locks> WwActiveCtx<'a, Locks>
> >>     where
> >>         Locks: Tuple
> >>     {
> >>         fn lock<'b, T>(
> >>             self,
> >>             lock: &'b WwMutex<T>,
> >>         ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;
> >> 
> >>         fn lock_with<'b, T>(
> >>             self,
> >>             get_lock: impl FnOnce(&Locks) -> &'b WwMutex<T>,
> >>         ) -> WwActiveCtx<'a, Locks::Append<WwMutexGuard<'b, T>>>;
> >>         // I'm not 100% sure that the lifetimes will work out...
> >
> > I think we can make the following work?
> >
> >     impl<'a, Locks> WwActiveCtx<'a, Locks>
> >     where
> >         Locks: Tuple
> >     {
> >         fn lock_with<T>(
> > 	    self,
> > 	    get_lock: impl FnOnce(&Locks) -> &WmMutex<T>,
> > 	) -> WwActiveCtx<'a, Locks::Append<WmMutexGuard<'a, T>>
> >     }
> >
> > because with a `WwActiveCtx<'a, Locks>`, we can get a `&'a Locks`,
> > which will give us a `&'a WmMutex<T>`, and should be able to give
> > us a `WmMutexGuard<'a, T>`.
> 
> I think this is more restrictive, since this will require that the
> mutex is (potentially) locked for `'a` (you can drop the guard
> before, but you can't drop the mutex itself). So again concrete
> use-cases should inform our choice here.
> 
> >>         fn finish(self) -> Locks;
> >>     }
> >> 
> >>     trait Tuple {
> >>         type Append<T>;
> >> 
> >>         fn append<T>(self, value: T) -> Self::Append<T>;
> >>     }
> >> 
> >
> > `Tuple` is good enough for its own, if you could remember, we have
> > some ideas about using things like this to consolidate multiple
> > `RcuOld` so that we can do one `synchronize_rcu()` for `RcuOld`s.
> 
> Yeah that's true, feel free to make a patch or good-first-issue, I
> won't have time to create a series.
> 
> >>     impl Tuple for () {
> >>         type Append<T> = (T,);
> >> 
> >>         fn append<T>(self, value: T) -> Self::Append<T> {
> >>             (value,)
> >>         }
> >>     }
> >>     
> >>     impl<T1> Tuple for (T1,) {
> >>         type Append<T> = (T1, T);
> >> 
> >>         fn append<T>(self, value: T) -> Self::Append<T> {
> >>             (self.0, value,)
> >>         }
> >>     }
> >> 
> >>     impl<T1, T2> Tuple for (T1, T2) {
> >>         type Append<T> = (T1, T2, T);
> >> 
> >>         fn append<T>(self, value: T) -> Self::Append<T> {
> >>             (self.0, self.1, value,)
> >>         }
> >>     }
> >> 
> >>     /* these can easily be generated by a macro */
> >> 
> >> > We also need to take into consideration that the user want to
> >> > drop any lock in the sequence? E.g. the user acquires a, b and
> >> > c, and then drop b, and then acquires d. Which I think is
> >> > possible for ww_mutex.
> >> 
> >> Hmm what about adding this to the above idea?:
> >> 
> >>     impl<'a, Locks> WwActiveCtx<'a, Locks>
> >>     where
> >>         Locks: Tuple
> >>     {
> >>         fn custom<L2>(self, action: impl FnOnce(Locks) -> L2) ->
> >> WwActiveCtx<'a, L2>; }
> >> 
> >> Then you can do:
> >> 
> >>     let (a, c, d) = ctx.begin()
> >>         .lock(a)
> >>         .lock(b)
> >>         .lock(c)
> >>         .custom(|(a, _, c)| (a, c))
> >>         .lock(d)
> >>         .finish();
> >> 
> >
> > Seems reasonable. But we still need to present this to the end user
> > to see how much they like it. For ww_mutex I think the major user
> > is DRM, so add them into Cc list.
> 
> Yeah let's see some use-cases :)


Should we handle this in the initial implementation or leave it for
follow-up patches after the core abstraction of ww_mutex has landed?

---

Regards,
Onur
