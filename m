Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2D626B755;
	Tue,  1 Jul 2025 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379214; cv=none; b=P8Iop3NhAn2iezAR2GsbnOkqEH6uMv6kKuTlr8E1a0oZwF1FCZB7ipMtCVmB5/VO4e0pa1Js6vAhxH6DR/VxCuTj343ROyc7XDIGOYz/XYAPw2Ruvsu0nGe8eUCrh9pQa3qmI2ny1nLtktufNgfBKpZYEtZHGQuRfpxTpJ0t8jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379214; c=relaxed/simple;
	bh=ejNCJrGeZ840INFu4aRU4k1z8l9jPRAACDCPDOm626k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpqmzKupTfT92qup3t8X4AoxHyD8neuy3EfXgDBp9fFDSBx7gAYeqgZl2oPLUcs9nA6+73wt5el5PFR22ZQM+w7CRfZzrU7UDOCeosEbjeiWjzoq0/5h/wr3ND4NxebK6DICsXmJKZ3dEU1HK1260LFuKTmLb4sqsgqb/lJ8KIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWvsL833; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWvsL833"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14E3C4CEEB;
	Tue,  1 Jul 2025 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751379213;
	bh=ejNCJrGeZ840INFu4aRU4k1z8l9jPRAACDCPDOm626k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWvsL833I+fRC/ksA2li60IhV1BV8QCAfyXQpgNFObMm2edNZo9zDKXEgfr5FnMLh
	 WRkHct8A1GIBCLubBvCgj98KFcyiMuTdKIonUjv7iwLt8noTMlLbZnNv9wG/AQLwvB
	 ee9R15y5XjmaDa1RRMERufUGZl5ioSwj/cm7O33s/UqO52sizAJgfDZQBzj9nPCBm6
	 X4qtDO9Fleiw96r6XmYJLg5vN00Ijhx2RhzQDrlHrsdeDfBHET7t3HLQUESysAuajc
	 G/q6RiPhVh+it1TPfghmd0SnE03CtkKxNKi1ALhHh1c8nYMb2W5Br//RHSo7nKzydL
	 wStXQ2Bk5vmxQ==
Date: Tue, 1 Jul 2025 16:13:28 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
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
Message-ID: <aGPtCBB6nWTNJuwK@pollux>
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-4-c6526e413d40@google.com>
 <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
 <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux>
 <2025070131-icon-quarters-0c16@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025070131-icon-quarters-0c16@gregkh>

