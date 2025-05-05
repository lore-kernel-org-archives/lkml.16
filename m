Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F8268FE3
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746466376; cv=none; b=XXiGclW9RSj+vFzvPDWTmU4rSS3ljCRmZYdyiP8ivaEWe+TdYGcijmo8CtvTtwRk2z/vUmpByytROISnDVLqD1MlLXmbZxCTpGYu4SfG9GvBGrNma1XYP9FMl+HIA+t1iMpfn8lNgTJUMYGC7tAnGoOR3XApvzKoeNIG2jx0MNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746466376; c=relaxed/simple;
	bh=60saFr6bAwjPlnthxnJndZnBrEYFpnj34RMvbZ01UnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y2QdgBMTKhj6VS535CbauMo6W8gKcg43qBZ09tv0Ckd4MrCiDvIInUdVm9B9YMFLigoylqGAXFHBjvpZrJXjKnNfvPzFx+iW+ENNG+xbeoFhumy00F5f/D4WdR+EQWRAz9FCNws7OlCwMOsxO+YatTHkmsS86BjgdNenizzrSRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VUqTE014; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VUqTE014"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso637a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 10:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746466371; x=1747071171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oeqcbn1zsZR/kDCdlpev1feSus2/PMO7eiPxi+/BYdU=;
        b=VUqTE014Qib7zkTGxZjZdnvtDwal0CLCRdU9afw0w2/aRUD9H/i4M7f/4NU0WhYSJN
         pZNzOzxXwvEgvv4AsizCpmHiS6oK7/D4bnn2/GalbUPdAnxGx1Z8wJ83N9fxiOJfWcEK
         1twOMUF5hU6KJcSESXA1/8u26Vq6hTzmmGo3X9vjZG2fmvpKXPxQ6M4pJ7QiG2fetZio
         opEdfkmB008gGl1+dQlDRWvfmIL3Ctg5Vu/p/a1u+4O6c03D5XShifm03Oy6ZTnXQv6d
         CrdFT1jKTAFmmomX9aFdmR07nwT1sIA6ZBoAcvOFBvoS0rw2CMBFipifTDvwPwp6Adjo
         SOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746466371; x=1747071171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oeqcbn1zsZR/kDCdlpev1feSus2/PMO7eiPxi+/BYdU=;
        b=vry6yNDNKK9ofNIt3OTEGUVxl8jyDw0oeut9aNO1MLgoHFu+bQptjkiXusCuejUR3M
         N74n1R+e9hhN0Y9aE8kqXnrnTgAABzFvuABzKmb8NuQDKJMmJ46H3LBBP/hOb9HrDR3G
         QolABIPs+FTYcF9mwc4Sma2LaLj8VKDA3nMQcCeLtpqBO+/Q2nMJ8y630I3q8vOtgqth
         uPCXoVJxwWCFhVKJOEP2jVNPn7ub5wGfDlNjOsA3+ReC9Mdqny++6rJZkLn/M3V/QRPH
         awcIHFIhzBltjWVQqeMg4hMvAtb+9zwR2EzUj4spsgJke+UkOh3c9vQwVql55Nfxxs5h
         h36g==
X-Forwarded-Encrypted: i=1; AJvYcCVaVL8k0y080PUqUxESPt6ypJrO2kRtLVMlkhN7as1l4MjeTawaQPLWc0ySXj1loG3MTAfShO4GtLBVyJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4SQLmQTWSsEh8vnvo/azNPH/sHO8/QGXlTqTSykLu52LSO5Rr
	ab+fkaZo19aAojImEVkeRp+RDrFmGn/o34f8POGsTf51TN7LMKeuguhKuB16nHsyz6zke6+8J77
	XvJrdlT9ypp4YyZHRvZz2OOy2PooXNCGcJ8Ec
X-Gm-Gg: ASbGnctPeHv9t0ng0Y7WMCvKbGfTEPqMsFtB2CndSWV1+OzPf5WvA0dBvCljeX6qrDj
	tEBwqoPtCXGGEJGnCUKb52Q8QMbnAm/a7eJoJjzStzn/CJete9GKWmmsiSwX4mCmfmqOgvatdn7
	mXWelWEX54IJaEDkbN2zEhbkZ81BkjjUk3QDkhiXiTo2tdRcDz7Q==
X-Google-Smtp-Source: AGHT+IFm2reIdmDVuzP67fU3bv0WQOYDyoJleqL474xCFKZzzy8hIa0Nuebzh2xXuqZY62nIXry73i1Uf7X+Vbrsw9E=
X-Received: by 2002:a05:6402:1a47:b0:5fb:1ccd:5434 with SMTP id
 4fb4d7f45d1cf-5fb566836f0mr29666a12.3.1746466371187; Mon, 05 May 2025
 10:32:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503-debugfs-rust-attach-v1-0-dc37081fbfbc@google.com>
 <20250503-debugfs-rust-attach-v1-1-dc37081fbfbc@google.com> <aBectw_2jridu43O@polis>
