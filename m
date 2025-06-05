Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9C1A76D4;
	Thu,  5 Jun 2025 05:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749100850; cv=none; b=QfTyhk8lhAvggTiPyvR1ajFYU27pVCgfUGXT+7scZhPNBPYt2QOlSBG/Dm+hg3UFqi+tt2c4xrATeP43l/crx9eB3JuaMwhi7DqkgGV/CB0vaZCw6hKZLnSZm3dUPMlJSG0s4Bbf3YDb2fcFO3Y4QlAG0D2mVFciOPY1mRDsaMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749100850; c=relaxed/simple;
	bh=ULsChxBcc2XUy1SxCccxS6KMnlpMConuFdkgaahqBj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bNWpKGI0cPpNJdrwraWrNVqCZdpbuYGH9Av04m2tvYLlgbU6MdFCN2f+iJVax8xGRLUfwSB1FEkHf3UWq8XFnGIvA+uet6VoGTF7k7xgoDDNXct3KMj9UVQhnLXkbI1UuvY5YK3eQaVJPNyxBkLfhVdDWWWXiWTNMoDueaZMJTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fFZw4RtT; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fFZw4RtT"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313067339e9so48250a91.2;
        Wed, 04 Jun 2025 22:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749100848; x=1749705648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pisDPyCNhVloACjdr/CP/aoyNXW5eGbehzF4WzQdg6I=;
        b=fFZw4RtTQv9FF1Y4Vm6ZQcH+WNbJTmoQyq5j4fdLQSOSJdmOSNo8rBPcfYOHALeOXd
         NT2e+g2iWmH3Z0TQdptKUmKsQt/ioT16Lj/1pru0j8jbF13u4/KRxF5/2QusQ9zFRtQb
         wFVgxdc4Uqke3gTu5EfUqnLDG2eMpD/y+enulIkeI6Of5ODitfwBDVqtVS//ekoEjSHk
         cDPmuZRC6aAdsZyjrlkguyw9Mf4qYt6XFgT0auL4g8ZyM4hJT0KML3YNnl6MWDlRVnQE
         d0qw9Rk8rG8fpd9nQRJ3i29O4pZhrAk7vC54EWU2ZT/yjoWynU2MjxCMvM56zXa1aDsZ
         feig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749100848; x=1749705648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pisDPyCNhVloACjdr/CP/aoyNXW5eGbehzF4WzQdg6I=;
        b=kf3hueOElG2IwGTzlu0MMNVoKHoILXy8aSwHgz+RZRY6FyPnEt3KY/4w/DfvqgKpet
         V8q7jCkRfk9nEATxOK1kjEzR03PPky6MoDVcZPmsh2chZo5+L0TCCZkhiBpXp90U/f3y
         cNRgEVuewmHQVAtaY5OyIbfxtfuJVB/ZF0YuVj/C6iGEHVjQ9SAtzByLYQ3tHjJhVayG
         SqQiy+TUKGhaDQD7wBwiOEpJfLdkOifu+KAHCRQfrjKg5V4kPP42pSfnaMt8pxm42+/X
         FHxJJxEHhaqUu5eGE+JhmltSzcOUFuygipLJihx7dwlwHYJMQCLGB42MU2C8SGEuT1az
         nnbg==
X-Forwarded-Encrypted: i=1; AJvYcCXcBI9EzttynOY/BN4+wMvM0J1uuQxFv0YGPBfyqjhtCESr7as1jIO4rHjIb0ses6avsqQ9mSpKRVmZ5b2SNik=@vger.kernel.org, AJvYcCXdCU9qOtQJIMZU5oWYcbq1XO5gxrK2eInx9pCdy2K75vrUQmfoyjWLIaKd8+NJpNYC88jpwuad0uA9s5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVXBUr0H/pJrkR4icIHUqilztlXDu5wJDjHvUOp+46Y/GdTkhP
	A5HZ8KhaYJf/4LEVRG0Y48A7vH9BDRAGmk8/ax6qSsqs+zSMBVlunb9V+/TBM96PwSWksY7CQ10
	hp8960b4DhWKXQCZxJx8+ltz8Ebvei0g=
X-Gm-Gg: ASbGncuFIX2CP1QD2Lm35GLxV6AjujBaa2Y+juHXaJCnTZ0tTvvbVZOuLyNOKDviBRS
	yNOYHy0NJH2EBbZlmAUnEJdJ/eCMYmRlz1dSKCQPa0LXdk7U04NOM11iOrXWxq/ElX2F3ZMM9Ug
	/2ZUerVRix+COZEXaeV4OddabweauC1m2A
X-Google-Smtp-Source: AGHT+IEhxlOAlFFMrVuiT7puZFaVOBDL40scV6ced0++5NAhQaJ0OdfMZ/bWyG9q/HXKGiRTDeuOVWJWAvIbl5d0Xpo=
X-Received: by 2002:a17:90b:5587:b0:311:b0d3:851 with SMTP id
 98e67ed59e1d1-3130cd2f168mr3035784a91.4.1749100848420; Wed, 04 Jun 2025
 22:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605025400.244965-1-ojeda@kernel.org> <CAHk-=wik7gvxt-CEak_4HsGziRwo6-7q9LGeW37Pj9182dJ=ow@mail.gmail.com>
 <aEEjzTMJm7YzS1Ks@Mac.home>
In-Reply-To: <aEEjzTMJm7YzS1Ks@Mac.home>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 5 Jun 2025 07:20:36 +0200
X-Gm-Features: AX0GCFsV6wLuSWV8CngJk8vkZzJHN_e3b_sEoLPriNaHvICgprIi_KmAJTlN7DM
Message-ID: <CANiq72kWgLKoswZL5h1U9oY8qo0-U03awS-3Sm1gvuX_9PcvBw@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for 6.16
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 6:57=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> FWIW, I think this thread has the explanation:
>
>         https://lore.kernel.org/regressions/CANiq72mFL4dn+0JppLLfxyKnM+xY=
wKeduFw2j07hUfxWVVHdUw@mail.gmail.com/

Indeed, thanks Boqun.

Cheers,
Miguel
