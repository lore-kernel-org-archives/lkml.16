Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE0D2FD882
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751406847; cv=none; b=HKDwLHi068bZvlqQU3RRY/1ClrJmw2ij5KIpMrDf1IhUeD9VKNrEnCX0ZslxFDeyXFcTsS5PQ1CU9QYL2lbcFH/zOciEROR8fnlJqbBOyfFkPsWRQPp0XCxdZHx1HSM13zNuhVxp7lFqkpxWGT0UQKNhmrO52iyIAF8nD4sUxQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751406847; c=relaxed/simple;
	bh=JMomTEei7y0V0/UZWksu2X8Dnt9cCX7Lrm18/W01Xhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Og2AEFmt8soRKzXfmo4eYVlNQ6i74GbhX5v6m7wUcLxyODe35nqLbYEq/gF3Tljm+dxlxo7f62DZQyVVhhGTSSa/bTDY704N+XH7BPAl8KoIDTR2PpXHako2ogmP6of9lh9zBixAgwf2xOILevfM8i5dkHrrRP46FoqjHa3B7HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jAJ4fMGD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jAJ4fMGD"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so16109a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751406843; x=1752011643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ld7F4HBIlGiN9DWhZfqacu/pe2SF5kE57miwsPVjWkY=;
        b=jAJ4fMGDLS408Z4htpMn4j1TNRvteH1MBcWp3weT6cQfGl3iOlk6wL/grJug9HDhdt
         xe/YFyTuNm8a3cTsm92ZeN6AfP22ln9IohuNC3MT2hnH8EOfFo+YvA12xMuoWYKIDMdK
         y/VuLigH6fHleLrQvJsNS9gImTWiItLpnNB/y4gZEqmjp5MqxHjhxUsUdSsermw9tgB+
         nFQbvqRlGfdBbrh4zYr1kQy8kT8IWc8AKJFyXpljBeTr4Ma1/M+t69kKngRoQUjc8BbH
         tdzk3KDIVPBBQJ6drqSGWqMLR2bH0l5Kb6xN3jIKj+bFhmh9MuLLAHW+OknCc1eg2YcT
         jtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751406843; x=1752011643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ld7F4HBIlGiN9DWhZfqacu/pe2SF5kE57miwsPVjWkY=;
        b=SYLdDXL3Uwvv7PjXby48tPmMJULvOZoGTr7CuHHJtUaMdIhCDgOCxcd5wbiAQ+3Z3f
         buifZTET+Eg9MSKitsJMXcfI2BAzJCbFQhHtXpz6Ny5gBflVJtTp+XOEzXbA9WZ7v3TD
         mTDLix1hTR6CfYVWwWfBkKnKj54CS1hS+CJQPd5HD6LLovU293otFm8YXoQTjzjWOYf0
         CtB1Mzzwd7WjRWpPc6WRYZAGAcKlNALwzuAW+yqck+IvwdhAZWD/RBwBjSqa0dpUIhEL
         /f+NpLZ3/689W7mNRenndjnozX+Qi7/e42JsJTtbNoplLYjqIvpqnQ6HAgPyMq7KPYLa
         gG2A==
X-Forwarded-Encrypted: i=1; AJvYcCXF47jWYhmegiqkIOoq4gVVkfcNq3intaVdvzVGc8LfoLfK9zjBeK8FIwVn5Fv0OTe1Wf5nxPXroU33e2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC5V/mvzZq4SaurAGoFDJtQVXhy+eRz4PbF7D4iWqCMgmcNDlA
	LALuBka1d4LdKGQhJTdIvA3nPYT+Zmlj82Epdve8Ewn861wqmQUY76T5RyBlJnKwNVeoR5fHDsR
	RwJ2KreProT1QbVg2XtyHI2gihVqRDqTgqkaksoGF
