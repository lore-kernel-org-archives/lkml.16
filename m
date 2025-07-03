Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1002E2F09
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540074; cv=none; b=FWz2oMOUON+cvl/QEWrGyAvRKMZR9OK0rOlbI0HNwRL+VHPgzbAyFyFc5Rhu02uQt30avsrwNZETKTXMqJDJBrusdKCRspFHa5l6xuzeubvExEkKbx29JNqOgAWBqfkRkgEhgWDg/HCrmfEhM2cJYV2O+GdD6vZPV3Pz076MYjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540074; c=relaxed/simple;
	bh=RgNcL93BMmoiZOwzy9RKRHXKIXRtNdOMVlR7++CYF/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2LU08LVnMpVDomGtMHu9eTXuLrAkzHeD9yNMXGz5saHCTqaymZ11x7r8E1UwrIlT1S4oxLZ6ZgaD1ISPmACySWRGnaEAaqIiPEPSr/Pup+HhyP+RrtJ+LPUF1Om2Hw5xfX3Oi43/FfqqHejE29iYt6WVZvfZ7IGkMnMcMMDXjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zdwYXmzy; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zdwYXmzy"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a522224582so4090315f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751540071; x=1752144871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txbv/v+IJnhaJQYXgtX5pE98Wu6gJw5FJNfTHHHCGQQ=;
        b=zdwYXmzyYQq6K5lLwjD1HQHdb010kBjbjiSzS0KkdFbONZ5NUo9TXVcP/7ELlg+6Ct
         YVbuz6Jg3j38kBo6WoenHht2AhDC4bIZn3WShCKtVC44dGlQHZJ0QN33IGxnancQTTXN
         2t42z2iHS/M7uwKRouaT0K2c49/6fI0N1MUA1SU10N0QffJKRneuNafoAnF6dsSPauIp
         f0bq6gKjJdaMDXrSCzNhB9NJI/cBJ1x3OpGfFFzu13urjAWb7+pREj0v+7rFyZRzKxX1
         xifBkzTSUZX86pzWjjy3d84fMv/pIEQjWYerptiN5tpCxbvjFaEEQEosIcIHMbGNzqax
         Y0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540071; x=1752144871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=txbv/v+IJnhaJQYXgtX5pE98Wu6gJw5FJNfTHHHCGQQ=;
        b=VFIQi6rnu+Mlh8E92JB+FLCtqZQHS2eX9LAEJHBAHok7/qqoG2QArIf2A0OH+sfqPU
         Yc/aEN7DmYddaQRG9A9DrqYl2i9rIaKVb3eGzgCK3yEPh89KpzWdWYMu3iregqQHUDyT
         X0VOiPKoi5KwQ3IOIyyBqQ6f3lX1e+rE/AuVztSfSIccy7zDoQOoSV18Ji90uiUvaGpD
         mIdKGBVg6iOt269KgotPd/u8+zE73A5I+/L1Ex7rgpvPPGj73z5yEi8q4uG9Aw7S4c9b
         GlWL7TToj5/ZV4Inxi0o/AuvY3Hp1VenG3N7WYPTbTJDuvY5cF7ZiPuU4zNVzG01TeYD
         /miQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHyvWUck3IdFfmmSHgpWLXqlrQvCU4Z7z5yalVgQ9aDcgX1OlbrKM1QBsMQVWavdMgwm+XoIh/Uv9+2Fc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/r0YC/lHHQKZgLWEgco9I5G8kmyb9yJL/t+WRpOB/AtuQXthr
	5AL8Z4usWlsSJMrvByrUs7SgN4eQjLr4eDFd/6Y8Qf8AEk/kxE2W89jY6Hfcn4Th2qRM2afW1NN
	53loG58GqyS4GSyxNgoZrp66dmlcJ5VB7a3d+xWD2
