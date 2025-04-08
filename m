Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DB8265638
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104252; cv=none; b=O/wkY/xIlZ8Omq0M1mAglX83AoQPOpV/+4fHf6Vcl1QmBrHjYftoXO1sJP7ZvM6BbLBHwPCQRQsrHHfl/ort6cCS1JXx+fI2JfNsIeNnmFLaxch4FNlWQfjT52cHGGm0NUDPKs4pMaElBmIaZ8SvSQ7mhLHi+8fcslCd7klqBZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104252; c=relaxed/simple;
	bh=LmtcKlgkxP20LxSNq37k/eXJOg5jI9B+op34oo2QYlU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K3K6LsgIZdgVRVcMf4zEPj3TFT1tLB5THLuoqtfGfp9fuOX/9OK1SCBT2vkyhpiVSgmZ2np9qY37Mg7ESoWrNpCYOxTBGwIH7w7+TGBFPtwbP6ANJTcgVNpxPhAMEqxB/5MWJDMGSFZ0sIwnpjSHkM0lBMcj22cbKL29eEf4kao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SFVhT604; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SFVhT604"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43efa869b19so16419985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744104249; x=1744709049; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bACckoQSwDfUzBFoYMbXvpmJP89UDR/iGZngv5w49FI=;
        b=SFVhT604XnTv254qop7i8nmpe8BlzcMSog1HqxKHCRCCtEbiDq36v+V32lFvOhMGWV
         FTbE3C9yYb6r1m4J0zkCwY3NNLn+zNxrdoxeyb3EIX5UiOcgzsuhw3/yR5X0rFq7nFJE
         zujVCgcXCBuR556NmTfSKUUgZ6m2AZff5yi1+kKZWdHgpO2li87x6moRJqhAOUmEJ+NL
         gbWXNmNgzdTWCLoY6mJ9bGWLi100+X4FfHMR/FfwmI7zKL/7bBWgaPLXKKmehN+EeGkz
         rzDxJun2S3jO2tX78BU6OXKFJuv6lyOqKqu6juuWxO0AC0gLN96mx4ktVy914OwI+r8P
         IGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104249; x=1744709049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bACckoQSwDfUzBFoYMbXvpmJP89UDR/iGZngv5w49FI=;
        b=nqRGgptUE7PmXXAyJotGv7x5Vt8vJlm9ac76XwnwASKokiLtnQwcB8U4fN+AXqRp3J
         iAZ56ndqMjFgjBxQOgD9V3M27KicW2mNT6ScX8lHVmRrG+W9MfLsvmF4Y8GJvgbBYgAr
         z6yd9QuTDs581T5ChCmL1xKDikn48+fOb4t5mkdV2H4WL9tUK9qBmJ3tS6HCrHIj2rbx
         Pv2GfjQ59qyYS6JL1b9RJ/6wEFsklwXRZAoQyUc+R0UkDLUqk8yeJXCFguw1HeUgR7nl
         Wdjfvrgoqk3vjysWVrtowGDxYzcwldrU0ccZBT/Ox3mXWlGtAbDHXNOFjQaAEEB9ehIw
         9Jwg==
X-Forwarded-Encrypted: i=1; AJvYcCV/gBCrjWJN8CBpBQ/bGydszLJbSAMdusLwPDf+oF2ylvQQNwdCx9i4VBBLWBvRWHPzOCkIsj7n/Git3fI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/LwllkrLovz207+fh8qYFU6eaWOY45iq8hemv7zLwb92g4dry
	hLr32IXa5KIzlwf8U4v/0XQ+p0dGpzJ9k+OTCP6CdygtMlMFXyqlSo137QsnDV5FTpC/TVb4mxk
	rWjHkOw2I/eQXEA==
