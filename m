Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE7D1D63EB
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920292; cv=none; b=i5Vxy2+IZYPzcdENs7abjnvpj1Fl7bevWefGfkuhsF/LZyP0sOEmffWzMZM8vsFeGhTWoi+Ngp+fJLyfocaqtSLbqBV5XZ9pF98oEr9IT2MQBHB9s4UmtohThMrc7gqRSLaU2BiyQtX4fhU27kRX7cHrFdspjw4KIRXI4lfOwbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920292; c=relaxed/simple;
	bh=Vq6CUwJXWYbkjDC7skgUbjbcr4p8ss61GgbWBNDKbAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTb9NdnJKFZXjLVVYm96meZVQrbU7ck+IUWbDl6K6f+3/P3GcN+gzstZS6OxKys+XRZkInwqpAA/9yz9yCFWITRxW3HD8WGAPlucK1eXnccEA+ZvHa9vdO4CkMZdaEwAGKtrLHf8cwew8rhX5PO+YioNvN60cLx2y6xO4qiiIPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CGFSBx+5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CGFSBx+5"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2fa345713a8so156964a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738920291; x=1739525091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jyMoNKIK2pZy7zQTX2COMHoUJUhrdblavVK+AecRfNk=;
        b=CGFSBx+5I8t/y3TaiqyYYmlUG0WUBraUnOiQMv8mgr9lfgbox2VpDJzti8IeJ9TCVT
         R0v60eltDn/zyC7gWqzrd1n6GruPdw7tDjunCAOnojL0LYxtr5b+nHEu1rvwroOVZjsk
         stUJkxBGfIgXP83vgT7PKBl0fhGREb/eZkT6e3858gu6N6Uq6esrSVeQ5vyf80oWins9
         gZqCwHqEv+ezDotyEiCu219rxHpg7sjcm+PebukDH+8iGP+d50lhBMTK1YMyMwRUd5Wh
         DVDu5quUfRvZdqexjV872ug2PHnSBZEj/Qum5iffo7SVQH2NP9RNgy6NfsBZ/u7BsphU
         lmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920291; x=1739525091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyMoNKIK2pZy7zQTX2COMHoUJUhrdblavVK+AecRfNk=;
        b=Whguhx5qZyyh/S4KYStRqh3K49l6cWUoshtDhtOu+DqWg/NXWADEGW/H3fq3TlHtzN
         2+og+RQsO/ENUECynfJcEec1A9lwu8huqymEF7cNA5AIQGulDE7dRVijDwJntxEGQ/5n
         h1y+uNjwlWZLaIHTLaseXWUKyOPJ+WrGPQeJsYA/bYD6vjNqUClVLyQQJv2uLwjlvUce
         jnnD95pcne0HN/E/aTJRFzY41veypwj+d/2ZnKhWe0y5KE19qVnYiGFkRDlTbeLkuS2l
         0OlqEjtVcAqr3PK3nSECLy+30EhxA/e5AY/ss/eMQCH/Hbn+aLtYWSfbofz3S7+2LsK1
         S+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCW5/fJVJk7Xmokp4XW/JvnVwlR/sPidugthN5TVCkBzIEYriaz+BLJjR7E08QXE+Mq4c8H9iMCpdUX0ROg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYnEfLEgpfcuFeSJue+CbGykmeiylZJSvx1fYLJyJQlSHmNTF2
	JZKUVHk6dmaNk6H3K6odqEwvSPTuRc7fDJQ/NsZPH51HcQoMuknuuHlL3tiPHxM=
X-Gm-Gg: ASbGncsGd4gk/8+CkFKTv0XqPDppY5VtbdCN58+ZwktuEeNQfvQjI7R9ZDTChUrKBPz
	yA0WV2/UZa6RYAS/tbq/Df5fp86faKo5QcVhB3IqjKKin9KtQCwN46HC4l5pncp5mAgBuCKxIqU
	tQXN35rLRLQaWwXqIXiFz6o6dhcMXyoX64qB8FehS6Y/FtzmCJnlj3TZ6J8z1Jc3RYxbYqvwgJX
	vDd5vSN3UXmd6TKa2kMk7lrk9BlezfI/AfwpZtRZi5hkWy8IkuHoMVHlcphqbPPNx3bjhfzwi9+
	nxp6EAYRY32x8ING9A==
X-Google-Smtp-Source: AGHT+IFEKR0JxuatWJ2AklG8UzCn4EcpeDD3hWFpQpf/pmwLI6IFCUWB6fjH3ryxFX3kwpn3v+ZUlQ==
X-Received: by 2002:a17:90b:3588:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2fa23f5703fmr4175215a91.7.1738920290813;
        Fri, 07 Feb 2025 01:24:50 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa099f4d6asm2891280a91.6.2025.02.07.01.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:24:50 -0800 (PST)
Date: Fri, 7 Feb 2025 14:54:48 +0530
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
Message-ID: <20250207092448.n5mzbt6lg6zqud4a@vireshk-i7>
References: <cover.1738832118.git.viresh.kumar@linaro.org>
 <c68081e18d939aefc7f6dac798df6b72e81bba4b.1738832118.git.viresh.kumar@linaro.org>
 <Z6ShsuLykigNscz8@pollux>
 <Z6SiiRubSXGInbgj@pollux>
 <0cd42d2d683ea057e6034978b02c7f84.sboyd@kernel.org>
 <Z6VBo51g54xAmelQ@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6VBo51g54xAmelQ@cassiopeiae>

On 07-02-25, 00:11, Danilo Krummrich wrote:
> On Thu, Feb 06, 2025 at 12:05:59PM -0800, Stephen Boyd wrote:
> > Quoting Danilo Krummrich (2025-02-06 03:52:41)
> > > On Thu, Feb 06, 2025 at 12:49:14PM +0100, Danilo Krummrich wrote:
> > > > On Thu, Feb 06, 2025 at 02:58:27PM +0530, Viresh Kumar wrote:

> > > > > +/// A simple implementation of `struct clk` from the C code.
> > > > > +#[repr(transparent)]
> > > > > +pub struct Clk(*mut bindings::clk);
> > > > 
> > > > Guess this should be Opaque<bindings::clk>.
> > > 
> > > Sorry, I meant NonNull<bindings::clk>.
> > 
> > NULL is a valid clk. It's like "don't care" in the common clk framework
> 
> Thanks for clarifying!

> Guess this should be Opaque<bindings::clk>.

So it should be this now ?

-- 
viresh
