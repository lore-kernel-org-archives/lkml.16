Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143542DCB65
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968570; cv=none; b=ZIQSOLbJQF0jkHLsd24ldwB1qcdIdOaKGdwTyvOCAtSlyAlr7PaCQ0YAXRpyyEDEOClX/nCRYroEn6uRFrhyckA2Knm58Ev9V72U0NNcHHPI2PZ4wmPN3v3ouRgE0UFBbnTvK6rel3sWbwCbBAQhmb2yleQQoLkzxdO1Xjwo7pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968570; c=relaxed/simple;
	bh=xXexSYkiF+xc8497WmxTstUfnLfJhJHySbr1mw5kEMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KzIsSgz/UITFfuJGRYeWgg/za8DLI1FCqhCV55h/a1kTyuEZ5T4NwexgcrTt6ZRw9HmkkAP0DWEhJAhYAWpD/HrGwaWa6jBL3lsDNcHNZvwoTixRoJ5P99uSEwPEl2revW9Mxoh3t4oLTGU+NcVylOL692tkQesZiqjKF4gTpgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RdVivedl; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RdVivedl"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b0b2de67d6aso6537115a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968568; x=1746573368; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PD5cfpgRQLloOpPgFL2g+9oCBHx7RurASuZ91+rQhoM=;
        b=RdVivedlaJI657KoQWsIARoNwmyd54g96iveqVd3L4VG1NyaGp5JFrn8zD4mvBu6mY
         STrSrNDbfm5cOxZO9c7uLV/YdyW4HAOSxOmuICUSdubI5MIOfUdSZfb/juHMMTJhCnwv
         YrTbPbchSeQdZRP7acRAxYBWgaoAAbNSyhWelj1wt8XeEvg+GnAi6orycW/1J3RExDiH
         0o4OT596m/CfL12r6iVnwNhFco3p0R02vLLTnOqQMz6+P5hMdou0cyEzXKAUCSvrOJTz
         SDazLzrlNuQG0ZM8GjwxbiAMUn1n1chtI7RhnJsBgjh5LWIfziUn1fXgdYlQ5S8XDnEd
         lWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968568; x=1746573368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PD5cfpgRQLloOpPgFL2g+9oCBHx7RurASuZ91+rQhoM=;
        b=VLlOy/3xs7jmXu2jjEbBoQ2529GHRCQl+yO2HXoxZ5FYhndZNmOTGCez+ctOgn9xlC
         HJyEa0IO602KeGP9nE4jgt/OmttbYuIczLkGbpzYt6Ut4HedsXuEHGnse/kj77qPVbFV
         kmrC9prXr9L7oedciFW1uFpO7veIATD0n3v0xoihAIoru52tEGv2JSXZYcNcZ2NP/r3q
         GBXjyJGV7uhNQSWXfJ8FSiTnSrmQPBkDbZn7qKYfSOTHk521SCI1UGmU+W+iBElVjkse
         HLiOFAFclEUBk73L2opCz9fGJzZCic191dhivr5mBl55/NaU2ClGgj4vg0gKcBtjSZrC
         Uy7g==
X-Gm-Message-State: AOJu0YxJQHzzKTa9AJx46bxVPZWLKeM28xKjiZQJQbuWYPTgxfy2k3BC
	K+M8PvN4s9f9ek/vHwJOolvPINLXBLYOYzEX9K45Jy02vKP+retngQ5zCQ56SKL9StJ+iYnFiGr
	d7tN5Fg==
X-Google-Smtp-Source: AGHT+IFhqMU7HcZrsLCHA1y4faH9LHObOnl08AX3PwgnJaNDFkUFrpblJwLZ0zdt/VtLoCwQZBwjjfz85EX+
X-Received: from pgg19.prod.google.com ([2002:a05:6a02:4d93:b0:b0b:2032:ef98])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:2d2a:b0:1f5:70d8:6a98
 with SMTP id adf61e73a8af0-20a8499baedmr1035776637.0.1745968568359; Tue, 29
 Apr 2025 16:16:08 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:16:01 +0000
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745968555; l=2455;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=xXexSYkiF+xc8497WmxTstUfnLfJhJHySbr1mw5kEMY=; b=bcVWeoLnL4CEsh9LxPMGw2mltHgE8e6mF/mnRQTkIsfElcQ9i0wpqurDrXhh0gTfFS/vCaRqF
 g9pYvALCqrQDl3CsdFH3bDdmyt7s3luA0i2g2NIAk+nuttsorUqH3vZ
X-Mailer: b4 0.14.2
Message-ID: <20250429-debugfs-rust-v1-7-6b6e7cb7929f@google.com>
Subject: [PATCH 7/8] rust: debugfs: Helper macro for common case implementations
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

The most likely thing someone needs a custom hook for is a simple
wrapper function around `write!`. This macro lets them just specify the
format string directly rather than the fully expanded closure.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 835df2b5d7311f278d1d15fc8d688809d0ca363f..edc6dd4cc5aedd4d3f1abc1a3793b39fce110d7b 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -8,9 +8,9 @@
 
 use crate::error::{from_err_ptr, Result};
 use crate::seq_file::SeqFile;
-use crate::seq_print;
 use crate::str::CStr;
 use crate::types::{ARef, AlwaysRefCounted, Opaque};
+use crate::{debugfs_fmt_file, seq_print};
 use core::fmt;
 use core::fmt::{Display, Formatter};
 use core::marker::{PhantomData, PhantomPinned};
@@ -124,7 +124,7 @@ pub fn display_file<T: Display + Sized>(
         name: &CStr,
         data: &'static T,
     ) -> Result<ARef<Self>> {
-        self.fmt_file(name, data, &|val, f| write!(f, "{val}\n"))
+        debugfs_fmt_file!(self, name, data, "{}\n")
     }
 
     /// Create a file in a DebugFS directory with the provided name, and contents from invoking `f`
@@ -383,7 +383,7 @@ unsafe fn new(inner: &'a Dir) -> Self {
     /// # Ok::<(), Error>(())
     /// ```
     pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'a T) -> Result<()> {
-        self.fmt_file(name, data, &|val, f| write!(f, "{val}\n"))
+        debugfs_fmt_file!(self, name, data, "{}\n")
     }
 
     /// Creates a nested directory that may live as long as its parent
@@ -494,3 +494,21 @@ unsafe fn materialize_zst_fmt<F>() -> &'static F {
     // we can materialize it.
     unsafe { zst_dangle.as_ref() }
 }
+
+#[macro_export]
+/// Allows defining a debugfs file with a format string directly
+///
+/// # Example
+///
+/// ```
+/// # use kernel::debugfs::Dir;
+/// # use kernel::{c_str, debugfs_fmt_file};
+/// let dir = Dir::new(c_str!("foo"), None)?;
+/// debugfs_fmt_file!(dir, c_str!("bar"), &3, "bar={}")?;
+/// # Ok::<(), Error>(())
+/// ```
+macro_rules! debugfs_fmt_file {
+    ($dir:expr, $name:expr, $data:expr, $($arg:tt),*) => {
+        $dir.fmt_file($name, $data, &|binding, fmt| write!(fmt, $($arg),*, binding))
+    }
+}

-- 
2.49.0.901.g37484f566f-goog

