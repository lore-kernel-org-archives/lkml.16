Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF532DE713;
	Thu,  3 Jul 2025 11:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542916; cv=none; b=YnCTR4XnxSQmx/0bcro0i4qqDK+joHThwGCJDGizM1gGzjU+rJuLaq4Djy/kbyekUPNyPqFthV4jP+42Eg3/keXXUZau8c/fwRxNfDenMLreCzgr520CchkCNiCGGirMcGns8vj4zHDIZZMbuiHLbkDvYiNKHAsMVacW5yW3Lb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542916; c=relaxed/simple;
	bh=D/Ym6RYmv823XmO3ORXAntlc3sWVVpbHq7uzyYrTGOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUAPg4wCS1vErJ+4IxciroA072U7lj+bKmAQ0mVP2TVeLouQ0lCXLvf5GG0yCI2Zc8Sw3wxkLUBkTe7/Fhd9erZDmQJTjIOl2CrwwVIzbXQWv6eGEq5nBk4Bl4kkrAJwkdguvYua0brbs0NTDv0mjBbD/YpLpzXROek0wCWVLDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Kqlu1KmT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kqlu1KmT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638BDC4CEE3;
	Thu,  3 Jul 2025 11:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751542916;
	bh=D/Ym6RYmv823XmO3ORXAntlc3sWVVpbHq7uzyYrTGOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kqlu1KmTspCigZhmSjUb8oupFSm5lltgb/v3H2ZDkAJdl0sXdQHsbr3ljrlKeTX21
	 dSz5H4ReLn58TqEIlKvOVFA4/4FoSAOFIcn+PT8OcuM8e9xGROcAvyET3KRKqL8pJs
	 LYR6Ta0tOTBXWWkB0C/xjiA20B3rH5jO0ltDww5E=
Date: Thu, 3 Jul 2025 13:41:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Benno Lossin <lossin@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
Message-ID: <2025070349-tricky-arguable-5362@gregkh>
References: <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
 <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux>
 <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux>
 <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux>
 <aGZVUqangIR-c4aW@google.com>
 <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
 <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>

