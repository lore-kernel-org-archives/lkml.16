Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F65623A6;
	Fri,  4 Jul 2025 00:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751587689; cv=none; b=mcH75K+C1LQZSXwd2qN+KcZNYOO9onZwutOFitpJ1IrjZlFbvnbMFFzgYsO/cYjvwFfe2XySQk8l+Ko1hRfZBnF+S3XedraHZyk2uKMqvTXGJGddwJmK6l6oSONizeU35A+JSLIWRUb1rKlJnEsDZzOCZLc3Q6PA/8KV3c0cL6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751587689; c=relaxed/simple;
	bh=6IOtBe302IQ49hbl2incLA/h2cLlOoTFSUyfYxYhEiY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Vv0hvmYjNFpi2rfAa5fRZUTWakfaRJXeQjm+VnzTGXFHOcQ8GZp456qBtezNW6Jfis6U19+0PdFNEwBJu9F0y8txMXOWZr0tzLvbuGjB2xmGNnuTmB2nVrfsaQJ75zIxuuCqDrdV5X0FFuWGxYGNidm0IeRPKdptBW7aTD7F1Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZ7yhh+f; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZ7yhh+f"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748f5a4a423so339034b3a.1;
        Thu, 03 Jul 2025 17:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751587687; x=1752192487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTtXxeSTjFwbn7vBl3oWSyxodotdHStB5CipA3nQfs0=;
        b=SZ7yhh+fLi0/3lWw7FCOVLkmFsHd/fLP0KIWLdeno7Qlp+yqdixRcJRJBnv5vpI0dv
         dsO5wrhZAN2yMlOaU76rPMP+OXdxaZlZoyEf3zhHne2lKG1+JViMLbUZnVCWA+DiGMoO
         c+gdXdBHNh47jLnV6Ilp7I0D9E6Wg7hC0lnU2uP5uNtMUTR58xNoicUJlNyOdUOy/6/U
         tw8f7c2YuOmwnZ+ubeQRD6xlysN50Y0mUpg6tw4LYnjm2ePZdhOVhsFy2p1BgSSwafq+
         0Bt0wd/wrdcyFb7aok50y1WTZGK52J0vNrdUMyjmQGKTyawkGK/FD9RWORCcghG1Utrp
         RyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751587687; x=1752192487;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iTtXxeSTjFwbn7vBl3oWSyxodotdHStB5CipA3nQfs0=;
        b=T3dTdjbCMw+vP0FDLdN1ZgeLHbCOPG4mY/qHs5osYO5pIIh5LxTTpcungsTEtQK30k
         ZVangMbSzp8FaHx53i4MsFkQxo69pWVDvyoXHnegJwmNDBGjgtTbjnMKgCoWup38NjcR
         h7t+cOO4TVqvJYlUBtmwskFLNr6HxWnq8HRjwcqCNd9NX0UxuSV2CJtT/WmV8dJl1wAJ
         YHBjfsMrFFlPK/JnGCOkhsJGCruPzfhz+Zcc6uxtk5n+lAQH2rg1f11BvcF8wuaGop4F
         ROhuAgRdSwJXE8eomGWtAfikU0QLIfbNGlyXELJZ+w237R+NiYpm+PT6dPzeL5/VlSzO
         ESlw==
X-Forwarded-Encrypted: i=1; AJvYcCWjwJ9kBoN7mcB8wVXl1HzzXwGeCA9YjUSUJk7saAb5RXetBoGX9Lh57+vW2u+ZoSFtyOdde6kyKrHzg3Q3NeY=@vger.kernel.org, AJvYcCWmfBFXtMimJQbHAjV70/ruZLfOhfgB6jiX2C0prmTQT1v6iVkYajZ22qOQe7gjoIelAlWUUXeOEbkTLEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDe3etPmo4i5QkoF0ONbB53jG6RNJ/h/AB4UGNLJ/BT1IaSPCr
	ePLdOdMl+XvO1hsfn/DGueGnwD57SiOo8B6dFssJcVeLJP0OesdmXyNw
