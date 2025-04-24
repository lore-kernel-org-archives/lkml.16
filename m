Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D5027B508;
	Thu, 24 Apr 2025 15:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745510240; cv=none; b=IPscT7GtaK/4EXuvOOSWzRA4rYCrQkbHC/1gKsVi2qSCEVfwdjYVNi2qOSgSsykKEErvxJNWkZ/D1gbH3Z/zXXF8iCc+eSZaGW0rTDqHwU7gsSyXSsGtGZH/4K/A4blFtQvpIhh6JKGLnF5NNjI+7FRTEe4zDaC2XttRuymgokM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745510240; c=relaxed/simple;
	bh=yGnKRKir5CWdHLM8+GR/2wc8O1hvqXv1nna2yOR+ESw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbDIVfITOBLU2v6hh2LjoWrWvXD5pA0GJdt23gXUdLrWQzQ0ufHn44s+poIHgcxUAJmXOkMvgeWvXXEEwHGiYeFy8rWERxoMNa3otQhWRB4j3U+EDPmrVsNeIXfacNFlK791CG1eRYZ7xzg9i6Oj4kCW+cjwOgiI2rOpxO6Y5/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AlpOY09F; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AlpOY09F"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c5e39d1e0eso128254785a.1;
        Thu, 24 Apr 2025 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745510238; x=1746115038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NxQeWbkMyuwKBWgdQlTj3gkmzk6nmzq6DBCz9r3oz4=;
        b=AlpOY09FzWERpy8ezGKuFZQlAn9x0BOi7smhrj/2zzd5KK8fe2eJhXbItiBMGep/+D
         zukafoMHqlC6SM3vqbh2toAxRRPbwHlGv7IcNJSn1DcNHOSgsepu3MzHT/H3T5QUokbX
         q6nf//OKWceNUSVhKEmyTP7ByD0jv3PF4yOdNjjK1baE8WymU76/wYWmcBvDUa/ckeN4
         +1wKQRT1k2PKz2Tna95i/RqMA7eCcIORyVeTUQJ7PfbjcEzojOBhMBD6tSD/l0TJhset
         /PBgEfkQMNeWbx/vzyKWTzIgg5rnPRAd49IadasfXX9vO43g3+aWM0kQvOtdgEGknDjG
         TA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745510238; x=1746115038;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NxQeWbkMyuwKBWgdQlTj3gkmzk6nmzq6DBCz9r3oz4=;
        b=XOkI4YgZQTMwSziw9Z5nlV0WEDWoP4JEGy/YcfuHh8KHfKKadzb4YJhRZsffBlTGfA
         d2AVv0n4dJOJTmAZkqeBYXcXjVeC/ykVDnxCRNX4MNUiIWf5mrAb8Yk3HvrN8w4UxJbL
         Ovrp0UHOxkjD1cj5wwhcrA7oV6CR04eeSw5LlcT384fuPnWuhbRYiy5NUy2A/li+POUZ
         lgCyw4NjcxE1PKeJJ6jiyqv316fHv/cmaAVSzMNZl/51K+kefXThQ5Bb+oNLCwkSNBmS
         Yh4IiP8wykdtu7KqWF/GHGDOPZ3pWIYqH0NFjfFzpz5VBlvsymQoabSux5+SUwX0Vdxn
         8Vrg==
X-Forwarded-Encrypted: i=1; AJvYcCVnbvp4bS/7ckG9vXrYs/D9vh8wFQih1ygK6erHRXqZ4xWdO8XdSp18uK2zv8P9A59o9b8i5l3c5XR7+zY=@vger.kernel.org, AJvYcCXEEtciMRtuHLti/it6FGb3TYcI0FWUE1QnKc0nENiP5bTwCPU2sp6s9NIAYYNsBY2zO7/sEbQArJ1DH/nWlVg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ffK9YevoqhQeXm3+rmC5+0jhNz/XCpF7fMeEs9g2+v1mjoXR
	VqNCpl0wOuD+exfGxTQE6Ex0xsefnFnMuRkfoLwB04phSmk23OXN
X-Gm-Gg: ASbGnctI0vJdm5+ecGCzu8U4N6Jr8ShGAQ8PXuhRafMDwxbuHlkVOdvBu1CoHPytTbQ
	z+JgLOJdOlZYaEyfUEmtsm61Ob+larwiYJ8EbokA8xPPa/z/oSUeHGBhoI5JC4iQ2qZToDMtFtV
	giQZ7ewOD5I77S7U7+Q07a3Qf4gdVdBJ/CBr4GtAWXLAhNh8oIhzZJg/JsfH887PTJZnTvgpo7+
	tIBQf0Mfe3/ME1hs7evh22cmtHvcBkOmOABbMhehNpcedAm1TKyCfJO8WO9sZtcJ8Y0iZwgYQQc
	blkFQgeZI1kr4/Tnok+WfRP+Np5ECpKQF9W6WSsW8mWwiX0zxGJWLCyTW6ntdHP/Af8SA67fSiW
	4ggQSoC9yxnB2YKOhGgJ/gLLc/DWxWb9Pcd8f2rKT7A==
