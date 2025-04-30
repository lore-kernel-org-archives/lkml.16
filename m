Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB001E51FF;
	Wed, 30 Apr 2025 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746005712; cv=none; b=HAjJRy/IR+TeDDbJ43/BgVWP2suzQYw/qJtToy4JVjVARctiNnZ7UjxIKFo9WqUaq9p2N5Zi2kwHIuM4u4Czjmju+E/xQpMLk+RDNR23q5ODpntYKe9Bo7QFAjA3MuJDNURuwA4zR8lRk3WFXIuq1GTbzRaUa/uIlbZA3KgJbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746005712; c=relaxed/simple;
	bh=w0O6sqgVzKc2geyCtGY2gZzYcNDmZHMKOUlJyyMv0CU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WHDtj1ftJoJjphunl8VCH6VXfPmYekR4YBNWN1CJntL9ya18BxCWaknsiy5t7P8BLh56FTg5YqftAZk6tYJFH0uYbJgu2r3ovMV1HKr67hpTMzp78xXSTBW6DEcdFQQB2bUNtut6lS2LLmk+SD/6Z8fwqSdt46c+MNp2zqgRTe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhF6M12q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhF6M12q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15313C4CEE9;
	Wed, 30 Apr 2025 09:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746005712;
	bh=w0O6sqgVzKc2geyCtGY2gZzYcNDmZHMKOUlJyyMv0CU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=uhF6M12qG9rZgIwTDm7/Q+Icy+JMynocJWsQfhs/vPuxxSb7Up6/vYhzdk3mHVU/c
	 FCjxZbUviHAXAVrghCy6MHrxa3l/vqMCIqm7hk0dgIBW00+eiOk5pJlqTkxsoUlw1e
	 AbhbwpTQsduVjPrRVm5OaBhon+SUh5hiltXS5VMUwQPyv4RHzIaZq3OW1F0xsnPbGK
	 a1LP++RlOTCCwWQAXqTPgvkQaYZjDndShx3/G+IByHlvUNdKJmSTm0VzYxZTJvBhMX
	 c5Ax+v3ZjloVMfr/gdAdJFcgWtNPOVpvIzGy0t0MH0YntBFzJG5Y5iaCXlSIY8WM+Y
	 vZAtYYX8J3irQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Apr 2025 11:35:07 +0200
Message-Id: <D9JVD8VXL45C.2NHMV68432VV0@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] rust: use `UnsafePinned` in the implementation
 of `Opaque`
From: "Benno Lossin" <lossin@kernel.org>
To: "Christian Schrefl" <chrisi.schrefl@gmail.com>, "Sky" <sky@sky9.dev>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, =?utf-8?q?Gerald_Wisb=C3=B6ck?=
 <gerald.wisboeck@feather.ink>
X-Mailer: aerc 0.20.1
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com>
 <20250430-rust_unsafe_pinned-v2-3-fc8617a74024@gmail.com>
In-Reply-To: <20250430-rust_unsafe_pinned-v2-3-fc8617a74024@gmail.com>

On Wed Apr 30, 2025 at 10:36 AM CEST, Christian Schrefl wrote:
> This change makes the semantics of the `Opaque` implementation
> clearer and prepares for the switch to the upstream rust UnsafePinned`
> type in the future.

s/This change makes/Make/
s/prepares/prepare/
s/UnsafePinned`/`UnsafePinned`/

> `Opaque` still uses `UnsafeCell` even though the kernel implementation
> of `UnsafePinned` already includes it, since the current upstream
> version does not.

This would be very important to add as a comment on the `value` field.

> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

The change itself looks good. With the comment added:

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/types.rs | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
