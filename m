Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53A1186A;
	Sat,  5 Apr 2025 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743883525; cv=none; b=Js28kOnEBjhoDYrHRpSE38T7QZZYpom31DZdKwYjhi22v+7NvX0ASajtEvD1FBB4P1Gvy8bC2aeMZnTbdA4C8pjn5Cw+WMbTgG+DVvvVqc2dB6IO4SHFIp5nAD3InWIgjP7UynEDjtQXsh6tWYn/gVY+dhkrA1DHbilLsJXYC6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743883525; c=relaxed/simple;
	bh=IfZ1hH3psKbVoIEdTrZ7JGJW3mK+tP0HF/iXoqjBTt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eZ438rLif1gxmxDxzMxZiguChPEkdbd6Y4+hfBDHFA4F3cxFc9tBECxPZMuo7v5tNuk2yH3vMgNP4XjZq/NwwvUrps9HQFz1hLetPFrP40lm3FpqOrvZJVdmQXqKdrvch/LSyBabJE0SoXZkz/e/4AJ+j1J5JxlSTaxFDliiZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzvlfRpb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzvlfRpb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso4712091a12.1;
        Sat, 05 Apr 2025 13:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743883522; x=1744488322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hyr3I2LD6oYdyXFuRB514jaAJoLkJqMn3eQ4HuFH+h8=;
        b=KzvlfRpbjs0EOghj0IvByFVwiztfIiq578A3B3zXc+IvYXcomoc5RHoFJdg5LtiuIG
         FYCJoFIJEOIPLfnREDUx47lZKuaQ2pdRra0ZwopRG1UyodZGycb3UjHIxQ/jF/ggRv9G
         bMJPKMsDTNdH2JTHjVW4ODGcFNyEavdIWoWEsWuu1pAm8yrqfHdZFTjSUqgkJGSpQP43
         FW3vvuYbbzotXaoCK+PCJt8fwbrn4SeVxb0Qkp5Evg/KnYNhWP4Wt7Mqd0OpEa/bWvau
         uF3gXyjoQ45j/0NGWJs6WmKsimmG5XVicjBAR/FPvXKPI7Rx7Mhyt3xmqRnmSWryq+gE
         SrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743883522; x=1744488322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyr3I2LD6oYdyXFuRB514jaAJoLkJqMn3eQ4HuFH+h8=;
        b=KhSLOlAUxcsqJvc19aFNnzwBXKUCg/vV2kjihAKXM05gRA736fNxwjIQeQZPSFliSP
         hFk0CnVrmsQRn1g/6belCdSaN6LPwTepfiyQbrEHYfOydXuoDaR6Ep3g7a3aT0zqJldl
         YIsO/hQVip765x1Aligvzc5MwWbP9GfC5i9sPH7g/rkZu6HZw68R2utWnCQfAFBYHd8U
         OrJvrvLGhLAYigvlrf2vq45cV39Z8y49ABwGPqwO6iUwupSF/2ZlPJ/7XJ5Pl8zcmC39
         UJrv99agv7Odfil0Pwd3c79px8gJ2QkJlAFfVex70aK2T8aSajwg+WVhE3+C0HXDACZ5
         QKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHBcy6Kc618aM1vcMESTIP0HxH5kwebvrAGM9xxgleY5ZLqzwnTSDOv2RN9kbik0p1ukKl7s+d9f84/O5kQ0w=@vger.kernel.org, AJvYcCUfkOFbuh1JHLPmef6knv0/8PV87eCxe8eIJ+so6bJs+RngOiT40dihZJWfPpa1t8LIwyz0L6Oewm4=@vger.kernel.org, AJvYcCWPzkVUU/2Os+HRUuo/QNZ7IEOpF50dRcy6IMiWKWJMdE9BcVJZORz5QBD0zIfZPVPvhJuuBEEyBQ8iXqfQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFEqRLdb0mY74No6JM5uacr1qQdSyEpb5UlsgW3MUW9J3XpiD
	V66uxmrVaDOQ6eYHDBEUbVagtVwKkxJOrg0UN7YrarBpA7A6PgXA
X-Gm-Gg: ASbGnctSjHmyZ0EGX3iy3nYNS39NcO0QmP6TUDLEWHhTjLTCUCvyDi9f4WBh6A6SdGV
	u18DkSVFODVkJpQsvJOHkegqDGQfh7a4VTZL/H7oNA0vMve3nzxXwRf12WbYe4tUWKoSUvmvb3q
	7OHA78dxElDM2nGpzvKAhmJ/glrMOpz/VGHIMmnYrgYg4pFPoN3Z997XVoWiaMPSnWYJSeH9UgP
	AdQzW3BKh4lj9tM+JIysGdLFd2z39ZYituGFMBph/CxxeLjkS2OrhY96PjULQbLEmxgiWIdiNET
	5NrLdOncUKFypxG2NBelo5yMFdR1EzNuY+pmmTejeEf1JT3gg/5/EVrAww==
X-Google-Smtp-Source: AGHT+IFqYGSqbRsbuD4i4wRSjvzH/8ifozRPrIqDZpWcze1lam4H31+dMiIOJy0Wh8owhFTIeDKZAQ==
X-Received: by 2002:a17:907:a088:b0:ac3:3e40:e183 with SMTP id a640c23a62f3a-ac7e717035amr280556266b.3.1743883521868;
        Sat, 05 Apr 2025 13:05:21 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfee2591sm468902666b.79.2025.04.05.13.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 13:05:21 -0700 (PDT)
Message-ID: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com>
Date: Sat, 5 Apr 2025 22:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Andrew Lunn <andrew@lunn.ch>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CACRpkdYF0sVB2-qgy=GzETSR3+2sagVQPGdunDQDJrn8KqJorA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

On 21.03.25 8:24 AM, Linus Walleij wrote:
> Hi Christian,
> 
> thanks for your patch!
> 
> Sorry for being late to the show. I missed this very nice patch
> that was actually on my personal TODO but I have to much
> to do and also I'm not smart with Rust, but I'm a big supporter.
> 
> On Thu, Jan 23, 2025 at 11:40 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
> 
>> +       select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7
> 
> Nothing in the patch series really explains this restriction, so it
> should be in the commit message. Arnd mentions some atomics
> etc, but we really need to know exactly why this is in the patch.

This should probably work with armv6 targets, for v5 or v4 Targets a 
different target would have to be specified in the KBUILD_RUSTFLAGS.

Rust also has some big endian arm targets.

> 
> I'm a bit surprised by this since the rustc LLVM backend nowadays
> support all old ARM ISAs. I would have expected:
> 
> select HAVE_RUST if AEABI
> 
> Ideally this should work on any ARM core, but it's fair to require
> EABI.
> 
> The big reason: I think we want to be able to use Rust in kernel
> core components sooner than ARMv5 goes away from the kernel.
> 
> If testing is the only issue, I can provide testing on ARMv4, v5,
> ARMv5 BE etc, just tell me how to test. (But I guess it's more than
> that...)

The main reason that I only did this for ARMv7 was that I'm not very
familiar with older arm versions and that I only have v7 hardware for
testing.

I currently don't have much time to work on this, but when/if it 
works in qemu I'll send you a message to test it on HW.

Cheers
Christian
