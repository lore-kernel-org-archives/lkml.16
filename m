Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707FF2857FC;
	Tue,  1 Jul 2025 22:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751408805; cv=none; b=Sj3pXvh4OFkqClCuENFEsfY53rb6EHNvwEkSMZiUDF77/NGiN9cmEgZ7NqB8lOMSMXeNcGhPz5OLclHYwYxVQ3GdSJ4OLRiqNXxbOTglcHuj3tIprEiIaL7JhqNRV3Q1xQJ+wNvFpKuA3BWFvKdq6iNdywvsfyVt3+M8HxkdI+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751408805; c=relaxed/simple;
	bh=Ev8JouoIyIDgoq99e/Pywm2er0Vg2jV3p9WcS7ytEgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOyAe9RvuKCJIN+Wy/znh6r5GuqERVwUGFswnNvdRubsnwZUogyJBo5URmAMYbSU5fZwpnD39wWz/Y2T02VKUg2vRCvv2piA0FFT+7jGOeKHL2oHuVTIrQvg+H7YXXAxiEip2mqT6Sv3miB0Yug13jgJiG58zTgSn3JOJAXj3PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWnh+D/s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWnh+D/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC6EC4CEEB;
	Tue,  1 Jul 2025 22:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751408805;
	bh=Ev8JouoIyIDgoq99e/Pywm2er0Vg2jV3p9WcS7ytEgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWnh+D/snPl0UXtfdtIdjdO1rqljQIKGbQMAFrjMyvhBhG49fN+oF1kxtGqBVu5EA
	 SYhdtW9yhcRXx/TGnSDF/tbNatm0nYrM/EtqpT2LeveNX0lrt5dPMf7z88JnQ+EydB
	 d9SZ08JcY9SyULAkimZ8sKeQQFvOH/6kamPOyPQQ1S0JfbhNOHhdbS1zXCtag1c91v
	 9LA0t+RIPum4jP9yMY925Lces1NppgJwqzpRwZ74ipXuGacXFSolP6505pb2SsDu+S
	 EUH0rZ4T6zV8KZTdbQQUv7fAObAnAErUsK8ytbUGpCjoq17xtSscr4Ye6lg7secdPQ
	 AXjm1UAM7X/8A==
Date: Wed, 2 Jul 2025 00:26:39 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Benno Lossin <lossin@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
Message-ID: <aGRgn9XcfmUDC4Ft@pollux>
References: <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <CAGSQo00eG5oRdN_xORLUyUauLi_vzypU-gz6DSU_FzaAbHRLng@mail.gmail.com>
 <aGQ1VsnFaxBo9zaM@pollux>
 <DB0Z71SF488V.3QURUHHELOY84@kernel.org>
 <3c928a0e-ccd4-4ba0-9f42-9f2bb0203e75@kernel.org>
 <DB0ZJVL0682F.ZNNOXEIDL5NN@kernel.org>
 <DB0ZOHPFJR7T.1W3OF32GDL55O@kernel.org>
 <aGRCM1VRHI8EvZmd@pollux>
 <CAGSQo03nX2cMc0WZQ2YmUKkOLCH_iu9MeQuLSXfCHmNBbuDJ9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo03nX2cMc0WZQ2YmUKkOLCH_iu9MeQuLSXfCHmNBbuDJ9g@mail.gmail.com>

