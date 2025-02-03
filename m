Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BDA207A18
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 11:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738583781; cv=none; b=Xq31nd8kGwrzmeAqTz1yfmm/BsdXoLz1oGT2574Frxv6Lc7ZyHNcLcZARVxewSLhcgEWJvQmHNuyhAmxSKYYkbFJ8u6iuugRxQcSjJRo8dmELFa3IdkdRNOfe5YmJ8sR3rc1F2yT8fDXw34j0wtt1r0KrIHCAbA3GcWKC4xmsDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738583781; c=relaxed/simple;
	bh=9IzEiom6SzulKxJ/glaOYmrIa2Uo0paqlphMpy7VetM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGIfBFyaRTvSv7QOeosVGyyuwptidHMizQmM7Gq/8+3T1CTuIKqtCUciQ9018d5w3KR5+wKSnnsfgXhA5IZ6C9PJkMGfK1X5utHLJcKX3b5/Rz0ZW07rKX53C9xnaH5jCX2gqGwkSixAZqx/AdVNiq+UMtuwNpRHl/v4xuf7prs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=az6t90QN; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="az6t90QN"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385de9f789cso3307856f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 03:56:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738583778; x=1739188578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IzEiom6SzulKxJ/glaOYmrIa2Uo0paqlphMpy7VetM=;
        b=az6t90QNr6avpauxATyEVi+A9NzWuAolGBCYgLK2rHrnzhv0azep3l/xW0AXn2+qVX
         GICdymXxN0Nlrs8HoPxtRAf1A+eaigVutOpHc4auKGKQ30y8FKSPyekz2oBqMNiLf8G+
         Z2UCQXh9Oq72Zl9paJvkstETP7zBJ/ICafS/qzopLyFxe4hbqeui4V/c1M2ZRk7clRCX
         ywiAZkQYc24xkIS+XBBSclZMs0tp2eKE0kMJT4UU3QLmnmz+h2pOqMuTA4kR7B3eYpRs
         AZCKrCUisfIouOyZIpowycfrEExVZR2ug+mDE1PVO8CNeCrbDU4FfCf2dUi8pu4EV2KZ
         pMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583778; x=1739188578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IzEiom6SzulKxJ/glaOYmrIa2Uo0paqlphMpy7VetM=;
        b=h7swrG47RUrj5IhaRLpsMMNWDyqAKxWs/y8VuUD3H55Efj9L5IrviA0KeIM3wRTQFC
         zqNi6yChOEV8kYyAnSI+HJdD04vseoszwq7tZz9tK+rzCM2C+4xmMMlpa9W6/wn0ZjjG
         IRcLWMt1JOQdTp7jp9KpmYkm/BtmU8972OOdXYR5dxcxYY6FM+Ma/x+H09v33jCXnKDE
         ofXcqoC2pqbh8PfQEKTERAcwEWdgi9NSRDEqh5iAL71vxAYLBrm3A0Cz2DloDolgSHXZ
         gigclRDaix4EZzHRUNLzik4RLFyRbn2RJ+7RniLYlDq/Y9ar8d9IdN7cMKASu1Lrrfuv
         0k0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2B6St9PoCIrnP1ABPeeI/oASltMFYQ6zQvqQQRLTp/Mt1r/U1XyvOOljyXLQQmz1F8rpLyX16wLXmVlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFzRrL+ZDsV/UJVOLQYlaI7S5DMkb4xGWynxlUnYv1bM9wK4HT
	3/37jmwyWq9DvCmnKvAoqy23isWcLFyhm57EV6lIcKVT/LfziXJtPGbw84BlBkqPF3w20AuXS0W
	myFVWt4bUFoXEvwZzvQM9QIsmkufzVPlQpFUQ
X-Gm-Gg: ASbGnculzxPR8mMb/1JgIaaPpVzDDx1Hgl4P18dVJzuMlB4CUZavkbGEgjxGS6rV/0z
	AeX8UXMzDePKlPf4tCBSZuruHHOr7jaMDDHwX6l5yDAt7bswGF15oH7PLyXi85VCb6/JKGhMC7a
	CTDKYtBcHwd8XZ3SxOeAhaVm7R
X-Google-Smtp-Source: AGHT+IFWgvCUDCO17qB3ujbTN8kQLJHlVJh3nMwKzb0A/UItlxg1jmWXbjbwwfUF8gwMzKP/W1LegZfB0g5CJf8cksI=
X-Received: by 2002:a5d:6487:0:b0:38b:669d:4dd4 with SMTP id
 ffacd0b85a97d-38c5192f1f4mr17390254f8f.11.1738583777940; Mon, 03 Feb 2025
 03:56:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130-condvar-freeze-v1-1-a91d5661d505@google.com> <20250203115418.GB14028@noisy.programming.kicks-ass.net>
In-Reply-To: <20250203115418.GB14028@noisy.programming.kicks-ass.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 12:56:05 +0100
X-Gm-Features: AWEUYZnrtsIUCF_sbBn4JDADCke_X1bx2GdOn0irljBNdeANdIrovySmE7zKDbI
Message-ID: <CAH5fLggyyP1A=uNxr2iYNKOj0V5rxZRU83TRgs6Ah1uJ=Ee2uA@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: add wait_interruptible_freezable
To: Peter Zijlstra <peterz@infradead.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 12:54=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Jan 30, 2025 at 11:30:44AM +0000, Alice Ryhl wrote:
> > Binder allows you to freeze a process where some of its threads are
> > blocked on the Binder driver. To make this work, we need to pass
> > TASK_FREEZABLE when going to sleep in the appropriate places. Thus, add
> > a new method wait_interruptible_freezable for the condition variable so
> > that sleeps where this is supported can be marked as such.
>
> The constraint on freezable is that you must not hold locks. There is a
> lockdep check for this in the code, but it would probably make sense to
> teach Rust about this constraint as well, hmm?

Unfortunately, I don't think there's any way to enforce this at
compile time, but I'm definitely happy to add this in the
documentation.

Thanks!
Alice
