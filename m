Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE9E149E13;
	Thu,  1 May 2025 14:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108508; cv=none; b=hJ0UsooYpkOeGpfnHsnhcnBhuN4g/4lMPvPy+QJiOKijjqswpw9Q6EQhxZCL0vDRQhRs0sXvYCl58uBY+rTTO+68FPJ01li1iVV5BO8DiWDXw5F2e0ufwZNESbYymqYdDuvdvAvZxtVvg1qyxBfqo6bGqPiJee4/Z5KZ3f3xMUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108508; c=relaxed/simple;
	bh=E4gaK9rYk6au4O7TOkbePCsUb6qhRcz3hYvlVRn/16o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfUEVFMutAYyKvOhErh7q9Lcuuu23O2AR7mbx/O3x+D2A77ObfUWLBxWleRf6w72WmLe+lbB68XspVrzRw6GyXJ0SieNqLqOKLErzK6fx6xg7Mj+XIHp7dGAewGG1oRn9m1WA8ITOaUMSNCY/HQ1C4ipcnXIsKYnCvxLmIXA1cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/cDMG4F; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/cDMG4F"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af90510be2eso78195a12.3;
        Thu, 01 May 2025 07:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746108506; x=1746713306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGf62WNQArtFT9ZyxRay2NZ6C/7XmtWpHUe9LFEELLY=;
        b=Y/cDMG4Fd2eLkohCsVDy4UkhbeOOKGY8MjbsgV3SCXZ403j5NNOCyaV/AR/e6HVHBe
         ll/SUJ8wxM4PJ6vNnlZ9GcRRSKRgqVRaZ2isRVmcaHIGMTPe+b7IlivQsmPKSiGH6ntE
         GvjZLn8+8GjoSlhSAsK1dhIDxldkZE5ZYmzZfEWSYEsn9SNgnKP4faSDOMqMWnaF5dKx
         36Ds5tqNaCFjJW9dwHvFFS7r0XKpFyThPUCAqqXEInV9lbPQzqnfBKlJ2zyyWVlfBpaD
         PzBUwioRImRrQm+RgP++QXLQtNSUveWLAUIIgOPbcWvBEuMcfrCf2iwnpVRjWoKo3ykw
         xoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108506; x=1746713306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGf62WNQArtFT9ZyxRay2NZ6C/7XmtWpHUe9LFEELLY=;
        b=BrsvnCzpAXIDkJExgfKO1ByP3lIqITbtmhdJqS0sLWeGJ9xf0uuFt9rk6vXs5Fa3zt
         efDiOdngwo4E50tygl+b3hTzkMrVhfsdDWvGk9nE3fl2PzEM1kszVq9mqRjubqT+6pKp
         Gv81qBeujRvjHHurMpz4QdeCsfODbq60Jvuj1lmZy8+w3aj32nHeKvfSt0rK9/HNC4mc
         8xu7MekhajCPA3zZKb6bG58AsBdyFPAzL6tCICFbhINX5Cj5CS3NFn/GB8NdQpaKRRMH
         KdSbKGrOiXJ9JfvyR0BU/qWm1yxBaTDwvc9XsbnSmyjJWGjDKniOZgJYg8itpqInhVjw
         ZMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6lO02aQQwn+pWnlMvjXgL79s8AXt7XMRnPrrayuiimDF0I1ELchWFRpM0+LyY3XzEPRGAcB1rJnIszbXEnME=@vger.kernel.org, AJvYcCWIQOnNH8gZobm299uDoniSyP+en2a2s7AAuhE0uSVzCMboo5eJj9FEbh53JYN1LODojAsY9zsrUTTV+kc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXt3tYQ8nXGgHNJmPu1Pv31t1g0m+qjQFIrPkTsLLS4CM52oT/
	MqP2O6g9o85N0RCCA2aQM61fwk8lsZ1nGuI3ZXflSF4s96YDDv4BEW/b/KwD/9aR9MJZJry8Ay7
	92TMhehuIn+qp54nWPMrEleNRepY=
X-Gm-Gg: ASbGncscsFF9cHxb3p68w2tJdAJsql5eEbddAPJyYpEorgm0Qi0CoAS/62zUnFqwK31
	cQcsmH1RqSCQ6hWmRis1YJEM/EQ9FLrCWTrfV8SKW+Uz3EYNb8lfiTE/mBMVoGuNUuRSkXiT0Gp
	Ck6dOleIfO7zNarrD2y5VM+KQJPecYX+fS
X-Google-Smtp-Source: AGHT+IFZmdawsW3mJBZo4Yjl9+RciFgAi5166WQglAKChxUVuGum+6m8PSPohGCxYtjkfjRcny4Wi8ugKLnqlBLbjx8=
X-Received: by 2002:a17:90b:3883:b0:2ff:6bcf:5411 with SMTP id
 98e67ed59e1d1-30a349d46aamr3960865a91.1.1746108505547; Thu, 01 May 2025
 07:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
 <20250501-configfs-v6-1-66c61eb76368@kernel.org> <ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
 <CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com> <87msbw1s9e.fsf@kernel.org>
In-Reply-To: <87msbw1s9e.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 16:08:11 +0200
X-Gm-Features: ATxdqUF7sDzL3I1aQiBOexOFgt2W7cU5ggBCuD_j6XuoDf4XtWTOAR8F4k70_Iw
Message-ID: <CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] rust: configfs: introduce rust support for configfs
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Fiona Behrens <me@kloenk.dev>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Breno Leitao <leitao@debian.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 1:32=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> The one just before the cut?

Both.

> Thanks. Would be nice with a lint for missed intra-doc links.

Definitely -- I filled it a while back:

    https://github.com/rust-lang/rust/issues/131510

> Clippy gets mad if we move it up. Because rustfmt wants the unsafe block
> to a new line:

Yeah, then it is one of the cases I was referring to. In that case, it
is fine, but please indent the safety comment to match the `unsafe`
block.

> The reason I choose build_error is that if this should somehow end up
> being evaluated in non-const context at some point, I want the build to
> fail if the condition is not true. I don't think I get that with assert?

I am not sure what you mean. My understanding is that `const` blocks,
if execution reaches them, are always evaluated at compile-time (they
are a const context):

    https://doc.rust-lang.org/reference/expressions/block-expr.html#const-b=
locks

e.g.

    https://godbolt.org/z/h36s3nqWK

We are lucky to have Gary with us, since he stabilized this particular
language feature, so he can correct us! :)

Cheers,
Miguel