X-Google-Smtp-Source: AGHT+IHDWCtsJ/5jduSfjKCiGsbR920yirUwpI0CePyKkQEEcAeAv5QDUW+I6X/+MdTEL+UPb7oTVguYSXBKpx8=
X-Received: from wmqe6.prod.google.com ([2002:a05:600c:4e46:b0:43b:c914:a2d9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c7:b0:43c:e7ae:4bc9 with SMTP id 5b1f17b1804b1-43ecf842969mr131465855e9.1.1744104249155;
 Tue, 08 Apr 2025 02:24:09 -0700 (PDT)
Date: Tue, 08 Apr 2025 09:22:42 +0000
In-Reply-To: <20250408-vma-v16-0-d8b446e885d9@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250408-vma-v16-0-d8b446e885d9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3335; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=LmtcKlgkxP20LxSNq37k/eXJOg5jI9B+op34oo2QYlU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn9OsoxyVRA9K3PlCKr3B/V+eq1q3gOWsdM/eiZ
 X6K6ZfFYLyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/TrKAAKCRAEWL7uWMY5
 RhEYD/4kfuPcMl/0QAODznj6Z6rJZ5GbQA6paTos+nodEsXLiY5K7KF8sXZ9m9HJTOXfxUpr35t
 9d3MYoHUG8X+nN+7y27bmoEl4iX4gIiMayP3g7ZdhstImQd7F066cNJcFBH1sNAOrVXuJxIyEY9
 SoBJu8KFCx5vYsInFWNcy/zUY8h+JQTgNr1Vl9IBy1zSCjtNFHjUje+j4ntKN94ibZED5FQ2j8z
 kWu3QLhK5v4A0XpD8yt/ukwfDgKuUXwSs53w3MzZOgJtBy3eRmPapqXBfACVrKQz0PbKyzWPs2x
 i0f5UPpqZbWu9zmyRHmd0HqUUJnZvcUe38eNlOS241KVxKtb7eZSqiASAOGSK1DMV+XyFxM2WRN
 txmkDEKuYUrNMqeQi9yYhnknTvQbllMTtDzr0KeWmeP5shXPPOmfJETUe+qKjzKhNlfjZeLVu1e
 QdG51nh4dJk61DNeXYIq7gzxCMNk7bFLWJbezGnGlLYV2Gf0q6raYCAtwOI1iMn/qZeRJTm4J0f
 zLvHzfkLprVn689x4BVJ7PD5SNMmxS4BJVqiYhlfxLF/AVPW2LLg6y52gXb/ZckUu9csL3tZV2y
 XTi1fsOmVPx1sq7h/Cvwhfoomv9yQzJlgkzUgg0hUN9+m40owcDN8CNsW8duOTqJ68tXwJ/GwXT PGfD3DtHd9SDcgg==
X-Mailer: b4 0.14.2
Message-ID: <20250408-vma-v16-5-d8b446e885d9@google.com>
Subject: [PATCH v16 5/9] mm: rust: add mmput_async support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Adds an MmWithUserAsync type that uses mmput_async when dropped but is
otherwise identical to MmWithUser. This has to be done using a separate
type because the thing we are changing is the destructor.

Rust Binder needs this to avoid a certain deadlock. See commit
9a9ab0d96362 ("binder: fix race between mmput() and do_exit()") for
details. It's also needed in the shrinker to avoid cleaning up the mm in
the shrinker's context.

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Acked-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/mm.rs | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
index c160fb52603f8d4b349000451e2200fb477d98a6..615907a0f3b487996ddc066083c4984a443f7146 100644
--- a/rust/kernel/mm.rs
+++ b/rust/kernel/mm.rs
@@ -111,6 +111,50 @@ fn deref(&self) -> &Mm {
     }
 }
 
+/// A wrapper for the kernel's `struct mm_struct`.
+///
+/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
+/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
+/// context.
+///
+/// # Invariants
+///
+/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
+#[repr(transparent)]
+pub struct MmWithUserAsync {
+    mm: MmWithUser,
+}
+
+// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
+unsafe impl Send for MmWithUserAsync {}
+// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
+unsafe impl Sync for MmWithUserAsync {}
+
+// SAFETY: By the type invariants, this type is always refcounted.
+unsafe impl AlwaysRefCounted for MmWithUserAsync {
+    #[inline]
+    fn inc_ref(&self) {
+        // SAFETY: The pointer is valid since self is a reference.
+        unsafe { bindings::mmget(self.as_raw()) };
+    }
+
+    #[inline]
+    unsafe fn dec_ref(obj: NonNull<Self>) {
+        // SAFETY: The caller is giving up their refcount.
+        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
+    }
+}
+
+// Make all `MmWithUser` methods available on `MmWithUserAsync`.
+impl Deref for MmWithUserAsync {
+    type Target = MmWithUser;
+
+    #[inline]
+    fn deref(&self) -> &MmWithUser {
+        &self.mm
+    }
+}
+
 // These methods are safe to call even if `mm_users` is zero.
 impl Mm {
     /// Returns a raw pointer to the inner `mm_struct`.
@@ -162,6 +206,13 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
         unsafe { &*ptr.cast() }
     }
 
+    /// Use `mmput_async` when dropping this refcount.
+    #[inline]
+    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
+        // SAFETY: The layouts and invariants are compatible.
+        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
+    }
+
     /// Attempt to access a vma using the vma read lock.
     ///
     /// This is an optimistic trylock operation, so it may fail if there is contention. In that

-- 
2.49.0.504.g3bcea36a83-goog

