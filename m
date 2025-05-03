Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A253AD2C;
	Sat,  3 May 2025 11:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746271136; cv=none; b=DHNOFZ5CdZ5YC39ZP9bvJoeLc7d8hSsz/IvJUpxP5RO0SJuiKZdxWb0ZQm/4kQgKYLsYlss51vbIXMGycozNUzMeGN7ge/Zx8k+FqpsFjqY6OL7ERwNUqmQF+58XK+xDukrDuLtKuN7b21Njqp2eWn9Ivg67RKvP5B3u9NGJyW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746271136; c=relaxed/simple;
	bh=tmca2YOGD+SM8+DR6QVH7oS7rb2oO+5XURYj4WfEP/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fSFnbBIX3UbwheuPIAfjGuItx3a4u1PAfGcSKm40Mm54so7hl/2Xl5xlVhEQ7AYM++20EujjP2Sah2vjj/BNW75rrCUvQ5+0SovkXUW2W4BtYMEX3IuPP5HgOACFzt+icElrB599pD/95SjWw3YlEWtvI6H/cf1pcyXNfU+Sb4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjA6CHPi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjA6CHPi"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e163543ceso1859695ad.2;
        Sat, 03 May 2025 04:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746271134; x=1746875934; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOKTqtMlz4ZjHiXz5jB19w0TVv9Od8mbjFDiMBB1SOw=;
        b=RjA6CHPi04zYJ0ZSS7IvyDz/XOTAt8Dur957VO7US56FMtcLFX0uK7vG3jGgrEr+D9
         edXrCuhzBiBkDgM24443Nsz6FlAOVdOwBVbGV5/lQggvi/qU+ZJAJM7RmooKUueDJF4R
         2ekythq1vzR1AVXvYCPHPDEbBQxmeb6pUBn5AM7oeCDA/i1VNAWivouc0QHewUVzJ+Vp
         +tZfRCb0AvNzLWl+teCTH+ciSZwjbD2tj/tc5wEjLsWC649OwshS4YqLfT63+TuFIgNm
         S0tWhJ+OITUgJEW214y5c3VmXVn3SyxlDEeAxG+LedMn9f41T3NmBAC66aE7lqw3elpn
         K0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746271134; x=1746875934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOKTqtMlz4ZjHiXz5jB19w0TVv9Od8mbjFDiMBB1SOw=;
        b=wEnzvhh+OtgPRAN/wGreE6X0bahx5cCeqO5pqH54prprCMZ1LxtkYgY26kZgCUoptm
         ne6wLBi3G3E/bNcWT2BI8DDDGgp1+Fdb9zyYGW3Kc2e8M4D8s7b2bjXuqo5UGSQ9Bk33
         WTiEse1AG8anKreLArmyrtPOuNMmUloC4dr37MB2oXnDhlGOfOVVzaHnyC8XH6Hx7RFP
         CWxwl1WruqELBTwbyX04KfbzQHsmGBp54NgHO+Q6g0gUrPPsTWP1ckRitzUhc8wd3bh8
         uRcHVSTS28eit5D18EuiCy0mop1oV4+T4S08lcfprlR0nVrl9rvhqk24NQ4FNjWdZbjj
         raaw==
X-Forwarded-Encrypted: i=1; AJvYcCWL/oqHX4NH6xn8+xL/20j179OT8tDAllIGOwNNfvdLtDQBCca9eZTyTuJse6qpsTGM605+5h8IfZXLpX75qQ0=@vger.kernel.org, AJvYcCX9np9oB7XA9lyY0YLybx1adNsKS8ZygCQY0D1lih22IYqzjnpOIvbYIuXtFm9mYwVjxk69deImPpFJaXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU2A707bN5s4QpIJru2rxjWk7/zbOGsb3A2ChVcZnd91mj3CLl
	Gqai5CbHVDgGsTweZtvl9f6VS8u0tXIYwnRj4aBbccEiPFETSthK+Ufhmzrx2xFbrBOpfrCbYzd
	uOu3AeCsEVYI3W+QUz5YrGYP8360=
