Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0262528FD;
	Tue, 20 May 2025 21:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776398; cv=none; b=AryAYn+i2jKDSAIzHN4+clAT4V7+wbOJFMBBL5L4NSlJud1663iiQRa0slparMWqGMgflhmAhfLye8RmCpPDjSyhLS0ahmaRnypjOjTFOxC6Ti3CxpE1sNhn4peU4M4IbeYdeVRlF1FldVpmCn+zzC92JDI5aeEkeUrY1M8WsXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776398; c=relaxed/simple;
	bh=nQGih8zxH/VoEsswrvKaa1/NqFqGIDNLNQwrrXd1bfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GaI25CzrP6CQlt0o/I9uECkWbO5XGtC0rheXWVQde7KZb4/UQx9Wva0aN4+6ebH1JoHMzE1fDZOvYavvxTS9jqmYEFPARAFmavc6X796z8JWdKb9x6HfkD6O/vWzHE0IWNzcXFGViJuMyrfrTf8QMFgr8jlTUCfIix7hYYeeXoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNgvsFW8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNgvsFW8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-231c88cc984so6646785ad.1;
        Tue, 20 May 2025 14:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747776396; x=1748381196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HS12UrQYG8FOz8WwBWci8HxogfBg3U2CIyyf4Uw5/Ik=;
        b=ZNgvsFW8Jhsh5RXneXAlTjWpEc67XuVkXqK8OEAoeVWZT2LBbj92tOPTQ7sTTHPpeG
         pS66Qdvs7uBVbcz8bol0jOGQ8fjoU0k568LZ2dH6THXOyXtN+ODwVAGlKLvQtl+TXpRf
         2cRZSi6LMHJVUPwP3U5M4HMA3W0nc8FOc5StVR+QSsuwVGODcskriNp2IxrPO1dBvLAa
         O29CG2t7R4Czvrj13XiRBPNUsVIyfdBRWWGZvh/3ELlVOre8UJC2fFEOYo3Q4Hh3q/Jj
         Wu6Yhk5x9IDb3C/efGklkzYRQfe+h8l5+B6KbS/JT7MA4TiR9hZ2AjJSXsXpp9kcpXaE
         ZBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776396; x=1748381196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HS12UrQYG8FOz8WwBWci8HxogfBg3U2CIyyf4Uw5/Ik=;
        b=A0Kp85KIZyQ+c948Ka5Fd4TJqg9BO/jJKwq/RTM9jgwJo+iHsjmGSy2nkJ0mu7ImLq
         iekpP1g5jfef9Vc2X5E7xy+peRfeba3SULcPdA5nUurm8Yl4V8KdwyGwYOHiHqYWtvrh
         hXa4Ok3fnhU8GUr7y/gWqUUT0PL2qMuHCz/CICJPs/9RWrBhKJw8bPWgNSj4HhlyBA6j
         HXbaKwkixWmuUo21t9JB5NANxllXPRKd4Bh6tLEFyxv3Khv9mSDYujOmFaK859bTEI0F
         J++GZ6zXmtzQ+BGHnnQ5vFCsaCqcIcGMe5Em1ZE473nXDm5wFZQQvX2/eurCyFM8yh5F
         TGkg==
X-Forwarded-Encrypted: i=1; AJvYcCUKXJuTgTNWMUCymJ85w25L7+V0waDKN/9tXyno3RqsB9CwlIl4JFUGjoDR7e9WMCiNEtoM3juciAONRZIP8To=@vger.kernel.org, AJvYcCUX6uIkC1fa9hQ8TTNc9IfsJX6JN2zxaMxoyVULAAXjON58XBPSEPkaPRqXRXLXEPIFOAQTKR6UxajRcdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYLAPLIhA4gHwui0BrKbaJD0/RqlBn4xOG5GDdeJDghuBIXWKI
	EC3dBWmpZbqCc/XBM1K47DyZfX5ZI8cM2J1mF6Bd562ej9GoGI7Do1jdsxAJd0f5GOs8pHD4u3L
	xVO9NtzTheOQRACzXUjw0NHg3GZSGE20=
X-Gm-Gg: ASbGncskm5BRMKT8r5dlH5ltr/9M6czIisx5Ba27RSb+IXwUbcb3HWFCwt9FoNp3exl
	fjv0TtQxhiqai3y96sAj/OLo0Rs3DsG4SDHHjJ7DQ+tTSuqCbZ1gZDXc/YCYNh5uFABhx/hdc+m
	UGjEpIBZWUrMkjxXzShXDoZFCMMdsSeBnf7au3YiFCoyA=
X-Google-Smtp-Source: AGHT+IFe7MmjlmtUNXGOQwgtb0GunBupn24MRWKrlZVElPHZgZU+iZUAdlM7xHeK50gn3/K2wWFs+xCavEyfHI6B4rw=
X-Received: by 2002:a17:903:2285:b0:223:49ce:67a2 with SMTP id
 d9443c01a7336-231d4502e3bmr89430325ad.9.1747776396506; Tue, 20 May 2025
 14:26:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com> <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
In-Reply-To: <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 23:26:22 +0200
X-Gm-Features: AX0GCFtV2Jx7NnypTgqMG-mZr9OtcqXo72rNX0dRAhFEUfAeCCyratYCcrsBNPA
Message-ID: <CANiq72n0EcibX3Vx95tiPEkd04DA4hjY-TJQs9YSOmHj=VZ_5g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Sky <sky@sky9.dev>, Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 11, 2025 at 8:21=E2=80=AFPM Christian Schrefl
<chrisi.schrefl@gmail.com> wrote:
>
> Signed-off-by: Sky <sky@sky9.dev>

Apologies for not noticing this earlier...

Since this is a Signed-off-by, the DCO applies, and it requires that
the name is a "known identity":

    https://docs.kernel.org/process/submitting-patches.html#developer-s-cer=
tificate-of-origin-1-1

Sky: is that name one you use to sign paperwork etc.? If so, that is
fine (and apologies in that case!) -- please let me know. If not,
please feel free to ping me in private if needed.

Thanks!

Cheers,
Miguel
