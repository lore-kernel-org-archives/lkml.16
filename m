Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3F32367CA;
	Fri, 30 May 2025 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633374; cv=none; b=SboPy01LW89Boxvteot2VgNyMjjMwPwbLlr2t0X32SAJQmjOvttC7kRXhh67bFAUpgXJhZ87no5kpYeIUPClxNWcb+XAePpvdlsA7LoczcLlYY34tRDVDabDHYl1LNKUzjPDVcuXcUdDyfZhjNMhmedPbc38Q3p2+/rgxApw/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633374; c=relaxed/simple;
	bh=3309iY1rzzm1HWS42oPp3w3x9UcyYB8inFAsu6M7wNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=us5u1ccrvhCClxA2ekxW9aqRIERkSYlTxKCSbW3Tnal/36yBYiu48eVBJalXd9bRXNViDmCIAmjNsyCfsOmflWO34k5z6bMOAUbldVyHHfORHAaji/txlEyAYmBQFidrgBDXHc+pMtd16rYpzZcfI5W6yqRs/IrnV+Kee9NGpx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev; spf=pass smtp.mailfrom=buenzli.dev; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=buenzli.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buenzli.dev
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4b8Cwm15Rpz9tY5;
	Fri, 30 May 2025 21:29:28 +0200 (CEST)
From: Remo Senekowitsch <remo@buenzli.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Remo Senekowitsch <remo@buenzli.dev>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v7 2/9] rust: device: Enable accessing the FwNode of a Device
Date: Fri, 30 May 2025 21:28:49 +0200
Message-ID: <20250530192856.1177011-3-remo@buenzli.dev>
In-Reply-To: <20250530192856.1177011-1-remo@buenzli.dev>
References: <20250530192856.1177011-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4b8Cwm15Rpz9tY5

Subsequent patches will add methods for reading properties to FwNode.
The first step to accessing these methods will be to access the "root"
FwNode of a Device.

Add the method `fwnode` to `Device`.

Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
---
 rust/kernel/device.rs | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 56ee463a4bd11..0018b37de4a29 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -186,6 +186,21 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
         };
     }
 
+    /// Obtain the [`FwNode`](property::FwNode) corresponding to the device.
+    pub fn fwnode(&self) -> Option<&property::FwNode> {
+        // SAFETY: `self` is valid.
+        let fwnode_handle = unsafe { bindings::__dev_fwnode(self.as_raw()) };
+        if fwnode_handle.is_null() {
+            return None;
+        }
+        // SAFETY: `fwnode_handle` is valid. Its lifetime is tied to `&self`. We
+        // return a reference instead of an `ARef<FwNode>` because `dev_fwnode()`
+        // doesn't increment the refcount. It is safe to cast from a
+        // `struct fwnode_handle*` to a `*const FwNode` because `FwNode` is
+        // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
+        Some(unsafe { &*fwnode_handle.cast() })
+    }
+
     /// Checks if property is present or not.
     pub fn property_present(&self, name: &CStr) -> bool {
         // SAFETY: By the invariant of `CStr`, `name` is null-terminated.
-- 
2.49.0

