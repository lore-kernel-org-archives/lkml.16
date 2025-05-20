Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D1E1D63CD;
	Tue, 20 May 2025 21:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747774812; cv=none; b=ICPejCxvDVolfMPVJ0CcyrnJ2oKlfbNqhDQHIm1/hf3YbUAS7XKdIVUiDAsGsnyAmQaIqd/2c5cvav0Ey/9xtQ25RlcjCWRigkEJmv/T8NjpM2DseSf4y6K2/PQSFiWNXzEqFC2VVEACD+ovCFsbZ/q5mD8lgNF8/ZUPfgcBxlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747774812; c=relaxed/simple;
	bh=TCmfgAKEiuy8/eyQDVpqiioQKWp1uFsB8qyasicF/KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVtBRD3pkgcbTuge7Jc+2iHe8SQBLyZeQ1VWVRV6uUOzlZN0geUcvnvukDZ1BKPA0K2BQvqqVm5IQ9NSbMpoSGKhb2OEMIj75CKkpKcXjZp0UeWU8dmalIxB9kVkbcXpY8rniPAUdCANJb9EFzJ3otqSsWCd1WshhO+wMmrXI2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jfjuo6MU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jfjuo6MU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30e85955bebso809032a91.0;
        Tue, 20 May 2025 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747774809; x=1748379609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNW/X4RcAMR00pc7pYKVE9xKzvAbJyjyooPntVrY9n0=;
        b=Jfjuo6MUsBJjObo81LmvHkQJGAowa57JWpihgM/OzRzfwet1gGyLsAY3V1IwZ+IFJ/
         8gwcOODrj5Q8ty4hj5fTod7u+5zjFGW7vPMcLeMEWxFEydhIBsXH6L5pYAoPH7OsC89z
         K7GwhCYkJoSxw/MbD3qUH4al1oboh4rT7pCL9ZIsRStFIOUKhIqzvFogpz3VU2AFQUU+
         TyGlURUbY7SfS5dBIAG+6N/PKkyr9M9ttsAVuoEvBNYfTXoLE0SGMJDQjiRqIFvyIlLM
         z9hnXepy8wMZbUSNaRGubiMX3zqvr5EmmQRQuRJq5irdtOaMIIwfG8UVuzgcbHKp86tw
         Gy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747774809; x=1748379609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNW/X4RcAMR00pc7pYKVE9xKzvAbJyjyooPntVrY9n0=;
        b=nuBe9OTDk57OFVc6I4uI3y0H1Td1uOIo9VJmjkq1IwwbfZKi+/T1SJ6Sfo/jazXsGZ
         o9/ID4GEYzs1smQ+Nz35Fh1KtWUhdkKk8qSUjs1c2uGO+Vx1dU0Gm6qY0+uhBqsd5Hrv
         vdf1WBw1a5TS7z+MbIzWD+OYAPAk0GbBCv1mqrScKMbmdpRnJj6q7dHx6wUWj9KB0gWX
         02s6N9mfNq9PJp8+AO30Wo8QZPZrM4ZPXgKPYtLYCl0VO993oVyoNORaAlDx19UW8KkX
         Mn4taLHBxboUCdBjHrqAH48y5JoT03hFQbv3TZBYUi+gzR1v66ObDB9TqxshZz5FiQUC
         7LNg==
X-Forwarded-Encrypted: i=1; AJvYcCVYNO+Zu2GsiYNi8//S7rORlBCH00GW177B+Iw4YfCCyE1IJzrGgtmDFLtvTWBWaE1RtSOwuEkhjoMEtBm6DYg=@vger.kernel.org, AJvYcCWQG5bDk3mWqn6SPHWm3T0DkFVQTM6Flt2ig1rhR3QwjGTgXBOUmFvTxpljgGVt3Z+7b8T6c+vUTB4MMOU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yye2e2mFP+o+khuAf64Jz3SVdiet0d6nTDUH05EZf1X5hoe83Dq
	gYrouGBIVHW6lRHOXSaNVYB64mqGLlBn7Bh5emjpqxF4RGpYws6S12pjo81mJJO3HSlSYcHljWi
	TKCP9uqNQl8QtRCwdTztyOQxIcp2lpxU=
X-Gm-Gg: ASbGncuyYua7ykc2xjlATkdysvV7YJYaFbm+cj++Al+Ui0OriBlduaVZf3U78nh1HrG
	Yo35JlG6ZuXPapxP3V8Vz6XZUw8pnXSYGXzz6DdzseUyGNnTeGUW9RPXWxI9tgJaLQLyjUCOYpm
	0DzF3iBh1m67ppTUsZMFWcPtndOZ56Vsgu
X-Google-Smtp-Source: AGHT+IF2bLjXa84B5EEHkuAl7vZvZNneAE31l/O3DlnlI+MPj4YtrPHRxAExKVLianfc+MOvdwFYTRUrtTP4qw8S68M=
X-Received: by 2002:a17:90b:4d10:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-30e7d2dcca2mr9936919a91.0.1747774808939; Tue, 20 May 2025
 14:00:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519143952.11412-1-lossin@kernel.org>
In-Reply-To: <20250519143952.11412-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 22:59:55 +0200
X-Gm-Features: AX0GCFskJg9LBlxaS4mlmJ0G638iLQUypFdssJC0xwRqgjsToyx07lBt4CZ0eJY
Message-ID: <CANiq72nOyDKY2JLHR0dY=3Yg4KL_7ojajLJ_WE5qjNQF9=X3Fg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mailmap: update Benno Lossin's email address
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 4:39=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> Update Benno Lossin's email address to `@kernel.org`.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Applied to `rust-next` -- thanks!

    [ Fixed email in `.mailmap`. - Miguel ]

Cheers,
Miguel
