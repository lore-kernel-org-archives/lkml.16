Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF2B2192E1;
	Wed, 16 Apr 2025 17:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744823755; cv=none; b=tpA4c5FNE7CZtwbrNuynsR48ZG2GXWXi59cPjf7BV4Css6Tz/mEgK1gqmkzDHduh5HvQyQHt8r6wSR1DJJLil5RR3RXz5iX6UHXk43gN93FgnXpDWcdBlLKAwXskbd+SVvxjrA8PnddyLrTSO4vdZJeizz2fzTXKvJoCemcdOlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744823755; c=relaxed/simple;
	bh=9rLtOPLY17gx2GMZGMRkOO2WIaL1Ea9WAPym9LTlxWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nZNhfa7SCNtKAmdBC4ARQlytRjAhnb8guVmJWbj+eZQ2UoSctEFyWi/oqik40AegCYXmq+zKCYKL4ulS7AaHGI7+4mGeN0OD2qHv9/psSmYtQQVyVF+EK+9vVA7ddlXEvQ6EL4fFYM7RJV4FrsJLm16DP8fzVTRyk4LIM+2Ia4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EW3AeXtF; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EW3AeXtF"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c55b53a459so739553685a.3;
        Wed, 16 Apr 2025 10:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744823751; x=1745428551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvj+xkW9N7eT2ycUV7dAvsc0ji3CSsziYhfLO4Kf9YI=;
        b=EW3AeXtFMycXLdVySbkzOEFq5NAc5/uiQkO5HXQvlH7GdSXkB/n76icsDNo+qTgvCY
         mTQXcczUdQi3WPSrvvF+ltUi2VcytX3gStFxIciHsN5hcxI7ZqQV7cg31e/rcrrqX5MC
         wPI11x9qycnBsc1tApvZYNjE3cWVKdG/AQSO+deGHITQGgXV5IC38l7JL3tyBKsEETeW
         S2XMM13WwNY4ActRrgUZTt2EsjL5mX0NI5XiYG4NwSvzXuIT8DPmBD1MfLf9gURLi95n
         2T7MUQsRBoifbScBZv3kHvmkT252wRw6PIwX53hixUPsyBKrlqeVvvIfnuwbtgcnzulP
         epyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744823751; x=1745428551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvj+xkW9N7eT2ycUV7dAvsc0ji3CSsziYhfLO4Kf9YI=;
        b=hIdE/8GrjuQMjIUWTgey9zU9DDo+j23vzyWxtIIeGN1UYoz85Hy2ZcP6gzf04qL70k
         9LLpdYHj6i5cdiFajJBeJ/AkK/VU8e2Hg33AlA0lALIeLCXvMePcj+qOR8rMK844bIpp
         klzy0DHx1mn6y3n92zwHZSNB+Zz4GLgsMf/akFkl+KxudKC1WjvDyXp9aNBHhkH/bQuL
         RBRZnLv5K1WGxz2roXM4MNmYlU4NuwAsNKTvJLnZmLY61nf0BUj8jM1Nn2otWA6NcWn7
         6/wiDZRb2T76PC0V4szk0oDWegLbEgWMfBBJQdfXBSxjH60eaWl2ve+8Z/mgz9WG7Oik
         7fYg==
X-Forwarded-Encrypted: i=1; AJvYcCUPmnOdBPRWex61tDm/UxUVvkUp5eoYLQDpdXO2JrSUkZGip3H+lIkpKUokYOWR4I7BgALh5+yF8q+UGaI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzukJWO6etgM3358Lm4sUQGZcuPV45weuRoo8z+JkCVTtPhw8Bq
	tAyyzY0MOTk5MOlgNh8TwysKYSQjbavwBY9xO5TZhkeec55CRdzG
X-Gm-Gg: ASbGncvc20KoTgfjJB+39/KH7RUSa3v6MmZt4O+pOFbX5HI7Mk89ioL9yUqUXmu8tCF
	21Hnhi3JI4DlmaC0b0rCAXK+46dNsC1TkOnAjkJVNXVD4ozvuBIjBG7kbjio6ji+HZdTVQDlJpf
	Azc5HaGO4yflNW5Wmdq5S/N12C8Q+wSPeRTtbsOZmqzLs5nbjHsuCyG015QN20XsJCWn/EBT6Da
	qJ/B5MXY4k363fP9IOAxjp2Dcz7oC7g/tGLNyw3qWbibu25O0HZnXXIaOuWat5G168qD551d2p7
	Xw97n2dj0ta7CJ9T4IGyaXUAerbcXHaDnEX9SQ8acxpzVzlpbl7sSHDXCa+ajK7z3zBeUz4unsS
	ae0upuHk6pRHbhc7CsLfrNIFi5xqwAdwSYq7i5hEmGvZl
