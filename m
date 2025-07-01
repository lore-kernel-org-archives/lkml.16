Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC5A280332
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393489; cv=none; b=LRvrAYv0nSdmA3B4rPxs6mr4LXq8VrMDuwb/JExnOrTZ8BCcAc7zOlfslRgRa7swEig3TtJl71z8B3bliKO5+4O7KQXAb9a/FekxElmHd50pd+P6wrpwtcwzmM15ZN6tYRqJSPbGqRLjgASQpyMFCFkcpQxVGplKet8XNQuIwD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393489; c=relaxed/simple;
	bh=STcdQGNKJ+aAvWcYVtytjc9puZizP/2Sr4cs7hwVDXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rSQWu0hr4/1dklhN6W1ykJP+iOLOK4NNp9sQu/R2bxQnc66Y9AvyEfU57GYdO8vSScM2TFCTy2+ozBfj20nJs46fM/b6/lRtoOpAx7KB9PicrOYpiRec+ucT5VaFia1NFNFLBr899LL56xV4anu7ChXaDuCrLe6gxy6g54+gglM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=grOB9wbX; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="grOB9wbX"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-609b169834cso16107a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751393486; x=1751998286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5VU1/mrUkCxHZ5gwpKTKFJhpk2aKLwa16NIt1jWT/xE=;
        b=grOB9wbXZNGxT1RbQEFTlzaYkv2ces0Hf0snHdk4H855C34S6UC3EsvZlqcsiU83xn
         dve1nMZWYemVtiaLsapvMsMeC5wqTPwsZ/4cVUI9KLsTFzZ0zH7m+HjpVEiidJxQk0Gd
         0dAXyoitjI+zuXGHZ61ncSbTsXkr31RDdRpWBSgkPH0p0FDwbzzsQimZzobFPIJGhvGA
         C1v1H/2oJW7Z6BSBCurSXNOn95M4NqIoRP8JUCsv/5ebUCAdHXiIjDRPG2LvQMM+M3Le
         9hq02hJheft5bs/23InyOM81HDzGDtTTQPvX8Sg2QIiED5Ap2cQxX3hAysa5Pxc++1lh
         MT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393486; x=1751998286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5VU1/mrUkCxHZ5gwpKTKFJhpk2aKLwa16NIt1jWT/xE=;
        b=TTf2sDEhuqv/Nch+Hp5eBqHL6CiswYdcag8TVy5udSicUnDYgvaX4MlDW1hDPfkvD1
         /tu3yrCUUML94SnBU1eXP2lIcsXfl/lBG36eBfTeCmoZQ8e/SQVjHCXoKy+Fj2F2U/vf
         MNvLS6kJgE1xnodJnhcTFt8njqH5Juth5vDI8our71HvUlj6yERE976oSzVMgVWKcqWG
         ayr1JfxTarcPe93l3/e9Ci86C2jVmWci8I8e/rSajrO3qC5R9O8NWxoxlweg1G1ZtqKb
         RH9/OSgrb6YXxmOnOFKobyjxpCoJKtUHVVAuRMybv/+ctevBWRbiWA4EmBmYOvfoLj1f
         wFeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz5AjWO5DNUvjS7B67V98s/J9lOGNQUXdB8M12qLSetVTw/MMUXzBbDtiSR3871MtR9dvWBdVdP667GNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+tSPYkggYRwBDqzoozvqBbp6K2lzJpDrxprEj6CcRACbRpLlG
	baS2X4CssLPnTa18kprnVB0VwqP5A/PmyepWy7co53SOwXkT7znFHMwrbyN2VFPEEi/ljipBmDZ
	5BNFm3OS2Ve0YuVG9Etj0t+vfmnb3zvLDt60qrDn2
X-Gm-Gg: ASbGncs3g7I9O7xWmmJquBrbLHLSSIZgsQ9ybPm5hKaGtkca3l2uM7gD0NnYzoxI5Fd
	b6Sz6D2BeoNLnwjmA3sZQmnk8v2Jf79l/9G0nqutbPC3vYtYSbz/2DT4GzhsBbn8o8IL6AdGmF3
	GXfoyMDL3c9o4JyOwXzJmOnpoEEey1G7Gu3mZmobgPvQqeYifGkW26sWGAZU2hV2Gw6XONzlvv4
	57YH6iXOL0=
