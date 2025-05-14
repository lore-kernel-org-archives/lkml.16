Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51EA20CCD9;
	Wed, 14 May 2025 07:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747208005; cv=none; b=lBq9xxoDZy8zLKLx9BEfG/0ai8zcLhO2stUbhzK7vPqEgBBikvUCJCf3WIb5oe6IRJ6oe0ZQtCebb9NoU6HVH0ZikkDBlNx4k9um0H5nH1DSoyFyazSOStDw9h8N3qMgntW7vDsLpRQt432VYvOhAnZfl+F6jHJSWqBXkLhmXRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747208005; c=relaxed/simple;
	bh=HI4qVwaCmpoKmi6U3vW1r5w/+zQcR1E/yoOeRijmsB0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fO0u5WqFT4NkMLQ3/XyuqtxbWnPgD0kTL08Ce3b2cKxrm+tqEcAMFPROXkwvAWm0F0ecGpl5pUmBO+qYFz1mEKfAB/dG1XXf5PoJjgUImpGKl0Q5wfCI46i+Z+ZR1Dv6FH7k8iksCBAMgBLVtNzs54HRwQrFvhtj70NNj6iLHoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5ieJ2CA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5ieJ2CA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96D4C4CEE9;
	Wed, 14 May 2025 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747208005;
	bh=HI4qVwaCmpoKmi6U3vW1r5w/+zQcR1E/yoOeRijmsB0=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=W5ieJ2CALmVX0wA/uobZ4i+z3MRBSne/BKAKI3ubo4Tq2uN22ZlrIE1VDoxbre2WH
	 xeVN5V0JixJYpqV1LoRhKk78evwxSDD5eQjtmydewF3DX1czVOnADcse7sU7m0j2EH
	 V1QDWpaYf/3KObj8+xwIWkqMl/d02rlF8UjeqkSSe1iQMqKyI9/6MhKULa+UudadKA
	 lNm5VGPAzCfkxb6bXCoiLNqZZmmpMalpW6DdZu3Cmu76xIOolIBr2H77T2S69IG2po
	 a9gcuaRJqao3AvCe0av6h7OrvOr6JXK5aFcq96a3zEcp9g2BIYHZOFj5fdANiAYbga
	 RwuIpXE0uzRtA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 May 2025 09:33:05 +0200
Message-Id: <D9VPJFJ44PUP.3D0HGIEJC9UGY@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 1/4] rust: debugfs: Bind DebugFS directory creation
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
X-Mailer: aerc 0.20.1
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-1-3e93ce7bb76e@google.com>
In-Reply-To: <20250505-debugfs-rust-v5-1-3e93ce7bb76e@google.com>

On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> +impl<'a> Dir<'a> {
> +    /// Create a new directory in DebugFS. If `parent` is [`None`], it w=
ill be created at the root.
> +    #[cfg(CONFIG_DEBUG_FS)]
> +    fn create<'b>(name: &CStr, parent: Option<&'a Dir<'b>>) -> Self {
> +        let parent_ptr =3D match parent {
> +            Some(parent) =3D> parent.0.as_ptr(),
> +            None =3D> core::ptr::null_mut(),
> +        };
> +        // SAFETY:
> +        // * `name` argument points to a NUL-terminated string that live=
s across the call, by
> +        //   invariants of `&CStr`.
> +        // * If `parent` is `None`, `parent` accepts null pointers to me=
an create at root.
> +        // * If `parent` is `Some`, `parent` accepts live dentry debugfs=
 pointers.
> +        //   so we can call `Self::from_ptr`.
> +        let dir =3D unsafe { bindings::debugfs_create_dir(name.as_char_p=
tr(), parent_ptr) };
> +
> +        // SAFETY: `debugfs_create_dir` either returns an error code or =
a legal `dentry` pointer,
> +        Self(unsafe { Entry::from_ptr(dir) })
> +    }
> +
> +    #[cfg(not(CONFIG_DEBUG_FS))]
> +    fn create<'b>(_name: &CStr, _parent: Option<&'a Dir<'b>>) -> Self {
> +        Self(Entry::new())
> +    }
> +
> +    /// Create a DebugFS subdirectory.

I'm not familiar with debugfs, if I run `Dir::create(c"foo", None)`
twice, will both of the returned values refer to the same or different
directories? What if I give a parent?
If the answer in both cases is that they will refer to the same
directory, then I'd change the docs to mention that. So instead of
"Creates" we could say "Finds or creates" or something better.
If they refer to different files, then I am confused how that would look
like in user-land :)

> +    ///
> +    /// Subdirectory handles cannot outlive the directory handle they we=
re created from.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let parent =3D Dir::new(c_str!("parent"));
> +    /// let child =3D parent.subdir(c_str!("child"));
> +    /// ```
> +    pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b> {
> +        Dir::create(name, Some(self))
> +    }
> +
> +    /// Create a new directory in DebugFS at the root.

Ditto here.

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::c_str;
> +    /// # use kernel::debugfs::Dir;
> +    /// let debugfs =3D Dir::new(c_str!("parent"));
> +    /// ```
> +    pub fn new(name: &CStr) -> Self {
> +        Dir::create(name, None)
> +    }

I think it would make more sense for this function to return
`Dir<'static>`.

---
Cheers,
Benno

> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index c3762e80b314316b4b0cee3bfd9442f8f0510b91..86f6055b828d5f711578293d8=
916a517f2436977 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -45,6 +45,7 @@
>  #[doc(hidden)]
>  pub mod build_assert;
>  pub mod cred;
> +pub mod debugfs;
>  pub mod device;
>  pub mod device_id;
>  pub mod devres;