On Thu, Jul 03, 2025 at 12:54:18PM +0200, Alice Ryhl wrote:
> On Thu, Jul 3, 2025 at 12:33 PM Benno Lossin <lossin@kernel.org> wrote:
> >
> > On Thu Jul 3, 2025 at 12:02 PM CEST, Alice Ryhl wrote:
> > > On Tue, Jul 01, 2025 at 05:10:47PM +0200, Danilo Krummrich wrote:
> > >> On Tue, Jul 01, 2025 at 04:21:56PM +0200, Greg Kroah-Hartman wrote:
> > >> > On Tue, Jul 01, 2025 at 04:13:28PM +0200, Danilo Krummrich wrote:
> > >> > > Instead this should just be:
> > >> > >
> > >> > >  struct GPU {
> > >> > >     fw: debugfs::File<Firmware>,
> > >> > >  }
> > >> > >
> > >> > > and then I would initialize it the following way:
> > >> > >
> > >> > >  let fw = KBox::new(Firmware::new(), GFP_KERNEL)?;
> > >> > >  let file = dir.create_file("firmware", fw);
> > >> > >
> > >> > >  // debugfs::File<Firmware> dereferences to Firmware
> > >> > >  file.do_something();
> > >> > >
> > >> > >  // Access to fw is prevented by the compiler, since it has been moved
> > >> > >  // into file.
> > >> > >
> > >> > > This is much better, since now I have the guarantee that my Firmare instance
> > >> > > can't out-live the GPU instance.
> > >> >
> > >> > That's better, yes, but how would multiple files for the same
> > >> > "structure" work here?  Like a debugfs-file-per-field of a structure
> > >> > that we often have?
> > >>
> > >> That is a very good question and I thought about this as well, because with only
> > >> the current API this would require us to have more and more dynamic allocations
> > >> if we want to have a more fine grained filesystem representations of structures.
> > >>
> > >> The idea I have for this is to use pin-init, which we do in quite some other
> > >> places as well.
> > >>
> > >> I think we can add an additional API like this:
> > >>
> > >>      impl Dir {
> > >>         pub fn create_file<T>(&self, data: impl PinInit<T>) -> impl PinInit<Self> {
> > >>            pin_init!(Self {
> > >>               data <- data,
> > >>               ...
> > >>            })
> > >>         }
> > >>      }
> > >>
> > >> This allows us to do things like:
> > >>
> > >>      #[pin_data]
> > >>      struct Firmware {
> > >>         #[pin]
> > >>         minor: debugfs::File<u32>,
> > >>         #[pin]
> > >>         major: debugfs::File<u32>,
> > >>         #[pin]
> > >>         buffer: debugfs::File<[u8]>,
> > >>      }
> > >>
> > >>      impl Firmware {
> > >>         pub fn new(&dir: debugfs::Dir, buffer: [u8]) -> impl PinInit<Self> {
> > >>            pin_init!(Self {
> > >>               minor <- dir.create_file("minor", 1),
> > >>               major <- dir.create_file("major", 2),
> > >>               buffer <- dir.create_file("buffer", buffer),
> > >>            })
> > >>         }
> > >>      }
> > >>
> > >>      // This is the only allocation we need.
> > >>      let fw = KBox::pin_init(Firmware::new(...), GFP_KERNEL)?;
> > >>
> > >> With this everything is now in a single allocation and since we're using
> > >> pin-init, Dir::create_file() can safely store pointers of the corresponding data
> > >> in debugfs_create_file(), since this structure is guaranteed to be pinned in
> > >> memory.
> > >>
> > >> Actually, we can also implement *only this*, since with this my previous example
> > >> would just become this:
> > >>
> > >>      struct GPU {
> > >>         fw: debugfs::File<Firmware>,
> > >>      }
> > >>
> > >>      let file = dir.create_file("firmware", Firmware::new());
> > >>      let file = KBox::pin_init(file, GFP_KERNEL)?;
> > >>
> > >>      // debugfs::File<Firmware> dereferences to Firmware
> > >>      file.do_something();
> > >>
> > >> Given that, I think we should change things to use pin-init right away for the
> > >> debugfs::File API.
> > >
> > > Does this actually work in practice for anything except immutable data?
> > > I mean, let's take Rust Binder as an example and lets say that I want to
> > > expose a directory for each Process object with some of the fields
> > > exposed. Let's just simplify Rust Binder a bit and only include some of
> > > the fields:
> > >
> > > #[pin_data]
> > > struct Process {
> > >     task: ARef<Task>,
> > >     #[pin]
> > >     inner: SpinLock<ProcessInner>,
> > > }
> > >
> > > pub(crate) struct ProcessInner {
> > >     threads: RBTree<i32, Arc<Thread>>,
> > >     nodes: RBTree<u64, DArc<Node>>,
> > >     requested_thread_count: u32,
> > >     max_threads: u32,
> > >     started_thread_count: u32,
> > > }
> > >
> > > Rust Binder already does expose some debugging data through a file
> > > system, though it doesn't do so using debugfs. It exposes a lot of data,
> > > but among them are the pid, the number of threads and nodes, as well as
> > > the values of requested_thread_count, started_thread_count, and
> > > max_threads.
> > >
> > > Now, we run into problem number one: pinning is not supported inside
> > > mutexes. But let's say we solved that and we could do this:
> > >
> > > #[pin_data]
> > > struct Process {
> > >     task: File<ARef<Task>>, // prints the pid
> > >     #[pin]
> > >     inner: SpinLock<ProcessInner>,
> > > }
> > >
> > > pub(crate) struct ProcessInner {
> > >     threads: File<RBTree<i32, Arc<Thread>>>, // prints the count
> > >     nodes: File<RBTree<u64, DArc<Node>>>, // prints the count
> > >     requested_thread_count: File<u32>,
> > >     max_threads: File<u32>,
> > >     started_thread_count: File<u32>,
> > > }
> > >
> > > However, this still doesn't work! Debugfs may get triggered at any time
> > > and need to read these fields, and there's no way for it to take the
> > > spinlock with the above design - it doesn't know where the spinlock is.
> > > For the integers I guess we could make them atomic to allow reading them
> > > in parallel with mutation, but that option is not available for the
> > > red/black trees.
> > >
> > > What is the intended solution in this case? If the argument is that this
> > > is a rare case, then keep in mind that this is a real-world example of
> > > debugging information that we actually expose today in a real driver.
> > > With Matt's current approach, it's relatively easy - just store a bunch
> > > of File<Arc<Process>> instances somewhere and define each one to take
> > > the mutex and print the relevant value.
> >
> > How would your example look like with the current approach? IIUC, it
> > also wouldn't work, because the debugfs data can't be mutated?
> 
> I would store a bunch of `File<Arc<Process>>` instances somewhere.
> Each one has a closure that takes the spinlock and prints the
> appropriate value.

Ok, I think we need to see some "real" examples here of the api in use
before figuring it out further as I'm totally confused :)

Yes, we need to be able to have a debugfs file callback handle a mutable
structure in order to lock things correctly.  We also need to have it be
mutable so that it can MODIFY the value (everyone seems to forget that
debugfs allows that...)

So how about a platform driver that exposes values read from a platform
device (i.e. a soc info driver), that also includes a
local-to-the-device data structure that can be locked and modified?
That should cover all the use cases that I can think of at the moment.

thanks,

greg k-h
