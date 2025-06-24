Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5C923E336;
	Tue, 24 Jun 2025 13:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772981; cv=none; b=aFMrSiEo0BJJjo7HIpCA9Mwe1u77a7wcWgwyoC1QlmQqUXhUoSGj0FNH62hl7jDmuzu9iVjMqxFip/ZA3RsGlUVB1mD6SGUYeVFFoNR7M6oJptSTTNB0HEtU/PEiLYo4EuKQAuzG/c3o66PhwsxsXrf8ThMzMbp+XcTP/XX2b/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772981; c=relaxed/simple;
	bh=oqjGCqo+3jPtMvnW+xPAtBoGDiiD+tGkyyZIw+G6SsU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SGXzjV1Qg7Rp2N/FhNGAwTUfDbcTtd58kP/u9BhL49WlBAZ73C5j57OGHHpy7IUZim39Hy9VJKXuXIRxnHQNK7OFJ1t/nRu4pahK9BfASXlJaW/LsKuJL5e8dRPwP75L5kjL5kMztmXTDkJSD9a/sfkYJScFx5Sdv6zhZAo7A1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0AMqJ8+; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0AMqJ8+"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b271f3ae786so406487a12.3;
        Tue, 24 Jun 2025 06:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750772980; x=1751377780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1D3QdEAPCGyd4A120mlOM8Gbdnk1+ZP4/PAl9Roc7GQ=;
        b=f0AMqJ8+ZIkz8JQWxYIDyHKmlIptwLOBSQpwTpmUDBTwChVRFOnvtUAA6dOX7nOMf/
         6cD1fZqFmW3/s2vLtEXsa6AG21ur7hOgKyOoX09pNEN8Yz0eQN+1uTpmiTKnJ/b7zv8l
         pbOpr1KEYEk/2rQ6RLzFLVrZAzDmFZAS8Pe5ByqZBOdmSJ4lsag2Ay4foWbGDtfaWnrP
         nc4aHyBtHXiLS9o2zODHLoTZpTmqSaLuaNu2eTwysHFX5SxGBP/9WUTiRR/QPFQqPEb0
         YuQShVVRTiyaQEY/r5/UvShhEO33eCd3CNev8kmgKT7IRMF6wlEzEtJEfuaqr9u4fADO
         lyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772980; x=1751377780;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1D3QdEAPCGyd4A120mlOM8Gbdnk1+ZP4/PAl9Roc7GQ=;
        b=kjVF/VqGwR/tdFjH9oiJfqUVwopwjE7dEVFIwTibr9c3Ep5RxozGcGaQvIEF2WPlz9
         4x3R5WmvwGTHSEjrECom7galmFls+uzELee/0CPxR4n32KFE+zJaDEZCZVA4w4CGvGUq
         mZuVdJ0dW+yuHVSlT8Fp5yUTeSyfhwe6USloqmKH83qPVy8XMNFN8CssWu/xQuTtDBhx
         l7UdpPLrktKyIqX8m5tH4L8F60QmoBAhHeRu4H8zK8nlr4vkTprfKTdpBSA7e9wHDRKR
         7JaaUTf9aJN5tcrEsPdxW97jaYUdK3LF7VlRDXSZkj5jy4NpQ896OLT83P3ohbmlPQOF
         6q6w==
X-Forwarded-Encrypted: i=1; AJvYcCU+hJBmm+e98NdNgb0u5Xw4QRdBsY7y+7bTvuLgJuZrgGFi/zOwXLUSxc7oONV4+hUuBVdniR9NWZStvwU=@vger.kernel.org, AJvYcCUf03+nXwF43MYj+i4lbTD5NDCgT+3XR17GyEP+Mc0I+KVll15+K5HmU5/M5owrm75TK61+OHziCDCNVXiOYDo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ikLkTWFGTkOLjUmoYCRguziAxv7P4PKUwygBnGU8HRgWXWTB
	ZI/AMNOC1dZGdrNzh+e9fREaoZMQNap4kLPyqfvec2ToYaBULA7aUn7O
