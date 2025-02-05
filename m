Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89B13D897;
	Wed,  5 Feb 2025 18:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781561; cv=none; b=WFCmmvuYQ+Ju9EV6xO2QZUrQM0ej5ipfr5SsYVznr2xaW5mmpfiTlMcWWOOMG3QqUryaXp1aK+qNWmFlQDBrPg7Y/P8YZcauBCBnnUPe/Ut1F328lT70pxJPMn+Z4NrbOUIYLLK3vJTtyd5h07t1b/r+VahRxdOsqffs8ou7y+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781561; c=relaxed/simple;
	bh=LJIuDNTxMKaFIbMEED/OzQUZxotbbZSUR47KFTSrgtI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A1X9iH+jm+kxeBdD/PgO+V9zryIQ29DMsaNQFFKviPebDVLIsNFpj+ct5LGVxgiMZT6xLm3EqeY1REn44vpHFh/zz0Ksw258T+pW0E5juARJ6BlQxPAlrYZIkipsEZjX8joyrJkyrpLCMUqDb9/37CblYqz2uX+GCGl35ZjTD3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=lMOJCWjw; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="lMOJCWjw"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738781549; bh=LJIuDNTxMKaFIbMEED/OzQUZxotbbZSUR47KFTSrgtI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lMOJCWjwd9tjp0oWB1sySUeXZQ2KjVmAOSS9tWmUGAmxzmEfQ3qi3zds4F3xbsA7Y
	 brmwgXL9Bg4Duqzn2vkuI7i+X/a0fqXTO7OBfTO2G5eiBg+xakJErGy0yqlW+SAXvb
	 7/dfxcEq8tZnJyh34pVN35NczHmG18yi855H3AVk=
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,  Benno Lossin <benno.lossin@proton.me>,
  Andreas Hindborg <a.hindborg@kernel.org>,  Trevor Gross
 <tmgross@umich.edu>,  Peter Zijlstra <peterz@infradead.org>,  Ingo Molnar
 <mingo@redhat.com>,  Will Deacon <will@kernel.org>,  Waiman Long
 <longman@redhat.com>,  rust-for-linux@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: add accessor for the lock behind a given
 guard
In-Reply-To: <20250205-guard-get-lock-v2-1-ba32a8c1d5b7@google.com> (Alice
	Ryhl's message of "Wed, 05 Feb 2025 10:54:50 +0000")
References: <20250205-guard-get-lock-v2-1-ba32a8c1d5b7@google.com>
Date: Wed, 05 Feb 2025 19:52:28 +0100
Message-ID: <87h658p6kz.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alice Ryhl <aliceryhl@google.com> writes:

> Binder has some methods where the caller provides a lock guard, and
> Binder needs to be able to assert that the guard is associated with the
> right lock. To enable this, add an accessor to obtain a reference to the
> underlying lock that you can pass to `ptr::eq`.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

Thanks,
Fiona

> ---
> Changes in v2:
> - Rename to lock_ref() to avoid confusion with lock().
> - Rebase on v6.14-rc1.
> - Link to v1: https://lore.kernel.org/r/20250130-guard-get-lock-v1-1-8ed87899920a@google.com
> ---
