Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA781AE875;
	Tue, 20 May 2025 23:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747783044; cv=none; b=BbGnWwmm+p4ACgM65mzjSUDtizIOEBsTCD/4n0bfRXMHDL8ArdULZvD3AHfvd+odsS3sZ4tXSBcm7JSG1qenWY0Fl+/gXxJlWO44CNFZPNESbzfR7z0PGSYo0BbXJ7KvHk9HUuwksA0ZSRkhT7UYkxPmiEsjlm6+1FKtP4h3Mck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747783044; c=relaxed/simple;
	bh=OLpprT4B3y/fOlPuThMEFMFgQ6AyOwL8XDRCThzZ/Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nIy/XdkU8kDwG2CMeLS4b3NX8iyGU8SvtLzDIYkBPtXHCdOyxVMF/ped17k9j8WSPDKRTSnkoqp44qetWX8ewK23GM6Wf4jko0pCe/arFP5XEwfs95kQXEd+mewlfD8lGjU286x1Q8otEJsY4tGav8/Xr8KrqNwLYNQA3m8T2v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBIgW6i1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBIgW6i1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48449C4CEE9;
	Tue, 20 May 2025 23:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747783043;
	bh=OLpprT4B3y/fOlPuThMEFMFgQ6AyOwL8XDRCThzZ/Hg=;
	h=From:To:Cc:Subject:Date:From;
	b=RBIgW6i1K3c1FdJtmZllKzNnVbuHxGvJDyo+eBY+jRulc7Xqcx9GFeKBfI39Drqcc
	 3/o+RJE0uqyj+ZbdWY1yRGAbH6I60p9BO6UmiiBwi2Vfw/tnggbYDuUQuZEyFb2cZO
	 Vvo61GDHFpedAuDXaXxWP8eW1jMgMLJEZThyNC4DjNLy9YdVD18OPiqNH34cVSx29c
	 j5vRBR26eg2LeYrZls1sMGl7YhArhu3cfr3QhKoYFBdErvFdgW3WiuF/OK8aY1/qBp
	 SyT0BoEz+vrd5mV9Vf3TxXYJ2F7uOwDGPhMctQEgT/aGmrxVot0vnHuzz/JPdJ4W7f
	 KMigoXPqyNTtg==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: sync: fix safety comment for `static_lock_class`
Date: Wed, 21 May 2025 01:17:13 +0200
Message-ID: <20250520231714.323931-1-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The safety comment mentions lockdep -- which from a Rust perspective
isn't important -- and doesn't mention the real reason for why it's
sound to create `LockClassKey` as uninitialized memory.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---

I don't think we need to backport this.

---
 rust/kernel/sync.rs | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
index 36a719015583..a10c812d8777 100644
--- a/rust/kernel/sync.rs
+++ b/rust/kernel/sync.rs
@@ -93,8 +93,11 @@ fn drop(self: Pin<&mut Self>) {
 macro_rules! static_lock_class {
     () => {{
         static CLASS: $crate::sync::LockClassKey =
-            // SAFETY: lockdep expects uninitialized memory when it's handed a statically allocated
-            // lock_class_key
+            // Lockdep expects uninitialized memory when it's handed a statically allocated `struct
+            // lock_class_key`.
+            //
+            // SAFETY: `LockClassKey` transparently wraps `Opaque` which permits uninitialized
+            // memory.
             unsafe { ::core::mem::MaybeUninit::uninit().assume_init() };
         $crate::prelude::Pin::static_ref(&CLASS)
     }};

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.49.0

