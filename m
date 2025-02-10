Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662FB189F3B;
	Mon, 10 Feb 2025 05:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739166009; cv=none; b=r+oey9xqT5D2ndDY6uLx8Cm9vjCZlrvoYoiQDUvwSV6ESAkue7/SXwbd8AdTwqMO5vPpHTX4xOuIaFUW6ENC8dZe/NYKUpRklixVHEQSaj391ZHXZooHDMpHX6zWabBR1Fx/PkFUWPszPW1tl1W9gx/mEOZ9ST6qgtobPqdd+PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739166009; c=relaxed/simple;
	bh=2lAaPI1IUBxCfge9zgJ95bA8IrUEHJ97mNlCsavgSpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VGrlZfY+3tZnBtUl1GZCPJ3pkPqsBCDmIz6/x7NNyln29rBtVWz2l09ri60/Q8hDG10KcYuOp5jZ2QC0vVX3e4aOCprIxZ7nFjw6UlVYPjAK+yHAKxp8yOOxhRqCbifO35Q3azjbdOY145urT3Vd9c9YcdT8cYR+0PajLXhx/Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1ljIAwX; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1ljIAwX"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c0590fdae5so187139785a.0;
        Sun, 09 Feb 2025 21:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739166006; x=1739770806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKWtO/dYz247KZCvymvLm+jAp0Xkk0UErm7CY6FZ0VQ=;
        b=F1ljIAwXo2e4+aaHzfP3J5kSHAzOA7tQ+ymcZNLjCh+jtihhbgeCscYbY0mQRu7QIQ
         RDcP2TNeXlovPIg5O6PpOp6zE5wwMaSQKQA1DnC73CXU83tZU9u30smdqdYAE/upr6rv
         TXMRbbK1lgxExYQydrexBhaVp+U1EaM4XP9/VSVe7Fzb37Sa6ysHiVtGrukYhjYSz4SW
         qMi52XRLjKoFZsvVJ+WbOOMgUYtXPbflJWBrUKuJN2Dj7Zk03J4LGVB4BI8k9SDoT9dA
         BMaPEExvyVkcU4F4kj9492ovOMYgi2J+pYIoV+eUFqimkCHVlu4h/MxinJKkzFCTpzxR
         ngjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739166006; x=1739770806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKWtO/dYz247KZCvymvLm+jAp0Xkk0UErm7CY6FZ0VQ=;
        b=TyW0v+oWOlNPeOkR+YtG/kFpTv7/LQwpaNdahvMRKqUjijXwmSpPkVsS+fbg5k2ctl
         IsK3Jyrm0GDiSx+QU7KaX1gj4NSEXh4sUNcin/6+1LTywKZFcFntS0YTrEL8/JOqdsdg
         B55/t++O6/FSvUS/ryTkTeJVTvnPg2Re7wTPJsD5/X+6hHYOx0MtmMmQk3b9WmsikD+H
         nILhsJ5ESDO+E43VINVTF4KMEgdkAnNTfuzLa+HXSkaTySS7UcFsoH2+X8sGc7mcwmav
         5A20pUB4xrbU5ehICuY94A1xuT4qi9TCKmWDUHl/nVsmP00HtrhjtF81SUHKoPDCcgA2
         IHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH2V54ACHY0DCDQiJ661gsDyuyaKAh8NNkqDNBrq/XtJPlr4Frv/xqfup1R2CPNBto9TzQjQW2KbY4bpo=@vger.kernel.org, AJvYcCXJ9ylIrPYGflp+UtWx3WVR//fRuhSMSaeZlBCtfighfrtZ+/nA/yOdDzlNtrC7Ch72/ai1lnh4jVZcXFfyRMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB4uYfIxuyq8QKm1DZOfFa7Vm3DFNaAgGSp/0+reiWbmZb2ZBy
	mzwaPCKgFmKpUHUeeZNxWBTObeCQn4zYlI3D1WVYeYecvj/s3Uol
X-Gm-Gg: ASbGncvc+2IZYE38ILWb9cYQvsBDWaFrhJ0otU3XML0nwk21qPvmNkJGWU1FGPi1ApO
	6oJB0aVy1/qMSYqahgOZEd1L/35p2BkOQoyv4pJ9ZCGnxE9Nm4W5BjM91J6O9pIGcRMJmfp0nj2
	aSH1EKViGCdxINPxbjLjiZQodqG7txlJR4iZzFb4ZfhjnJC1C9L/RRymPhdgBQ2dN9Pn/M3bPVo
	Ar4owD085EGOcQNKdYqHbSUkX5KDUcAPzEuABd4EYhU44SoUTJmbR/rYyQAykixTOCTY9/MS6h2
	qrgGAYJ9ZHutHiW4NrDGZOPJtRB5skYO44XiuL1tAvHkCXE1n+B6CzAZEXHoItsFmO+2aA5RJJC
	y0OtRnw==
