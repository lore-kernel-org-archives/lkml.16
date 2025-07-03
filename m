Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36CC1B95B;
	Thu,  3 Jul 2025 10:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538789; cv=none; b=Z2jqkhTiQNnNZbW/PNWIxcJx5S/pp3QWKYKMF/GXZ+Kks86DiAnpSVEfEWwgPrSOqHVzhy4XuUu8I2lh1FBY7UiiNfgGmbURKflyNN8H3OdqTt/B3cJLN22tfLFkhe1DOXYuhbqhu2CgEg01uS8+rW0tGGSRdj21WF3vWJYUAA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538789; c=relaxed/simple;
	bh=DCKCqNWcF4C3UNxmiDgWt4D/5CN0jW3TbzdVETnuqBM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=k8CKRnPpHTUkee0lwZ/Ura/jaQYese9VqLPpIB/6TlAg+Xf04/P8MLCv7y8ywkk22Kanfuw0nRSN8PUx+XqmsKafUQcK7PVO8oc8g4BtFZ3rAVsZXVyERjn6+scMpVfHRrFlVVo84pnv8wu+kSygcKdRkTUMr21/SP8BQQSZCoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ayiLL1Ar; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ayiLL1Ar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5845FC4CEED;
	Thu,  3 Jul 2025 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538788;
	bh=DCKCqNWcF4C3UNxmiDgWt4D/5CN0jW3TbzdVETnuqBM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ayiLL1Arm9HtqODIBfZVGRL4LDWjYlE9ZWmj/l1KETwk44xFR3iIWmt0wlO+Vhaan
	 oMB1qss+PLUZ5HyINTCKOIYplV8DKXIDxbFCT/h6ZUikJ3nqxE5cp8lxGuZ22jzfTk
	 1DSbB2ZbjCDAEBvbOkufiDRPn/ZaEYHPE9urjGQDIXB1kfUIaB0csG2sYms+LrzHam
	 g/wSK+cJNkrTZw+7QCm9hfmHlykCfGwXw07NVINGCb/mcQ1mcr1MV9qcWqZJxMmWmp
	 lepvFYwDnOGXYHcT/iEDLD1yZ3IupKbyCizn1yM1slp7u0yKaSIOcZNSxS6E7S35/2
	 Ap44GTzd8Wn1A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Jul 2025 12:33:03 +0200
Message-Id: <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Matthew Maurer"
 <mmaurer@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Trevor Gross" <tmgross@umich.edu>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Dirk Behme" <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing
 for File
From: "Benno Lossin" <lossin@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250627-debugfs-rust-v8-4-c6526e413d40@google.com>
 <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org>
 <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux> <aGZVUqangIR-c4aW@google.com>
In-Reply-To: <aGZVUqangIR-c4aW@google.com>

On Thu Jul 3, 2025 at 12:02 PM CEST, Alice Ryhl wrote:
> On Tue, Jul 01, 2025 at 05:10:47PM +0200, Danilo Krummrich wrote:
>> On Tue, Jul 01, 2025 at 04:21:56PM +0200, Greg Kroah-Hartman wrote:
>> > On Tue, Jul 01, 2025 at 04:13:28PM +0200, Danilo Krummrich wrote:
>> > > Instead this should just be:
>> > >=20
>> > > 	struct GPU {
>> > > 	   fw: debugfs::File<Firmware>,
>> > > 	}
>> > >=20
>> > > and then I would initialize it the following way:
>> > >=20
>> > > 	let fw =3D KBox::new(Firmware::new(), GFP_KERNEL)?;
>> > > 	let file =3D dir.create_file("firmware", fw);
>> > >=20
>> > > 	// debugfs::File<Firmware> dereferences to Firmware
>> > > 	file.do_something();
>> > >=20
>> > > 	// Access to fw is prevented by the compiler, since it has been mov=
ed
>> > > 	// into file.
>> > >=20
>> > > This is much better, since now I have the guarantee that my Firmare =
instance
>> > > can't out-live the GPU instance.
>> >=20
>> > That's better, yes, but how would multiple files for the same
>> > "structure" work here?  Like a debugfs-file-per-field of a structure
>> > that we often have?
>>=20
>> That is a very good question and I thought about this as well, because w=
ith only
>> the current API this would require us to have more and more dynamic allo=
cations
>> if we want to have a more fine grained filesystem representations of str=
uctures.
>>=20
>> The idea I have for this is to use pin-init, which we do in quite some o=
ther
>> places as well.
>>=20
>> I think we can add an additional API like this:
>>=20
>> 	impl Dir {
>> 	   pub fn create_file<T>(&self, data: impl PinInit<T>) -> impl PinInit<=
Self> {
>> 	      pin_init!(Self {
>> 	         data <- data,
>> 	         ...
>> 	      })
>> 	   }
>> 	}
>>=20
>> This allows us to do things like:
>>=20
>> 	#[pin_data]
>> 	struct Firmware {
>> 	   #[pin]
>> 	   minor: debugfs::File<u32>,
>> 	   #[pin]
>> 	   major: debugfs::File<u32>,
>> 	   #[pin]
>> 	   buffer: debugfs::File<[u8]>,
>> 	}
>>=20
>> 	impl Firmware {
>> 	   pub fn new(&dir: debugfs::Dir, buffer: [u8]) -> impl PinInit<Self> {
>> 	      pin_init!(Self {
>> 	         minor <- dir.create_file("minor", 1),
>> 	         major <- dir.create_file("major", 2),
>> 	         buffer <- dir.create_file("buffer", buffer),
>> 	      })
>> 	   }
>> 	}
>>=20
>> 	// This is the only allocation we need.
>> 	let fw =3D KBox::pin_init(Firmware::new(...), GFP_KERNEL)?;
>>=20
>> With this everything is now in a single allocation and since we're using
>> pin-init, Dir::create_file() can safely store pointers of the correspond=
ing data
>> in debugfs_create_file(), since this structure is guaranteed to be pinne=
d in
>> memory.
>>=20
>> Actually, we can also implement *only this*, since with this my previous=
 example
