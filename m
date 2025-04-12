Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FB51DFED;
	Sat, 12 Apr 2025 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744466148; cv=none; b=QAHhRae0mTu8QFxlmhIOg2pO0tXNIti1GAG5vrpHZKiyTv+znKFDX2j8NG3YzzQUsQZAOqPVOMUYCYu2K17g3R6rrKGeYlE0h9CI5dXpStfHEW0GOWe/wXs6xDPgJRG+B91cVQ8rvhc8TVWg8MW/SDNKuaYtZLCF2OzLRHdQQQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744466148; c=relaxed/simple;
	bh=P50aJu7XXjRS7vo2lSWiyWlxioIiQ8PwiZroYsP8LgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frQBzIpDUMk+yIuYXaQf88Pp60ekG5pwKE0L/5nW6Fw0BxZiRUUZ0av0vZlMBfFYMfX1xhfNQYn1DbqAIYz7NKzlR85elVcK+eD22tp9NRi/glG7yXtns9YBDm9why7s1eWhelutrOYqHJ4PUQNhsl407NunlhQ7SUDWyxvTnwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5h/2bc7; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5h/2bc7"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac3fcf5ab0dso496836366b.3;
        Sat, 12 Apr 2025 06:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744466145; x=1745070945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TZ54x8v3eVD5U8aETYAS4nLrisWD2qb80zeW2RT59AA=;
        b=f5h/2bc7vPCO0RRFO6QbNOjyGqREcH5oggTG+X1Sa5KbA1Bt+yAquPgmO1Lakm5uuN
         5jCvu5/BvFIkW93uSYoFzn5gzplH9oA6tV5wO8SBJSVy5virTByAyZinPsIo1Dre7W5b
         Mu1svSe2/jmjgXjElSb16Ehhm3ZcmTdC8znXybskEhtDkVHMuncLJd6wxW/OvTOqzixv
         JYGLJloJSQssBKWzBIsSRyg9X1MM1DnLpo7Gw/zrXJi8OUHxI0CS9ckAfhjraxewwkiG
         KRmJMYKJA7CmrKj9lQLhmvmUnXgPej/TJss9EbpoDFnN+hCIGHnCk6g1ZORb5V22AUBe
         DH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744466145; x=1745070945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TZ54x8v3eVD5U8aETYAS4nLrisWD2qb80zeW2RT59AA=;
        b=wsojCDKWYKpVTuvqjQXnqKrNCmnf7DK0BnpUYQi+vHUMhv/0jo/I/5Tv9YnUyaj4P9
         VxmW6jAmMPZW6e2mLtdLFjxJWPSB6+CXHa2ik+0B2g/vY2JVX5BuNbsmwcEluQoFhFVV
         CWez/Zd2+t2Mu9Om2YAryPM7P3kDl4Jx69Mi0oA0841VntZu9Iewiw5/qPiZC5/4Gjcl
         2kkvuP36ruhUHXF+pctwEr3RQwa/Lj7Jaa21g4D7bkTth0w6+dNt0sDWDkOmBA7HdMTh
         RNB5Cynov+xXLgt5SKc/9lXvo8Y1kIavwbUpZe5t2cczckGUy7/6pHZjHBG7+w4m1vZo
         bcEA==
X-Forwarded-Encrypted: i=1; AJvYcCVr5ZxzA+mJTaku7mPNF0dYw+HV8jIVKRusT5ArkANvxtphyO4DkZ0Kt0PPY6WZRy8STF+l9f/0jAj6Sto=@vger.kernel.org, AJvYcCW5FQPAHxF4CLyBgMRZUpQXWd6HyweveYNPGIRwsU4zqkkSUszd7Lul2j9cO/I0CwjEIO1AMJ0eXQf/sQetnxA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq+l2lHLNKp+BkcG6ICbnicxzLX3vcjnpqLLAdPrLkyAi8/Hj0
	0ebVbKDSx3KQL+T6QeJD4XjTyt4ZMu+hvOX7rMPW6urh2DnKxEmxEfo9NA==
X-Gm-Gg: ASbGnctJatpGpvFhN1Kk6XH6nSVbUF3pnVNRfDipqZLbvX1QBmA7eLXAvLpHgHIbAej
	3xHiTlGUcoveu4oBkNJ5kkGzGV+IAPS7ppInHPlmIQlrcOR7tGJ2G1MsHa4172KQjtpSSiRwywE
	vvkTZ6I+0DJiw7ztMqj7orJUJNqIKNT5aHK9PYmeTeTgaE8sVMp0iAdjjceCHKeTPB4CdEZHTaQ
	5/ztFi6JGwYdZTJ+jUeUpx7GiYAKiAwI5iG3FALwVJ72JE0XWwrSEaniSqHyWf4NlXGKJRfC1EF
	gIg7zaSLOYbgoIpPgvJPNaC+y3+ke3WobTaJsIpZU7AmAGv7YoACFg==
X-Google-Smtp-Source: AGHT+IHWw0GkDKEZgC2o+mVlPBD+l8kI8aBSnJiuuF7zM6E7S4GhBUi+w5se67pFwPpZVrvfnDR47g==
X-Received: by 2002:a17:907:2da4:b0:aca:b72b:4576 with SMTP id a640c23a62f3a-acad34d9c9amr559258366b.33.1744466144886;
        Sat, 12 Apr 2025 06:55:44 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1bb35c0sm602934166b.31.2025.04.12.06.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 06:55:44 -0700 (PDT)
Message-ID: <a7195308-e019-4587-8bc3-ad34de192708@gmail.com>
Date: Sat, 12 Apr 2025 15:55:42 +0200
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <CANiq72=BoURMmkwqBzZ9Bzf5oXkZbUia-gZKJcNmVt7Qg8bKzg@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72=BoURMmkwqBzZ9Bzf5oXkZbUia-gZKJcNmVt7Qg8bKzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.04.25 1:59 PM, Miguel Ojeda wrote:
> On Sat, Apr 12, 2025 at 12:30 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> "propper" type for this, so use a `*const kernel::ffi::c_char` pointer
>> instad.
> 
> A couple typos -- I usually suggest using e.g. `scripts/checkpatch.pl
> --codespell`.
Do you want me to send a v3 with that fixed or are you going to do that
when applying.

(I've now configured my `b4 check` to add `--codespell`)

> 
>> This should probably be backported to stable, for people/distros
>> using Arm 32 patches on stable.
> 
> Up to the stable team -- I will add Cc: stable when I pick it up since
> it shouldn't hurt, but it does not change anything there for the
> supported arches, so they may or may not want to pick it.
> 
> Thanks!
> 
> Cheers,
> Miguel
