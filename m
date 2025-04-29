Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B942528F1;
	Tue, 29 Apr 2025 17:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745947858; cv=none; b=FVunb8ms+gAz/IqCE4NSD+av1abxqWb01ujTnzlgbVc17xMg5+dcRRA0ZbTDfDMl+kYOt997qsIoO9C2+tPNVZ8phld1PEq0FWnBSxsnqMSV2DkhLCQf1H64OORmOWDZddZM4BJHMRd7piaauR2X2oMeVnp1JBKSMB5vWLZjNqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745947858; c=relaxed/simple;
	bh=00vgP1bIqqH7MWVKeLE4cJSbUGKxLK6u0es2ZYE1AP8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwqB9h966Dhz1QQDnseGZbwQUbBMv5TK7OSYOAMCOVI5cQYc2HpaJFdHhtRcUZ0YPxYvbf8XcA9S8EY88Nir/sI7+gVDI2IvxxppyTLcV6Qx0DvPqmN5qXED5n1sNYLMitmXvSem3hErQTIDSLxAoD8sWO+sYbnr/N+NFutOXsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7m3PP1S; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7m3PP1S"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4769bbc21b0so74832111cf.2;
        Tue, 29 Apr 2025 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745947855; x=1746552655; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z5AXajw/C8WpnuJpNsbplfFcQIgdAvW2fQjEHy070c=;
        b=J7m3PP1SWfLE/mXlhAal+FeEVxAcPMu0JA5roMjHJ6BEyNXFQQ8WwIN0Ljcpv2nx3C
         kaueovktgu9Z9WK22fmixfr4kJ/gYls8t8zVJ6GUwFJ4ObhF2tUg2//MOg240/Xo2YeW
         fFmQpZ4cp20ce/q1rxstveGL5b39aGUe75dyMwCd8Xuh+08RDX8Gil9eTeA860GGXOHW
         6jrRU8KeKkDaac3jzsW/Ifr1ZGQvWvJgrY8dLb7+prSAWFdEQsZOVDRkOhH83y8EXcaX
         mxcRGk2lY4yHBL2GghXYNDnsdZMNqmk4wfDfygINYP1+Xq0SMTpx3kYQlEuwDCn/TX/z
         WK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745947855; x=1746552655;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7z5AXajw/C8WpnuJpNsbplfFcQIgdAvW2fQjEHy070c=;
        b=mHChjU/B8UVz62wB1iqCimUrI70MkP7uvVckIlwJ0MdjPc/72xrlAev92zLTWKPhoq
         1/sUw7Ow40MfYZum/OcWWE6nsIvjHDIfdKJx/1mernQa175MmwOlKLS66KdRFrT+Qe5m
         yY4O/Q1cNNTQ4ZNQvhlvfgaJELVSjS6BOHhb4PvtSFGYWhwyzMDe9yOkaIhyRVDexJVj
         E9L1TWuhC/fptoLCMpN747nMWNjhPogj2KPnbF6xUhpdEz2jqvxODprrFgp+JzhcK6ox
         2w2BDBRqshOMAfq7l+ZNJj+4ExRMs2v+FC1G2ztYWZcx+ZMZnezNwfoigTTnW+Qdwa/M
         4qsA==
X-Forwarded-Encrypted: i=1; AJvYcCWqEdKUbhU3eDhdkM/TbRhokxyGv/5ScPp70vFgTDrp4ht79cVJDcjnMwQqf0I2x52eb0DTDTfhuFyxkn4=@vger.kernel.org, AJvYcCX8w9BXDQNZL+LDz4WyD2SCPlcQTSHRzAn8WhPOnFMnQXsTGNp8ZuOAwG4vfkny24wI2ILuhwTT88a6Trq2X4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7d8+zWksSboGXc5RIg1kZ2oted1KT127cY3eEhBwGZKzYu9IS
	msJunwh8GdiDxchg2XbjbAY/TFDHU5B8f8ZflKIHoq3MeJe4/BXP
X-Gm-Gg: ASbGnctCr+GMSR/CYS7WXJiRJy60qyJGD8mwZDTFSFyop38att23gzGK3XI1scDTHOi
	e6sV0bU6FqLMUdt/X31hFeXB+uU4giOFe2P//lNk5aX408MMzNVu7tbHRl8cSugiD9ztjTRw476
	0bmJMhuZq4amdjqQYd4GdnECAEXy79MMJpuc1r2HfPAQFwvtvIsJdzy3iThkveevFX2+NmWNapE
	acTQRWwWGaHdPVnJifgE21iqnT1OkDNiW5pyESURYV/DZq6Z3jvZepk8mifscQJ5/Kqw261h47V
	SclrTn7dSuGWpz2sI4GYq4/Ne22lu918L3wGJs4+htvF6ABI9aCB9nHY7iRwp3PDOJ/DLpLR1ge
	5TYnapp6D4BIlWivab7ZG/tV1sFhtokE=
