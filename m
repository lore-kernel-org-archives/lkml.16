Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109F421A426;
	Tue,  6 May 2025 08:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520188; cv=none; b=G5bjHLIdmRu0mRmoJ4mdhKjMQM1nn7cseI5pztQHyvg9kNm7GuNVCe80E/PTf2+p2WmPwy8fLW4Le6s3q7MqmegsbixoGxeNvqG8Lxm7/CsQIc5H3SQHoYp1z4DWGV6s6wccXe2IRL8EQGVD0vSqIJg7FWESs40WtBK37R9f7n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520188; c=relaxed/simple;
	bh=WhLEml+AptQul5nllYb6LOZk0t4tCg47WLkD/8tURik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aEpxCZ88ZekCn5L52t5no7MeaEJeRbMgbAQhUHUkGlNvttETovrlAKa58reh3RCbndKNRx6UHlYWOO7I1RKbd8GJLsvZwRYxtu7qoul07ydKwhr9h6YyAgo+quM9FktFmuVrTgm95WoBuGAEqfqeLdtgg7q8edzMrffgcfsltIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5LKXlQ8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5LKXlQ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77068C4CEE4;
	Tue,  6 May 2025 08:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746520187;
	bh=WhLEml+AptQul5nllYb6LOZk0t4tCg47WLkD/8tURik=;
	h=From:Date:Subject:To:Cc:From;
	b=P5LKXlQ8UsdwMJ/Xjs+JCHafO4I8RiEvoZkL+lA4JnQBefK89oc/LW9baAU8i+T0A
	 pgSa+vMfuqIKNi5NQS0KV9FPPb/a2XfUIVodQawSoMTxjDsqnKxWoY0D4KoO1y3ZLN
	 JRwKKsd1W7qRKthtUv6XkaWlWKmddJBuarFlQY/MkDNozD/vlLjPUDqFivh87LrGkH
	 v7anfRnHPhmEzd0ywI4CxS1/vH+KkTga7WFl6rIH8YC4nARF/p3MDDY5oOdy8TprNH
	 qS1xxAW5S19Y3TzG4lAr8JlkDKs/L+PNCP1djh7tOe0eRo/LPV5el/wOyqJZweSw5y
	 o3elbzjiaff5g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 06 May 2025 10:29:02 +0200
Subject: [PATCH v2] rust: elaborate safety requirements for
 `AlwaysReferenceCounted`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE3IGWgC/3WMQQ7CIBBFr9LM2jFAAwtX3sN0AXZoJ2oxQ4Oah
 ruL3bt8/+e9DTIJU4ZTt4FQ4cxpaWAOHVxnv0yEPDYGo4xVVhn0QhGjpAeKfyFprUJPbgzRQnO
 e7eX33rsMjWfOa5LPni/6t/4rFY0aKSjXK2dcCP58I1nofkwywVBr/QIfz+ADqwAAAA==
X-Change-ID: 20250502-aref-from-raw-e110b3e6dbf5
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Oliver Mangold <oliver.mangold@pm.me>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=WhLEml+AptQul5nllYb6LOZk0t4tCg47WLkD/8tURik=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoGchjMzTNiv8klxRTvtq0fnYEKHWGUbKeke1yf
 Z9dOoqIafKJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBnIYwAKCRDhuBo+eShj
 d9ehD/94t83BKIZ5kbYfn3JOrjflThy5UE2tppJUsPMLX7Ib6QODguGxnIXix++6rEES7aG8PxB
 1PcN+5smBNnRKCTDSKHKeMGvXz5/Ee5sQvHAZHQ6gtTIudbMDIJ1BxZJ1hcAusXSXOuBVzHqNTQ
 MIUei2MQwA57N1fEkEh4cCxxZOj0xYF9WhCi58jmEO3czbfhg6iiDqeW6FIXukndyaFxEB/5tzb
 SD8orwbiDKrKrMm/M+AapLDji99TwQLhDar5EkzhtwUFgmK7CmVbFcdJaXMHVEzR+QvZrgAb/9i
 GdKHBYPqqw4eJKIiVBQVugbbamlwKpQB3MfPc6/TKIlSqbJO0jYy36oOMrYtF+z1XguyqeuDJAS
 5xI4QW+1vuvCrBbrCxRiG4R0L6DhB1j3RyjVfhz8KqSzYDO3X2KluXI3y31h7dsu6aYW4ZPls1p
 kiwi8IcCwli751/kOQg3pe4Q8YlbtUThuiivrF29LTAhWBoDkqG+0wE/wP03KW8XJoQ2VzBjYwD
 5XZRfavqbNDt+MLuNgIVmHZcPB/fGL/iOUJhx/qgbycau+U4eRdi1RxGaRWDlMVrxuwqPqGiyLC
 932G13C6xBaWIKm22IsQAYbpbd7N6gbEdjlUYFkfOl18gQVsMcw1X+EVXhli6iTGTef7/9667z5
 YP2PrwV3a1L+t2g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Clarify that implementers of `AlwaysReferenceCounted` must prevent the
implementer from being directly initialized by users.

It is a violation of the safety requirements of `AlwaysReferenceCounted` if
its implementers can be initialized on the stack by users. Although this
follows from the safety requirements, it is not immediately obvious.

The following example demonstrates the issue. Note that the safety
requirements for implementing `AlwaysRefCounted` and for calling
`ARef::from_raw` are satisfied.

  struct Empty {}

  unsafe impl AlwaysRefCounted for Empty {
      fn inc_ref(&self) {}
      unsafe fn dec_ref(_obj: NonNull<Self>) {}
  }

  fn unsound() -> ARef<Empty> {
      use core::ptr::NonNull;
      use kernel::types::{ARef, RefCounted};

      let mut data = Empty {};
      let ptr = NonNull::<Empty>::new(&mut data).unwrap();
      let aref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };

      aref
  }

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Express safety requirement in terms of ownership rather than
  initialization.
- Link to v1: https://lore.kernel.org/r/20250502-aref-from-raw-v1-1-eb0630626bba@kernel.org
---
 rust/kernel/types.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9d0471afc964..52683d686c8a 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -409,6 +409,10 @@ pub const fn raw_get(this: *const Self) -> *mut T {
 /// Implementers must also ensure that all instances are reference-counted. (Otherwise they
 /// won't be able to honour the requirement that [`AlwaysRefCounted::inc_ref`] keep the object
 /// alive.)
+///
+/// Implementers of this trait must ensure that values of types implementing this trait can never be
+/// owned by value. Instead, values must be owned and used through a pointer type. That is, a type
+/// that implements [`Deref`].
 pub unsafe trait AlwaysRefCounted {
     /// Increments the reference count on the object.
     fn inc_ref(&self);

---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250502-aref-from-raw-e110b3e6dbf5

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


