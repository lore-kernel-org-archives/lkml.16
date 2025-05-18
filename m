Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3478484A3E;
	Sun, 18 May 2025 20:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747601344; cv=none; b=bWGqLxR76IBVjNHENffmQkaKokFTZx02mLtFJw1+j35ycl+Vpv11PJad9mOUQIGhls+jfzCj3lKacLKO1tfgouAuyGGXF2SsioO0TDHaXFuyB26Lx1DHkVtWXPviPs9bdablA4cX8P/1qjVsEPiF7zJ9y2pPAu3TOGPULo//RwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747601344; c=relaxed/simple;
	bh=0yBC7bRe4qVVxZ12xJwqGcexHbwNiWma0CRK5WVbhSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aadiayy8zxcSX+d1jBAYDWPEZXXPSSyo0bpqhz7aJok1suEKOu5K17Lpzy1rfozu5prgWTE2psF2QKr3ZGwqy6Lbi/jrTg/SxEeooBouY0SJwn78H3WsT+oPaD0gGp4T+eZ2JIZy558IMKrCbQ4vh2q8VYK8t1JpfirfPy+jZVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9yu2JRQ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9yu2JRQ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30c1fe19b07so1027826a91.2;
        Sun, 18 May 2025 13:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747601342; x=1748206142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Zd0GLeEPK487Dvj3alfl6jCAenMesDfjFoHpu+f9Xw=;
        b=M9yu2JRQHhHkwBzLwIxEgSWswMnwM3uKAhnc8KeCiqQ7z3qoJYUaBLZZYe3nhjIaF7
         EW55sRbFXmP4UCDeEu8Xp9e0XhxR+pq2++BOtnskF/udUmYYZcvAipKtV+CvTjPBwxkY
         rrpQCwPEYopvvcyNme71qVqZy3pc+to5scf9WMebeuMdRcpze+cSnzzU4of4nl+0lqF0
         KLoOJy7RkOwQQ+buFdg7von2bvLmOEZp7B+/oDRmh4pcLxKSMW6e0DfHL6MoRdN8rrIS
         rD3g+slVlxZcO9+Ej67l7MAtu6xwCqX2kisiZ4KABwMi8iv2IUj2T14uTxt96rflxE/0
         htNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747601342; x=1748206142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Zd0GLeEPK487Dvj3alfl6jCAenMesDfjFoHpu+f9Xw=;
        b=N//v1XnOw7J85P6tEpsz1tp0uMpJp9Rz2tLR0+WDiA4P96qZQ41II8abVBeaYMJkJe
         Jx6ahlb33ZCZHUL2On7BCifEf/GF6abKo//YpnAJxwllEMGC/Bytc7NheuR/eku13y40
         Xl30oMKiEu6XpfjoyCbFWAJtbMz9360UMorsC/HYa6vnxYpEQpBzV+hKy2Ve98DJrZdq
         vexqlY02x4GcPUDk8pn5iHRRU83q+20b8biORpaFI3zdMFWQUPpJDmZVee9FkbxW2MnG
         6xPoxv4UW0NwdBDMVAE3LDIk2HORM8a+MffS9G0lvn6Vah/dLhXvUgUXeplhf7mAyolt
         lByg==
X-Forwarded-Encrypted: i=1; AJvYcCW2bwJ2aOXTpaYM7gaIcimPb1FKp70jBexsRIWpc5c5/VSKceG78WX3kbAUWRgxxJ2XJ24BcRqvFBBUu08=@vger.kernel.org, AJvYcCWS8rr1eOHsIehdONYDAtsgCZ4dVQhQ/bmzuu1TFJLuHVP6uEbj5zA8uCM96leL4T5Fzu4lXwp5SEIvTIRRLI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY8vF6iaptIqN/T2pQuQsEgIfAdxzHHEFHM5PTv84IzTCMWUkc
	mrgc1fItK//NSW8gO3WXtnrrsvnZ3KIV42L0skTkKjKi3pPWeB5v8tV9HONwmg689W8fLaoBl9f
	kSY3tSx2kQrU4J95vitdF2e/xChEbTzQ=
X-Gm-Gg: ASbGnctve2u/Sl3PUAoUL0GO7zJZZ3Q3w/rj+XFpDgVWxHvArl8OBGKc9GldPY1wcqo
	5VmqwXt+Lyg8cQ4LBRR3MV7Q0z01OSOqTciA22hbVGaSb3qUlz72VmVUCZxCeaa5J1pMQsXwnNE
	+CQGsWnAa2S3IqmbTKyMxUO0bkDg9RQZwE
X-Google-Smtp-Source: AGHT+IF5E3L5ELq18Fv9jm2zjm7CFgeu4UdXbQZ16Y+RcrXplfnguHAg4W7ZPeDJOGSyJx/vWZSqdExs4Z+K9AqdRWA=
X-Received: by 2002:a17:903:230b:b0:21b:b115:1dd9 with SMTP id
 d9443c01a7336-231d43ad454mr62808115ad.5.1747601342427; Sun, 18 May 2025
 13:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jz6uq9sm.fsf@kernel.org>
In-Reply-To: <87jz6uq9sm.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 May 2025 22:48:49 +0200
X-Gm-Features: AX0GCFu2utd7Rh-5rfaTX3OfvhBd3GMG4NCgKkEMoW3Xq8ufUiCZ1Yl-1B_M7zg
Message-ID: <CANiq72k-4LWzb_27RAzDHL9FekMhUNNid3TvyQ9U9y4VEFz-Xw@mail.gmail.com>
Subject: Re: [GIT PULL] Rust xarray for v6.16
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 1:05=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
>   https://github.com/rust-for-linux/linux.git tags/rust-xarray-for-v6.16

Merged into `rust-next` -- thank you!

Cheers,
Miguel
