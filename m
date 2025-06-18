Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77732874FD;
	Wed, 18 Jun 2025 11:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750244629; cv=none; b=PBdpHJkAlisMDPkzoivjw4Ei7R6Z9MynM9/1Lx2CFeUTPdxZbD2IaRJIeZVHDiTYYVGfWUWe5bQMU3c1Ka6jx8zzlJCH1Ag/i8+Klb0NPkxCvEYLwGIpde+HykoobMPjodk4ZisRoApcUN2shoXDxvDvVEZE7qfyE6wuFaGZcr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750244629; c=relaxed/simple;
	bh=hZ//ufCBtn8z9nAqVKXnEnt6bD2qlLaA/8Jri+mnetg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRf8tmdFJQF2jURCKvX5pyjKWvlurR0RbZ8MwA7JBZckUl8kwaH/TcQSbN0DeLbHsZO9TQ5zXo3ubid1glr2IdezUJI/uusVkuBo9DaahJ9kReUOnqGoogj+3dknT8sxvIzhV/4HZQnjj+REMG6h/AjLxPOrabQs0laHod+7Jkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoriJgvv; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoriJgvv"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313fab41fd5so854553a91.1;
        Wed, 18 Jun 2025 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750244627; x=1750849427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZ//ufCBtn8z9nAqVKXnEnt6bD2qlLaA/8Jri+mnetg=;
        b=aoriJgvv5ON1rUKyC/7w0jkdFcBBihsSTNadbiNtedNMpyshES3EUsk60vTNUzgieO
         NnF/W31QZu1yg5UZRegf8J4POwAee9z/X9fcQDJC69R+1XxWscfhXOKRg+K7vOuGvaUm
         gaSA52j7GEnI7LNnvWT9sgcQn2RG5bMojhi8nCxwEKLJ0kBsLe+5xivtXg93g3FxniYl
         ZXPEhLRXXcacT5b5b27qs48CllL3e8HNCqNurtaazcMDgYfdkYNjMeX+w5UQsCNzi+je
         LOJIRFuboh/ERaCyeIxnopXk86denvZx2/0Nf0gj2hdBG+Kh0oxWMfSlfi+L9Q/NZopN
         ClGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750244627; x=1750849427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ//ufCBtn8z9nAqVKXnEnt6bD2qlLaA/8Jri+mnetg=;
        b=XLZ///xcWOLZTBkk+TnM2ir8sTf2l6ITc9MRrRal0i/R9c+qMQ7Jf1Z8VzX+oeQ4uH
         5Ev3yRy+014rGCLEj9HmlO9a4hZ5PWSn42x66/6w22Qlmqib1ii91LHVp4N1DhpsX4KE
         pUjhlB1JPBRULEA1pTECPVpryHjzwADyVR0lGZvvGTlypiYCw1mwlPJZRbkOhyGqmB2H
         af4zkw8/8NQwQ9y5zyYz5OMmSfDa9o8jvjBnnFDE6T1HKqrc7pa6J/M6LUuVf5LPw3ju
         w2dPXRrPvZT7yAWMasma4E30hFty6LT9hcwvZgUMz8wHjDm1hXDYSCsG+vPwP7SOode/
         1x5A==
X-Forwarded-Encrypted: i=1; AJvYcCUmD4zg9ABg7x4c1XVH2Y+Gkw0XZhifiN+WnUtGTL1kv4HlG9rP11SqPRVQbZHsMmAyvtfBc0uo6j9AQ70=@vger.kernel.org, AJvYcCWMtsb8YPyzkSnhtrIkJ/fkwsEWWwjdpda3+YusEWu3iJu2uS920RVwZMktSChK9wkrz4AsYlNuwf9xZDHR/Oo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+wS2MfumSSdtbIhdsLoEx1++h2aFICCNNAjrQimQn0sw13kxa
	12p813lB9wX/cj3HJEGEFkZiv1p09LlSfb1b0VLTcO5KZ6QRkqgFOr8LxO2C9Meo77jqDI9QNeK
	9nVNf0SHYZIgSbUi2QftVe2orumN3AuY=
X-Gm-Gg: ASbGncvg1nMNlOgff34LaUpHGERhMt9IVtnSOHg48ZpvtxiokMJmHJuKO8ft1Qqqsg0
	tJWWDkvPnK1swFd2yOtczz6pS+M7sDLTg0g7E+5PotvBtKViH+E8yQNgZwR6uY645tVr1pCspeJ
	wbRPSf7vKP1IpeQmei7hug57fYRXxaMHWXOwhjxWSuciFvclnDNK0v0w==
X-Google-Smtp-Source: AGHT+IHdVAgpDLYXKdj6LARAn8nUiSBgEm500orSl5g+S4h4TK9HxSYIswh6ny6Wihj50cTDGttguWEBBiqJWT0qjjs=
X-Received: by 2002:a17:90b:57c3:b0:311:b0d3:851 with SMTP id
 98e67ed59e1d1-313f1d564e0mr9203701a91.4.1750244627028; Wed, 18 Jun 2025
 04:03:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
 <20250617144155.3903431-2-fujita.tomonori@gmail.com> <aFJzNCCERjKHIVty@google.com>
 <CANiq72nP+dKugMv3KXdJJsFE0oD01+zYgWbjz3e04kmhj_5MbQ@mail.gmail.com> <aFKMXqak-mHraxU_@google.com>
In-Reply-To: <aFKMXqak-mHraxU_@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 13:03:34 +0200
X-Gm-Features: Ac12FXyHD5p2N9gWCUhe12QKnZLU40LeJ-sQl7GXl5Hk7VM-4mwk8FIb2R5Mnpg
Message-ID: <CANiq72kSfHTPeRQjhHKhdw8zuozvNy50CJjTuEbUnW_3j9x8tw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods as_micros_ceil
 and as_millis
To: Alice Ryhl <aliceryhl@google.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	ojeda@kernel.org, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org, gary@garyguo.net, 
	jstultz@google.com, linux-kernel@vger.kernel.org, lossin@kernel.org, 
	lyude@redhat.com, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	tglx@linutronix.de, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 11:52=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Yeah I think using as_* naming for cases other than borrowed->borrowed
> is relatively common for Copy types.

Hmm... from a quick look, I only see a few: on raw pointers, `NonNull`
and `Component`. But maybe I am grepping wrong.

There are a bunch on unstable and private stuff, e.g.
`ptr::Alignment`, so it may become a bit more common over time.

So far it seems most of them take `&self`, which seems to align with
the guidelines.

Either way, I agree that what is important is that it is a "free"
conversion/access/...

Cheers,
Miguel
