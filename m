Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3870142A87
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746209282; cv=none; b=RPc8PKjIUylVeSlIPoO16DAk2PRFLnJu8SF006KYfT8T3DPA6I4je0kFv4QnOtYpPlJsS1bVOoU8tZbssPNL6YDya43sdcB+uyYniQfmXMu/r+LZ2fGL0RiryRzmpsBKk15RJMBGWJ8jIF10nHFoXKnihiP52UtV54L/MG0ISpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746209282; c=relaxed/simple;
	bh=rwg4gawI96y1Cnef5dyxfcZ6XeGlVWYyHuhSqsnh9Xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MlMSM8/hSqgjUImlVQh/Es9lz3Vyc5sOtJK9fuNktp1zRpZlypW+mQXKUkYHSbo9wsSYwNSCt1uaA6ZwGtf/TIbdhMcO2Lw8WO2LMp5w0KBCS4qxE4eN+iYusMoCqoU1HwyMdddQtCS6Ge6L12BFHMIGQ1PJV8mKaSNIokEydFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r8eurDPu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r8eurDPu"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f88f236167so954a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 11:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746209278; x=1746814078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LQbC+nJszXeBREigfR47+CLzCElXLbpUOZ74/4Z7og=;
        b=r8eurDPun8xgR/Cy53pxm5RlLO7tpb+bXx4qlkMx3iovhWBdoF28Ok3B8H7kkup1wH
         ujctdsrmmjRqE83net+ATn0jJ/8/07V2Q2/KCFScFrTeH7lonCm45KZTd8I23G1LzP/1
         HhpmcCrhE6dUTP7coidLxv1p1FWt4o9TvlTdOj9eS2G2zKv/U0oYbSAAZKz3yMcG1mot
         MYsxWeRA365JP+DDAUKkNrwQHuidQ0LaaDBYwPQIleFvo1s8NbzvUPJV7/bxiXvW/5VI
         9yEBiQOv5w/Q+Z66+KQhr1CCds/TqLBYKjinnAgpqIemmbDPoxu4y26W8NC8gRHF6dWe
         sXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746209278; x=1746814078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LQbC+nJszXeBREigfR47+CLzCElXLbpUOZ74/4Z7og=;
        b=ndZneVMudU58THX+Km0uKm5UhoU6ocob3xOl9F4mGeUcic8QvoUEznvYuIDIXV7GNX
         HEq4SIQofAbBOyhwM/lQIvLEmWFhkRKG/4lYA3v5p8RNiDucERH5/TN+M61petg81IGl
         opu1hFVTlXCGltwpiCdsopvtRQH74t6RkgSjENuzlpjOSNr8zez3nd56DQNdG1dSg30/
         fv6Dhr9xcMQkB87GRZAHgpo0QbKbzFocKBC3xaUabkC3mNlCafkvQLH6JSd5YTVZi7hP
         qsTGJe5f/Fwwh0DNok3AwNBUwF5gQ75MKibeYmNWBIfUORnEtmvTyMBFYDzPoi2wMOCF
         e7/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtLpy2LUon4pHtm1QDYNBd7eCRNEaZdoHzQ3u3yJ9d9mx5KljqNhJBHoogRFdwZ9SpX6DfS8t9cwlPP4E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5bMvqZdy6GzOKIDXrfjSRM2XZFLCsNZ8mKz1Yzf9+Ofm3rWrZ
	KnOcH+fxIQeS4P/0yU1SllYgBGnybfGw4low6NU0Pbi4Ae+iawhKq+/aFfENuudzBvdR0AEepZn
	PLjZ9QyizNWQ1F1c5kpjBrzqDE41I1I4bYBLz
X-Gm-Gg: ASbGncv30nZc6kNFkZnXwWbvgoNrcBvkvNJK/PT/qDI8YQ+kfZUU45KtbhgDnOJ70Kg
	drG9yr8tJNb6dCI7fP3mFp8O/2Fodt1/f7Sl7PG0+ZpBYinVCBkfpJQcTmlD3dH5HR2I/4TYEqP
	PgcT/dPZHiC1scD2X38fjFa3Yvniya97dwf722Xc7bSXJsMFNVXDF1
X-Google-Smtp-Source: AGHT+IHXyGsWkjb/CVg4mHXhQIW8JT6cKEM7tCeu1T+lD4b6/5HaRqRhHLciPrNsxgfv94oycGry6l/tyQ+gE9t0aSo=
X-Received: by 2002:a05:6402:3199:b0:5fa:82a1:b99c with SMTP id
 4fb4d7f45d1cf-5faa69618bamr10645a12.0.1746209278292; Fri, 02 May 2025
 11:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-2-850869fab672@google.com> <aBRrniLfCzWX7nbR@pollux>
