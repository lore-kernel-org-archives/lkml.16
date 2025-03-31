Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A21D2147FC;
	Mon, 31 Mar 2025 16:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439189; cv=none; b=gMHULePGOFgqdETcDpqssYrFp9VKDMZi8dnyplNMGbwj/GKW/u0D4D6PtkT1RcdxewvtpQB/ii/7UxtbpAFREqeO5k8Yw14M4sowvDbs0NShldjtF95QT2+8iA1XXLALZGehCUe3Vx+QWRPMzbGGt6fhEVeuPfK97ZLZ6Sb/noo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439189; c=relaxed/simple;
	bh=y9DjxzvYKkOuWhLyDm1rLNLi/8mPIN7AhH54tJnFfrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJs/fbagqLf2CHPn5/gUU/Mwn6755IE+CzsswtyhTUrleZ0ftMdFgja8IjRkQG5VAYYe7o9btQB/1k//yBKohwBapSRQo5nkK2l4wIAGktnepF2kAP+ZYnVi/dEFuE019uutwvIIgaXFdUYxRi8lYRV1vcSOXR5BIXy/nxr3xoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJH5bClD; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJH5bClD"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22548a28d0cso125281235ad.3;
        Mon, 31 Mar 2025 09:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743439187; x=1744043987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nuo9R6kBMQ8ErmyjEUnklnwysWWYfSzr5ZmBZ3GrfFg=;
        b=OJH5bClDlY7mwzERo+KnUH4SnkxiIyNXH092620h3t23HhWDJh7ynolMUtz3yBvwow
         lV9McrCm9jS+OctwThq88nbghu0EE0Qq1Fc6hh7Y171kjKWuveUIGnhzyKRMil5s9Idk
         4NDYlTEI6qP/DYU0b3b6tU3W80tmOMB1Ud/YWZiHKXfjo3CjD+HDmq1o1tgg+H39tzcJ
         A4sO1LnblgbVeV6ErroerzKEo4Pn5HwRXiCgYDu4spbEv8yI8F8I2zXEd+o/rPu5ENPW
         WGSXT5GNUK5wmMq1u8qlVM+JRU+NAl7K2zuuINHL6eRKYTSnnbSF0L09mU+abMGUACLc
         FxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743439187; x=1744043987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nuo9R6kBMQ8ErmyjEUnklnwysWWYfSzr5ZmBZ3GrfFg=;
        b=lONRdt24xAEHgnLEeFrJ080F7kcz7QSG493/7Ak1WFSadTJJjVx55hE6zcwO7pNp84
         6uSB1SCICbhjVCHeIDMjwRdlR6os52/ZENDgeDedg/4mr+Jf1vxxNeoUF8wBH5Sm8m1V
         P0MfOq4yVlc9r4hIylWbTRfVIuTAoinzgK6Y/mfFdLToYpKvuC74jLuUhIPtwPwNE4uQ
         /+Pi7y8r0dMlZv1Ma+qfwoimClx5ecp0BpjqKXlUfjmduw08jnC7VZD8lG/PCB5JMT6q
         XJBcToo4dNMzshdHwGlBKqIfVmuJ4fpPN/6HuPOEDBC9+IbIy3mVuS6Z5Gqofh8G/4K5
         B6BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFSekqn2ctH1rSYSVBt5wboRYBC/dE372+CcEWPysabaQutDcUc1EwL8uGL0FAKPwG3xP7Mbk6ts0UZ48=@vger.kernel.org, AJvYcCXRvFFhXZ14/e4/qx/c8Wtb61WW+0AhRR6DO4Vt6GdieCBnYbHFJyVONyqIWcw82d+E++qLnOsEDRiGKrR2zOo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1OFF2V/3JhIh7k1SfcUr0E2SM87h6cIOnlFOAEdG3386DtKRy
	Li6HEdGjI/vE7mXUPQQznRX2nB+IiMz3BtJ/4Q+fXSz70BhEeawO
