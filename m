Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E1C2EE26E;
	Wed, 18 Jun 2025 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750261151; cv=none; b=tOqscMIRsfEo7pUnxPXrZZ1UJwqXU9/qj67N6b+AQ07Mlsx0NKzUY9Vcd58oYl0hOWJQlEsdCN6Tz2oTVSgUCQCOzGDZAmHa8oql4aPfRWhIEc+EPW1YHGKUJR2nPWgUip7RQs6hppWuK3hv3KoJ6dcfoO303F4UpECmp8sjaUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750261151; c=relaxed/simple;
	bh=JFhh7AKrOKzUvlarIRdE++QBY1DcQFVTi2V5HaWpvx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iv6IiwsR8ibCFT/mQghq1oU5LRI4UkE7NZepVS+4vAMMcr1UomiV9+nJi/1W8os9ivOyxFpuMQay1FYk2dClIkUFuuflp6ZArlzFyxmfR/ejj89PwShfJoK1R450sH42+t3148706m4ObLnTPa3F6YaSqkUEDu8dPZozvNA+UXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhsmriF9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhsmriF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C62C4CEE7;
	Wed, 18 Jun 2025 15:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750261151;
	bh=JFhh7AKrOKzUvlarIRdE++QBY1DcQFVTi2V5HaWpvx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HhsmriF9FnTh9MW53Z58uEg37HWWlwyNmE4wdGHezwXX2E+2JLj92AKSg6bF7zcGD
	 l0gKVdL8Zzq/YKnlTTSqBWNa4sxZkFrKeUiIumyD0XS1FBc5kPDKUlT5+W6vYj52uI
	 9zRwbrj0d7IQksCxU+doEkSWgSiaYkJ7eTMhoCUhsre0ucbCM1HqG3GdOFofou1VDk
	 Mtg/sQow7zbSR0S5LI5hfma4kezfmrl4mmNOZ2HMhLrt3lneiBASXLwbU4XKyqVFwS
	 EozLEjRzVk5srE4khhRd66rmiuohplGtHpuyiz1n3TA0TDxUraGKsONIifmHdSwIO+
	 WL085dnbz7BzQ==
Date: Wed, 18 Jun 2025 17:39:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 2/5] rust: debugfs: Bind file creation for long-lived
 Display
Message-ID: <aFLdmYLyDucTAiZx@pollux>
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
 <20250618-debugfs-rust-v6-2-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-debugfs-rust-v6-2-72cae211b133@google.com>

On Wed, Jun 18, 2025 at 02:28:14AM +0000, Matthew Maurer wrote:
> diff --git a/rust/kernel/debugfs/display_file.rs b/rust/kernel/debugfs/display_file.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..65e37e34d7b587482492dc296637a3bc517b9fe3
> --- /dev/null
> +++ b/rust/kernel/debugfs/display_file.rs
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2025 Google LLC.
> +
> +use crate::seq_file::SeqFile;
> +use crate::seq_print;
> +use core::fmt::Display;
> +
> +/// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
> +///
> +/// # Safety
> +///
> +/// * `inode`'s private pointer must point to a value of type `T` which will outlive the `inode`
> +///   and will not be mutated during this call.
> +/// * `file` must point to a live, not-yet-initialized file object.
> +pub(crate) unsafe extern "C" fn display_open<T: Display>(
> +    inode: *mut bindings::inode,
> +    file: *mut bindings::file,
> +) -> i32 {

Please use kernel::ffi::c_int instead.

> +    // SAFETY:
> +    // * `file` is acceptable by caller precondition.
> +    // * `print_act` will be called on a `seq_file` with private data set to the third argument,
> +    //   so we meet its safety requirements.
> +    // * The `data` pointer passed in the third argument is a valid `T` pointer that outlives
> +    //   this call by caller preconditions.
> +    unsafe { bindings::single_open(file, Some(display_act::<T>), (*inode).i_private) }
> +}
> +
> +/// Prints private data stashed in a seq_file to that seq file.
> +///
> +/// # Safety
> +///
> +/// `seq` must point to a live `seq_file` whose private data is a live pointer to a `T` which is
> +/// not being mutated.
> +pub(crate) unsafe extern "C" fn display_act<T: Display>(
> +    seq: *mut bindings::seq_file,
> +    _: *mut core::ffi::c_void,
> +) -> i32 {

kernel::ffi::c_int

> +    // SAFETY: By caller precondition, this pointer is live, points to a value of type `T`, and
> +    // is not being mutated.
> +    let data = unsafe { &*((*seq).private as *mut T) };
> +    // SAFETY: By caller precondition, `seq_file` points to a live `seq_file`, so we can lift
> +    // it.
> +    let seq_file = unsafe { SeqFile::from_raw(seq) };
> +    seq_print!(seq_file, "{}", data);
> +    0
> +}
> +
> +// Work around lack of generic const items.
> +pub(crate) trait DisplayFile: Display + Sized {
> +    const VTABLE: bindings::file_operations = bindings::file_operations {
> +        read: Some(bindings::seq_read),
> +        llseek: Some(bindings::seq_lseek),
> +        release: Some(bindings::single_release),
> +        open: Some(display_open::<Self> as _),

Why the cast? That shouldn't be needed.

> +        // SAFETY: `file_operations` supports zeroes in all fields.
> +        ..unsafe { core::mem::zeroed() }
> +    };
> +}
