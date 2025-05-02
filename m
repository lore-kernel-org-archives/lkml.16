Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89C0259CAC
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 15:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746200932; cv=none; b=dwLgnmQSJFr6zPWTTehPEDAWVETkyi5VLLcrc1cn+ZHHgyrj+182xSLLEKEpjccvf2XYZhAkEOGrRHlbAkKhabGZc7XwRKvIlTNLiiCeCzC8h86wquLM/wg40AIk+CGW8cFbdo6doKs+MP/RQUvDo6crEuZcIvJ2ycu/87WqnqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746200932; c=relaxed/simple;
	bh=FPeCjzIRvdfI3vGWlR2T8Gy9kCqxNdJDC8jzb7oidcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sROyI16jgODSRfLWbHQDuTMvR31Gpkl44B5X9bJggVrgpAgGl/FOhBP3xOilX9oCdvlv9qHLJncHLyX0s4MrYjumLw+LLGVxU4YTz98H3W525tjDyqPBJv25S3ZWjEovtg6JmPLOUjGXmd9A+GeVX18awhbdo6ii4hApNeVTLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PFMj+9Ni; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PFMj+9Ni"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dbfc122b82so12757a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 08:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746200929; x=1746805729; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVrSpLcZ6r4nzuYBSe89GJo/s5JqpuFLlwBBSO4pcJo=;
        b=PFMj+9NibIr9bJ3EA6D5pn8umkL1aYiDpUq9shjI9MXWSHIdxegZTD+tJ8w44q1oCv
         bjXLnxq1fEpPxvAaOYKKBkqp29huemnYl7VYIrA2FD88QtY3LczZxCsRV6a4QnnNH1ib
         RZ2BkZIRvcOr5eUg2TLK/QduTlcj1m33Djn3/3635azwmj4maluU3eMK3ydw0Av6Km+l
         voajUKVMRy/mFPs14yXEtB+NhyMcAXqXvBxXKlaRh+m2sWjD+F6bk9fxmyPzmmTO1kdr
         tBxjctdWTXteC4T5RMjwi30h7bzjLG+ceh1k6VRMmuMpuAMzrrK89l5cPg47gXNyltFe
         pBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746200929; x=1746805729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVrSpLcZ6r4nzuYBSe89GJo/s5JqpuFLlwBBSO4pcJo=;
        b=SlZBMyP40gG1DutXvJoDNmt69Rn4RJ9sow9tKvMb1zx4l6q/3zYiUcHw0TgLBpvx5t
         waKKSX4A2pA3w/sN1ZW1AZ8NFU0GAyH7u7S+XZzXSR5U7ou6XTLnj5EHApR9Wh858OXN
         Qy6e0gLIZxwXYVRf7QxsCrxVoFBj5pyxFieZEVbvxaj4AvAyj83m4vRCb2YUjEGt3vqJ
         7HZv4RkVhUWfTvugH9Xk+uUs9deBLVKViXNIbsD//CiLUVTs40sBfmQew1qsVfY4NfRP
         0T21+AvYywhIQ0Ql/NSWWEhgtlzuiFryA+PBbLHtXp1dn7XqEuDk6M5WRNkYbbfL5nN2
         Ex3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNSNvDIP8B3XCHb6kJGhpwSWRyt7hGMDgoIZ5xsm/uoRrmHui9g6z/SMeTBGhzqOFk9mhl1kMJs4+TAVA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpod7UalpcAkN1JFJbV1VZNo3Q3+wA+FEy+41Poq6z4p9Iq0h1
	faLjW3rWumsw9cmdWJjXLIx7bsYH14mU+m0DBZ40AC9Ld9tuqvPsx/jyEMPKWvmZeMOwR9UOLpr
	CSLOlk0S34tXNPpNSzNH4k6ec+j3cCC24V2m1
X-Gm-Gg: ASbGncsvVSl0UqFVH5nqnfB+6h8iKuoJlIidXR8iSfSOhbycsXnCRuhhiD7TbHvaKeG
	xXDnyAIdxsSzj7whiZwNKxdqKiJGVQD+tbXUg8hDc28IR/WkJChqjcoqWTK5uAZGXCHhTqTTH29
	VXrC+By/1IqselNGzhrKnXWcmXyi+Fd11EziJXiXhssCKfJqeGkQDg
