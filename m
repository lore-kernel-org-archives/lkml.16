Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EDB1F4E3B;
	Fri, 30 May 2025 06:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748586225; cv=none; b=EyVkXsYZlFM4Toeo03km+KriV2DeG6c369SoX0JNNALZS3mZGYrXTm1bkAfjxePIp4W1j29QVq0jWIyw15pny974hiHWaSk5pOJY9vpnl1Do6HBSiDaBhM0KDHJOqbzGrLiBooS/sHbNdURCj3Fg8Tp7NM+nSi+coT8PrhiO+wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748586225; c=relaxed/simple;
	bh=Xb7mdOJmMCoE0+k4jfyHItFF+9//Z8CaPB7GH4gmWt0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=sDbZvPrdfRFLLRJUxuPHy8TxsADaIPd4G0rqzmVGZpxrdtIWv1loEhd3SU2sQyi0taKVo2X35ccXguDJeugYcDz6du9IhqYUtgV+ltT7Hvz9Dbeq+qlz8xGe9fbhJRq7FjTPuaTM+2k5meplkxLyLFzBpUKRAF38gkUWy5+NS4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZsp6CtO; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZsp6CtO"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7426c44e014so1309236b3a.3;
        Thu, 29 May 2025 23:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748586223; x=1749191023; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XU1ATbyx3zqhkNtOJwdB4Idf67/DTZuYgGH9y5w9ob0=;
        b=JZsp6CtO8DXgkgWwEZzyXKsx4rGRDWE/INmclzE2R23NvYH0ni4yiKPSQ64eVqMICG
         aXUSI/43CeQQLX2qfwAwPtefmVDvvUKBmzfQGnaNbBwmW05k8Y+IvRLUNy6GJmvErxHV
         A3jsQwsrvVxkODFplOoHPex4KTD/OyJlSQLDyvHJMFCa7V6q2pwMknSEbG6Jj5t20LRg
         GUscttlYA32YViqDofNJt9AEcCWyRO9UUCHKreUEHbkrYc91yORUZakCnS5qlAn3B1nn
         neqcsO41AneVMO9f34HO02eQ0OMAwgJNC02TgvV2bvGLDa2hnv60jkFbP1bWUqlGuBdp
         pQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748586223; x=1749191023;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XU1ATbyx3zqhkNtOJwdB4Idf67/DTZuYgGH9y5w9ob0=;
        b=ii7rDyAjEUZma44gYw7cJpwNd6nEp1dj2OQXnKlgZfydBl+GTFi7JR7Q8Aev0mVxWA
         LPanc0xjla5jyg5g8Zd0d7MoQghSPP9AAxNN2yWHXukQo7AHTYsdqAiD7wnbm4dw0uoD
         nm13bFpUjYAMHrSvWgsYw589cSxmutDtaaIiqSbNwUWLAZ6uJpvaQRhveMT1EMOHyIsn
         drjt+kul0F5b5L23EJW+OT6wiCOrPIKWJfpLvb8Bm/6POmQOphD4RU/of3yidHDcfiN4
         eVRPCrxgkOs7npYUGrNGZECSKRYu9fRVqudxFhx2sfMFFiZTbRUaQ0ZMbTsUCozT1Qwb
         jpjA==
X-Forwarded-Encrypted: i=1; AJvYcCWVVL+A1tX2bCldR1Tkyiza/jwZqUW9cXRPAgsqXuA5/jbIwf6EWqUabad58tLSSIZ+Jd6g7MJ4+gELrwnZzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEM2vQbVY997SQ6O9sWCQoo4pQrUjuOjxvpu7kKd2ogKGSOYyI
	+SFYT2B2LKG56VvsifyrSEj94t47OlNIS0Vm2EK5024sBmZxkF3pkZ54cSnGSQ==
X-Gm-Gg: ASbGncvSoM/3Utix/8C8xkY42R2XTEgPJOadUh9fnjLX89VsLds/gjMYaCLZQSPjFs8
	0+Z//m74sOYUu2KRAX44n3IUf59HpyC3+e1s7B0vc5Ye72t0n4iRO7E+p92/hYMgkP7Tkqp8NAU
	8ElCht48d1dka2ugpMmYgrfXit66xd5MkAjs5IFII8vI4we2C+AskTd+ymv+GDue/81P8JpRsFM
	xL57JiqkJU9Q3MRxSVZpPnh6tWjrYdedWIsDTy+7pAOPTl0qvkK39Q/pWXCU/yqcRfuRzl3R6W/
	8u3ARqFol30cdC6fhOAYJncGCaqr94otTcnLaJNigcwSYz6oqmhRGjNG1gk/iBWdL/Lu2JORI0P
	4xTLT8btA9bMdwQ3f7fbOWsexv/752QPcNi2WF8vU
X-Google-Smtp-Source: AGHT+IGgZFZ2UAuM/Zo0NxdX1vCwI/rMCNH7OIrnsoOOrDtg1WcaON3WqkyWyPXqylK6ZrTXxUpkiQ==
X-Received: by 2002:a05:6a00:3c85:b0:73d:fefb:325 with SMTP id d2e1a72fcca58-747bd954c2bmr2878868b3a.5.1748586222598;
        Thu, 29 May 2025 23:23:42 -0700 (PDT)
Received: from [192.168.68.61] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affcf4c5sm2318757b3a.124.2025.05.29.23.23.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 23:23:42 -0700 (PDT)
Message-ID: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
Date: Thu, 29 May 2025 23:23:41 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: REGRESSION: armv7 build mismatched types
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Logs: https://gitlab.postmarketos.org/LogicalErzor/pmaports/-/jobs/1368490

