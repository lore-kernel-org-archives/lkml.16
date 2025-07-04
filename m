Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8EA21C9F1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751609656; cv=none; b=VoAIK8wY2Q3vVaL/C709MWBnvFTfj1oOwyMXD/KQwf/5NXN9/0rzCh8dSnorSYbqpN7UY8ENG92Mgg2a5S84F1RIfMfJeJQutMxLPlo3ZasnJLB01XMmFf3NOf1mMswlEZEVDbfLoHMIZm87Mgu5QDsLo9lKz8K/R/LE4L3K930=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751609656; c=relaxed/simple;
	bh=NQpLby3JagGA/u3jCbNd5/YQJd7ptj+EdM3LxWvIu+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k88x9LkOIqsLGyyfbDQ1YSH7Ph/I1G55/ydOWGlbdn1ELrJgSfMOHOpHbMAisOEpqKy3kYsdFYnwkqtYnZc9X/IyY8090WLegqUhPplK/ZT2cMCq6QAts9+Kui7lfcoe+b7+QQHzN+pDxpYfXMvcchpLvH9M5hz7w6ZP86dQMqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=A9t6K1Ly; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="A9t6K1Ly"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so93435366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1751609653; x=1752214453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wl+OFcWbl5NripR5OloKOuQ5b3UuSM5Bie/W2u7bud8=;
        b=A9t6K1Ly5Z4QqL5Gw38rtF1mzAfmMRmqxf9oxeSaFaXSHUhaa0Ykoo3+GTbF6tXJc1
         Fml4jZ7HEZsMcfcOGV8Zy3nGjtrP58EQYZ23njsrka/qqhI6uFx8gfsGlE2IW0Ei74G6
         z/sqayYItixuQEU8bK+ugzUTnTggVeHQKwF3XFf3nAWT+X/j7gD2r1CWI0NQJbQHg52m
         kSujSusbDADcK85N1KZCcqrYINEB6/n6zQbAZ8Hs8WoJ5esLO3e1LGMCCAOzHB1aKHdO
         iKZaO9dlTxv3/+HxqYrJqpLYJarX2WDBAwqfeV1U7Y6psqggIwR/di8JSSVvHnvfDSxD
         uQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751609653; x=1752214453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl+OFcWbl5NripR5OloKOuQ5b3UuSM5Bie/W2u7bud8=;
        b=dC6VcbJDQcLhRFu9c18gS+6kgFHelioF4SQNWS+UkgQ1/aSh+rzo7PUngJFy+3t5iE
         1+qlv0k0phUuDOz4KJYIjSXRuNOJC8YfVUVKo6v/jIjiBsP+iIKTOajeANoYmkdJ5DXl
         5lE3yj6XeaD3rvtTABXHhDMYVr0UYMXmjitM8/zjGgCPTo6W4rZtLuDht8r7O/chrcoM
         70+bREZmvMwrn6J6kjyZ4z3VRKmTjIGvCVphPwSWfRuyIrCF5azKSTZebzH3cwjMRVzq
         g8dmIad+3lf67nqOKXa1tenmvlJVlFHQZVtYBsfgOGA3yoKEvndSEJEKVxUbxMDCM8BA
         X/YQ==
X-Gm-Message-State: AOJu0YzkFA9djeEs5rrIDQF9NgF2oJMqewnhzjySe3sc/Eb+38zj9W+3
	KwG+++KXzphwCNWhQ24P/dFrYedPZRgJUHtXRZVKQq9UY2nTu2H9qsWNLRF9N4CPSiU=
