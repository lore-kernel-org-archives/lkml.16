Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7971F4607;
	Tue, 24 Jun 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774487; cv=none; b=Yuuz7fNMEiuprGImNDU0gWuwGqO+OCzsvOAon6Xluh4WrQ4JV8S2YrEEWq3wntJMAwE0LQYHy9M7uR9za0YbLtGzTC276rSlc2a5vTImHBYwO90iD0xfbcnm9rTCxucX5/LdGgLnEWFRZQWJGQQR3IN6rd1tUk7VCIzFCkhET3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774487; c=relaxed/simple;
	bh=tmOAhF2CNTR72yp25jzRdXMJ2OFtEyASCK3R92HxtEc=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=R4uMcb68j9sjJchGYu5PBr7iQU4Gm1p3g3QjDkcI4dw3EteKCvPIjZcuxBHGYUv3SjzRhb9nuRo7991YtIsPzBiUe42hYs/5S9FhhNnGlppSgqqJyAyOoBHvNgnvGhvVwY90KH/GsYLzXqOA0MgsOHRCRuj+u1ls7rv3qmqvNU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5h9VWGL; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5h9VWGL"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-315c1b0623cso2561155a91.1;
        Tue, 24 Jun 2025 07:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750774484; x=1751379284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGGfcffrAo9eq6TZlCoUx0e67nzgl+RHiLPtw606gqI=;
        b=l5h9VWGLk7f0FpX20eh3/RLJm8QOHmFRiDz59eL/tZI3O02nhxBeZ8kA575nTl6uDP
         qFfgQ6GVl3xOV9zWFzmMjtSI8Ut55Weiv+MqEYwEc4D7Jdsb5WhmLZwmCSK9ONsCp4qq
         1l+5o9psZq2crUqsFuA7HBWggnEjKBn3GODT7mpS7XxnbsQI1Qt5NHprwEDq6tgiwm2N
         txCwgp/0JU2ElvXy+Y1JPc9QTB9NM59gArhvmS+k+xJZ/BYQsaiB+e+rsaEZvZ2W0ect
         l6LXBclz61WBwPXOk8g6BXJ7lxqdLYLIRY4ko2lWmwzIZdyB2gSEdCEfvgz/gFVrHwyG
         ZDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774484; x=1751379284;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HGGfcffrAo9eq6TZlCoUx0e67nzgl+RHiLPtw606gqI=;
        b=YGguz3unckokjfwNdpUfGXx4DAzuZ+TM/HdF9fzGDPn1OSezNkrPz0MROJGOjqAiIG
         nmXD3OteDmq5Qgike4TbZ4yecfayg0EgH2kM1430tUX1JE2Z57BYlLqEK0/amhi6NuVH
         +E/8SRCsXPUud9bEDlNkaErhrg9HuKB9X7GCzt2RJVWdeBAQHwRduovtURrLZWxcvGM6
         SKOjSW02fpVI7SexjirrkzK+yEcKFykUVE11tUZ6Ukk9c8YiSua/nF0YzXYsSLgKnW9V
         ujJpXrtKcSiKoTPBWOY45ZKFcfUsMg1mhITmzBBPgtE8xZxKnk3GNbVE9sRYDqx9PDRj
         mUXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4khJY9ZcraGJnRrPNo/ddmpJPmalCko+3BqVKRJIYMg7UTe/+DkrhxcGMylaH7CZ0owLrQbxYEf40wrMWj3U=@vger.kernel.org, AJvYcCXGCPyu3Z1bE3LjJODMaPR6nOHZ7IdEJJOsby6Fk/zcijED1n2eXi5XKAgBVMHnQRwp+Cmz9roY43smVbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtMSYiR6qc3oINSjOD8juSu6N/bc00pOcgpWlR0eIndgFaNSX
	bTkpahLl4rFgR2TO5EW2DmT+kHwNNe+LGLv4tQgUtN7OgDTMvk/hYuVC
