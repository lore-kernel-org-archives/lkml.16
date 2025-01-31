Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0645F1F94A;
	Fri, 31 Jan 2025 18:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738349908; cv=none; b=Rm/pTPCBdcM5fA/+K8U2XqI2AvJx8ikanKesCR/aplwSN70t2MfihE6KU30BRjVHb7AYYKjSyosbG2PtFSW48khHwXUoQBirLAteW8aF1ltG1DY4nyVi8TSxw5Dy2cCOMFtDuPEdeE2w47eR7aj4GxPhE8U4d2N0KGdhsxcNaa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738349908; c=relaxed/simple;
	bh=rnLRXivPM58kQJV5pN1ILLe7H76XvfnEV4GHzTYgPV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSFacSA6Lo7Xi+T4ZCJUvFUeYRqprM8o35wszTDkThWGiU9auZnXFMatehQXdLJR3zS7RWg1ozfvzp47zyA9ftB/l0AKncw6xdyVgd68GO2EL2wf7XRYD/TpYK6BZ3g2rRhS3PhMxmFEJe2OgYHkFAv67wv3EgvmuIaOfJ4JlDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdiv0wqT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdiv0wqT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so453560066b.3;
        Fri, 31 Jan 2025 10:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738349905; x=1738954705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dP2c9p+WJ/Ycibc0VmIMo2SY4jx3mg/tQ+vmm0GdlFU=;
        b=gdiv0wqTVSE2cRKLlsEinh02MMHzQUypbw5/wgRSq3DhMLl8+oCgZqViMZ0az6oNNV
         BcF3MOljksiwSatglBY2wMr9IiF8GSrxdUzhAy8ziMiTJyal3XJNfoqeCGS4Gof5QL2K
         cFUAc/kbhq17J61ec+CsSPTdI9sNhuZNtcp+5FDz2pkjyJDckA50zaBlQlIOXajV4xp6
         e25mr8AWQBYLCF1E80Ipc0WoXAKju2fUBVu6ljHu+xgegrKMqTmG36Do4Lff7sYF+Wws
         ptRVG99l+uP8CvZesxbCK/UDBTqLLfR62m9YhOWIrQ8sfePXDP15yPUAeWJR+QS+yZg4
         maew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738349905; x=1738954705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dP2c9p+WJ/Ycibc0VmIMo2SY4jx3mg/tQ+vmm0GdlFU=;
        b=EljFTjVz/0GP4ooXhzPAoXtPaN8/q4ueEFKi+d5ntfUedxiP2fs0e1yqFFz4MOjVIN
         Z8KZqm9nVogBYQvzIR6OXpLPNQvLrj98lNxKsDBraMZV/IUF3ms8ZGTGgMkpz/Zw97iI
         uCR1BgiDtGt7yZkKC5UHhJv0gp4BMMYuixDeod2QjjAbt3FAokgwLU1jlMzV4pqQbT7Q
         Fw6ljH1mUCBUL4rTZrokETO/pABIHm14Go/huUwzeHWwWuOzOpc9gVVg2DmdHZ4quW/D
         2GM5bRDupK8/YtEViMCIe4Oagvj/StIYLW9hQ3Ri3qeytRRXHuKZK3XyJmUz3WG6i4ul
         wGwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAe/eU/dGd86SNcKLdLHTcONrLCHpnjKHR0fz+LLVxz+05a0xwaJwvQ2mSTIXSuz0N6/sPNIR6iwZUBXqHBJU=@vger.kernel.org, AJvYcCX5zi2byVDVoZGQqFRYZYnNbKc4M6x8I/HR9mLopyXlyap/8tTFJZFc2LT0SHjaHtwa9ZVg4QazKpU=@vger.kernel.org, AJvYcCXij/qbstRWKcjNhbUGp2PxgXAoENorgZCnOMEMAOoQlAK6i/OU1jra465QGULkPYnzriaKAJCSzHeSISLg@vger.kernel.org
X-Gm-Message-State: AOJu0YzdP9FPNVRK5cQOAvgM7m7j3D9dJiqySoggsGiixM6aeq8ZNHZm
	6KRngXkinxPyJIVILfo+OXYBFBxTANhdLg6auRBPrPCEW2eTPihO
X-Gm-Gg: ASbGncvhNJf8JwK0PLRBjic2Okg3l814h/Ca8ponE5wn7hEIoKFDq2tG1xVDQ4ccMGv
	fP6mYuHK0huthYVRMKiiN0wZ23EdNd4BVBIbXhvXJwC4rmJBv0ik5ri1Fo4Dce4+Nd/Kr+X1P4B
	mUJw+Jpb196rBVjii43lu+tFTph59L18+Do/z/MFT2YvzNuOSyItOQ/Pe4z2rCg5IRimfSLToxA
	cQnO6IW8fL+jGPMfhwDntnHYbHjsvzMs9P1j5QsP4K9K6tTHY69GdNtYkmx0+axHZp2Ltl9huky
	YssOql5a1DPvNxcC1kbPUCV5bJam
X-Google-Smtp-Source: AGHT+IHOS1aKbTTtUUMddEt5dbh1IUG+QNx5UiNzYR9h5od9izNR3CvolWOWfFrKJty/mwVs56DPyQ==
X-Received: by 2002:a17:907:2d0f:b0:ab3:8cc:cd8 with SMTP id a640c23a62f3a-ab6cfd07cd9mr1254923766b.29.1738349904899;
        Fri, 31 Jan 2025 10:58:24 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d06casm340070666b.58.2025.01.31.10.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 10:58:24 -0800 (PST)
Message-ID: <5e8a99a5-f39c-46da-b54d-7b69307b1c66@gmail.com>
Date: Fri, 31 Jan 2025 19:58:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
 <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.01.25 5:05 PM, Andrew Lunn wrote:
>> To fix this Rust would have to provide a way to build the core
>> library without float support. I don't know if there is a plan
>> already to allow this.
> 
> Floating point is banned within the kernel, except for in very narrow
> conditions, because the floating point registers are lazy saved on
> context switch. If the kernel uses the floating point registers, you
> can break user space in bad ways.
> 
> I expect this has been discussed, since it is well known kernel
> restriction. Maybe go see what happened to that discussion within RfL?

After checking again, it seems the float intrinsics are actually not
needed anymore at least for my config. Only `__aeabi_uldivmod` is still
required for `parse_u64_into` since [0] allows disabling float formatting.

Link error without the `__aeabi_uldivmod` symbol defined:

ld.lld: error: undefined symbol: __aeabi_uldivmod
>>> referenced by num.rs:580 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:580)
>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>> referenced by num.rs:589 (/home/chrisi/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/fmt/num.rs:589)
>>>               rust/core.o:(core::fmt::num::parse_u64_into::<39>) in archive vmlinux.a
>>> referenced 34 more times
>>> did you mean: __aeabi_uidivmod
>>> defined in: vmlinux.a(arch/arm/lib/lib1funcs.o)

Not sure if we should just implement `__aeabi_uldivmod`, keep the 
panicking intrinsic for it or somehow fix it in upstream Rust?

Miguel do you know how this is best handled?

Link: https://github.com/rust-lang/rust/pull/86048 [0]

Cheers
Christian
