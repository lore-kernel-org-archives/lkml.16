Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C79202990;
	Sat,  7 Jun 2025 20:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327061; cv=none; b=fmP2aA2sW5E9ovl+E/iOPQkfKYnzuL869UVxmNaU0ls9adjxrjlBQRR4goJlBGA/ld8XeBG/MVJRzFEjTRsfvh0NtbUuFbqKkF8gQctCmmXvB2epq8BaP8/nuaDj9Cdg8IJUZe4H4EUqgA/HqmsgwVLHsD0cUcJILOfyWI/dnzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327061; c=relaxed/simple;
	bh=bwUoBmk1WHA+t1StbZMADVECEIfxHlT7aIenWONsN4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pia4+tq0McfxaBFwNhWFssypXHAFMVJ3PqnLSEmOPa1Vm4iKmfVpoS0Z8SXcv1yTso0JEtE8Bzh+okZhvj/3fQUQfQ3WIq3NWtUqNYMryoJgr5R52sZ+2BLaeFxCAjNLqv11QIri9FN3ULOjELVelAG8+3JTBY6mFhvvfrO+cks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bP+rhBSy; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bP+rhBSy"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-442fda876a6so27087035e9.0;
        Sat, 07 Jun 2025 13:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749327058; x=1749931858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQeiRcyl6G2ypGBdCdRdj4TF0rhVD1s2OsAcLTDLLgY=;
        b=bP+rhBSyFNj0J5jZbxY2c0YPDvbuHZEYqA+uqDQ+s9JOV/FGVS60sEnse6JutmhuAA
         wsFoil6VdoTDfhn0sCkQ6DSxPrLpOCoD6Py/CoTDLAyi3R+VA7ApZK8iH7Chn4swwLh4
         NEGcjZLDAZAvOKyG4LDqJ6ti+q5L/P/8+QiDkRUKMxTLI7xjZ65ZpkRX1It4rs6B4q3F
         /6IeuHtPH8lgiDuEcTluynGtp/l0RvsWivPR39bkI4xFBpxmWN+JDjY7luhCFImy/x5C
         YTLNbT45DJ6iBEhY9Txd2dqt39IVZZdi+gPJZOLB3DwLWcJ2Rc51EFMaRU2IJma0u7rT
         rQRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327058; x=1749931858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQeiRcyl6G2ypGBdCdRdj4TF0rhVD1s2OsAcLTDLLgY=;
        b=JmuD7TON/u1aEYE304T/1n7BHwLdxt/izmCubGhnjEJ4gVSjUTpcBTX03qOE6HyBPd
         ExVsr7E+n+Jys75yQvlOi5HrQAme6yEaVrpmAto1BHQtFDmW+oyi+pSunR5h1ClCcdfL
         aQRRZULQcY4ZKPo1s6ZGK8SfrZ/qeXn8+Q7hEWz0Y011e2WmkGyqxAUmfNOd/L1mWche
         mEi6ngDD+YXsi+YEUysgcAyuUfCK41OZ3hK8Kl/jZCYvckKs1BQb9Iqkm/Id3UMHuPAv
         3T1nTXbea2VqbwfI1urYbgzWcAhLg9mSPlEXFHjM7I/77bUjXpa4uL0igX/COncscAMW
         M0HA==
X-Forwarded-Encrypted: i=1; AJvYcCUUdFVHGGQlbOIPVbuaDQvx6FtDMg3xukawKwFqmvgEfwqB7COyCVHWNX/LgjAtCkPPhyKZa1SEWWZQLF8=@vger.kernel.org, AJvYcCV8dR6P/z98LUzczWTP8CoG3qp2zHjp9vWMCmDafG+rMmPerAdseCmTiWnnlXZOetnHIAy/MWbp6b3GsVQCRj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQuy4xLqrYD3OM/3yCX7uVm+dsOaz/WgI1hrOPeB9QVrEZpoWz
	c9OeYD5QNqugPWXK3usvjB4cy6HvoVzEWbhf2UU7l7NkDy/3g3AzROC85PCWPA==
