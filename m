Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE0723CE;
	Sun, 29 Jun 2025 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751225510; cv=none; b=EjNKrGWCrLKMox9wYuTDp5RJh2r5o5vT8JSvbMmTE1TVUnPUyZsV/c8rLDmDRJZwbdyJHX8329ElCzg4nNhBtcewNSRyWuoX+eNaP2hYMTuKWg6tFem3ZHYfYn7pJGQszVXuDZXGFy0y7LdJFu377QUSJm1HngFSSQjatYQO0IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751225510; c=relaxed/simple;
	bh=m31e7le107W8Y9vAbduFcxlW1zFtIFM1aCvWlvd0/ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gG9p1nuZ+7RZTPqND5zBjauHlk0Q2eAR/H3yD2Z3R3FKJrw3gd4C2/mhLbAPhe0Z2Wraille0hgDsoYIn1zy4LnDg8SBbC1JDOXr0fspTG6UteAEBXLf4JEVlIGi+8I3iikaog0ECJk/yp2ZLYQNINEYl5cmcFtvYe4MMLVusfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXjiA9b3; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXjiA9b3"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b34b770868dso459311a12.2;
        Sun, 29 Jun 2025 12:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751225508; x=1751830308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7qWmqyWyOEY5UGuDfpAlZX6C/JGyAbsG083wFDbdQA=;
        b=IXjiA9b3t7YoWAmwiNoBY9Xt9a74NQ+S/GHsk+K/T8pKhO4irkHvdvkzDONVuPBWmv
         iKYQ6ksM/vi56lk2n7vijGJfLK4Jx7sV0FZU4K7QJK9A4LCs9bDnpwYHYCYz/UkQBydn
         8X2FgKg1Vrludl/z0lYg6W9EQ9HPiC9IOJ2q2PDGpyS4uzky67Jz9OZZk+jls2/cb770
         u3DGFaNILNq0VycL+7IZ1aRtrTprelOMAjax5sbGjJdT6up/xNxzyyF1ro8TPgwizLaX
         1MbYOEvnBNdLFWFjBZD0E0ivJaZbvm8Wz4jYWjByYNjobPgErWGuL2fkNWOeykEnY6rb
         bS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751225508; x=1751830308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7qWmqyWyOEY5UGuDfpAlZX6C/JGyAbsG083wFDbdQA=;
        b=Kitwg7v9vENoEvm4KlcPfBw+UkG+3fCBfh9A6Vfz0mOBLUsh+jEfDbzdYscIa9DWk8
         F8IiFtNojSn64fAtg7edWNPQaku+yRp/3+mwQFjRQN7C5wEaFsJj0nJR+hs0r/dmeKWU
         MpktHR8m6/nP3dr+ZVDYe/lN+3Brpjwy2vQ7hmCnnlWxP2nvm7xwemJvhiV4FVfxaVVQ
         3C0qmNtCqELUTQhScgVcgDwuw2Ym1PogYsCitlystBAzWtp82CQzZ+TeiaxhO950JafM
         asfzQRbIsy+yzZPCf1oxuX1vj/N6D6/DpCgCYRkbQ56wGtyBkAnwWrZDIKQt+iqYO9No
         8PaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrg9KCNinrzPC5xe/bGSphsmRVb4FSe1sGCutFLQpgQhPNfJVdCRFVGW+KeUPdiiN5BFGhvCiKvefbOIiVzxU=@vger.kernel.org, AJvYcCVueYvVY/ApKGomCQEsRzId+SUKT7Wu8eeDvGD+n4UVxeHuvhlwGK3H+de4u5WqgVLgHkNvc2SoEwdXO6A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOjZhIg6oCNfw6eCY8mm5V4OAnrn0bnh0x1zyRSam5B7byrLK
	S2YzkZYUHU5Yryy4233gHEjwKbm/7PJtNlTg3lX5frm/3s4tQAUc3BB7FL1SvfY93TOBuFrzVjd
	J7iZ35LH2L5XADyNW2galXKxTwrDML6Y=
X-Gm-Gg: ASbGnctlTvjsyDXZmvxDcMNnEyx3sw17JDVtZknqqhOFkpSO0mouk+0lIdSg49OXCAw
	zxUkiUktFFo584YP4kbxRPD6H9rCSOTASsRpqXo1PA9Vmm77cKASKDwXzo0+WISqbksdQ82DmU9
	yeiRgZSGC0toLjQoXcbRP2P49RbTfPyhZIEGC91PWGTHM=
X-Google-Smtp-Source: AGHT+IGNCxyRbF0QqG0f5Z9eveg0zZ0lxUF1DL03B7iTaRcDwpx1uSxscv8sr2Xh1NKPLlsZyhC6+EGBuHHdrPEa4ts=
X-Received: by 2002:a17:90b:268e:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-318ec268e01mr4234292a91.0.1751225508036; Sun, 29 Jun 2025
 12:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612-revocable-ptr-comment-v1-1-db36785877f6@google.com>
In-Reply-To: <20250612-revocable-ptr-comment-v1-1-db36785877f6@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Jun 2025 21:31:34 +0200
X-Gm-Features: Ac12FXyETq_kcAgr6mG_NJrcahXlhIlgmzz9c_yRbri1Q4Cl4-lIaRLnmORXWc8
Message-ID: <CANiq72mstzYHbQa-M1Z_zWoLsBOPsA8kPstsuRO2G0NDnnTxCQ@mail.gmail.com>
Subject: Re: [PATCH] revocable: rust: document why &T is not used in RevocableGuard
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Marcelo Moreira <marcelomoreira1905@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 1:17=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> When a reference appears in a function argument, the reference is
> assumed to be valid for the entire duration of that function call; this
> is called a stack protector [1]. Because of that, custom pointer types
> whose destructor may invalidate the pointee (i.e. they are more similar
> to Box<T> than &T) cannot internally use a reference, and must instead
> use a raw pointer.
>
> This issue is something that is often missed during unsafe review. For
> examples, see [2] and [3]. To ensure that people don't try to simplify
> RevocableGuard by changing the raw pointer to a reference, add a comment
> to that effect.
>
> Link: https://perso.crans.org/vanille/treebor/protectors.html [1]
> Link: https://users.rust-lang.org/t/unsafe-code-review-semi-owning-weak-r=
wlock-t-guard/95706 [2]
> Link: https://lore.kernel.org/all/aEqdur4JTFa1V20U@google.com/ [3]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

    [ Adjusted title. - Miguel ]

Cheers,
Miguel
