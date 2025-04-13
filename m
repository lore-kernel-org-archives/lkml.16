Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC961CB9E2;
	Sun, 13 Apr 2025 15:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744558361; cv=none; b=HQgcpjJHopAz5LVtx+XHqiowZ6VmZb5rxc+EeLS5MGDF83Ka9z0cxEhOl8Vs2t4tEj/oaLSVptElWzZP4OQEiiRl9nIltNlnEtCcEz5nP+2dYb3GC9IgIlaxfl5Y8GjS0Ztb2y6EN/On7kmtSXRb4lvMlUjn0+2VsxZhBOYvgYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744558361; c=relaxed/simple;
	bh=HtmR/lKykKWsOTtMXCv6zAKyqnSRVLNlW1wNC1UaxTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QeNZM9T4VI0ALuhFJBPEf+SicQCOJYtRbwfgUc6ph82qjiAz+JVCz8wpt+YG7hT/tIZb1SkdvzOb4jhROU39dJI4ukpR0+veUY/t6tMT/dSowqrlFgVABTr8NFYgiZ13OU7H+lKv/+dcBofe3nCdgf0gO1WlfJknUSEqWduKshA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERhJpZRM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERhJpZRM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so18508555e9.2;
        Sun, 13 Apr 2025 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744558358; x=1745163158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91mBxrs0CGUf6WofddkA9rLXhRpxDxi7ytvC8f64wcE=;
        b=ERhJpZRM1BbqdIhOPNpYvOTKtOEmL1CKLb3VhnQhfAzf/tEitrm0ZNqOuvpYobAj3R
         xGdAObaj8rQMhMAedQtX5qxLF7BXYupKgZe6tZqGnZC59a2HIHBiCCPjKOPnLxUVkQTL
         WGKw1swRF6/dXdepsYAwIGArIxJqAuKNAyQW78V6hXlQzOtu9xGIoiDvIerJ7BizKngu
         oHTWmf7aqC2d2SQ6SBgXXEIotMFBKMNU7za8CxFTAtm5ydA5oiDUeOk/AX5BukF2Hw9s
         xMlSalXH0AauplW47RzWia4y4/cXkSx/DPhFl+RqZy0ELSp9nh4H4wXkD1EhkVYDV2S9
         3aGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744558358; x=1745163158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91mBxrs0CGUf6WofddkA9rLXhRpxDxi7ytvC8f64wcE=;
        b=w25qK4r0nZMy/ppWh1ixNYorMQxU8qCAkowaxtRBomQXRTIk4iBoNeVLiuqKn3SM1u
         vuEJwkHLyjzrs362aYaZqTQ0WJFMSMGHeRo2vEKuAmO4fXYHjARx1GtR+zM6gewVspic
         gnsokA/gJKVJ7o8PkJteaOzeczaT9ZfNfn9NuI7jXsntg9LvYkaw2XndAhkEKc5uCbpE
         mjgK5vswZl4ffvnPsmJChAd0mVq8NVlfIazeHjXYhHgHgCQe8RGTOPxgRqMgcLIhB/qY
         Kf1tGzdpVqeQE/4FOwccQs4S/g2uycmSqYhsu4L/Rn1ojZNWJXLHZi9qC3ZA4/S9BZEg
         jENw==
X-Forwarded-Encrypted: i=1; AJvYcCWGflOigP5/SWRmjo5cRI1b6TT2NPeKCmfqbTZj0kQ21hp5A1EznVrNaAE19090fxHxW9o/3Ecg2mzIc94=@vger.kernel.org, AJvYcCWs5ht3XVe0WQ0bjA+2CdETdunrVvCje/Hf82Y0oAUu0Av0ebnJ7NkoLwlBz2MLF+eC1JaIrcPFVxs7UZ4NBLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgyK26xkaePYpdfF1/McBpx6InZDZ5/QUgmzA8TD3+jmy/DaiO
	wwlJStsNKmBkxpZS+BWHtC4b8NKTMUfUHIxODuDkk/7v3CEaBXSh
X-Gm-Gg: ASbGnctACIx/l+1YXA29BqPGHSIPfZkFh97VZp+86TKRFO1VUtgKR80/gsnDv6XLtBy
	W+W0pGXrgcUXnQiY1CE8Cz4T6qv2ENsiy7FayTl/aik82IaXDfxKoT6pTHWVMMMpwH8s/VKMMRa
	geLFnJMV7IQgfzOhbkJY4g3xjtu4zXt3afE0QsUSm1JH8oe6TN7qQ6hFI92kccGk/HWAl1O3s08
	kBpaAyVDsfyHchRbNafVQVt3fd8B3pKvzkfooaDJMS2LLGMcjWXTJ++W574kcGjxJ5uWLG8vl3B
	3nOYTtzVR7jfSlRrrkiLQzPyOU8dGPOU3C4iNXTmVxaCganu3vIwLg==
X-Google-Smtp-Source: AGHT+IGjmZonw83uMcspRDX2CSxAewJN4SU0cJz8iy8l1PD8PMh1b+rPWpvsexY5XRqJMPn6NFuDZw==
X-Received: by 2002:a05:600c:1c03:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43f3a928905mr85013165e9.2.1744558358001;
        Sun, 13 Apr 2025 08:32:38 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a273fsm146120735e9.9.2025.04.13.08.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 08:32:37 -0700 (PDT)
Message-ID: <8de46681-18b9-4ab2-a8c4-df6315c2125e@gmail.com>
Date: Sun, 13 Apr 2025 17:32:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction
 `FwFunc`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <Z_p-UoycGk3BceXm@pollux> <c04d3ec9-46f8-4ccd-b0ed-52a1adea11b7@gmail.com>
 <CANiq72mpKQM8v1=qhACWGYo1c0jtOymnACDxXiRgjEs2-+X2=g@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72mpKQM8v1=qhACWGYo1c0jtOymnACDxXiRgjEs2-+X2=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.04.25 5:07 PM, Miguel Ojeda wrote:
> On Sun, Apr 13, 2025 at 10:55 AM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> This causes problems on v6.13 when building for 32 bit arm (with my
>> patches), since back then `*const u8` was used in the function argument
> 
> In v6.13, the function argument used `i8` -- if it were `u8`, you
> wouldn't have had an issue, no?
> 
Ah right that`s a typo. Should have said `i8`.

> 
> Nowadays, in 6.13.y, everything is `u8`, so you shouldn't have a build
> error with your patches.
I'll mention it explicitly that its not a problem in stable 6.13, only
in the v6.13 tag.

Sorry for the confusion, Thunderbird showed this as a response to the
original patch mail, so I thought you were referring to that.

Cheers
Christian
