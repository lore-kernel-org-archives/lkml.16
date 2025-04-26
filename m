Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C580D17E4;
	Sat, 26 Apr 2025 13:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745672631; cv=none; b=DuKMFQg7XS1FJz4lZp9eVwY59GHiLiVVw9ohq+K9hC5GniWL2YzvRliFDOUD5UVCcEywNPrFxmOVS8iPJNmJUzr6VwZjT9fplvOwZja9wuqYR7XQ7Wz4r1ZxPEM7x7xiK6EAw1Uwm0r9TUwP6PecWnkyZcbb+HVRZfTYJEeg1Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745672631; c=relaxed/simple;
	bh=LOv10ixA99uJUgAd+49HOus8BD8w55+P8EgHAuvPFAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaAr9A2O8Pax+ErUdCGmRAkII2tnxbuRYtfNRd5KzW8cn1AMARyn3Kf8Vvb6geVY/EpOKTTzH5R+w5cWvsY/wkh966nJmbx/SoOFtiAHH6YzyC4666DWumhl09o6YlBU/aF9VBdil5sZqruBov2YhIWM7LldLn0R/XBuSoD01fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqa9aMWo; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqa9aMWo"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-700b17551cdso26960287b3.0;
        Sat, 26 Apr 2025 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745672628; x=1746277428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pArXvD4SC+oounH0K1I0/IWv+qZfNWdtoZjyo3eQnoc=;
        b=aqa9aMWoizK/nOE3HgtBtnSaXwaGdrmWsC/QR6BVyI82PKLoLAtHfpLFbv2TF+/e1f
         C3DSzRHRs8HnYA6NUW3ASeIg27OtRAjf77xzHN52OB2kdcxt/sYJHLlnrGA+TpXaieTg
         ENx1+xPujji8nR+40Lm5AEZvHPwwyRsK+++1PxhOkTXgU6LcAZrNEEQ0zYLdsBOvIUE0
         6AWvwEmQzyQC/2BsFk8FNS1q0ppdNP8Fql6k7A7t+cbpF2SzWy8/E0UZqb8QJQt9TaAB
         HFvLquQBN+PUdpZX1cZOAGb41GRBRXlmYGZUvnXFt1rGMwb5FHFBgxiu8f0xKkfbvRrP
         OH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745672628; x=1746277428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pArXvD4SC+oounH0K1I0/IWv+qZfNWdtoZjyo3eQnoc=;
        b=VOMUaFMGgu9QX/XBUaVUDScRra67vq101bfQpvk+Y06ouzadmJfUdTSO5M/wTVvvPM
         Iv20H1x6bKFLYKr249nlinrnkgCL8kCPKzlKWRB0rK5MYZNlLg7eSyo5Wsbe5gn9zfqC
         pAxugaIVv1ZzY3g9t6AfkkWqqN4CeNG/Ori1H1GursorsSbxcSE3eDrgpimC7e23LGr1
         SrycNn0dN4eJ60myGnpqUD/orph+pSb+v2dsUO7wWwswIE2+lOz7y3s9lOiVFEt7oUqq
         FMRtydV/oZTwwvcjCiadrKTjE/+o6Ohwftl5T/2TKaV/Ent3opyjvyQDVTTYYtOH+CiA
         D9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWzW/GEmB3D8rs8d0QBSPRPZDWEs2p7pcyTbtvmqFKAr6cZ300bdwomMmxTI0hRKdVgiIXFTkCxsOCmORtiRg=@vger.kernel.org, AJvYcCV24Zo6MN6MQErMgkdSwZlOkl4bmWZ9zAKCdU/8gVTW2si9bqpCHl/YnP2xkj0r5I9jQV/3lxO2D17xDVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEL26s2hx+vSz+PlbYavW3YJTzbEsAUmG8pM18MRgsIsgQpJPf
	AH84HhbywxCcByj+Pr/tS1x8Ya45iv8FbnPyAYW7mt4dFDF5mqh7
