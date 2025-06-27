Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65BE291C0E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751066340; cv=none; b=TlvEXGJxIIHyQ8HzLIaN7q78H/sXJ8ogxh56unr2cmxMuxUOKfJS2dzpzaA45U/O2HrHnRx/n4gzAlj6OY10Ru6xKY0NHHbPP9mlZHKKbMrUkXXtKrNnifvHnVcLP55ZnHpisqdLHzKpQoN/e5TrhQR3RQc/kvQgAsodhVzCs0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751066340; c=relaxed/simple;
	bh=83dRpM/03A3Py3qB3VHZ341i3AVbxRvhjg0jVkwG3aE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G/hKgTZOygkLma8r9OWpejq8s/DmSnEVX/Yd3ppFrWck0o4MX759UPY6XxqPJ9QJHGUyyVWoeg/rj6b7vCadBrRelGggMcXN6W5aEd+BuFe84h0Q5XENGpoBC2hGWrxEEnA1PdJ2+uKGFR+HsV1tWCXQfHbBWXi/mMm7o3/ABfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h6TCPgJ/; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h6TCPgJ/"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-313f702d37fso78937a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751066338; x=1751671138; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IC9J+HBqr3YpeYxryDec+V8fkN6Ro/VZxjRt8PTyhaY=;
        b=h6TCPgJ/5yK+S7KXqdhH2p60ZkzuUZw3k729lLDTTbC4OpmJ68deuiAeN/aFRlHsyg
         a7NHBnjGDpzhrgukKsc0jbI3A/jyXyh5GgxIJGVZqw+Pyt4V6PCbn8krVEp+WXO3wgit
         n6BSd/sXzpYgKcr2YKPV6rQb4CQkDHV3iz4niyUl7um1JETQb3PoDcfrzaVq1D9M6zNP
         +AC4PlMfPbSdq1t8ydIcy6CeS01b9uBjaUuObB2OT2gU39mBWicS+5MeX5hnESCnuOzF
         D7sKjuuMKUVFOSEa1T/d2f0mSJBJp+7bNfrQlg+cPOB8PEf/pvyAdkWZJWigVH+rl1te
         J92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751066338; x=1751671138;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IC9J+HBqr3YpeYxryDec+V8fkN6Ro/VZxjRt8PTyhaY=;
        b=thncusGbsWZB9ayxlx3i1pgtUpmzDi0gE0TapoUBYJEC1Xe8t0W1xeXXlaJ/k6PPTk
         gOLgutAh1BnQVe+uk8Iep84FT81U7f04bocu1z1mMqA8tyYIqE002yxLsb7aV2A/lc9d
         ZKtC54I+IHAR/PD9mjpPHzVTtxlSkqrTunG6MiVRIJRd6fy08+AGhUX1KHBygpcvze07
         PQFW14nv5wrm0nXczHYguAi/MFYuTLzZL3E+znDqxDk2MACU2XIHQbdTHMFXSt23RxvL
         KwTkS4Cax2HYVEKNPAuhkh3e/hz+iEtugC22MCNRMnQ845riXSSGeJLCO1RVF639OOAY
         BG6g==
X-Gm-Message-State: AOJu0YzJpViBBu75NPVWLuKZ4FL8dfsDLmBsQlm4z+v80A6rkcBs6xO7
	0ZQazgyV7ssPGf7DKRYzu/iDN6iytsqz74dtx4DSd3tj6ZsyXxn/r/QWGw22Cb1lbab5xwo3amo
	8yt50zPXFnQ==
X-Google-Smtp-Source: AGHT+IHX2FXBjpY4uMqprP0OC45FxV2aElOLRN7uPFvb94ssMTGraXlGlYHjUyqIVNaqlTMiRKov5mRWmpai
X-Received: from pjbrs7.prod.google.com ([2002:a17:90b:2b87:b0:315:b7f8:7ff])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:268d:b0:312:e91c:e340
 with SMTP id 98e67ed59e1d1-318c9283adfmr6910414a91.35.1751066337995; Fri, 27
 Jun 2025 16:18:57 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:18:26 +0000