On Tue, Jul 01, 2025 at 03:58:45PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jun 30, 2025 at 08:16:55PM +0200, Danilo Krummrich wrote:
> > On Mon, Jun 30, 2025 at 10:49:51AM -0700, Matthew Maurer wrote:
> > > On Mon, Jun 30, 2025 at 10:39 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > >
> > > > On 6/30/25 7:34 PM, Matthew Maurer wrote:
> > > > > On Mon, Jun 30, 2025 at 10:30 AM Danilo Krummrich <dakr@kernel.org> wrote:
> > > > >>
> > > > >> On 6/28/25 1:18 AM, Matthew Maurer wrote:
> > > > >>> +    fn create_file<D: ForeignOwnable>(&self, _name: &CStr, data: D) -> File
> > > > >>> +    where
> > > > >>> +        for<'a> D::Borrowed<'a>: Display,
> > > > >>> +    {
> > > > >>> +        File {
> > > > >>> +            _foreign: ForeignHolder::new(data),
> > > > >>> +        }
> > > > >>>        }
> > > > >>
> > > > >> What's the motivation for the ForeignHolder abstraction? Why not just make it
> > > > >> File<D> and store data directly?
> > > > >
> > > > > 1. A `File<D>` can't be held in collection data structures as easily
> > > > > unless all your files contain the *same* backing type.
> > > >
> > > > That sounds reasonable.
> > > >
> > > > > 2. None of the APIs or potential APIs for `File` care about which type
> > > > > it's wrapping, nor are they supposed to. If nothing you can do with a
> > > > > `File` is different depending on the backing type, making it
> > > > > polymorphic is just needlessly confusing.
> > > >
> > > > What if I want to access file.data() and do something with the data? Then I'd
> > > > necessarily need to put my data in an Arc and reference count it to still be
> > > > able to access it.
> > > >
> > > > That doesn't seem like a reasonable requirement to be able to access data
> > > > exposed via debugfs.
> > > 
> > > `pub fn data(&self) -> D` would go against my understanding of Greg's
> > > request for DebugFS files to not really support anything other than
> > > delete. I was even considering making `D` not be retained in the
> > > disabled debugfs case, but left it in for now for so that the
> > > lifecycles wouldn't change.
> > 
> > Well, that's because the C side does not have anything else. But the C side has
> > no type system that deals with ownership:
> > 
> > In C you just stuff a pointer of your private data into debugfs_create_file()
> > without any implication of ownership. debugfs has a pointer, the driver has a
> > pointer. The question of the ownership semantics is not answered by the API, but
> > by the implementation of the driver.
> > 
> > The Rust API is different, and it's even implied by the name of the trait you
> > expect the data to implement: ForeignOwnable.
> > 
> > The File *owns* the data, either entirely or a reference count of the data.
> > 
> > If the *only* way to access the data the File now owns is by making it reference
> > counted, it:
> > 
> >   1) Is additional overhead imposed on users.
> > 
> >   2) It has implications on the ownership design of your driver. Once something
> >      is reference counted, you loose the guarantee the something can't out-live
> >      some event.
> > 
> > I don't want that people have to stuff their data structures into Arc (i.e.
> > reference count them), even though that's not necessary. It makes it easy to
> > make mistakes. Things like:
> > 
> > 	let foo = bar.clone();
> > 
> > can easily be missed in reviews, whereas some contributor falsely changing a
> > KBox to an Arc is much harder to miss.
> > 
> > > If you want a `.data()` function, I can add it in,
> > 
> > I think it could even be an implementation of Deref.
> > 
> > > but I don't think
> > > it'll improve flexibility in most cases. If you want to do something
> > > with the data and it's not in an `Arc` / behind a handle of some kind,
> > > you'll need something providing threadsafe interior mutability in the
> > > data structure. If that's a lock, then I have a hard time believing
> > > that `Arc<Mutex<T>>`(or if it's a global, a `&'static Mutex<T>`, which
> > > is why I added that in the stack) is so much more expensive than
> > > `Box<Mutex<T>>` that it's worth a more complex API. If it's an atomic,
> > > e.g. `Arc<AtomicU8>`, then I can see the benefit to having
> > > `Box<AtomicU8>` over that, but it still seems so slim that I think the
> > > simpler "`File` is just a handle to how long the file stays alive, it
> > > doesn't let you do anything else" API makes sense.
> > 
> > I don't really see what is complicated about File<T> -- it's a File and it owns
> > data of type T that is exposed via debugfs. Seems pretty straight forward to me.
> > 
> > Maybe the performance cost is not a huge argument here, but maintainability in
> > terms of clarity about ownership and lifetime of an object as explained above
> > clearly is.
> 
> I'm agreeing here.  As one of the primary users of this api is going to
> be a "soc info" module, like drivers/soc/qcom/socinfo.c, I tried to make
> an example driver to emulate that file with just a local structure, but
> the reference counting and access logic just didn't seem to work out
> properly.  Odds are I'm doing something stupid though...

I think it technically works, but it imposes semantics on drivers that we
shouldn't do; see the example below.

> So a file callback IS going to want to have access to the data of type T
> that is exposed somehow.

With the current API we would need this:

	struct GPU {
	   fw: Arc<Firmware>,
	   fw_file: debugfs::File,
	}

and then I would initialize it the following way:

	let fw = Arc::new(Firmware::new(), GFP_KERNEL)?;
	let fw_file = dir.create_file("firmware", fw.clone());

	fw.do_something();

This is bad, because now my Firmware instance in GPU needs to be reference
counted, even though it should *never* out-live the GPU instance. This is error
prone.

Instead this should just be:

	struct GPU {
	   fw: debugfs::File<Firmware>,
	}

and then I would initialize it the following way:

	let fw = KBox::new(Firmware::new(), GFP_KERNEL)?;
	let file = dir.create_file("firmware", fw);

	// debugfs::File<Firmware> dereferences to Firmware
	file.do_something();

	// Access to fw is prevented by the compiler, since it has been moved
	// into file.

This is much better, since now I have the guarantee that my Firmare instance
can't out-live the GPU instance.
