Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1BEEC2;
	Sun, 22 Jun 2025 09:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750583809; cv=none; b=uQAmpeVKTgvQL/9QnAzzpakvcIGNcVpCI0hq5KnBJNysTCgG4k5l+LzVtudh+D6lSnCLzOt2gkvIRRLFdNZlexLKEbb/6gm+z9/Pad9laRtg7DDZl8WXZO2ezccyIGFI65Kp6iLTnkBtgTzKDlbir/b+6RVg0KVOn7CAj5E4mto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750583809; c=relaxed/simple;
	bh=J6/eknM/yf3tVUC/MS7jNlQ0yZHPQ4nYhz4Br9sgB/4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=kYWDVx3EZocoA/sUGE+Pse10i0MGrRIXlA74ecqdYCCnsdePD80muGdmQlFYm0zmmRkYkABvs7ZeJTdeBcXzfAgST+vgnLS4lgDbY8REGDwBjgTuC0FowQi/R+qrPYkdl6yJG2Rwf19pS1GdtD2OEbXn0uFtpl4ll491GEgsyog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8xUhCGw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8xUhCGw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A007EC4CEE3;
	Sun, 22 Jun 2025 09:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750583809;
	bh=J6/eknM/yf3tVUC/MS7jNlQ0yZHPQ4nYhz4Br9sgB/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8xUhCGwtz4QCWvbKDWg3Pc4QK0uW1hVby99JJD6U35xdAUkiA5tN4C4/qO5qpJYO
	 yYPQbpW7N5BACI8QqUhxvFdUWn96af/s6pDbB+dO7wB65Fyg1g56aryffrAyyKTwQa
	 MVdQH5UXKztM7EzY5wAKYS3WQlKYv1VAu88oaklO2iUo6/rMf/ChGEm+axJ65i/JYa
	 2wuStw09cvAMnNUdGvs+dRHL8KmL7auzoVfd2xnnLArn56y1Qv7doitHKfmXRJZ/Do
	 RDr3tjVBZ2TVVDL7lOXlx+cpvt+BU/ZLKPqpo0CSxBvhwvKPA+eK8fH4hPPzmZg6rK
	 kBrKRy4OG8MPA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Jun 2025 11:16:44 +0200
Message-Id: <DASY61F7W9N7.1LP3VIKAZ9UA7@kernel.org>
From: "Benno Lossin" <lossin@kernel.org>
To: =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <dakr@kernel.org>, <peterz@infradead.org>,
 <mingo@redhat.com>, <will@kernel.org>, <longman@redhat.com>,
 <felipe_life@live.com>, <daniel@sedlak.dev>, <bjorn3_gh@protonmail.com>,
 "Lyude" <thatslyude@gmail.com>
Subject: Re: [PATCH v5 0/3] rust: add `ww_mutex` support
X-Mailer: aerc 0.20.1
References: <20250621184454.8354-1-work@onurozkan.dev>
In-Reply-To: <20250621184454.8354-1-work@onurozkan.dev>

On Sat Jun 21, 2025 at 8:44 PM CEST, Onur =C3=96zkan wrote:
> This patch series implements Rust abstractions for kernel's
> wound/wait mutex (ww_mutex) implementation.
>
> Changes in v5:
> - Addressed documentation review notes.
> - Removed `unwrap()`s in examples and KUnit tests.
>
> Suggested-by: Lyude <thatslyude@gmail.com>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library=
/topic/Writing.20up.20wrappers.20for.20ww_mutex.3F/with/524269974
>
> Onur =C3=96zkan (3):
>   rust: add C wrappers for `ww_mutex` inline functions
>   implement ww_mutex abstraction for the Rust tree
>   add KUnit coverage on Rust `ww_mutex` implementation
>
>  rust/helpers/helpers.c            |   3 +-
>  rust/helpers/ww_mutex.c           |  39 +++
>  rust/kernel/error.rs              |   1 +
>  rust/kernel/sync/lock.rs          |   1 +
>  rust/kernel/sync/lock/ww_mutex.rs | 541 ++++++++++++++++++++++++++++++
>  5 files changed, 584 insertions(+), 1 deletion(-)
>  create mode 100644 rust/helpers/ww_mutex.c
>  create mode 100644 rust/kernel/sync/lock/ww_mutex.rs

Please don't send new versions with this frequency, give others time to
reply and wait until discussion dies down.

---
Cheers,
Benno