X-Gm-Gg: ASbGncsyWkaf19dfDmgfGLhJS4Iw/NwZdQFi7yNVMIWqxRlPV7NXFddTu/INZG5vX9c
	Qbf7wp/PaYQ1OidpbbcGs9bosTffFIgSGqnOuQic4jdttF1dKqWkavv1SOsqqxn5o4hJPSbIR8O
	/BPhJTuUDvQcHb2WMhLKw4X/aHkrRbAXcNx1vBr/NRIijPIj2+kTe2O+jjlKo/JENcrs8DKVVC
X-Google-Smtp-Source: AGHT+IEcCwkWt0puE4zG3pLRWxXga/B8flfyWb4xB/N4Qbq1OeY9qSRBWTJV/btdLG+9+8LK4mi6nrRvTTdojft+2J0=
X-Received: by 2002:a05:6402:4558:b0:609:99a7:efdb with SMTP id
 4fb4d7f45d1cf-60e388f2b76mr147545a12.2.1751406843249; Tue, 01 Jul 2025
 14:54:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025070131-icon-quarters-0c16@gregkh> <aGPtCBB6nWTNJuwK@pollux>
 <2025070137-tartar-juncture-fcd2@gregkh> <aGP6d2-jJy5rtjMK@pollux>
 <CAGSQo00eG5oRdN_xORLUyUauLi_vzypU-gz6DSU_FzaAbHRLng@mail.gmail.com>
 <aGQ1VsnFaxBo9zaM@pollux> <DB0Z71SF488V.3QURUHHELOY84@kernel.org>
 <3c928a0e-ccd4-4ba0-9f42-9f2bb0203e75@kernel.org> <DB0ZJVL0682F.ZNNOXEIDL5NN@kernel.org>
 <DB0ZOHPFJR7T.1W3OF32GDL55O@kernel.org> <aGRCM1VRHI8EvZmd@pollux>
In-Reply-To: <aGRCM1VRHI8EvZmd@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 1 Jul 2025 14:53:52 -0700
X-Gm-Features: Ac12FXwQ8trYMtg8ADu-pbYNZ4d3NZdUbsJXRWIWlbPMuwiMmCItQakKxyNtqsA
Message-ID: <CAGSQo03nX2cMc0WZQ2YmUKkOLCH_iu9MeQuLSXfCHmNBbuDJ9g@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue, Jul 01, 2025 at 10:09:10PM +0200, Benno Lossin wrote:
> > On Tue Jul 1, 2025 at 10:03 PM CEST, Benno Lossin wrote:
> > > On Tue Jul 1, 2025 at 9:58 PM CEST, Danilo Krummrich wrote:
> > >> On 7/1/25 9:46 PM, Benno Lossin wrote:
> > >>> On Tue Jul 1, 2025 at 9:21 PM CEST, Danilo Krummrich wrote:
> > >>>> On Tue, Jul 01, 2025 at 11:11:13AM -0700, Matthew Maurer wrote:
> > >>>>> If we implement *only* pinned files, we run into an additional pr=
oblem
> > >>>>> - you can't easily extend a pinned vector. This means that you ca=
nnot
> > >>>>> have dynamically created devices unless you're willing to put eve=
ry
> > >>>>> new `File` into its own `Box`, because you aren't allowed to move=
 any
> > >>>>> of the previously allocated `File`s for a resize.
> > >>>>>
> > >>>>> Where previously you would have had
> > >>>>>
> > >>>>> ```
> > >>>>> debug_files: Vec<File>
> > >>>>> ```
> > >>>>>
> > >>>>> you would now have
> > >>>>>
> > >>>>> ```
> > >>>>> debug_files: Vec<PinBox<File<T>>>
> > >>>>> ```
> > >>>>
> > >>>> Stuffing single File instances into a Vec seems like the wrong thi=
ng to do.
> > >>>>
> > >>>> Instead you may have instances of some data structure that is crea=
ted
> > >>>> dynamically in your driver that you want to expose through debugfs=
.
> > >>>>
> > >>>> Let's say you have (userspace) clients that can be registered arbi=
trarily, then
> > >>>> you want a Vec<Client>, which contains the client instances. In or=
der to provide
> > >>>> information about the Client in debugfs you then have the client e=
mbed things as
> > >>>> discussed above.
> > >>>>
> > >>>>  struct Client {
> > >>>>     id: File<ClientId>,
> > >>>>     data: File<ClientData>,
> > >>>>     ...
> > >>>>  }
> > >>>>
> > >>>> I think that makes much more sense than keeping a Vec<Arc<Client>>=
 *and* a
