Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6F1DC184
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738920907; cv=none; b=KXtIYreLSja2A2vsgH/Gm6eDIl8F3LRHwksSaaKOShwOu/vgDNGxaJbI61JgBRjwVTuf9FZYv8PoUyftcucaWz54bCrrcGwDrOvieIgF8I66ZgezGtu9qRbV038U6sDiLBdw8GD+PLg0d0KS9rprFC8WoyCcEhDpOisCzUkljxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738920907; c=relaxed/simple;
	bh=WpzvF9szQZoGnzPsK8JGH5qUWtlXbF0BSAjLUqm0mEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hR9gqFc+c63KT2+G84j9yDcbmwsGIUtCRonXIhZi2mrLXWliLYF27r+e6MFBROsQt9RA/SOcT6j3ShiQzo/rGTdu16fv89hvwT56BG5itBI3P0svIBAJ4q+fdGJQr+TnNxSXD5wP0DTFBLDz6WZ6vJOxtNOR+S7UqkaGetFMZ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m/sGvnfM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m/sGvnfM"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4362f61757fso17990995e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 01:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738920903; x=1739525703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2480EBnA/WUX+Abw4NwvBh7SdyU1bom5NZ1qUtPF8aE=;
        b=m/sGvnfMW24DT6nhxOhfOe1h1xQyRFlRZfe6ftk1GPuJN9Nt73iAsFSwlJcW6AUotf
         qXedEdlVtR+47n37WKPEU1ccA05rf6XDlw/p3QAOk0HnjSg4ybbpOboSVoRolmCud1tF
         2ZYOaDsxLo7T33yTWDCgWthrsZXPBgCazkQFyb/gJ8s1mq/e/RhHETveHjP7u16cDq5R
         0JgPVEJKwREsmjsDo1wnN3H0ohO+xLEdp7KzRpeOzojpMEqa1FfGZTxYcB0IlZ7Q2m8L
         1WaW5vPY3G6t5hqIKxzAOcB8VeZg2T7X2QH7ocvbnSM+KuYeRAs2K1Jf9mvK2VofAfZT
         toIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738920903; x=1739525703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2480EBnA/WUX+Abw4NwvBh7SdyU1bom5NZ1qUtPF8aE=;
        b=SnzG/b3sFTByHg9uRPaysb//sgeGdc0s+a30pkf4x2Sh8EcZPqY44p2IeYbnQ1lh03
         JeCewQkDLB8yx2LoP8LLNCfV+pSsFlgFF9TIFytA4CNaLspvrmQwqnobJHywo8R7t1RK
         b+KCkA8RCLpEi6gD6kOfvpsCBWfwOQQJW4UhIiR39rTm2TkYAviNud+e0xjWjneG9R+1
         mpZavn+5aQg9BUuGZxD0GMKzSU7wEbL+PslC+E8G34joa3WVCeHNFNpJ3aN57Ed81W7W
         5AGTYsW6XitkSLkgy8GVcuBgIZ6tzdT26gzLLwdcEdNj/eJJ/wjRuKEX8SxwV3wFA+aF
         I7Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWkEeKGruY4TOKAeV5N8vMcnpI2tJtTYah7C5WJVBZcRxsW14fTAA0N8xZokdAN8HCdzHBZCks3Gga8coE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0lCTAXJgxd7CjR83dpBczu9FZnofhXvsW631Po48tLgzsBXX0
	/Yx7iOSdmRQtvjZ42mpO5I7VUIoYd2fw3jLUxR6xBMb0FRUlNY/33V/c6NNoepQL+ZhhMRpqKAA
	Ca3jSUUJfp/cIw2Xy3+HKJ1ILanTkianPZdhG
X-Gm-Gg: ASbGncv7mpwl2bx4C2JIRDGQV0KW/w6zIP05YmDGKUYn/O/Jpj/UHBU5pMRQhKNObl3
	6Gbd6vHCFefLqj8X9JhYKtWY8tpedwdN6/4zLqJxsvjkL0EtOyr1MQqyHY9nXV0RlDQxnA37MZF
	p7Pk94glHTRr42/ofhq/nNVWYTFyc=
X-Google-Smtp-Source: AGHT+IGhUSNu9zvLoiFSofDY0OMxcNSFAl8TddmlA05himP+cOcm5XjI5yjsyVV0T3Kj//6iMl8vsfnlp3YycnJZYfQ=
X-Received: by 2002:a05:600c:1d96:b0:431:12a8:7f1a with SMTP id
 5b1f17b1804b1-43924991035mr24650525e9.16.1738920903421; Fri, 07 Feb 2025
 01:35:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206232022.599998-1-ojeda@kernel.org>
In-Reply-To: <20250206232022.599998-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 7 Feb 2025 10:34:51 +0100
X-Gm-Features: AWEUYZmEX6j_hGQINsn4AjZPTMCvx9Pp7UkxCKUDf-6T5E1oNpjkEWdcnoNHXT4
Message-ID: <CAH5fLgiJDrNPe4hT4HrpC+bcskWtBcZdcvAfdnqpY1eTHVWk0A@mail.gmail.com>
Subject: Re: [PATCH] rust: rbtree: fix overindented list item
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Yutaro Ohno <yutaro.ono.418@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 12:20=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> Starting with Rust 1.86.0 (to be released 2025-04-03), Clippy will have
> a new lint, `doc_overindented_list_items` [1], which catches cases of
> overindented list items.
>
> The lint has been added by Yutaro Ohno, based on feedback from the kernel
> [2] on a patch that fixed a similar case -- commit 0c5928deada1 ("rust:
> block: fix formatting in GenDisk doc").
>
> Clippy reports a single case in the kernel, apart from the one already
> fixed in the commit above:
>
>     error: doc list item overindented
>         --> rust/kernel/rbtree.rs:1152:5
>          |
>     1152 | ///     null, it is a pointer to the root of the [`RBTree`].
>          |     ^^^^ help: try using `  ` (2 spaces)
>          |
>          =3D help: for further information visit https://rust-lang.github=
.io/rust-clippy/master/index.html#doc_overindented_list_items
>          =3D note: `-D clippy::doc-overindented-list-items` implied by `-=
D warnings`
>          =3D help: to override `-D warnings` add `#[allow(clippy::doc_ove=
rindented_list_items)]`
>
> Thus clean it up.
>
> Cc: Yutaro Ohno <yutaro.ono.418@gmail.com>
> Cc: <stable@vger.kernel.org> # Needed in 6.12.y and 6.13.y only (Rust is =
pinned in older LTSs).
> Fixes: a335e9591404 ("rust: rbtree: add `RBTree::entry`")
> Link: https://github.com/rust-lang/rust-clippy/pull/13711 [1]
> Link: https://github.com/rust-lang/rust-clippy/issues/13601 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
