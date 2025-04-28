Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F3925DCE9
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745832978; cv=none; b=XAysZiDt2o7zwI2u3awN0qQbpXnFD6rttGKbca9rGd/G1mtH6M96pclyYzKOJzrqKPwnpOfkrbJw2v29/wdROSQpvH+66hozBx0WVn+CzpPAVsufDXVrCUU21h3pKDpSvaHzXH/Nwn2/90dRIy3lLdGsWr3zHmEzd2+4tBOWSzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745832978; c=relaxed/simple;
	bh=QrE7fbdPli9SKQ7LSp5vAGsR4n+1mUUek8BtKoV1gOk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oFvFDz/hYQzcHn/ZRqdNzY6Xsh6xzxYfFIaCGm7ZXHbPJLuPZw/ttaLIS9vwMKAMlCQfWpw79N+nKeF+lQdYSH8JZ6j7/2g7e5xmnWG5ZvQ4FiZVFWuYqsopZs5AafYIj05wA6UmV+4Wb0vJijtI9vzdl+PX7g8D6FwtZDFkxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TFMB2ye5; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TFMB2ye5"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5f6c497a1d4so3127299a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745832975; x=1746437775; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWAe0DpMWspoRIXx1Yu+oQIZJ2WPSmFvo5OnlJZNZxU=;
        b=TFMB2ye5bLr8WrqT0xjY9+gyVrrxwCalsI7mg0kWTbqvn6PdvMH+Xw+uKxOJKRX05x
         FEjsyoB1p4u0mEZ9Wal/DRrxWobKNuadqwGGWWAoJ3P+dhBZyOvcZf8Zo1//U++dRton
         vIBIWTNDoX+zJR6v4hOLw/2+xEc+UsdgFFeDu3H5SPuzfv70zod9pjY03OOSN+KSP3ho
         TZTIorV2Pg6gV+zVWpCps4WkI3UEXm1NwvdC0e9UnnGi6d5lENDKHojNabkjpHDvEwSB
         KbyJpKUZlrY/d3nLTn9Glq6ZkKAWhdsUka3Vu/bLU0x5Ns2Z/rBW48A5W1J1KYyPrzhA
         B1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745832975; x=1746437775;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PWAe0DpMWspoRIXx1Yu+oQIZJ2WPSmFvo5OnlJZNZxU=;
        b=DgS45KDiyZ3v0/kYHKH4DR9ij920ebegep/gcD67qnIKvqyGNF2B0zAKeABN9IMDg1
         RSa3qc44Uc4cxc9njBvW6bzNJW+V0LBMQVk8GLegaCJCGBlPZH4kyNkSV5BPq0B3RM0m
         mifH0U0vbjodVCPUPTVr4OcrHgTGEYpcbOfttfBepcJJphRfd1LkUbU/XOAFmFcAPiZa
         CJSq8IY2nu3XhXj3+e1uyFfmtBvSRJ8L/Ieshb2LJiEIlrym0MSAlDLqqgGowylUMNHZ
         MIY5fZpeQJOnDk6NoojsNdsvQlYYpcIV6hEmggvVtar7lS7yHKWsgljOPctRWrf6Dzxn
         Lb3g==
X-Forwarded-Encrypted: i=1; AJvYcCXp9f38LcTIYzcVoNpsdNHudnHq8v9RgNiIlMnHZHUrPAeRM8Hs+Rz6Wuxtl1l466uvdr1ZElVvbXnv/8A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd2EKJ3BCNgFN230tLZJxmdeaOF4yFvE+Rs2bMSGWE0griwqrg
	ebKe7P2TRHMj9lHLSlgqebuwFdGT64zY0JTXEKPhshafi5Lf5lGuEHypey2HcyoK26yXiqSWZrI
	fHI2HYmYEMdfo6w==
X-Google-Smtp-Source: AGHT+IHplcktsjFpEkx0kJSke323IXxxZpJrFWNgrknRo91sDGgdD3KjeRRPvWTtUdIpYScMC0mHYrCnSy+GAeo=
X-Received: from edbet9.prod.google.com ([2002:a05:6402:3789:b0:5f7:ebf1:2da])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2749:b0:5f8:30c2:8652 with SMTP id 4fb4d7f45d1cf-5f830c28831mr78672a12.7.1745832975374;
 Mon, 28 Apr 2025 02:36:15 -0700 (PDT)
