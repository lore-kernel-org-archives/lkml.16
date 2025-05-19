Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BEE288C0F;
	Mon, 19 May 2025 17:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747677453; cv=none; b=e/QjnO4KPcE9gY6O2uaI0rPiemx38AZ2GAmH+jjq9wyh23pc9hQFheg8nMvwyHLmC8pKDrzQCJ542GH/bEIV2O9iHB8Ga/xO3fquD4H3JACOtOXxTvwA/0bdGzZKSVcbr3SAscQXb1PfJ4Ti8pkVa45RNuGwFaXJf9U2ygtWuHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747677453; c=relaxed/simple;
	bh=BPv8iMIig5DPrTV/LHQutYcUVOegmQ2KExNbztY/PR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Is7dMt+9cDvikkgD/o5IcEIzA7WCxv0sTF94bZ/gi6aRN99ci52APMm38G1lHmXlA3W83yc6WwI5Ldof9yv5VxDDkBYCS/7zg/7foY47MnmuZAZHeuWYJqS3V0UzSc1nQmXF0BH2bcSFVJwqwH2tOqFqER2JOKrsu8ToU6jFujI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHhsN1oW; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHhsN1oW"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2322d8316f6so1806155ad.3;
        Mon, 19 May 2025 10:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747677452; x=1748282252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCo1UlWuEO589OFq/CFChinf64Wl3BQG5yKZVHK62io=;
        b=mHhsN1oWjk+9hMDiIrGfCsSPCn+oTLOj1m2aG/x71cGwOfFVQfcgtoQ0t+JigmKNBi
         mZLpmrUGEmZxGAA3LGWIasj5qGSs1XDo5AYp5/7InoLh6lxT7qHj61lLXHS6sZrfunlX
         yYKxnCSvDsqsrnMttb0E/CJPvmyC/CCkqeAwvx+j537NFffMogpovnPYgbFsMPcQQz1d
         ziaRrfz0vHiNgH3JTwb1dANQjsiCdsdvJquL+oM3kAg/bdYA1Wq9FOajXHicOJJXyRsM
         aLHVta+8uFnvO+Svc7A/362dQyd4A15TB1fYIyCETwsllYLCUmByes9gNa8Ui9R8WQtx
         PyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747677452; x=1748282252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fCo1UlWuEO589OFq/CFChinf64Wl3BQG5yKZVHK62io=;
        b=iwcG2Zlf+N5Nerhxp3XfZlAI3hPoL/bWpNpnebh6zZLatJ76PdQgIy0uejGVP2AKJN
         MpBYu2fJJWv6dMhZnxnnnIZfOBqMjR4V0AGO2vs1IdKyvMdrpKld1bIrX4ub7o8xefoH
         BL0YTwTSiRjGWYwI/ub4dGaktyuGuDOrvbqtz4YmtGg9A8mgJ8lqbuTq40uwv30JW8UF
         pcfm9A9vaHq5qyMRjK5VzHvVwf5RnUMUtmUKV7Hndwdv9pON35CmQDxKnUkcBpjAb2Y4
         a+kvTaK56xJRlb04pjmwr+tdHBduZOszu65sddi+VW2ArmW6qCJYs+MpcvLmVTCcTa92
         k9bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAnLVlxhdecniy4nPtR7Eg8CcLbS/PMeJRyp/lg2IPKtQemKHtssbQeRSQNIH0jxY5/mdmoD0aXo01TT4=@vger.kernel.org, AJvYcCX/cefVplCcMLMnXeX6JYm2Fok8m6Vg976FJOktPJ7wXPOXJBD2ejS2tQWaV8FZPjsILl6dbLVS/lAfpUTWA0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUL38vXSzwpYOrpinoPM5/Ye02rtfxdgD2YHmMZmGRp9IuLhab
	AwIg1xQHb2/lUKW1pDg2Qr3nZcX8xN1Lia3Y4yV00aValOe1MWWWNIcvuMUJTB4eoOwApdaRpXE
	B8j/RL+rA14mAMIRrDhb7vlQfgCL9MyY=
X-Gm-Gg: ASbGnctRTNG1cS438RsYHLzz1TDXmvNoxMa0vZLGHJH8gwnlBXZduJO0IaP2wN6FSSL
	Dv9R9O4S4VKKumNiEyEhiM8rVi7ObUJhfV8A2CLLLgz2hRgoEjeSvKYvb9neVQgcIyXQIwZTleq
	/ChY4K+5lXaemV29pcRMxfsv2LFQUkNsmw
X-Google-Smtp-Source: AGHT+IESI9GI0QxQJR9pBbvs03URmzP0HPlSsTzcwQVMTi6/7Y6PaZL8HBIC9FnZJ8XbkYghy2BJfl9fkBj9ckfMx4M=
X-Received: by 2002:a17:902:c951:b0:22e:72fe:5f8c with SMTP id
 d9443c01a7336-231d452dd8cmr72713985ad.13.1747677451690; Mon, 19 May 2025
 10:57:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
 <CANiq72kkgBtEWNQtu_tZpUYC+b-_3RsnWFO2biHPB74mrKE=AQ@mail.gmail.com> <8998B971-BB46-4624-8077-5C85FE5FA97A@collabora.com>
In-Reply-To: <8998B971-BB46-4624-8077-5C85FE5FA97A@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 May 2025 19:57:19 +0200
X-Gm-Features: AX0GCFsS6ATgJmrqlm7yXkQgauwhrx7dv3Q49suY8vNkvjEylE3A4ZCpwIou48g
Message-ID: <CANiq72=Lu1nwW0-MP-nJ57v8hh56c6V+r=RsnR6g41Em8MvxCg@mail.gmail.com>
Subject: Re: [PATCH v5] rust: kernel: add support for bits/genmask macros
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 8:52=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> I have been staring at this for a little while.
>
> I wonder what is everyone's opinions on an extra set of:
>
> // e.g.: for u32
> const fn const_genmask_u32<const H: u32, const L: u32>() -> u32 {
>   crate::build_assert!(H >=3D L);
>   ...
> }
>
> ..on top of the current genmask functions we already have?

It seems you want `consteval` from C++ :)

Without having thought about the particular use case, just a quick
note: if you have const generics, then you can use `const { assert!(H
>=3D L); }` instead.

Nowadays `.unwrap()` on `Option` is `const`, but not `Result`'s. That
would be a way to have a single fallible function that allows users to
decide to unwrap in a const context or use them fallibly for runtime
values. Another is having a custom `const` unwrap for those concrete
`Result`s.

Cheers,
Miguel
