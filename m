Received: from sender3-op-o12.zoho.com (sender3-op-o12.zoho.com [136.143.184.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AE7293738;
	Wed, 14 May 2025 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250532; cv=pass; b=rUx+L/bLl0KXSBJyosqIGJ0Bok4CDspXWUgDvFEl4MgCh+m8JsaTBPWJgCkfXt4nOii/vPYoI43oMEF1SxTS6wDIzHFknFkmwqJglWRF+IeyMmu5WjymB34IQEjxYrPmK9fZoniFbuWROMM0/5CRCZ5g/Fsd0hxwnh1nATD8PaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250532; c=relaxed/simple;
	bh=4RRKn4GkWqWDoFGZ7mAK796x8AcyWQihchUdkjJv1Jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYw92/pWa/ix0FSs70ei/QdUOxG8DepENkFfsjGj91hMC6aHiK8RIeNTOLwiR6a4feBxxxTIXwPC1DPXuRCf7g3LWwcEXEtchzwyEJ9+KTR35fuyCCC46OjJx79+IxDmh1Jxx8rbU1UY7Kt6azRkw5JtK+++NEq+c7K/zcdiyo4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=eGCTYaL/; arc=pass smtp.client-ip=136.143.184.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eGCTYaL/"
ARC-Seal: i=1; a=rsa-sha256; t=1747250493; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JLOH5Yv4FuZvJ6PrTg21EKEHz+BhSzu1Gx9WCrE4n9dQ2v2XwVV/3SxSlwdAgRpC//9xB+ck6zzGP9lSQZhtgv3m+1Exyn/3YqL2i9NOHmYKBXmXXl+YXcECimQpqb7odjWxrMtXotjQjPQiSG3Y7r4unHBKYt3sTcBwI/BCYPU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747250493; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fa1qeH0DxE7j7jD+ZO1MGlSXV30kYX0Bz9i5YjBNL6w=; 
	b=AtJN5l3SspdCd1m/rZ49UP6FAes4UjFXpw3Y10jX//NwhlfQ87nHPyCarflDTyPVRNbxAGiry79AfnMmVU2R1LfKA5yPyAt7mguzcJA8J0VVvLEabS1wStWFUtx7lM/l0yzs38xBXM2NY+g4xymuPsLoZbJiUhlKBR7gpDSPUSg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747250492;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=fa1qeH0DxE7j7jD+ZO1MGlSXV30kYX0Bz9i5YjBNL6w=;
	b=eGCTYaL/jPXKtAyWCqtf2a2x3OmevOfNwxUMq/tVjUJZLIpj8V5GSnjmMnBukyxt
	SydL0vG74yDMY4JKkma/F0qSlOoPphJqHj7mM9rJ9Q/oVIxDHOeiK4Ad72toLTlZlHi
	rmv2WY1U5U4YwTfr4x0WaEaH3A7ZsWgqf8agHwn0=
Received: by mx.zohomail.com with SMTPS id 17472504907271023.3741658857869;
	Wed, 14 May 2025 12:21:30 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Wed, 14 May 2025 16:20:52 -0300
Subject: [PATCH v3 2/2] rust: platform: add irq accessors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topics-tyr-request_irq-v3-2-d6fcc2591a88@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
In-Reply-To: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

These accessors can be used to retrieve an IRQ from a platform device by
index or name. The IRQ can then be used to request the line using
irq::request::Registration::register() and
irq::request::ThreadedRegistration::register().

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/kernel/platform.rs | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 4917cb34e2fe8027d3d861e90de51de85f006735..1acaebf38d99d06f93fa13b0b356671ea77ed97a 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -188,6 +188,58 @@ impl Device {
     fn as_raw(&self) -> *mut bindings::platform_device {
         self.0.get()
     }
+
+    /// Returns an IRQ for the device by index.
+    pub fn irq_by_index(&self, index: u32) -> Result<u32> {
+        // SAFETY: `self.as_raw` returns a valid pointer to a `struct platform_device`.
+        let res = unsafe { bindings::platform_get_irq(self.as_raw(), index) };
+
+        if res < 0 {
+            return Err(Error::from_errno(res));
+        }
+
+        Ok(res as u32)
+    }
+
+    /// Same as [`Self::irq_by_index`] but does not print an error message if an IRQ
+    /// cannot be obtained.
+    pub fn optional_irq_by_index(&self, index: u32) -> Result<u32> {
+        // SAFETY: `self.as_raw` returns a valid pointer to a `struct platform_device`.
+        let res = unsafe { bindings::platform_get_irq_optional(self.as_raw(), index) };
+
+        if res < 0 {
+            return Err(Error::from_errno(res));
+        }
+
+        Ok(res as u32)
+    }
+
+    /// Returns an IRQ for the device by name.
+    pub fn irq_by_name(&self, name: &CStr) -> Result<u32> {
+        // SAFETY: `self.as_raw` returns a valid pointer to a `struct platform_device`.
+        let res = unsafe { bindings::platform_get_irq_byname(self.as_raw(), name.as_char_ptr()) };
+
+        if res < 0 {
+            return Err(Error::from_errno(res));
+        }
+
+        Ok(res as u32)
+    }
+
+    /// Same as [`Self::irq_by_name`] but does not print an error message if an IRQ
+    /// cannot be obtained.
+    pub fn optional_irq_by_name(&self, name: &CStr) -> Result<u32> {
+        // SAFETY: `self.as_raw` returns a valid pointer to a `struct platform_device`.
+        let res = unsafe {
+            bindings::platform_get_irq_byname_optional(self.as_raw(), name.as_char_ptr())
+        };
+
+        if res < 0 {
+            return Err(Error::from_errno(res));
+        }
+
+        Ok(res as u32)
+    }
 }
 
 impl Deref for Device<device::Core> {

-- 
2.49.0

