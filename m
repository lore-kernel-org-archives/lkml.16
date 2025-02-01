Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB691CDFB9;
	Sat,  1 Feb 2025 21:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738444829; cv=none; b=LsuKnZv6GtkLJo1XwFfwjk994AwXBkqSUZNFrmXdHXFxmUyifXCZcl/u+tqPX5SFn/TYCrHm5cnt9pmLXPmM7jgtjihq4yNk2HJzQbEqLYA5EcWxK2fTm7HNolTtbn7qCMIHlFKpgnfcR/0nrg50Wglh598ev8o8qRrf0Lmo/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738444829; c=relaxed/simple;
	bh=3Y0bhcL4Eo+BfJxfzbskkAtfQAkfcvteVvoEYha/FhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sJlyvBIjcTkEWbsGtmRmrd84HgPWllYOxMq1dDn+I+R6H2emoQHE6aU6RpR8v44vCjoFiAWDL5dFqGCI98wK8whTTVk2CshbnGo7xgpSOLShfQ8WTMeCcL5Xc9qVgMSkgyoV8vWIRVxWMft2gkpYY92jVjK5UcDFfPPH96rP42Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=My08AMyf; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="My08AMyf"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-307325f2436so31142041fa.0;
        Sat, 01 Feb 2025 13:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738444825; x=1739049625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvecpl+HgUVTtmudTdCRFmg5hSgsGDtDvnZryEJwbwk=;
        b=My08AMyfT21wMzZj8dDP3EHc539i9hv/rVeOR6TCReioRnRuXXUN5gv0LN/o5vI3Z2
         bT/ojkxG9xWD/5x7XutT85L0aoTvxfS9XvkANDoerYKcdsz1mAMZMTupYV7vNV9OINn1
         FgjXmMwEbg6gDF4axcbRH/KwPG9bitjeVlCG+SS/VYTx73VrKeyK2xggxQyuHkFLQoHy
         DkLpHVGjO9OJsY1dLN+wzovXoQj0Tw/5A3sY7qjtXC7Y3xaMjmaE2mZbFIDSWeDbPOmO
         VCII5w64xvd5pRz6Mz06f57Yg1Rff7ss3MI6BaHniIXDAXs30OtG7qYIYWvTUr0nzxDH
         zX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738444825; x=1739049625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvecpl+HgUVTtmudTdCRFmg5hSgsGDtDvnZryEJwbwk=;
        b=UId/kymt+edwSW9HReAYlRAShiB6iZL/81p8z1Dg5Mh9ZwbizCqYzITOKPwniiRTh1
         XHbpaweozruhAPU+9AebuY+Pg+UoOcHZmjBlSxn0azMA3TaZ0XT0kpiy5CPmYAIyfxTo
         ofx2nkPA8FFZh+FNhMDrbPJwk/+S+3acMhH02jHzIMTv7YlEepTesxNdNfdzd19d7pJA
         y38yjhMCKP0RgRr7lSBA35n1UYmvxeFDm3CzA25T4GqEo2WbaJLfm7VJiZyFW0S9BTs4
         KH8RQo0BNnd+gJDgGAPjuj1dAHj2YMOpwvbnztxku6cV35gldxfqMxT7jJjUvsFHvToO
         5T0A==
X-Forwarded-Encrypted: i=1; AJvYcCU2lHFwgmRQsvqmvAsZPwpqrq8aHC03YqH5e60qVNS878Sth5K3Nwyd5Y4EqLI+G62jFf3hljMgnNmEiqzApaI=@vger.kernel.org, AJvYcCWhsOU9btYJDJg0Jm0h0BqITqNfpDTGunwx0hZYFPywOYIjmusHtPX//JhUBJ4QF9JmSUdrOEKrN3yljo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy9t5o+BxTqiAL1E91gqHk0WRipjz8lMhq2oMKbP3jpzbrfwY0
	4CSw0vY44P+umNmXDPXIaMOD35RqK0aa+nq16fBR9Rye5/sCfyBkpIqAWnKltDUy4K/rOkq7py/
	BQNv67JJTLvWMa/BicaHi1upuw0w=
X-Gm-Gg: ASbGnct2tBL6We9vcuFxogUR6BZxTpWdRS5wIWlftpvufD6ikA3/KI8tfWEqXPQa0mX
	JHKBUMZ8ZHAtWzkWCku/ukzMgKDFMfZunQ+u213l28w1FsmOgwVupZAl6EOVBx8CMjpwN9S5LWs
	QdAczqITSvyHz3vsDqbaouoqD036g14uU=
X-Google-Smtp-Source: AGHT+IEKRKhKk5clOlOSo7dfDkI81Zfx64U+o6b2yi6Q5hHk6iaw5N9WQE2hYgMY6wjZXU+hvYbxa/gQsxCfmlevMY0=
X-Received: by 2002:a2e:a5c3:0:b0:302:244a:da2c with SMTP id
 38308e7fff4ca-307968dfd9fmr55108461fa.31.1738444825329; Sat, 01 Feb 2025
 13:20:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-aligned-alloc-v1-1-c99a73f3cbd4@gmail.com> <Z56Bq94kPaN9UX5H@cassiopeiae>
In-Reply-To: <Z56Bq94kPaN9UX5H@cassiopeiae>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 1 Feb 2025 16:19:48 -0500
X-Gm-Features: AWEUYZnD6rCm9Fdn0-d6Pr6hwcCau97EZ1DtguMnvAf8R-j4z6awNf08fuwp0Tw
Message-ID: <CAJ-ks9n3KfcSqocjXY6QojF6R_aGBiRsXBuyiX8Y0rHtjm3sNw@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: satisfy `aligned_alloc` requirements
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Danilo, thanks for the review!

On Sat, Feb 1, 2025 at 3:18=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> I think I prefer this to be slightly more compact:
>
>    let min_align =3D core::mem::size_of::<*const crate::ffi::c_void>();
>    let (align, size) =3D if layout.align() < min_align {
>        (min_align, layout.size().div_ceil(min_align) * min_align)
>    } else {
>        (layout.align(), layout.size())
>    };

I was trying to avoid repeated calls to either function, but I'm happy
to shorten the variable names. Would that suit?