X-Google-Smtp-Source: AGHT+IH4/tWjZeDHJdM8PWTKrL3Ooj7FlnPJ2nQpTmyA6onllO1fxO0OriRQr9OWjDedxUeXcZYMB/Mj/uPv11WJEF0=
X-Received: by 2002:a05:6402:6c5:b0:5f7:fcf7:a358 with SMTP id
 4fb4d7f45d1cf-5f9145ecf1dmr214753a12.6.1746200928787; Fri, 02 May 2025
 08:48:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-1-850869fab672@google.com> <aBRoNKjB063QhGZo@pollux>
In-Reply-To: <aBRoNKjB063QhGZo@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 2 May 2025 08:48:36 -0700
X-Gm-Features: ATxdqUF2I5oMt95aeCSU6GeI6VpXDIeABWR6x24vNbPICz6nkDSzJCmGZL0fx_8
Message-ID: <CAGSQo00hYLubqJy9zkO3_O3b6V15WtmoSybC+Ep5uJeU6k3t4A@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] rust: debugfs: Bind DebugFS directory creation
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 11:37=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 01, 2025 at 10:47:41PM +0000, Matthew Maurer wrote:
> > +/// Owning handle to a DebugFS directory.
> > +///
> > +/// This directory will be cleaned up when it goes out of scope.
> > +///
> > +/// # Invariants
> > +///
> > +/// The wrapped pointer will always be `NULL`, an error, or an owned D=
ebugFS `dentry`.
> > +#[repr(transparent)]
> > +pub struct Dir(#[cfg(CONFIG_DEBUG_FS)] *mut bindings::dentry);
>
> Should probably use Opaque instead of a raw pointer.

Opaque usage is problematic here:
1. It was explicitly requested in the first patch that I not expose
the reference counted nature of the dentry we were being provided. At
the same time, the dentry we are provided isn't a borrow - it doesn't
live for a fixed lifetime, it goes away when we clean it up. This
means that if I do `Dir(Opaque<dentry>)`, there's no way to represent
the return value of directory creation - it's not `Box<Dir>` or
`Arc<Dir>`, and I've been requested to hide the fact that it's
`ARef<Dir>` and not decrement the refcount myself. We can't know the
lifetime at the callsite, so we can't use a `&'a Dir` either. This
lands with the raw pointer wrapper. I could, technically, produce
`InnerDir(Opaque<dentry>)` and `Dir(ManuallyDrop<ARef<Dir>>)`, and
then impl `Drop` for `Dir` to `remove` instead of `dput`, but that
seems like a bunch of work to construct infrastructure and then
suppress it that doesn't actually help.
2. If you were suggesting `Dir(*mut Opaque<dentry>)`, I think this is
meaningless and will just cause cast noise. My understanding is that
the use of `Opaque` is to remove restrictions Rust has over legal
references and values, e.g. it's initialized, it's not being mutated,
thread safety invariants, etc. However, pointers in Rust explicitly do
not induce any of these requirements on their pointee (otherwise
`ptr::dangling()` would be immediate UB in many situations).
3. Unless we produce an `ARef<Opaque<dentry>>` at some point (which
again, we've been asked to pretend isn't there), I don't think there's
any way for the DebugFS bindings to produce a legal `&'a
Opaque<dentry>`, so there's not really a purpose.

>
> > +// SAFETY: Dir is just a `dentry` under the hood, which the API promis=
es can be transferred
>
> [`Dir`]
>
> > +// between threads.
> > +unsafe impl Send for Dir {}
> > +
> > +// SAFETY: All the native functions we re-export use interior locking,=
 and the contents of the
> > +// struct are opaque to Rust.
> > +unsafe impl Sync for Dir {}
> > +
> > +impl Dir {
> > +    /// Create a new directory in DebugFS at the root.
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// {
> > +    ///    let parent =3D Dir::new(c_str!("parent"));
> > +    ///    // The path "parent" exists in DebugFS here.
> > +    /// }
> > +    /// // It does not exist here.
>
> This ready like an explanation for scopes; I think we should drop those c=
omments
> and the scope.
>
> > +    /// ```
> > +    pub fn new(name: &CStr) -> Self {
> > +        Self::create(name, None)
> > +    }
> > +
> > +    /// Create a DebugFS subdirectory.
> > +    ///
> > +    /// This returns a [`SubDir`], which will not be automatically cle=
aned up when it leaves scope.
> > +    /// To convert this to a handle governing the lifetime of the dire=
ctory, use [`Dir::from`].
> > +    ///
> > +    /// # Examples
> > +    ///
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// {
> > +    ///    let parent =3D Dir::new(c_str!("parent"));
> > +    ///    // The path "parent" exists in DebugFS here.
> > +    ///    {
> > +    ///        let child =3D parent.subdir(c_str!("child"));
> > +    ///        // The path "parent/child" exists in DebugFS here.
> > +    ///    }
> > +    ///    // The path "parent/child" still exists.
> > +    ///    {
> > +    ///        let child2 =3D Dir::from(parent.subdir(c_str!("child2")=
));
> > +    ///        // The path "parent/child2" exists in DebugFS here.
> > +    ///    }
> > +    ///    // The path "parent/child2" is gone.
> > +    /// }
> > +    /// // None of the paths exist here.
>
> I think the fact that you need all those comments here proves that it's n=
ot
> really intuitive. Please see me comment on SubDir below.
>
> > +    /// ```
> > +    pub fn subdir(&self, name: &CStr) -> SubDir {
> > +        SubDir::new(Self::create(name, Some(self)))
> > +    }
> > +
> > +    /// Create a new directory in DebugFS. If `parent` is [`None`], it=
 will be created at the root.