X-Gm-Gg: ASbGncs46/mdUQvhYdn1ztl8Q++z4JeRTcEKZbIcBeo1HpALaipVtpXbG5eQNbq/CEm
	1HwKZUoIIAX/iFtgOoZSOVAd+vvmTVSukgh3QcYF68rGsOaKmfoVW785xXbjE2BIemja3aP0hVB
	NzsO14gJ2AeA5KLLpWdv0zkrhZ4BUpFwLv8Ev6yYTiy21JAoDuxtZiXAvE3IlF01oWLIgcKvxXB
	WaC9dx7V2nxQiPK6HI3Ami362ikl6eYpujZCjgor8AGBKkzOHbHDHUdjyaZF1+gt9TA97DsI5Uh
	YSietaM9YAOgVAdIQ5TuTahn7kYSbelmaAND1JDlgcN8gT+RQrC/2z8iSd0PPrB1T8ws5LdtcQf
	PYJpINed5AU7NGDc0vPjMVaPX/3u+kxIsFSJDbQjk
X-Google-Smtp-Source: AGHT+IGowRDyySJy1j8k0ZZKiMExfxK4WJSD9h6BhlvCpJCsl56VjiVIEvxSxPzgxpUtpydjak9mtw==
X-Received: by 2002:a17:90a:d64f:b0:311:f684:d3cd with SMTP id 98e67ed59e1d1-3159d63d9e7mr30845175a91.12.1750774484443;
        Tue, 24 Jun 2025 07:14:44 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df84850sm11688244a91.13.2025.06.24.07.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:14:44 -0700 (PDT)
Date: Tue, 24 Jun 2025 23:14:28 +0900 (JST)
Message-Id: <20250624.231428.764205178512881259.fujita.tomonori@gmail.com>
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
In-Reply-To: <CAH5fLgjttTnev2h4J-hF-LdUTJCoryJyFm5_LqJ6_GBe+=An5Q@mail.gmail.com>
References: <CAH5fLgjJRbjPnN58RuaBtNrY1A-tif3ohETLxdbaE4b46Hjbqg@mail.gmail.com>
	<20250624.224923.1801832299260163743.fujita.tomonori@gmail.com>
	<CAH5fLgjttTnev2h4J-hF-LdUTJCoryJyFm5_LqJ6_GBe+=An5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 14:54:24 +0100
Alice Ryhl <aliceryhl@google.com> wrote:

>> >> So would the function be defined like this?
>> >>
>> >> fn as_nanos(self) -> i64;
>> >>
>> >> If that's the case, then we've come full circle back to the original
>> >> problem; Clippy warns against using as_* names for trait methods that
>> >> take self as follows:
>> >>
>> >> warning: methods called `as_*` usually take `self` by reference or `self` by mutable reference
>> >>    --> /home/fujita/git/linux-rust/rust/kernel/time/hrtimer.rs:430:17
>> >>     |
>> >> 430 |     fn as_nanos(self) -> i64;
>> >>     |                 ^^^^
>> >>     |
>> >>     = help: consider choosing a less ambiguous name
>> >>     = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#wrong_self_convention
>> >>     = note: `-W clippy::wrong-self-convention` implied by `-W clippy::all`
>> >>     = help: to override `-W clippy::all` add `#[allow(clippy::wrong_self_convention)]`
>> >>
>> >> https://lore.kernel.org/rust-for-linux/20250610132823.3457263-2-fujita.tomonori@gmail.com/
>> >
>> > Are we missing a derive(Copy) for this type? Clippy does not emit that
>> > lint if the type is Copy:
>> > https://github.com/rust-lang/rust-clippy/issues/273
>>
>> I think that both Delta and Instant structs implement Copy.
>>
>> #[repr(transparent)]
>> #[derive(PartialEq, PartialOrd, Eq, Ord)]
>> pub struct Instant<C: ClockSource> {
>>     inner: bindings::ktime_t,
>>     _c: PhantomData<C>,
>> }
>>
>> impl<C: ClockSource> Clone for Instant<C> {
>>     fn clone(&self) -> Self {
>>         *self
>>     }
>> }
>>
>> impl<C: ClockSource> Copy for Instant<C> {}
>>
>> #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
>> pub struct Delta {
>>     nanos: i64,
>> }
>>
>> The above warning is about the trait method.
> 
> Wait, it's a trait method!?

Yes. Clippy warns the following implementation:

pub trait HrTimerExpires {
    fn as_nanos(self) -> i64;
}

Clippy doesn't warn when the methods on Delta and Instant are written
similarly. So Clippy is happy about the followings:

pub trait HrTimerExpires {
    fn as_nanos(&self) -> i64;
}

impl HrTimerExpires for Delta {
    fn as_nanos(&self) -> i64 {
        Delta::as_nanos(*self)
    }
}