Date: Mon, 28 Apr 2025 09:36:12 +0000
In-Reply-To: <CACQBu=VkFT5yDuDz098L+S+tGvtGHMvm4FaZ6p3sr9VCp88jww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <20250423134344.3888205-6-bqe@google.com>
 <aAkbw0jEp_IGzvgB@yury> <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
 <680a6b54.d40a0220.27afd9.5e84@mx.google.com> <680abbce.050a0220.144721.78ac@mx.google.com>
 <CACQBu=VEATxHmFvt0TKbb+Hx5jeEGO8SL733=0m8LNnX6S+ZKw@mail.gmail.com>
 <aAuR_0om4FI5Pb_F@Mac.home> <CACQBu=VkFT5yDuDz098L+S+tGvtGHMvm4FaZ6p3sr9VCp88jww@mail.gmail.com>
Message-ID: <aA9MDH8RjOH9hQ2E@google.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
From: Alice Ryhl <aliceryhl@google.com>
To: Burak Emir <bqe@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rong Xu <xur@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 06:17:59PM +0200, Burak Emir wrote:
> On Fri, Apr 25, 2025 at 3:45=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com>=
 wrote:
> >
> > On Fri, Apr 25, 2025 at 02:20:13PM +0200, Burak Emir wrote:
> > > On Fri, Apr 25, 2025 at 12:31=E2=80=AFAM Boqun Feng <boqun.feng@gmail=
.com> wrote:
> > > >
> > > > On Thu, Apr 24, 2025 at 09:48:17AM -0700, Boqun Feng wrote:
> > > > > On Thu, Apr 24, 2025 at 06:45:33PM +0200, Burak Emir wrote:
> > > > > > On Wed, Apr 23, 2025 at 6:56=E2=80=AFPM Yury Norov <yury.norov@=
gmail.com> wrote:
> > > > > > > So? Can you show your numbers?
> > > > > >
> > > > > > For now, I only have numbers that may not be very interesting:
> > > > > >
> > > > > > - for find_next_bit,  find_next_zero_bit and find_next_zero_bit=
 (sparse):
> > > > > >   22 ns/iteration in C, 32 ns/iteration in Rust.
> > > > > >
> > > > > > - for sparse find_next_bit (sparse):
> > > > > >   60 ns/iteration in C, 70 ns/iteration in Rust.
> > > > > >
> > > > > > This is a VM running nested in a VM. More importantly: the C he=
lper
> > > > > > method is not inlined.
> > > > > > So we are likely measuring the overhead (plus the extra bounds =
checking).
>=20
> Alice and I discussed that it may be better to do away with the extra
> bounds check.
> Micro benchmark, for the upcoming v8 that has the bounds check removed
> (and the test changed to >=3D, as requested):
>=20
> [] Start testing find_bit() with random-filled bitmap
> [] find_next_bit:                 3598165 ns, 164282 iterations
> [] find_next_zero_bit:            3626186 ns, 163399 iterations
> [] Start testing find_bit() with sparse bitmap
> [] find_next_bit:                   40865 ns,    656 iterations
> [] find_next_zero_bit:            7100039 ns, 327025 iterations
> [] find_bit_benchmark_rust_module: Start testing find_bit() Rust with
> random-filled bitmap
> [] find_bit_benchmark_rust_module: next_bit:
> 4572086 ns, 164112 iterations
> [] find_bit_benchmark_rust_module: next_zero_bit:
> 4582930 ns, 163569 iterations
> [] find_bit_benchmark_rust_module: Start testing find_bit() Rust with
> sparse bitmap
> [] find_bit_benchmark_rust_module: next_bit:
> 42622 ns,    655 iterations
> [] find_bit_benchmark_rust_module: next_zero_bit:
> 8835122 ns, 327026 iterations

By the way, if you add assert_eq!(bitmap.len(), BITMAP_LEN) before the
loop you may get the bounds checks optimized out.

Alice