> > +    #[cfg(CONFIG_DEBUG_FS)]
> > +    fn create(name: &CStr, parent: Option<&Self>) -> Self {
> > +        let parent_ptr =3D match parent {
> > +            Some(parent) =3D> parent.as_ptr(),
> > +            None =3D> core::ptr::null_mut(),
> > +        };
> > +        // SAFETY:
> > +        // * `name` argument points to a NUL-terminated string that li=
ves across the call, by
> > +        //   invariants of `&CStr`.
> > +        // * If `parent` is `None`, `parent` accepts null pointers to =
mean create at root.
> > +        // * If `parent` is `Some`, `parent` accepts live dentry debug=
fs pointers.
> > +        // * `debugfs_create_dir` either returns an error code or a le=
gal `dentry` pointer,
> > +        //   so we can call `Self::from_ptr`.
> > +        unsafe { Self::from_ptr(bindings::debugfs_create_dir(name.as_c=
har_ptr(), parent_ptr)) }
>
> Please split up in two calls, such that we don't have two unsafe function=
 calls
> in a single unsafe block.
>
> > +    }
> > +
> > +    #[cfg(not(CONFIG_DEBUG_FS))]
> > +    fn create(_name: &CStr, _parent: Option<&Self>) -> Self {
> > +        Self()
> > +    }
> > +
> > +    /// Constructs a new DebugFS [`Dir`] from the underlying pointer.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// The pointer must either be an error code, `NULL`, or represent=
 a transfer of ownership of a
> > +    /// live DebugFS directory.
> > +    #[cfg(CONFIG_DEBUG_FS)]
> > +    unsafe fn from_ptr(ptr: *mut bindings::dentry) -> Self {
> > +        Self(ptr)
> > +    }
> > +
> > +    /// Returns the pointer representation of the DebugFS directory.
> > +    ///
> > +    /// Due to the type invariant, the value returned from this functi=
on will always be an error
> > +    /// code, NUL, or a live DebugFS directory.
>
> Maybe put this in a '# Guarantees' section.
>
> > +    // If this function is ever needed with `not(CONFIG_DEBUG_FS)`, ha=
rdcode it to return `ENODEV`.
>
> I think you mean ERR_PTR(ENODEV).
>
> > +    #[cfg(CONFIG_DEBUG_FS)]
> > +    fn as_ptr(&self) -> *mut bindings::dentry {
> > +        self.0
> > +    }
> > +}
> > +
> > +impl Drop for Dir {
> > +    fn drop(&mut self) {
> > +        // SAFETY: `debugfs_remove` can take `NULL`, error values, and=
 legal DebugFS dentries.
> > +        // `as_ptr` guarantees that the pointer is of this form.
> > +        #[cfg(CONFIG_DEBUG_FS)]
> > +        unsafe {
> > +            bindings::debugfs_remove(self.as_ptr())
> > +        }
> > +    }
> > +}
> > +
> > +/// Handle to a DebugFS directory that will stay alive after leaving s=
cope.
> > +#[repr(transparent)]
> > +pub struct SubDir(ManuallyDrop<Dir>);
>
> I think it's not very intuitive if the default is that a SubDir still exi=
sts
> after it has been dropped. I think your first approach being explicit abo=
ut this
> with keep() consuming the SubDir was much better; please keep this approa=
ch.
