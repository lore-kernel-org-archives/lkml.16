Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34AF25B1EC;
	Wed, 30 Apr 2025 12:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746014775; cv=none; b=vFtordpToBg9U0tesRB2hSVgNCGqc5fR1i3wF02V7f8RFJvIVXmhRnbxNR5t5tbKatBoM6lA5m35+vyfaqQntcDexnoT4jUIVy+hwXswfXorXyCndBqAzz/300YB2vC6JaAK9eBsPGad7IAMQYW3QCtKXwQbqu3jLRL+ZDkh0oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746014775; c=relaxed/simple;
	bh=6A+67h3C6xosmUB/HJfhAXJCsLv6bEg/SU1Fs7Fxz/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lm8cOxnphWjfKBQ0IXd+Y6LvN95Z96k0FK97t/3sM0jaGq7J4V1zyLGTcpJeG+bSmL1oLCIMgI6wcbRy15leWq/QKU94naBwF28i5ofgawmU2+0Ay+spYGmV8b7fVfPY0SKGL9kwPI3mOc/EFzg8c6cj5lXozh5Br9Nm00UW0kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WwKef+0B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WwKef+0B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB65C4CEE9;
	Wed, 30 Apr 2025 12:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746014775;
	bh=6A+67h3C6xosmUB/HJfhAXJCsLv6bEg/SU1Fs7Fxz/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WwKef+0B7YfCS/aMls+pP8YZgUuSP8xBiFsuLPdYsQQBv+k7yoRBznGw1/LwDlRL2
	 dSeiWehLyAHd4AhW4CDNRmnvIyrofh7Fxt7o2wnKTOZDOIHGVoodOwkkLSJwljb2Il
	 fktvuwjhUaa5dJA8LbBeao9UJbeUC6mLUPsIQUdU=
Date: Wed, 30 Apr 2025 09:57:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 3/8] rust: debugfs: Add scoped builder interface
Message-ID: <2025043035-married-petunia-9c1e@gregkh>
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-3-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-debugfs-rust-v1-3-6b6e7cb7929f@google.com>

On Tue, Apr 29, 2025 at 11:15:57PM +0000, Matthew Maurer wrote:
> This adds an interface which allows access to references which may not
> live indefinitely by forcing them to live at least as long as the
> DebugFS directory itself.

They can ONLY live as long as the debugfs directory lives, is that what
you mean here?

> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/debugfs.rs | 163 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
> 
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index b20df5fce692b3047c804f7ad5af90fc4248979b..f6240fd056f8598d5ef06bdaf61c5c33eab5b734 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -12,7 +12,12 @@
>  use crate::str::CStr;
>  use crate::types::{ARef, AlwaysRefCounted, Opaque};
>  use core::fmt::Display;
> +use core::marker::{PhantomData, PhantomPinned};
> +use core::mem::ManuallyDrop;
> +use core::ops::Deref;
> +use core::pin::Pin;
>  use core::ptr::NonNull;
> +use pin_init::{pin_data, pinned_drop, PinInit};
>  
>  /// Handle to a DebugFS directory.
>  pub struct Dir {
> @@ -117,6 +122,22 @@ pub fn display_file<T: Display + Sized>(
>          &self,
>          name: &CStr,
>          data: &'static T,
> +    ) -> Result<ARef<Self>> {
> +        // SAFETY: As `data` lives for the static lifetime, it outlives the file.
> +        unsafe { self.display_file_raw(name, data) }
> +    }
> +
> +    /// Creates a DebugFS file backed by the display implementation of the provided pointer.
> +    ///
> +    /// # Safety
> +    /// The pointee of `data` must outlive the accessibility of the `Dir` returned by this function.
> +    /// This means that before `data` may become invalid, either:
> +    /// * The refcount must go to zero
> +    /// * The file must be rendered inaccessible, e.g. via `debugfs_remove`

Perhaps the refcount should be the thing driving debugfs_remove()?  That
might save you lots of mess overall I think.

thanks,

greg k-h