X-Google-Smtp-Source: AGHT+IHWDp7ZEG5Z6nJJ+2nqQrDFP4p19iBXnznP+kO7QBuQ1pyWXew+VGnNFnhkcmoc0IYz2EwRlWnr9VIyw9tz2Iw=
X-Received: by 2002:aa7:c342:0:b0:608:fb55:bf12 with SMTP id
 4fb4d7f45d1cf-60e38a44816mr100650a12.4.1751393485505; Tue, 01 Jul 2025
 11:11:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-4-c6526e413d40@google.com> <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
 <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
 <ce8f428b-fcb0-48dc-b13e-6717c9a851b4@kernel.org> <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh> <aGP6d2-jJy5rtjMK@pollux>
In-Reply-To: <aGP6d2-jJy5rtjMK@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 1 Jul 2025 11:11:13 -0700
X-Gm-Features: Ac12FXzeu44kKS3khaugpYWwQFxTpXiG-Lw_Qm7U7KrbvPejH1SLIdisQX_srOY
Message-ID: <CAGSQo00eG5oRdN_xORLUyUauLi_vzypU-gz6DSU_FzaAbHRLng@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 8:10=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue, Jul 01, 2025 at 04:21:56PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jul 01, 2025 at 04:13:28PM +0200, Danilo Krummrich wrote:
> > > On Tue, Jul 01, 2025 at 03:58:45PM +0200, Greg Kroah-Hartman wrote:
> > > > On Mon, Jun 30, 2025 at 08:16:55PM +0200, Danilo Krummrich wrote:
> > > > > On Mon, Jun 30, 2025 at 10:49:51AM -0700, Matthew Maurer wrote:
> > > > > > On Mon, Jun 30, 2025 at 10:39=E2=80=AFAM Danilo Krummrich <dakr=
@kernel.org> wrote:
> > > > > > >
> > > > > > > On 6/30/25 7:34 PM, Matthew Maurer wrote:
> > > > > > > > On Mon, Jun 30, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <=
dakr@kernel.org> wrote:
> > > > > > > >>
> > > > > > > >> On 6/28/25 1:18 AM, Matthew Maurer wrote:
> > > > > > > >>> +    fn create_file<D: ForeignOwnable>(&self, _name: &CSt=
r, data: D) -> File
> > > > > > > >>> +    where
> > > > > > > >>> +        for<'a> D::Borrowed<'a>: Display,
> > > > > > > >>> +    {
> > > > > > > >>> +        File {
> > > > > > > >>> +            _foreign: ForeignHolder::new(data),
> > > > > > > >>> +        }
> > > > > > > >>>        }
> > > > > > > >>
> > > > > > > >> What's the motivation for the ForeignHolder abstraction? W=
hy not just make it
> > > > > > > >> File<D> and store data directly?
> > > > > > > >
> > > > > > > > 1. A `File<D>` can't be held in collection data structures =
as easily
> > > > > > > > unless all your files contain the *same* backing type.
> > > > > > >
> > > > > > > That sounds reasonable.
> > > > > > >
> > > > > > > > 2. None of the APIs or potential APIs for `File` care about=
 which type
> > > > > > > > it's wrapping, nor are they supposed to. If nothing you can=
 do with a
> > > > > > > > `File` is different depending on the backing type, making i=
t
> > > > > > > > polymorphic is just needlessly confusing.
> > > > > > >
> > > > > > > What if I want to access file.data() and do something with th=
e data? Then I'd
> > > > > > > necessarily need to put my data in an Arc and reference count=
 it to still be
> > > > > > > able to access it.
> > > > > > >
> > > > > > > That doesn't seem like a reasonable requirement to be able to=
 access data
