Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C22798F2;
	Tue, 27 May 2025 15:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748359207; cv=none; b=GZu00SCKrHMKyHE5f/KVCkOZ4n54FJ80eC9tyFf9H6uEXvdmyh/s9g8wtlpSPb9MQKugSQ/QvYvGlOAY0FxltSWXI8VGUc1Hdwj4L6v0Jp7PRLgzfbrbsm0pyzFZjKxoiVaSK4AY1YwjbJG4NM5hmRVViF2EVezLxb9MJ/eCKmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748359207; c=relaxed/simple;
	bh=VsjECM9fO+lFgr+TyE+VDf8ssNa1FGHUtWGtkO0ljZg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2LeNw2Py7OAFdT2SIzgsbMp2e3heQRsnKFlQfBh8dxUTd9gs9nVciAk1JjnnOfAibOk0nBcCCPPCTw6LLfjJdn5HJx1TbFSXKpdj4em/bz18/3SH6aR8f6AWkGzAbz40fvAoq/Ftck/811g6MUjhLmJX3kE2vC3z5RX0OICSXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2Z4llBc; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2Z4llBc"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c922734cc2so356845685a.1;
        Tue, 27 May 2025 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748359204; x=1748964004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouYJFb0hAZ8bd4LKUKYDZFznK1B4UiqX8DU8XMXGOtY=;
        b=Q2Z4llBc/scHpWnZUdYCrNK0aXq1Og9MNgtAmi2jXLFIhw8wy2DSfTPmwdiiWhcrE/
         G28B/SV2Hp3D9VFlbHVzS0UqqxmCS4i9IDYzcHuPDhRTjmpv+wEmlh/UxXnVu+76c16I
         ZlnhhMY+0K24sXdOKs0aOXQatTkASbTyRLYGPC9Hs6CncvQv9dHnQjK+jAQ1q7m0lvQv
         Y7g4pVeqO59o90UGSgTEv11vanjyG3VIYCeyzfnBR/gWtSEzP3UeosFD9gHQXsVR4IEu
         Odw+gEUmgT0Uxc+sNVW24su85E1GenLZseLfWGYsPgho00S7FKh9zquXKPy0nT6XhuGa
         uVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748359204; x=1748964004;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ouYJFb0hAZ8bd4LKUKYDZFznK1B4UiqX8DU8XMXGOtY=;
        b=fVHf3u9baiWb0a3LJx5y9zReWp3xAzsLxg7qWO3R4eaHbosV9WELWTbV1A00xmXwnb
         nyMdz8AIbolhH5v+2f6Y0PEp/1k9PGs9RAuHkKPLA5KwKjy60y+SuSWCXGR5lL9z5ncc
         vWSQFN4fh3x/Wf5/7FSZn4jUNnZHEti32nbPGKS1JIxe7YRyyvEbqt5KSuE9nO+wswik
         gpc3RlC/4Y0vThvYLqxVOzsfsX8Yki7UGGstoMPwrlRBfB0SBBtSzuxsYCtBc/eDm4K+
         ax+EP+qy5rVteARujwk6r7y/EPozPSx1KmgbeSoyauZ7vEolCZmkG29z+/Qt+vOUttcn
         gzRw==
X-Forwarded-Encrypted: i=1; AJvYcCUtx/BeUdrm45G2fbrKSrZ43PdpRxZZEmfFelHarcKBF9ikE52xKig/5DG2GUP+uJx7A/+XsJL1kLtYsEyQnO4=@vger.kernel.org, AJvYcCXx73ATCozXtpjo5K4dRE+YM6JvoG83l3HG3+2qLUmT7LIitRL7mdp4Zeky5AHhJnb0WbVhK1VxttkRzi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKBFSdy1NfSd5geAVUlRfeIEdiM542uZAeFrlUAwTRr2cG9DM
	D+N04zusW4Ruz7XvtIGlYeTxKU2PoGVdQyAk1m+ySa83MmPb93ubT8SH
X-Gm-Gg: ASbGncsjzF5fuzDTAK9baJ6XoAse7/l7C4WAH+dFmpfJpYrfuwsZiZTrr7xpT5hzz1t
	C/o9/RdGUa3pcSeFKy/ll9WF/SAhxnW3RuhBMyqjuom9tLVJ0iMhNe3xOekSbgYWf1IygH/I938
	VaygrFlZ9JmqodFGYTYjoBv6woZZazDmuxvWFv+N+D7Zu1BYUKyMlSbCAhQQenPzGdb7DqJz2/1
	2L9sPmToA/SOQaYSp+tBmMRx5r3/PEHhwUQIpuGhAVtdPVGqjrOiTpIYxMrUPNSAuh82SK07fJR
	dVIt3HMoXwaN6hPdHN78NITWk38Re0+DUgIyXnaeKY8NCzK2qIu6VVybImXvHGgES5jaLxuNrxR
	PpN1PjWf4ErgO+8mqDzQHC+N91uAQ79FNm2l36OHa6w==
X-Google-Smtp-Source: AGHT+IFu06GOsNPzB7j9iOnuud/9RgvwA4C/LP91K+85FcVBBPu9eu86qegVI+cxrlFXZTZjSj3sQA==
X-Received: by 2002:a05:620a:424a:b0:7ce:ea3c:39e7 with SMTP id af79cd13be357-7cf06d3cadbmr143718985a.10.1748359203673;
        Tue, 27 May 2025 08:20:03 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467eced4sm1747354785a.57.2025.05.27.08.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 08:20:03 -0700 (PDT)
