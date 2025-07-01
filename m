Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F3F1DAC92;
	Tue,  1 Jul 2025 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394160; cv=none; b=cqcllI6ddnN/LSxGGN87HmDvAZ2NfHp/yVVdabv7evAw/W9tS/QxuqB46jL1MejJIeUijJMz9OgBo4NGRvVkk6yI3/DXZ+iQr3xSNWhPUlO0NEPLvkyKCpyfJpXtrZl6mez1Yvx8SL7wMeMJHUxRzbDEDiNmWCZOzyKsdJmqfac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394160; c=relaxed/simple;
	bh=f7feyZbqFnUvKhIrH9MRCpcV0cuiz23HfMXPNg5rc+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVvXUZuagMhDk+DvbYcFEtN3HEbr43x4vnkvT16bFSvltLwIb2jr5G8uzLUFTzhaBkqDFyLC7i7ij3AHgSKsedcSBkaSK2yWVn2lZyL2u2SRI8PHrRxdTHYP5s41hps/7nO9s2L6s+EnygpC8oFFArrdM7ZPikNbcRVkHlWLfEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZBwEnWJ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZBwEnWJ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2700de85d0so719988a12.2;
        Tue, 01 Jul 2025 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751394158; x=1751998958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qu7fiPQ8ufgla4BGUCGgMC77/7jILADTJO50RKfZ5BE=;
        b=kZBwEnWJ0fDKv6IUuywPMy5JaP4eeLQMHyy77HGQVJ4j98WlhrgShcTWWSxrutXHdj
         Bjxc2hG/7YuvV1e4NFbvyWXGaFmT8jsTdt4OOs2E2IdW++ZtmyXQThhVoa6w2jFK9A65
         M5u8AvJdO7vYl5EsiQbkmIbNF5GgRTgwbOric+j4fFUq6jq/vEMYRyoXfEgKUS9LaFwo
         WJibs8utHcppcd2wZuOjFfhOv5cNVTdifwnk2iUKCQi8uf0zAuOO9bEQT9MdsvgYNUps
         /I5gXW57R7NeJcFdfiUktySbZ0HOlQJbsyuUKGHzQMpdPkCZYr3MnKy5XqS1z+b/C2/3
         8c7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751394158; x=1751998958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qu7fiPQ8ufgla4BGUCGgMC77/7jILADTJO50RKfZ5BE=;
        b=GHxLRFwFy5mZhGCjuzM1hTWRFdzI9taKi9B/bCrVJbtn+KKnsXt5n1P5um29MCxYad
         FRI0cH6JTFDL/1fw6Ipl9ckdxqtiYa5MZ68hnWyCkxVwaqJ/it+1cgPXgwz+5oTxCW72
         X31Aee+kPSyjpb/mklFlfl3382ds5VNpfVa2IqQ65wl/IeKnhg+qlq/+vIzgRQX5JrCh
         L4uRbLlIlucvVRfQeyooXnJiTK0/4vi6UGkzIp30bMOyN7YVbArmshn+kQzrFH9pmWpN
         vc+SR9Xy31UEQla30BcNej7cRniiBk6H+n9ejUQhTqIMa7lF8CUzP4vBm04xKcrrF/Iz
         +4KA==
X-Forwarded-Encrypted: i=1; AJvYcCUvzVskN7zDzA+5CVO+6ZKrCI7rFg8236ZLfnSQG+XW/d8Of8WKFYSPu14Pexhhd5qY9A3WxsDt5o1yzz4=@vger.kernel.org, AJvYcCXrE0NixsHBqHRX1TDnUGbH49VspsEDM9NIaXjhUj7Vac1T1PFp+/2ppNcZiHD/IwxeaJMXtOm1tgdSbCUrdKc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzByrfMhc6/ptSKhCtChWcrS+IlzwYghmrt2LxDN8FeStzLVRLy
	nvK9ib14H6qKFPVQEMaSsNMRZzQpnPjN7Yc78WDmc+PQ8rMVmBuA7azfaVzQCCe9i9m9LhjD4Jt
	oM9BaepRRjFyCQ8227QgQxGOr9c1d+j8=
X-Gm-Gg: ASbGncu0aq4YKUmu7p/Jmfu/PUQBExS6m+ump3iMZp450Kql+0JABRh1isXSlqbfG/C
	OOyWUICGLZN7UbYZuHapO5FEH0/aKGe/Xqf6tyNwLeAzKYn8ig+6UpM2bGjfdfJzp/QQAuimif+
	nKBbE1W/SBubkyb1o1GTtC0aQQTPfdkkpdXa8/P3o0HUs=
X-Google-Smtp-Source: AGHT+IGsZDJVE7SLVT0ZueRvMKLAWm42NVfQUAI0lInXAeUlVTIfHdS1ktkkgLLUWdGI3kFrHoOrtm/B/nzqpVXS/Bc=
X-Received: by 2002:a17:90b:2691:b0:313:2f9a:13c0 with SMTP id
 98e67ed59e1d1-31a90ad00d9mr29927a91.1.1751394158081; Tue, 01 Jul 2025
 11:22:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
 <CC8F34AD-811F-4504-B625-AFD845198549@collabora.com> <25e9a9b6-4d81-4731-98fa-add40ccd4aab@sirena.org.uk>
 <42FAAE27-E6D0-4CA8-83EF-5E4F9199FA9C@collabora.com>
In-Reply-To: <42FAAE27-E6D0-4CA8-83EF-5E4F9199FA9C@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Jul 2025 20:22:25 +0200
X-Gm-Features: Ac12FXzztpSLycdA52D0LgpHNRnbb3JdrczyPJGu4W6KL24y6z4k0tw1hQQXeqY
Message-ID: <CANiq72m+RN9-VRzRW_O8P9vAi2qvkN1tgfdkDONJQQCXbVXkyA@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Add a bare-minimum Regulator abstraction
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:10=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> Well, if all functions in the regulator API have stubs, then perhaps a tr=
ivial
> solution would be removing this #[cfg] from here:
>
> +#[cfg(CONFIG_REGULATOR)] <---
> +pub mod regulator;
>
> This would build the abstractions unconditionally, and it would transpare=
ntly
> use the C stubs when calling the C functions.
>
> Waiting for more comments from the other RFL folks.

If C typically provides an API with stubs because users should not
generally care whether it is enabled or not, then you should try to
mimic that if it makes sense.

There have been similar discussions for e.g. debugfs which you may
want to take a look at:

    https://lore.kernel.org/rust-for-linux/2025043021-plaza-grip-2916@gregk=
h/

where the callers didn't even want to get a `Result` if not enabled,
and as a result of that, ended up like e.g.:

    https://lore.kernel.org/rust-for-linux/20250627-debugfs-rust-v8-1-c6526=
e413d40@google.com/

In that case, they ended up with a few `cfg`s, e.g. to optionally have
a field in a struct, but in your case it may be simpler.

I hope that helps.

Cheers,
Miguel
