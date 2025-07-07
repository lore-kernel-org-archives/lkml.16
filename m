Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7514315C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751892610; cv=none; b=KlB3JZGyBjJJi7GqF05Ly5CCvDSywf98OA208NbW//d/aFvOQ4eM5oEyDuvWCJQ7falKeZgg6zH+Nog9MQ26KMw2I1piWTJyzFnxGLYdUlBidkx6WpBsetdKRNHOnC1/fgzgUxMOzD5MRGDrAT831uYqrTd7I+09LxQ2/bW+lNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751892610; c=relaxed/simple;
	bh=TlGVc2vlqFVb5SNdiOg16XM/hn4x/ChX9J75203gx1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iAi/2EpQUseQn13/5riVsyK7fKAGEj3QLpCP2ekrsMFnACeuTi7RbDyxl4TuYDh9iD6F0y5WaHY3dObV6crbJaoXjdp6Olk7l64DWwxpQN05qLi/tjnjd6S8+E6/m3jQR7PXRbwkeT+EjLfLITj58O68pqYbY/izjhQ2tNygERg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wdVtM+lV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wdVtM+lV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso18752745e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751892607; x=1752497407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNdhzW/Y8MjvnDjqqg8r50YbwUFzxxNmO6sjtPUADNk=;
        b=wdVtM+lV2m66DDMtkJY2nu88alF5cVWGttMZ10OgbzsZ8h47ohfTKj5PABJwoK4tgG
         R65EXnjFiDOFCvOrozUhSSeOLXkz/xmjdfFfymxmBfSTyq8zlaE5LUOD/qY7LMv7tBQm
         eu+1+UWCLVupmDIf72CNX3fkkABjLj+6fQoIbM9JCM21IJMOkwX5pQaDjU6Xx3F6Dq0o
         KJp8kynEhEx534H/BuIavkPHVTrsuieSiajgPEREyrgjYkeyPbNVfVDUGqugBw8qOooT
         jr+oefHrq1AwuCjEQr1vhL4BipOAsck/AE4/9zW2+IKvl/0RVtz5dEe60IDC5sqnscNa
         fQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751892607; x=1752497407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNdhzW/Y8MjvnDjqqg8r50YbwUFzxxNmO6sjtPUADNk=;
        b=OoWYJXZqXHonbnDCaXIa+2CXPsgTDk4S7vWZ4r9Gd4rXLyMOyc+dUuw9t6FslqZqw4
         Rg9ETcTlhdTVgcAeuUGOt1c5YR+l6nILrILlcu/yS2JnXL7egWW1mlqc8Rm4Dr7UA8Nd
         UToKPaXE7txHsXtwmPx/TyMqPK0C/nUAvBLsg1ujrmLQWsAgFq4zi3FPo9S5xqEcwsDV
         66Ss6HJ47uWYW+IzE1OKAuZpf7WlxHHLoUm1XbPuYy+44u7/E+MLVNH/M6SNbdit7mJv
         yZlYuBlxLEyudOs5g6SYXCVCjxC0iqG2/g7DtxM2haATGitQYgP33Ev9G4n27ll49i3L
         3QCg==
X-Forwarded-Encrypted: i=1; AJvYcCVpLL3sGKyWSOYLsy0sDh2yRR6Cr7njBF7bKdlW6rNp0bSy8taSq7G5Ba/O3KgDufRTclnVR8zqXFV35fI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+3qo3LQFMuWuQ6trgWWLCYtDqmccViZkbXlYId4uBA9ic4ZHs
	tlEoTVvDjT+bnY2ZoznPoTwmI8/3SFjmOPCr3LFVYaEAGHP5Zf97p2MSMExDJeOfA5w4ZDM57TR
	00vX0YyKAAvGdNb1pgw6701iL+r6LrX0CmwKDIVyF
X-Gm-Gg: ASbGncsdpWjah9yqzO2I2/V2DZG/hpIwA4Up7j/f2WL74S+QaNlS8kxJhqjpYEJXxwK
	5Ai3nsFkOh8YSGCEZm9/NRbkTzTViuLxKbAWowop59k4aOLm/1rM2d90RDR9XM/dM29KrYUxg+m
	MZyXGEGMVs+oFhX7oktYGpN3H3/n/1OYUxS/w/zwZIhh7r3oJWeiIAYG2aM0Yx80jCse3wbHY=
X-Google-Smtp-Source: AGHT+IHsMXBAD8GA+B5LxiAfDAfLtY6TvZ5FvEHyZmOChFA1YhgQJ0ZWJ5lgZJTqiFSe6ZNS/+jU9jf/Us1OmmZWM4c=
X-Received: by 2002:a05:600c:83c4:b0:450:d04e:22d6 with SMTP id
 5b1f17b1804b1-454b4e6bbdcmr104358265e9.7.1751892606844; Mon, 07 Jul 2025
 05:50:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701174656.62205-1-ojeda@kernel.org>
In-Reply-To: <20250701174656.62205-1-ojeda@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Jul 2025 14:49:54 +0200
X-Gm-Features: Ac12FXzQ5ck03QQHYzFLsSFTLp2hRsyOexA643YmM2tCIERUaEuSJWfO_lmHndc
Message-ID: <CAH5fLghD5eU-YUkq0M4gFK1tXOGHz3Py4m_+xTnYzLxT_ru0xw@mail.gmail.com>
Subject: Re: [PATCH] rust: acpi: remove unneeded cast to clean future Clippy warning
To: Miguel Ojeda <ojeda@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Len Brown <lenb@kernel.org>, 
	linux-acpi@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 7:48=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> A future Clippy warning, `clippy::as_underscore`, is getting enabled in
> parallel in the rust-next tree:
>
>     error: using `as _` conversion
>       --> rust/kernel/acpi.rs:25:9
>        |
>     25 |         self.0.driver_data as _
>        |         ^^^^^^^^^^^^^^^^^^^^^^-
>        |                               |
>        |                               help: consider giving the type exp=
licitly: `usize`
>
> The type is already `ulong`, which nowadays is always `usize`, so the
> cast is unneeded. Thus remove it, which in turn will avoid the warning
> in the future.
>
> Other abstractions of device tables do not use a cast here either.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
