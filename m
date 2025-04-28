Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D30B1DA4E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745833209; cv=none; b=ex61p0InRdRGhyIR+lCadV9mQgncbqWLYqLBTDLCNhCQxq1wXjWL+weM5bz2sBHstd1FE2UrfQe1zeMxrzDwf0LQIE6KKtXI+B4K9dxd5jb2wtmWXWbOHp9cah9lS7wodbm47B5ycUBzescinDNp3EyaKTjexlpPuUuetylpUkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745833209; c=relaxed/simple;
	bh=YYDzdQ4+9LmtvJGRvACyqrQyMsoxiDd42ng2vwZOOoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LgNgDrQY7ELXKWlXctzluwZnwZ5Vs7pu5kFDMnj+Hi/Uzy0TBbDqsoSVNV7SKrNKvPhDkXBdtmAmBpGD1+FN58ort1mrNJXJW/GYdRnx23tjjtZoMJfPdzcsQtXaLLJSMDUzQiY4kGlSEI6Jcus3xKdWyHZrN8/JeHnRJzJGhbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YGqy89vm; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YGqy89vm"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so2826564f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745833206; x=1746438006; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMZGDDxvxQMJiy4e9TQRfyVCY4DEWRSO+vNpcZ0cNtk=;
        b=YGqy89vmwUKBj2O7jYREWWX663R+Op4tNUze3GYoa37bDAvpI443aNCcT5OUGjGDo5
         oEge0gtwauA3bRgQB75E0ADkYB/5HSxBRBMwJMZBSbCjhgDjBSG8StuUMyfYjgQGf+nk
         ce/82ym5w0jx4m0k7J7G1p1MP/OkCfn4ks2vvoOj+p+NlxAO5wXpGP1bK1jwY1uFBqm7
         0FiVeu6eKH6pgaICrkZ9gUEpWvxdoT6uvaSOm82srjmT/X7cCX4RRg7ZuEq20DI1YQbQ
         3rr6J+zkmmDe16wi5i0djhFupdw9jIE7CI3HJpiTIHG2DCNNCmA+W4CEfvmMzqBNYzT6
         /Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745833206; x=1746438006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mMZGDDxvxQMJiy4e9TQRfyVCY4DEWRSO+vNpcZ0cNtk=;
        b=QMHK4MdzQwPFJ8B4RQJDSzmjqD4pJEL4cmPRo0KKfNH8YlGKL49bc0gcLs0Hp3Wjva
         MRPO5QhKFXK9lWZvwogd+P0FYoMdvSwfa+AXFaXHyAekB85eT1dn6PZj/1cEVSLEHB64
         bfej3RM08KLR8SK/8WmCv9ZgwMWh/1Vr4nuuYqSWwvRmO22O0XWrPDSnL9Xo75ndQafp
         CpaxvyiBt1QHryZ5UtRTV2XXB/0BtJ9RlExuB5Vz0hnp8PzWoJOzDrvbi9spdYfYzsvm
         WEcdlVkWPZrXPwJDS/2JLuf+t/Z3iSXDmR9ChfiJFtjrHEggZRx8UD0Cx+iSiwo2Pytf
         OYlA==
X-Forwarded-Encrypted: i=1; AJvYcCXzHwJ05NooSEcw5GlKo742zIGX5YwUr78jVrt5c/vwr8DhCLZYX5Ler5Eryti5GJ3CB5riaY1UtGFQYHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOGYvU0FQKDzkXL2NMx4roqo2zPhOUJ5uXj/uVCGdSJy7pg2uU
	2SAf+R2lop1feXxv2qIfxJcDaEd9m4qJ9FZlqehjLWx9vFJmZaRgU1pq6F9j93GbbfVrPuHHfck
	V1mylnKJgbnPb1g==
X-Google-Smtp-Source: AGHT+IHCr2s5xiTt7CkQmPotck1vag0zHrz5ZRimKIOKYP/sR0cvWeb8z+qSIsoUmCLdrGB+tQ4JLc9fAW4i0ic=
X-Received: from wrbck9.prod.google.com ([2002:a5d:5e89:0:b0:391:3ebd:4782])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:178f:b0:391:3049:d58d with SMTP id ffacd0b85a97d-3a07a9c3830mr6315668f8f.0.1745833206521;
 Mon, 28 Apr 2025 02:40:06 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:40:03 +0000
In-Reply-To: <34457c78-fdcd-4f1b-a349-4ca9bcc2febc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423-b4-container-of-type-check-v3-1-7994c56cf359@gmail.com> <34457c78-fdcd-4f1b-a349-4ca9bcc2febc@nvidia.com>
Message-ID: <aA9M8_K0MQfWg52t@google.com>
Subject: Re: [PATCH v3] rust: check type of `$ptr` in `container_of!`
From: Alice Ryhl <aliceryhl@google.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Apr 27, 2025 at 03:59:48PM -0700, John Hubbard wrote:
> On 4/23/25 10:40 AM, Tamir Duberstein wrote:
> ...
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index 1df11156302a..d14ed86efb68 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -198,9 +198,15 @@ fn panic(info: &core::panic::PanicInfo<'_>) -> ! {
> >   /// ```
> >   #[macro_export]
> >   macro_rules! container_of {
> > -    ($ptr:expr, $type:ty, $($f:tt)*) => {{
> > -        let offset: usize = ::core::mem::offset_of!($type, $($f)*);
> > -        $ptr.byte_sub(offset).cast::<$type>()
> > +    ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
> > +        let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
> > +        let field_ptr = $field_ptr;
> > +        let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
> > +        if false {
> 
> This jumped out at me. It's something that I'd like to recommend NOT
> doing, here or anywhere else, because:
> 
>     a) Anything of the form "if false" will get removed by any compiler
>        worthy of the name, especially in kernel builds.

The `if false` branch is used to trigger a compilation failure when the
macro is used incorrectly. The intent is that the compiler should
optimize it out. I don't think there's anything wrong with that pattern.

Alice
