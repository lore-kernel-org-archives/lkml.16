Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2088633F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749401891; cv=none; b=HltGD5sGMD4FgoHl2mUFGmPH9sPYrVWMwSX9x/ulYlJykkbGvp43ft6f8wrSZfcDSJ6tOyAg+Zm2t7FFKl5Y1HUFCd5P+OoyNHpBBa7lg0SNQA0Tfvsz1fL37YiUR9um1GT7vfDS17kkctdrLsIEPoM1YARxfef3vgcin9U07yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749401891; c=relaxed/simple;
	bh=u4wQyLjJp+430rQ0oMLZAAtB4ucOgT4UzH6dUPzhvIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQvUvUBHA85CTx1HwrhXqQYWaczAyYNgkRSbFG1D0/UTBjBCDm/CuyX0c3N8zYpOLIKeFtyP3qZkmLhdVxtTwOl8o+JHV0uYj1baLV5TOLNSkcPSo/kZKkncfsO6mKQs1XyVvQvAxtXaseGs7ejXJQcrx/ab7BL6RoctDgJ3Iys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com; spf=none smtp.mailfrom=pdp7.com; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=ubv0t9Ts; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pdp7.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="ubv0t9Ts"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235f9ea8d08so26896225ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1749401889; x=1750006689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nuldK7MCvX30cQFzWuI0PzalznhEarc6NW9MP8uHyXE=;
        b=ubv0t9TsGF7bJ5L5UAGBLT7VVfzMwkPEMnxeVbIs7hUxjNkeyvA/nXZHIGBSWR1QXW
         RrpuBIdAVpulaKdt663KHjNI0k8k1x23mLTWtyZvk503HnaUsyIG4BNvdjSxKiuGixaY
         zhFy+sPmiCDbmZTU3qZmxIVHs5ULE29mroS/N8nc3fp80eZfwnnRxEnIe+rpAh1xyhUj
         OqIKuO1Iigagd7Ikd0LfyHYGORKNCFUjubUeMPyzjBwwrNyTT8aHn7EG5axb2LpnFwmN
         Rz4/0CKTeICF2HsIWcMzd8Ekpp13T5JmT3e9otw6k6j23UuPBY9ctO6yYzyjaYC5ayWh
         qnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749401889; x=1750006689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuldK7MCvX30cQFzWuI0PzalznhEarc6NW9MP8uHyXE=;
        b=Y376duKFnQLQMT8zA/A2c7/fTt10n/cSg3pP/WWRsysCwt+TGDXUIS7VHGRDs3WDCw
         CObtv4FnhZD8jlOywx7clj99m0q8hvPNe82jQYgwubYqVl5rjMZowk8Get8bfSlJlV5f
         QL9cI5nsW/huElRngilrYb9CpIHi2ai08x4mLOu0lXIlZ/C8yX+yVIsuPqk4l91LdReG
         Hfn/wJcsIb/wDrJ07YmNs6V2jOnb5N3OqRQZ/pb8rUK0hTuCvBLxMKVH0vJavypMINAP
         qTloTc5L56xnBKYM/mVgWYpbedEyaHWE428tJCMEki5001frnKNSyIcgYu8OWSygTwO+
         dxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVc5MK+ZDGiKsSIyfPO/JzDwhiTPRvgyNM8+vlBQIE03OD1T2/8y02Bbvl6iZUU0GCwcxRQS4tzmzaYAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXnHPJnpQZKEmqCZrbvI7+iJneTbE0p0VB/maahA2roGhRH8Lz
	Ie9v4idsxND8rrKdkemr6MqQYwq+0/xXYld+bUgmYg4jxI7XNM7rzMQMqG6PHTSRCGw=