X-Gm-Gg: ASbGncvV8jqbYpVEI8qlGiGxg2fo0dRPKqh5iJ5v9w/BitSbj+k5+X4JM+kjF9I3fsX
	Zge7b/QsgtlnBP/bb3mL/5UR+9VdupQQVvgmKH7JDuCdrUDjYNytq0L/YH8NKvKTUx0roqCS0en
	g8mxvMjHIbCgTdH1euboOTPhvm6n8ALGdFN/jLT3xV85kdoGfH44dLtiWRfwvP6Li8HwNvNsceY
	68HARnXcHifMqFm8UvbDbDGFPVIAjWRnUs6WyM2gPS3xkUThGW4GAkskT5SO65gd/QVXI+l/VQM
	kNO4aCVzDRGKkpEESDHh86fjgNbiLilnDzaCP5aBrCpoZ7N1/X6OoSv4KRm+2w/QXxqWj/mQPkf
	o
X-Google-Smtp-Source: AGHT+IEia9pgplrxoTS6AfxtvFCZPRIts8sdokrNoTW8XGGUsk4kNPdD0R7oJlEuwx5KccwJaBDVGA==
X-Received: by 2002:a05:690c:9a0c:b0:6fe:b701:6403 with SMTP id 00721157ae682-7085f178207mr49240757b3.11.1745672628523;
        Sat, 26 Apr 2025 06:03:48 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70841933581sm14197057b3.8.2025.04.26.06.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 06:03:47 -0700 (PDT)
Date: Sat, 26 Apr 2025 09:03:46 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Burak Emir <bqe@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rong Xu <xur@google.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
Message-ID: <aAzZsqK5Gm7aooys@yury>
References: <20250423134344.3888205-2-bqe@google.com>
 <20250423134344.3888205-6-bqe@google.com>
 <aAkbw0jEp_IGzvgB@yury>
 <CACQBu=XaOohewMnLj9PvgR5rYBxzYSXf2OAjCzUY=GFTJ9L=+Q@mail.gmail.com>
 <680a6b54.d40a0220.27afd9.5e84@mx.google.com>
 <680abbce.050a0220.144721.78ac@mx.google.com>
 <CACQBu=VEATxHmFvt0TKbb+Hx5jeEGO8SL733=0m8LNnX6S+ZKw@mail.gmail.com>
 <aAuR_0om4FI5Pb_F@Mac.home>
 <CACQBu=VkFT5yDuDz098L+S+tGvtGHMvm4FaZ6p3sr9VCp88jww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACQBu=VkFT5yDuDz098L+S+tGvtGHMvm4FaZ6p3sr9VCp88jww@mail.gmail.com>

On Fri, Apr 25, 2025 at 06:17:59PM +0200, Burak Emir wrote:
> On Fri, Apr 25, 2025 at 3:45 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > On Fri, Apr 25, 2025 at 02:20:13PM +0200, Burak Emir wrote:
> > > On Fri, Apr 25, 2025 at 12:31 AM Boqun Feng <boqun.feng@gmail.com> wrote:
> > > >
> > > > On Thu, Apr 24, 2025 at 09:48:17AM -0700, Boqun Feng wrote:
> > > > > On Thu, Apr 24, 2025 at 06:45:33PM +0200, Burak Emir wrote:
> > > > > > On Wed, Apr 23, 2025 at 6:56 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > > > > > So? Can you show your numbers?
> > > > > >
> > > > > > For now, I only have numbers that may not be very interesting:
> > > > > >
> > > > > > - for find_next_bit,  find_next_zero_bit and find_next_zero_bit (sparse):
> > > > > >   22 ns/iteration in C, 32 ns/iteration in Rust.
> > > > > >
> > > > > > - for sparse find_next_bit (sparse):
> > > > > >   60 ns/iteration in C, 70 ns/iteration in Rust.
> > > > > >
> > > > > > This is a VM running nested in a VM. More importantly: the C helper
> > > > > > method is not inlined.
> > > > > > So we are likely measuring the overhead (plus the extra bounds checking).
> 
> Alice and I discussed that it may be better to do away with the extra
> bounds check.
> Micro benchmark, for the upcoming v8 that has the bounds check removed
> (and the test changed to >=, as requested):
> 
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

So I'm lost. You're going to keep those hardenings, but show the
numbers without hardening on VM. Is that right?

Can you please show the numbers on bare-metal with the final
configuration?

Thanks,
Yury