> > > > > > > exposed via debugfs.
> > > > > >
> > > > > > `pub fn data(&self) -> D` would go against my understanding of =
Greg's
> > > > > > request for DebugFS files to not really support anything other =
than
> > > > > > delete. I was even considering making `D` not be retained in th=
e
> > > > > > disabled debugfs case, but left it in for now for so that the
> > > > > > lifecycles wouldn't change.
> > > > >
> > > > > Well, that's because the C side does not have anything else. But =
the C side has
> > > > > no type system that deals with ownership:
> > > > >
> > > > > In C you just stuff a pointer of your private data into debugfs_c=
reate_file()
> > > > > without any implication of ownership. debugfs has a pointer, the =
driver has a
> > > > > pointer. The question of the ownership semantics is not answered =
by the API, but
> > > > > by the implementation of the driver.
> > > > >
> > > > > The Rust API is different, and it's even implied by the name of t=
he trait you
> > > > > expect the data to implement: ForeignOwnable.
> > > > >
> > > > > The File *owns* the data, either entirely or a reference count of=
 the data.
> > > > >
> > > > > If the *only* way to access the data the File now owns is by maki=
ng it reference
> > > > > counted, it:
> > > > >
> > > > >   1) Is additional overhead imposed on users.
> > > > >
> > > > >   2) It has implications on the ownership design of your driver. =
Once something
> > > > >      is reference counted, you loose the guarantee the something =
can't out-live
> > > > >      some event.
> > > > >
> > > > > I don't want that people have to stuff their data structures into=
 Arc (i.e.
> > > > > reference count them), even though that's not necessary. It makes=
 it easy to
> > > > > make mistakes. Things like:
> > > > >
> > > > >         let foo =3D bar.clone();
> > > > >
> > > > > can easily be missed in reviews, whereas some contributor falsely=
 changing a
