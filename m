Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7E21A071C;
	Thu,  6 Feb 2025 18:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738866036; cv=none; b=OhGKncs5h22FuTxkVswB9q67wAosEk92N4ACuUDB5GfOiGTkmXmPpPRd+B+nNMyItENfS7rekivZXRhDI2FO2zPhiCXhtGSkHGfzN59UNaOXdBdwIhdBHOsHn9iA6ErMqt2nn1r8Vj0tcavJOPONNqW7tDt5IzZX7I0ndnzETdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738866036; c=relaxed/simple;
	bh=bjR3GSMFFSZYCybPUhajVdcWFFbaKLMJ/3DrRBWH9bs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvRFDSk/pJ48v7WoysjPTwFYuIZWjBF3e/25xlcFsQyzfR4jVoMvZpG0/KrUrPh247CAOiwe22jMlAZMBtpR7PJDTZFvUP2vWXn+X5V4TkSVltQJK/eEpwiWYMJumJGbfzEjfzQWVpPDBfZTGiqgrKoq5OZ1LHS2m8lESNxlyPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQ6zYsc6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQ6zYsc6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa1a428f6aso120682a91.1;
        Thu, 06 Feb 2025 10:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738866033; x=1739470833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IREsyOA/jcDv51eqhhOAz7HNwCH8HVyuTl6Zg2BaEg=;
        b=WQ6zYsc6/GfilrMTiTN2Q6fgfbrdi+TFq3uj4VTUjb1R0JgaM31wMU3MieHpRckghe
         RwtkVb+h8xxiGjqFM4YdcbhNXcUsKXb8gUU/QrJ1PRuxXIMh7LF7akkgOasIXfW8SWyX
         fii4ZqT9nke+Pe28rjnT9NTrHI3vETtS9sTgqT4yezKaynetuInwezj32lcdA2gmC6sW
         gdOJEZH7U0KZYKPfECR7iEMC5z/hBygIlkwH9HljCj08Bq9c0WQIjk0fjud+urM04wDc
         PCS5MT8qNnnRevAgi20UX1vbWHbALIPtr8CprVo/YKTpPMgFUpDQ2mQK5ZmPjY8ea4It
         s2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738866033; x=1739470833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IREsyOA/jcDv51eqhhOAz7HNwCH8HVyuTl6Zg2BaEg=;
        b=bS/ENPYoolzYreArexTRzvZ7Ia2UQoJNtcOogBltgwBiFzqy2a9oLlx8PIXOaaCV60
         Q30/yxQPazOJL24S+olsv8sq24QMGsFPbg1ImDiahC/d44kx1f0G62NwZ5Z/UsIkhOSA
         WVs9e1bejWGCy/p+BOn0Rl83wtl4fFn6XayKdFd+SBIZWKxHm/ek+EhFXoxRz6VzCoSE
         aIeagvu3ZsPpLVoSNGXWVkHZXeKgbvQyNKwQaSZwNPmRU/A3gZnjHIz3y+3OSfu7C+WK
         gExmtz9X7B1SnEfoLGAA9FTZZfzBpA5G+T0Uv6nU7Ux6HX+guR6XLFfY6rMiNs9V3IP+
         8IYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRV9pMhUT7QO0NH1QR/lyZomiDHjbECYWB9kdLLKhBS3RntjkP4Hl0srFPzrA9FIzWX0xEgREJJnboeJw=@vger.kernel.org, AJvYcCWe6+ll/IPXX/lLaWPMtLUKjHounjyP/3e/3+W1wWmixzfE+pIi2HRWPmaTGN8vKqoP0+EymwqzbdOOhBvkEg4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6tZBxCmUUtkkf/PVJBp9pAiwwgOiYTYtYdLAs82cmXmOADWNB
	rnfMseK/uCTVNDEfiAb+4QsHXdOlBigUQhOkSj5pE5qrU6uPfNbs4mgHynpXrziw/ZEZjY3DqqC
	0Xnt8dbs1zcRtzwsA035iP3tqtQA=
X-Gm-Gg: ASbGncuogu+EjZUBnR76y4ZVkzYM269A5GTceBzX1PK44/fZlrV5Yu/8x9WUHEff5wC
	NbB0JqrNgGGKEM+/qDWAr0HwhSvYVjtgFgmVKi7w7RcCIqVvpi4q4ViCk7tDYTpfda7FmV/yw
X-Google-Smtp-Source: AGHT+IEyLbANBJQyA5ILGICFvQ2vMxKNRXnI8A8+uzucw9F+g+JR+GxTJU8j5vpteiu+ih7ozLZ2v5VxDCkxL/j7ZmI=
X-Received: by 2002:a17:90b:3b4a:b0:2ef:c419:6930 with SMTP id
 98e67ed59e1d1-2fa244fbb48mr1399a91.6.1738866033134; Thu, 06 Feb 2025 10:20:33
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-aligned-alloc-v2-1-5af0b5fdd46f@gmail.com>
 <CANiq72nH3N9UMu2hsPG7WfYCZQwy9M_4q_rQHJnJMScQ3D9-Jg@mail.gmail.com> <Z6T5sOWXxmUsflW7@pollux>
In-Reply-To: <Z6T5sOWXxmUsflW7@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 19:20:20 +0100
X-Gm-Features: AWEUYZkbY91BAEYFX4AXNub-_ruLyROQHMaEng8J3mYMBruxN3v834JxG5Y-xRE
Message-ID: <CANiq72n7jx5ve9UL3oDD08=PjY55QHoMY8fyfsW9RNEvjH_b4Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: satisfy `aligned_alloc` requirements
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 7:04=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> I previously checked man posix_memalign(3) and it says:
>
> ERRORS
>         EINVAL The alignment argument was not a power of two, or was not =
a
>                multiple of sizeof(void *).

Yeah, but that may not apply to `alligned_alloc` as far as I can see.

Cheers,
Miguel
