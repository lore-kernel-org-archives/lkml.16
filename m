Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678FF2E406
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 00:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746233048; cv=none; b=Ou1waiDS4LZYXF0U6DZ/4Pf4TzzlPst543Rjxxogh6uxg1uuPdhElw+MGpH+sHjHdD86XNVl7gThb4lqzRHUne+KcyWoobwTl/SYyw0JmSjD33sX9bkbEee5QMPEdTz/36Pqh2wg8lOgrsAICJaXBjbwsrE/i++aNreVPxfFDZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746233048; c=relaxed/simple;
	bh=f3Sr8bChUe4m3QVQfX9GzPu/VHwwCY03FIULMoMS2tk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X2dcx1dAHVwFANQQCRtQc6UVllQwhgLB5qBwk4HiUcFRR6/mEXEqdxSrGkJeR4KtyrVQaxSkf19hZuQhDUzEmNEk3abMaGmSwT+O3KphRPP3O222k1SoO9hfBBIigvkutQ65v+zQH0Fcmed4skU5sWrX/+TjrUpoVaw6tq6OsYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZgZloyCN; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZgZloyCN"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22c31b55ac6so36822785ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 17:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746233045; x=1746837845; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEkXhgfuiW5p25QNLUPdm8JxwC1V0qd/rXOAQNFVOA0=;
        b=ZgZloyCN6KWDnjztnAq1pi/90yWopQoO0bhJP2QG++SPLufmMjpzoxt9ZaSqoJnn/O
         pCuteyRWMa34jxSywhJJn7R1ijTuuLr5YqgLzdjCDopWBAMu6lGnj8jtdn3D+hbvK10O
         Nm5iXgyI/Pf2C2CGzSOdiOjuvEzCZsvpS2E4UH9AN46sBZbQ/fFKW8CCOn9uVTQV++11
         lbJ2QDbxlJG7QZwc3D09gcfBBzeB4sdbua+95V8MNTGbv5H7Qs9ukWhWjuR6FjS1sXsH
         FcUD/IGYbMUx97LrI9CtETfvybjThtIxWuygFjsT/Q3cEThKXjyhQab7L1Z6XQELG45r
         MJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746233045; x=1746837845;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEkXhgfuiW5p25QNLUPdm8JxwC1V0qd/rXOAQNFVOA0=;
        b=Ki8P0ACV7kmabzvSDEs9SG3O/4RqQJ3yPvd0ADaqMNh+x1GnNwrE0MF32CfGPEW3ol
         GqOBNrZDJcWK/CWznEll7dehEhgdMm9fYlDlfAATR4PW94t2NeN4a1cQNgdPBbxcb7Lk
         Q9VcrLSsVs3WpClZKVtnkDEvPsZ3gJtdy2OzyszE6HIkRerdIPruPCTV34NIS9G7G5oc
         gCXt+zPJiIPIFTRm2dh83PEC/nHENPB5p62zy4T4WR8tDxrGnxuB5D71ijNFMAdopNbz
         L9EzYKNo6KBYxPYW0e508irHQQutP+xpVGb1CAc1dUTvakAr8QewfYpMaNmopw91x44m
         9HAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq6fSj+eodaXf7aqwOfcwxRWTaxoLpjx2ojlWTCbAFCJ5PVubX2kTdqNRmgZGsuCZjj4RHv0h3Ei0w2ug=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWOYPOT21pw4crsJQgfJpbM56OKkaFQH9C41VkiXhd1F7WIwS
	gyEYYs6ero8yF+C3Lt3IZbGOb+TmPTSQ4qWcua97AiENAu1FLtyI5rgCHOHM9AoesvjpHgL9TOT
	9aHfWdg==
X-Google-Smtp-Source: AGHT+IECbR4XpbCEFg4PxmKIBsjtpvK3eVPwW/ZoEtnWlFRt/I5JA2spvn6ZFLzyMudHXOgscmehRISVBYgS
X-Received: from pltg6.prod.google.com ([2002:a17:902:6b46:b0:216:25a2:2ecf])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:320a:b0:220:c164:6ee1
 with SMTP id d9443c01a7336-22e18c0d71amr18211735ad.32.1746233045634; Fri, 02
 May 2025 17:44:05 -0700 (PDT)
Date: Sat, 03 May 2025 00:44:00 +0000
In-Reply-To: <20250503-debugfs-rust-attach-v1-0-dc37081fbfbc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250503-debugfs-rust-attach-v1-0-dc37081fbfbc@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746233040; l=5933;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=f3Sr8bChUe4m3QVQfX9GzPu/VHwwCY03FIULMoMS2tk=; b=7ESkagayVsLPaOJF8Nr811RicBpJ1mb0I5C0hNMuA1LJYFeqD6z2y7BvSe0nwfUaznYyAxfzK
 Ryy3ksqtjCaCWSYj6ahFJmOFMeEM4cpNB/E010SN/0OhvXIDvERn5I7
X-Mailer: b4 0.14.2
Message-ID: <20250503-debugfs-rust-attach-v1-2-dc37081fbfbc@google.com>
Subject: [PATCH WIP 2/2] rust: debugfs: Extend sample to use attached data
From: Matthew Maurer <mmaurer@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Demonstrates how to attach data/handles needed for implementing DebugFS
file to a directory.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 samples/rust/rust_debugfs.rs | 110 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 106 insertions(+), 4 deletions(-)

diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
index 2b1119b7281fd15109b542e6853d4206c2c80afc..6da8dd2c91e8c206b2314eabb97d6d31843efeb5 100644
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@ -4,10 +4,14 @@
 
 //! Sample DebugFS exporting module
 
+use core::fmt;
+use core::fmt::{Display, Formatter};
 use core::sync::atomic::{AtomicU32, Ordering};
 use kernel::c_str;
-use kernel::debugfs::Dir;
+use kernel::debugfs::{BoundDir, Dir, Values};
+use kernel::new_mutex;
 use kernel::prelude::*;
+use kernel::sync::{Arc, Mutex};
 
 module! {
     type: RustDebugFs,
@@ -20,7 +24,89 @@
 struct RustDebugFs {
     // As we only hold this for drop effect (to remove the directory) we have a leading underscore
     // to indicate to the compiler that we don't expect to use this field directly.
-    _debugfs: Dir<'static>,
+    _debugfs: Pin<KBox<Values<Backing>>>,
+}
+
+struct Composite {
+    major: u32,
+    minor: u32,
+}
+
+struct Record {
+    name: &'static CStr,
+    size: usize,
+    stride: usize,
+}
+
+struct Backing {
+    simple: u32,
+    composite: Composite,
+    custom: u32,
+    many: KVec<Record>,
+    atomic: AtomicU32,
+    locked: Arc<Mutex<u32>>,
+}
+
+impl Display for Composite {
+    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+        write!(f, "{}.{}", self.major, self.minor)
+    }
+}
+
+impl Backing {
+    fn new() -> Result<Self> {
+        let mut many = KVec::new();
+        many.push(
+            Record {
+                name: c_str!("foo"),
+                size: 1,
+                stride: 2,
+            },
+            GFP_KERNEL,
+        )?;
+        many.push(
+            Record {
+                name: c_str!("bar"),
+                size: 3,
+                stride: 4,
+            },
+            GFP_KERNEL,
+        )?;
+        Ok(Self {
+            simple: 10,
+            composite: Composite { major: 1, minor: 2 },
+            custom: 37,
+            many,
+            atomic: AtomicU32::new(7),
+            locked: Arc::pin_init(new_mutex!(0), GFP_KERNEL)?,
+        })
+    }
+
+    fn build<'a>(&'a self, root: BoundDir<'a>) {
+        // Just prints out the number in the field
+        root.display_file(c_str!("simple"), &self.simple);
+        // Uses the custom display implementation to print major.minor
+        root.display_file(c_str!("composite"), &self.composite);
+        // Uses the custom hook print the number in 0-padded hex with some decorations.
+        root.fmt_file(c_str!("custom"), &self.custom, &|custom, f| {
+            writeln!(f, "Foo! {:#010x} Bar!", custom)
+        });
+        // Creates a directory for every record in the list, named the name of the item, with files
+        // for each attribute.
+        for record in self.many.iter() {
+            let dir = root.subdir(record.name);
+            dir.display_file(c_str!("size"), &record.size);
+            dir.display_file(c_str!("stride"), &record.stride);
+        }
+        // Access the attached atomic via `.load()`
+        root.fmt_file(c_str!("atomic"), &self.atomic, &|atomic, f| {
+            writeln!(f, "{}", atomic.load(Ordering::Relaxed))
+        });
+        // Access the attached mutex-guarded data via `.lock()`
+        root.fmt_file(c_str!("locked"), &self.locked, &|locked, f| {
+            writeln!(f, "{}", *locked.lock())
+        });
+    }
 }
 
 static EXAMPLE: AtomicU32 = AtomicU32::new(8);
@@ -28,11 +114,11 @@ struct RustDebugFs {
 impl kernel::Module for RustDebugFs {
     fn init(_this: &'static ThisModule) -> Result<Self> {
         // Create a debugfs directory in the root of the filesystem called "sample_debugfs".
-        let debugfs = Dir::new(c_str!("sample_debugfs"));
+        let root = Dir::new(c_str!("sample_debugfs"));
 
         {
             // Create a subdirectory, so "sample_debugfs/subdir" now exists.
-            let sub = debugfs.subdir(c_str!("subdir"));
+            let sub = root.subdir(c_str!("subdir"));
 
             // Create a single file in the subdirectory called "example" that will read from the
             // `EXAMPLE` atomic variable.
@@ -47,6 +133,22 @@ fn init(_this: &'static ThisModule) -> Result<Self> {
         EXAMPLE.store(10, Ordering::Relaxed);
         // Now, "sample_debugfs/subdir/example" will print "Reading atomic: 10\n" when read.
 
+        // We can also attach data scoped to our root directory
+        let backing = Backing::new()?;
+        // Grab a refcount pointing to the locked data
+        let locked = backing.locked.clone();
+        let debugfs = KBox::pin_init(Values::attach(backing, root), GFP_KERNEL)?;
+
+        // Once it's attached, we can invoke `Backing::build` to create the relevant files:
+        debugfs.as_ref().build(Backing::build);
+
+        // We can still access read-only references the contents of the attached values. If the
+        // values allow interior mutability, like atomics, this lets us still change them:
+        debugfs.as_ref().atomic.store(8, Ordering::Relaxed);
+
+        // If we attached refcounted data, we can use an external handle to access it
+        *locked.lock() = 42;
+
         // Save the root debugfs directory we created to our module object. It will be
         // automatically cleaned up when our module is unloaded because dropping the module object
         // will drop the `Dir` handle. The base directory, the subdirectory, and the file will all

-- 
2.49.0.906.g1f30a19c02-goog

