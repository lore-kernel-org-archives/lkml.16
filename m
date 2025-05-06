Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AB2278745;
	Tue,  6 May 2025 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539975; cv=none; b=lF7DMqHRQxMe2IpJr60KQd+BjXSXt3FJdIcUWzMh70KkGupKO4sbbPkI3WuZ/o1NmIGYiUd4hUpOHA3zn1svk91cEdvrn8ZVmX8T1BWPv2pJvL7cHROTIJz/bG11BF7Wtbi3dDv8LLDzEgaWCCstN30VWUdvoSnVTcMpHOsvyyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539975; c=relaxed/simple;
	bh=/iHPx3jD/CToO4u+U45ghy1w7g3pWoLFrxwJAIs19ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEelCX+vGV2hOASXaQtg28x0+JQz4XWB12TgW5KWb6njgKJVUkqujeqDDqbvdNY9AIXiHSHBEypnnrJguKGPcNtd+NfVXNBLBh0gvSQ2DS/25oTnbcUeAOAVYl/Yxh1dR/GHGOG7+KgiJndopM5v0Id0P14hIOrxJe5gWCHCJl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIUTr+xU; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIUTr+xU"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3054e2d13a7so403462a91.2;
        Tue, 06 May 2025 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746539973; x=1747144773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE+axMvDCs66pYIdbl+vi6mEby8kQb7qSQ66DYmsH4o=;
        b=JIUTr+xUJjQvhyqsTL43lvWHMIlcqYBMgGVxuj9n8yaGP2hvjWgfmuLqYbmZVDZwse
         m2GOqsFIoNOEAQXd7+zSLVqLzKsbEhic8Q0FtVGYy8U74+TunWYP1qCMFGaNcKw+/bUv
         jvM7aMCciOB6MjF4yXwuNb4KIim3YKyf5zlvPylb790MmWNCZOgEgr3By+JghQJy2UML
         lDpDe/e3JUc5ZCBY6IfhM1HLFQDaQ4dHqhevhIEkvNIR7s/Nb+uzx4u/3EvWEg+XL1Ye
         7IeJaDl/mADHm+Ax8kMENZMV7dYadOf/a9ocSd+/tsZ59gRdBt7REoJBZZ0KH/2hNedy
         sydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746539973; x=1747144773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YE+axMvDCs66pYIdbl+vi6mEby8kQb7qSQ66DYmsH4o=;
        b=B31Q0yfoKRrHh1MNQymZKUQCcyRfcdxs69pTqzATiBmqsuYoPkeV2dT/KtJCnKrkOm
         rRIP9C0brM1Nn1dWbAEh7Q2YuOI+CL3bqAfVhRQ/T3WFpWoA5XoZFuxKi/hwHVb9+E7d
         7RmVY28AATe4q3nXP6HaTvQuIHroGnekRYv2yjHRxN+Y+WGPX/AuXDFl1G5RcTV4RRMr
         QZyEtouD80MU3BYyvq3VCBj2g9T6zg21VwZFOBM9kF42fEmrQl3fIq5kd2qONtGYcBSG
         T7L4pMkcsXtroD1EHMURHYWvl5ht4lEZJ//DzcpRRXH4bGEKGsJFZZRDQ/zGW3K4j5hB
         984g==
X-Forwarded-Encrypted: i=1; AJvYcCUaZgNrJJyMUVcd1PS9kOetL3E3IfDXl/ZgfshuLF1aT4t4ENfnDACym9+3E7oJih6lw5yRiTqo4D7nbuPVWOI=@vger.kernel.org, AJvYcCXGIdZevjRuR3Jcq+b+CA4YzvMeoqsX/8mqsnpgii3QqmCl9MkKppEHVOuhIJutmuZ45V97a/MunNslHdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+wTjtrFsWpOCFMClNJ12pb1AES5wJlx2MLaWnXtBCj7pGR8o
	UWKqJPswtUqKXmkYCUmO3twmiz/TO2HcpCIyGv+GVpwfLhc4NCglQjYDIHdTLgNj9QqPUQOaqbu
	EaJS7SDUp8Xr9DWFYhal3dW8MqgQ=
X-Gm-Gg: ASbGnct3ZSM2Oh7sLGIXlojrvtG51NGL+RHYdlEJYCDkzjEefUecw02lNdowDVbqA2M
	SoiAfNo+g7avVpMEwQTRhTArSGVj4hvjYEgTOMdAbR79ghTzTQqUsvOBb+0ejExQ6fBsmBPxloz
	uuXCEM89T9wq1BHFcBuWGE/g==
X-Google-Smtp-Source: AGHT+IEgubHAsCipwGxCBt3lb83P0YrrXiB4eeA5IxsYnYqCjW/NGSjwPJ0hk5KEcB9E3qTXs6R4DvKPyPUlZXoz14o=
X-Received: by 2002:a17:90b:4c51:b0:2ff:6bcf:5411 with SMTP id
 98e67ed59e1d1-30a4e55f68cmr8746149a91.1.1746539973558; Tue, 06 May 2025
 06:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com>
In-Reply-To: <20250506-userptr-newtype-v1-1-a0f6f8ce9fc5@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 May 2025 15:59:20 +0200
X-Gm-Features: ATxdqUHTdvyp2ma6bPVb7UEv_QMYmLJKYg7vfMfh7c_IgVQyBBYoRBb17EujvOs
Message-ID: <CANiq72=n68DB+hZ77GT4d7odPSS=wxc+YLvaBhU8-H7PyK25Rw@mail.gmail.com>
Subject: Re: [PATCH] uaccess: rust: use newtype for user pointers
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 3:26=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> The UserPtr type is not marked with #[derive(Debug)], which means that
> it's not possible to print values of this type. This avoids ASLR
> breakage.

By breakage you mean leaking the information by mistake?

Since it is `pub`, should we make it even harder to make a mistake
here by making it private? You are already providing and using the
`as_` methods anyway, so we would only need a `new` or conversion
method or `Into` similar (not sure which one would be best -- perhaps
a single one with a descriptive name is a good idea to grep for it
easily).

> +    /// Increment this user pointer by `add` bytes.
> +    ///
> +    /// This is addition is wrapping, so wrapping around the address spa=
ce does not result in a

s/is//

> +    /// panic even if `CONFIG_RUST_OVERFLOW_CHECKS` is enabled.
> +    pub fn wrapping_add(self, add: usize) -> UserPtr {
> +        UserPtr(self.0.wrapping_add(add))
> +    }
> +}

I guess you are using `wrapping_add` since we have a `usize` internal
type, but I wonder if we should use the pointer-related naming, i.e.
`wrapping_byte_add`.

Also, perhaps it is best to use another name for the parameter -- I
would pick `count` like the standard library.

In addition, should we get this directly into the `prelude`? `__user`
is also global and fairly short. It may not be heavily used all the
time like other things, but it is fairly fundamental, like the `c_*`
ones.

Thanks!

Cheers,
Miguel
