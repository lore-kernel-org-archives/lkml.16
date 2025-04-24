Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DA31C5D55
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495626; cv=none; b=KMT05Doyxrt2UwNea+3zWs2vs/+38v6lFp19u64ikz6mY+nJ2qPtlFwschKZMPXNP8Lc0i2+j0PGKmzz9Hd9/O52k9jdaVHdYrwXMDDIrM4j4wROxUXeMkN7SL7Otp8smlbjQKN0G1EEtD7POQhMzN5KU5+5CE7Ap1kC0dVEhjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495626; c=relaxed/simple;
	bh=rCIB3s1YMCAjZ2yHxxGRAupIU11mjpbmp0sA7XGhhSU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=g28Jo1BJAMHOMeHYsA4VOej2W04lBtJcHctoV5JDkxcYQYjk6nSLZP0pVJf1ME/6ktIK0y9gdt3vIxQEs8SCuBJN68tvB9XkEr98zkj1bZ5sZ0F/S+AfKHOQvxhwlQ3YiqFI6beF02Ds88MNfMxd7iev0iVN4FEnYzwgkuCj0ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dxkC/T0N; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dxkC/T0N"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so5596745e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 04:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745495623; x=1746100423; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7r7+1msfSNKtwI+7TAuSvOOZwjo66YqGQOnUawD+nm4=;
        b=dxkC/T0NxZhMX+3mkOIvZTHweEWrJZp/qraW4xPy4wX7gcyufdwBxijzmAUjIFGQYD
         d0uUv4pVfgVW9bebySGMIf0Ou2bgTxli3ThQPRqjSCn3L6LEf0dzokmkxNlLwwonMiHb
         4QxGqTpycXwYEuoyCNFpoWxkb8XAW0H9guTGipa90gWgrhV2I2pDkkB22t33SgwD1rSp
         vIlPyY3TdSYOWW+sNEoDo0beB/H864SlpYCBX2iOVGym5HSbMKVqyLGmz6jg4Zff+H7V
         7FAkPJW16H30HuEITTCheNJjMwkMGsO5xATa+3uG7y6/0iPWQa0EdpPZJsTyqT7ZDOxX
         oExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495623; x=1746100423;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7r7+1msfSNKtwI+7TAuSvOOZwjo66YqGQOnUawD+nm4=;
        b=MbLXldbnULQvUvM2FvCsbDntc7f8xuZujb7jsl8msWeiiVvqdZrn/SctrIulcdQhEL
         GVgCln5xd4L3yVmLVlcicEOMgvZMHEZxgwRL1LVNlAOKqTiucvfYHRJ/PZb2HC2jJrdE
         4YNfFoaOokydNrTb4n6b+ZCZrpTH8IH5ZubItgJc2xD5XNpwS8gGyUo4EUzJfBW6dCSO
         p6msqsH+NyNZ7MW0IZzh6GAc5jZ+G2RbsJFAvu8FJ31j0RX63/5tHrsNmZQbWz7wx5at
         bg+JaNlOBhVj8QeN9919NtL/diOIIWdeDA8BTfvGkh29NSYPZwoY4XVscn74pKjlBOKm
         Rqtw==
X-Forwarded-Encrypted: i=1; AJvYcCU0cKXjo7XS7auqHOtHAu53wNqarzWah0CaSpRtDC/9dKqPvN1Z3A+0KkBXYX6dj2Q00vFCwP6yPJr2EzQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK9Qh5NFG+1Rnu8m+Qn6mSOxNo4FKGTAj1g0d6U+ZqA94Cm51e
	J+gQW01PZT3BfP4a70X1emPrt/kdkR6faxChd9Fg50s45Oedesc0okdFIRU+1R78bxcE+eeRFyZ
	yflvY6LGKUIsqHw==
