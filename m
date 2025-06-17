Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A107228F924;
	Tue, 17 Jun 2025 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160587; cv=none; b=HDkJlC6Li+vuRtJUVydsFyXVV88i/vhs5VyJ8/QINrPHJJNkwgoJFM2rOdG8hnD7RfJoWOPV9kKWBYUyHEgfd8w+4XKc0S71PQ38CUDW6cfTYyYlRX9juT0h64HYLwAp1gWrUwJzycE20bbmkH7HKAw5Z/h8vevYHG0s3+Lkwbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160587; c=relaxed/simple;
	bh=fJyV/yZ/kHBRzJi++Q3MTQqta+dcB7P3QNrNIXUGmC0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A72RSc6ZOodU156IPwx6+Jx/Hs+IhlUQSwCINe+BF9o2YNcyf0neB5175s8yo9nc5g8J+hHresGMoRAb6npOvIq4aXQkEfn2xrGfRSnXzLSVODCyoul1uqx6VdfCRTEcv0bFW/9E1zJcZcU+iO8Qcien2YYXFNN4Tm75Df+9mDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6pc2tIS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6pc2tIS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E747EC4CEED;
	Tue, 17 Jun 2025 11:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750160586;
	bh=fJyV/yZ/kHBRzJi++Q3MTQqta+dcB7P3QNrNIXUGmC0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d6pc2tIS8n0X5frCa971hjJQovU+W9l3yJYvpN+nHUNJCUZsoJA5Vro5aXUV2T1MO
	 hlBqdt3tTcIrFHQGde6zxMIfms2AcWqgOBGmbMl7gxnrylHbkSqY+UC25GhKBzepkr
	 Jej0Tcfyu6NaeAiA03RQ1UR73jLTdFmpDOAN4xJN4xHknnxxSis7h93Ghx2yhW19NM
	 mWLsE6hc0o1K7To//9AZdtmI7wKaZm0lpt7qLZQBf8ouoP/h4ztFB43AKQavtmI2if
	 OyNvSbjoXWGJowDpfX0Ui9wMx2ignqdG0HrPX5vd65fAoY+wZsg6T3jnFITz9io443
	 ZxzhuOBC+63dA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Lyude Paul" <lyude@redhat.com>
Cc: <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  "Boqun Feng" <boqun.feng@gmail.com>,  "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>,  "Frederic Weisbecker" <frederic@kernel.org>,
  "Thomas Gleixner" <tglx@linutronix.de>,  "Anna-Maria Behnsen"
 <anna-maria@linutronix.de>,  "John Stultz" <jstultz@google.com>,  "Stephen
 Boyd" <sboyd@kernel.org>,  "Miguel Ojeda" <ojeda@kernel.org>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Gary Guo" <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin" <lossin@kernel.org>,
  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor Gross" <tmgross@umich.edu>,
  "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 1/7] rust: hrtimer: Document the return value for
 HrTimerHandle::cancel()
In-Reply-To: <20250613232754.451450-2-lyude@redhat.com> (Lyude Paul's message
	of "Fri, 13 Jun 2025 19:22:22 -0400")
References: <20250613232754.451450-1-lyude@redhat.com>
	<-Nb6vjPZHPOAEBAwisXtc65Q3aL6WCStAZtDqTYk2YGfzexdwDyMVz0SdWR1P5gsSRnCNK2J_upQVlrn6JYjrw==@protonmail.internalid>
	<20250613232754.451450-2-lyude@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 17 Jun 2025 13:35:20 +0200
Message-ID: <87ecvia9dz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Lyude Paul" <lyude@redhat.com> writes:

> Just a drive-by fix I noticed: we don't actually document what the return
> value from cancel() does, so do that.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