X-Google-Smtp-Source: AGHT+IGf67ViGZrKsVY6rR4rx2xO7httPR4JY2IVPzHT4tsxHaAqO8z0fOTJyQQzIfRqmAM2UQGg1Q==
X-Received: by 2002:a05:622a:5590:b0:476:7018:9ae4 with SMTP id d75a77b69052e-4886bccf0f2mr55269061cf.16.1745947855278;
        Tue, 29 Apr 2025 10:30:55 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9eaf20e4sm82027391cf.3.2025.04.29.10.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 10:30:54 -0700 (PDT)
Message-ID: <68110cce.c80a0220.3b03fb.43d0@mx.google.com>
X-Google-Original-Message-ID: <aBEMy-OwfEIS0H6K@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6B8031200043;
	Tue, 29 Apr 2025 13:30:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 29 Apr 2025 13:30:54 -0400
X-ME-Sender: <xms:zgwRaHjA24QJlpTX_AmDwbBXaLSVucATMJz9F6ZepArLLFuBirBwsA>
    <xme:zgwRaEDfEsfu6d5qXGBFoDGiC82xAe6ViS0m4vXm9WkgRQSgIFtt_Obsg2JeWxmwr
    k4iz3uYsYD1BlMPzg>
X-ME-Received: <xmr:zgwRaHHm_P0LASICd9-DlE5OGkumhmXSpBTadB4_pi5N4QWTYsLO-BQQ4KI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeggedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvg
    drtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepvh
    hirhhoseiivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehgrhgvghhk
    hheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
    rghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrd
    hmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:zgwRaEQQxw4mIzNMJVaWVmP2ZUazeZAcStAbY97ZpuwRvM1uI-s9Jg>
    <xmx:zgwRaEzJUlanODTTolKbhNQXAF3CRziHZ0nKDPJpVgQGqmaO8PUT2g>
    <xmx:zgwRaK6ZEB3j7c20riFl6Jh6Rps3YcDMFtlO2YkchTK4iq_F7735mA>
    <xmx:zgwRaJxUKU1L957fFoPqBC52PghXmQJk_wPYFj8uesXusSr9lQupdw>
    <xmx:zgwRaEj7HU0rGI1Z9gCSupLo6By95enMo34hy0FSHqcN7PAykK9mA_CH>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Apr 2025 13:30:53 -0400 (EDT)
Date: Tue, 29 Apr 2025 10:30:51 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] uaccess: rust: add strncpy_from_user
References: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
 <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429-strncpy-from-user-v2-1-7e6facac0bf0@google.com>

On Tue, Apr 29, 2025 at 09:02:22AM +0000, Alice Ryhl wrote:
> This patch adds a direct wrapper around the C function of the same name.
> It's not really intended for direct use by Rust code since
> strncpy_from_user has a somewhat unfortunate API where it only
> nul-terminates the buffer if there's space for the nul-terminator. This
> means that a direct Rust wrapper around it could not return a &CStr
> since the buffer may not be a cstring. However, we still add the method
> to build more convenient APIs on top of it, which will happen in
> subsequent patches.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/uaccess.rs | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 80a9782b1c6e98ed6eae308ade8551afa7adc188..acb703f074a30e60d42a222dd26aed80d8bdb76a 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -8,7 +8,7 @@
>      alloc::{Allocator, Flags},
>      bindings,
>      error::Result,
> -    ffi::c_void,
> +    ffi::{c_char, c_void},
>      prelude::*,
>      transmute::{AsBytes, FromBytes},
>  };
> @@ -369,3 +369,35 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
>          Ok(())
>      }
>  }
> +
> +/// Reads a nul-terminated string into `buf` and returns the length.
> +///
> +/// This reads from userspace until a NUL byte is encountered, or until `buf.len()` bytes have been
> +/// read. Fails with [`EFAULT`] if a read happens on a bad address. When the end of the buffer is
> +/// encountered, no NUL byte is added, so the string is *not* guaranteed to be NUL-terminated when
> +/// `Ok(buf.len())` is returned.
> +///
> +/// # Guarantees
> +///
> +/// When this function returns `Ok(len)`, it is guaranteed that the first `len` of `buf` bytes are
> +/// initialized and non-zero. Furthermore, if `len < buf.len()`, then `buf[len]` is a NUL byte.
> +/// Unsafe code may rely on these guarantees.
> +#[inline]
> +pub fn raw_strncpy_from_user(ptr: UserPtr, buf: &mut [MaybeUninit<u8>]) -> Result<usize> {
> +    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
> +    let len = buf.len() as isize;
> +
> +    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
> +    let res = unsafe {
> +        bindings::strncpy_from_user(buf.as_mut_ptr().cast::<c_char>(), ptr as *const c_char, len)
> +    };
> +
> +    if res < 0 {
> +        return Err(Error::from_errno(res as i32));
> +    }
> +

Nit: this can be a

	let copy_len = kernel::error::to_result(res)?;

Other than that,

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> +    #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> +    assert!(res <= len);
> +
> +    Ok(res as usize)
> +}
> 
> -- 
> 2.49.0.901.g37484f566f-goog
> 