In-Reply-To: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751066331; l=3205;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=83dRpM/03A3Py3qB3VHZ341i3AVbxRvhjg0jVkwG3aE=; b=7sgs14fHMCWS+uz+aLGE2uGJw2KLBaqu3JfVhUdboDuXGvlalcBdHCrmN0Ng30+m+8a7Y+A2i
 rloM3MoYtRtC5HfWswe+Zp5QhKcMTot2Hs/npNrAdW2ig0ygr/Zd+IZ
X-Mailer: b4 0.14.2
Message-ID: <20250627-debugfs-rust-v8-3-c6526e413d40@google.com>
Subject: [PATCH v8 3/6] rust: types: Support &'static and &'static mut ForeignOwnable
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"

These types live forever and do not require cleanup, so they can
serve as `ForeignOwnable`.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/types.rs | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 22985b6f69820d6df8ff3aae0bf815fad36a9d92..0a2b15cd05f91c69ef9c678555b845a23c19b82c 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -142,6 +142,64 @@ unsafe fn borrow<'a>(_: *mut Self::PointedTo) -> Self::Borrowed<'a> {}
     unsafe fn borrow_mut<'a>(_: *mut Self::PointedTo) -> Self::BorrowedMut<'a> {}
 }
 
+// SAFETY: The `into_foreign` function derives its pointer from a reference, so it is correctly
+// aligned.
+unsafe impl<T: 'static> ForeignOwnable for &'static T {
+    type PointedTo = T;
+    type Borrowed<'a> = &'a T;
+    type BorrowedMut<'a> = &'a T;
+
+    fn into_foreign(self) -> *mut Self::PointedTo {
+        core::ptr::from_ref(self).cast_mut()
+    }
+
+    unsafe fn from_foreign(foreign: *mut Self::PointedTo) -> Self {
+        // SAFETY: from_foreign has stricter restrictions than borrow
+        unsafe { Self::borrow(foreign) }
+    }
+
+    unsafe fn borrow<'a>(foreign: *mut Self::PointedTo) -> Self::Borrowed<'a> {
+        // SAFETY: We know the original reference lived forever, so we can convert it back
+        unsafe { &*foreign }
+    }
+
+    unsafe fn borrow_mut<'a>(foreign: *mut Self::PointedTo) -> Self::BorrowedMut<'a> {
+        // SAFETY: borrow_mut has stricter restrictions than borrow
+        unsafe { Self::borrow(foreign) }
+    }
+}
+
+// SAFETY: The `into_foreign` function derives its pointer from a reference, so it is correctly
+// aligned.
+unsafe impl<T: 'static> ForeignOwnable for &'static mut T {
+    type PointedTo = T;
+    type Borrowed<'a> = &'a T;
+    type BorrowedMut<'a> = &'a mut T;
+
+    fn into_foreign(self) -> *mut Self::PointedTo {
+        core::ptr::from_mut(self)
+    }
+
+    unsafe fn from_foreign(foreign: *mut Self::PointedTo) -> Self {
+        // SAFETY: from_foreign has stricter restrictions than `borrow_mut`
+        unsafe { Self::borrow_mut(foreign) }
+    }
+
+    unsafe fn borrow<'a>(foreign: *mut Self::PointedTo) -> Self::Borrowed<'a> {
+        // SAFETY: We know the original reference lived forever, and the requirements on the
+        // function indicate that `from_foreign` and `borrow_mut` will not happen concurrently, so
+        // we can do a shared borrow.
+        unsafe { &*foreign }
+    }
+
+    unsafe fn borrow_mut<'a>(foreign: *mut Self::PointedTo) -> Self::BorrowedMut<'a> {
+        // SAFETY: We know the original reference lived forever, and the requirements on the
+        // function indicate that no other borrows will happen concurrently, so we can do a
+        // unique borrow.
+        unsafe { &mut *foreign }
+    }
+}
+
 /// Runs a cleanup function/closure when dropped.
 ///
 /// The [`ScopeGuard::dismiss`] function prevents the cleanup function from running.

-- 
2.50.0.727.gbf7dc18ff4-goog

