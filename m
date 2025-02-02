Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF841D8E06;
	Sun,  2 Feb 2025 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738501613; cv=none; b=a2TDwTV5GcnJx9XGVC6ZVWOSb21u+TjmUybz8DeYqeE+z2sxmMyo2d+xjFL2p26MtTYxweWkURxdtoZACc4dVAS2zqthW5Yy6+CBcI5zN7gE0Ro87/fgjvtONnW3Bin20aQCcsLEV/II9R+MX/hCrvvYcmSbeNLU2sBIxVpzpJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738501613; c=relaxed/simple;
	bh=jAxlx0oKPYhbCLOndVQegKI/zkoqLO2seAFvco9COAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxY/Nkt6lEYtXPdKUvGdE2rPvzKbBSAp8auUDGWZ4jcPC1d7Adp+BZ1jQInDoDC8UqkAXja1/Ci2IHa32URK9tykgEva7JMvB0tV3UvdkUCHMs1pJ0y2+/Dmb+vh/+vgkTYgc6epmqxXGet7JFbBaH/yK64B3YF+ug+cYUn8puY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=W68hCmAT; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="W68hCmAT"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 0E6D142CF1;
	Sun,  2 Feb 2025 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738501610;
	bh=jAxlx0oKPYhbCLOndVQegKI/zkoqLO2seAFvco9COAE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=W68hCmATDKo9EiH/xMtAcdph4x+tpmPmNtxtu+tx82fwJBpSxeMQbd/aWh5QzcOKr
	 G0ENO9GNbN8fsm1e0DDj/5x8+TN5kGJOiYdCd69beGzF/I1BDJ6P7Jq86/lwzga3cP
	 Dujgi22bP8LU8ZB+fDML04o3s7g4Y+AHNSFxOosjo/msGdpUFqAtZypGs7yghtqruD
	 TALKh0aV8LdMcXODde+LkiY6rV637Jn9uvFqd2LhpV135qKBe1dUi5H0eFWmpa+yIK
	 JI2eDyF5njHMDptbSKSnURDe34XUmvYbXU/u0qe+0ttIPTE3LlL6M0rgArHX61eeX4
	 sf2dw0y2kuKzw==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:05:48 +0900
Subject: [PATCH 6/6] rust: page: Make Page::as_ptr() pub(crate)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rust-page-v1-6-e3170d7fe55e@asahilina.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738501594; l=869;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=jAxlx0oKPYhbCLOndVQegKI/zkoqLO2seAFvco9COAE=;
 b=Yx1gVXvO3w0R4qdGomFIq+0RwKj460R5wvIbngoMuX6wHDoesKQMqRxKU0o3unMwKL69zlqrR
 En16s28Jr/vB388LQY8FUK1/cVO+HCe4enKe0BKjctozf6HJnt9HVbf
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=

There's no good reason for drivers to need access to the raw `struct
page` pointer, since that should be handled by Rust abstractions. Make
this method pub(crate) so it is only visible to the kernel crate.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/kernel/page.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 67cd7006fa63ab5aed4c4de2be639ed8e1fbc2ba..b7bce033b53682eca6e61f47e4fd3aa902da7900 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -83,7 +83,7 @@ pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
     }
 
     /// Returns a raw pointer to the page.
-    pub fn as_ptr(&self) -> *mut bindings::page {
+    pub(crate) fn as_ptr(&self) -> *mut bindings::page {
         Opaque::raw_get(&self.page)
     }
 

-- 
2.47.1