X-Gm-Gg: ASbGncsAyUZemTU+gz8mrIXrWYOw5dBpkbFsUy8IE1WLUz3o7FWjqDbS4k0c1m1U3/3
	0klpYg05skhXXd6yFyEMsCZasI4sMkXeai3o58AqJTTkevs0wr9hFztAMRrre6F4pWPV5s0p5wm
	9giTu8I/+FpkEbQMPMEKxYXCeyzNFKT2VelruRuS6EO6vuR3tP0IypN1FY2zCrxeYinsZUK4IQ8
	skQumZM4VJ+zopuhFqcCtb7LIlAb7h7fGh5PrPs26gJn32KmDbl0J3GK1FKee5BJ2BOfw4C/68Y
	zGwxxdcF4CXJMSehkK15hqxZqcSzmDscFdM21/KAWTxLI5prmnQDRgMmHUmJyqSj/S5v/Vsc7hX
	MrNv7kWZLkBTtWNC9IYOFshvUT7oSAw==
X-Google-Smtp-Source: AGHT+IH0bg6umv9ZUToHt0GI088EjJSGRPAT4nP9caOEX8ao40a+HO6JMdGNpUYc8qiIG17UWBeQ2g==
X-Received: by 2002:a17:906:7310:b0:add:fe17:e970 with SMTP id a640c23a62f3a-ae3fe691cfdmr68755966b.14.1751609652858;
        Thu, 03 Jul 2025 23:14:12 -0700 (PDT)
Received: from ?IPV6:2a01:b380:3000:1d69:a334:729:91bc:3061? ([2a01:b380:3000:1d69:a334:729:91bc:3061])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b60008sm106997166b.161.2025.07.03.23.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 23:14:12 -0700 (PDT)
Message-ID: <fcdae3ca-104d-4e8b-8588-2452783ed09a@sedlak.dev>
Date: Fri, 4 Jul 2025 08:14:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] rust: irq: add flags module
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Benno Lossin <lossin@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20250703-topics-tyr-request_irq-v6-0-74103bdc7c52@collabora.com>
 <20250703-topics-tyr-request_irq-v6-2-74103bdc7c52@collabora.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20250703-topics-tyr-request_irq-v6-2-74103bdc7c52@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 7/3/25 9:30 PM, Daniel Almeida wrote:
> +/// Flags to be used when registering IRQ handlers.
> +///
> +/// They can be combined with the operators `|`, `&`, and `!`.
> +#[derive(Clone, Copy, PartialEq, Eq)]
> +pub struct Flags(u64);

Why not Flags(u32)? You may get rid of all unnecessary casts later, plus 
save some extra bytes.
> +/// Use the interrupt line as already configured.
> +pub const TRIGGER_NONE: Flags = Flags(bindings::IRQF_TRIGGER_NONE as u64);
> +
> +/// The interrupt is triggered when the signal goes from low to high.
> +pub const TRIGGER_RISING: Flags = Flags(bindings::IRQF_TRIGGER_RISING as u64);
> +
> +/// The interrupt is triggered when the signal goes from high to low.
> +pub const TRIGGER_FALLING: Flags = Flags(bindings::IRQF_TRIGGER_FALLING as u64);
> +
> +/// The interrupt is triggered while the signal is held high.
> +pub const TRIGGER_HIGH: Flags = Flags(bindings::IRQF_TRIGGER_HIGH as u64);
> +
> +/// The interrupt is triggered while the signal is held low.
> +pub const TRIGGER_LOW: Flags = Flags(bindings::IRQF_TRIGGER_LOW as u64);
> +
> +/// Allow sharing the irq among several devices.

nit: irq -> IRQ?

> +pub const SHARED: Flags = Flags(bindings::IRQF_SHARED as u64);
> +
> +/// Set by callers when they expect sharing mismatches to occur.
> +pub const PROBE_SHARED: Flags = Flags(bindings::IRQF_PROBE_SHARED as u64);
> +
> +/// Flag to mark this interrupt as timer interrupt.
> +pub const TIMER: Flags = Flags(bindings::IRQF_TIMER as u64);
> +
> +/// Interrupt is per cpu.

nit: cpu -> CPU?

> +pub const PERCPU: Flags = Flags(bindings::IRQF_PERCPU as u64);
Thanks!
Daniel
