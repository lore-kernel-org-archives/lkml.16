Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0C11E89C;
	Tue, 29 Apr 2025 19:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953536; cv=none; b=pSdtHNBsWWqfj5B+43dJ1Vo1m5sjxj6E87DPJzwaaBdii/+xEMazPT2tycRteowwl53zLPUPGua9USb6Kw9tJ8U/dAQ8KQ0c6X4iiz+5VoEsvtikRd0/pG8j2JIeXgI2+K94SofR2uia6v7l2i1S9AWZf7TTZ3/IJ6cRucnKWXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953536; c=relaxed/simple;
	bh=Cf/1Zs3LvoHH9crR8mIsN9S6Tq8TBj0Y0gYogsqqD/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5H+9suO2OUmdINLYXsNioNNPwee9E2ZQl+l162rjnb8bUWwt3QsdkrXNFyAfIrIRqmfRAmH7ix5+Qcka9QqDXypVU3DdoYdf+vUEXME4/C5uorTYdm8jSq463w1X6F9wR+dm0ScLQnR9229IhRsw36qyKqiP5zZDdsAb1o1d50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qq2ZRYnw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qq2ZRYnw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301a6347494so762510a91.3;
        Tue, 29 Apr 2025 12:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745953534; x=1746558334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r16Su1sCCYhnqNXeOKW7XODWPW+w2pTNIqFTeu9Mb/g=;
        b=Qq2ZRYnwS8zqbcsZ8VoTVMzgJmkGs8EYkE79iqu39ET/qI8p1W3zMvep5L1flpRQks
         yNa5lNKsWNJlrXkc9LWkVozVDeptkUVX0UzJdZMjpKwfieHKLxOw+rgbP0Dvgpeloxh1
         yBqeUA7FlKnkri4EQQDQXP4NqLhnvHdNDB8o1aYM/prfX/DoWEE0JveZVgfreRHlhsnx
         0KWLX+T8iL2mixPK8oS85ViPQNSee6RbqJr0KTJ4TMvlAvT3xH7e81mFdkm3+6apn2g1
         xkxxLIew7fYL5LWb/wXB0RTtxQ4+rT2DmLvExocBbkNVkxOx29x3lkOqrZ6lAlndGDw2
         Vx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953534; x=1746558334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r16Su1sCCYhnqNXeOKW7XODWPW+w2pTNIqFTeu9Mb/g=;
        b=jk8+9Bo868PsuYoF4LDFf2kvz1I4qyCeCOHaNYXVw5RoWce2yLT5p8QZRIXpyGQawp
         Fma47bZymJVIuGsaPcUjyj6NocA3/auQiicYlRgEAL9WXR3xzut56R5UyQOBLbObzKQi
         jTqCFS1Oy28qDR6exKw0tB3FmRAhZm2bRQMVaOiV+IVjR5b/sOTeEGBx6oUIz7mFZPdJ
         Zf3Cjuqc0Mjrhaf5KmHHR2F25Hk4Iew1f/9KM0D6Ev0lBp1qGJeFftR2V5Hsdjjx7DNU
         Ig7DSnnHybN8Qop+EiIBmYiy5wAvVfU7fuYjSHaP+zJxDnH6ujncFSlWbzQqDIV7UZOK
         9BXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJms0wpCafmP4SlKuifs2kPSCtX8S4Vi7SAmz/K3b5Xqsqxv95/Gn/3XbNXII54Mwqw0fE5v/9/gv98QfJeNU=@vger.kernel.org, AJvYcCW3i0i8v2+6I6+lf8ryOL/iICFlEFinEF/1fICbj+fBWJUPDrPHW3oz3jZDiKfx8ZnVP9CAds8MbZp0ZSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFdfPaDsof/3aEkI9OLYi2dExMc8dQusmSxvHSMeTtgCc5X4f
	kPVU7/aF5qaSTHoU7TTrkKd1UsEWorUx4k9gaRBiebTVCrW3kSEGR0TsLpfoHlnEwCgKCd7vh/5
	cafyctovPwba83sowcOOhDu09vnLpZEd2tCCWdw==
X-Gm-Gg: ASbGncuMvrhcuN7WdcaeBG/dUMsfiAo0ISIKCLY8mCzN7i1FRnkFIXHp2WAlKJvb2tQ
	MG68SA+0ST3EwAEeAINT2B++xUPxmGkzywAB2ZU2ymuIsA8oho0jC2jaExgRfd/rrQw6Y85lDqg
	0v2PvJpCqETUbyhUB8Cc7nrg==
X-Google-Smtp-Source: AGHT+IHsGrvtNSu7zfAedzBqY74ny6UZBQfdnfghG/iiXxqtFrqxbDJyig015Pgn2rGVH3TXRtMbDQ9gB4KjH3DpDTY=
X-Received: by 2002:a17:90b:1d08:b0:305:5f25:59ad with SMTP id
 98e67ed59e1d1-30a3337c9e3mr114359a91.7.1745953534031; Tue, 29 Apr 2025
 12:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429150346.392050-1-ojeda@kernel.org> <aBEXUG7QH0ymRuLm@pollux>
In-Reply-To: <aBEXUG7QH0ymRuLm@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Apr 2025 21:05:21 +0200
X-Gm-Features: ATxdqUGcOr3gxJsr8USoDtVzfAIDvZ5RlCaobjuVVIdgjgS6lnLZdSU5M8Bwyt4
Message-ID: <CANiq72nf86+OcMTNPQVnF=pXuaJVw0bFixMxs6qwS5vTh7RWxw@mail.gmail.com>
Subject: Re: [PATCH] rust: device: allow `dead_code` for `Device<>::parent()`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 8:15=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Maybe there is a much better solution I don't know about.

There is `cfg_attr` for that, and we use it in a couple places, e.g.

    #[cfg_attr(not(CONFIG_AUXILIARY_BUS), expect(dead_code))]

But unless we are more or less sure the condition will only ever
depend on a single `cfg` or so, I am not sure if it is worth the
complexity (and even then reasonable people could disagree).

I wrote about that approach in the "Conditional compilation" in one of
the bullets of:

    https://docs.kernel.org/rust/coding-guidelines.html#lints

I hope that helps!

Cheers,
Miguel
