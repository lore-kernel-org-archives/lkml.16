Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC6521A928;
	Wed, 14 May 2025 08:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209984; cv=none; b=bAo9sxrsagKoasRpFamE/JN8kqJScjlo1Lf7VTH3a6MVF+XicppYV+lNFslojm/4o1YainX3o+HcntGzDp2R2Blr0FnQVi5JyuJo5y992gZWsWjgsK6T3Qu7i0cLuckN5oqQN5LO3wi9diYY7N3RZjHrfaLJTUh2uvK8Wsy3xwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209984; c=relaxed/simple;
	bh=vr25nTK/oFAP4fffnJzlovHh71aJST9oXEO8HVUyKtY=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=ghzaDWvMIpfj36oQIZV5tU7kHglt1yexyI+lQUxDi+/jDjFv0r0Jl02TE6b9/uRn3OTuzO5q76syH4/cZS4iADfCTPaLHendRSmTDcNXO1u+covh/ocD1+np/jUisEPNDHskWeCRE9l04/vn7cSExpi+Sykg0j2bIdmRYMDKooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRbfgXGy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRbfgXGy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 824BCC4CEEB;
	Wed, 14 May 2025 08:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747209983;
	bh=vr25nTK/oFAP4fffnJzlovHh71aJST9oXEO8HVUyKtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRbfgXGyaMCeVSmARiAZi+ceNSzu3CcKN4Bu7Pnq8YOMMqSrM0NVbohVfxZJLzmdo
	 UvHFyFUxEruc1ZPmiN5KpcWeqBohX7iJp07IYSjgU5kQHaKQAxrn+c5FsGHhlpF4ik
	 EstojNIMNsjC7p6sJm28oag75JfWAj2tl9LdXYt3uaky2HbymUgtosaKHJquMV31P4
	 voLdRexgl07OwAOaFnSJaAuxaNTvXwoTMhRbfZTYxYRqaN4GRbb7L7JSRshw7698Hv
	 95vXWk0MJNHdfYy7yFQCC9meW+RW+w9VoYIFqNkCA8SdM7kpZlkPNQ0XzILTflNeGL
	 10DDrkOIa8hLw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 10:06:18 +0200
Message-Id: <D9VQ8VDGD557.2KJ4SKUVEQGDQ@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: "Matthew Maurer" <mmaurer@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>, "Timur Tabi" <ttabi@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 2/4] rust: debugfs: Bind file creation for long-lived
 Display
X-Mailer: aerc 0.20.1
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-2-3e93ce7bb76e@google.com>
In-Reply-To: <20250505-debugfs-rust-v5-2-3e93ce7bb76e@google.com>

On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index ed1aba6d700d064dbfd7e923dbcbf80b9acf5361..4a138717bd0fdb320033d0744=
6a192c9f520a17b 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -46,6 +47,19 @@ unsafe fn from_ptr(entry: *mut bindings::dentry) -> Se=
lf {
>          }
>      }
> =20
> +    /// Constructs a new DebugFS [`Entry`] from the underlying pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The pointer must either be an error code, `NULL`, or represent a=
 transfer of ownership of a