> > >>>> Vec<File> separately. Also, note that with the above, your Client =
instances
> > >>>> don't need to be reference counted anymore.
> > >>>>
> > >>>> I think this addresses the concerns below.
> > >>>
> > >>> You still have the issue that `Client` now needs to be pinned and t=
he
> > >>> vector can't be resized. But if you know that it's bounded, then we
> > >>> could just make `Pin<Vec<T>>` work as expected (not relocating the
> > >>> underlying allocation by not exposing `push`, only
> > >>> `push_within_capacity`).
> > >>>
> > >>> We also could have a `SegmentedVec<T>` that doesn't move elements.
> > >>> Essentially it is
> > >>>
> > >>>      enum SegmentedVec<T> {
> > >>>          Cons(Segment<T>, KBox<SegmentedVec<T>>)
> > >>>          Nul,
> > >>>      }
> > >>>
> > >>>      struct Segment<T> {
> > >>>          elements: [T; 16]
> > >>>      }
> > >>>
> > >>> or make the segments variable-sized and grow them accordingly.
> > >>
> > >> That sounds a lot like the perfect application for XArray. :)
> > >
> > > Haha I didn't know this already existed in the kernel :) Yeah then we
> > > should make XArray work for this use-case.
> >
> > Ah wait, I meant for `SegmentedVec<T>` to store multiple `T` in the sam=
e
> > allocation, so it would only grow sometimes and amortize the allocation=
s
> > just like `Vec`. It seems to me that XArray only stores pointers, so yo=
u
> > have to box everything (which we're trying to avoid IIUC).
>
> Yes, that sounds good. And if the potential number of Client instances ca=
n get
> pretty large Vec isn't a good choice anyways. If we really get a ton of c=
lients,
> they should be allocated with a kmem_cache and stored in an XArray, maple=
 tree,
> etc.

OK. I've outlined why I disagree, but it sounds like consensus here is that=
:
1. You want a `File<T>` that implements `Deref` to expose a `&T`.
2. To enable `T` to take on values which are not `ForeignOwnable`, you
want me to make `create_file` return a `PinInit<File<T>>` (We will
also grow a `T: Sized` bound here.)

You are aware that:
1. A `File` can no longer be placed in a normal Rust collection, you
will either need to box it or use a special collection kind.
2. Adding or removing DebugFS support for some data in a driver may
cause more noise (code edits non-local to the debug logic) than
expected.

The one thing I still don't see a consensus on:

What do you want me to do about standard traits for `File`? If we're
intending it to be heavily used throughout structs, we'll effectively
break `#[derive]` if I don't add support. For example, if we had
```
#[derive(Debug, PartialEq)]
struct FooAttrs {
  name: String,
  size: usize,
}
// In my current patch world someone adds `File`, it's by putting
`FooAttrs` into an `Arc` and passing that into `create_file`, no
modifications to the structure are made.
```
before, we have an obvious semantics for this. If someone adds `File`
with the new API, we get
```
#[derive(Debug, PartialEq)]
#[pin_data]
struct FooAttrs {
  #[pin]
  name: File<String>,
  #[pin]
  size: File<usize>,
}
```

This means that for the `#[derive]` to keep working, `File` needs to
implement these traits. Do we want it to:
A. Purely delegate, so making this sort of change keeps the same
behavior of derived traits
B. Do what makes sense for a `File`, so e.g. Debug might print 'File {
data: "name_of_foo" }', and PartialEq might test for equality of the
dentry if not an error

I'm guessing you want A, but I've been through so many API reworks at
this point that I wanted to ask in case there's  disagreement here.
