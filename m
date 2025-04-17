Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063662066DD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874363; cv=none; b=Dkxdn+ICerBXNSyknAGH0Rs+th28UwM5KEZBZMU4oMfvKkaSJnOQd0FvuacyGyZ/A6c655AIneaatw8SST1pe7OTMNdLdLtglEUPQ+rhRU6PxZwV6alPN6CE1mddWQ5QNgBgOBFX7Kt8m2su3ocwBF4dCINlemLxxELE03yZ6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874363; c=relaxed/simple;
	bh=U4/vaUKN2Te2h7fsu377GWSWFLADA2axs/lRNpRR5No=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeIfOt56l1SuIbCqpjWC4mA7K54kZZTXYYjuT2Nc2db7qj40dsQt0ciQeAy8DTkuZtGEziuHBKzyVoIdvilCqcnjBSUpuF7mdGztL7SIz0y25/pmLg5pHuWsAqqDAu/1nLlsUeTOu3BOzO/y5Cpo2t3LQqL2XtcnV+Jes6GMv9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=ZD2y/sTu; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="ZD2y/sTu"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70576d2faa1so3378057b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744874360; x=1745479160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uw/gFd53a9BS00FfUSh4cAYjNxPAgA33lFveIhVyB4I=;
        b=ZD2y/sTuw1kXhGA8GgQXI7ZB7MCmGWc2BEnNvdho7r9nxiY4+eTdJkHHr4vouoILQ6
         KCXJYGHFhUNgKMvhxOzdoYvJIIePSOVQ1hvb/VRYWkteweOiA2e67KALUMju3sZs3hON
         7vWMqP/hU3mOk8znKB9yof1wSQgcGNVDcnzPqQ6niQ3ovICfgVSFlX7n+RYMuTdjUH5M
         eTLqqXwyHcMkaDlyYXF7m+R2uryRzoQVV80fCI+pZYLvpZIDoIHu0xx7LLLRKKn0qIPZ
         CNaPzI8RmLYvUT0FmrWBqIozIt6DrvNmjdeFyte0vgBgieGtXyEpArG34P5F83KPULC8
         M4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874360; x=1745479160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uw/gFd53a9BS00FfUSh4cAYjNxPAgA33lFveIhVyB4I=;
        b=nlPLZXA7s5mPb7nksu1LTDHyGyUAQ+ltR/N/7+YcmwPKOm6RBAshcTXjZrk2pITR9+
         8SGlGXueK40SiN1mNh/TDFH++5ikXdxZvmZ+rys8V0MiBe7LRFXlVzj2h2lSndyMsWVP
         5EbVSpRbGDQMT2Cz5o2t1M461M99B2qB6LdcttLAaJ4YroPXsjYq/UhaDg98vwwvY8V0
         WV/yxkX2ew26JCzRwjwhWDt1YsD3qc2l2BKLhKZp+McnsZgha+xjGIlhelkge+vAnnj/
         6uexFh6AFoR8aiBxGWSXzc4d0nE8AHhpxmoo4NPwf2CDDdppw90vM21DvYPS/QPBgiQ+
         vflQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY/Fj2vs48rgwMxCRHEgZrfriZwFAep8/5wfCSRSMOYE4tHSMMZuO8hRW1KxzFHlTRDEGWzFABy9Qar9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxorPYKAQcQSx5sM49XJMJIApCwYGQmE3prbuDBOPAVeSZdpVtP
	N6w0Rh80XtQXfRjD6+mDXH1gX5iNlwUjmTBslU0kpfyXDD2DUDVhjH/ao/OLYlx3ee0n4ECxYYM
	qW4cWjXuqlge5/S3IbZ0tSFfLAknWWArZi5eJBg==
X-Gm-Gg: ASbGncsrTO8Dv5U3OYIhMDXcxae199AiUKKD1aKAfeiPA97i9IQ0fDhel2Y6Atvgjkr
	XTVCRtovbPU/HYp2C29kZphkKyf6xc5Q8RyyeeTG+0Y/mhWcQyzsd2UMMAFFaBdfzJf+38kovvx
	7MYSGsXSsjD3Nxg9wjGnImRw==
X-Google-Smtp-Source: AGHT+IEXB6D89bWHNnoXFbnwrhIOjGGlhII4xSrRflgd9ac9ibMg9LchRCS2RzJyKlWy86S3cu4WFYghsKhj3BzJt+s=
X-Received: by 2002:a05:6902:2b92:b0:e5d:c11c:3494 with SMTP id
 3f1490d57ef6-e7275f1774cmr5305566276.30.1744874360020; Thu, 17 Apr 2025
 00:19:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-10-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-10-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 02:19:08 -0500
X-Gm-Features: ATxdqUFTdUlY5hT2E0MA0TIp6LfUHIWhb6GFzQWkdokya3jjzXX_XuCczpM3MSI
Message-ID: <CALNs47tQi2UoFNiU7hTa-fPGwoQ0HN_SJG4HJ-rjoes9XE7-kw@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] scripts: generate_rust_analyzer.py: define host crates
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:07=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Define host crates used by the `macros` crate separately from target
> crates, now that we can uniquely identify crates with the same name.
>
> This avoids rust-analyzer thinking the host `core` crate has our target
> configs applied to it.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/all/CANiq72mw83RmLYeFFoJW6mUUygoyiA_f1ievSC=
2pmBESsQew+w@mail.gmail.com/
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
