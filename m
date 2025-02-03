Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3AB1FBEB1
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573793; cv=none; b=fUnSZSwGzLxh4U41B6RD8IjrINkrPZzUkHI41QK2QcD5MkBEjA9tIGR5wTFtIJLZrHMRzWWDL2nBt0qxpmtwX6fgJPAkM5Nl3JFmqA+qze62EykJRUFKTE1xSuZH2lv93NjV42YN9zfBpbWi3AfiUSrT1/LiP0YN7kOuSgWJQ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573793; c=relaxed/simple;
	bh=UTDN9Mplud83THmiGowq87k8MSyDKm3YgJpc64T4AGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plNPZzzxqqFoBW1KkTnXUTT1Mm3uDlCc23muasGpG2jajmmCtiXfL1V5EkZiNVK6Zsk+BFTZsucMHJavYiM8Twnl7Uj4i3YXp293lkcSDkvyLkI72dM0TQNVhMjl5b2w1OMQylDIgKvcQkbZhkz9IaIXJh+uNjNBLIBrhVTGeYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p4Wcqs0M; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p4Wcqs0M"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2060955f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738573789; x=1739178589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTDN9Mplud83THmiGowq87k8MSyDKm3YgJpc64T4AGw=;
        b=p4Wcqs0MGhjt11q5aHYxNc4GIwZCPWGy3yUl1e378mMYFFFD0SiEZIZ3E2Rdf55Ptq
         qsJBoKpWtUOtzeYOl6RO9Xa7Hq6FmXJrtblfgvY5UFrLAQoviUl/XV0PUZn9wv/Mf3yk
         eQI+bi+KIU41Lp6AYeTG6jG7lJaLFTo76i5HAjdmt5XYx91+OElIM0MU6e85dgOJprHJ
         Ta55wdh0aAcqPqQWmXnxFi5clUv/vHeHqgw8nGSGcVhA3nPDoB3APNEtQIcISgDjiW2U
         2dVEwfxkG7z2k4jiixvB0hyegXlcq3Vyd+bp+DX/EZexz0oKR1lvhN77d3bIcsl13Fbg
         IQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573789; x=1739178589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTDN9Mplud83THmiGowq87k8MSyDKm3YgJpc64T4AGw=;
        b=FyDIobjpJKBhzvqT5eRgLcCF4EAWbAoA77hubS1yASQxqW6fhEoq5tnpbopGvE77ns
         qC9iWVjia/q0d/7av7Joixw0Y5CSjRlD013bat8ufyoGtPIE014HB1ZoI747yxfwjaJp
         4uwqzWL48tnQ9Pva2igrZcL3qCMXJdt6WUsmSbPRRkmxylo1B62m2/omNRuOJO7SZESa
         Kobx7LITmw075OO7OkwlqduAhr/zXggy7a3kok1n/U+wh5f19MwVhBoJEG6NvcgOOuEV
         M5c289tU5KTk1MJurnmuYrsWSK5NeNTe+OVqUtl/SOEURaRM9QKtKr9vv9PGoYHN6wWf
         IJuA==
X-Forwarded-Encrypted: i=1; AJvYcCXPw/pLtNDB+gFt0ftNJymLoZ/GD38/rl6yejDCldjLhs4UunUoo+a3bmoNTOI328YMNwH9yikT98YYCZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR0NcNTv3zhunJuQ5FGEVZVfvhBzE1k3hH6ZEQOhhB0XZgKjtL
	oyY/mR4GulDUfDLN+/wnb2dw5b9nRupTNJdlXA4CkfyTvgJU6t3rIdXGDbiyNYWsrwIcSGG9/aK
	U9oC91h2trzgQN3TfYik8e9azjjPTY+1cm/G5
X-Gm-Gg: ASbGnct2s82jgiuT8Je/CWSA/WYPKhCk1kKkuCIFP6jZtsEHBQl8d+TADqtLQuTvmke
	cJ1pyIrB621gaIIoEFSmOZAF3mcAnwzLCINFAIRSM8Ubn2dxwsApSgtxqyvw2mmuWchWS/t6YRL
	ZZyiIwL7d6xYHEZJUZ3dKL30ua
X-Google-Smtp-Source: AGHT+IFM9GLHlZ+BFxVNkIvlyblXVykvccxfE1y//nQwS7sYZaGnQmkNGwSODA3KxKIAr7oe/IbIRqDfpnehi+25lNA=
X-Received: by 2002:a05:6000:1569:b0:38c:60c0:40d6 with SMTP id
 ffacd0b85a97d-38c60c041c4mr10325117f8f.51.1738573788916; Mon, 03 Feb 2025
 01:09:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:09:37 +0100
X-Gm-Features: AWEUYZkjSqWe0d3JupRvmEZPFDwaoLn2z0gdviTtv2-Qd0BxBC4FdBGMXj4WLug
Message-ID: <CAH5fLgj+5KZcNRZiNfj7wg_t+QU7ki_=Pw5-whBLx9K0BcBbCw@mail.gmail.com>
Subject: Re: [PATCH 4/6] rust: addr: Add a module to declare core address types
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> Encapsulates the core physical/DMA address types, so they can be used by
> Rust abstractions.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