> +    /// live DebugFS directory.
> +    #[cfg(not(CONFIG_DEBUG_FS))]
> +    unsafe fn from_ptr(_entry: *mut bindings::dentry) -> Self {
> +        Self {

Why duplicate this function and not just do this to the existing
function?:

    unsafe fn from_ptr(entry: *mut bindings::dentry) -> Self {
        #[cfg(not(CONFIG_DEBUG_FS))]
        let _ =3D entry;
        Self {
            #[cfg(CONFIG_DEBUG_FS)]
            entry,
            _phantom: PhantomData,
        }
    }

> +            _phantom: PhantomData,
> +        }
> +    }
> +
>      #[cfg(not(CONFIG_DEBUG_FS))]
>      fn new() -> Self {
>          Self {
> @@ -124,6 +138,57 @@ pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b> =
{
>          Dir::create(name, Some(self))
>      }
> =20
> +    /// Create a file in a DebugFS directory with the provided name, and=
 contents from invoking
> +    /// [`Display::fmt`] on the provided reference.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let dir =3D Dir::new(c_str!("my_debugfs_dir"));
> +    /// dir.display_file(c_str!("foo"), &200);
> +    /// // "my_debugfs_dir/foo" now contains the number 200.
> +    /// ```
> +    pub fn display_file<'b, T: Display + Sized>(
> +        &'b self,
> +        name: &CStr,
> +        data: &'static T,
> +    ) -> File<'b> {
> +        // SAFETY:
> +        // * `name` is a NUL-terminated C string, living across the call=
, by `CStr` invariant.
> +        // * `parent` is a live `dentry` since we have a reference to it=
.
> +        // * `vtable` is all stock `seq_file` implementations except for=
 `open`.
> +        //   `open`'s only requirement beyond what is provided to all op=
en functions is that the
> +        //   inode's data pointer must point to a `T` that will outlive =
it, which we know because
> +        //   we have a static reference.
> +        #[cfg(CONFIG_DEBUG_FS)]
> +        let ptr =3D unsafe {
> +            bindings::debugfs_create_file_full(
> +                name.as_char_ptr(),
> +                0o444,
> +                self.0.as_ptr(),
> +                data as *const _ as *mut _,
> +                core::ptr::null(),
> +                &<T as DisplayFile>::VTABLE,
> +            )
> +        };
> +
> +        #[cfg(not(CONFIG_DEBUG_FS))]
> +        let ptr =3D {
> +            // Mark parameters used
> +            let (_, _) =3D (name, data);

`let _ =3D (name, data);` should be sufficient.

> +            crate::error::code::ENODEV.to_ptr()
> +        };
> +
> +        // SAFETY: `debugfs_create_file_full` either returns an error co=
de or a legal
> +        // dentry pointer, and without `CONFIG_DEBUGFS` we return an err=
or pointer, so
> +        // `Entry::from_ptr` is safe to call here.
> +        let entry =3D unsafe { Entry::from_ptr(ptr) };
> +
> +        File(entry)
> +    }
> +
>      /// Create a new directory in DebugFS at the root.
>      ///
>      /// # Examples
> @@ -137,3 +202,70 @@ pub fn new(name: &CStr) -> Self {
>          Dir::create(name, None)
>      }
>  }
> +/// Handle to a DebugFS file.
> +#[repr(transparent)]
> +pub struct File<'a>(Entry<'a>);
> +
> +#[cfg(CONFIG_DEBUG_FS)]
> +mod helpers {
> +    use crate::seq_file::SeqFile;
> +    use crate::seq_print;
> +    use core::fmt::Display;
> +
> +    /// Implements `open` for `file_operations` via `single_open` to fil=
l out a `seq_file`.
> +    ///
> +    /// # Safety
> +    ///
> +    /// * `inode`'s private pointer must point to a value of type `T` wh=
ich will outlive the `inode`
> +    ///   and will not be mutated during this call.
> +    /// * `file` must point to a live, not-yet-initialized file object.
> +    pub(crate) unsafe extern "C" fn display_open<T: Display>(

Why do these functions need to be pub?

---
Cheers,
Benno

> +        inode: *mut bindings::inode,
> +        file: *mut bindings::file,
> +    ) -> i32 {
> +        // SAFETY:
> +        // * `file` is acceptable by caller precondition.
> +        // * `print_act` will be called on a `seq_file` with private dat=
a set to the third argument,
> +        //   so we meet its safety requirements.
> +        // * The `data` pointer passed in the third argument is a valid =
`T` pointer that outlives
> +        //   this call by caller preconditions.
> +        unsafe { bindings::single_open(file, Some(display_act::<T>), (*i=
node).i_private) }
> +    }