Message-ID: <6835d823.050a0220.93bd2.dbfe@mx.google.com>
X-Google-Original-Message-ID: <aDXYIFKGDePJhBgM@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 674251200066;
	Tue, 27 May 2025 11:20:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 27 May 2025 11:20:02 -0400
X-ME-Sender: <xms:Itg1aH8BfmkEls7WYUjywIXd-0XK4R-Zjmtl8hOaN8DFySS5-Z0BCQ>
    <xme:Itg1aDvZCOv4rucCY42o387R9NSVKyvF0ott3pwj67CGMq3LEjvT6lIk7i5mAGU_9
    r9LOyHlrQ_lcIhZsg>
X-ME-Received: <xmr:Itg1aFDYs2mZtN678UMeQlHkskO8RXo278tShCh2HoM9XHUwBwVyXsDselWo_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvtdejvdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquh
    hnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepjeffgeeijedv
    tdfgkeekhfejgeejveeuudfgheeftdekffejtdelieeuhfdvfeegnecuffhomhgrihhnpe
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhroh
    esiigvnhhivhdrlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepghhrvghgkhhhsehl
    ihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnug
    gsrdguvgdprhgtphhtthhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdho
    rhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsg
    hjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhn
    ohdrlhhoshhsihhnsehprhhothhonhdrmhgv
X-ME-Proxy: <xmx:Itg1aDdmjqSWt2CZLJu_h95b8niIQssDQFT_Ph7VT1vL80SnoyHzBA>
    <xmx:Itg1aMOzbinbrjTLj_ohIOGcPuYMcbcEFVhGOulFQDy4-wXOSdz8fQ>
    <xmx:Itg1aFlYTmzWAhRURZgZJfZC0y_OC4NPC4MQudMF1SNZLCn3Izw-EQ>
    <xmx:Itg1aGslZZPwi3DedR-EasfeqWst-e93IXMI0J-DGPtI_JDxKVAmfA>
    <xmx:Itg1aGvdA_OZU5phrwy_ilz46KuRix5-AaFhNKxUzZU2RksZr7z3Y4lt>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 May 2025 11:20:01 -0400 (EDT)
Date: Tue, 27 May 2025 08:20:00 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] uaccess: rust: use newtype for user pointers
References: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-userptr-newtype-v2-1-a789d266f6b0@google.com>

On Tue, May 27, 2025 at 01:53:12PM +0000, Alice Ryhl wrote:
> In C code we use sparse with the __user annotation to detect cases where
> a user pointer is mixed up with other things. To replicate that, we
> introduce a new struct UserPtr that serves the same purpose using the
> newtype pattern.
> 
> The UserPtr type is not marked with #[derive(Debug)], which means that
> it's not possible to print values of this type. This avoids ASLR
> leakage.
> 
> The type is added to the prelude as it is a fairly fundamental type
> similar to c_int. The wrapping_add() method is renamed to
> wrapping_byte_add() for consistency with the method name found on raw
> pointers.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

A question below:

> ---
> This is based on top of the strncpy_from_user for Rust patch.
> ---
> Changes in v2:
> - Change usize to raw pointer.
> - Make field private.
> - Rename wrapping_add to wrapping_byte_add.
> - Add to prelude.
> - Rebase on v4 of strncpy_from_user
> - Link to v1: https://lore.kernel.org/r/20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com
> ---
>  rust/kernel/prelude.rs           |  2 ++
>  rust/kernel/uaccess.rs           | 68 +++++++++++++++++++++++++++++++++-------
>  samples/rust/rust_misc_device.rs |  2 ++
>  3 files changed, 60 insertions(+), 12 deletions(-)
> 
> diff --git a/rust/kernel/prelude.rs b/rust/kernel/prelude.rs
> index baa774a351ceeb995a2a647f78a27b408d9f3834..081af5bc07b0bcefb1da16e5a81fc611b3178aea 100644
> --- a/rust/kernel/prelude.rs
> +++ b/rust/kernel/prelude.rs
> @@ -41,3 +41,5 @@
>  pub use super::init::InPlaceInit;
>  
>  pub use super::current;
> +
> +pub use super::uaccess::UserPtr;
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index e6534b52a1920254d61f8349426d4cdb38286089..02e0561eb1c6f4d813a4ab13a124bfac2d2a5c75 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -14,8 +14,48 @@
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
> +pub struct UserPtr(*mut c_void);
> +
> +impl UserPtr {
> +    /// Create a `UserPtr` from an integer representing the userspace address.
> +    pub fn from_addr(addr: usize) -> Self {
> +        Self(addr as *mut c_void)
> +    }
> +
> +    /// Create a `UserPtr` from a pointer representing the userspace address.
> +    pub fn from_ptr(addr: *mut c_void) -> Self {
> +        Self(addr)
> +    }
> +
> +    /// Cast this userspace pointer to a raw const void pointer.
> +    ///
> +    /// It is up to the caller to use the returned pointer correctly.
> +    #[inline]
> +    pub fn as_const_ptr(self) -> *const c_void {
> +        self.0
> +    }
> +
> +    /// Cast this userspace pointer to a raw mutable void pointer.
> +    ///
> +    /// It is up to the caller to use the returned pointer correctly.
> +    #[inline]
> +    pub fn as_mut_ptr(self) -> *mut c_void {
> +        self.0
> +    }
> +

why are these two inline but the rest not?

Regards,
Boqun

> +    /// Increment this user pointer by `add` bytes.
> +    ///
> +    /// This addition is wrapping, so wrapping around the address space does not result in a panic
> +    /// even if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
> +    pub fn wrapping_byte_add(self, add: usize) -> UserPtr {
> +        UserPtr(self.0.wrapping_add(add))
> +    }
> +}
>  
[...]
