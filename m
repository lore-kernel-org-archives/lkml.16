Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F6C1F875C;
	Fri, 30 May 2025 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748587439; cv=none; b=ujwtnQCNu0LGd0skkN/01KcAuXOIP7iRDnlT8ooGBJdWrALgSxARgWGtpz+q1ReYuB/0HMkDkbP7BBGST0EuX2346KCXicaSBi0R+TE4MCK8acH9/jGbExO9MEaMdRJhVKjisaRj2TcS/5ePCqESyYswj7dIP9g+BTmyZy8Y0SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748587439; c=relaxed/simple;
	bh=hQpgE9FCxZY6wr0yALjhJk5QYAGAM9DyhOcet3ugtG8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=me+AydzfQ3jHe4zD/lNbexMZVP0o5F+GVI04cjfDh+UCPwn2nRyEh+7e5Txi25SSKwv7fEk9Qkzl+boOtOgWCoVsE8Yvz1JaodfYXZEiToGArcqGv1Xs+6bPttuPLRGyqaJ0XVunYZext8l+pi/nNCAn2gIvVIOtxThQNJqT5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/eGwSJ0; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/eGwSJ0"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2c3c689d20so1303899a12.3;
        Thu, 29 May 2025 23:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748587436; x=1749192236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vx3EVLF/Lzm+nHRyUt2W8drMPIm6fYD3QP8+NxtAy4Q=;
        b=L/eGwSJ0NKfnVap1gNcFIqfJ6DJ26P+Hvzd4EKXZ1x7wemu9FKdN+iml5F0lVxIrCs
         46iOCU4TfDEeXx7Oz2C5h23mkD+x4vXG2aRvqbqQ3q5GC6v+n33eXQpcvAvvuHXNBx6P
         saBNXkXdv8GLpI+TLCvsJdqPqvrRW/l12qgzOXIN6mzeVjQI65dT0ILFLPbzWBqJl3yz
         +cUNfZwJ916L0S55xrUekPPxdXP3FeIcV1OgNUhR5DR51xWhv8/tBkBJQiQERtw6u11K
         O2OS/O4jSZVQ9ffG4bH35K7d/NLo1bJUXv1W+lWOJNjFDS/iKK2z6UYfIthjJlK9gOAj
         z6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748587436; x=1749192236;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vx3EVLF/Lzm+nHRyUt2W8drMPIm6fYD3QP8+NxtAy4Q=;
        b=vUi/7W1Pqjq35dlgXeQd9Ptk282ypCJMJi8OatPAyljznhueE9gfQklwBPbvSiLFhZ
         GHu+6aRMXPrkkB6KxIfFMhlTJbWlzdI0QKuSuIiUjJENHJePV51L2PLNr/QJRN1kVsn1
         bdMyDWw4Kqwzv44HKq6/JrE9MwiCla56AQup747a0bt6bbl3gjH6PAjh0Sm6q7mw8RLd
         XV4RTKtmDb9bLinqj1RjGTa2mjCOqu0FDOQVwFQ+4LBLeZsn5kfkVxBknDnRPY9Mcu/a
         iAcimYyOBbcU5tHkQRcYGCYOctSkwgFk29OqdbDp9hEWUNB7u5+5jIhhGDfsbx0jcNW9
         +eGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXytfgtdPxsrZrTMiF5+QxXqsKvZSDIHCTkzs/CCmirs2WAauqlsjhDOzOYOhRLUzKsULKDMuydB29bruQPlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx84eJbzrQz3XsE+PJnQGNLu89Jf5xtSG0Gsocly7BzEF+nHKw0
	VAc2wlSFINknqkkZuUN1b5g6i+PkcYnykFG8Xva3I97DgzAfTWY6hmOnwx+eDQ==
X-Gm-Gg: ASbGnctejgZFQHDiUt4UcvGNl5MZWtS6M9lZ7vi/xV2r+vA40wLzkYzqhAzr5dXxK2O
	N/MggtuPlUlS+iq6S6bhhd91VysuOhFNDudNnPqkD5VHWy/n421sjFrCv1qRzRcvKFjrzKfSJey
	tdMAucsYhiuaQHJxtNYx9107DD7gXxNUCYOil+x5K+8+2ZDpyNfMJ1kuTTfKKW0DGKcke8Q8ulM
	xm5FWIBnSSp5NnVrwBunJw+aYLdhdDShCV8npQCi9tCOsE3yG9uo2hPL2UZ/TZsLVEjqJeteNN5
	YGIsVylr/Fkxf16pw9D9peq/l4+Ziqnk/g67qdpUrqOIZbHep7bakaQPpWQMbHoSs2P9foRZMRE
	bR1vzANYkoF21CviDCRYAH/9w3TQ+rw==
X-Google-Smtp-Source: AGHT+IGUjveKL/+AYPZ/w2nNMh65V26U7uBV/4Xki4SxCpDlysDTnfyKAkVZocmFVKyBxeKwhASJ3A==
X-Received: by 2002:a17:90b:5285:b0:312:639:a058 with SMTP id 98e67ed59e1d1-31241b8fd54mr3353064a91.27.1748587436482;
        Thu, 29 May 2025 23:43:56 -0700 (PDT)
