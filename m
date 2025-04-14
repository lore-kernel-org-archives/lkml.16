Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E502BEC5E;
	Mon, 14 Apr 2025 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636785; cv=none; b=s3CjwhpwvTOWz8fTJ+skGnmXuIIy+aonOIahW753nzt39SRjN74g9XHwTqrtQPs3LOsewDLYKb1KuEKU/Fb/OhAA9f2NMMw0zub1Q4IWB1/q87tZgkG0A7DVpUoAMS1l5ywzISPdOib6LClKiKwtGr0S10XfRm6gyBPIHRswY5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636785; c=relaxed/simple;
	bh=p6KJzJV+pXbLRKuQeBLyBQEvfFDlkC0B4qSzr2zkf3M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZN2u6RWzREPxgVcX/7Ph0zBayQtEOTztiIa8YcNDzRL4WCSFBzCJFwNs/UJyGJnZK6kM78bUYpYOoROQGpziUxQQdtQzNBU5xzsqSD77ohuCzXHCdQBDP0s3vpQaUiJNfPfwNqG8OZS2XZtNbtlSBP0cLEQs2VIzlD2IS3yjoZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9IhUpFl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9IhUpFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36AE3C4CEE2;
	Mon, 14 Apr 2025 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744636784;
	bh=p6KJzJV+pXbLRKuQeBLyBQEvfFDlkC0B4qSzr2zkf3M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J9IhUpFlIUclESt/bmXx/c7M7g619mc6EpAhrwit6CgBG3OOIJ+w7h2qLR/AUn44M
	 QBQy/JAH951ZsNbWpmO7Be++1zI6Z2xKEnRY0QOf9uWu/zDK37v8KwRdF4qtVGi6CQ
	 lq/1NYkRlpWRNHWGZHw1vzBHCXl+LXxIWToqFOJWvVzb2T72fp4E2MhYwNOAX/3Eki
	 GKyLtr3NQJ+xiJYhmMPwvbrbC9kfmK8AWAMUEiesYFjtmC7cqmiKc5cB0mawTsosx9
	 aI8LeezmtMVL4i8f1tHKQXEWb1/DyxoViLOPp/p/V4vNt0QC/2Th0VdDNGw+rrmcIp
	 Vh3I5Of5Fksfg==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	airlied@gmail.com,
	acourbot@nvidia.com,
	jhubbard@nvidia.com
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 1/5] rust: types: add `Opaque::zeroed`
Date: Mon, 14 Apr 2025 15:18:04 +0200
Message-ID: <20250414131934.28418-2-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414131934.28418-1-dakr@kernel.org>
References: <20250414131934.28418-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analogous to `Opaque::uninit` add `Opaque::zeroed`, which sets the
corresponding memory to zero. In contrast to `Opaque::uninit`, the
corresponding value, depending on its type, may be initialized.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/types.rs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 9d0471afc964..eee387727d1a 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -329,6 +329,14 @@ pub const fn uninit() -> Self {
         }
     }
 
+    /// Creates a new zeroed opaque value.
+    pub const fn zeroed() -> Self {
+        Self {
+            value: UnsafeCell::new(MaybeUninit::zeroed()),
+            _pin: PhantomPinned,
+        }
+    }
+
     /// Create an opaque pin-initializer from the given pin-initializer.
     pub fn pin_init(slot: impl PinInit<T>) -> impl PinInit<Self> {
         Self::ffi_init(|ptr: *mut T| {
-- 
2.49.0

