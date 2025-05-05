Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EDB1F582E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437038; cv=none; b=HVR8QfmNycSKwOeT3f8RWG8iUkodF3v8j+JCFlN1tqTVqcYDAI6kvsrZeUbrKkafGPceBal8cuFooN+nHKg6pQntOCSp3H+uyYASWWXUBBLXc5+zuFRRgMQwnH22kYpUJ378ZzRTGhpWEcZc0uWk9cv/XiNk+P0e1U9MlXVrkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437038; c=relaxed/simple;
	bh=2xxpj+2ReE48KbP5KJ11PgdY9Ly28L5Z4eGb6xFarec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ac6cuu6qswRAA/6U5B+JDuMnjjPGVYBERov0k/KW8ajolzZh2jkM+tBtzZzAlpu/nn7kSRItvilACpQ2jz2bobLIprTbdCcoScqDas2nZ91qHcbve2Dap9VX3X2KhdqlvcUpyu06IZa07Fq6ctr1TnJH1ZfgKTZ6MMh7dxcDHKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4FFtXfNH; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4FFtXfNH"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so18833515e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746437035; x=1747041835; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNKpSETC3aRoWs26slbmPYaRhZWnx/HOj+OMKwfNopA=;
        b=4FFtXfNHVOpQM7Jr4isrJSe+z+VDiBnIBysQtpsEP13Bs+QuNDDQ3nITnhu1f/p8NJ
         l/SE6uudP+jxg1nXQnETYPZdCnQ7ewTIqU4jbu0rm0jn6RMdy5oXSUb/Aw7r4L0rmP70
         kOv7A7mTXGxSLlkQTC2FUO4e8lswCGjgJ7iaddAe746FTRkKatN0oqi4yW5lx6dTEioE
         TO1cBJybvx9NNOtTAJPmp8ulcDNMtXcU2fobHRcnWc78BXpvcWvZM9z/KdpnzUUNfiGE
         HnrTEJ6qR7ADZvtPyVFpwj9Nk/0WdRQ0f0NfYNawWcKeAUmuZ4MqCU4bFv85+WEczNfc
         J4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746437035; x=1747041835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UNKpSETC3aRoWs26slbmPYaRhZWnx/HOj+OMKwfNopA=;
        b=aUcNeMAk7qDn1Jme4o52zMKYimKSME+N+8xwZdyJYjxF4lYk5gfld6+qX/avWFF+++
         /3b+1n7gulOoVxf0JH23KUdjOgPEL0XLcSDek8R2037sPwsRP3lNOcCxoORW+IP+RuDc
         LDjuiroCa6wEriBUgkRVRb78pDeGLyvGFQg3CQRvPZbtgwiuSzbvSHMR1uxnRAPOpYmB
         a7K25SsgZ55Xe2fQUd/dVe91xgqhg+Gy2Di0KKA2em0Kmmw7FXqzYYW9d0fbo25aJ9fI
         g2kM3KTIZ0KnwZVAsayNNZCJh2GWixy4p4ogW/UMCNuTIjdTsMpu8ehtGn1sdMKvh5MM
         NFZg==
X-Forwarded-Encrypted: i=1; AJvYcCXY2j115cdXJ92QUL7V1zp+hr6C2glvbQciPoEv6/rqU0DS3MLkpRPsI4anDXmlTqO5PJphWh4emVM/T64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIAJC7h6tF3RIeb1PjYGn/MHd9YutGxhY3TZgcZv5VSEUDLp02
	UnNsQsPgB17UH0wllaApBgPg3C1bTDMg3Bkjalp4sZWWZl8IAFz1FWnxPyk4d2hoyaNnSWYSpM8
	K7f83RW1sBaJeoQ==
X-Google-Smtp-Source: AGHT+IHD25Gl0hnIcuOchqaJj6jrQJy3Tcy1tSunT6kxPFMJLsXGIsx+DEdSlsV661NRNl3V8hAe7ZryPPG14R4=
X-Received: from wmbhh12.prod.google.com ([2002:a05:600c:530c:b0:441:b3fe:b95a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3548:b0:43c:e7ae:4bcf with SMTP id 5b1f17b1804b1-441c1c70782mr68477705e9.0.1746437035142;
 Mon, 05 May 2025 02:23:55 -0700 (PDT)
Date: Mon, 5 May 2025 09:23:53 +0000
In-Reply-To: <20250502140237.1659624-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502140237.1659624-1-ojeda@kernel.org>
Message-ID: <aBiDqQxAzTC4N-n-@google.com>
Subject: Re: [PATCH 0/5] Rust beta (1.87) and nightly (1.88) lint cleanups
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Fri, May 02, 2025 at 04:02:32PM +0200, Miguel Ojeda wrote:
> Now that Rust 1.87.0 is close to release, clean up the new lints that appeared.
> 
> It may be that one of the patches is not needed by the time it releases, but
> I prefer to not wait much longer since I would like to land this for -rc6 so
> that it is clean for release.
> 
> In addition, clean some nightly (1.88.0) ones too.
> 
> Miguel Ojeda (5):
>   objtool/rust: add one more `noreturn` Rust function for Rust 1.87.0
>   rust: clean Rust 1.87.0's `clippy::ptr_eq` lints
>   rust: clean Rust 1.88.0's `unnecessary_transmutes` lint
>   rust: clean Rust 1.88.0's warning about `clippy::disallowed_macros`
>     configuration
>   rust: clean Rust 1.88.0's `clippy::uninlined_format_args` lint

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
