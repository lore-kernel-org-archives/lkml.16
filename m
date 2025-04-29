Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697DB2DDD1C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968568; cv=none; b=IScDM0T4WXWssbj9YdkoL11+Ika7nEokH4z/Eu21JPOprdxI4p9Au7yTM354CJ9RMPcqmPrbSq+4ipmguz9f0dRh/T5hloPhIxj1OQFhiitwyfXv4v5r42wGZ07HsymjoD6pOJ/Q1RVPqx/CIGwXo8z8D/sBJfzhYfUkjQIG4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968568; c=relaxed/simple;
	bh=jDFfce/aYAONbVLfkZooVl/9tCKFiXYK/iIQZ8BPTh4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jd4f05duH0ieDrpOXXCVNpaiQKZaXYm/XLZEyrlfybj48Ezeuij+oSqIjS1zX+vZvOSTX99HxYYeMWwH7+9HlcnNZjofpCSfb8y8i5hPwxmef76BAoo4PTSd60FIDOfz4YwzbszWsaxLepMesQ6Ecwck2Bd49QWqE3kDZf0fa5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bqa9WAVo; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bqa9WAVo"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7394792f83cso4826968b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968567; x=1746573367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k3FMAy/FRG8pC4dy6gwKrSSJ8zPsmrSC5WffLcum+zI=;
        b=Bqa9WAVoTOwwHfy6tIXilrYAj83iC45tTNMgOmK+nca3E+mZYmkHH3mj1tkw8rGsVp
         0V8ARbd/Yc6i9Hx2JD4wnr0AOK4EIKYOopdFhd3foM9xUx2Nhg7+T6U35SEPHE76bAar
         Ylt/gJEdvkAFfUDQO7oOUQwLM4hRp39lsQvhD0LnfhBcHWtPKjf1/MM9ik+MSgzwe9vL
         wO9LlyG/M26XcG5nIuEmpq1A1BY7l+bI644ffAJMQrOkQjTI7fopj9eCdWs8OiMKWzo/
         FZ3mIBjnKMOKcbtKq4fZLS1BcqnfrSsNl4nOiowuVFSa7a15uNXFgi4v0pgTpy9Q+A64
         TRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968567; x=1746573367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3FMAy/FRG8pC4dy6gwKrSSJ8zPsmrSC5WffLcum+zI=;
        b=f6NBRaB6IYZbPkjm0jslR0zGxi1+sU7BlLMkYhY58+OwMwJe6+B3xycWD53euED0pg
         IfLtL3ssLSDZEq0ASCpSPGfzfehY412Xkey+LvGfaCEHuREpSXtAwguu4JMgo61sSUw4
         qMMY38xwFqjykCFwZ1XWd1EiJaByRAbROUst4rPOTQfUf3xJG7mBZKIxUKdUJyiQcOXP
         e2P/4+uDI3ie5FrX3Ev+VmRu6siKMXraX2m37QUE9qGm3Tj6IqsSR50J7D+GLrTEqVKA
         3ds2wNhOHYifIJ2FtSE8T9beJwuNzTbWvOXqyHbcQF4/A/zNtsDJZWN1pSORPSSAtpZj
         VhtA==
X-Gm-Message-State: AOJu0YxbgY+1LP82IFhsP7Bfk849jYcHCqpE3mFThcRL+gzp1T9y42Jd
	bHj9AJye01Lw4Ou5ViTj3qqiQjhPbiTuEvvVacNULPIqJXs/K6vV1oSUdJ4A5aIyZAtyGCZw/hL
	E3mxj1w==
X-Google-Smtp-Source: AGHT+IEKHsMjgQbX0xL5oHPDv7g0/Jga2HzMD62d9lUDbD1bZSA6aPDdFszQmEX4C9qLEPkZIOYrZWj3bhsB
X-Received: from pfbei14.prod.google.com ([2002:a05:6a00:80ce:b0:739:8cd6:c16c])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fc4:b0:736:5544:7ad7
 with SMTP id d2e1a72fcca58-740389c7565mr1415868b3a.14.1745968566698; Tue, 29
 Apr 2025 16:16:06 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:16:00 +0000
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745968555; l=2919;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=jDFfce/aYAONbVLfkZooVl/9tCKFiXYK/iIQZ8BPTh4=; b=99NOQV1gabyc6/DqvOs21yTHQraG+0GFG+dlf248szD3TAv+PdOSOlz7Ap7pz3dvuE9+nfm4j
 vVLsOm1sScdCvn+yYgDYxj/jyqImRIL4vhyiZbVUy7YtawNtkm8cWvU
X-Mailer: b4 0.14.2
Message-ID: <20250429-debugfs-rust-v1-6-6b6e7cb7929f@google.com>
Subject: [PATCH 6/8] rust: debugfs: Implement display_file in terms of fmt_file
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

fmt_file is fundamentally more flexible, this reduces the number of
unsafe blocks, and allows us to append a newline for display_file which
is a good default.

Previous display_file did not append a newline to ensure that all output
strings, including those without trailing newlines, were an option.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 2faa59d2dae44ab708cb8fca0d23f06f73a95a3a..835df2b5d7311f278d1d15fc8d688809d0ca363f 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -108,7 +108,7 @@ fn as_ptr(&self) -> *mut bindings::dentry {
     }
 
     /// Create a file in a DebugFS directory with the provided name, and contents from invoking
-    /// [`Display::fmt`] on the provided reference.
+    /// [`Display::fmt`] on the provided reference with a trailing newline.
     ///
     /// # Example
     ///
@@ -124,8 +124,7 @@ pub fn display_file<T: Display + Sized>(
         name: &CStr,
         data: &'static T,
     ) -> Result<ARef<Self>> {
-        // SAFETY: As `data` lives for the static lifetime, it outlives the file.
-        unsafe { self.display_file_raw(name, data) }
+        self.fmt_file(name, data, &|val, f| write!(f, "{val}\n"))
     }
 
     /// Create a file in a DebugFS directory with the provided name, and contents from invoking `f`
@@ -367,7 +366,7 @@ unsafe fn new(inner: &'a Dir) -> Self {
     }
 
     /// Create a file in a DebugFS directory with the provided name, and contents from invoking
-    /// [`Display::fmt`] on the provided reference.
+    /// [`Display::fmt`] on the provided reference with a trailing newline.
     ///
     /// # Example
     ///
@@ -384,16 +383,7 @@ unsafe fn new(inner: &'a Dir) -> Self {
     /// # Ok::<(), Error>(())
     /// ```
     pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'a T) -> Result<()> {
-        // We forget the reference because its reference count is implicitly "owned" by the root
-        // builder, which we know will use `debugfs_remove` to clean this up. If we release the
-        // file here, it will be immediately deleted.
-        // SAFETY:
-        // Because `Builder`'s invariant says that our lifetime is how long the directory will
-        // be available, and is equivariant, `'a` will outlive the base directory, which will be
-        // torn down by `debugfs_remove` to prevent access even if an extra refcount is held
-        // somewhere.
-        core::mem::forget(unsafe { self.inner.display_file_raw(name, data)? });
-        Ok(())
+        self.fmt_file(name, data, &|val, f| write!(f, "{val}\n"))
     }
 
     /// Creates a nested directory that may live as long as its parent

-- 
2.49.0.901.g37484f566f-goog