On Tue, Jul 01, 2025 at 02:53:52PM -0700, Matthew Maurer wrote:
> On Tue, Jul 1, 2025 at 1:16 PM Danilo Krummrich <dakr@kernel.org> wrote:
> > On Tue, Jul 01, 2025 at 10:09:10PM +0200, Benno Lossin wrote:
> > > On Tue Jul 1, 2025 at 10:03 PM CEST, Benno Lossin wrote:
> > > > On Tue Jul 1, 2025 at 9:58 PM CEST, Danilo Krummrich wrote:
> > > >> On 7/1/25 9:46 PM, Benno Lossin wrote:
> > > >>> On Tue Jul 1, 2025 at 9:21 PM CEST, Danilo Krummrich wrote:
> > > >>>> On Tue, Jul 01, 2025 at 11:11:13AM -0700, Matthew Maurer wrote:
> > > >>>>> If we implement *only* pinned files, we run into an additional problem
> > > >>>>> - you can't easily extend a pinned vector. This means that you cannot
> > > >>>>> have dynamically created devices unless you're willing to put every
> > > >>>>> new `File` into its own `Box`, because you aren't allowed to move any
> > > >>>>> of the previously allocated `File`s for a resize.
> > > >>>>>
> > > >>>>> Where previously you would have had
> > > >>>>>
> > > >>>>> ```
> > > >>>>> debug_files: Vec<File>
> > > >>>>> ```
> > > >>>>>
> > > >>>>> you would now have
> > > >>>>>
> > > >>>>> ```
> > > >>>>> debug_files: Vec<PinBox<File<T>>>
> > > >>>>> ```
> > > >>>>
> > > >>>> Stuffing single File instances into a Vec seems like the wrong thing to do.
> > > >>>>
> > > >>>> Instead you may have instances of some data structure that is created
> > > >>>> dynamically in your driver that you want to expose through debugfs.
> > > >>>>
> > > >>>> Let's say you have (userspace) clients that can be registered arbitrarily, then
> > > >>>> you want a Vec<Client>, which contains the client instances. In order to provide
> > > >>>> information about the Client in debugfs you then have the client embed things as
> > > >>>> discussed above.
> > > >>>>
> > > >>>>  struct Client {
> > > >>>>     id: File<ClientId>,
> > > >>>>     data: File<ClientData>,
> > > >>>>     ...
> > > >>>>  }
> > > >>>>
> > > >>>> I think that makes much more sense than keeping a Vec<Arc<Client>> *and* a
> > > >>>> Vec<File> separately. Also, note that with the above, your Client instances
> > > >>>> don't need to be reference counted anymore.
> > > >>>>
> > > >>>> I think this addresses the concerns below.
> > > >>>
> > > >>> You still have the issue that `Client` now needs to be pinned and the
> > > >>> vector can't be resized. But if you know that it's bounded, then we
> > > >>> could just make `Pin<Vec<T>>` work as expected (not relocating the
> > > >>> underlying allocation by not exposing `push`, only
> > > >>> `push_within_capacity`).
> > > >>>
> > > >>> We also could have a `SegmentedVec<T>` that doesn't move elements.
> > > >>> Essentially it is
> > > >>>
> > > >>>      enum SegmentedVec<T> {
> > > >>>          Cons(Segment<T>, KBox<SegmentedVec<T>>)
> > > >>>          Nul,
> > > >>>      }
> > > >>>
> > > >>>      struct Segment<T> {
> > > >>>          elements: [T; 16]
> > > >>>      }
> > > >>>
> > > >>> or make the segments variable-sized and grow them accordingly.
> > > >>
> > > >> That sounds a lot like the perfect application for XArray. :)
> > > >
> > > > Haha I didn't know this already existed in the kernel :) Yeah then we
> > > > should make XArray work for this use-case.
> > >
> > > Ah wait, I meant for `SegmentedVec<T>` to store multiple `T` in the same
> > > allocation, so it would only grow sometimes and amortize the allocations
> > > just like `Vec`. It seems to me that XArray only stores pointers, so you
> > > have to box everything (which we're trying to avoid IIUC).
> >
> > Yes, that sounds good. And if the potential number of Client instances can get
> > pretty large Vec isn't a good choice anyways. If we really get a ton of clients,
> > they should be allocated with a kmem_cache and stored in an XArray, maple tree,
> > etc.
> 
> OK. I've outlined why I disagree, but it sounds like consensus here is that:
> 1. You want a `File<T>` that implements `Deref` to expose a `&T`.
> 2. To enable `T` to take on values which are not `ForeignOwnable`, you
> want me to make `create_file` return a `PinInit<File<T>>` (We will
> also grow a `T: Sized` bound here.)
> 
> You are aware that:
> 1. A `File` can no longer be placed in a normal Rust collection, you
> will either need to box it or use a special collection kind.

I don't see why we would want to do that. I can see why we would want to keep a
Vec of some "payload" structure, e.g. some Client structure. But even then,
using a simple resizable array is rarely a good choice.

IMHO there is just no point in optimizing for this case.

If there is anything specific you have in mind, it would be good to share what
that is.

In drivers we have per device allocations, e.g. the driver's private data, the
private data of a class device registration, the private data of a work items,
the private data if an IRQ, etc.

And for cases where we create instances of some struct dynamically, we usually
just go with a new allocation for each new instance and store it in lists, tree
structures, XArray, etc.

Especially, if there can be lots of instances of the same structure, you don't
want to re-allocate all the time and copy things around, but use a kmem_cache
instead.

> 2. Adding or removing DebugFS support for some data in a driver may
> cause more noise (code edits non-local to the debug logic) than
> expected.

I don't agree with that -- forcing a reference count for something that doesn't
need to be reference counted is clearly more "noise" that a few trivial
changes, such as:

- foo: Foo,
+ foo: debugfs::File<Foo>,

> The one thing I still don't see a consensus on:
> 
> What do you want me to do about standard traits for `File`? If we're
> intending it to be heavily used throughout structs, we'll effectively
> break `#[derive]` if I don't add support. For example, if we had
> ```
> #[derive(Debug, PartialEq)]
> struct FooAttrs {
>   name: String,
>   size: usize,
> }
> // In my current patch world someone adds `File`, it's by putting
> `FooAttrs` into an `Arc` and passing that into `create_file`, no
> modifications to the structure are made.
> ```
> before, we have an obvious semantics for this. If someone adds `File`
> with the new API, we get
> ```
> #[derive(Debug, PartialEq)]
> #[pin_data]
> struct FooAttrs {
>   #[pin]
>   name: File<String>,
>   #[pin]
>   size: File<usize>,
> }
> ```
> 
> This means that for the `#[derive]` to keep working, `File` needs to
> implement these traits. Do we want it to:
> A. Purely delegate, so making this sort of change keeps the same
> behavior of derived traits
> B. Do what makes sense for a `File`, so e.g. Debug might print 'File {
> data: "name_of_foo" }', and PartialEq might test for equality of the
> dentry if not an error
> 
> I'm guessing you want A, but I've been through so many API reworks at
> this point that I wanted to ask in case there's  disagreement here.

I understand that -- and thanks for your work on this, I really appreciate it!

Regarding the question: Yes, I'm clearly all for A, I don't think there's much
value in B.