X-Google-Smtp-Source: AGHT+IF0gCm0iSOAFEyb8HnqqUinMlFNn3AbjKbRYEyksxhDhTb5c+QUAlXHlheQwPFBbk5ZGtx6tQ==
X-Received: by 2002:a05:620a:2551:b0:7c7:a5cb:2b65 with SMTP id af79cd13be357-7c956ed3884mr434348485a.26.1745510237628;
        Thu, 24 Apr 2025 08:57:17 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cdeb4dsm101941985a.63.2025.04.24.08.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:57:17 -0700 (PDT)
Message-ID: <680a5f5d.050a0220.2035d2.545b@mx.google.com>
X-Google-Original-Message-ID: <aApfWTTg05lEMvWN@winterfell.>
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8EC451200068;
	Thu, 24 Apr 2025 11:57:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 24 Apr 2025 11:57:16 -0400
X-ME-Sender: <xms:XF8KaLax0Db-MSiBMZGXlT8jQkzE23dqTbPTQHZ91pi7G91B8E_XTQ>
    <xme:XF8KaKZKQ8YJxrOun01c4ChDwHABsRGXLERRUms8j9EseampLygtFTnFXNp-Ieg6i
    SbFy-VkrCIs7Ar6og>
X-ME-Received: <xmr:XF8KaN9EIJwTFbkJb3gKcp1zhn4cIKdBkky45VvwED07wFJSifQmvTQwWKbC8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelkeekucetufdoteggodetrf
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
X-ME-Proxy: <xmx:XF8KaBoZFZygrwFpulFDLZINJfaFx8MkTr02laT4RWMScPfkgDOzVg>
    <xmx:XF8KaGrQxFVUP9nFLiSHueuXCcCTu08tm8alkRwY9GzQM7xVwfRPrg>
    <xmx:XF8KaHSVqubfFWomM_h1rhd1huugz7h3g8iiqZV1vxe3FPJPWpozBg>
    <xmx:XF8KaOprdUrQSByHu1j_v5p2GkmIFqYdICmdaVZF3LqDFz73_UZEZw>
    <xmx:XF8KaH77W6OFRwwm7RZz9SAxR4sIYt12ETPWtqNOiZwZEqI8q-U34tHG>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Apr 2025 11:57:15 -0400 (EDT)
Date: Thu, 24 Apr 2025 08:57:13 -0700
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
Subject: Re: [PATCH] uaccess: rust: add strncpy_from_user
References: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-strncpy-from-user-v1-1-f983fe21685a@google.com>

On Thu, Apr 24, 2025 at 03:17:48PM +0000, Alice Ryhl wrote:
> This is needed for ioctls that operate on a user-provided string.
> 
> It is somewhat unfortunate that strncpy_from_user does not nul-terminate
> the string when the end of `buf` is reached. This implies that we can't
> return a &CStr from the function, since the buffer may not always be
> nul-terminated.
> 
> That said, we could add more convenient helpers on top that add a NUL
> byte in that case.
> 
> This method isn't defined on UserSliceReader because it complicates the
> semantics. The UserSliceReader type also has its own maximum length, so
> we would have to limit the read by that length too.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/uaccess.rs | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
> index 80a9782b1c6e98ed6eae308ade8551afa7adc188..1bd82045e81ea887008e30241bd6de27f096b639 100644
> --- a/rust/kernel/uaccess.rs
> +++ b/rust/kernel/uaccess.rs
> @@ -369,3 +369,30 @@ pub fn write<T: AsBytes>(&mut self, value: &T) -> Result {
>          Ok(())
>      }
>  }
> +
> +/// Reads a nul-terminated string into `buf` and returns the length.
> +///
> +/// Fails with [`EFAULT`] if the read happens on a bad address. If the end of `buf` is reached,
> +/// then the buffer will not be nul-terminated.
> +#[inline]
> +pub fn strncpy_from_user(ptr: UserPtr, buf: &mut [u8]) -> Result<usize> {

Sorry maybe there is an email I'm missing, but could you provide more
context of the usage?

First the function name is a bit weird, because the 'n' in "strncpy"
means the parameters should have an 'n' (i.e. length) in it, but there
is none in the Rust version. Also, we don't need to replicate the
semantics of C here, we could just do a strncpy_from_user(..., ..., len
- 1), where `len` is the len of the `buf`, and then we would always have
a nul-terminated string. But maybe I'm missing something from the usage
side, so this is not doable?

Regards,
Boqun

> +    // CAST: Slice lengths are guaranteed to be `<= isize::MAX`.
> +    let len = buf.len() as isize;
> +
> +    // SAFETY: `buf` is valid for writing `buf.len()` bytes.
> +    let res = unsafe {
> +        bindings::strncpy_from_user(
> +            buf.as_mut_ptr(),
> +            ptr as *const u8,
> +            len,
> +        )
> +    };
> +
> +    if res < 0 {
> +        Err(Error::from_errno(res as i32))
> +    } else {
> +        #[cfg(CONFIG_RUST_OVERFLOW_CHECKS)]
> +        assert!(res <= len);
> +        Ok(res as usize)
> +    }
> +}
> 
> ---
> base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
> change-id: 20250424-strncpy-from-user-1f2d06b0cdde
> 
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>
> 
