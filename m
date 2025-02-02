Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778DD1D5ACE;
	Sun,  2 Feb 2025 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738501610; cv=none; b=M9RIOk7a0RU5bkn0I2qFXvzLNoFHZQqT/jxAmpDF80A4kCMYqlbT69mfkcPpq1ngi73Nw52NR81RblZYhOsqse3tmI3c/ChUGXLle6xhVKPmGDR/KkrQVXswvXW88bxDcoVxJWpMzgnhosqFlw+jrTTfzwuY2LKVrcGa4ob6wXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738501610; c=relaxed/simple;
	bh=0hDjuQHDG3NyTLjzY3YRf98j+prtIAJUg+wcnreGVnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrRlus5aMbgbTM4ISZemvY6vfuCtAuXK8Jz3B0j8+5uPkgnuIUs07VoTFmTCy2t6WzrCwGlTJI0/NaiJ8UgzgJT7C1JMh799iyD1ioZSIdbX9V0Lb7hu7FcV80zKz/t/j4lc41XK2MyiDDZadpSBaBkvuA+eI6hKKly+BJyuB58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=T2h4y9OU; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="T2h4y9OU"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 8453742769;
	Sun,  2 Feb 2025 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738501605;
	bh=0hDjuQHDG3NyTLjzY3YRf98j+prtIAJUg+wcnreGVnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=T2h4y9OUV23hl0E27AGlIKbSuOI9FSr/Qfou1x4vaF+kpMEWyoB7lE2oXSt2ZC4W/
	 Vcaf5Jwqm3JTOsI85ryMwJoWD1yS1mJqti15Dezaeahhg22IbqOwd+iujr4UKk7aug
	 H0lVZemGdZg71svn3NaFnIvjah5m2azg1qcWNwNdaXJ218VVIrliNcN6rfxeqOp7Tb
	 iZ+YGqU0Kkrc1su5UsafpzWEtc9JWSeHMoheGQTvGzVkSc/LQ9cP/wuQkcoS6bp/2g
	 XCjB9AVWWdiP50DvfftpFU+nBZXXL22EjJ36ptc8mlCu81Dg3K0r/izBMeiNI5rVMi
	 8ehO67zamuuvQ==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:05:46 +0900
Subject: [PATCH 4/6] rust: addr: Add a module to declare core address types
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rust-page-v1-4-e3170d7fe55e@asahilina.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738501594; l=1443;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=0hDjuQHDG3NyTLjzY3YRf98j+prtIAJUg+wcnreGVnU=;
 b=StouHNNdGl6LXXun36/Ktt4NhZHoitHEaj40BWBfZvKzmLuZ2Y4LDldrYuJmpt3jJeuKqqIwg
 B+kPBJA/qaKDiEavoI6E1b0JF0yulanuwYHgzUwBeL6uQl0npRPVkny
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=

Encapsulates the core physical/DMA address types, so they can be used by
Rust abstractions.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/kernel/addr.rs | 15 +++++++++++++++
 rust/kernel/lib.rs  |  1 +
 2 files changed, 16 insertions(+)

diff --git a/rust/kernel/addr.rs b/rust/kernel/addr.rs
new file mode 100644
index 0000000000000000000000000000000000000000..06aff10a0332355597060c5518d7fd6e114cf630
--- /dev/null
+++ b/rust/kernel/addr.rs
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Kernel core address types.
+
+use bindings;
+use core::ffi;
+
+/// A physical memory address (which may be wider than the CPU pointer size)
+pub type PhysicalAddr = bindings::phys_addr_t;
+/// A DMA memory address (which may be narrower than `PhysicalAddr` on some systems)
+pub type DmaAddr = bindings::dma_addr_t;
+/// A physical resource size, typically the same width as `PhysicalAddr`
+pub type ResourceSize = bindings::resource_size_t;
+/// A raw page frame number, not to be confused with the C `pfn_t` which also encodes flags.
+pub type Pfn = ffi::c_ulong;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index e1065a7551a39e68d6379031d80d4be336e652a3..eb1a80ba8ff83ab2d1b3b1d11fed4fb704c7a4f5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -29,6 +29,7 @@
 
 pub use ffi;
 
+pub mod addr;
 pub mod alloc;
 #[cfg(CONFIG_BLOCK)]
 pub mod block;

-- 
2.47.1

