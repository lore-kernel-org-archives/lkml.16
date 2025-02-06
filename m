Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F02417C0;
	Thu,  6 Feb 2025 23:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738883064; cv=none; b=YA0+teIiOhMWpz3G7BKLaXXCDlC2hX6gjRSCrXrl6ZAW7VYlvjQnIfyDJjKdm4GpU8Amgu2+Zy2dLls6TZF7sbsYscx3UPYok5deNEjP0R4KzNCjn3CmZDsT9+tZGV+9VVhsvmsqqPPNEVCB8go2VjlAW08z7RU8n4Dob4XPu+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738883064; c=relaxed/simple;
	bh=iBtB6JI2lz1ERyGxr5ZtaOhOiAw0om3qtR+nP/sprHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rB+qakdyJqELoTTevp6RIjStwzTsGruh3akTjkM6XMbHfxgnCdLov/Y8YXrRN3MlnNOV5xYnJIzSEMysl69oB7cd1fGLWrgLanuccTjtb0yrNzjWiqPW1YKO6THNNWaDaZDMfEsr/buOWH0OvQNDteWdxpshbBMlhGmgK9MG0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X3uqsRJ/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X3uqsRJ/"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f3826e88cso2535105ad.0;
        Thu, 06 Feb 2025 15:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738883062; x=1739487862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBtB6JI2lz1ERyGxr5ZtaOhOiAw0om3qtR+nP/sprHw=;
        b=X3uqsRJ/RJ1pEHku1UIbQK+BQFIUedXCfFaq88VJma2Rn71PEv7tgB7OJZp6WFXzby
         Avtun7SnWQjSnk72a7iQOkJkcXDeWBt40OWJmbR27YIepEitxN9Qf0CAyAlIkMbmhcnM
         i5979soJ9psg+pW4cD78mgkFceZ5f8U92/imTUUh6lnE40aj43KRmtZp89W5SPLqpv6l
         U9oyLzLFKMX9HyRQkmQcCDDWWctsWB2EfS19vDj7Vd7LubTbS03FSYK/eiMGF1qtQYrw
         5ntCjYPIBwyZaKqKzsm+dCfvZyMic0LoM5YljFbhAvYuTMggs61azMkFmPya4zjfRA8Q
         DUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738883062; x=1739487862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBtB6JI2lz1ERyGxr5ZtaOhOiAw0om3qtR+nP/sprHw=;
        b=lo6ED6itJ0BQ2ioYC2Oe2otp14vJ9WKchHEolWg7YyexVVIWXs8cgbbNaEa25pYMzs
         W5Kr0MRAJimsqHSt7JDP9KSP41IYRMz1Znz/ZtAj7Ti8XZe+nb7E4CqL4HIe5G3TSXGv
         9FWC/m+xZ1rM19w+z4f2JKelmB7Su23aUAW4SODi6+OnsCxgUn4YQoePD/bvumZu99hB
         NHvneAvkkb9+NUMemjAp7YQvJsSXt7hw4sw4+S3rxDaLlefLN6oPZeCkX8nVwSmsHX5B
         HZszIoHUwOP9Ll9us2IP/xFjstiVYvIGrnbOvhNQOCF3C6FGNVfw+zV0swceDqUI6AV0
         04hg==
X-Forwarded-Encrypted: i=1; AJvYcCVu1neXI0tPtnfHlN7YR1fOwKmpboRlh30b7Q8+rmmF/ngb1qF5Q8dX3tAT7P9nISiptQusyB62quUvYHY=@vger.kernel.org, AJvYcCXRMoTUoWa2KycVgLGgNw79XW5j9e0/w1UUjXMhdHkPkD8krxnxKFV/ycZzhxG4EtwZRav81dxWXEOTHkrXMVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHYdLGLN1SgMVXPpRXmu5B/f3Fvt2/Pf0ewAmfnSmHpoTl62Na
	sFbcXvC/kuyrFxyh4RENNC80LVqgtYdZ1iovKXHZQeH9dYSaLth+BD5bvSIkIHQ048LqbnU+Hvk
	te3yZsdo5kNRhrNYb9NtpVboa9eT/WYgI1ls=
X-Gm-Gg: ASbGncuh0r7h8CDI5cOsS04yrBgbSNmbXeagcVlZOr47h8SvZKjCGMa3gCn6026R//1
	lXzZklmFIVyhsHjXZXInxkrm2MHScD9iUBsuxSchyOuvyeOHIjLz8I45VE8+x5TuQYXc72S/r
X-Google-Smtp-Source: AGHT+IEkTD8jnc5bH4yOSu4S2an4EBqK9ewNtitehbuSOu38DMq277gL/fmeBGASz+lsESeyb/y8xZfbBI4ywFkwt10=
X-Received: by 2002:a17:902:e802:b0:21f:519:6bc6 with SMTP id
 d9443c01a7336-21f4e7815a2mr5542065ad.9.1738883061822; Thu, 06 Feb 2025
 15:04:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
In-Reply-To: <20250122-gendwarfksyms-kasan-rust-v1-1-5ee5658f4fb6@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Feb 2025 00:04:08 +0100
X-Gm-Features: AWEUYZk9y-OR9JGM9ihU0hTUMk5o3XqxK-a92o0Pw6NahA4vkk2pnC5Fk1pwTvg
Message-ID: <CANiq72nhNUFUs50am+EebWJVgTg8X5HzPF=uiusuy6-8gsSKNQ@mail.gmail.com>
Subject: Re: [PATCH] rust: Do not export generated KASAN ODR symbols
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 1:14=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> ASAN generates sppecial synthetic symbols to help check for ODR
> violations. These synthetic symbols lack debug information, so
> gendwarfksyms emits warnings when processing them. No code should ever
> have a dependency on these symbols, so we should not be exporting them,
> just like the __cfi symbols.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Applied to `rust-fixes` -- thanks everyone!

[ Fixed typo in commit message. Slightly reworded title. - Miguel ]

Cheers,
Miguel
