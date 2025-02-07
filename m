Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD12A1547F8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738924996; cv=none; b=tH75E0PzUHu4eH2T7/tITXj7tB8qnDuPsSlz9WIodh8IOh0cHdI7yH7pWpbQTJbahunpKeMRthH1oQ1o+6cBdkrBaYXKMKXHN1jlwDDFtXAeQ93SKxJ/MGfRDB7HCcTzsT6F/+1bL+K9VfRRdOevOZQ4bNCqOYL0s5HDvCXlt1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738924996; c=relaxed/simple;
	bh=hAoNykFyJ7QZhJYFf4N5rnUpO0uqECz17MfHTMXMUC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouehcxxZLoUxYP6ydB3NOJZdNrD16vdFare778nwwJcM1hx8fJgwdN681zKwLc8xcjKEApdw7xz3jhF9zFLZ0/iASU57gX75TTnaZWBrEZYtTCZDi83sUt5V5OBwNOcQODTr16vpZ5Ba+mbdJ4yddGFeXTrB9QjxxHbd3PcY2aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vnfPJdu7; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vnfPJdu7"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f48ab13d5so23486195ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 02:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738924994; x=1739529794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g1GRWaZfYYbqC6/CdwihJesZg/YXxEXg0hSLoDojT10=;
        b=vnfPJdu7MsXDHg4E+P5wN6VqJIJQ4bNizNlTrqjj0EKHkJw2o7AANMm1iUJVtBDxql
         vchVkX8cyyp91Dg3LMll4Tr0kMj8cNcRI7kJGXruWl9177GkitVDtiEBfYhzpyetOYvp
         6U2jVjNQdCOUkUUlx2Is3QxwYoF8f7B/EwMal9xFP71geSFF7gTzsPOniYv5t5Z7VfOq
         8WJ8bNNdX6brp5a3c6jFqIjVFDhu2UkBH9uTwR0TcIDjJwoF73Tp86NCcwANA93eDNiv
         ho2tIc6IKVhl2dBRAYgStZw0+BTUmRBp2OrO5y/3eg04byd0L+ilsA6Jpz/rzEyosOHZ
         Ycag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738924994; x=1739529794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1GRWaZfYYbqC6/CdwihJesZg/YXxEXg0hSLoDojT10=;
        b=mEmrTfq7JV+mglOivA5mmpWyV3x+2Am+75n2hA/5Zs5WBvsd+F9WnWqyT08A8HDyCh
         /mLg9B68X/gCaHZtHCYQTFZIfAHHcIMOFShmtWW8BTjG2uAhttTeiTSEQY+JvvmAwyKb
         wiLocgDhZRAaTz2biSwrN0XCSHpW9IXyEZhWOFcBUR+TymfYA5pt4K1KoAdpj8cf1Mou
         iT5gmtae/5Bi0xlp51TxQBVkjc422k+PpZn9eNVCzSC2qIXq4mS17yMZk1bhyf3Z3ntG
         t50Pb/OJ+CoA4EkJuzEI+grJk5KhlHKwAr6gZGGQ4qGsOH00H69zY8UvAyIhXjR8oshF
         E3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCX/SnRbqJihxMhh+EIQaceyGsHVTDFtP/zBk+jZbq9piDfdxDEnKGjB2L/M7kM3Q7kHiNFDDZofBdfQ1+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLR8ERysdAVMJv+Z34Oc1XQgpjyP59/tWQV6rjb9u8T6kfpL9C
	KgINopsOXFIuw9ToQSnkQARKrY4FLw0yLra2aCTavJcDV5LL7yI7I5cwyBc2+mM=
X-Gm-Gg: ASbGncvOBtsMECp6DHnwshx6MC54LElzlJLppCdDPMJjgeiFqLyOUmo13swrPR8aKpb
	DHX8T0gVRxMXKL/Sv19VgR5ADYPv43DPQ91ZWWPY3Ll6rBiZWeyP3Gh+Fxx2fnftkbE1YmbI1V/
	7oUHnbMnWih/vAEjfbC56oxAaIONL3qt7trHllqFivSbIdKB8NsmEnutTOmep/F6oQlUrxeLDCi
	Doo0iL2RGQhOc7h0ZdINEIArtAqPMCG6r+3XFZntGOwODQgEfWpEErJpe9mXN1udZx+kmWUqCxI
	YupC7aP+kbkqqlvWXw==
X-Google-Smtp-Source: AGHT+IG+GWLav9UJfqyQ68A1jcf3lhjRtJkvLA7MYkbHl336IPSn8Kmidgk/a94noG0INXD1mHf3Mw==
X-Received: by 2002:a17:902:ea0d:b0:21d:dae6:d956 with SMTP id d9443c01a7336-21f4e6e1eb8mr44938405ad.24.1738924994072;
        Fri, 07 Feb 2025 02:43:14 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653c997sm27289215ad.78.2025.02.07.02.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 02:43:13 -0800 (PST)
Date: Fri, 7 Feb 2025 16:13:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nishanth Menon <nm@ti.com>, rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH V8 06/14] rust: Add bare minimal bindings for clk
 framework
Message-ID: <20250207104311.g2lexa75o26z6aox@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <c68081e18d939aefc7f6dac798df6b72e81bba4b.1738832118.git.viresh.kumar@linaro.org>
 <Z6ShsuLykigNscz8@pollux>
 <Z6SiiRubSXGInbgj@pollux>
 <0cd42d2d683ea057e6034978b02c7f84.sboyd@kernel.org>
 <Z6VBo51g54xAmelQ@cassiopeiae>
 <20250207092448.n5mzbt6lg6zqud4a@vireshk-i7>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207092448.n5mzbt6lg6zqud4a@vireshk-i7>

On 07-02-25, 14:54, Viresh Kumar wrote:
> On 07-02-25, 00:11, Danilo Krummrich wrote:
> > Guess this should be Opaque<bindings::clk>.
> 
> So it should be this now ?

Also, I should be using ARef and AlwaysRefCounted along with that ? I
am not sure if I can use those with the clk API. Yes, it is refcounted
but there is no direct way of incrementing the refcount unlike other
frameworks. clk_get() accepts a dev pointer and a char pointer,
whereas clk_put() accepts the clk pointer itself.

-- 
viresh
