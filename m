Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE96186E2E;
	Sat,  5 Jul 2025 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731019; cv=none; b=mcXRSThPzem0k0R+3Xj7PntV0sxUUHjmrVxGhGGFanxxdlyC6j2Bqh6cBK0nosxJUsqwXWrtjlLH5hE8t2EcbHRiwlAcpCfujg3rKLNC7Ll+fCxeR8L0x2JB/3B+HyRMj5P1kkolO753XJRXV29j2auWFTLB3ImXfoTTsWA1fQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731019; c=relaxed/simple;
	bh=hhpxyw9Gt3PCRNLN3iZIqyRhINENxCk+HO4ESr9vG4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueNoPOO5TVjGEoC3pP/Nv80t/8QCypL0qoz7sUUDF6YVnfHyLjezdfcQdrQ/yO8emI8YZIJ+DW5DRZU/SoXwbs0GeBZ7RugSPE+1+tR7YpobWLDEVuSvltae+HdwyT2HwEco0cSI0OncERwY6Ju0uGthQLhGHPZpyyGAF2IWBKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3bSxZBQ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3bSxZBQ"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b3b250621so16455951fa.2;
        Sat, 05 Jul 2025 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751731015; x=1752335815; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIuW9mYDfe1OO55T0B/j5JkohO1wkPFoK07cmUTgjB8=;
        b=a3bSxZBQD28YvPtII5IM7eEZxyYXqS7/9IWa373T4b0mpT9euabTobz6J3BP9HZZ0P
         gHKTxQqSDYNtXGWdaPP2f4rL3SkB3Hi5XHAM1TIDW8+tiRHjf/PS9lu6CQY/iOFUxdBc
         1ADf97jvOAqB4ivbDnZjSKb7SGM8YsmqUq50TwcQy/cat182/uAwGRRyveVSrmIbWgM0
         P8kBD3bS2RRlJwDwKT/ebMYmhjy95AckVt1zXE4EXUS1VJ5HWrWidmf7dUcd4+TboGt7
         pqodiANCIj+1Z8ynQ51RQs0b8SgnZimYc1ID64VElJiqfS9eEerLjgfZOTS93Xjuyg+F
         m6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731015; x=1752335815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kIuW9mYDfe1OO55T0B/j5JkohO1wkPFoK07cmUTgjB8=;
        b=M8gSJGnJrdetQcn7NR2QR3hnoOYvAsOrOkqBUWtcCy2sm0HIx1ZuPKz8FJawycaLrI
         rrXlGM3kW6L/ipdS2XkSRiKf6yWEw0SKYILHAOkD5b2ILsM1pS0KBC9vbD+kbnwapIWM
         3vIwg6d6LTNBvGvPoDZYf3wzqoDcrEkANQrGWwio1OlKSVfiqrN6bd0TyXNpn2hHeaEQ
         mKUkf4yXvzXb/COOAK2JsCzZTbmck4a9vRqdyFh0W9dbAVzjZQ4Tjuz+H9LkZ6KPjPnE
         b5bh+es+h869QAWvIG6c860XMnatac8IZAlrPSiwxOmEEMR/Jt6fwwo9REVegO3CmHkd
         UNOA==
X-Forwarded-Encrypted: i=1; AJvYcCUVNXWKGkJALRjuGzyUYWfnfcoxaRgwHhHPBTU1ZXSocWH9Rr6k1s9+btdSrZCbBj3X/wbxpLD3lq8SYQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP7qotmb7N4mghOOnXLGcXQ8elB70npbXaU0/Ka6QbFHNJJ0Gq
	EvnMiNN4jnJliWOa/E+a28M0K74gmtEast8FIUaS+yj/4sIjLyPEcffkeoWpDV0YsyurOkmwBJD
	uifw6Dj4bleAiFgZrqbdCmYFJ6bFcpefRX9hWEwKPyg==
X-Gm-Gg: ASbGncsnBw8N8h/lBNjMO6JP145hl2V+VkEo+52ABUdjUt4A6DR/92b+zd76iPA+QHV
	wcC4Qfx2jQmN5VZqQLOyp03ASXTX/T7t1hWvN4yVAM+pLRx0JrlfnJu+XyvJsMy8xsOth2LNALn
	shjfiZj9K4daBPTol0znN5+yQaH6ZwyTzC7/4ZTDNQyeywYl69nXZnUsEgcfcaYddvzSYnNDJLJ
	7axUg==
X-Google-Smtp-Source: AGHT+IFJjapQ+hpAJpLx1J8MEUHl7JDBD3MLiEKFP+eMnV56PMUbi2JwbohnEb49nWfoC1O5cxox2QvaewvI/5VRfZ8=
X-Received: by 2002:a2e:be05:0:b0:32b:4f0c:d259 with SMTP id
 38308e7fff4ca-32f199c54dcmr8286901fa.16.1751731015092; Sat, 05 Jul 2025
 08:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704-cstr-include-miscdevice-v1-1-bb9e9b17c892@gmail.com>
In-Reply-To: <20250704-cstr-include-miscdevice-v1-1-bb9e9b17c892@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 5 Jul 2025 11:56:19 -0400
X-Gm-Features: Ac12FXznq6vxJh3hKdm5lxKLvoJwiCZlPoVnC9pRg7NUOBaCaiw_ZeptxofP9EM
Message-ID: <CAJ-ks9nJhBDQtVUGNJVPmtrK6M8S9_Q+vpVGeSLtspJNaaX+nw@mail.gmail.com>
Subject: Re: [PATCH] rust: miscdevice: remove unnecessary import
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 3:50=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> `kernel::str::CStr` is included in the prelude.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/miscdevice.rs | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> index 288f40e79906..8309d656088a 100644
> --- a/rust/kernel/miscdevice.rs
> +++ b/rust/kernel/miscdevice.rs
> @@ -17,7 +17,6 @@
>      mm::virt::VmaNew,
>      prelude::*,
>      seq_file::SeqFile,
> -    str::CStr,
>      types::{ForeignOwnable, Opaque},
>  };
>  use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
>
> ---
> base-commit: 769e324b66b0d92d04f315d0c45a0f72737c7494
> change-id: 20250704-cstr-include-miscdevice-4c5cb26a0ece
>
> Best regards,
> --
> Tamir Duberstein <tamird@gmail.com>
>

Oops, should have sent this to Greg. Sent
https://lore.kernel.org/all/20250705-miscdevice-maintainers-v1-1-9a6b67f760=
2f@gmail.com/
to make this easier in the future.
