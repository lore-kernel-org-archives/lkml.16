Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C261C3BF1;
	Mon, 12 May 2025 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057792; cv=none; b=oaoWuvIz7n+zsrpEaHbemHW3tSjvYoefHlDItavsNt4FIBuV689haLYu4xCIA5GNJ/F7PjVDvzozu9jKvuyYFTiIzil6Cgeq2AQHMyZ5mcjh905gtw+Q+SmyuKzfjqNekx3iuJK4GheF1ZJjKG3G48LpCvqlVEuDEU9DkrKOAhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057792; c=relaxed/simple;
	bh=BwKMHNk46nx0iDLRjjsuetWJO7bT/ag+FjZ3BGd5c1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imDglM8QZIo26tk6/gGx9SIK8aod8zZcSAbm1DMUpiA/JxJVMhCA60IKh9Qw5XsKtO6CZkFRRMhDi1ljzRPM9GXtnMF/o1v/OagRJCbGG6Ldp/8bK+brvK209UvbAPR30PvehcDqLU0k/hiTY6y8AIV2a5CR7VTzIU2APUJ8cSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4Ox4aBA; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4Ox4aBA"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af907e48e00so272271a12.1;
        Mon, 12 May 2025 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747057791; x=1747662591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONr9pUwOkrrYsVUHFahI1KAKvWDR1kObJv/cAcfXBKs=;
        b=N4Ox4aBAd4scFKnRR7bqPqv6XzdFJfV+H8bU96sl/PUKrutkvdi1FXS4JelND+qn+O
         2QeQ2YCXk6/NV4dMqijNWnpTmwHNX/zop2F8qa4Xyfy0U4ixz/tajZbgK2xcsFX2yE9v
         gzGwdkkR1oyDAuVIw/dYxApzkQuiOqarzC83J9facpA6T6liYTZl9PQrmQoWsrD3oSMM
         5Rr9K0Ui0sQxiQ/i2wM096u1hor8g5xHnOiMP3pmAdaIz5cK5z6WcaL8mKgsdA3/M5kz
         CSO2cRMQqhaqT9EqPqTA0sSHNgx07lrU9pUsOSacTBHnLjfjPnaTzwbOtrF9gp9Wh4D5
         eT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057791; x=1747662591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONr9pUwOkrrYsVUHFahI1KAKvWDR1kObJv/cAcfXBKs=;
        b=Sdk/kkbzMus9+7suEW3lRFeEYhcRk9gFA4li41hgxV/r8eDGWiFEu5aPl2ty0JkK4s
         /ULUzjIoDqnH1debykowBSWbJxl5EgdJU8OXD3twrGcD3OQP4ztkctaPiGl6xKmEbgsP
         RkFhMVKlATLw+oOHtv7yx3lSynDi+RjfpAktQFi5kodnV2BQWiZZqGAFg1XC0ATxLAKS
         LMLwTKVaR1qSPdv5+fA4kryd3BEoRQmFtqSBtykZmhb9+aPacupljidrK8S+BuqiGS3s
         JcvXmvr2qBSlzSR5LuVS7FRj45lwV1vVnYa9FCqecwEi3QjatVDfJbmHvBTYfWN7+hlk
         WBzw==
X-Forwarded-Encrypted: i=1; AJvYcCVp4NfpjfETP0uoJLVIG6dooPVXO2+Wz228m/g5hyO7U/13W5sImY5ibgAH0QlvQ8RHjYmBDDqNzzSRHPc=@vger.kernel.org, AJvYcCX5P1/AJtEjJmqoMuWQG9rNM9Sld022NX8a3UWqn17TUjMnI7EQ8l5fsFV6R4jDjkSe4mLFF3GaFEaPFRXPzEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCDv6PyG2bbWlk0CUL05gCGTyVVHlVqWuDPT8tTLSCGQhk92a
	4n3u2+amxQxXVqZ82ckQLsb2JnbL4rT5mBAfSoM1bz1FV5zDhY1nkFdWufOJYomttdjJr4G1yVY
	7ih1FDUP//lm4WE7b5dlJUk29D54=
X-Gm-Gg: ASbGncsOwEGGspdIgif7E0vaMg16ZLzbEWip4d1H/RoBp7hBS90+m2wnxXC+Iegvio2
	sHelOglzwz9FUcQvufJkYsdtie3GuR3A+li7DQYBe5Ojd6DuguBRYKmtk9+QhvGo8uQu0ANqM8p
	1epmkvdWRx7m4uDREDiVM64TiiNl6VDv7AbhpEKBnAK/4=
X-Google-Smtp-Source: AGHT+IHIl25ChJIz78mbrp/wCk/S79hnnperr7Lp/0TI4fOTmWRRNl7PkRoCoOqHLna78ZBwvPPDoZZ7qG9tueIxlM8=
X-Received: by 2002:a17:902:d491:b0:223:5525:622f with SMTP id
 d9443c01a7336-22fc8b0b64cmr67620375ad.1.1747057790728; Mon, 12 May 2025
 06:49:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327211302.286313-1-ojeda@kernel.org>
In-Reply-To: <20250327211302.286313-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 15:49:38 +0200
X-Gm-Features: AX0GCFsycteckP67naBfmZSgXZjiR08AnYUU9QZvM7ex2TtZdM9R3s2AEMWWHjM
Message-ID: <CANiq72=moB37Kj7kLrEe20hXXYe9q5A9==EyAy+SOPb5mY5HxQ@mail.gmail.com>
Subject: Re: [PATCH] rust: clarify the language unstable features in use
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 10:13=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> We track the details of which Rust features we use at our usual "live
> list" [1] (and its sub-lists), but in light of a discussion in the LWN
> article [2], it would help to clarify it in the source code.
>
> In particular, we are very close to rely only on stable Rust language-wis=
e
> -- essentially only two language features remain (including the `kernel`
> crate).
>
> Thus add some details in both the feature list of the `kernel` crate as
> well as the list of allowed features.
>
> This does not over every single feature, and there are quite a few
> non-language features that we use too. To have the full picture, please
> refer to [1].
>
> Link: https://github.com/Rust-for-Linux/linux/issues/2 [1]
> Link: https://lwn.net/Articles/1015409/ [2]
> Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

    [ Improved comments with suggestions from the list. - Miguel ]

Cheers,
Miguel
