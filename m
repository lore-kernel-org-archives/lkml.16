Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F512989A5
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 01:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746493461; cv=none; b=rdBfYlXU7yRy4VZUG9XnD9Z5YuP5rtIrUOcBMrZ6qroF6On/4yHpmr/bMuauspZU+ExcAD19RiDOUVXwLdFNOAdxh7pibqqwV7icuv0FheJ04togNrO0k3YK7i4mS+ETq/qLG/UzWwf61Xm4nZYW25g14xNn9Ljhi83ZYgt9Ck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746493461; c=relaxed/simple;
	bh=/k3Yo3khleRb+uxwsSODt3lvyFcZ63bMldnep7BhLE8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HGNkET8/4Rv1ayvZ6NL1JwxuWcqbkSGw15M963UdTmp5VlFdB9lys1NMG6MtplUyXVi4ymXA7AlDnRmeTvHSgwoMK9cHEuNu28eywsIb0XKNJvYX5ZWdT7eLBhdHfhZk3Y1EvzpFcublEbnd3BZPSCvEFvUvwig4fgUZSpox0K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z2OL1KhP; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z2OL1KhP"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-309c6e43a9aso7554735a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 18:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746493459; x=1747098259; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8/F7HTaR1lenYv3bo9DPTN5D8KoLav+c1ChwtLfsdY=;
        b=z2OL1KhPrDx80f+1EzE6n1bGXnJxtn07RG6551YpXzLkwUZwy4oWlb+sV3TdKuBJ2V
         p36Mc8h02N7KovbbNxojEi0yRxBAAxw8KnkcXG3etQ9ezsnHUtTTf9gtpZ3XEm6rhWC4
         aZtMf2OdOrL+eXm/K9380eStClgmJkNg7TX5hkQ6+mGHVQe8xKWJLsJKYPlYPdeAd0iw
         eKeCJ1a9lfS75SseSf6MKiJn76rgo7nQ8Oin2b1lFFsPKVP5ACMQuSq/ZlWkxqUDKZZT
         epKpy6x0IN6mKr2dnSgwn89+QCPKuPnJPXiFF0whDZyIzEB2tDheup3G7SNoADp7Eivi
         oRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746493459; x=1747098259;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T8/F7HTaR1lenYv3bo9DPTN5D8KoLav+c1ChwtLfsdY=;
        b=NpqOXfebSSNGloHWw173x8ZdB43z3KoS9W/p2hIExHadD20FLz5zl7GNhv7DrW6rOd
         38lqlt2+0hgDfYc224ghR8/y4Bd7uOe2FoMmITPW3WKLgFusDRJ9q05KvMoig8L5Darr
         W90ov5zy1PfTu1L4rFLgBd8LWw8vBadVO9GqSZV7616kShKp1+HzFu8Na/lou8XKWiTh
         IcS6oBzkyH28JbpuuLCEOBXt9XhRl8uCVvvt3bMKRn8In1NUh/oI44OtyOaRr9BZRuKb
         U98SAh4j4VQoh8CAYhqBNMBZTcK0dQ2/WhjpUw22UA3vZm1wIZvN3e6W+y3BnYxF4CtV
         ewUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPZhgICupPQl4kwAfJ7WrC/91U4vQ1dsH2289vaHin9GhdOYktEkzgJcfjiZ01L9+Z4MqIkgbMcHaflGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv6YjD3CpGZnZg4n2KnIlFTQfHoZolNElczh2gt+M9ftuTY0fN
	RvRueFZoJr9TR+jwE9JJ1/0VdCjyqCzqUEnRcNdOYgAXHqb2V7q9ShcXyp4M9Y9dXRuqdk03gqW
	n2TbO0Q==
X-Google-Smtp-Source: AGHT+IHgCB4fVw2Q+BCHF9mjG2qX9mTc3bFJdne7hHQKkSQzvpo0cj2msg14MbGPMOt6w+ocQVkp0Nu6Jimf
X-Received: from pjbtb7.prod.google.com ([2002:a17:90b:53c7:b0:301:2679:9d9])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:56c8:b0:2ee:8ea0:6b9c
 with SMTP id 98e67ed59e1d1-30a7c0806e9mr2600361a91.12.1746493458765; Mon, 05
 May 2025 18:04:18 -0700 (PDT)