>> would just become this:
>>=20
>> 	struct GPU {
>> 	   fw: debugfs::File<Firmware>,
>> 	}
>>=20
>> 	let file =3D dir.create_file("firmware", Firmware::new());
>> 	let file =3D KBox::pin_init(file, GFP_KERNEL)?;
>>=20
>> 	// debugfs::File<Firmware> dereferences to Firmware
>> 	file.do_something();
>>=20
>> Given that, I think we should change things to use pin-init right away f=
or the
>> debugfs::File API.
>
> Does this actually work in practice for anything except immutable data?
> I mean, let's take Rust Binder as an example and lets say that I want to
> expose a directory for each Process object with some of the fields
> exposed. Let's just simplify Rust Binder a bit and only include some of
> the fields:
>
> #[pin_data]
> struct Process {
>     task: ARef<Task>,
>     #[pin]
>     inner: SpinLock<ProcessInner>,
> }
>
> pub(crate) struct ProcessInner {
>     threads: RBTree<i32, Arc<Thread>>,
>     nodes: RBTree<u64, DArc<Node>>,
>     requested_thread_count: u32,
>     max_threads: u32,
>     started_thread_count: u32,
> }
>
> Rust Binder already does expose some debugging data through a file
> system, though it doesn't do so using debugfs. It exposes a lot of data,
> but among them are the pid, the number of threads and nodes, as well as
> the values of requested_thread_count, started_thread_count, and
> max_threads.
>
> Now, we run into problem number one: pinning is not supported inside
> mutexes. But let's say we solved that and we could do this:
>
> #[pin_data]
> struct Process {
>     task: File<ARef<Task>>, // prints the pid
>     #[pin]
>     inner: SpinLock<ProcessInner>,
> }
>
> pub(crate) struct ProcessInner {
>     threads: File<RBTree<i32, Arc<Thread>>>, // prints the count
>     nodes: File<RBTree<u64, DArc<Node>>>, // prints the count
>     requested_thread_count: File<u32>,
>     max_threads: File<u32>,
>     started_thread_count: File<u32>,
> }
>
> However, this still doesn't work! Debugfs may get triggered at any time
> and need to read these fields, and there's no way for it to take the
> spinlock with the above design - it doesn't know where the spinlock is.
> For the integers I guess we could make them atomic to allow reading them
> in parallel with mutation, but that option is not available for the
> red/black trees.
>
> What is the intended solution in this case? If the argument is that this
> is a rare case, then keep in mind that this is a real-world example of
> debugging information that we actually expose today in a real driver.
> With Matt's current approach, it's relatively easy - just store a bunch
> of File<Arc<Process>> instances somewhere and define each one to take
> the mutex and print the relevant value.

How would your example look like with the current approach? IIUC, it
also wouldn't work, because the debugfs data can't be mutated?

---
Cheers,
Benno
