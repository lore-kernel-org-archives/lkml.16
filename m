Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18860433D1;
	Fri, 30 May 2025 11:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748605562; cv=none; b=fad0N5yt+wHEuKebx2jzXzAvir9rTLgj7a9DkJ75zLCoB3AKYWsr5cc/0HEhvu39JTQgjOWoayZoA319SD1bK5C0NEEqbUyVi3XlJWJVzXuWxmzcEtCpK31B1hKmxM83ZSq3q6n7rEKFCXLJMRIpnqJcru6brslAxXQo9mmgXig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748605562; c=relaxed/simple;
	bh=bBESX5pu0B1WDPUwO2dt28IZuHECzaAMZLfDOrB0mpE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=upoUhWg5dtz1zFL7TrMy3ZPquzxIaOrp/E7wlzoLu7mjmJUhNZCZzWbgYLT3YlPaMzo2VohiZ/8zzVXeW5oftz3/fKsMuHNQzX6iKoJp1vyrqpWnuQ5G1rfiJAzwhMR0bC378mLWSRhe8od6m1KsTMYu6lb3afEBdnTUN+WMP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ppHY1032; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ppHY1032"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFE7C4CEEA;
	Fri, 30 May 2025 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748605561;
	bh=bBESX5pu0B1WDPUwO2dt28IZuHECzaAMZLfDOrB0mpE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ppHY1032KHeEKbOwI/6OqClEv4QPVs9APxeuWtnLXZKBk2NhMgiBgmnWQTmSw1OMJ
	 Kvm4Tzsmlbs607XliKsgEHUEa7vsWyzafkgjbyhFh7M7SwBMaGG+TgS0Q9NQfd/80H
	 IMIgOFcpUv4QjchAoTPeLqj6EjJee0LhMFt0m37tq1ezhpEFn3z5LsJf2iz2Q7DQD3
	 hr44J6wkVfLKj2vdcGKAj+Sx/9s4vNjFinRK8/JosupK8QNYrm8oQ/HlMACcO4KPLU
	 krh0WnLJaqXIW4ol3EO6Ro1MQAXho2jLRuG8ex2nNS0lF0EZywBrvLohknYfOl1A7k
	 14MKO8EizBd2A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org,  boqun.feng@gmail.com,
  frederic@kernel.org,  lyude@redhat.com,  tglx@linutronix.de,
  anna-maria@linutronix.de,  jstultz@google.com,  sboyd@kernel.org,
  ojeda@kernel.org,  alex.gaynor@gmail.com,  gary@garyguo.net,
  bjorn3_gh@protonmail.com,  benno.lossin@proton.me,  aliceryhl@google.com,
  tmgross@umich.edu,  dakr@kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rust: time: Make Instant generic over ClockSource
In-Reply-To: <20250504042436.237756-3-fujita.tomonori@gmail.com> (FUJITA
	Tomonori's message of "Sun, 4 May 2025 13:24:34 +0900")
References: <20250504042436.237756-1-fujita.tomonori@gmail.com>
	<20250504042436.237756-3-fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 30 May 2025 13:42:04 +0200
Message-ID: <87jz5y1g1f.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:

> Refactor the Instant type to be generic over a ClockSource type
> parameter, enabling static enforcement of clock correctness across
> APIs that deal with time. Previously, the clock source was implicitly
> fixed (typically CLOCK_MONOTONIC), and developers had to ensure
> compatibility manually.
>
> This design eliminates runtime mismatches between clock sources, and
> enables stronger type-level guarantees throughout the timer subsystem.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


