Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6EC35963
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234754; cv=none; b=oInOh+adpAZjiCWkGPRbjYUjuyROZbB0sZ16dyMn7TY5v8dggHbs+qAz/c4ymnJGwwBKcAGk//q3SF091NRj2V83VCZHU/3+SbsxkNLi/ddQOfbgjbj0M0PJA6gnQyA0OTcP+6ts/HC9sFfWiO9JbXLgjTODBdzOlWpBldd5TVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234754; c=relaxed/simple;
	bh=LSNhtgb4bGx+huxENi51BzSjcnT5El3b84UX/Aphoe4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SP4+W8rPE95hPMG+zGSOaR7jlFKMhB7BG1sA6enMJuQr8pa217lW8th9y1hdEW8JGsV65wQjutMZxKSkpjEVBJOgqwoSoTuZImBQ2P5zgpHSjW57/yU0eU9MmYVn2iq3dGenpkfR4Jx/3G9i4TOgfHhJEp6sYyfyx5ryjYYf8Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4lDTnAqy; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4lDTnAqy"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4f6cc5332so3752826f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750234751; x=1750839551; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EjaDW4eapCYtRtB2VTdwiBDlT26AJNq0bD2fmpFHne0=;
        b=4lDTnAqyTVvguEEGAM/rLVzFh8Cac2TsCUmBFkLVZXOUKohqLpmESvOgdSo3U4qRFr
         LqE+Mcp6aLN1Sx7nIsEsq6K5IQhEm8+zzw6u9EF+d6VqX3b33wosbpNnbvMnvTdCnA0r
         fSrbrXUY5fIADYWUsdg6K/KbwfdVzanbnnNGFrq3h8+eRgkqISE8hvjL0IapqxDev23f
         8A93RkyDTmX1PUupbCCbG04g3zVbl1UYHA41xqEJLmCAZOF0nTNzREnridiX8t1kPdg/
         YwmMMRmb07nC91KH4NOY63YPku2XPdSJhXJhSVIAX47aqyXaoF9kqPE5MUIHMTRCWTh3
         StNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234751; x=1750839551;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjaDW4eapCYtRtB2VTdwiBDlT26AJNq0bD2fmpFHne0=;
        b=ONe+NJoNk+0iIGMYxUWblhDGNB5fQrtVx2JRd1AD2J5tC9tDJNJqJPXp3srZFGkxIT
         JHPnnuG1p3pJRNFscpcohOjI78W6JwgOkpEVTsSw47fDO7A4AKHEcDemZUnqW1sBneYL
         +uLmTo8Vfuq1jYXoPJ+wjWL3C2bKekxrPfUjkMc0oeM48VodGTdBghQgdOm4Bs9N/Tp0
         GPl9sqnNyTn25VxJT97jGEAJ3noLR7OXFbcAWdByqFUJaRGU6Rb4faeExDO+mIJfkW7S
         n+fGsLDELVp1d+nSZgvB7NVFOU3GzWYc/OaU6v54Wxz6VAPrHwrjGI8UQTvbV2eDJVZN
         PITA==
X-Forwarded-Encrypted: i=1; AJvYcCXcwweEJtPDU5/m+iOrnj90QTIk7qGOzbmux24oLRT2ivRJe6J5r+catslzt2XbL738lFRAlj9nkLbRbcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVSo6W1U3Q01jejz58ym5St3p1yb1QFy3yqBy7zzy/IlEy+mM5
	41/zgNNEDwburK9D+AJv0EqNzJJb8na4Efj4DBSv4OlbLogEh9VHQTGEyfvM+09SsFj5jPA3vOY
	HmzTZ2dCMHpD2XeZQsg==
X-Google-Smtp-Source: AGHT+IEbUxwSHnhD0Ea4dL9XedV3QIyfupV5dWJUxquI4u3Z0Ik2mWqnx9KiiP/8Eb5Sr7sOGbkv8UDICYkg2Ko=
X-Received: from wmtg6.prod.google.com ([2002:a05:600c:8b56:b0:451:d70f:eb87])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2088:b0:3a5:3e47:8af5 with SMTP id ffacd0b85a97d-3a5723a26d6mr13759868f8f.27.1750234750702;
 Wed, 18 Jun 2025 01:19:10 -0700 (PDT)
Date: Wed, 18 Jun 2025 08:19:08 +0000
In-Reply-To: <20250618-debugfs-rust-v6-3-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com> <20250618-debugfs-rust-v6-3-72cae211b133@google.com>
Message-ID: <aFJ2fJ_pX8mWCQo6@google.com>
Subject: Re: [PATCH v6 3/5] rust: debugfs: Support arbitrary owned backing for File
From: Alice Ryhl <aliceryhl@google.com>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 18, 2025 at 02:28:15AM +0000, Matthew Maurer wrote:
> This allows `File`s to be backed by `Deref<Target=T>` rather than just
> `&'static T`. This means that dynamically allocated objects can be
> attached to `File`s without needing to take extra steps to create a
> pinned reference that's guaranteed to live long enough.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  rust/kernel/debugfs.rs | 51 ++++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
> index 6a89557d8cf49327d2984d15741ffb6640defd70..cd83f21cf2818f406575941ebbc6c426575643e4 100644
> --- a/rust/kernel/debugfs.rs
> +++ b/rust/kernel/debugfs.rs
> @@ -5,12 +5,13 @@
>  //!
>  //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
>  
> -#[cfg(CONFIG_DEBUG_FS)]
> +use crate::alloc::KBox;
>  use crate::prelude::GFP_KERNEL;
>  use crate::str::CStr;
>  #[cfg(CONFIG_DEBUG_FS)]
>  use crate::sync::Arc;
>  use core::fmt::Display;
> +use core::ops::Deref;
>  
>  #[cfg(CONFIG_DEBUG_FS)]
>  mod display_file;
> @@ -61,40 +62,59 @@ fn create(_name: &CStr, _parent: Option<&Dir>) -> Self {
>      }
>  
>      #[cfg(CONFIG_DEBUG_FS)]
> -    fn create_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
> +    fn create_file<D: Deref<Target = T> + 'static + Send + Sync, T: Display>(
> +        &self,
> +        name: &CStr,
> +        data: D,
> +    ) -> File {
> +        let mut file = File {
> +            _entry: entry::Entry::empty(),
> +            _data: None,
> +        };
> +        let Some(data) = KBox::new(data, GFP_KERNEL).ok() else {
> +            return file;
> +        };

We may want to consider using the ForeignOwnable trait here instead. The
trait is implemented by anything that can be converted to/from a void
pointer, so you can:

* When creating the file, convert it to a void pointer that you store in
  File and pass to debugfs_create_file_full.
* When displaying the file, create a borrowed version of the void
  pointer and display that.
* When freeing the File, convert the void pointer back into an owned
  value and drop it.

For cases where a box really is necessary, the user can create a box and
pass it themselves. But if the user already has a pointer type (e.g. and
Arc<T> or &'static T) then they can pass that pointer directly and the
pointer is stored as a void pointer without the Box indirection.

Alice