X-Gm-Gg: ASbGncsq7sfu4uibM6BWlnsdOxaLv/Ggei1jxvm/IHZ11/mV784Mt/bYU5igVO9FIHX
	bjhUq2R7xhA+/6+QPNdYLUbM3Fu0phKk+w6fDe3ZWbqDPaVpJPwTITtnVo9+mOSmA+lRrySY1WZ
	ABK/t2ErgF7OPkPSNgHYGLSPS2AJ+ofkFIbe4vZnhWwIWul7PZZrn61HcXtBUUDEBylbATxXwcB
	0vEusnWu7Zch77ymmPAuhfLa5hDlOK0rRI/p4gs/iM8BcXapsumrN9+rzhThiWCsOTR+W1+7Tzr
	qyGrmE3vfjemNOmAu5ZYbO5Szc37ty5HYtl8eTkUYzjy
X-Google-Smtp-Source: AGHT+IEd+cTzESBGxh0UkfpYnHDf9ZNNUSlxraHyUfVa7hUxFSvZ4BMxmgZF13Jut3YEagFo2XUvng==
X-Received: by 2002:a05:6a00:b8c:b0:732:a24:7354 with SMTP id d2e1a72fcca58-7398033f3ecmr15275876b3a.4.1743439186612;
        Mon, 31 Mar 2025 09:39:46 -0700 (PDT)
Received: from localhost ([216.228.125.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970deebc9sm7350497b3a.12.2025.03.31.09.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 09:39:45 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:39:43 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Burak Emir <bqe@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] rust: adds Bitmap API, ID pool and bindings
Message-ID: <Z-rFPhrNTB8t5xTF@thinkpad>
References: <20250327161617.117748-1-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327161617.117748-1-bqe@google.com>

On Thu, Mar 27, 2025 at 04:16:10PM +0000, Burak Emir wrote:
> This series adds a Rust bitmap API for porting the approach from
> commit 15d9da3f818c ("binder: use bitmap for faster descriptor lookup")
> to Rust. The functionality in dbitmap.h makes use of bitmap and bitops.
> 
> The Rust bitmap API provides a safe abstraction to underlying bitmap
> and bitops operations. For now, only includes method necessary for
> dbitmap.h, more can be added later. We perform bounds checks for
> hardening, violations are programmer errors that result in panics.

So, I hung around and found the bit_set crate. Rust implements BitSet,
BitVec, and it seems it has functionality that you bind here.

I didn't find any discussions related to the bit_set in kernel context.
Is it possible to use it in kernel? If not, can you mention that in commit
message? If yes, I think you should consider to use internal language
tools.

> We include set_bit_atomic and clear_bit_atomic operations. One has
> to avoid races with non-atomic operations, which is ensure by the
> Rust type system: either callers have shared references &bitmap in
> which case the mutations are atomic operations. Or there is a
> exclusive reference &mut bitmap, in which case there is no concurrent
> access.
> 
> This version includes an optimization to represent the bitmap inline,
> as suggested by Yury.
> 
> We introduce a Rust API that would replace (dbitmap.h) in file id_pool.rs. 
> This data structure is tightly coupled to the bitmap API. Includes an example of usage
> that requires releasing a spinlock, as expected in Binder driver.
> 
> This is v6 of a patch introducing Rust bitmap API [v5]. Thanks
> for all the helpful comments, this series has improved significantly
> as a result of your work.
> 
> Not adding separate unit tests: the Rust unit test infrastructure
> is very new, and there does not seem to be benchmarking support
> for Rust tests yet.

I don't understand this.

Benchmarking is a very simple procedure - as simple as surrounding
blocks of tested code with ktime_get(). And I see that Alice even
implemented the Ktime class last year.

> Are the # Examples tests enough?
> Alternatively, can we add more test cases to those until 
> the unit test infrastructure is in place?

I encourage you to implement the tests as normal kernel tests - in
source files that may be enabled in config. I can't insist on that,
and will not block the series because of lack of benchmarks and
tests written in a traditional way.

But to me, scattered wrongly formatted commented-out in-place way of
writing tests is something fundamentally wrong. Not mentioning that
it bloats source files, making them harder to read.

Thanks,
Yury
