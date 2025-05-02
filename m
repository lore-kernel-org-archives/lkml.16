Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427AE224B04;
	Fri,  2 May 2025 11:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186863; cv=none; b=FKWDjhk+Eg+IBCL26fuYYCTlqxKt6rXCNzLzLUdUY3ZZgH/9VDxKz7hPDxcVVlWr6NylCXHFzPU6uJwGeaWSULmCsd4Hgi0MWGg8dX3JiQUP/IjhrXUSG4AuXvcjrC37iMJKMb3adhAxz/khYS6F1vqgzMxGZOboW+W5dCsXRDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186863; c=relaxed/simple;
	bh=KqCHWYDAwRHrAXjGqjKGYmxy69emOTeIfd0UFqib5ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MNUjnO1qNyf50eBk7ev2QE33+00zWd75ZTcPzfJoKWJmRtvVVxEn1Ykxv70BPfFJzTFGfvLG7gbJRUP6id62z1kPSPZKLejF5PBGdxxKUVzEfuqCb1xBKFDruspJbRFA6nSzsqBVYS2ER434rADKSGlxBKNXOBeHqRhGPkvzyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8P57N0d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8P57N0d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C54C4CEE4;
	Fri,  2 May 2025 11:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746186862;
	bh=KqCHWYDAwRHrAXjGqjKGYmxy69emOTeIfd0UFqib5ig=;
	h=From:Date:Subject:To:Cc:From;
	b=u8P57N0dYjZpwTQdC+xwzLLCR+Ki9PAQNaMLOL41u/wUZPzyiLI//QOGa7RhBkxOk
	 xUXF9dwMYy5viMaHfG3yiyrG/e1XRvatgGYGk/fSBXW6PbTNNof/zGqn0or1sNpQAG
	 +mt4wkTf3n8ZDKTSrtotPL0N6G9qqVy+tnokCy176/2fFJDhSKfiYIPKzs8hN+r8uh
	 T1B7BsiyK7JI6jc/FbUzSL94XXUTghSbYhTYuNerSKzFbTpGQGgnjZyCZsZgfpho0C
	 FO/fVClfuip2Fcs5ONT3XJ4o16Ut3ycQd9qqJAdrLEZ7tJk9JmHSgrVpEi5Bg0I51D
	 cx8W5S0rEyhWA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 02 May 2025 13:53:57 +0200
Subject: [PATCH] rust: elaborate safety requirements for
 `AlwaysReferenceCounted`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-aref-from-raw-v1-1-eb0630626bba@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFSyFGgC/x2MMQqAMAwAvyKZDbSVOvgVcaiaagarpKBC6d8Nj
 sdxVyCTMGUYmgJCN2c+k4JtG1j2kDZCXpXBGeeNNw6DUMQo54ESHiRrzdxRv87RgzaXWn7/3zj
 V+gFXG9WhXwAAAA==
X-Change-ID: 20250502-aref-from-raw-e110b3e6dbf5
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Oliver Mangold <oliver.mangold@pm.me>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2101; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=KqCHWYDAwRHrAXjGqjKGYmxy69emOTeIfd0UFqib5ig=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoFLJhwDA4cSoj8/KWclBEo55Y0qMuTSEhDKUhd
 NkIkIfO1TOJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBSyYQAKCRDhuBo+eShj
 dyOGD/9Rn71Ptf+mGiZ/TPi7BWgcJ7eg66sdRHDTLwo4eLB6g/33W0pAQi/kDEk71O2jfJuF0za
 XQGcSrrARxyiuWM4PgNO++ZGfPXHaYiQbjFlfCuJ0PVAzy2s+Vq8o/+6OHeZ8O12lwC/IMyiL1Z
 a47o937r4OF7j/ZDmixTfaiVEjgWMCsRJHXSTPtqrHXN47yL+52Aj+sw5+AD/8BEd3jGUAEdOFC
 gMieNPF0a37XK93v1E41/eifVMX5yVL7kF033zfWVdiICCktrv9aq4H78089wKJw/eBF2oxKuMA
 9aeWLpis/VY8fA85FNJAOOyZ+Kx18AR9CjucQlpnXLvT/T81eXkdLHXhsCacJLQsODI7REVkerx
 CazNw2IQqW14xQpNtwFG+rl0+zISTgaABclaKLiWkwGvJjbWKOdCEoDxblVCwSy6Ooscp1nwMKM
 a56kwocIg/NfqhtRCWfEYQpt4iYyQa3RzjtDggEFt+HztaEeK9Zfj0E9+SivOqBWWRAbdg4JyW9
 VW362i/m3a3vH37CXNu3Rp7Dr9keDpV3d/B7uW5+SHkQQE3ZRJ/pOOKRFU5xyUqZsRketf0pGla
 fMRTw2Nmebo6NHoJIBnAWbJf+67thwrn97dYHvoUriRsHonpSxS3uqfBEmbRkJ6iPIX1Ccaz3Hm
 emaHNhxIV8f6XzQ==
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
 rust/kernel/types.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9d0471afc9648f2973235488b441eb109069adb1..193a1356f0df6fede428498485aaef19b4c845c6 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -409,6 +409,10 @@ pub const fn raw_get(this: *const Self) -> *mut T {
 /// Implementers must also ensure that all instances are reference-counted. (Otherwise they
 /// won't be able to honour the requirement that [`AlwaysRefCounted::inc_ref`] keep the object
 /// alive.)
+///
+/// Note: This means that implementers must prevent users from directly
+/// initializing the implementer. Otherwise users could initialize the
+/// implementer on the stack, which would violate the safety requirements.
 pub unsafe trait AlwaysRefCounted {
     /// Increments the reference count on the object.
     fn inc_ref(&self);

---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250502-aref-from-raw-e110b3e6dbf5

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


