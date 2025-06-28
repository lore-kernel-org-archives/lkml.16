Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D7125771;
	Sat, 28 Jun 2025 16:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751129502; cv=none; b=Pk5gfzd4KERIud3QHKnITq5/GXLSF77Oig1GKwCzQ2LtwlPi8wTkLRmnpzF6vhIGa23yeV85fnpPvXdjCSgxV8ZGeq0N8QKmXS+55pmkCpiPrjS4q1z2hhFXjZaIR1M3UFYAlY3oSbmcBcWvzqlw9odkoZruTSVMsk/QpfcsQm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751129502; c=relaxed/simple;
	bh=d6lOrT2Qlv9MzEMPDqk7QTa8C21pLsDh/rvOKyGTeuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BzQMd8r+ucZ++MpRMoZo6zWjLKLHDv/aIbWETQ105s+wZnCqpMtjTj9UadsLR/7oDF1Nyf8ZuqTFsUOWV8R0axeoLFAJ+vkgMSCKRSQBSmO+2TkvfaoqOkF78JRs1AWFtFzWBHdejXNvyG17jnRZhnmdSxtkCqALef29AZdiNB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sNB2yb5I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sNB2yb5I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7996BC4CEEA;
	Sat, 28 Jun 2025 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751129501;
	bh=d6lOrT2Qlv9MzEMPDqk7QTa8C21pLsDh/rvOKyGTeuw=;
	h=From:To:Cc:Subject:Date:From;
	b=sNB2yb5IVIXNQSsUv8NMJcPTZGcXOCTjm02VhKuS0UdO7hY4eoZRFeZxnXJKU2l+x
	 PZciWqTo/8MOCA14RcqQctXkauRJNh+234+3U2nkzxqVAKLIXT1HcQ6q/J0PRqp1sC
	 QKfAwUo51jPeXkRVc9fYydyxC39KzgAIPqbU0pT5acLr7VtpFmZQJUHfgKDk5c1+1O
	 VsNx/hNcVj/WC5I5OsAvjv0iyo8jshOGImN4hpO8LShg4UQkc7KBBzC4kViVmsi1uh
	 NLDCw/gF/2btTtJvebx/yltyTQ44/WrdIUuognKOiGw4QdErdl7KtzXCOjlqJ6Y+dp
	 Q6h0M8Z2IXEsg==
From: Danilo Krummrich <dakr@kernel.org>
To: abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] rust: dma: require mutable reference for as_slice_mut() and write()
Date: Sat, 28 Jun 2025 18:49:54 +0200
Message-ID: <20250628165120.90149-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Given the safety requirements of as_slice_mut() and write() taking an
immutable reference is technically not incorrect.

However, let's leverage the compiler's capabilities and require a
mutable reference to ensure exclusive access.

This also fixes a clippy warning introduced with 1.88:

  warning: mutable borrow from immutable input(s)
     --> rust/kernel/dma.rs:297:78
      |
  297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T]> {
      |                                                                              ^^^^^^^^

Fixes: d37a39f607c4 ("rust: dma: add as_slice/write functions for CoherentAllocation")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 25dfa0e6cc3c..2ac4c47aeed3 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -294,7 +294,7 @@ pub unsafe fn as_slice(&self, offset: usize, count: usize) -> Result<&[T]> {
     ///   slice is live.
     /// * Callers must ensure that this call does not race with a read or write to the same region
     ///   while the returned slice is live.
-    pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T]> {
+    pub unsafe fn as_slice_mut(&mut self, offset: usize, count: usize) -> Result<&mut [T]> {
         self.validate_range(offset, count)?;
         // SAFETY:
         // - The pointer is valid due to type invariant on `CoherentAllocation`,
@@ -326,7 +326,7 @@ pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T
     /// unsafe { alloc.write(buf, 0)?; }
     /// # Ok::<(), Error>(()) }
     /// ```
-    pub unsafe fn write(&self, src: &[T], offset: usize) -> Result {
+    pub unsafe fn write(&mut self, src: &[T], offset: usize) -> Result {
         self.validate_range(offset, src.len())?;
         // SAFETY:
         // - The pointer is valid due to type invariant on `CoherentAllocation`

base-commit: c7e03c5cf06a90ff234ae3c628c6b74e5cba7426
-- 
2.50.0

