Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C524C9F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 04:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749183550; cv=none; b=f10qQaP4KX6OIaeZgQ1y458x5p54HxyNYI95/K7zdWvnENnD3olN3Jcabg7scWXMyYkWqHwrdOu+T2eCN0junkSyvZp/8l2QQlmikz/apszlmvD1OzfQFN5cspcTpyTOe1AgNfkRCiiIcCmTSbxQT2f3XFIOnABvFAURgqXlV+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749183550; c=relaxed/simple;
	bh=o4abm83KhcX/5c/veDlyP/zoZnmewDi2a5Q046z8zEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGAkkPLtXt4JgzRP/7TbyFvXUezGj1x5dw7MYyX0jrAO1ZTmcV80EX9LB2qPZrBjm0FNffHghWKqDg3gFiYiTOsfbubG2LVGVDhrZWXtwoE9zGvixhihl3Yszcu3qrtICL2e8C9S81fkTkDAww5DGyiXOecbfYb4UeiESzDfc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPvErT3v; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPvErT3v"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-234d3261631so12654355ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 21:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749183548; x=1749788348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xUTI80lWcRXNjZ88XXY8GFQIEPWXmof1Egz2/hSjiZw=;
        b=yPvErT3vW02iG73N1mkQvfpATCr37g2hAIizKFYP7/NXIO6T0SrW6tsc1ne/A/aEfa
         PI09n5HgojI6D0TmAh0A4r29ZIIgX9TuJNbEaDLi3iZ48DESaLqDKd3qFy4Y0N3/z435
         IhEQ6V3oFm97jK/nkkCCnoN5JTegNU3qE0WQoy8JR6EjrUrjWfJQz7ofZj0iA7jlMcTc
         RMn0Fq4QdX6266zgCO4zItNqSQyQ+ZJVVprlfH6IiKliNtje5kRxvvS2L/a7oS+URFuv
         xX4Xy6MMPfmWSR95x/Nu5MTjFMivccYZKzb3642NTYZBKf25y1pslKpwfl1rdU+iThOh
         9+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749183548; x=1749788348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUTI80lWcRXNjZ88XXY8GFQIEPWXmof1Egz2/hSjiZw=;
        b=Mgk31cSummfBvH1mo/qHJ+tSFEfKZ1I/SiSwYb7QfGVRrVc4dKHnX/8/iOJQaw6Okc
         gdlpObWHQmcsP7P0n/yYoFnwCgqfwiQODk/cdvFBwQouaCOlibsJMa2gsuNKWYSeqeol
         bEx+PuaEb1+5ad1fZ5fTr8yvcYDfkN+twQMB6+u8IqjxziSyR1S1E7x2HlzVHW9V9TjR
         Q9u2+Re2jP1TTSe03qlm0zXTzdcp/S6RdPq8Kl3cbAFrE+y9zodRCYLtFB4UVkh4ASde
         IQaq/NuvZ7MtPmPE/AQ7BpgzDvRqYcWDEV3CQyaEBzHq73MZkevaYy4ciObykLwnk2jc
         IgRg==
X-Forwarded-Encrypted: i=1; AJvYcCWV9jmwQL3ZuNZKfcU43cHsFGOrZeDdhsQEvp7yU935INpcHxW3i6IVCmXOzwbQusYd0PRztoA9r2mG8cU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTb9bgjFRj2tW7hTJi+mgL+5tWT4pyz7T4iLLW4j2t7f3ZmeWz
	z5r12AdL8ntW12QUgjoXW4cLlPxRVJYQEAcPqelKzuRtNebGQe7LaGwt9AT5+wZn15Y=
X-Gm-Gg: ASbGncua9D0QVHWJyhgv3ePW4w/F9uSljCxci7CM4YgUS7LY2mAkdkg8phtXGDUBTfK
	DBRssNZrkGSrn9a1EJaVlLb4OnGNTNnvyJG0ng6Jfz0fGftvu4xKswqqS4DRg6DvJGsFkz5F2na
	N6u9H1IZeXKDsJ7jOnqKkPwymfoW3kCcN1GnBYPKRmFft11PoG7GnNdNg83MCae4boyw+xg5Kua
	uubBAlURLJRTSzfon9qlqw0YNOCjK+8Chb9sUOqhRPcKiI8He+u36WW2flxy2j2RLNh7a2qkbIt
	Y+/hS0sFvxdfZzqkNMkNE8hYKxR1raUTdkiKkWRqBQ7XQR3qx2z2
X-Google-Smtp-Source: AGHT+IGzgVo+9iJ8+pGbStrfqIojnnqwOZeq5s8p51j8fnc0ghBhaDbG4KoHtQPh1UGLy5Ce/aq75A==
X-Received: by 2002:a17:902:da8c:b0:235:2e0:aa9 with SMTP id d9443c01a7336-23601d24441mr27452635ad.14.1749183548029;
        Thu, 05 Jun 2025 21:19:08 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603a6723esm3349595ad.252.2025.06.05.21.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 21:19:07 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:49:05 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>, Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Viresh Kumar <vireshk@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250606041905.zgjb2vxpwbpjhlzs@vireshk-i7>
References: <HVTDJypFNQFfSQJmmYDSPU4o-irFnjmDN22RW3S0z5Kwe_hVk9kquZWElv-C2k6d5kOIiewhj_Xo2kAoTHbHgg==@protonmail.internalid>
 <cover.1747634382.git.viresh.kumar@linaro.org>
 <87qzzy3ric.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzzy3ric.fsf@kernel.org>

On 05-06-25, 21:41, Andreas Hindborg wrote:
> I was testing an unrelated patch and found this kunit failure in
> mainline today:
> 
> [19:45:34] # rust_doctest_kernel_cpumask_rs_0.location: rust/kernel/cpumask.rs:180
> [19:45:34] # rust_doctest_kernel_cpumask_rs_0: ASSERTION FAILED at rust/kernel/cpumask.rs:190
> 
> This is for arm64 defconfig. The test seems to passes on x86_64.

Posted a fix:

https://lore.kernel.org/all/8b5fc7889a7aacbd9f1f7412c99f02c736bde190.1749183428.git.viresh.kumar@linaro.org/

-- 
viresh