X-Gm-Gg: ASbGncu6uk21YuxDFKxE/s+ZDgZNimGzZKNdhuyvWMxp3fc76KNxtMz7MkioRwrSpm4
	9epvcJeF/CszGm5S6nZDcenAWuHGqa/X9GdkVe0I8QakxCpBKnE9qT3UnoEJ/pbU0IyevzAKaco
	ddoLLOq/L8fPF6NqQttXAbcry7w5dnszf2ZlpawD0jZibK0inaUxnTjc/XgGubHiS6rOJuxCLzc
	A==
X-Google-Smtp-Source: AGHT+IHw+OmwbsPnER5y3bOhHH6dIzQU/wmEoRtPIcFiVQoP0t1m30DD+YmugjsLrcN51rME03/iKufPzJK3sT+gXlc=
X-Received: by 2002:a5d:64ef:0:b0:3b3:9c75:bb0e with SMTP id
 ffacd0b85a97d-3b39c75bcabmr1496075f8f.11.1751540070595; Thu, 03 Jul 2025
 03:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-debugfs-rust-v8-4-c6526e413d40@google.com>
 <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org> <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org> <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux> <aGZVUqangIR-c4aW@google.com> <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
In-Reply-To: <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 3 Jul 2025 12:54:18 +0200
X-Gm-Features: Ac12FXz4wcIvdCoLgteoK4wV0gDkGf_IPAS-c0UXryLVZEMWGtAf8WARILZXomA
Message-ID: <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 12:33=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Thu Jul 3, 2025 at 12:02 PM CEST, Alice Ryhl wrote:
> > On Tue, Jul 01, 2025 at 05:10:47PM +0200, Danilo Krummrich wrote:
> >> On Tue, Jul 01, 2025 at 04:21:56PM +0200, Greg Kroah-Hartman wrote:
> >> > On Tue, Jul 01, 2025 at 04:13:28PM +0200, Danilo Krummrich wrote:
> >> > > Instead this should just be:
> >> > >
> >> > >  struct GPU {
> >> > >     fw: debugfs::File<Firmware>,
> >> > >  }
> >> > >
> >> > > and then I would initialize it the following way:
> >> > >
> >> > >  let fw =3D KBox::new(Firmware::new(), GFP_KERNEL)?;
> >> > >  let file =3D dir.create_file("firmware", fw);
> >> > >
> >> > >  // debugfs::File<Firmware> dereferences to Firmware
> >> > >  file.do_something();
> >> > >
> >> > >  // Access to fw is prevented by the compiler, since it has been m=
oved
> >> > >  // into file.
> >> > >
> >> > > This is much better, since now I have the guarantee that my Firmar=
e instance
> >> > > can't out-live the GPU instance.
> >> >
> >> > That's better, yes, but how would multiple files for the same
> >> > "structure" work here?  Like a debugfs-file-per-field of a structure
> >> > that we often have?
> >>
> >> That is a very good question and I thought about this as well, because=
 with only
> >> the current API this would require us to have more and more dynamic al=
locations
> >> if we want to have a more fine grained filesystem representations of s=
tructures.
> >>
> >> The idea I have for this is to use pin-init, which we do in quite some=
 other
