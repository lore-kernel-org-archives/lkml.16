Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B61E98EA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169275; cv=none; b=QqmnTkrdtz3+fYyLa+BnJsBueO9exkt2MLWVrWHp9a9MYp+4VjB8/KeGxqdu37hx7leOs/rv+2UoIG/1CyL10AZOPE8UA8GNZzOGPyumH7yrBpcHkwvzFXukszI4AEppGMES0A1B47o/Sb6bkuB2AXCMIpOArHTIT9lpPXxhgRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169275; c=relaxed/simple;
	bh=PNbWGAMKm9s3NrC346LUCC25A0/fVZrSTFIV1+54+pI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgzVw6qyC4ExDsbejHQzJtqTKwQk6XfI19rW4vFBOt4iw3IGIG1AGcL/XfxTqtzQtIJSBLuzAsHoeWTwZv4nK79kZl4kGFG3nKHbJrbvi8/K56oKBmWg0d+QfLwfWNw6h3S46IZOScfva7eufubieUkUHYFsBDGP36yNhn+YslA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mtc55u2V; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mtc55u2V"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73bb647eb23so1677599b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746169272; x=1746774072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sIYKB9F3o478Jme8raTXTfUkifL4J9sNzNUm7274ITk=;
        b=mtc55u2VznFCXMNRTV4Zu01W8hFrh2CE2zmsfKK2qj5WoZbR7GchyDKsEeodQCMyXb
         hkU9f591btkRXO0oooukUntSuaxpPXFngZ5iu4KgD7247e0v8JRymyEfn6gMio7FqDL+
         S9ose1UQNILS2DRqQkhoOD0cHOF+pIkQ6n6TOnGd0FGIAh9A/IpFPI1goYs6JW+S5sGJ
         mbYzO4mmFMcD3kQCf7oTnZKfxu5s1wtUC7xZbxxEswRqI9i2mn+ayFGmXvDRSnQqt0BJ
         l9C0XdatadJKLOkrG077ueXz27Cduq0PpEBCYv2Llw/jM/HqK6FeIHhal9BbXx2SLD+3
         kvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746169272; x=1746774072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIYKB9F3o478Jme8raTXTfUkifL4J9sNzNUm7274ITk=;
        b=Vp3mbrujvrs71YiPUu2/kcBmkE59VlS6iBhYsmWPt9h7ob9O+OKc6Af0At+a27DW4p
         NEHqUWchnH6AlrTXTHSl6wl7YDmEuR0MQII886Pv3mC+RII5eeEZK2t98SKZHwubJBQd
         kX2bWULM55DKE9f3o7wH+CFPsYN45fmTEn6s+6j/qf6+gjA+skMjXRm9EkO61kMn/Z2M
         GoLJrSx+L6aSrozmRMgTuZZAdM+Bl2p1eaJUDHonfoHmPRSACAGJ/qzJhxwiZ8EeY8aM
         EBYIApUL4HCbD4s5SPls6iR9rS2rwvMqfzvYVxPHWMgfCCfjaqR7ywSaD/MD9DiZeOtU
         1T8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+P7rsiV/He2SUC/BrPdFg1r3AahG0TQd7naepVIQrWOslwi3HIsMvi7io68dTSiwVYel7wivoTj6aFGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/cVvtOPn/AwggYlnFOoNtpPoXnLmG2EMRGOycbtfuikzFVFfY
	/Jr0peCAl4u/u9+nnPKn3o+3b2AWiIkkQ6Tfqq33RLTshWyCiBAWnf7b+vdZ7dM=
X-Gm-Gg: ASbGncv1i1gGPd9+06qBX0PLu8hHfHluQvEnO5Km/wUzyMopAPhuz8fP0JlPirkfbhv
	4t85xE4Wohc663bE/fAWV4Yvgz3cDzOV9RcKR1fnOpfbbfEkMei4oX5eSoLxDUMM4GZf7YbgWT9
	r5RtI62Y4YY/v7fNH5ZSbsLl2Ry425/jXo+s2BlwdIMVnVmZq/qxSHIQ44gJ4YuNiSp4d0aHDSM
	GVG0SDDfGM00766q5Tjj09+jKiGbVb8C+2yffHYm/AZp2E1kyHiwa0FsGfNUHugCI0SexQkn7u3
	eXjCCAzymJHUCsZAwbudj6giEF+nWxqkfqHH9D0iLA==
X-Google-Smtp-Source: AGHT+IFSx+VRtOySROI7ANgNGVBaqHJbD9bAJPiju2pU+HGgAlpdoEmLB1WKijWr1JimZfsA5Unkjw==
X-Received: by 2002:a05:6a20:3d90:b0:20a:53e7:4a44 with SMTP id adf61e73a8af0-20cdec4b676mr2533309637.19.1746169271726;
        Fri, 02 May 2025 00:01:11 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c6a59bsm49529a12.67.2025.05.02.00.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 00:01:11 -0700 (PDT)
Date: Fri, 2 May 2025 12:31:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
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
	Yury Norov <yury.norov@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V11 00/15] Rust abstractions for clk, cpumask, cpufreq,
 OPP
Message-ID: <20250502070109.inpes2ou3rxx2fxp@vireshk-i7>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1745218975.git.viresh.kumar@linaro.org>

On 21-04-25, 12:52, Viresh Kumar wrote:
> This series introduces initial Rust abstractions for a few subsystems: clk,
> cpumask, cpufreq and Operating Performance Points (OPP).
> 
> The abstractions cover most of the interfaces exposed by cpufreq and OPP
> subsystems. It also includes minimal abstractions for the clk and cpumask
> frameworks, which are required by the cpufreq / OPP abstractions.
> 
> Additionally, a sample `rcpufreq-dt` driver is included. This is a
> duplicate of the existing `cpufreq-dt` driver, which is a
> platform-agnostic, device-tree based cpufreq driver commonly used on ARM
> platforms.

Applied to the cpufreq tree few days back and is now included in
linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git/log/?h=cpufreq/arm/linux-next

Will send it for v6.16-rc1 (unless there are any objections).

-- 
viresh