X-Gm-Gg: ASbGncsrjXRRQD6hsk+GwAUau+bWTe82sIZPavOqdJfXA67hKnw7hB8KbJkGXZ18/wK
	f6ciripNCqZHKQnkPjwsSB4d3N5CGrSEFqeweSdAQJvHpng9Nc4OQwN89vNlmI7QHnx/LKL5/dE
	9bENLnuVSDqE9ceiFqvbpsVg==
X-Google-Smtp-Source: AGHT+IEsBdLwXM+/CELGTzKyTo6DlLWfvxjIw/4GPiiLANrQjix53Q+3RmD4HrklIHpjDDnThHgcGuWfWoWVrKGpOYw=
X-Received: by 2002:a17:90b:38c4:b0:2fe:7f51:d2ec with SMTP id
 98e67ed59e1d1-30a4e4108c1mr3835307a91.0.1746271134241; Sat, 03 May 2025
 04:18:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501-configfs-v6-0-66c61eb76368@kernel.org>
 <20250501-configfs-v6-1-66c61eb76368@kernel.org> <ELsEgktE6XbGxDyusumtuVzyX-eotyYuQdviHTZaIxN7KZaGFr0fNqrv5tac_gYWfbDZYNTC-wQyQuxnmufA2g==@protonmail.internalid>
 <CANiq72mS_HV5rDjP+t+k0jX9QeAgF2SB9_xX54iEBTH-GoPuEg@mail.gmail.com>
 <87msbw1s9e.fsf@kernel.org> <86-cT9dBPpEIyQXWVCeEmj3TRvBm6Ta0p1B20sSngRGOqOuC96i6hG3Q9Hg3bN8AQTCPXlsxg_C5Ok0G4JJzpQ==@protonmail.internalid>
 <CANiq72nd0Pfv4TrpULGQ_fZkyBpHyVVZ1H45_RJBgBxkJuzCJQ@mail.gmail.com>
 <87h62419r5.fsf@kernel.org> <FLMJjrvUlrMEWy7KzihcYUt-V1IFyP8nt9KYysmVPsWdxUR9dRVXsRoSBw4Z0oFX8tzfWieBDkP7YPAHOXtFcg==@protonmail.internalid>
 <CANiq72miL3eZ40ujmA-pXCqMS8y2AzJQ1UKpL1_hX03AJ0fteQ@mail.gmail.com>
 <87bjsc154u.fsf@kernel.org> <CANiq72=SD9ogr+RpPK7E+cFmn2qAVu+MBCoChdp8-hw7JFu6zA@mail.gmail.com>
 <TbTextfZAMlWFS5cWlUE-Wtnp1bv8P783IQQbWUcnHvEgBjpIxukMngLdPkqNR9jWT9O_OtOY1ejin9JoOnsww==@protonmail.internalid>
 <CANiq72m8VWKRyFai0Xg8AZUTjG0eUVG8nY-ZCQOqOnvwsW0ZaA@mail.gmail.com> <875xij1ouy.fsf@kernel.org>
In-Reply-To: <875xij1ouy.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 3 May 2025 13:18:40 +0200
X-Gm-Features: ATxdqUGkJihz9NI2m6_vV-_CfNdYjkcfgniu1JqMt6YMEGQBob_Q3PXl7kW2HPM
Message-ID: <CANiq72m0cuf5YKfOY8oNg83dzWEqqyddGKKh_6fwQQ4hoCp+yQ@mail.gmail.com>
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

On Fri, May 2, 2025 at 8:57=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Right, they are not from const context, but they are inside a `let`
> statement, so if all the captured variables are constant (which they
> are), the let statement will be evaluated in const context [1], right?

No, I don't think so. Though I don't know what you mean by "captured
variables" here or why you point to [const-eval.const-context.init].

The way I read the reference is that Rust only guarantees evaluation
at compile-time within const contexts, and a `let` statement is not a
const context and its initializer is not one of the ones listed in
[const-eval.const-context.init]. `const fn` isn't a const context
either.

Which makes sense -- the `let` initializers are just "normal"
expressions, i.e. you don't want to limit the kinds of code you can
run there.

For instance, here there is a panic at runtime trying to mimic a bit the pa=
tch:

    https://godbolt.org/z/v5qdK9vve

Similarly, if I take your patch and put there an `assert!(false)` in
`add` -- I see no build error and `objdump` shows the panic call from
the sample.

Cheers,
Miguel