X-Google-Smtp-Source: AGHT+IGqr3/RByWmVXQ5my8rSOiLv0uwBMH6X9JeNtQeRyAbo2LCL0hwCqx95wUv0ABEd0mp4ZvcrQ==
X-Received: by 2002:a05:620a:4112:b0:7c7:a5f5:61be with SMTP id af79cd13be357-7c91900478emr419476585a.32.1744823751065;
        Wed, 16 Apr 2025 10:15:51 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:a61d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8943834sm1084605185a.22.2025.04.16.10.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:15:50 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 16 Apr 2025 13:15:40 -0400
Subject: [PATCH v4 1/4] rust: alloc: add Vec::len() <= Vec::capacity
 invariant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-vec-set-len-v4-1-112b222604cd@gmail.com>
References: <20250416-vec-set-len-v4-0-112b222604cd@gmail.com>
In-Reply-To: <20250416-vec-set-len-v4-0-112b222604cd@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Andrew Ballance <andrewjballance@gmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Document the invariant that the vector's length is always less than or
equal to its capacity. This is already implied by these other
invariants:

- `self.len` always represents the exact number of elements stored in
  the vector.
- `self.layout` represents the absolute number of elements that can be
  stored within the vector without re-allocation.

but it doesn't hurt to spell it out. Note that the language references
`self.capacity` rather than `self.layout.len` as the latter is zero for
a vector of ZSTs.

Update a safety comment touched by this patch to correctly reference
`realloc` rather than `alloc` and replace "leaves" with "leave" to
improve grammar.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/alloc/kvec.rs | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 6ac8756989e5..ca30fad90de5 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -90,6 +90,8 @@ macro_rules! kvec {
 ///   without re-allocation. For ZSTs `self.layout`'s capacity is zero. However, it is legal for the
 ///   backing buffer to be larger than `layout`.
 ///
+/// - `self.len()` is always less than or equal to `self.capacity()`.
+///
 /// - The `Allocator` type `A` of the vector is the exact same `Allocator` type the backing buffer
 ///   was allocated with (and must be freed with).
 pub struct Vec<T, A: Allocator> {
@@ -262,8 +264,8 @@ pub const fn new() -> Self {
     /// Returns a slice of `MaybeUninit<T>` for the remaining spare capacity of the vector.
     pub fn spare_capacity_mut(&mut self) -> &mut [MaybeUninit<T>] {
         // SAFETY:
-        // - `self.len` is smaller than `self.capacity` and hence, the resulting pointer is
-        //   guaranteed to be part of the same allocated object.
+        // - `self.len` is smaller than `self.capacity` by the type invariant and hence, the
+        //   resulting pointer is guaranteed to be part of the same allocated object.
         // - `self.len` can not overflow `isize`.
         let ptr = unsafe { self.as_mut_ptr().add(self.len) } as *mut MaybeUninit<T>;
 
@@ -817,12 +819,13 @@ pub fn collect(self, flags: Flags) -> Vec<T, A> {
             unsafe { ptr::copy(ptr, buf.as_ptr(), len) };
             ptr = buf.as_ptr();
 
-            // SAFETY: `len` is guaranteed to be smaller than `self.layout.len()`.
+            // SAFETY: `len` is guaranteed to be smaller than `self.layout.len()` by the type
+            // invariant.
             let layout = unsafe { ArrayLayout::<T>::new_unchecked(len) };
 
-            // SAFETY: `buf` points to the start of the backing buffer and `len` is guaranteed to be
-            // smaller than `cap`. Depending on `alloc` this operation may shrink the buffer or leaves
-            // it as it is.
+            // SAFETY: `buf` points to the start of the backing buffer and `len` is guaranteed by
+            // the type invariant to be smaller than `cap`. Depending on `realloc` this operation
+            // may shrink the buffer or leave it as it is.
             ptr = match unsafe {
                 A::realloc(Some(buf.cast()), layout.into(), old_layout.into(), flags)
             } {

-- 
2.49.0

