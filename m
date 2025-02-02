Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A021D63E9;
	Sun,  2 Feb 2025 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738501946; cv=none; b=H5nv/SdiqKv3SHrzwqshZsjc/lYeXrTI+jEHW54SFEwPGsMTdEyA1ZaAzC5zsDByDgNF1e+CK4Qi3O3huzeKA9hAc+Xm6W9WDMq9U2ssi2VmLsB6T3673VwyUa70mCwUQLnH/C1D24wh6NTNP+vkvZUmzSMABPOVOqcOqFyB46k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738501946; c=relaxed/simple;
	bh=wOJkjoDFrNnJZtmpG6nyyGH0hn+2uCbf5uZhqGJfbOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXjzO1z/1U8yE8qVrHeg2kh0jl7fLnHqCYlzxMd33hYU9PH3HD3KZT2YfElopCjC4jjRYVaSoIrqzW79vF6PybO3JD3Nbp27KEYGTcPSE14ukg0fH8KLuOne2ycnz3Ep4bFPZwN2hS0tzTK6BfLR/izcNeSEHg8HPOfV1JabF/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=Fvp6scyW; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="Fvp6scyW"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 4777C426EE;
	Sun,  2 Feb 2025 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738501603;
	bh=wOJkjoDFrNnJZtmpG6nyyGH0hn+2uCbf5uZhqGJfbOE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Fvp6scyWPHGaA2V+QtyuriDLEbcXsPS3f5VQzFRpnxbamCxSPxBedHEen0IFXWxI3
	 YpG4MxVaHryxse2Zqd/1ZE5kfg99dK0flO2MBOZwVwfLEIa8aIY9t/BtajndBSbJKP
	 vXpovHQtURT/97O6uaWV91LU/u2gQkiSCOdP+mlZ16N76lYLszA9uFuuB3NSJMcoR3
	 eBc0Pwz76K/7PDiK61AjtwRc6LVbD6Zfxe7H2fG/uUEMNx401uBjatAwdXSc9FhxlB
	 u35iD2Iy3pgteYWwwyJC5K0Am0M6ZTqwH9j72pgRPDMuWGuEyUswkTqgTPOnu+iml2
	 PmrctezEUpDEg==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:05:45 +0900
Subject: [PATCH 3/6] rust: page: Make with_page_mapped() and
 with_pointer_into_page() public
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rust-page-v1-3-e3170d7fe55e@asahilina.net>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Valentin Obst <kernel@valentinobst.de>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738501594; l=1782;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=wOJkjoDFrNnJZtmpG6nyyGH0hn+2uCbf5uZhqGJfbOE=;
 b=VjxsvTln6z9TApE7nyNtlOcBYymzTzlwnEi76qRMUo4C7bukspMosskksBKgJRb59MWQFy45P
 mX7u6UyqsyPA8vfivipTf0JTGImVnVxXhDriizPvUyNcNyrkbI4lmXC
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=

Lets users do (unsafe) complex page read/write operations without having
to repeatedly call into read_raw()/write_raw() (which may be expensive
in some cases).

The functions themselves are not unsafe, but they do take a closure that
receives a raw pointer, so actually making the access requires unsafe
code.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/kernel/page.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 0b6cbe02522ab6e6e1810288ad23af4e4aa587d8..fe5f879f9d1a86083fd55c682fad9d52466f79a2 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -101,7 +101,7 @@ pub fn as_ptr(&self) -> *mut bindings::page {
     /// different addresses. However, even if the addresses are different, the underlying memory is
     /// still the same for these purposes (e.g., it's still a data race if they both write to the
     /// same underlying byte at the same time).
-    fn with_page_mapped<T>(&self, f: impl FnOnce(*mut u8) -> T) -> T {
+    pub fn with_page_mapped<T>(&self, f: impl FnOnce(*mut u8) -> T) -> T {
         // SAFETY: `page` is valid due to the type invariants on `Page`.
         let mapped_addr = unsafe { bindings::kmap_local_page(self.as_ptr()) };
 
@@ -142,7 +142,7 @@ fn with_page_mapped<T>(&self, f: impl FnOnce(*mut u8) -> T) -> T {
     /// different addresses. However, even if the addresses are different, the underlying memory is
     /// still the same for these purposes (e.g., it's still a data race if they both write to the
     /// same underlying byte at the same time).
-    fn with_pointer_into_page<T>(
+    pub fn with_pointer_into_page<T>(
         &self,
         off: usize,
         len: usize,

-- 
2.47.1

