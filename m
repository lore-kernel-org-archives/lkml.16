Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600B218E8B;
	Sat, 28 Jun 2025 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751114534; cv=none; b=CpPgmrzYPQt99UUhgHUtRbEdINmS+BW/lbFTkxEvdNRSjHuT+0S7bKWe0y1JOlJP+WQgopZ6DrwlfFtMs20v4vDcBzeHlgiah48tf7GJJgalYY5WvDB16h/ADOwrQQFYt1xEdigm4ep75/i6WjyDsqb3qgf0EXwOpsvr5L0lYAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751114534; c=relaxed/simple;
	bh=wOGO1YcmdZnB9GDXfbRgoK9nxZHZCRHcQwLPwPX49eQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSR/hoePvF4dDVjcnKGp48exFBsrnKq4q8Pv10YnEXhNH06y43wd3N5yBVCroXsPYF5W0SASw0T2uULU7gmDXofVe74xw/Q1oMIHrmHMJkBVRmOjGyhLlw6NoAZ3zeEjtXLIr/fV+802fLqF36ycpsj8oT0NlF3DE1Z+Gk4iqrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYtBbEzU; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYtBbEzU"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2fcd6fe970so515315a12.3;
        Sat, 28 Jun 2025 05:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751114532; x=1751719332; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOGO1YcmdZnB9GDXfbRgoK9nxZHZCRHcQwLPwPX49eQ=;
        b=gYtBbEzUI3u75Kr42ZkRjoTZc8hdaUbd062R24fvr/pHA/WxfdoQBaInTUbj3z8GCE
         pdpDI6XA4nWw6jmW6acmxBMDpqPGN3Wl0Lv9HhIRj7m2IFNXWnT4sjruqygTEPXmBc+l
         VFDBuHsULeEpfv9NoXMqY0RRMAtRli+rAiudUmqxUkn/n45qJZZteX7UqFIOi8XGbdwq
         m7YbHM+7QJB9kilEpMoohI3nmYN5DDCH/2nWK1pAAXRcjPv1PkYRRW3OLoxjEdPHuJZR
         CV1FA8lQH1aZ4f3ajBmzEJGRa78D/8yqQo8UwApLl/0xq771H7IYhNK0+AUD5ywEqa3m
         Js+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751114532; x=1751719332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOGO1YcmdZnB9GDXfbRgoK9nxZHZCRHcQwLPwPX49eQ=;
        b=eAqZZ6mPSMtn7bidOK1VzJcoymCsJu0LIpZwFjzAjf/Fos9ce6mLiTrYjOLSixYbXS
         l4z8zHDTBehaJpZSnmAnKdoabGIsc9X+HvXA6rJq9163WsALQS7HSHcr/70DozLWon/w
         Ru5NuWyIM5446whSoSa33i9CijkC4EcmxHLPCgtrI63gr3E/RsEcGx5bguuHyL4hJbl2
         tmiHTWtsp9fVIVSS0zvNJv2mjOmZ4ipCJpufJke5RFE07ngI0I0tEohnYZU4HZatJqrs
         XZDqFyIwZ5p0UGWJLZGG2bJ9ipBTVs2dwG7c/xnAQ2NrouSAoTNo5yUih82UmDZIQe6U
         Lb3w==
X-Forwarded-Encrypted: i=1; AJvYcCUQz738ZU5p6l+h7kTYrtNI94AEBQwEBbpUWk/5dpsq6/7OOhod3e6WytRhmwfXM88csoHh94/w/1yGk+BqYrA=@vger.kernel.org, AJvYcCVqR2ADGCsKrX6jbRTU1Tj+y7MXKU8tnoDonM4gyXkv2f/jogBhxw0IbIs4IG6Jt8RhBkTDkXPV0Sst37s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYtICcaeuztgVm//6+L/ULdNefjJLQ07XEUxGAHn7zWMEIoyqn
	D5ImMQ3YHF0vZsT95SE1noOVUsk/k2hGKVbz81Fp5wqSY8wivEaeO7HGzAGb5fhCSzK3QhTwbBY
	SIXcb8+uLhfbcPUAJCJ5DcEAAyGof1tw=
X-Gm-Gg: ASbGncuiWlqjmTMglUcU6VhqLHto43VPcjX7wI3mTP5dIPqwovudMn3/HC8tuUNKEaZ
	L1yqNmRObXu1/wYM1tEy17gW6hQWJPSPof0ytz0Ec3KVEQzRVtgLN0yMdlmjq7N/glf9ygT5K1S
	2FQE33PqZ+RRdnqAsssgjhRxg6pxHuq4/gdITZYXTk4SY=
X-Google-Smtp-Source: AGHT+IFu3ECa9MsKaUx+sB9hsEWVH2L871z/9rACBjqSTpbIgxp4nXb8PZMyP2C9HJxqzvqIzKycfEghcWOieqRSEhk=
X-Received: by 2002:a17:90b:2887:b0:311:a314:c2c9 with SMTP id
 98e67ed59e1d1-318ede30a62mr1431261a91.1.1751114532065; Sat, 28 Jun 2025
 05:42:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628-rust_init_trailing_comma-v1-1-2d162ae1a757@jannau.net> <DAY60NP32ZDA.155XFXZ9AOF70@kernel.org>
In-Reply-To: <DAY60NP32ZDA.155XFXZ9AOF70@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Jun 2025 14:41:58 +0200
X-Gm-Features: Ac12FXx4-8rjfwGC1OlyZW4Qvi35lwsZJnRZvoW9Qtno2DKmkKzq7dOQjnuD9YE
Message-ID: <CANiq72m1-+YmA0Ot1tO6FQxVytROCuZsKSFmcQ55ov-13qyUGg@mail.gmail.com>
Subject: Re: [PATCH] rust: init: Fix generics in *_init! macros
To: Benno Lossin <lossin@kernel.org>
Cc: j@jannau.net, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 2:29=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> Oops, that's a good catch! Seems like nobody used the generics before...
>
> Do you need this to go in as a fix into v6.16, or is it fine if I pick
> it for v6.17, since it's only a build failure?
>
> @Miguel any opinion?

If it is a fix, then we can just pick it. I have to send others
anyway, so I will be doing a fixes PR in a week or so.

Cheers,
Miguel
