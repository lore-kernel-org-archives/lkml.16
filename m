Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B35295D8F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070996; cv=none; b=mwh30ktQORnfenoZjtDBJeatqHQ70SWLDqv0umrrxidwpYCUuBDUf5gAzx5hbgG/1ofAJC0ZqBgyaY2I7fey2UDJI4XgtcXp+tsm6a3mp0GsUnoA3ipAHzzOBbSpUGVPNYan1Yxuk+ZLSG4U2FRwnMZ/Y8Qia7iuBJO5SpnXCVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070996; c=relaxed/simple;
	bh=fgAbH+bqMDdFSxa5Nsg900AieTB/XPyHcssZQxwzQvc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kt8DR9IFCU9giHu3Sg9dA1wwLti0T973Z28owBKBUWUt8PqOI9QAqeFWGoo7EvMI5ilLuJQ9+8UhkF4I0Lhrops/IHSIlydlrhrd5R63chZ5a2j0eMqPdBZXjn+vin2ajnuxghQ+/auIi0yJzw92Vlbnh8BN0f6k5g6eTveSCZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OBcnlKMa; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OBcnlKMa"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so779264f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750070993; x=1750675793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noASFFqKv9QR1JcSSNjGq2HTnkr+7eqAct6g0x+3TVU=;
        b=OBcnlKMaqNC2WOlTeGBmZbP1DYtdgWbUgbvF446lFQZV+9M1F/mYJPw4jjhK0i38hT
         2sLxaBiWaGUUL+azGAhFL7zgpJvqn5g74oULrWoFX3gtf6CISW11jNPRkOtgJ+YL5dAV
         wcgQ5dlzJw/fuWqug4MpRYDfVU5sujAiDB6TiwUhrIvrO1xrTmZyr4YPQ2NwiKQ5YRze
         KvuBYvuveubzHWWKXUJ7PnnhsfMTrwNTDAfrznQCyInKOh0+ZV4HaaBwgJ3B/QLcHB8W
         JuLA/mbHQAsZoeDgxrt8BoBZ/4AlYLfflvevd0kKUgd3Wvk9BMSTxul1yaTSB53Njf9V
         BfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070993; x=1750675793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=noASFFqKv9QR1JcSSNjGq2HTnkr+7eqAct6g0x+3TVU=;
        b=niOG6Oq9dmx6yvhOr0yMd45Kku2vSUq5dwFMCCvecbhf5nApdXmp+97wfJq0zh+w7l
         Ez8QS7XW8MQA+N0Y2+JA9oDaK1jo+wOSOvvUQkZJ/q4Hm1G8JAJArmf36QW/6myfD3HR
         9/u2HoKUYEkDFi/p0eV1O7cqeGetewzSmKX5PuaFUs6XQ7rBMnJNsLo137Di81J+8emg
         iPdzVxRkuny95wvqg8owYa5l5Aen2+kqotBaF+38sFsM/Vx//deu0+lnHXmc0Uy1VAqm
         dY94isJhSNLKb860A0qH4wbTHCcI/jmNdxzJ7swthALv3Fj1vYg5dI1QnzgNqgsYMPTG
         tKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxBC1h53pAknGFxwwwG/VJNEypCjfR7mV9KSx+WZWBUfruKygy5Z5/1IOmUKLc8N6E781n0bRK0Q4oKEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YySYhn68h/P2ePAiHQJx7JDRMQODRGGwOWtbDnzNTZ+ViM+VtpC
	HvSm4fn8+CsjkO5N5xKAFZ40J6rhtw85FVkMitP8FD4Ytmmdrk9inTW9mGsmpCYyJwFTJ6FMmWS
	xLnQVf0n3X/5S2+STfpxCRBX40Yv15K6FvTrOfvpz
X-Gm-Gg: ASbGnctX0Kft5+arKWQyxDSDfEfJe34gIdTngQ8z/VlqxkbGQ39CuUIw7/pHzEjTW88
	KnrBng0xFvZueI2Lhl2Og6RSlTooSH9gznIX/Jc2hxaa1QTiVHn5H7eZuTEetxwdR0YTNUHUdPj
	SW1PC3NIhf8lljx4zJASqOU5fc8hikLqXSWzY3yLnUhaBjqsBH/c8nHFs=
X-Google-Smtp-Source: AGHT+IF5tKVn0HH4+Er7S+XZNod2FyfrS9dHKNqy5QhSTc4SSiK6Xgx8ZEz8Nlngk9yhomQM63HB2J6yh0gSTliC484=
X-Received: by 2002:a05:6000:188b:b0:3a4:ef0d:e614 with SMTP id
 ffacd0b85a97d-3a572e79d24mr7089351f8f.33.1750070992846; Mon, 16 Jun 2025
 03:49:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194840.877308-1-bqe@google.com> <20250611194840.877308-4-bqe@google.com>
In-Reply-To: <20250611194840.877308-4-bqe@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 16 Jun 2025 12:49:40 +0200
X-Gm-Features: AX0GCFuTb5n8MBWBEa5YiiJmxDs0pB6vkofAmmHr2Oh2WDSvt3-JtKcoydHZXtM
Message-ID: <CAH5fLgiMCZuaCSYRDLCpZjaa=EZ=Zaw4y54zDED-7ox9K9++2g@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] rust: add bitmap API.
To: Burak Emir <bqe@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Carlos LLama <cmllamas@google.com>, Pekka Ristola <pekkarr@protonmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 9:48=E2=80=AFPM Burak Emir <bqe@google.com> wrote:
> +impl core::ops::DerefMut for Bitmap {
> +    fn deref_mut(&mut self) -> &mut CBitmap {
> +        let ptr =3D if self.nbits <=3D bindings::BITS_PER_LONG as _ {
> +            // SAFETY: Bitmap is represented inline.
> +            unsafe { core::ptr::addr_of_mut!(self.repr.bitmap) }
> +        } else {
> +            // SAFETY: Bitmap is represented as array of `unsigned long`=
.
> +            unsafe { self.repr.ptr.as_mut() }

Nit: You want NonNull::as_mut_ptr() here.

Alice