X-Gm-Gg: ASbGncsURdsM9r3q5uKmTutZ/HOns/Nz+eSJOIeS6wqPgG0OoYZfID6atTe++N8h9Tu
	BLPAAYmPkmP1u3ysZuaScsaTuNlw8jhLT8AAJZWMrOEsxxyNEFZy7VypkqRWRhFogZmoC4XWmMP
	DOcwQZWPw3i0t/dL2MJLfJmlCpRovsy5lQgfl/HI0TuB2zcSpYYAD26dYuRRGYGuq8P7thYN2ma
	zATLpyuY7+4+V+/lz3+K/qlqL1zAPY/+oosbsQTopdmUcaj/lctY0iLEaruvkFY1XKmuHfP5itu
	zS3FnG+/uw2uu4oGVQxyznX5HPLqJ5sEDnPKyRGxyPgNWfabymRTgg==
X-Google-Smtp-Source: AGHT+IHP9TwOiQS18SeLvT6WZ+KAoJi7YVDOIp4T0wyLfQJcuq/fKfkoNHs572ijakJZtNeFSPJvBA==
X-Received: by 2002:a17:902:cf01:b0:234:ef42:5d6d with SMTP id d9443c01a7336-23601e78185mr142424575ad.23.1749401889406;
        Sun, 08 Jun 2025 09:58:09 -0700 (PDT)
Received: from x1 ([97.120.245.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056f8sm40902275ad.161.2025.06.08.09.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:58:08 -0700 (PDT)
Date: Sun, 8 Jun 2025 09:58:07 -0700
From: Drew Fustini <drew@pdp7.com>
To: Benno Lossin <lossin@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 0/6] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <aEXBH5r05FkTxpV+@x1>
References: <CGME20250524211519eucas1p218997c69b98b14d3af2eb6bf4e9d3187@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <aDJGgLZ9tITwGBxq@x1>
 <b5f4af17-05ef-453d-8f04-283590ae5b87@samsung.com>
 <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA5YY0YF28GO.3DONTQDLY6VBD@kernel.org>

On Mon, May 26, 2025 at 11:01:58AM +0200, Benno Lossin wrote:
> On Mon May 26, 2025 at 10:22 AM CEST, Michal Wilczynski wrote:
> > On 5/25/25 00:21, Drew Fustini wrote:
> >> Thanks for the patch series. It will be great to have PWM working
> >> upstream.
> >> 
> >> I've not built Linux with Rust before, so I'm going through the quick
> >> start [1]. I've also never built Linux with LLVM before but clang seems
> >> like the best compiler to use for Rust. Are you using LLVM?
> >
> > Hi Drew,
> > You're correct, Clang is the way to go for Rust in the kernel. I also
> > followed the official quick start guide. To answer your question
> > directly: yes, I'm using LLVM.
> 
> Just to let you know, there is an effort to get rustc to work with a gcc
> backend rustc_gcc_codegen [1]. And there also is the gccrs project [2]
> trying to create a gnu Rust compiler.
> 
> [1]: https://rust-for-linux.com/rustc_codegen_gcc
> [2]: https://rust-for-linux.com/gccrs
> 
> They have made a lot of progress over the last year, so we're hopeful
> that they become usable in the near future. But for the moment,
> Clang/LLVM is the way to go.
> 
> Hope this helps!
> 
> ---
> Cheers,
> Benno

Thanks for letting me know about gccrs.

I was able to build linux okay with clang:

make LLVM=1 ARCH=riscv -j16

It booted okay on the lpi4a:

Linux version 6.15.0-next-20250606 (pdp7@thelio) (Ubuntu clang version 18.1.3 (1ubuntu1), Ubuntu LLD 18.1.3) 

I installed rust with:

 rustup default beta
 rustup component add rust-src

 $ make LLVM=1 rustavailable
 ***
 *** Rust bindings generator 'bindgen' versions 0.66.0 and 0.66.1 may not
 *** work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2567),
 *** unless patched (like Debian's).
 ***   Your version:     0.66.1
 ***
 ***
 *** Please see Documentation/rust/quick-start.rst for details
 *** on how to set up the Rust support.
 ***
 Rust is available!

I'm not sure if that bindgen warning matters?

Thanks,
Drew