X-Gm-Gg: ASbGncvsty6wVGxnHLnkmHEOagFDK78Asgdj/bKUR+jheqmV7aaxrTA2W0ACELMOf8a
	yTgBaV5jh3/qqzcICgfx0kGwPMM0H+Aqv5iMJEnJAhrJNPUx9CCYHsK/uC4ZC064N/TL1r+FL7h
	DyzMAX/0X+9G8EBgwwFWqfdigHL1uSE1XxT5fOJOl0sEYEgydaZL8AWqEQ3ngxcmM4z8+jhCub3
	yERLmqYQn9EY77gAGInKLTmurL3A8ynsJf6+yAewuLmMDv24pF2isA9Mnp/bD2dEgtGWlO29SKn
	0kM9kErfM8JiyhP6Xm9cZyrT64CZbFkR26f+grty25AgOzwlFIBp6TgKA/yIQmEw14fEtQygh3x
	cXojlF4qAPi8kQkm7YJx1DItUfc3l+GKJYzGOOj7W
X-Google-Smtp-Source: AGHT+IH09BoG9Y25KaozOAWn8XkeE8DpcA4nq7ILpLesorAZDceyoUHgWz2VqSLwz8qJawXqMxjsTA==
X-Received: by 2002:a05:6a20:4310:b0:203:c461:dd36 with SMTP id adf61e73a8af0-22026ca838fmr27618037637.6.1750772979687;
        Tue, 24 Jun 2025 06:49:39 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8851b26sm1828905b3a.122.2025.06.24.06.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:49:39 -0700 (PDT)
Date: Tue, 24 Jun 2025 22:49:23 +0900 (JST)
Message-Id: <20250624.224923.1801832299260163743.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, miguel.ojeda.sandonis@gmail.com,
 a.hindborg@kernel.org, alex.gaynor@gmail.com, ojeda@kernel.org,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods
 as_micros_ceil and as_millis
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CAH5fLgjJRbjPnN58RuaBtNrY1A-tif3ohETLxdbaE4b46Hjbqg@mail.gmail.com>
References: <CANiq72mBfTr0cdj_4Cpdk62h2k+Y5K3NSs54_1-9jiszMZ6AuA@mail.gmail.com>
	<20250619.160844.1477802332578239775.fujita.tomonori@gmail.com>
	<CAH5fLgjJRbjPnN58RuaBtNrY1A-tif3ohETLxdbaE4b46Hjbqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 13:15:32 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

>> So would the function be defined like this?
>>
>> fn as_nanos(self) -> i64;
>>
>> If that's the case, then we've come full circle back to the original
>> problem; Clippy warns against using as_* names for trait methods that
>> take self as follows:
>>
>> warning: methods called `as_*` usually take `self` by reference or `self` by mutable reference
>>    --> /home/fujita/git/linux-rust/rust/kernel/time/hrtimer.rs:430:17
>>     |
>> 430 |     fn as_nanos(self) -> i64;
>>     |                 ^^^^
>>     |
>>     = help: consider choosing a less ambiguous name
>>     = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#wrong_self_convention
>>     = note: `-W clippy::wrong-self-convention` implied by `-W clippy::all`
>>     = help: to override `-W clippy::all` add `#[allow(clippy::wrong_self_convention)]`
>>
>> https://lore.kernel.org/rust-for-linux/20250610132823.3457263-2-fujita.tomonori@gmail.com/
> 
> Are we missing a derive(Copy) for this type? Clippy does not emit that
> lint if the type is Copy:
> https://github.com/rust-lang/rust-clippy/issues/273

I think that both Delta and Instant structs implement Copy.

#[repr(transparent)]
#[derive(PartialEq, PartialOrd, Eq, Ord)]
pub struct Instant<C: ClockSource> {
    inner: bindings::ktime_t,
    _c: PhantomData<C>,
}

impl<C: ClockSource> Clone for Instant<C> {
    fn clone(&self) -> Self {
        *self
    }
}

impl<C: ClockSource> Copy for Instant<C> {}

#[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
pub struct Delta {
    nanos: i64,
}


The above warning is about the trait method.