Archive: 
https://web.archive.org/web/20250530060232/https://gitlab.postmarketos.org/LogicalErzor/pmaports/-/jobs/1368490/raw


Snip:

||

|EXPORTS rust/exports_core_generated.h|
|
||
RUSTC L rust/compiler_builtins.o
||
RUSTC L rust/ffi.o
||
RUSTC L rust/build_error.o
||
RUSTC L rust/pin_init.o
||
RUSTC L rust/bindings.o
||
RUSTC L rust/uapi.o
||
EXPORTS rust/exports_bindings_generated.h
||
RUSTC L rust/kernel.o
||
error[E0308]: mismatched types
||
--> rust/kernel/lib.rs:234:45
||
|
||
234 | $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
||
| ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*const 
drm_device`, found `*mut Opaque<drm_device>`
||
| | |
||
| | expected all arguments to be this `*const drm_device` type because 
they need to match the type of this parameter
||
| arguments to this function are incorrect
||
|
||
::: rust/kernel/drm/device.rs:140:18
||
|
||
140 | unsafe { crate::container_of!(ptr, Self, dev) }.cast_mut()
||
| ------------------------------------ in this macro invocation
||
|
||
= note: expected raw pointer `*const drm_device`
||
found raw pointer `*mut Opaque<drm_device>`
||
note: function defined here
||
--> rust/kernel/lib.rs:241:8
||
|
||
241 | pub fn assert_same_type<T>(_: T, _: T) {}
||
| ^^^^^^^^^^^^^^^^ - ---- ---- this parameter needs to match the `*const 
drm_device` type of parameter #1
||
| | |
||
| | parameter #2 needs to match the `*const drm_device` type of this 
parameter
||
| parameter #1 and parameter #2 both reference this parameter `T`
||
= note: this error originates in the macro `crate::container_of` (in 
Nightly builds, run with -Z macro-backtrace for more info)
||
error[E0308]: mismatched types
||
--> rust/kernel/lib.rs:234:45
||
|
||
234 | $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
||
| ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut 
drm_gem_object`, found `*mut Opaque<drm_gem_object>`
||
| | |
||
| | expected all arguments to be this `*mut drm_gem_object` type because 
they need to match the type of this parameter
||
| arguments to this function are incorrect
||
|
||
::: rust/kernel/drm/gem/mod.rs:130:20
||
|
||
130 | unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
||
| ---------------------------------------------- in this macro invocation
||
|
||
= note: expected raw pointer `*mut drm_gem_object`
||
found raw pointer `*mut Opaque<drm_gem_object>`
||
note: function defined here
||
--> rust/kernel/lib.rs:241:8
||
|
||
241 | pub fn assert_same_type<T>(_: T, _: T) {}
||
| ^^^^^^^^^^^^^^^^ - ---- ---- this parameter needs to match the `*mut 
drm_gem_object` type of parameter #1
||
| | |
||
| | parameter #2 needs to match the `*mut drm_gem_object` type of this 
parameter
||
| parameter #1 and parameter #2 both reference this parameter `T`
||
= note: this error originates in the macro `crate::container_of` (in 
Nightly builds, run with -Z macro-backtrace for more info)
||
error[E0308]: mismatched types
||
--> rust/kernel/lib.rs:234:45
||
|
||
234 | $crate::assert_same_type(field_ptr, (&raw const 
(*container_ptr).$($fields)*).cast_mut());
||
| ------------------------ --------- 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected `*mut 
drm_gem_object`, found `*mut Opaque<drm_gem_object>`
||
| | |
||
| | expected all arguments to be this `*mut drm_gem_object` type because 
they need to match the type of this parameter
||
| arguments to this function are incorrect
||
|
||
::: rust/kernel/drm/gem/mod.rs:273:29
||
|
||
273 | let this = unsafe { crate::container_of!(obj, Self, obj) };
||
| ------------------------------------ in this macro invocation
||
|
||
= note: expected raw pointer `*mut drm_gem_object`
||
found raw pointer `*mut Opaque<drm_gem_object>`
||
note: function defined here
||
--> rust/kernel/lib.rs:241:8
||
|
||
241 | pub fn assert_same_type<T>(_: T, _: T) {}
||
| ^^^^^^^^^^^^^^^^ - ---- ---- this parameter needs to match the `*mut 
drm_gem_object` type of parameter #1
||
| | |
||
| | parameter #2 needs to match the `*mut drm_gem_object` type of this 
parameter
||
| parameter #1 and parameter #2 both reference this parameter `T`
||
= note: this error originates in the macro `crate::container_of` (in 
Nightly builds, run with -Z macro-backtrace for more info)
||
error: aborting due to 3 previous errors
||
For more information about this error, try `rustc --explain E0308`.
||
make[2]: *** [rust/Makefile:538: rust/kernel.o] Error 1
||
make[1]: *** 
[/home/pmos/build/src/linux-next-next-20250530/Makefile:1285: prepare] 
Error 2
||make: *** [Makefile:248: __sub-make] Error 2|


Bad: next-20250530

Good: next-20250528


Likely introduced with: 
https://lore.kernel.org/all/CANiq72mFiCrzawVUVOU2giJtBVsRdAO3sGtDsZptPuFvmid3EQ@mail.gmail.com/


Repo: 
https://gitlab.postmarketos.org/LogicalErzor/pmaports/-/tree/rust/device/testing/linux-next

How it's built (Alpine-like build system):

- https://archive.ph/vxEmk

Config fragments (in addition to qcom_defconfig):

- https://archive.ph/q4hfc

- https://archive.ph/RKgFf