> >> places as well.
> >>
> >> I think we can add an additional API like this:
> >>
> >>      impl Dir {
> >>         pub fn create_file<T>(&self, data: impl PinInit<T>) -> impl Pi=
nInit<Self> {
> >>            pin_init!(Self {
> >>               data <- data,
> >>               ...
> >>            })
> >>         }
> >>      }
> >>
> >> This allows us to do things like:
> >>
> >>      #[pin_data]
> >>      struct Firmware {
> >>         #[pin]
> >>         minor: debugfs::File<u32>,
> >>         #[pin]
> >>         major: debugfs::File<u32>,
> >>         #[pin]
> >>         buffer: debugfs::File<[u8]>,
> >>      }
> >>
> >>      impl Firmware {
> >>         pub fn new(&dir: debugfs::Dir, buffer: [u8]) -> impl PinInit<S=
elf> {
> >>            pin_init!(Self {
> >>               minor <- dir.create_file("minor", 1),
> >>               major <- dir.create_file("major", 2),
> >>               buffer <- dir.create_file("buffer", buffer),
> >>            })
> >>         }
> >>      }
> >>
> >>      // This is the only allocation we need.
> >>      let fw =3D KBox::pin_init(Firmware::new(...), GFP_KERNEL)?;
> >>
> >> With this everything is now in a single allocation and since we're usi=
ng
> >> pin-init, Dir::create_file() can safely store pointers of the correspo=
nding data
> >> in debugfs_create_file(), since this structure is guaranteed to be pin=
ned in
> >> memory.
> >>
> >> Actually, we can also implement *only this*, since with this my previo=
us example
> >> would just become this:
> >>
> >>      struct GPU {
> >>         fw: debugfs::File<Firmware>,
> >>      }
> >>
> >>      let file =3D dir.create_file("firmware", Firmware::new());
> >>      let file =3D KBox::pin_init(file, GFP_KERNEL)?;
> >>
> >>      // debugfs::File<Firmware> dereferences to Firmware
> >>      file.do_something();
> >>
> >> Given that, I think we should change things to use pin-init right away=
 for the
> >> debugfs::File API.
> >
> > Does this actually work in practice for anything except immutable data?
> > I mean, let's take Rust Binder as an example and lets say that I want t=
o
> > expose a directory for each Process object with some of the fields
> > exposed. Let's just simplify Rust Binder a bit and only include some of
> > the fields:
> >
> > #[pin_data]
> > struct Process {
> >     task: ARef<Task>,
> >     #[pin]
> >     inner: SpinLock<ProcessInner>,
> > }
> >
> > pub(crate) struct ProcessInner {
> >     threads: RBTree<i32, Arc<Thread>>,
> >     nodes: RBTree<u64, DArc<Node>>,
> >     requested_thread_count: u32,
> >     max_threads: u32,
> >     started_thread_count: u32,
> > }
> >
> > Rust Binder already does expose some debugging data through a file
> > system, though it doesn't do so using debugfs. It exposes a lot of data=
,
> > but among them are the pid, the number of threads and nodes, as well as
> > the values of requested_thread_count, started_thread_count, and
> > max_threads.
> >
> > Now, we run into problem number one: pinning is not supported inside
> > mutexes. But let's say we solved that and we could do this:
> >
> > #[pin_data]
> > struct Process {
> >     task: File<ARef<Task>>, // prints the pid
> >     #[pin]
> >     inner: SpinLock<ProcessInner>,
> > }
> >
> > pub(crate) struct ProcessInner {
> >     threads: File<RBTree<i32, Arc<Thread>>>, // prints the count
> >     nodes: File<RBTree<u64, DArc<Node>>>, // prints the count
> >     requested_thread_count: File<u32>,
> >     max_threads: File<u32>,
> >     started_thread_count: File<u32>,
> > }
> >
> > However, this still doesn't work! Debugfs may get triggered at any time
> > and need to read these fields, and there's no way for it to take the
> > spinlock with the above design - it doesn't know where the spinlock is.
> > For the integers I guess we could make them atomic to allow reading the=
m
> > in parallel with mutation, but that option is not available for the
> > red/black trees.
> >
> > What is the intended solution in this case? If the argument is that thi=
s
> > is a rare case, then keep in mind that this is a real-world example of
> > debugging information that we actually expose today in a real driver.
> > With Matt's current approach, it's relatively easy - just store a bunch
> > of File<Arc<Process>> instances somewhere and define each one to take
> > the mutex and print the relevant value.
>
> How would your example look like with the current approach? IIUC, it
> also wouldn't work, because the debugfs data can't be mutated?

I would store a bunch of `File<Arc<Process>>` instances somewhere.
Each one has a closure that takes the spinlock and prints the
appropriate value.

Alice
