Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEDE281531;
	Tue,  1 Jul 2025 19:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751397724; cv=none; b=VrnL2UL2IUjrcIRBlhKz3QUqVZ+xqfY3vSpNFxllmJ1Hwo2UnC1zV6mvWaAkLz7BO4kZ00zCXBtwGIYKS65Z19dhot8zLp1FT9y1/wB6Qu4MSH0F91/sNDv2CCcp4OClcYfOiruxHAFVb9aGzQBkekfWMrXZJOTM9j39U/705n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751397724; c=relaxed/simple;
	bh=ST2RgdeIyyyhU3FRs3nOSgs/LaNPxrC7dvyn1N8zu7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAiAmj4BDr2j1+vJvw0YNFqd1riG6PHyDC08P8z1KeBBGts3hfoOdeSZlN0HSZbsJ6ovxdGUfI67GYzC2WWNgIZuJvxydgPDlmBFfopWCZ8FiTMxEB+COrPdKAUVjZzueDSuCY7nYSoiznuquMl2fv26SrETS/1ACkHddFH1Qso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fk1EpfXC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fk1EpfXC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03854C4CEEB;
	Tue,  1 Jul 2025 19:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751397724;
	bh=ST2RgdeIyyyhU3FRs3nOSgs/LaNPxrC7dvyn1N8zu7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fk1EpfXC3T0JGwSnDC/3z3NiqCD1i6tpFuqPUGNOHOF8TtiQShSMyhTFVKTzJfytD
	 kJ5qlzR8rd5qmOjp1plId5ZtW3E5KEkM6M6rCLgjECSAnbs2aNXoAlHaRM+nqyfqNy
	 ajoHNPvnGDYoFLW2i2ha7y8TiqTQNJoHnN21e85RjWZtOnFBkX+JfsOo950Jo9ubD1
	 OrT7ES5UclajoFE98qHQTedf4elPOym/2vB0wzKlBdFPMws1Vbgd5l+XQtw5Bu5kSR
	 50XgdGvB2qzFcWCUOfLCnFw4YZW7vPlk6BKJ36gbfXgwlXAWmrBl1hOys0lThyN7C3
	 HTxWCIia8wyow==
Date: Tue, 1 Jul 2025 21:21:58 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
Message-ID: <aGQ1VsnFaxBo9zaM@pollux>
References: <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
 <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux>
 <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux>
 <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <CAGSQo00eG5oRdN_xORLUyUauLi_vzypU-gz6DSU_FzaAbHRLng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo00eG5oRdN_xORLUyUauLi_vzypU-gz6DSU_FzaAbHRLng@mail.gmail.com>

