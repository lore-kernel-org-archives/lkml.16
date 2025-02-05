Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333CD13B5B6
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762967; cv=none; b=u7q61UL8c5EqelybpfMx/94HNLYusU5kIrXycGtz7ANYDvuoN9xWxFREx/uKHebMuW3rc9f/LE3PA6L//h0CBZ6Bcq/+IacQtvv9Y61bVbqJ2d+JFElJDMKPIXbX6imnu9QAj+43U9sJfVAJFdtHPbBXQEz/x2CzzH3cH9hOR2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762967; c=relaxed/simple;
	bh=y9/KrzeohqcIwrfY0qdsxNgmzVdDXNghpEy9MK8khhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRWPhT2QDWfMJwSnghz05GeUL89TGxCDRPebnk5HSesgpRyJZoDyJ54v6hm6ZMMjpzzjIlm6WcRfOID4AqKBo4S5GL0AdYdztuxlKpxGa47mFByPHif0o8UUSKJ71u7gL0rj4NQTwvVpbsotdgiMfd3OSew9dfywYQ8pkkxpnLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vwXfdRE9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vwXfdRE9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9c3ef6849so3334606a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 05:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738762965; x=1739367765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9/KrzeohqcIwrfY0qdsxNgmzVdDXNghpEy9MK8khhc=;
        b=vwXfdRE9uJV2gTcDjdCI1nLRIv3yvH7UX7jCW5nm9bFHMHIBELUHYyFshmNVB23ITH
         cyFvGwddBnSBHQMXHZrrqgzWDF/oNCFJdNGrUYV9MU70bZyNd9uLb/RXFGfm2kFKlDnl
         U7QY5V3uBJWfJho2Wucnldg7j4fcgeSsBjsB50tL8/zuTuH2kkTynoE8plJ/CdydkJIy
         0WYxxf0s0cqicqnNTtnC7yc4ajd6zVEwzZSkWLTOBPoc8btsskQkZ6UwPFW+frz8CJcD
         bMBWgDDoxySABT4mfCmdXJnHfskHFBs72B6TI471uEIIup9gP7kBOlu/TNBSDZX8PzIj
         wfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762965; x=1739367765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9/KrzeohqcIwrfY0qdsxNgmzVdDXNghpEy9MK8khhc=;
        b=VgDJbFnnBtTa9BIiA7JnpG1F/vv64w58nYv3Kr7+YlVoL8rOIAtNwwO06ledvZNfOp
         JwNmwX/Ai3Oo9UqFMu2ULxmqMiTMKRhiJlhJ8WrZQKs2JetUG3tIdvq/dy7WjCNUR5Zq
         QwWPdUpcKlr0Yw9Sx5JpAcVBRLEf/rLDoJRhRXEXxUbznfZ0mgeuEB5GTL0xklG6a+3q
         X1/FCPHw5++0T59KhUjuGo1X+LwsM+f1xW+j6YG/gLURyyo0rIZRZtrrKbXcu/zMB5my
         T7KHNQilMu0d8927D2nLcPjFFVKQOMdPQVtODD12eMxkJ3FLAoaM1Wg6Th0oToYUdDV6
         CBMw==
X-Forwarded-Encrypted: i=1; AJvYcCW/vYQA6jT1SKF4mkpmK4KWT8F5oyl6drQvSC4dymQNOlUcnlFWMCm/5odNbMr40ZJ6lFTKAhUBGOkBS7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzuyWQEhyEa6XaflwvfXNwJA7yoY9YUk81uslKZfXEV9X4aBJq
	Kx3dypdQNFkquohx8iuaA+Kk8ScDl7rYlon5J/T9vB9FKs2xE+8YurgKXdYJWsqNgAeIXsCp1Dc
	0d+9IG49u3GaB2FV5RJ2IR8Uz6+ZF2sbRCuf+
X-Gm-Gg: ASbGnct0BleYOjsZzfh7PqEQNHtSwr/10wAKmwZMOYUKluUwpXs6G7+Fb6Q2V/5vRiz
	T7rkcmQ7XnNj/E33mKRtt54RNew2LMVzQW7qzU0skNAEgNZxb0Em3WJCgrhUrAUrgPXFAsKuGW6
	vMcufULY7PabWP7WU1SvGzMCMWSho=
X-Google-Smtp-Source: AGHT+IH/EQxhv36VWrIe8Gv+L/KgZwPP2PZmZzoajSAXyUR6QSdWL45+HOWZhhT5Cwq7j7Ro0lf5pski2VkayJgOHwc=
X-Received: by 2002:a17:90a:d407:b0:2f7:d5f8:f393 with SMTP id
 98e67ed59e1d1-2f9e084fcb3mr4374896a91.35.1738762965170; Wed, 05 Feb 2025
 05:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-guard-get-lock-v1-1-8ed87899920a@google.com> <87zfj8eczd.fsf@kloenk.dev>
In-Reply-To: <87zfj8eczd.fsf@kloenk.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 5 Feb 2025 14:42:31 +0100
X-Gm-Features: AWEUYZlJgYLFa6S5rPjaXdVXGeY7J7aptQJdB0SN72G2Qv7QRAvY8D_WZ5moQTY
Message-ID: <CAH5fLgiMY_J2u_ZXaNUvrBXqeBvs0T6Gz=fH8MVcd7bm+3GZqg@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add accessor for the lock behind a given guard
To: Fiona Behrens <me@kloenk.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 12:51=E2=80=AFPM Fiona Behrens <me@kloenk.dev> wrot=
e:
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > Binder has some methods where the caller provides a lock guard, and
> > Binder needs to be able to assert that the guard is associated with the
> > right lock. To enable this, add an accessor to obtain a reference to th=
e
> > underlying lock that you can pass to `ptr::eq`.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>

I forgot to pick this up on v2. Sorry, but could you resend it on v2?

Alice
