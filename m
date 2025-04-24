Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC3D22D798
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745498555; cv=none; b=LixyEoVUeJhV6uQPz9+qNQfzNba6YepSAYnEN2p/zQa5fClq5Q5kHQO39jOD6tnKlS/gzfihFbh3HEJ9aTf8e2EWWpNbvcHdN0T6RJ9s0kpIW2hHo+4gXQpJD1TJdO9kMTyHuQmPiDklUgfW3C+962qsO4+IdBLzOpQilEpXLes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745498555; c=relaxed/simple;
	bh=bMUPawVVEjbF79zo+i8e/G9oQm/E1z7PfhxO6IAIp3Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FdGL8LgsHZ5N8Qa3Kr+9TRjMEIhWixD8pAqNeN2QSPBFmSwqHsLrdjW7Bemf40GbmuLaUU2x4D65w6lfodq8Tija75+ZdzFLgFo+Aae0hV15F17Gsk1Zy2s6KGcC4xd9fTpxcvSiQvo+QIunVC4Jp8oZbEJhe4tbcN8RVa8zbhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aAQEiS4/; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aAQEiS4/"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso5510605e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745498552; x=1746103352; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pkiVBLuG8XqT3hphgZF0hV/7DodmP7PFwnCD2xq7o9k=;
        b=aAQEiS4/66WQ/Gk8iEyEn6+lOn87aapjBmnCoDnkd2DsrknR/ULvUHEukMWnVorbbf
         gZtYJCDaf756HlFqVspMYAhyUYS5ICedzQvB7EZLBSEp/bFaT4i4jCG5fn7fydR8EVZj
         3p9DRxSBScf9DKmVokyPyOj/amkcI1c1NLvDCF268vgKo31r6rz/Bs5G7u/+WI/yRHHZ
         zavXdP595tkdB4vF3qSyOsE1MSEqUQqdVFYhZocjbgwX4QSJs406Yg74cmAbHoQFoLsP
         c4gcYqoWwqaLRzC9GaI6HYF2IfQ+q0fvkNrkgxrSloqWnQHs+7kDUKE81njrRH9ef2+H
         /tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498552; x=1746103352;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkiVBLuG8XqT3hphgZF0hV/7DodmP7PFwnCD2xq7o9k=;
        b=FuGas+vv2NtvGTvUpDDrUjwwMq0UkeV0sptO9xNUEgmu6S4bA74cKwPAUq19hH+tMy
         isk8mHISU4RB4eaLbLudUu2CyPBlghqSWwcaxCMTPyo50GnN9fj+jggXA1OTLgn2euZJ
         /cD9h+o+RC8a1AxyuMG22a9NgnlZmCQSeaEUUAcdGap8hLGArxM3kPyd8ac7GEykS7A8
         8LPp+5zBH3x60tTQECA+FsS2XGLjxaydQiiOwey/dMydiOPHhtWON5ZRKr0B8UaXHcWy
         TlLXE2RtWVKpcAdbIlOUqM+fRxr0u3191JGrBXefdo5Rqxqp7li044DNz34AaIAX8Uux
         rMgA==
X-Forwarded-Encrypted: i=1; AJvYcCVPni1FFvi1x2PKn9MLCwH/B5hHC7OMtwgflD+iEMdjj2RMnYtGJYVJebeiJtEwCXcRflHjyz0xCzU4Xzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YycxAmaDGBH9FE7CJ1ZFJRQ7oxrtSoahounDA5oTxNIbecYvg2j
	GBAmaLzu8RvJc0gx8yw66KH7mWkYL4fJxxtuN8BZ5BoObUrmVnbD5EJn4+xl5mO+jh8+3huxf9y
	vwBNhPAZzQN8/WA==
X-Google-Smtp-Source: AGHT+IHUeUoQ0ejG3/JHvwn7Rj1k7fCZD7HnZJ6v+sIjXJoqZ3Sw032FWqzu554ZEj2HUTDpr+mjqYHNg+k+EDY=
X-Received: from wmbdz10.prod.google.com ([2002:a05:600c:670a:b0:43c:f60a:4c59])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b09:b0:43c:eea9:f438 with SMTP id 5b1f17b1804b1-4409bd2f657mr21512285e9.15.1745498551878;
 Thu, 24 Apr 2025 05:42:31 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:42:29 +0000
In-Reply-To: <20250423134344.3888205-6-bqe@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423134344.3888205-2-bqe@google.com> <20250423134344.3888205-6-bqe@google.com>
Message-ID: <aAoxtUXWq4fdnt8F@google.com>
Subject: Re: [PATCH v7 4/5] rust: add find_bit_benchmark_rust module.
From: Alice Ryhl <aliceryhl@google.com>
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 23, 2025 at 01:43:36PM +0000, Burak Emir wrote:
> +    loop {
> +        cnt += 1;
> +        if let Some(index) = bitmap.next_bit(i) {

You can use a while let loop here ;)

Alice