X-Google-Smtp-Source: AGHT+IFJLgeEeYnBCyFFJZm+NItmjYkiLubZ8ohfulP3Wy6At0JD5XA8nQ/b5uR3yYaPHCMEMTm58g==
X-Received: by 2002:a05:620a:2614:b0:7b6:ce6e:229c with SMTP id af79cd13be357-7c047c4e7afmr1949295685a.55.1739166006229;
        Sun, 09 Feb 2025 21:40:06 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c0615b0725sm38665685a.41.2025.02.09.21.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:40:05 -0800 (PST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 980441200043;
	Mon, 10 Feb 2025 00:40:04 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 10 Feb 2025 00:40:04 -0500
X-ME-Sender: <xms:NJGpZ_oj1hFN4h0lsDU_9qc9OYJ-tUMYP5SnvshUNI9-_IdkKDCWXw>
    <xme:NJGpZ5oJ7jofrBCYzQ_ftg7X1by2N8wLQ9XJ7ZkBKFbW0ND1A1TFKawRsFqfFyy2Q
    NRaAARrFFsd7qcLHg>
X-ME-Received: <xmr:NJGpZ8PKUlH4ACY1b6GSqou9shroqFgA5vGVR1yoZfjzs7GJyX0baw4IyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefjedvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepffdtiefhieegtddvueeuffeiteevtdegjeeu
    hffhgfdugfefgefgfedtieeghedvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopehlvghv
    hihmihhttghhvghllhdtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdr
    tghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegrrdhh
    ihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuhhmihgthhdrvggu
    uh
X-ME-Proxy: <xmx:NJGpZy7zEk0CUtcmqS5jx33Rs7S0fZCIRMnWbIf01s2BJMf9uf5JGQ>
    <xmx:NJGpZ-6iOCZ5d2pEWYJiMkHo985eC954iM9VijwIf5AD1ukSQTAMcw>
    <xmx:NJGpZ6jPzUBAo_mtS8qZ2Gd2Qa4lvxraXs38ZyBvQLdcal9mxw_rSw>
    <xmx:NJGpZw7srxF6DGCpjC3KCe-YhRKq8Qapm2jDgaT-7oHrIqrpmr9iUg>
    <xmx:NJGpZ9LilF98Hlih_MI5OwMLaM8FzQ7PNprI2N3vFds7Bh06GNjCKKUo>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 00:40:03 -0500 (EST)
Date: Sun, 9 Feb 2025 21:40:03 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Mitchell Levy <levymitchell0@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <walmeida@microsoft.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] rust: lockdep: Use Pin for all LockClassKey usages
Message-ID: <Z6mRMzzr045Rk7gl@Mac.home>
References: <20250207-rust-lockdep-v4-0-7a50a7e88656@gmail.com>
 <20250207-rust-lockdep-v4-2-7a50a7e88656@gmail.com>
 <fd129e8e-cd2c-4ff9-b3b4-9bdb28582e52@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd129e8e-cd2c-4ff9-b3b4-9bdb28582e52@proton.me>

On Sun, Feb 09, 2025 at 09:57:00AM +0000, Benno Lossin wrote:
> On 08.02.25 01:39, Mitchell Levy wrote:
> > Reintroduce dynamically-allocated LockClassKeys such that they are
> > automatically (de)registered. Require that all usages of LockClassKeys
> > ensure that they are Pin'd.
> > 
> > Currently, only `'static` LockClassKeys are supported, so Pin is
> > redundant. However, it is intended that dynamically-allocated
> > LockClassKeys will eventually be supported, so using Pin from the outset
> > will make that change simpler.
> > 
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1102
> > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> > Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> 
> One nit below, but it's fine.
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> 

Thank you both!

> > ---
> >  rust/helpers/helpers.c          |  1 +
> >  rust/helpers/sync.c             | 13 ++++++++++
> >  rust/kernel/sync.rs             | 57 ++++++++++++++++++++++++++++++++++++++---
> >  rust/kernel/sync/condvar.rs     |  5 ++--
> >  rust/kernel/sync/lock.rs        |  9 +++----
> >  rust/kernel/sync/lock/global.rs |  5 ++--
> >  rust/kernel/sync/poll.rs        |  2 +-
> >  rust/kernel/workqueue.rs        |  2 +-
> >  8 files changed, 78 insertions(+), 16 deletions(-)
> 
> [...]
> 
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > index eb80048e0110..6dafe338bbc7 100644
> > --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -7,12 +7,9 @@
> > 
> >  use super::LockClassKey;
> >  use crate::{
> > -    init::PinInit,
> > -    pin_init,
> > -    str::CStr,
> > -    types::{NotThreadSafe, Opaque, ScopeGuard},
> > +    init::PinInit, pin_init, str::CStr, types::NotThreadSafe, types::Opaque, types::ScopeGuard,
> 
> Why does this change exist? I prefer imports to be merged.
> 

Agreed. Queued with this change reverted.

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
> >  };
> > -use core::{cell::UnsafeCell, marker::PhantomPinned};
> > +use core::{cell::UnsafeCell, marker::PhantomPinned, pin::Pin};
> >  use macros::pin_data;
> > 
> >  pub mod mutex;
> > @@ -129,7 +126,7 @@ unsafe impl<T: ?Sized + Send, B: Backend> Sync for Lock<T, B> {}
> > 
> >  impl<T, B: Backend> Lock<T, B> {
> >      /// Constructs a new lock initialiser.
> > -    pub fn new(t: T, name: &'static CStr, key: &'static LockClassKey) -> impl PinInit<Self> {
> > +    pub fn new(t: T, name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit<Self> {
> >          pin_init!(Self {
> >              data: UnsafeCell::new(t),
> >              _pin: PhantomPinned,
> 