In-Reply-To: <aBRrniLfCzWX7nbR@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Fri, 2 May 2025 11:07:47 -0700
X-Gm-Features: ATxdqUFFztN991yYQoIh5MKauNa5jMjEKkNxwstl3fgfZHk3lc9srhF4_BVJl20
Message-ID: <CAGSQo02bU9HLG=KoYAukUWDX=Ky+kx_wCJszpS-x4gjWXWrYjQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] rust: debugfs: Bind file creation for long-lived Display
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

On Thu, May 1, 2025 at 11:52=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Thu, May 01, 2025 at 10:47:42PM +0000, Matthew Maurer wrote:
> > +/// Handle to a DebugFS file.
> > +#[repr(transparent)]
> > +pub struct File(ManuallyDrop<Dir>);
>
> Same as with SubDir, please keep your original approach with keep().
>
> Exposing this as a separate type is much better, but I still find it a bi=
t weird
> that it uses Dir internally, which still provides methods that are not
> applicable.
>
> I think it would be good to have the following types instead:
>
>         // Generic wrapper around the dentry pointer.
>         struct Entry;
>
>         // Based on Entry; provides Dir specific methods.
>         struct Dir;
>
>         // Based on Dir; implements Keep.
>         struct SubDir;
>
>         // Based on Entry; implements Keep.
>         struct File;
>
>         // Common trait that implements keep().
>         trait Keep;
>
> > +impl File {
> > +    /// Remove the file from DebugFS.
> > +    ///
> > +    /// # Examples
> > +    /// ```
> > +    /// # use kernel::c_str;
> > +    /// # use kernel::debugfs::Dir;
> > +    /// let dir =3D Dir::new(c_str!("foo"));
> > +    /// {
> > +    ///     let file =3D dir.display_file(c_str!("bar"), &0);
> > +    ///     // "foo/bar" is created.
> > +    /// }
> > +    /// // "foo/bar" still exists.
> > +    /// {
> > +    ///     let file =3D dir.display_file(c_str!("baz"), &0);
> > +    ///     // "foo/baz" is created.
> > +    ///     file.remove();
> > +    ///     // "foo/baz" is gone.
> > +    /// }
> > +    pub fn remove(self) {
> > +        drop(ManuallyDrop::into_inner(self.0))
> > +    }
> > +}
>
> Same as with my comment on Dir::subdir(), it really gets confusing if we =
invert
> the normal drop() logic. Removing the file when it is dropped and keeping=
 it
> when calling keep() is much more intuitive..
>
> > +
> > +#[cfg(CONFIG_DEBUG_FS)]
> > +mod helpers {
> > +    use crate::seq_file::SeqFile;
> > +    use crate::seq_print;
> > +    use core::fmt::Display;
> > +
> > +    /// Implements `open` for `file_operations` via `single_open` to f=
ill out a `seq_file`.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// * `inode`'s private pointer must point to a value of type `T` =
which will outlive the `inode`
> > +    ///   and will not be mutated during this call.
> > +    /// * `file` must point to a live, not-yet-initialized file object=
.
> > +    pub(crate) unsafe extern "C" fn display_open<T: Display>(
> > +        inode: *mut bindings::inode,
> > +        file: *mut bindings::file,
> > +    ) -> i32 {
> > +        // SAFETY:
> > +        // * `file` is acceptable by caller precondition.
> > +        // * `print_act` will be called on a `seq_file` with private d=
ata set to the third argument,
> > +        //   so we meet its safety requirements.
> > +        // * The `data` pointer passed in the third argument is a vali=
d `T` pointer that outlives
> > +        //   this call by caller preconditions.
> > +        unsafe { bindings::single_open(file, Some(display_act::<T>), (=
*inode).i_private) }
>
> Please split up unsafe operations.
>
> > +    }
> > +
> > +    /// Prints private data stashed in a seq_file to that seq file.
> > +    ///
> > +    /// # Safety
> > +    ///
> > +    /// `seq` must point to a live `seq_file` whose private data is a =
live pointer to a `T` which is
> > +    /// not being mutated.
> > +    pub(crate) unsafe extern "C" fn display_act<T: Display>(
> > +        seq: *mut bindings::seq_file,
> > +        _: *mut core::ffi::c_void,
> > +    ) -> i32 {
> > +        // SAFETY: By caller precondition, this pointer is live, point=
s to a value of type `T`, and
> > +        // is not being mutated.
> > +        let data =3D unsafe { &*((*seq).private as *mut T) };
>
> This creates an intermediate reference to private, which is UB. Please us=
e
> addr_of! instead.

I'm making this change, but so that I can be correct in the future,
can you explain why taking an intermediate reference to private is UB?
My understanding is that my provided vtable are supposed to be the
only methods looking at this field, and they don't mutate it.
Additionally, the `private_data` field on file is accessed this way in
`miscdevice` at the moment - what makes it safe there, and UB here?