In-Reply-To: <aBectw_2jridu43O@polis>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 5 May 2025 10:32:39 -0700
X-Gm-Features: ATxdqUEBkvu_4Ekfz2UMjZhf3-BkkqEKvDYh8HStOviNON8MZJNbUpYHPQlCSrw
Message-ID: <CAGSQo03sHhUX-Eo31cMmeNMaNnzWxU0c-ObTkr7Z1CJ2uQ6c4g@mail.gmail.com>
Subject: Re: [PATCH WIP 1/2] rust: debugfs: Add interface to build debugfs off
 pinned objects
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 4, 2025 at 9:58=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Sat, May 03, 2025 at 12:43:59AM +0000, Matthew Maurer wrote:
> > +/// A DebugFS directory combined with a backing store for data to impl=
ement it.
> > +#[pin_data]
> > +pub struct Values<T> {
> > +    dir: Dir<'static, false>,
> > +    // The order here is load-bearing - `dir` must be dropped before `=
backing`, as files under
> > +    // `dir` may point into `backing`.
> > +    #[pin]
> > +    backing: T,
> > +    // Since the files present under our directory may point into `bac=
king`, we are `!Unpin`.
> > +    #[pin]
> > +    _pin: PhantomPinned,
> > +}
>
> This only ever allows attaching data to the root directory, correct? What=
 if I
> want to remove (or replace) a file or a subdir? Then I'd be left with the=
 data
> for this specific file (or subdir) until the root is finally removed.

The intended way to deal with this is that your debugfs root has
structures or handles that let you compute what all your debugfs files
should see, not necessarily fully populated if you want something
dynamic. For example, one of your entries could be
`Arc<Mutex<Vec<Record>>>`, and this could get updated elsewhere
without thinking about DebugFS - you just need to know the shape of
all the handles DebugFS will need.

It'd be pretty easy for me to relax this to allow attachments to
subtrees. I'd just need to do `Values<'a, T>` and `Dir<'a,  false>`.
It'd also make the argument for the safety of the builder interface
slightly more complicated (things that statically outlive the lifetime
of the dir would also be usable in the builder, which is safe, but
trickier to argue for).

You wouldn't be able to do nested attachments, but you could do
attachments starting with any subtree. So for example, you could do:
```
let root =3D Dir::new(c_str!("foo"));
let foo =3D root.subdir(c_str!("bar")).owning();
let bar =3D root.subdir(c_str!("baz")).owning();
let foo_values =3D Values::attach(foo_data, foo);
let bar_values =3D Values::attach(bar_data, foo);
```

The tricky business here (and why I didn't do it in my initial draft)
is that because `foo_values` and `bar_values` are restricted to live
no longer than `root` (since they will be invalidated if `root` is
dropped), it is hard to store these objects in a module context or
similar object, which would make it tricky to use. Attaching to a root
directory on the other hand is not tricky, because their lifecycle
isn't dependent on some other object.

A legal way of using this kind of scoped interface (but not
immediately obvious to me how to design the safe interface to let
users build it) might look like

```
struct MyDebugFsInfo<T> {
  // RawValues is a fictitious type that would be like `Values`, but
with the actual lifetime parameter erased.
  subdirs: Vec<RawValues<T>>,
  // Order matters, root must be released last because earlier values
are borrows
  root: Dir<'static, false>,
}

impl<T> MyDebugFsInfo<T> {
  fn new_subdir(&mut self, name: &CStr, value: T) {
    let subdir =3D self.root.subdir(name);
    // SAFETY: We don't allow the root to be destroyed before our structure=
, so
    let val =3D unsafe { RawValues::attach(value, self.root.subdir(name)) }=
;
    self.subdirs.push(val)
  }
  fn get<'a>(&'a self, idx: usize) -> &Values<'a, T> {
     let x =3D self.subdirs[idx];
     // SAFETY: We know all our subdirs are children of the root we
own, so if we have a read-only reference to ourselves, that's an upper
bound on how long the value struct can live
     unsafe { RawValues::ascribe(x) }
  }
}
```

If I wanted to do better than this in terms of ergonomics, I think I'd
need some kind of refcounted wrapper where holding a subdir prevents
the parent dir from being cleaned up, which I could add, but would be
a Rust abstraction layer on top of the C one.


>
> It would also require Option<V> (where V is the type of a field in T), if=
 I
> don't have an instance of V yet, when the root directory is created.

`Option<V>` won't actually save you - once you create a `Values<T>`,
you are intentionally unable to mutate `T` anymore, because it may be
read at any point in time after that by someone reading a debugfs
file, so you can't do a potentially racing mutation. If you wanted a
value to be attached to a debugfs, but didn't have one, you'd need to
do `Mutex<Option<V>>`.

>
> I think we should store the data per file, rather than per root directory=
.

This doesn't match what at least seems to be a common usage of
debugfs, where a debugfs directory is used to represent an object with
each file in the directory representing one of the properties on the
object.

This also means that we need to store N handles in a Rust driver (one
per live file) compared to 1 handle in a C driver.

=3D=3D=3D

I do think that the normal idiomatic way of doing this in Rust would
be to attach refcounted handles (e.g. similar to `ForeignOwnable`) to
inodes, and when the inode is destroyed, have that refcount be
deleted, but we don't currently have any `release` implementation for
a DebugFS inode afaict, so everything has to be externally scoped via
this attached pinned data setup I've been producing.