Date: Tue, 06 May 2025 01:04:14 +0000
In-Reply-To: <20250506-debugfs-rust-attach-v2-0-c6f88be3890a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506-debugfs-rust-attach-v2-0-c6f88be3890a@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746493453; l=6273;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=/k3Yo3khleRb+uxwsSODt3lvyFcZ63bMldnep7BhLE8=; b=SCAhhh32aNFPz7cmDQI4C3sCPKGhapQWcPJVBsZsIU8GMTMEXvfsAyPFbxDsscRgcSw/LU+F5
 c2ytLqN7pIQDKauKD6eB5tfJrsfjzMQDWKo3KQoXIHQzjSAPgRZOPY5
X-Mailer: b4 0.14.2
Message-ID: <20250506-debugfs-rust-attach-v2-2-c6f88be3890a@google.com>
Subject: [PATCH WIP v2 2/2] rust: debugfs: Extend sample to use attached data
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
index a4b17c8241330b2f6caf8f17a5b2366138de6ced..efaca1b140f710fcc7d0467e9b00e02a69c2cf55 100644
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@ -4,11 +4,15 @@
 
 //! Sample DebugFS exporting module
 
+use core::fmt;
+use core::fmt::{Display, Formatter};
 use core::mem::{forget, ManuallyDrop};
 use core::sync::atomic::{AtomicU32, Ordering};
 use kernel::c_str;
-use kernel::debugfs::Dir;
+use kernel::debugfs::{BoundDir, Dir, Values};
+use kernel::new_mutex;
 use kernel::prelude::*;
+use kernel::sync::{Arc, Mutex};
 
 module! {
     type: RustDebugFs,
@@ -21,7 +25,89 @@
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
+        forget(root.display_file(c_str!("simple"), &self.simple));
+        // Uses the custom display implementation to print major.minor
+        forget(root.display_file(c_str!("composite"), &self.composite));
+        // Uses the custom hook print the number in 0-padded hex with some decorations.
+        forget(root.fmt_file(c_str!("custom"), &self.custom, &|custom, f| {
+            writeln!(f, "Foo! {:#010x} Bar!", custom)
+        }));
+        // Creates a directory for every record in the list, named the name of the item, with files
+        // for each attribute.
+        for record in self.many.iter() {
+            let dir = ManuallyDrop::new(root.subdir(record.name));
+            forget(dir.display_file(c_str!("size"), &record.size));
+            forget(dir.display_file(c_str!("stride"), &record.stride));
+        }
+        // Access the attached atomic via `.load()`
+        forget(root.fmt_file(c_str!("atomic"), &self.atomic, &|atomic, f| {
+            writeln!(f, "{}", atomic.load(Ordering::Relaxed))
+        }));
+        // Access the attached mutex-guarded data via `.lock()`
+        forget(root.fmt_file(c_str!("locked"), &self.locked, &|locked, f| {
+            writeln!(f, "{}", *locked.lock())
+        }));
+    }
 }
 
 static EXAMPLE: AtomicU32 = AtomicU32::new(8);
@@ -29,13 +115,13 @@ struct RustDebugFs {
 impl kernel::Module for RustDebugFs {
     fn init(_this: &'static ThisModule) -> Result<Self> {
         // Create a debugfs directory in the root of the filesystem called "sample_debugfs".
-        let debugfs = Dir::new(c_str!("sample_debugfs"));
+        let root = Dir::new(c_str!("sample_debugfs"));
 
         {
             // Create a subdirectory, so "sample_debugfs/subdir" now exists.
             // We wrap it in `ManuallyDrop` so that the subdirectory is not automatically discarded
             // at the end of the scope - it will be cleaned up when `debugfs` is.
-            let sub = ManuallyDrop::new(debugfs.subdir(c_str!("subdir")));
+            let sub = ManuallyDrop::new(root.subdir(c_str!("subdir")));
 
             // Create a single file in the subdirectory called "example" that will read from the
             // `EXAMPLE` atomic variable.
@@ -51,6 +137,22 @@ fn init(_this: &'static ThisModule) -> Result<Self> {
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
2.49.0.967.g6a0df3ecc3-goog