X-Gm-Gg: ASbGncujgsaL8bqIFgRedTJ+mbGRfYM6PTNuF9NvQed7HMv8c3NPVAJ+Q8HnfOGOlSf
	hgBuf+Fq5M5+8rbhqC5Pmll7oWdMw9lnsQtXfKqJiINx5ZWxmSdAQ94JPzSAeG4N8qBVzxQFnki
	bq7tn0lP6lIvQbJxBRJUY4V+a3Osgz7rXnlSHTX4eJz8sgTj+IDMPG7MpJjZEmqkH4pFxGpyTyg
	Rkw2A6x7o0lbQmrLNFbHhIjVxHSGrqr9jWRIlc9M4jKpMcNZhKpCPhyGRTM/0aPidQ5SIyUMegI
	Nw+AdUZfFFHkG49cPVYhzh3sGpH5e05kk6oigmPuYnNahJ2zGYXpZ3kI8BBqgv6hldR27C3El9H
	V/azQ2XFeag==
X-Google-Smtp-Source: AGHT+IGras580znMMJrF91jzjz9F0ECB1pZkq2caEbiXOTPYPVXH013bHaA1v239eZLiu1NcZO4vLQ==
X-Received: by 2002:a05:600c:8b72:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-45201360d06mr74519845e9.14.1749327057761;
        Sat, 07 Jun 2025 13:10:57 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:3372::1ad1? ([2001:871:22a:3372::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e155500sm61763605e9.9.2025.06.07.13.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 13:10:57 -0700 (PDT)
Message-ID: <e613d12e-92d1-4746-9012-5194fa1cbecf@gmail.com>
Date: Sat, 7 Jun 2025 22:10:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] rust: miscdevice: add additional data to
 `MiscDeviceRegistration`
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Benno Lossin <lossin@kernel.org>
Cc: =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250607-b4-rust_miscdevice_registrationdata-v5-0-b77b5b7aab5b@gmail.com>
 <20250607-b4-rust_miscdevice_registrationdata-v5-2-b77b5b7aab5b@gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250607-b4-rust_miscdevice_registrationdata-v5-2-b77b5b7aab5b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.25 2:07 PM, Christian Schrefl wrote:
> @@ -178,18 +214,29 @@ impl<T: MiscDevice> MiscdeviceVTable<T> {>          // SAFETY: The open call of a file can access the private data.
>          let misc_ptr = unsafe { (*raw_file).private_data };
>  
> -        // SAFETY: This is a miscdevice, so `misc_open()` set the private data to a pointer to the
> -        // associated `struct miscdevice` before calling into this method. Furthermore,
> -        // `misc_open()` ensures that the miscdevice can't be unregistered and freed during this
> -        // call to `fops_open`.
> -        let misc = unsafe { &*misc_ptr.cast::<MiscDeviceRegistration<T>>() };
> +        // This is a miscdevice, so `misc_open()` sets the private data to a pointer to the
> +        // associated `struct miscdevice` before calling into this method.
> +        let misc_ptr = misc_ptr.cast::<Opaque<bindings::miscdevice>>();
> +
> +        // SAFETY:
> +        // * `misc_open()` ensures that the `struct miscdevice` can't be unregistered and freed
> +        //   during this call to `fops_open`.
> +        // * The `misc_ptr` always points to the `inner` field of a `MiscDeviceRegistration<T>`.
> +        // * The `MiscDeviceRegistration<T>` is valid until the `struct miscdevice` was
> +        //   unregistered.
> +        // * `MiscDeviceRegistration<T>` is `Send` since `MiscDeviceRegistration::register` has a
> +        //   `Self: Send` bound and is the only way to create a `MiscDeviceRegistration`. This
> +        //   means that a reference to it can be shared between contexts.
> +        // TODO: add `assert_sync` for `MiscDeviceRegistration<T>` and
> +        // `MiscDeviceRegistration<T>::Data`.

After trying this out it this needs `: Sync` bounds on this impl block and
the `MiscDeviceOptions::into_raw` in addition to the register function.
That's not great, but could be worse.

> +        let registration = unsafe { &*container_of!(misc_ptr, MiscDeviceRegistration<T>, inner) };
>  
>          // SAFETY:
>          // * This underlying file is valid for (much longer than) the duration of `T::open`.
>          // * There is no active fdget_pos region on the file on this thread.
>          let file = unsafe { File::from_raw_file(raw_file) };
>  
> -        let ptr = match T::open(file, misc) {
> +        let ptr = match T::open(file, registration) {
>              Ok(ptr) => ptr,
>              Err(err) => return err.to_errno(),
>          };
