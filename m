Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467612DCB7B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968566; cv=none; b=SKUiqMFablkSj54ugnTXK6vnhJi4D2KPVgs8oUTrHng/B/uqUOSO0mY2xv5IBGrUf5EPxnFpsGkUwRSC/8TGh2vtoyz+e7Q+ziQsqtc873umHrtGpl9mB2BiBJU4DtcolQoHK7aYOZ7Dk+denWXZ6lrtUuTH/G2sFPUDG2GY54I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968566; c=relaxed/simple;
	bh=wiNWmXPA7aef+JSBJpG6giuwlkFHfN/reJPM9/DLlAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QiHUxyK5N1LCqOEgM1MiapscgILCuI9Ac5yMnPKmNclFOVjaOEUqxq8pz3CM43TCnnY0HilwrMP7FVVpnSfnBwQshbAf038O87t3qaD4Li7iURlGPH72h/I4iy2uxd4uqFBBE5U39bJ8DLVcrpnW4SYyVQZYN+eJ4LD3TwTi1Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q+6BCJjH; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q+6BCJjH"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6167e9ccso7407715a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968563; x=1746573363; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jQeoPXxTZfB2IN32zOvdZjxaMXLUF1ehMnqMdv2YL/k=;
        b=Q+6BCJjHAF6nfuIzp1vzbs1xRXq0KixV7svAGN00gqrMO/PsSHLpq5dHXtyzc9UPAD
         HkhxEtyz3u18av8keX/7EYMv8jqrpxsdu7Db3qHSDyBoxVwxxK1l21hFVcpn84shY6Tg
         lEZaOckGM+D7Mx1WJe9pflqLQ+H3lziHsPLnk+mcmt4jsh2bqp7MyNlh8BgNbiLEadra
         nZmq4dJ/n8i/fXuT9yzgAll+k0YLhrwjrKL+mqDp+1nS2Q9qeLWaSvJbCYEfFwyyQaWA
         uv/gL0Ch0W98gtrATe7BPlTfzVMskLAAvNcjqqkjPbVtj0UJ0Uh4ltBgwO1/p7KSiT6t
         Kcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968563; x=1746573363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQeoPXxTZfB2IN32zOvdZjxaMXLUF1ehMnqMdv2YL/k=;
        b=o5dtJnHEle2zOlbTlmnakTEV5qTYIBA/7KrnM7COx4AWYpU/Y3TyrCVi5gwyGQktL0
         0EkoLBeAHQrA3oM5LcWo2lmcD4iHCKoRLoddtopkaS+Tr+QpToKB02LioSAp8KqECbnt
         b498XiOmPNl8wqi+S379/ef9T48Lt6wdqLF4D82BjbwjP81Ic8zVD+tOtRqRIiM1oJp6
         rnbG3bRqwBD+bWHu5cI37UKDXej2PsXbFszzxvnze8BrG6YR2cjWkCzfTrfpyf/BtGSI
         80sCtSLDyjqztfS5fwSx4VxJ65PeZ973YALQOVQ7Q14h7lkT5qmMc13MnTXHl07HReCR
         wdBA==
X-Gm-Message-State: AOJu0YxVOoqgzHnzT5aPXyPjOdxYfyVdZkUSaaf2RgIjqyZrZGmQdhYO
	kqO+4tzFWr2NN66kxgcy/Wb4YaGqhWeakU++gvBlKpP//6EexsDn8z6ViwzckHVh3AvTzWBa/sW
	Rlv/n3Q==
X-Google-Smtp-Source: AGHT+IHTtYh9lbg+u5+jXBsfaH1Ys7l7UGl6HzShzue0DXxB86FYRsgTXilfdtRn2zg9B2OgYy1E0dvKCTYP
X-Received: from pjbos16.prod.google.com ([2002:a17:90b:1cd0:b0:2fc:ccfe:368])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c8d:b0:2ff:62f3:5b31
 with SMTP id 98e67ed59e1d1-30a33365069mr1129213a91.29.1745968563550; Tue, 29
 Apr 2025 16:16:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:15:58 +0000
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745968555; l=1931;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=wiNWmXPA7aef+JSBJpG6giuwlkFHfN/reJPM9/DLlAE=; b=49fow0XU7368/YDxnB7l8fFmldxw9zBseHKG6Pwt7nnmuDMgMzP42Ls51CV9+KFxW/2E0ZdvU
 5jqQOzsMzh0DIGPOWbgCyd18ypepSBuZbgm7JszQeMZC9Tbcvn8KJJk
X-Mailer: b4 0.14.2
Message-ID: <20250429-debugfs-rust-v1-4-6b6e7cb7929f@google.com>
Subject: [PATCH 4/8] rust: debugfs: Allow subdir creation in builder interface
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Allows creating subdirectories in the builder intended to be cleaned up
by `debugfs_remove` at the same time as the root.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index f6240fd056f8598d5ef06bdaf61c5c33eab5b734..6c7cf7e97741b98d2c0654d01fca3de0d8047e97 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -347,6 +347,32 @@ pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'a T) -> Resu
         core::mem::forget(unsafe { self.inner.display_file_raw(name, data)? });
         Ok(())
     }
+
+    /// Creates a nested directory that may live as long as its parent
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let dir = Dir::new(c_str!("foo"), None)?;
+    /// let foo = KBox::pin_init(Values::attach(0, dir), GFP_KERNEL)?;
+    /// foo.as_ref().build(|_value, builder| {
+    ///   builder.dir(c_str!("bar"))?;
+    ///   Ok::<(), Error>(())
+    /// })?;
+    /// // foo/bar will still exist at this point in DebugFS
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn dir(&self, name: &CStr) -> Result<Builder<'a>> {
+        let dir = Dir::new(name, Some(self))?;
+        // SAFETY: We're suppressing the drop of the ARef we received, so we know it will live
+        // until its parent is `debugfs_remove`'d. The lifetime of the parent is 'a, so we can
+        // convert it to a similarly lived reference.
+        let dir: &'a Dir = unsafe { ARef::into_raw(dir).as_ref() };
+        // SAFETY: Since 'a is a builder lifetime, we can propagate our invariants
+        Ok(unsafe { Builder::new(dir) })
+    }
 }
 
 impl<'a> Deref for Builder<'a> {

-- 
2.49.0.901.g37484f566f-goog

