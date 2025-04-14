Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FACE29C34D;
	Mon, 14 Apr 2025 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636789; cv=none; b=bwz5MZ1UuZY3XqLvQPrLVhVSO1NIoSFMGeoSih0b/jQgePCrak6RK+i0I9sNa/EEQ7h6GBTlSvnE9o4kew9gHIXqCMhtcXh5KsYN+rFgDxFnmFS3s6i8WFUlsk/EVRxs5LHOXeW2OBwdOM/U6BA4/FXfE59Frv7M+IpJITxNB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636789; c=relaxed/simple;
	bh=EPgd6oqwzWETga6AF6P7FGJ1ioPGKiJ5Ogq5uR3snkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAzeIAOqQI2G9dbJbYxKqkNPv+CTf1JwaMvZwzze7zNSDKGQ0oaUL3Lffuf0YC/GggTO0rRAfyosnlKXlgY3UMuDdEv/BJy5xaSbOpQ81121IQeHkkA1VFr+ZdtFuUnC1tqRcYCNzRbq86eF0bnFNbrleiIe3A3dwm+5k4Eg2eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4DtXnhl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4DtXnhl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5878BC4CEE9;
	Mon, 14 Apr 2025 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744636789;
	bh=EPgd6oqwzWETga6AF6P7FGJ1ioPGKiJ5Ogq5uR3snkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O4DtXnhlcIg6ldfxtODrxm0/zY79lAAP0M7yBX/KCxknuJo40SzFdh9O0mg7VE8Xd
	 2Glgsm+2y8McR5hgnNZQos/nEHw4g/k+M0cumvEJq6bPl1yerTj/j3UIorE44h+Cur
	 g5MMBNejYakO7qeV8JJVtcoaYVSEv29g60y1DlSDMLMYVCiG+Enhr3eolwbA8DDP/A
	 rJ6Qv8Ns0dE5H6UMh4qIXC7vSyfsLdvysGDRl0Qg9SJD/fpnDC89ATk/YyTp/ZErCq
	 dJfNNOlZK7gM+mT35N7HIPAP+oBZwhdYzgWDkK4DIk5AtuDa+uqrrz/sRaAyOHjzmx
	 F+V3hBCKyDyXA==
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
Subject: [PATCH v4 2/5] rust: device: implement Device::parent()
Date: Mon, 14 Apr 2025 15:18:05 +0200
Message-ID: <20250414131934.28418-3-dakr@kernel.org>
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

Device::parent() returns a reference to the device' parent device, if
any.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/device.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 585a3fcfeea3..911045e32c34 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -67,6 +67,25 @@ pub(crate) fn as_raw(&self) -> *mut bindings::device {
         self.0.get()
     }
 
+    /// Returns a reference to the parent device, if any.
+    #[expect(unused)]
+    pub(crate) fn parent(&self) -> Option<&Self> {
+        // SAFETY:
+        // - By the type invariant `self.as_raw()` is always valid.
+        // - The parent device is only ever set at device creation.
+        let parent = unsafe { (*self.as_raw()).parent };
+
+        if parent.is_null() {
+            None
+        } else {
+            // SAFETY:
+            // - Since `parent` is not NULL, it must be a valid pointer to a `struct device`.
+            // - `parent` is valid for the lifetime of `self`, since a `struct device` holds a
+            //   reference count of its parent.
+            Some(unsafe { Self::as_ref(parent) })
+        }
+    }
+
     /// Convert a raw C `struct device` pointer to a `&'a Device`.
     ///
     /// # Safety
-- 
2.49.0

