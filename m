Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5A423BFA3
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803846; cv=none; b=N8ZpyjUSh8NnrQ75ddhnEcpPWBk+An18SK0I3Um6o6vV9ZHO1xc9cTNYqd5HCOdMRi8hqTgMnNeBY9+lbpCex48cMLmLdvRcTBG3GgXc+TDsvuvTsDTrE5bCblHpgSyK81aW+ex/pg3FoJ4BdlDUwW4WNBTIFTCSmh5VU3Wm2KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803846; c=relaxed/simple;
	bh=nzizKzo8Lxv6uOeq/gTFpe0rr/Kc7xMWsK4wkv91jbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d5icdasaWZ0bXnaWc4pZ3deN5GTDVsvlVw/dMtGzHo73VVXRSMUAT0koEJH2g8OYM3MHbThY3JUH6Mn7jHfUB3NPbpZjsnzGKxtwLk7j6RJwQSlt2eixq7UbTTBTruSK+kA5s0B51PXbUqaM+GPi+GxFhlnROkThXnGrB/rlU30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2GbwSC+O; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2GbwSC+O"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39ee4b91d1cso298004f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744803842; x=1745408642; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IF1VZRpImns2dmxjUkl45LwCr5OCxkT/CnkwYELAXFU=;
        b=2GbwSC+O16ESoxOaJH6kp1bhKEsfD6AcpCa1MyAI7vc1b5/lsV1ZDd7/mg985q6oW4
         fJfMIu9wX3jCasVUicY769uo8whKZdJBvRrcWN1h8oCYL19/e1OWwfyFJp9ce7GsdXvg
         dRoeBOPa57uvhLTLpxAKWO4M/00vxFW+vvUtOWlE754ZuJHHm1vJH+FhWafHlVhszhcj
         iyTuBohWJ4bEiIONbAxMQt9YXTc9kCxXJMAe9tOLzCDIQ7ez2APOqdAfJETJcABEg9gH
         p8VrdXrXN3HAvy65cT7XB5J6G5QfUZQNdb+hTVjM7/cH3BaQ7hNG6gItO77plTQGsvye
         BcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803842; x=1745408642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IF1VZRpImns2dmxjUkl45LwCr5OCxkT/CnkwYELAXFU=;
        b=m64njK4OXB7OBjFPStkHGdN7JIDtQsw/YuKWYoGFxNVGftg20Tu3+nSEKb6+jyMsV6
         IGViN+lD5UY1kGNk/oNsRWr0edKQ28gAwpfSJJXGQOW1AhuPCPtMWZi85FJYOxwGXazD
         AAM75F8X/PCU5uIYyup2xjUQGIKbW2VbCTkiR1fAiGJohW6wVIL2VBANKumtkoNc1920
         fT6OS2F67TdJtdArmFBTJoviYNSP1igZwR/EV7TcXCu7SAPiK1DxHNf45m0XnUq8F2zv
         Z0y3jL5zgBxi/NLePaIdsP9EnxGJnr//292sv4VpFMw9grXlPj99AiM8Hu5aC/krhDRK
         QjCA==
X-Forwarded-Encrypted: i=1; AJvYcCUSafvcEE753wNGYQupVOHoTULToY02VZ2GDaozyaUzzda1z+BfTb5e/RCkgZ8AtcTWzjlIY1SfwIkzjtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuz6F8hzNevKGbAM9cgVs84S6vIftXnQBMTBN/2UI4DFas5QOG
	2vRxlASNDT58JE1is7Gs9pn191TyxAQGmlXw3LipK+WxO7QnltleLMbf1qb/yVVn/+Yu/sutWrC
	oAXIVnflrJrEmeg==
X-Google-Smtp-Source: AGHT+IGALYmOGR2cfumjQH5um+KLKgozzVHSRwGqMvv0DTT4qMGdsYU4qv0QGpbxElwdAz9dDJW4vlVIoSCEgsg=
X-Received: from wmcn28.prod.google.com ([2002:a05:600c:c0dc:b0:43c:fcfd:1ce5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5986:0:b0:39b:fa24:9523 with SMTP id ffacd0b85a97d-39ee5e9afedmr1224016f8f.7.1744803842192;
 Wed, 16 Apr 2025 04:44:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:44:00 +0000
In-Reply-To: <20250416112454.2503872-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416112454.2503872-1-ojeda@kernel.org>
Message-ID: <Z_-YAAzQVT8g4IY0@google.com>
Subject: Re: [PATCH] docs: rust: explain that `///` vs. `//` applies to
 private items too
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 16, 2025 at 01:24:54PM +0200, Miguel Ojeda wrote:
> Sometimes kernel developers use `//` for documenting private items,
> since those do not get rendered at the moment.
> 
> That is reasonable, but the intention behind `///` (and `//!`) vs. `//`
> is to convey the distinction between documentation and other kinds of
> comments, such as implementation details or TODOs.
> 
> It also increases consistency with the public items and thus e.g. allows
> to change visibility of an item with less changed involved.
> 
> It is not just useful for human readers, but also tooling. For instance,
> we may want to eventually generate documentation for private items
> (perhaps as a toggle in the HTML UI). On top of that, `rustdoc` lints
> as usual for those, too, so we may want to do it even if we do not use
> the result.
> 
> Thus document this explicitly.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72n_C7exSOMe5yf-7jKKnhSCv+a9QcD=OE2B_Q2UFBL3Xg@mail.gmail.com/
> Link: https://github.com/Rust-for-Linux/linux/issues/1157
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