X-Google-Smtp-Source: AGHT+IFfglV76zUc9U0P4XV3F76n+fUoIUnMtt/qjmVfgTe265a7D4yiy8/xlJBe4DvMyGg4z4bTuwcjwvuy+M0=
X-Received: from wmrn37.prod.google.com ([2002:a05:600c:5025:b0:43b:c7e5:66e0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d0c:b0:43d:224:86b5 with SMTP id 5b1f17b1804b1-4409bcfb42cmr23146005e9.4.1745495622833;
 Thu, 24 Apr 2025 04:53:42 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:53:40 +0000
In-Reply-To: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com>
Message-ID: <aAomRMzyu3EX5Xal@google.com>
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 23, 2025 at 01:40:10PM -0400, Tamir Duberstein wrote:
> Add a compile-time check that `*$ptr` is of the type of `$type->$($f)*`.
> Rename those placeholders for clarity.
> 
> Given the incorrect usage:
> 
> > diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
> > index 8d978c896747..6a7089149878 100644
> > --- a/rust/kernel/rbtree.rs
> > +++ b/rust/kernel/rbtree.rs
> > @@ -329,7 +329,7 @@ fn raw_entry(&mut self, key: &K) -> RawEntry<'_, K, V> {
> >          while !(*child_field_of_parent).is_null() {
> >              let curr = *child_field_of_parent;
> >              // SAFETY: All links fields we create are in a `Node<K, V>`.
> > -            let node = unsafe { container_of!(curr, Node<K, V>, links) };
> > +            let node = unsafe { container_of!(curr, Node<K, V>, key) };
> >
> >              // SAFETY: `node` is a non-null node so it is valid by the type invariants.
> >              match key.cmp(unsafe { &(*node).key }) {
> 
> this patch produces the compilation error:
> 
> > error[E0308]: mismatched types
> >    --> rust/kernel/lib.rs:207:25
> >     |
> > 207 |             [field_ptr, container_field_ptr]; // typeof(`$field_ptr`) == typeof(`$Container.$($fields)*`)
> >     |                         ^^^^^^^^^^^^^^^^^^^ expected `*mut rb_node`, found `*mut K`
> >     |
> >    ::: rust/kernel/rbtree.rs:270:6
> >     |
> > 270 | impl<K, V> RBTree<K, V>
> >     |      - found this type parameter
> > ...
> > 332 |             let node = unsafe { container_of!(curr, Node<K, V>, key) };
> >     |                                 ------------------------------------ in this macro invocation
> >     |
> >     = note: expected raw pointer `*mut bindings::rb_node`
> >                found raw pointer `*mut K`
> >     = note: this error originates in the macro `container_of` (in Nightly builds, run with -Z macro-backtrace for more info)
> >
> > error: aborting due to 1 previous error
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://lore.kernel.org/all/CAH5fLgh6gmqGBhPMi2SKn7mCmMWfOSiS0WP5wBuGPYh9ZTAiww@mail.gmail.com/
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>  rust/kernel/lib.rs | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 1df11156302a..d14ed86efb68 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -198,9 +198,15 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
>  /// ```
>  #[macro_export]
>  macro_rules! container_of {
> -    ($ptr:expr, $type:ty, $($f:tt)*) => {{
> -        let offset: usize = ::core::mem::offset_of!($type, $($f)*);
> -        $ptr.byte_sub(offset).cast::<$type>()
> +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{

It's rather unusual to use an uppercase C in the name of this parameter.

Alice

> +        let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
> +        let field_ptr = $field_ptr;
> +        let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
> +        if false {
> +            let container_field_ptr = ::core::ptr::addr_of!((*container_ptr).$($fields)*).cast_mut();
> +            [field_ptr, container_field_ptr]; // typeof(`$field_ptr`) == typeof(`$Container.$($fields)*`)
> +        }
> +        container_ptr
>      }}
>  }
>  
> 
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250411-b4-container-of-type-check-06af1c204f59
> prerequisite-change-id: 20250409-container-of-mutness-b153dab4388d:v1
> prerequisite-patch-id: 53d5889db599267f87642bb0ae3063c29bc24863
> 
> Best regards,
> -- 
> Tamir Duberstein <tamird@gmail.com>
> 
