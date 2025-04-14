Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E012C1EF380;
	Mon, 14 Apr 2025 20:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660839; cv=none; b=L4XuixtbFeEAxtovmLhrbLlQLOjPkP9Kl/MvTMBBifR9uNSKK9yJvDbwHc40gtrSeOs5DHHqq6f+5B8TgNs3ZEJb3UNnA8m6swFpgFmdnJepkmXhI0fkT7LskOZw5XwgGW3BwD10S49OsasR+UXXPhYZOMd9P9G752VLfu+T9qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660839; c=relaxed/simple;
	bh=HRIs4FcYNBo/gPStxbe2bQzkhruNBS1+wehDnlCQTGE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kF2a7u3hXo5xsSHLI8jotux4ZQaH8AI0S+5P3L5juImj+oDPD4nTwwji7tmvRSNHfS0W6OpZeRRojp0UYog1ubjlRkvAACIjLFiK0XenEXcLjnlEbkZVo3DAlSyhEwgysHwhs6+fARpifcrkEQm90TaUe87IKmGHrpINwp5oO0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=RzzQ1yQ7; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="RzzQ1yQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744660835; x=1744920035;
	bh=OQ9/Gjm99d4oeAYMbDxnJSkRL5ElNUBWZlWMMBiHLjw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=RzzQ1yQ7aEZkOpSuJa+37b2ta6zHXHLFNwWgVBHzrwKpmyXhJYV5MdboRqdTP1E2t
	 1Xvb9+XZgV5jACH5KUh+o0IkzOTFCfrYVPTD40ZDzwSCc5URILr851reVUsITLMSSY
	 XhD2T5zZt1hbGJsMjn0R4UZoGrp17qLlxQiaEzs6EK6H+6JRqocX8YcA03maJz0gmp
	 kgn3m5rebXzBcInokERBuvRMG2WGwcxM5dDf31TGuGWpbEOy8bL0BO+pOqsrkxGns7
	 T4eQ/4IICgmCKMowWRJm3DwvCq1rA1kEH+m7wieqTmRt/4N4ZQ8Vz6yqP7iCGmtoZ8
	 iOU58BD7yyRaQ==
Date: Mon, 14 Apr 2025 20:00:31 +0000
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] rust: pin-init: examples: use `allow` instead of `expect`
Message-ID: <20250414195928.129040-4-benno.lossin@proton.me>
In-Reply-To: <20250414195928.129040-1-benno.lossin@proton.me>
References: <20250414195928.129040-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 8a8217c05dba5f60d7cbc00d8d47260c22e3295a
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rust 1.78 doesn't emit a `dead_code` error on the annotated element,
resulting in the `unfulfilled_lint_expectations` error. Rust 1.85 does
emit the `dead_code` error, so we still need an `allow`.

Link: https://github.com/Rust-for-Linux/pin-init/pull/33/commits/0e28cbb895=
bd29f896a59b40e8ed506ea7bef13c
Signed-off-by: Benno Lossin <benno.lossin@proton.me>
---
 rust/pin-init/examples/pthread_mutex.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/exampl=
es/pthread_mutex.rs
index f020dd266506..e28a0bfd4179 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -42,7 +42,7 @@ fn drop(self: Pin<&mut Self>) {
=20
     #[derive(Debug)]
     pub enum Error {
-        #[expect(dead_code)]
+        #[allow(dead_code)]
         IO(std::io::Error),
         Alloc,
     }
--=20
2.48.1


