Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26A01E47AD;
	Tue,  6 May 2025 17:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554238; cv=none; b=hD0+3ZS1amamUt6bs+k5RHQgyMN7u6dpYoRMkTXZj8Y8MoP0lZ2nauyl49bpX8deyhCU5tuxEuGtHZrTblQwDYcCAsl/G8ldjcH7QS8aVRGjiot8QhlVhft61u/GGaxAhBEgL1+PiErxfGpLIZXL3sAM/xoHIedzM66gd4OLdhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554238; c=relaxed/simple;
	bh=shtZ+r1+/SjUBjJsnMCDHWk9A2h+NbdCwrh658A76hA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsEXFxNOzJlGwp3DGn8B1P7W4rcUL6u1mCz9cdmtWlhIqqDy99USyDA0pIZ4QMIpjohvNbvIDJhxj8aKlres4pLGOb9nfKnCjMZHR17Yt3B06OERzzpsrgKLI17R832bDimSE6aZYNSFbPVbuUyapDxJY+p4yK9jRhRx7TgmUwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=smZIHA4i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="smZIHA4i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B183C4CEEB;
	Tue,  6 May 2025 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746554238;
	bh=shtZ+r1+/SjUBjJsnMCDHWk9A2h+NbdCwrh658A76hA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=smZIHA4ihCm65zRb9A8x7EW/uVgwi24lQZGa5GS4hUF2pAnWyYeLGHAFfMiBdwr65
	 lWOACmJjP4pf8hAM0sFtz6b6Zv/FGSFFkTh61lHYpdc/u9zGntIRRPoXYRFV6hx2Ex
	 IReRq02FO+GwMKSQDsle8baBxzpxAxzaVx48cT9E=
Date: Tue, 6 May 2025 19:57:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] uaccess: rust: use newtype for user pointers
Message-ID: <2025050619-eraser-kissing-006e@gregkh>
References: <20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com>

On Tue, May 06, 2025 at 01:25:58PM +0000, Alice Ryhl wrote:
> In C code we use sparse with the __user annotation to detect cases where
> a user pointer is mixed up with other things. To replicate that, we
> introduce a new struct UserPtr that serves the same purpose using the
> newtype pattern.
> 
> The UserPtr type is not marked with #[derive(Debug)], which means that
> it's not possible to print values of this type. This avoids ASLR
> breakage.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/uaccess.rs           | 48 ++++++++++++++++++++++++++++++++++------
>  samples/rust/rust_misc_device.rs |  4 +++-
>  2 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 978205289d297a4001a51fa40ac29039bff73672..2914a35de3dfbc7860ebf0d6e11cc65d409e9481 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -14,8 +14,38 @@
>  };
>  use core::mem::{size_of, MaybeUninit};
>  
> -/// The type used for userspace addresses.
> -pub type UserPtr = usize;
> +/// A pointer into userspace.
> +///
> +/// This is the Rust equivalent to C pointers tagged with `__user`.
> +#[repr(transparent)]
> +#[derive(Copy, Clone)]
> +pub struct UserPtr(pub usize);

Again, why can't this be:
	pub struct UserPtr(pub *const u8);

This is a pointer to a stream of u8 bytes, so let's treat it like that
as that is what we are copying from here.

thanks,

greg k-h