> > > > > KBox to an Arc is much harder to miss.
> > > > >
> > > > > > If you want a `.data()` function, I can add it in,
> > > > >
> > > > > I think it could even be an implementation of Deref.
> > > > >
> > > > > > but I don't think
> > > > > > it'll improve flexibility in most cases. If you want to do some=
thing
> > > > > > with the data and it's not in an `Arc` / behind a handle of som=
e kind,
> > > > > > you'll need something providing threadsafe interior mutability =
in the
> > > > > > data structure. If that's a lock, then I have a hard time belie=
ving
> > > > > > that `Arc<Mutex<T>>`(or if it's a global, a `&'static Mutex<T>`=
, which
> > > > > > is why I added that in the stack) is so much more expensive tha=
n
> > > > > > `Box<Mutex<T>>` that it's worth a more complex API. If it's an =
atomic,
> > > > > > e.g. `Arc<AtomicU8>`, then I can see the benefit to having
> > > > > > `Box<AtomicU8>` over that, but it still seems so slim that I th=
ink the
> > > > > > simpler "`File` is just a handle to how long the file stays ali=
ve, it
> > > > > > doesn't let you do anything else" API makes sense.
> > > > >
> > > > > I don't really see what is complicated about File<T> -- it's a Fi=
le and it owns
> > > > > data of type T that is exposed via debugfs. Seems pretty straight=
 forward to me.
> > > > >
> > > > > Maybe the performance cost is not a huge argument here, but maint=
ainability in
> > > > > terms of clarity about ownership and lifetime of an object as exp=
lained above
> > > > > clearly is.

The part that is not straightforward is that the primary purpose of
`T` may not be "to be exposed via DebugFS", and leaves us in the
unusual world where DebugFS (or at least our bindings to it) are
load-bearing in builds that have DebugFS disabled. It can work, but it
definitely seems confusing and is privileging DebugFS holding a
reference to a data structure over other things holding a reference to
it.

> > > >
> > > > I'm agreeing here.  As one of the primary users of this api is goin=
g to
> > > > be a "soc info" module, like drivers/soc/qcom/socinfo.c, I tried to=
 make
> > > > an example driver to emulate that file with just a local structure,=
 but
> > > > the reference counting and access logic just didn't seem to work ou=
t
> > > > properly.  Odds are I'm doing something stupid though...

I have a version of this that works with my initial driver, and keep
intending to revise it to work on top of the new one, but I keep
getting requests for API changes before I get around to reworking it
;)

The way I intended my `ForeignOwnable` variant of this to work was
that I would have a *single* struct that contained all the scanned
data. For the socinfo module, we know how big this could be, so we
could put this as a `static` in the module, in which case we'd have
`&'static MyInfo`. If we didn't want to do that or didn't know, we'd
produce an `Arc<MyInfo>`. Then, for each file, we'd create a file that
passed in either `my_arc_info.clone()` or `my_info` if we had the
static reference, with the functions that do the printing
distinguishing the behavior of each file.

Doing the file-owns-the-specific-field version *could* work, but means
that the debugfs tree code would be interleaved with the calls to
parsing code, or that we'd need two copies of the struct, an initial
one with all the parsed data, and a follow-up one that has has them
all wrapped in `File`.

> > >
> > > I think it technically works, but it imposes semantics on drivers tha=
t we
> > > shouldn't do; see the example below.
> > >
> > > > So a file callback IS going to want to have access to the data of t=
ype T
> > > > that is exposed somehow.
> > >
> > > With the current API we would need this:
> > >
> > >     struct GPU {
> > >        fw: Arc<Firmware>,
> > >        fw_file: debugfs::File,
> > >     }
> > >
> > > and then I would initialize it the following way:
> > >
> > >     let fw =3D Arc::new(Firmware::new(), GFP_KERNEL)?;
> > >     let fw_file =3D dir.create_file("firmware", fw.clone());
> > >
> > >     fw.do_something();
> > >
> > > This is bad, because now my Firmware instance in GPU needs to be refe=
rence
> > > counted, even though it should *never* out-live the GPU instance. Thi=
s is error
> > > prone.

If `Firmware` outliving the GPU instance causes a bug, not just a
resource leak, I'd argue that you should be passing a narrower handle
to your debugfs file. If it just causes a resource leak, then I'd
argue that if you leak a resource (the debugfs file itself), then
leaking a resource is not unexpected.

For the narrower handle example, consider e.g.
```
struct Firmware {
  info: Arc<FirmwareInfo>,
  my_handle: Handle // Some handle whose drop is load bearing
}
// ...
let fw: Firmware =3D build_fw()?;
let fw_file =3D fw.info.clone();
fw.do_something();
```

> >
> > Agreed, AND you just created a new fw structure that you really didn't
> > need, wasting memory.
>
> In case you refer to fw.clone(), since fw is an Arc<Firmware>, clone() ju=
st
> creates a new reference count to the same object.
>
> > > Instead this should just be:
> > >
> > >     struct GPU {
> > >        fw: debugfs::File<Firmware>,
> > >     }
> > >
> > > and then I would initialize it the following way:
> > >
> > >     let fw =3D KBox::new(Firmware::new(), GFP_KERNEL)?;
> > >     let file =3D dir.create_file("firmware", fw);
> > >
> > >     // debugfs::File<Firmware> dereferences to Firmware
> > >     file.do_something();
> > >
> > >     // Access to fw is prevented by the compiler, since it has been m=
oved
> > >     // into file.
> > >
> > > This is much better, since now I have the guarantee that my Firmare i=
nstance
> > > can't out-live the GPU instance.
> >
> > That's better, yes, but how would multiple files for the same
> > "structure" work here?  Like a debugfs-file-per-field of a structure
> > that we often have?

This seems odd to me because with this model the DebugFS file itself
becomes deeply involved with the ownership of the devices or other
data. There are a few issues I think this creates:
1. It discourages file-per-field, because you can no longer have the
DebugFS file uniquely own something, which you're now trying to
encourage. This seems likely to result in people having debugfs files
that render out structured data, which I think we generally don't
want?
2. If I have a module and want to add a new DebugFS file to it, the
change will edit the core structures of the drivers rather than just
adding an auxiliary field. This is partially remedied if we make
`File<D>` implement `Deref<Target=3DD>`. It will still either incur
churn or imprecision around commonly derived traits like equality and
debug. If I have `#[derive(PartialEq)]` on my struct including
`DeviceData`, and then I wrap that into a `File<DeviceData>`, we'll
get stuck with a quandry:
  a. Should files `x =3D=3D y` if the underlying private data is equal?
This has the benefit of preserving the behavior of the derive, but
means that distinct files may compare equal if they have the same
contents.
  b. Should files `x =3D=3D y` only be true if the underlying *file* is
the same? This seems logical for *file* equality, but will break
equality on the field or structures including it.
  This will also be an incompatible change for anyone already using an
explicit `.deref()` or an explicit `impl Deref<Target =3D T>` method to
work with the field, because while deref coercion will automatically
chain, `impl Deref<Target =3D T>` *cannot* automatically chain.
3. If you create an object specifically for debugging, then it will
*have* to be created and kept around even if DebugFS is disabled,
because we can't tell whether the user is relying on its existence.
(My current implementation keeps it around in that case as well, but
that's not guaranteed or required - we could cause it to just
immediately drop data that someone tried to attach.) This means that
rather than relying on the API to determine whether the information is
needed, the modules will need to check the config if they want to get
rid of it.

>
> That is a very good question and I thought about this as well, because wi=
th only
> the current API this would require us to have more and more dynamic alloc=
ations
> if we want to have a more fine grained filesystem representations of stru=
ctures.
>
> The idea I have for this is to use pin-init, which we do in quite some ot=
her
> places as well.
>
> I think we can add an additional API like this:
>
>         impl Dir {
>            pub fn create_file<T>(&self, data: impl PinInit<T>) -> impl Pi=
nInit<Self> {
>               pin_init!(Self {
>                  data <- data,
>                  ...
>               })
>            }
>         }
>
> This allows us to do things like:
>
>         #[pin_data]
>         struct Firmware {
>            #[pin]
>            minor: debugfs::File<u32>,
>            #[pin]
>            major: debugfs::File<u32>,
>            #[pin]
>            buffer: debugfs::File<[u8]>,

Nit: This can't work, because a `&[u8]` is double-width, and we only
get to send one pointer into the file. We'd need to add a requirement
`T: Sized` if we really wanted to have `File` embed the data.

>         }
>
>         impl Firmware {
>            pub fn new(&dir: debugfs::Dir, buffer: [u8]) -> impl PinInit<S=
elf> {
>               pin_init!(Self {
>                  minor <- dir.create_file("minor", 1),
>                  major <- dir.create_file("major", 2),
>                  buffer <- dir.create_file("buffer", buffer),
>               })
>            }
>         }
>
>         // This is the only allocation we need.
>         let fw =3D KBox::pin_init(Firmware::new(...), GFP_KERNEL)?;
>
> With this everything is now in a single allocation and since we're using
> pin-init, Dir::create_file() can safely store pointers of the correspondi=
ng data
> in debugfs_create_file(), since this structure is guaranteed to be pinned=
 in
> memory.
>
> Actually, we can also implement *only this*, since with this my previous =
example
> would just become this:

If we implement *only* pinned files, we run into an additional problem
- you can't easily extend a pinned vector. This means that you cannot
have dynamically created devices unless you're willing to put every
new `File` into its own `Box`, because you aren't allowed to move any
of the previously allocated `File`s for a resize.

Where previously you would have had

```
debug_files: Vec<File>
```

you would now have

```
debug_files: Vec<PinBox<File<T>>>
```

If it's easy to use the model you described earlier where the sole
owner of the data is the debugfs file, then this is mostly fine,
because to use the old version, you'd already have it live in a
`ForeignOwnable`, which most likely means its own allocation. However,
if you're already forced into an environment where the objects you're
embedding into a file are reference counted, you now have an extra
allocation required for every `File`. Because the `File` has to be
able to respond to `data()`, we also won't have these `File`s truncate
to zero size in the no debugfs scenario.

This means that if you want a `File` to render an object that is
reference counted, and they're dynamically created and destroyed, you
will now be required to incur an allocation per file, even when
DebugFS is disabled.

>
>         struct GPU {
>            fw: debugfs::File<Firmware>,
>         }
>
>         let file =3D dir.create_file("firmware", Firmware::new());
>         let file =3D KBox::pin_init(file, GFP_KERNEL)?;
>
>         // debugfs::File<Firmware> dereferences to Firmware
>         file.do_something();
>
> Given that, I think we should change things to use pin-init right away fo=
r the
> debugfs::File API.
