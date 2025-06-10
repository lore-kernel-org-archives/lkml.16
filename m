Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B038228641D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550789; cv=none; b=cHCtlYLjUfblDb5t0FdLEjrZIiFPhVfNeoYDVe1CPfc5Didh3BA2TsZyCTr/uI/BVbTMWdkzaP7mUjvMT2tHgttRe/2ZgbXCXSM+MX7g/edIxTVSbMgbnWI7aFFHZDc0iNmRnR4LxrdRmq28oR+TL3ccBplt5qQBjDIz8g0PEmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550789; c=relaxed/simple;
	bh=tvBkx1V6Rwddtyf/QRq84X1JFd2INDmjGqS3FddKsIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNuHhiVkipgTveFvjUvPJL4NU63SvrBhP7kc1iKjQ6sDj3yeNpTYe7aVbf2wtOth32+8D/eCt2ciCFL+p15wrSD0NV/sZE1ClbSwnnp+2K72DS6HidS4XxupUBzIV0/a0PyrDeC5TdAn8cCnRiNw5i6ll7CqQrqDUI4jbDc5PE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmqI1ImO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmqI1ImO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c27df0daso4732007b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749550787; x=1750155587; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UJPz0XWD6WvOykovhg+gFiPtmKizLqjMm2B20R5G94Y=;
        b=PmqI1ImOUHq9znuvWtsrlU/ooQm21k+BNiDmPvSmYMZ2EZAaw4caHyqmvu2ZSQ28fn
         S4waCRNCgz8Zc0Ee0y4UvxVuTS+3/+JOSYTLIdr56UHNH4XGiC8aXRArcVaT1URlV3zC
         h20OasudUiDMQLgs2pp81tGJj0iCMc4ETHwxy9u5H9rxX+rGDdDY0AxLGvwZ8mSW701I
         UOzwj8bZWGNx4V5RHKKWXMnTPLeIyg8533B7GmvCNzH+THJXzVZTrCXZr3Cl4/qAx5Dr
         prBM+uWZ0OQyUzscgxkwLWJqaMJQUjDthaeh+MwbnUHP92x7xUIDIse/XdzCqjGbvSNC
         ONIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550787; x=1750155587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJPz0XWD6WvOykovhg+gFiPtmKizLqjMm2B20R5G94Y=;
        b=in2xn7eXm+ELbx9JeBPWwy57j24A0/CG5k11Qk1AR/EMJc/Q7DZrZbR6a7nbsAS6si
         xjWI7Ivm/2Bsd8XW51bKYR7uPVdlsY0tdKq5AfIh003OI2AcVz3IC/ADPEodquYmpvCo
         d4CUAVJAQJKEs8USKsztjF60uMh7ihDW25i/H2NGwPhmGVtma4jZuVwMpLk7KVdm0PXp
         xSRb/tfjjIwYqkZ4Kn1YJ8gVxiVZ/wgEXsnS8jjVXtPOj9NYRyhuaebk0HyHR4FCGom2
         /Z4YQC2vliLS7Gwnut5aWp/QAGQbgA0zQEgvGYqfb83Ww6d7dLwFVqYi1e06TTPSo7W4
         Ifnw==
X-Forwarded-Encrypted: i=1; AJvYcCX6T6HzaUQtVsXIKwmT16KrBj4Ckz7bk0LoSqm5dC3tDss1efN4FHUXVLR2eT2aDiG3EZZ43bxvP6dSeYo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAYdMppXVTt1nQ1tpYQfAFDgX0n6i5HyufnwU/dZzo5jC8Vloa
	4xFqJnrcuQernjXqdUnrX9A8VmdEnVW/LPwx11aJRIjdeDx/aDUM7gtOYjSD+ePbZ24=
X-Gm-Gg: ASbGncsUeMGo/7YpchMzzIVkQMXemejcNGl2fgfnRCZ4oj21hdeCI+7EbmAIeYfFJFU
	HTDJBwbUjSCTe8G178en0B1RRVhFqyQdmrb0K+jJVMunaiGWNMPFuUMHW7kOG5GaZRZl+IJVWlK
	H3ftnIxoCskkIpUB/lfuznaPT8GBAf2O//htEoaKIsmZdwlnCWcBrYKmMWTC1l1u8HZai7GnGaL
	KAZK6XF7BfZx7XBGOTumZ1Y3fYBgXPFSwRbnSfPRTcyPnzzVlccdOEoNlaNpljK6LXRR1Ok/XPT
	sGeGPELGY2ICTA+PdZrWSSSDoyTT1aFqjBUCa8Q2b9aINy4qq523RDtYN32ZFCG+G++FSY12dQ=
	=
X-Google-Smtp-Source: AGHT+IFYOlILg9UO5nqmvH5/PpF3H8JRFgMp8pZmn2v6F5sjYFCIkxw/7rfloitzttQafgfaZNLyAg==
X-Received: by 2002:a05:6a20:7287:b0:21c:f3cf:6911 with SMTP id adf61e73a8af0-21f78c753c7mr4162006637.36.1749550787043;
        Tue, 10 Jun 2025 03:19:47 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0edb54sm7365444b3a.173.2025.06.10.03.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:19:46 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:49:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
Message-ID: <20250610101944.lqy6lberyy2aom2r@vireshk-i7>
References: <cover.1749463570.git.viresh.kumar@linaro.org>
 <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>

On 09-06-25, 14:01, Miguel Ojeda wrote:
> I can open one for the C FFI types if you think it should be
> changed.

Yes please (And I won't try to solve it this time :) ). Thanks.

-- 
viresh
