Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E71165EFC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608313; cv=none; b=OnqLCBWMfYYUuKn9o3x7dI64ju1AyM5ZIE8omP13wvBqRPaKUr1yYnj4GDoD0TZdw/w0/IaSiOzYBrYEu/QqCaCcvbaCoAjt1/6+rHXa6rm6rFnCzWrSwGFH5LutzLSrNpyKzu8QJAB8Zur3edTM27mKP574JglaF6qWyn+kWzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608313; c=relaxed/simple;
	bh=A1VFeAvhgOC1yMtN7yIyjPHN3d7Ti6ibq7gtPR6jl6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UURn4pO0dW4im/CTHF91GSDmFC274KYKnXh1ABDz6nGaUsNpgqfInbhrGhWXDPvVb1VCuFwu/XwvwOfupBH8tryyczwTcctKbUFvFrKgIVVijSNbkkZ0H42q7CxHuaa/ciKlYTrnOAsE/R4SB6tWiGHgpL9IMwLeboZCCE0N5Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WrwnM+C5; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WrwnM+C5"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b26f7d2c1f1so5646114a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749608311; x=1750213111; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BVzPT+QBa+W+93Jw6CnS8ATXdFQx76rd+QJAPEuwELM=;
        b=WrwnM+C5gS3K6h39OPo0xbroKtmYSKvrQTB8inA/cHMPjFxA3/Xck8+dz0nAQEJcpj
         nGH9hzS50hH1T+xQSupeRsZYD8+oIRHJs4vPOGiDwBfgU1GMR/EyUj6IW5MuvruIRqIm
         20y4n4U1P2yHs3FgcMTKFEqEjgyXAOVVb+AxKcGPM8CXffSCTYXvlmcoO6XjtXhhTxjk
         o3ZaAvX57KMGbHD6WwSZicKwQlExmARUZ2inZLRABHBV/KnhOjJlOAmakrD5ruhlXpPt
         0Qi09WfF6G2hrRkqAX13zrpxstKI+Sii3ilY5p4X9Kk7GftAWgvb5K6jx6muolQUQlhj
         hFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749608311; x=1750213111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BVzPT+QBa+W+93Jw6CnS8ATXdFQx76rd+QJAPEuwELM=;
        b=ugXIuh40H4SuS/FXnB1EPK8cbR6JwgZmfiwyDZssm4P9eR7jvg0QK+zYw4+6aWoPv8
         cgOZ1afusOB+T4UWpAViTUXtV08Kf8eb5f34ImDRHgjEJGhKfYPH4Pnn2R7Bl0IDryW+
         OvMDIJYWc5ZfUXHI8+QKYbxHuJHIG9wUtxjGC/eTZUw+w4FNcpRgoQ9BvZjmbz0ZsrZQ
         InQ4DU/wBDs5+IZP5MenPzNhciN+X+LLQoWuZdav/lkhCkpYVq+0bfQ9N7FM19X516gw
         ZrFjJ2bk1DidRSbVZSnOwsyP+aWNWBltMlLW9xVoch8UXJlRWL3BXt3xxH55Ao/q6DE4
         2N7w==
X-Forwarded-Encrypted: i=1; AJvYcCWM1abx6tip8/AqzW3zfzHIkcQFLmifwXD9ycR2g4RHQeU3r5SIlJRDjP6ZN6Le3UWskoubvhDuSHTwS4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrTqPf1iLM4qbXJj9AiVjUxa0KMUZaypxCAwMvDHMCJRu9LkDe
	Q5PV08VzvtQqAXuqlXpmwUiswDnTkL501EH7KGMp0I/YRsTcS8RCozA2/SuUBrfUIj8=
X-Gm-Gg: ASbGncsYyWm4knA7OSj3mYKkD0jrnxdB9G/m41b1MljTqLkimeT15GjWIOUe/ld1PbF
	o9kqJqjcHAY2xfLBsTqOF4C9pAgi52OPd7l+9wDi4S0y1wKqVDuxpIpNfmQ4c3RT0ufpqfLrkHw
	I69Qwjk1kWl1aUtx1KUoXLaLPCl+bBv8QgiT0S+g1SGtsiJdMV/l3sw2dDIqXIMhWcjesCi0Vcd
	OFxF1el7G7DFgDhDk23t9dL9zJRZVEbJurX2L27uDaFsyRnRL+6JF+H5l2QoniBK97hdjFbnuQh
	jAKgepxRjVyrq/8oMVQSutEcad4dceKmUVuSgTSnEnh8xSxYrMYa+us3rwhoPnmnx5n0kuASFQ=
	=
X-Google-Smtp-Source: AGHT+IExhs5eYhf6tHwalRmCPZodGm+T8pYXC1tEHKyqqYin+EC/fkXPzgbCpRMDAYA8+l44SvhlXw==
X-Received: by 2002:a17:90b:1dcf:b0:311:d28a:73ef with SMTP id 98e67ed59e1d1-313b1ef5898mr1307915a91.10.1749608311204;
        Tue, 10 Jun 2025 19:18:31 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b2141e6asm256489a91.42.2025.06.10.19.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 19:18:30 -0700 (PDT)
Date: Wed, 11 Jun 2025 07:48:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH V3 0/3] rust: Introduce CpuId and fix cpumask doctest
Message-ID: <20250611021828.fbdyugkxz4axz67b@vireshk-i7>
References: <cover.1749554685.git.viresh.kumar@linaro.org>
 <CANiq72mWAP5ZuOGTXZ1=zTOR_Y2YuqV2i8PberOeWOkx3VL0ew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mWAP5ZuOGTXZ1=zTOR_Y2YuqV2i8PberOeWOkx3VL0ew@mail.gmail.com>

On 10-06-25, 19:10, Miguel Ojeda wrote:
> On Tue, Jun 10, 2025 at 3:22 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Here is another attempt at fixing the cpumask doctest. This series creates a new
> > abstraction `CpuId`, which is used to write a cleaner cpumask example which
> > doesn't fail in those corner cases.
> >
> > Rebased over v6.16-rc1 + [1].
> 
> Given this is growing, should we apply something trivial right away as
> a fix meanwhile? Or are you planning to send this as a fix during the
> -rcs?

Yeah, I am planning to send this for rc2 or rc3.

-- 
viresh
