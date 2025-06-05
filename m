Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5143BA2E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 04:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749097139; cv=none; b=rEq46qPPfyUNz+9j7Yhuvc+LfZEFpEm1ETbxwF+6m8EtmkFnfJ+xa2VZLOSKN+Jz5lsGChiaxOLZqOF47lQjWF17iYO1Q15EQuFzLaWsj5A88cnI/heOnDyrG+VwhuUkL3vZCpUEiVs+noVhWbO6/dViKgYFCbOVFhWM0AFc9LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749097139; c=relaxed/simple;
	bh=bx2Kj9sSofrF7t7EIXeCJJOaXbVRllv9Bpb6i+w+zdY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JM913OQAsgcrbbubLPceoHVWIsOFK9i7tdiIzXe7rBowUSk2DNWN05HRgoLBgPmlXNEQE2MxRbrK71zxbhCxzTeN0gtpqUKSIemplpmL/Iy9TdPaFp3knvBdbdOgUAQYJ6sqbyBbC40YWWt2AVhcQk7tYRzO1SCmecbYAAymenw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dBcnWden; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dBcnWden"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad51ba0af48so321102266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 21:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749097135; x=1749701935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F9yo9o38fJyHqRjj2p+pl4O+P1rBusXLank2hy0x8o4=;
        b=dBcnWdennxuXI4+es2MhkeZ1KrYrJwZ0E0/nqvkbspddH0dhXGQFrZkP22X5Vx3sgL
         1EWIKE5nRqZZjjPwiq9c5fAnTOcDAL+kKz6ePth3e6z23j3x2kpPbHR9k/KJDRd8bnZ0
         ISMvV680JAvbQtdtx1OV7ghM2KRXFv8pSsZOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749097135; x=1749701935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9yo9o38fJyHqRjj2p+pl4O+P1rBusXLank2hy0x8o4=;
        b=HL0aJYzLZ7pZ6CPQVj9XaDEvA8ksxarB02RIrhFGNG05wWSFcbuGJCDHlYWVmBdu+h
         kDJJZ0l/zp5sBRQp2grtDAlzM/kchNEp3FC3oA9cXjq71WuIUtn6/l/1ys//FilGgJAQ
         va5HW3bv6Qp5sNLfG2w1OhESOWvy5xjJ7DDRMCTEBsSAGpN+Hz1w5WeF5B9fdtyk/0p9
         UyXcD/jhbYuxmEXj0AC+mD9vlUsW5b0m4w9t653vyOTJeJtqqfvHhvATqY1s6ny3TNlL
         hK11PxV9KJ/00ke/AbED64lCa0iR3kXl1YZ60IjdUY5Aw3xTSlQXoWBACsooecG+2F67
         oUlw==
X-Forwarded-Encrypted: i=1; AJvYcCWrxPuk+t1c1RI0Fp/vF1ty6AOYFZIMajkopulzeWYnLMjYg1GK8tok145N+tr8PcCa76xNLdTOseYPAkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWXZVKK1tFaG+hViRyBaYaeo2/r1SBH/ynBRve/eK4w8Lnq4Wh
	J+anCJEI0U3cxt+/x6d36teX0CNvb9SZoZ2VuDdFYVo2x319TvBd8wmb0UHWlbCP5OuhJoeK1d1
	4FQMZmFA=
X-Gm-Gg: ASbGnctzyENU4g2a4bhgZkmVYz3lzFKpRG5QFC+JgxDCUe+xAwsG0YTbRJODZ9X6tyw
	9XLDQIsRvZh3vncRwpZwyMVWE8Jr39xRiyiX06/04Yv/TQSJFFEyqip+IybxNusxhQGnfuM5cfX
	SlRmrcXoYkd6EMJUjeaqwPYdt6gDCh6UtZU1Xc9DaXE2N0EIFjJXNNiPTn9iNZrBPYFSy8kM2iG
	Mlv+qHCPuycFoV0ME7Yzovw9/6/I5Xw0I9TbllJrauIUZVOa41Vdjk+DnW+6t/wbVNbwSieKG4r
	jBG2k7BkYqbyIv0v4QmbiVWsnfGmap2Y7/miupznEf5I1P3pE69uhElqkPiJ4ZBT+QkEWgl9Wxj
	7QlwbXtTRGYfpqXMqRz8TR42K9A==
X-Google-Smtp-Source: AGHT+IFi+1zv93n7HJf8nNtmuoYS6+5Y/WxoPynsyLAiu4+w/FoX0+9aTPNQAwBgUkd1vqf0SjpwTA==
X-Received: by 2002:a17:907:3fa3:b0:ace:d587:2f3b with SMTP id a640c23a62f3a-ade0787bd4dmr156716666b.22.1749097134951;
        Wed, 04 Jun 2025 21:18:54 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fef88sm1195746766b.35.2025.06.04.21.18.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 21:18:53 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d35dso1281153a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 21:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUnnp6iW++fUx2as98+Qhl34zSOIpImnPGq1znGEznsRmH19JCnOtzScN22x66V+F2X/3LglIK5R3sOJiA=@vger.kernel.org
X-Received: by 2002:a05:6402:50cf:b0:601:470b:6d47 with SMTP id
 4fb4d7f45d1cf-60722629489mr1800092a12.1.1749097132977; Wed, 04 Jun 2025
 21:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605025400.244965-1-ojeda@kernel.org>
In-Reply-To: <20250605025400.244965-1-ojeda@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Jun 2025 21:18:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wik7gvxt-CEak_4HsGziRwo6-7q9LGeW37Pj9182dJ=ow@mail.gmail.com>
X-Gm-Features: AX0GCFtAvs9wozQ-rwI1G083uyw9H3jq8x4n8f2NRql_pfJMWPUvLEz1uBEkqq0
Message-ID: <CAHk-=wik7gvxt-CEak_4HsGziRwo6-7q9LGeW37Pj9182dJ=ow@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.16
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jun 2025 at 19:54, Miguel Ojeda <ojeda@kernel.org> wrote:
>
> There are a few conflicts, including semantic ones, but they are all
> easy to apply. The resolutions in the latest linux-next are fine; I also
> did a test merge -- please check either to catch the semantic ones

Hmm. I don't understand why the suggested merge adds those

        let self_ptr: *mut Opaque<bindings::drm_gem_object> = self_ptr.cast();

        let ptr: *mut Opaque<bindings::drm_gem_object> = obj.cast();

cases to rust/kernel/drm/gem/mod.rs, and it built cleanly for me
without those changes, but that may be because my build doesn't
trigger this.

But in the name of safety, and because I didn't understand that
change, I modified my merge to do what you did.

                 Linus
