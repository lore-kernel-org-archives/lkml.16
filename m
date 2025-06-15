Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582B2AD13;
	Sun, 15 Jun 2025 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749993333; cv=none; b=GdlWYsbEIvZZ8RLadH++fGAbR2B9PW0qIw1veibXTrrWaLkMIpyqs1yywq/+2gVNheIl/dp5KYnwyGEwpidD9xx0Y/Y82cGHrMF9oJNY81ie6u177vIxpKvyIYv/9uaRPTng/PCwWrkTM0n8XDJArEZpRqFR68YdKolcQ1Q4LqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749993333; c=relaxed/simple;
	bh=ilRb6nStrH25gPWNyjz6nBN7+q72qai+P6k9/py9QGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DS3hZ2kQVnKDbiiYvTv22U42yI/0eQKAt61TreXgp1Lb/uSmzJyXSWuU6IQ0Bg0oo9/TJ1cLkE5lTIidyyt4SxRuj9oCfVwtZ48JNxnh7rtoWIwc0Zqc9Z3LSyFywqOqYF1ZEaKk2EnGtcfvwJRBo2QbXq27xvIBgIvM7667JV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Auf+ljVx; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Auf+ljVx"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-312a806f002so553436a91.3;
        Sun, 15 Jun 2025 06:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749993331; x=1750598131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilRb6nStrH25gPWNyjz6nBN7+q72qai+P6k9/py9QGI=;
        b=Auf+ljVxsU+FlCuoeqd9HXS4vfh6vZcv3t0cHS4SfXu6NgTSsLTIAMf/c06e2VnpF9
         paNNU1Caig26daTNjftxmIV2ImdaIRJl0oA0bqAS9BDiqeO5pVWjLo07gY64Oav65r5k
         YniyDL1rleYdNTUPFC73C70bZbsx5iMPb/Jj4Ilq+g8GQaAcZ8LWRlrDSomBtbwdFmT3
         3pLabGuOOKh1tu5IbqbWvKMPy9NeTwvBSxqwpvZVcmKpf+Vh1MkJx4jfOUU2OdsSJQV6
         j6adzrWXb0lkOCRrL79IcwG9B6GUQAxv7k/D4/ViFi9/4CSkepT8R3lACAf4dtBaEVhN
         FemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749993331; x=1750598131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilRb6nStrH25gPWNyjz6nBN7+q72qai+P6k9/py9QGI=;
        b=QQEiBDUhX6yiCHQ3Qr8oncVsRjeuglo5o7BX5T40356MsR/cl19YSV7gIkJQPZq7k0
         hJnODqvD4+Jub6Jdl3Ra1riSgMbSvIkVcpE8perJyFZ/RirGv2u6VbAdkEpIL1DtqqPM
         JAKKRpimVBtTKnjzuLy0zvmFaHZnUuQ++Jrp1S3k3lJSK5D7V88fhWPvHOWH9S+Wo58t
         bT2/bVOo50OQWWwbfOJ1QNpzKU++HyeVk3iIgYWPX0z5js5AuryugR1I3sCvG4JIGN/Y
         3xemEnM7jS7ZwUSrAJCujpW7jLJEPU9XWXgJjMCJlQBsnmYLrO3TYN3mXZtzB0JLn2AW
         3H3g==
X-Forwarded-Encrypted: i=1; AJvYcCVHIRoa4nczWCx2WHcJeQ0OYEX1W3eFrrVpPLRNp2fFdRE2c6F1m7GTkTecA40WQysK5Uq/gzNlXitv360=@vger.kernel.org, AJvYcCXhUqHCbhSacLg76l+ujiSm2d4uB115/XAzKzXYptVAV/rNZqRLV323ne0OXyBRls7tqg4Nk59zzrdyD+dclqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxObwFIjwVXIqHM8n+bhE4RbuPcQz2M+59exsJdUbHSKUXl0Iie
	oZ6QB05vW278ldEcbnYtDBWFTjORekJ5UUtyxbssX4dZ/h/sIP2kEnDwi1P9EPk9oG8ZnZ28tD2
	AKWhoxTG5arONsWPU1Q1cKi3ldqKTAms=
X-Gm-Gg: ASbGncsiRQw+iuC5cP4kng+QBxLcIwp7eZDZSvIbvDz0hpW3+6UfACDKML0vV8NukkL
	c8vXuELP0s+H6GI2NRSoWANrpb6kxsX0ARbqnNNmU0mT8JZ434EokH6x90QODB3hjHMIguCnLBe
	Fo/awtqHnJ7QAgQyLLIfDDMuWi+6U2KiFzmY/t+oc4fAg=
X-Google-Smtp-Source: AGHT+IE5eSI4rMp3kBfoJkXDiGryZ+jPzBnaGpsDrEbA5fOM216gDEgQt5fBIQcKaR1QHy4+ITx309bYVUt+MpoW8nE=
X-Received: by 2002:a17:90a:ec84:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-313f1b312d5mr3509970a91.0.1749993331271; Sun, 15 Jun 2025
 06:15:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250615-borrow_impls-v3-0-621736de7f29@nvidia.com> <20250615-borrow_impls-v3-4-621736de7f29@nvidia.com>
In-Reply-To: <20250615-borrow_impls-v3-4-621736de7f29@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 15:15:18 +0200
X-Gm-Features: AX0GCFt7FO_MzJwhlviA7iYXTDcYuOpZfK22i30XGNkaoudcr9K0W9krtNB5IYo
Message-ID: <CANiq72kmN1iK=AD0yzj5TyMGJowaFzGMZjEXfUM3TCSRJkYuNQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: str: implement `Borrow` and `BorrowMut` for `CString`
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 2:37=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> +/// // Borrowed from `str_data`.
> +/// let foo_borrowed =3D Foo(unsafe { CStr::from_bytes_with_nul_unchecke=
d_mut(&mut str_data) });

We will need a `// SAFETY:` comment -- Clippy should complain.

Or to add a safe `from_bytes_with_nul_mut`, I guess.

Cheers,
Miguel
