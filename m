Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1CE280019;
	Tue, 10 Jun 2025 08:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542527; cv=none; b=lT+dPF4z1Q7eO6XdPrcv41XXAnTW9SIWwSUHJnUV0uxvMiH6X9AlMiR9vCimbRG/Z2Z+VVSwxSrBgRZ4uaKiIJHE/uSDTGIrVmUBMWUKYtvHELZCkaUEZiNiocXbxPy1RfilrzJi3KncWUACYmbeVv4uIvGvBO3FUqQngszUrQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542527; c=relaxed/simple;
	bh=xiwdfocDnhNk8+jp+dddzKGmdistBsJXvyXJKP03pFg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e8klHj1NrAEi6rGrhTWTBkZKzTj+xZpAKAvnLAqWCaaqk7oC8r88AaBj0HLFnstYjV+g8iJKBgEEqtHEdLw+W8RLgMUl1/cJyxKQjHJ68bwOeAMOwzD85jFOPGeh5Chvzb0SUPG0o3TeONNR73JONbimYTufrDDlkd1taSioE+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3PXOUiD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3PXOUiD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0C3C4CEEF;
	Tue, 10 Jun 2025 08:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749542526;
	bh=xiwdfocDnhNk8+jp+dddzKGmdistBsJXvyXJKP03pFg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b3PXOUiD+h2CQXqRgSTB74zUpSn2jOGTJRyvtQufig8mDwNco+gXL1B18x7rHaRTN
	 7a8TOPZs8VQZp3hpzBZmwPcIOfT0Jl9KbRqVXp2wvy+ePN0ldxAx3/biS4f5vLGJlb
	 4Ipqh4gRVXVBQ49b4nAqpyIL4Rb5nxSGODZG0P47c8w4i8dx1JbTO9qaiNI4Dg2DPX
	 Ozbpzboj6ZxdFnf5PpV77nufEUBKVhCnKyIjWNnlMOzvoqReYUfWuhYGYKS3kJUeED
	 nEh5bWHABVTJPj0WqlEDJuc1FjZPkXBskI15yymF/dueQkjjo6HQHZE7EYVyo04uqp
	 3AHQwlqNM3s0w==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 3/3] rust: time: Add ktime_get() to ClockSource trait
In-Reply-To: <20250609010415.3302835-4-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Mon, 09 Jun 2025 10:04:13 +0900")
References: <20250609010415.3302835-1-fujita.tomonori@gmail.com>
	<-OrPPXscT_4STsX2CDg5ki77Lz68HLwGbucr-EZuMsTXhLnEdyuDfskI5daZYIwNuMJN_CBXX-gW_RLrw_H-aA==@protonmail.internalid>
	<20250609010415.3302835-4-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 10 Jun 2025 10:01:57 +0200
Message-ID: <874iwo3tze.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Introduce the ktime_get() associated function to the ClockSource
> trait, allowing each clock source to specify how it retrieves the
> current time. This enables Instant::now() to be implemented
> generically using the type-level ClockSource abstraction.
>
> This change enhances the type safety and extensibility of timekeeping
> by statically associating time retrieval mechanisms with their
> respective clock types. It also reduces the reliance on hardcoded
> clock logic within Instant.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/helpers/helpers.c |  1 +
>  rust/helpers/time.c    | 18 ++++++++++++++++++
>  rust/kernel/time.rs    | 32 ++++++++++++++++++++++++++++----
>  3 files changed, 47 insertions(+), 4 deletions(-)
>  create mode 100644 rust/helpers/time.c
>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index 0f1b5d115985..0613a849e05c 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -39,6 +39,7 @@
>  #include "spinlock.c"
>  #include "sync.c"
>  #include "task.c"
> +#include "time.c"
>  #include "uaccess.c"
>  #include "vmalloc.c"
>  #include "wait.c"
> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
> new file mode 100644
> index 000000000000..9c296e93a560
> --- /dev/null
> +++ b/rust/helpers/time.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/timekeeping.h>
> +
> +ktime_t rust_helper_ktime_get_real(void)
> +{
> +	return ktime_get_with_offset(TK_OFFS_REAL);
> +}
> +
> +ktime_t rust_helper_ktime_get_boottime(void)
> +{
> +	return ktime_get_with_offset(TK_OFFS_BOOT);
> +}
> +
> +ktime_t rust_helper_ktime_get_clocktai(void)
> +{
> +	return ktime_get_with_offset(TK_OFFS_TAI);
> +}

This just caught my eye. I think policy is to make helpers as much 1:1 as
possible. We should not inject arguments here. Instead, we should have
just one function that passes the argument along.


Best regards,
Andreas Hindborg