On Tue, Jul 01, 2025 at 11:11:13AM -0700, Matthew Maurer wrote:
> On Tue, Jul 1, 2025 at 8:10 AM Danilo Krummrich <dakr@kernel.org> wrote:
> >
> > On Tue, Jul 01, 2025 at 04:21:56PM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Jul 01, 2025 at 04:13:28PM +0200, Danilo Krummrich wrote:
> > > > On Tue, Jul 01, 2025 at 03:58:45PM +0200, Greg Kroah-Hartman wrote:
> > > > > On Mon, Jun 30, 2025 at 08:16:55PM +0200, Danilo Krummrich wrote:
> > > > > > On Mon, Jun 30, 2025 at 10:49:51AM -0700, Matthew Maurer wrote:
> > > > > > > On Mon, Jun 30, 2025 at 10:39 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > > > > >
> > > > > > > > On 6/30/25 7:34 PM, Matthew Maurer wrote:
> > > > > > > > > On Mon, Jun 30, 2025 at 10:30 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > > > > > >>
> > > > > > > > >> On 6/28/25 1:18 AM, Matthew Maurer wrote:
> > > > > > > > >>> +    fn create_file<D: ForeignOwnable>(&self, _name: &CStr, data: D) -> File
> > > > > > > > >>> +    where
> > > > > > > > >>> +        for<'a> D::Borrowed<'a>: Display,
> > > > > > > > >>> +    {
> > > > > > > > >>> +        File {
> > > > > > > > >>> +            _foreign: ForeignHolder::new(data),
> > > > > > > > >>> +        }
> > > > > > > > >>>        }
> > > > > > > > >>
> > > > > > > > >> What's the motivation for the ForeignHolder abstraction? Why not just make it
> > > > > > > > >> File<D> and store data directly?
> > > > > > > > >
> > > > > > > > > 1. A `File<D>` can't be held in collection data structures as easily
> > > > > > > > > unless all your files contain the *same* backing type.
> > > > > > > >
> > > > > > > > That sounds reasonable.
> > > > > > > >
> > > > > > > > > 2. None of the APIs or potential APIs for `File` care about which type
> > > > > > > > > it's wrapping, nor are they supposed to. If nothing you can do with a
> > > > > > > > > `File` is different depending on the backing type, making it
> > > > > > > > > polymorphic is just needlessly confusing.
> > > > > > > >
> > > > > > > > What if I want to access file.data() and do something with the data? Then I'd
> > > > > > > > necessarily need to put my data in an Arc and reference count it to still be
> > > > > > > > able to access it.
> > > > > > > >
> > > > > > > > That doesn't seem like a reasonable requirement to be able to access data
> > > > > > > > exposed via debugfs.
> > > > > > >
> > > > > > > `pub fn data(&self) -> D` would go against my understanding of Greg's
> > > > > > > request for DebugFS files to not really support anything other than
> > > > > > > delete. I was even considering making `D` not be retained in the
> > > > > > > disabled debugfs case, but left it in for now for so that the
> > > > > > > lifecycles wouldn't change.
> > > > > >
> > > > > > Well, that's because the C side does not have anything else. But the C side has
> > > > > > no type system that deals with ownership:
> > > > > >
> > > > > > In C you just stuff a pointer of your private data into debugfs_create_file()
> > > > > > without any implication of ownership. debugfs has a pointer, the driver has a
> > > > > > pointer. The question of the ownership semantics is not answered by the API, but
> > > > > > by the implementation of the driver.
> > > > > >
> > > > > > The Rust API is different, and it's even implied by the name of the trait you
> > > > > > expect the data to implement: ForeignOwnable.
> > > > > >
> > > > > > The File *owns* the data, either entirely or a reference count of the data.
> > > > > >
> > > > > > If the *only* way to access the data the File now owns is by making it reference
> > > > > > counted, it:
> > > > > >
> > > > > >   1) Is additional overhead imposed on users.
> > > > > >
> > > > > >   2) It has implications on the ownership design of your driver. Once something
> > > > > >      is reference counted, you loose the guarantee the something can't out-live
> > > > > >      some event.
> > > > > >
> > > > > > I don't want that people have to stuff their data structures into Arc (i.e.
> > > > > > reference count them), even though that's not necessary. It makes it easy to
> > > > > > make mistakes. Things like:
> > > > > >
> > > > > >         let foo = bar.clone();
> > > > > >
> > > > > > can easily be missed in reviews, whereas some contributor falsely changing a
> > > > > > KBox to an Arc is much harder to miss.
> > > > > >
> > > > > > > If you want a `.data()` function, I can add it in,
> > > > > >
> > > > > > I think it could even be an implementation of Deref.
> > > > > >
> > > > > > > but I don't think
> > > > > > > it'll improve flexibility in most cases. If you want to do something
> > > > > > > with the data and it's not in an `Arc` / behind a handle of some kind,
> > > > > > > you'll need something providing threadsafe interior mutability in the
> > > > > > > data structure. If that's a lock, then I have a hard time believing
> > > > > > > that `Arc<Mutex<T>>`(or if it's a global, a `&'static Mutex<T>`, which
> > > > > > > is why I added that in the stack) is so much more expensive than
> > > > > > > `Box<Mutex<T>>` that it's worth a more complex API. If it's an atomic,
> > > > > > > e.g. `Arc<AtomicU8>`, then I can see the benefit to having
> > > > > > > `Box<AtomicU8>` over that, but it still seems so slim that I think the
> > > > > > > simpler "`File` is just a handle to how long the file stays alive, it
> > > > > > > doesn't let you do anything else" API makes sense.
> > > > > >
> > > > > > I don't really see what is complicated about File<T> -- it's a File and it owns
> > > > > > data of type T that is exposed via debugfs. Seems pretty straight forward to me.
> > > > > >
> > > > > > Maybe the performance cost is not a huge argument here, but maintainability in
> > > > > > terms of clarity about ownership and lifetime of an object as explained above
> > > > > > clearly is.
> 
> The part that is not straightforward is that the primary purpose of
> `T` may not be "to be exposed via DebugFS", and leaves us in the
> unusual world where DebugFS (or at least our bindings to it) are
> load-bearing in builds that have DebugFS disabled. It can work, but it
> definitely seems confusing and is privileging DebugFS holding a
> reference to a data structure over other things holding a reference to
> it.

The purpose of File<T> is that with an instance of File<T> you can access the T.
This is totally normal. You give the file ownership of some T and you still want
to be able to access this T the File instance has ownership of.

It's not load-bearing at all in builds that have debugfs disabled; there is
zero overhead. When compiled without debugfs File<T>'s only member is the data
itself. In fact, it's even slighly less, since the T can be a KBox<U> rather
than an Arc<U>.

> > > > >
> > > > > I'm agreeing here.  As one of the primary users of this api is going to
> > > > > be a "soc info" module, like drivers/soc/qcom/socinfo.c, I tried to make
> > > > > an example driver to emulate that file with just a local structure, but
> > > > > the reference counting and access logic just didn't seem to work out
> > > > > properly.  Odds are I'm doing something stupid though...
> 
> I have a version of this that works with my initial driver, and keep
> intending to revise it to work on top of the new one, but I keep
> getting requests for API changes before I get around to reworking it
> ;)
> 
> The way I intended my `ForeignOwnable` variant of this to work was
> that I would have a *single* struct that contained all the scanned
> data. For the socinfo module, we know how big this could be, so we
> could put this as a `static` in the module, in which case we'd have
> `&'static MyInfo`. If we didn't want to do that or didn't know, we'd
> produce an `Arc<MyInfo>`. Then, for each file, we'd create a file that
> passed in either `my_arc_info.clone()` or `my_info` if we had the
> static reference, with the functions that do the printing
> distinguishing the behavior of each file.
> 
> Doing the file-owns-the-specific-field version *could* work, but means
> that the debugfs tree code would be interleaved with the calls to
> parsing code, or that we'd need two copies of the struct, an initial
> one with all the parsed data, and a follow-up one that has has them
> all wrapped in `File`.

Why can't you do the latter right away?

> > > >
> > > > I think it technically works, but it imposes semantics on drivers that we
> > > > shouldn't do; see the example below.
> > > >
> > > > > So a file callback IS going to want to have access to the data of type T
> > > > > that is exposed somehow.
> > > >
> > > > With the current API we would need this:
> > > >
> > > >     struct GPU {
> > > >        fw: Arc<Firmware>,
> > > >        fw_file: debugfs::File,
> > > >     }
> > > >
> > > > and then I would initialize it the following way:
> > > >
> > > >     let fw = Arc::new(Firmware::new(), GFP_KERNEL)?;
> > > >     let fw_file = dir.create_file("firmware", fw.clone());
> > > >
> > > >     fw.do_something();
> > > >
> > > > This is bad, because now my Firmware instance in GPU needs to be reference
> > > > counted, even though it should *never* out-live the GPU instance. This is error
> > > > prone.
> 
> If `Firmware` outliving the GPU instance causes a bug, not just a
> resource leak, I'd argue that you should be passing a narrower handle
> to your debugfs file. If it just causes a resource leak, then I'd
> argue that if you leak a resource (the debugfs file itself), then
> leaking a resource is not unexpected.
> 
> For the narrower handle example, consider e.g.
> ```
> struct Firmware {
>   info: Arc<FirmwareInfo>,
>   my_handle: Handle // Some handle whose drop is load bearing
> }
> // ...
> let fw: Firmware = build_fw()?;
> let fw_file = fw.info.clone();
> fw.do_something();
> ```

Sorry, but that really looks like a bad workaround. Now I have an additional
allocation and a reference counted FirmwareInfo instance for no reason, other
than debugfs imposing a bad API on users. :(

In more complicated cases, this could be lots of additional allocations and
reference counted structures just because of debugfs.

> > >
> > > Agreed, AND you just created a new fw structure that you really didn't
> > > need, wasting memory.
> >
> > In case you refer to fw.clone(), since fw is an Arc<Firmware>, clone() just
> > creates a new reference count to the same object.
> >
> > > > Instead this should just be:
> > > >
> > > >     struct GPU {
> > > >        fw: debugfs::File<Firmware>,
> > > >     }
> > > >
> > > > and then I would initialize it the following way:
> > > >
> > > >     let fw = KBox::new(Firmware::new(), GFP_KERNEL)?;
> > > >     let file = dir.create_file("firmware", fw);
> > > >
> > > >     // debugfs::File<Firmware> dereferences to Firmware
> > > >     file.do_something();
> > > >
> > > >     // Access to fw is prevented by the compiler, since it has been moved
> > > >     // into file.
> > > >
> > > > This is much better, since now I have the guarantee that my Firmare instance
> > > > can't out-live the GPU instance.
> > >
> > > That's better, yes, but how would multiple files for the same
> > > "structure" work here?  Like a debugfs-file-per-field of a structure
> > > that we often have?
> 
> This seems odd to me because with this model the DebugFS file itself
> becomes deeply involved with the ownership of the devices or other
> data.

This is already the case with this version on the mailing list. You're passing
*ForeignOwnable* data to the File, which the File instance subsequently owns.

There is zero difference in ownership, the difference is that File<T> allows you
to access the data it owns, whereas just File does not, which makes it necessary
to use an Arc.

> There are a few issues I think this creates:
> 1. It discourages file-per-field, because you can no longer have the
> DebugFS file uniquely own something, which you're now trying to
> encourage. This seems likely to result in people having debugfs files
> that render out structured data, which I think we generally don't
> want?

That's what I proposed the pin-init solution below for.

> 2. If I have a module and want to add a new DebugFS file to it, the
> change will edit the core structures of the drivers rather than just
> adding an auxiliary field. This is partially remedied if we make
> `File<D>` implement `Deref<Target=D>`.

So, you're arguing that changing

	struct Foo {
	   bar: Bar,
	}

to

	struct Foo {
	   bar: Arc<Bar>,
	   bar_file: debugfs::File,
	}

is better than

	struct Foo {
	   bar: debugfs::File<Bar>,
	}

correct? If so, I really have to disagree.

> It will still either incur
> churn or imprecision around commonly derived traits like equality and
> debug. If I have `#[derive(PartialEq)]` on my struct including
> `DeviceData`, and then I wrap that into a `File<DeviceData>`, we'll
> get stuck with a quandry:
>   a. Should files `x == y` if the underlying private data is equal?
> This has the benefit of preserving the behavior of the derive, but
> means that distinct files may compare equal if they have the same
> contents.
>   b. Should files `x == y` only be true if the underlying *file* is
> the same? This seems logical for *file* equality, but will break
> equality on the field or structures including it.

Why would you even compare two File instances? If your T implements PartialEq,
and you want to compare it with some other T just use the
ForeignOwnable::Borrowed you get from dereferencing the File.

>   This will also be an incompatible change for anyone already using an
> explicit `.deref()` or an explicit `impl Deref<Target = T>` method to
> work with the field, because while deref coercion will automatically
> chain, `impl Deref<Target = T>` *cannot* automatically chain.

Seems like a pretty minor concern, but if you want you can still do the Arc
dance in your driver, no?

> 3. If you create an object specifically for debugging, then it will
> *have* to be created and kept around even if DebugFS is disabled,
> because we can't tell whether the user is relying on its existence.
> (My current implementation keeps it around in that case as well, but
> that's not guaranteed or required - we could cause it to just
> immediately drop data that someone tried to attach.) This means that
> rather than relying on the API to determine whether the information is
> needed, the modules will need to check the config if they want to get
> rid of it.

This is only half the truth, since this is *only* the case if you don't need to
access the data you move into the File, since otherwise you have to keep an Arc
around.

> >
> > That is a very good question and I thought about this as well, because with only
> > the current API this would require us to have more and more dynamic allocations
> > if we want to have a more fine grained filesystem representations of structures.
> >
> > The idea I have for this is to use pin-init, which we do in quite some other
> > places as well.
> >
> > I think we can add an additional API like this:
> >
> >         impl Dir {
> >            pub fn create_file<T>(&self, data: impl PinInit<T>) -> impl PinInit<Self> {
> >               pin_init!(Self {
> >                  data <- data,
> >                  ...
> >               })
> >            }
> >         }
> >
> > This allows us to do things like:
> >
> >         #[pin_data]
> >         struct Firmware {
> >            #[pin]
> >            minor: debugfs::File<u32>,
> >            #[pin]
> >            major: debugfs::File<u32>,
> >            #[pin]
> >            buffer: debugfs::File<[u8]>,
> 
> Nit: This can't work, because a `&[u8]` is double-width, and we only
> get to send one pointer into the file. We'd need to add a requirement
> `T: Sized` if we really wanted to have `File` embed the data.

Indeed, that was a bad example, let's say Vec<u8> then. :)

> 
> >         }
> >
> >         impl Firmware {
> >            pub fn new(&dir: debugfs::Dir, buffer: [u8]) -> impl PinInit<Self> {
> >               pin_init!(Self {
> >                  minor <- dir.create_file("minor", 1),
> >                  major <- dir.create_file("major", 2),
> >                  buffer <- dir.create_file("buffer", buffer),
> >               })
> >            }
> >         }
> >
> >         // This is the only allocation we need.
> >         let fw = KBox::pin_init(Firmware::new(...), GFP_KERNEL)?;
> >
> > With this everything is now in a single allocation and since we're using
> > pin-init, Dir::create_file() can safely store pointers of the corresponding data
> > in debugfs_create_file(), since this structure is guaranteed to be pinned in
> > memory.
> >
> > Actually, we can also implement *only this*, since with this my previous example
> > would just become this:
> 
> If we implement *only* pinned files, we run into an additional problem
> - you can't easily extend a pinned vector. This means that you cannot
> have dynamically created devices unless you're willing to put every
> new `File` into its own `Box`, because you aren't allowed to move any
> of the previously allocated `File`s for a resize.
> 
> Where previously you would have had
> 
> ```
> debug_files: Vec<File>
> ```
> 
> you would now have
> 
> ```
> debug_files: Vec<PinBox<File<T>>>
> ```

Stuffing single File instances into a Vec seems like the wrong thing to do.

Instead you may have instances of some data structure that is created
dynamically in your driver that you want to expose through debugfs.

Let's say you have (userspace) clients that can be registered arbitrarily, then
you want a Vec<Client>, which contains the client instances. In order to provide
information about the Client in debugfs you then have the client embed things as
discussed above.

	struct Client {
	   id: File<ClientId>,
	   data: File<ClientData>,
	   ...
	}

I think that makes much more sense than keeping a Vec<Arc<Client>> *and* a
Vec<File> separately. Also, note that with the above, your Client instances
don't need to be reference counted anymore.

I think this addresses the concerns below.

> If it's easy to use the model you described earlier where the sole
> owner of the data is the debugfs file, then this is mostly fine,
> because to use the old version, you'd already have it live in a
> `ForeignOwnable`, which most likely means its own allocation. However,
> if you're already forced into an environment where the objects you're
> embedding into a file are reference counted, you now have an extra
> allocation required for every `File`. Because the `File` has to be
> able to respond to `data()`, we also won't have these `File`s truncate
> to zero size in the no debugfs scenario.
> 
> This means that if you want a `File` to render an object that is
> reference counted, and they're dynamically created and destroyed, you
> will now be required to incur an allocation per file, even when
> DebugFS is disabled.
> 
> >
> >         struct GPU {
> >            fw: debugfs::File<Firmware>,
> >         }
> >
> >         let file = dir.create_file("firmware", Firmware::new());
> >         let file = KBox::pin_init(file, GFP_KERNEL)?;
> >
> >         // debugfs::File<Firmware> dereferences to Firmware
> >         file.do_something();
> >
> > Given that, I think we should change things to use pin-init right away for the
> > debugfs::File API.