Received: from [192.168.68.61] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf50besm21776935ad.169.2025.05.29.23.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 23:43:56 -0700 (PDT)
Message-ID: <e70e3c60-4a5e-4635-a21e-c2438abf2a5c@gmail.com>
Date: Thu, 29 May 2025 23:43:55 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION: armv7 build mismatched types
From: Rudraksha Gupta <guptarud@gmail.com>
To: linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
Content-Language: en-US
In-Reply-To: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Unsure why the formatting got messed up. Retrying a second time (if this 
doesn't work, please look at the logs and excuse me).


   RUSTC L rust/ffi.o
   RUSTC L rust/build_error.o
   RUSTC L rust/pin_init.o
   RUSTC L rust/bindings.o
   RUSTC L rust/uapi.o
   EXPORTS rust/exports_bindings_generated.h
   RUSTC L rust/kernel.o
error[E0308]: mismatched types
    --> rust/kernel/lib.rs:234:45
     |
234 |         $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
     |         ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*const 
drm_device`, found `*mut Opaque<drm_device>`
     |         |                        |
     |         |                        expected all arguments to be 
this `*const drm_device` type because they need to match the type of 
this parameter
     |         arguments to this function are incorrect
     |
    ::: rust/kernel/drm/device.rs:140:18
     |
140 |         unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
     |                  ------------------------------------ in this 
macro invocation
     |
     = note: expected raw pointer `*const drm_device`
                found raw pointer `*mut Opaque<drm_device>`
note: function defined here
    --> rust/kernel/lib.rs:241:8
     |
241 | pub fn assert_same_type<T>(_: T, _: T) {}
     |        ^^^^^^^^^^^^^^^^ -  ----  ---- this parameter needs to 
match the `*const drm_device` type of parameter #1
     |                         |  |
     |                         |  parameter #2 needs to match the 
`*const drm_device` type of this parameter
     |                         parameter #1 and parameter #2 both 
reference this parameter `T`
     = note: this error originates in the macro `crate::container_of` 
(in Nightly builds, run with -Z macro-backtrace for more info)

error[E0308]: mismatched types
    --> rust/kernel/lib.rs:234:45
     |
234 |         $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
     |         ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut 
drm_gem_object`, found `*mut Opaque<drm_gem_object>`
     |         |                        |
     |         |                        expected all arguments to be 
this `*mut drm_gem_object` type because they need to match the type of 
this parameter
     |         arguments to this function are incorrect
     |
    ::: rust/kernel/drm/gem/mod.rs:130:20
     |
130 |         unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
     | ---------------------------------------------- in this macro 
invocation
     |
     = note: expected raw pointer `*mut drm_gem_object`
                found raw pointer `*mut Opaque<drm_gem_object>`
note: function defined here
    --> rust/kernel/lib.rs:241:8
     |
241 | pub fn assert_same_type<T>(_: T, _: T) {}
     |        ^^^^^^^^^^^^^^^^ -  ----  ---- this parameter needs to 
match the `*mut drm_gem_object` type of parameter #1
     |                         |  |
     |                         |  parameter #2 needs to match the `*mut 
drm_gem_object` type of this parameter
     |                         parameter #1 and parameter #2 both 
reference this parameter `T`
     = note: this error originates in the macro `crate::container_of` 
(in Nightly builds, run with -Z macro-backtrace for more info)

error[E0308]: mismatched types
    --> rust/kernel/lib.rs:234:45
     |
234 |         $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
     |         ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut 
drm_gem_object`, found `*mut Opaque<drm_gem_object>`
     |         |                        |
     |         |                        expected all arguments to be 
this `*mut drm_gem_object` type because they need to match the type of 
this parameter
     |         arguments to this function are incorrect
     |
    ::: rust/kernel/drm/gem/mod.rs:273:29
     |
273 |         let this = unsafe { crate::container_of!(obj, Self, obj) };
     | ------------------------------------ in this macro invocation
     |
     = note: expected raw pointer `*mut drm_gem_object`
                found raw pointer `*mut Opaque<drm_gem_object>`
note: function defined here
    --> rust/kernel/lib.rs:241:8
     |
241 | pub fn assert_same_type<T>(_: T, _: T) {}
     |        ^^^^^^^^^^^^^^^^ -  ----  ---- this parameter needs to 
match the `*mut drm_gem_object` type of parameter #1
     |                         |  |
     |                         |  parameter #2 needs to match the `*mut 
drm_gem_object` type of this parameter
     |                         parameter #1 and parameter #2 both 
reference this parameter `T`
     = note: this error originates in the macro `crate::container_of` 
(in Nightly builds, run with -Z macro-backtrace for more info)

error: aborting due to 3 previous errors

For more information about this error, try `rustc --explain E0308`.
make[2]: *** [rust/Makefile:538: rust/kernel.o] Error 1
make[1]: *** 
[/home/pmos/build/src/linux-next-next-20250530/Makefile:1285: prepare] 
Error 2
make: *** [Makefile:248: __sub-make] Error 2