X-Gm-Gg: ASbGncvxHRXwBeZo8tjQQI4DVztIWCfWJ+l1B2yoxxp/aStQC2cDwr9VPegOebHvHWx
	45xdh/hJQwgrQf3xea1ibhRPIrvxPM09ZgP1XDx/JGKvKUbDu2z01fTSbT0bIwHkshLAwWcAvKb
	R+0y9jNDRDljB4KntRYbbvfTBzGQv/erb9G9Clm+Yl9sDnpceA1z7vaB3kQ314HcpeUOWe3GRcX
	kvyI10rf2eBp1eRaDVfSIusGRqUQzBnsBqQOjLdZff7wkzmVfy8EGFMarsNoafowMJSdq2kT62K
	CUiTO7kvdEksVirzjTcBAuchE9RAdHOQG0ZSHojaOxfKzbn6ATGwKpwmhpp7T1ZJRx7oE6RZub+
	/fGBRLPHhmgeWPiugdE4K53Smu2TuLxwXPHrQz1zbedE/C+X4XOM=
X-Google-Smtp-Source: AGHT+IEcjjhEoGNnFpdeaxOrd3OBNKkUIO/cGlogM9cZHvglpNVTY2wleVcrSuVvg7vDsuQBbWiXbw==
X-Received: by 2002:a05:6a00:3d16:b0:748:2cbb:be45 with SMTP id d2e1a72fcca58-74ce8a8debcmr157858b3a.15.1751587687381;
        Thu, 03 Jul 2025 17:08:07 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce359f54asm629336b3a.31.2025.07.03.17.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 17:08:06 -0700 (PDT)
Date: Fri, 04 Jul 2025 09:07:51 +0900 (JST)
Message-Id: <20250704.090751.571327900479764851.fujita.tomonori@gmail.com>
To: aliceryhl@google.com, a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 boqun.feng@gmail.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v1] rust: time: make ClockSource unsafe trait
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgjdpso4waCrP6iVaMEOpYLUmqCz8PxqXuSbQBMaxxCHBw@mail.gmail.com>
References: <20250701.083940.2222161064880631447.fujita.tomonori@gmail.com>
	<87sejfuf3n.fsf@kernel.org>
	<CAH5fLgjdpso4waCrP6iVaMEOpYLUmqCz8PxqXuSbQBMaxxCHBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 2 Jul 2025 11:50:35 +0200
Alice Ryhl <aliceryhl@google.com> wrote:

>> >>> Mark the ClockSource trait as unsafe and document its safety
>> >>> requirements. Specifically, implementers must guarantee that their
>> >>> `ktime_get()` implementation returns a value in the inclusive range
>> >>> [0, KTIME_MAX].
>> >>>
>> >>> Update all existing implementations to use `unsafe impl` with
>> >>> corresponding safety comments.
>> >>>
>> >>> Note that there could be potential users of a customized clock source [1]
>> >>> so we don't seal the trait.
>> >>>
>> >>> Link: https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-archlinux/ [1]
>> >>> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
>> >>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> >>
>> >> LGTM:
>> >> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> >
>> > Thanks!
>> >
>> >> Though you're missing `` around [0; KTIME_MAX] in some places, which
>> >> may be worth adding.
>> >
>> > Andreas, would you like me to send v2 with the above changes?
>>
>> Perhaps we should use rust ranges instead [1]? Like this, no brackets: `0..=KTIME_MAX`.
> 
> Well, maybe. But I think it's also worth considering just using
> english to describe it:

I had a quick look at the official Rust documentation, and I think I
agree with this opinion.

> Implementers must ensure that `ktime_get()` returns a positive value
> less than or equal to `KTIME_MAX`.

Would it make sense to explicitly mention that zero is included? Also
it would be nice to explain the value of KTIME_MAX?


Implementers must ensure that ktime_get() returns a non-negative value
less than or equal to KTIME_MAX, where KTIME_MAX equals i64::MAX.

