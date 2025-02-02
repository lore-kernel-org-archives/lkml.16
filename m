Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8894C1CAA80;
	Sun,  2 Feb 2025 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738501944; cv=none; b=Ng2Fi20KlsCD8P9XKXiK4y1KT33rMzkvKOB48UE0URTHkt+geJ6oLAMSxD6Ih7UrQtUmULBf03hQ0v0qeK8SsSz7ESt1zQKZCursS7ZV616UWlvlHnqaGo3j1e5McpoEtN/0b8cJAKSW8kzlGyRV+ItAsvIOelWsuK6cPwrdepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738501944; c=relaxed/simple;
	bh=i4Ab3HjgvvGhPot4YFk4jEpbbo5OwUVep0fKUcItVqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZvg9qicarpxAFYyH8Yw/Dap385Acw/fn/Kxm4mlAlblUAbRLFdR3Q6dwpMuE4msnsRNS7KjNY/Eh0HMaIYZYn7rca0rnUSBTasw8yTbzwBNzBRlJCkAUhjaGX7u1xnMi3FdSe6h9wu5cZ01CSUtv8kpVr62tEaJuEix2eH3CbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=j13+77B4; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="j13+77B4"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 0AE3C4269B;
	Sun,  2 Feb 2025 13:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1738501601;
	bh=i4Ab3HjgvvGhPot4YFk4jEpbbo5OwUVep0fKUcItVqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j13+77B4uDEiUiAv4VmriWW3KBa28+PJ+rGSbk9sG6oe+/Vc9YDMzmV7eNxU4Ovbe
	 fcZvQetCX39EHEG00wlsexJZddtS+9Q0eYfuh+ZpU/Itzhea8VcX+R07bC5utcvT7v
	 UL096wFWUozQwwAur7vKnZvzJ69/LuSXUmiP514WLvkNQb1OXmuodgNTxNI3s/WEjc
	 QBbr6bR2qpm7Kpe92vLmd24v4QKLjhjKs8O/Xjobmulm5S/oEk9r7ipJKAoSLcAmq7
	 0ek/0u6XcL/YLJ1hpUkz3zcAgRBVmKPlWUB9p9RA2cO9tz98sdjH0jBx+6Yvkz2U6m
	 9FiA+JGRbSyow==
From: Asahi Lina <lina@asahilina.net>
Date: Sun, 02 Feb 2025 22:05:44 +0900
Subject: [PATCH 2/6] rust: page: Convert to Ownable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-rust-page-v1-2-e3170d7fe55e@asahilina.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738501594; l=3247;
 i=lina@asahilina.net; s=20240902; h=from:subject:message-id;
 bh=i4Ab3HjgvvGhPot4YFk4jEpbbo5OwUVep0fKUcItVqY=;
 b=gUHcqq+q5mqcWHe6iq9f1yxIulhbcJU+/xJBVOGRrtI5rZfJKz3keo8IzgHn3owhyqq53MKvh
 /PP7nIbYuJVA+cau3fDKRYqaejphd+pg0QPqP6nq+mCd5L8wHvID/MN
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=tpv7cWfUnHNw5jwf6h4t0gGgglt3/xcwlfs0+A/uUu8=

This allows Page references to be returned as borrowed references,
without necessarily owning the struct page.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 rust/kernel/page.rs | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index fdac6c375fe46e1ba589f1640afeae3e001e39ae..0b6cbe02522ab6e6e1810288ad23af4e4aa587d8 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -7,6 +7,7 @@
     bindings,
     error::code::*,
     error::Result,
+    types::{Opaque, Ownable, Owned},
     uaccess::UserSliceReader,
 };
 use core::ptr::{self, NonNull};
@@ -30,13 +31,10 @@ pub const fn page_align(addr: usize) -> usize {
     (addr + (PAGE_SIZE - 1)) & PAGE_MASK
 }
 
-/// A pointer to a page that owns the page allocation.
-///
-/// # Invariants
-///
-/// The pointer is valid, and has ownership over the page.
+/// An object representing a memory page in the kernel (`struct page`).
+#[repr(transparent)]
 pub struct Page {
-    page: NonNull<bindings::page>,
+    page: Opaque<bindings::page>,
 }
 
 // SAFETY: Pages have no logic that relies on them staying on a given thread, so moving them across
@@ -71,19 +69,20 @@ impl Page {
     /// let page = Page::alloc_page(GFP_KERNEL | __GFP_ZERO)?;
     /// # Ok(()) }
     /// ```
-    pub fn alloc_page(flags: Flags) -> Result<Self, AllocError> {
+    pub fn alloc_page(flags: Flags) -> Result<Owned<Self>, AllocError> {
         // SAFETY: Depending on the value of `gfp_flags`, this call may sleep. Other than that, it
         // is always safe to call this method.
         let page = unsafe { bindings::alloc_pages(flags.as_raw(), 0) };
         let page = NonNull::new(page).ok_or(AllocError)?;
-        // INVARIANT: We just successfully allocated a page, so we now have ownership of the newly
-        // allocated page. We transfer that ownership to the new `Page` object.
-        Ok(Self { page })
+        // SAFETY: We just successfully allocated a page, so we now have ownership of the newly
+        // allocated page. We transfer that ownership to the new `Owned<Page>` object.
+        // Since `Page` is transparent, we can cast the pointer directly.
+        Ok(unsafe { Owned::from_raw(page.cast()) })
     }
 
     /// Returns a raw pointer to the page.
     pub fn as_ptr(&self) -> *mut bindings::page {
-        self.page.as_ptr()
+        Opaque::raw_get(&self.page)
     }
 
     /// Runs a piece of code with this page mapped to an address.
@@ -252,9 +251,12 @@ pub unsafe fn copy_from_user_slice_raw(
     }
 }
 
-impl Drop for Page {
-    fn drop(&mut self) {
+// SAFETY: `Owned<Page>` objects returned by Page::alloc_page() follow the requirements of
+// the Ownable abstraction.
+unsafe impl Ownable for Page {
+    unsafe fn release(this: NonNull<Self>) {
         // SAFETY: By the type invariants, we have ownership of the page and can free it.
-        unsafe { bindings::__free_pages(self.page.as_ptr(), 0) };
+        // Since Page is transparent, we can cast the raw pointer directly.
+        unsafe { bindings::__free_pages(this.cast().as_ptr(), 0) };
     }
 }

-- 
2.47.1

