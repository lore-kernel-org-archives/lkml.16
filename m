Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7DC1F8681;
	Mon,  7 Apr 2025 14:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037558; cv=none; b=jlwMeot4sHe+BhWm4LYXebIoToSqyy2xfc73ojdxZaWxA4hz+gV3k4B/NQ1b2+sR2VA7jLuAjR2D/xA7nk5UOJ8muspguYVtf8HGVwITIy8s2TbxslCO5ft40LMXu4YVDbvV9849PFFcPTkPdUBL5OK853nrRiQThypb1gZ7Yig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037558; c=relaxed/simple;
	bh=nCyCTUmjgvM2Ewl4LpZ8GJPzP0gVuWaJXuVsOo7zTA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d4hBsfl9NzqZ8jxBs3l8hyUmxBRkeW4hDXpmnfPZgyph1KtO65tPsuZVHEg6YdR/eScRxsffUchXoQFLOYl1/tehZU2nYCsXBy5vM/Ev7gSzz6EjJ7tLj69bV4Kasz4ZQFXSTUWJwL1dg2XthZ/mdh6WILB9NoTOdddJu3vnXoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTkUapXy; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTkUapXy"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-476b4c9faa2so53162511cf.3;
        Mon, 07 Apr 2025 07:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037555; x=1744642355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9bXsaHdigFtnZ6oLbvWvIAc6v1jQOnqbovRbFPfFaw=;
        b=hTkUapXykty0H2nLYQCzyk71NdRSJ9IOP9u6ZORSGFVlTm+mgaBWWRb7IlZHBM1V4I
         zd7FjfbWb5zyDvnR0fkGvUvIiiNpyv0vBO/21z/OL0Jcu8Hy6YTDTUnziEDDBEaDZqu5
         tg4KJR9VJkMpocBUgRYzqbSI0wBIIcLQNxKbWn9+e9UeVxZR7PiB8OsJKivBEnuAJt9z
         eMV9vjaEZjkuKJWhpq/bmLvg1PNcKBLhEq64m2n+2Q5xidCFnJyc9g/Pt1o9fIsjPPLu
         j84qYKNzI2vu+E9XqmkjZnBo9M5RW38nUJ0iduY7bL7UzhtmpRue2vqVHMIjzofsqKub
         7Fkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037555; x=1744642355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9bXsaHdigFtnZ6oLbvWvIAc6v1jQOnqbovRbFPfFaw=;
        b=RF9NHvSehIFtAIpcufIVW45RxYrYaEZkzMBxXf1X8vhOo1dTZL5OgK1JMZ94bkLS5i
         gUTOUC+W2em5UzpkdbS9oH3IWcVn1QqcBQlPSj9s8tbm5RrvRmVkBkT4va7jL156f45J
         NHvTpX/P+bUboRh2iYoGPUkAYf9OYfJ/WpXZfGaPTixzQp+04bQSNoXjpHYIChL/zMO3
         0twQtY07MhM73JF7vJ54IvI40iszcwhI8xcql8q/viCOAgHhcExIlF9qMYoUDs10OXDX
         rPg21QUKyb5tKoPHKwJyUIaZNMhiISJsKQJGMBce7KbKwji5FApSAmmw5yQOddc9wJBR
         3kVA==
X-Forwarded-Encrypted: i=1; AJvYcCUo9/FxrLiyxuB7Rm1b1dJ0g9JoY58x7hFUdq4kG72J7c03OWDgqDw6mgrFM1tUaVLy3/rEtZ1zWqhfWyE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9U74SzKBr76ahHpvkuaaJFblQ45hZKm3q+Ubs+BpBXJ5RQZa/
	K32ETVhhjheX272U6Y4Pf/APlVWlw5wzPgIpQF3FU2iv02o1mEAtDt/xOA==
X-Gm-Gg: ASbGnctxh/v+nC1e66gRym2wMS4u8acsARF82aiBtxyqbmxQfXUz8hJ88fM8coyikCQ
	GjMCACeF6E9ElsVrl89MTLwDwugyzwIAOEPrzoxQ3/6EVwvipI0orsHVDhXWb4cIVX68IeZJFIk
	DGX4/GknAr7b5OJ58zYaKZeiyHCXmVF25VfdGAeLRieK2iDqnRVPFl7PdX3faV5ldn/I0SzowXP
	RAnEXtzHnhAN3Y+J77FeGANltESsiqPaJN92hKPGl0ZEV/SbVVHI6TKaYL84fvU6QaYUOepTKa+
	lgr1EqsGV0Oxw3x0lYSU/+B66uyvGIjxjCIunn/CvoTlofPJxsKNuIphu5BDajFL6cT0KdkZNFW
	/Q2Tv7oPS7QCSY2rd1P7a9tMZYVSETCbJQ0t0fCEXqrU0HCWiX9bRmw==
X-Google-Smtp-Source: AGHT+IF7PDCkqwUh+RUKUoekJdm4DFiDxe2Kohgw9QJDLYYkhHpRMHxvJNPDxB1wY2rC8ks4/hvQMA==
X-Received: by 2002:a05:622a:1349:b0:476:9483:feaf with SMTP id d75a77b69052e-4792595a4efmr175777321cf.19.1744037555514;
        Mon, 07 Apr 2025 07:52:35 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:d8ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-479364eaa28sm33065601cf.28.2025.04.07.07.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:52:34 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 07 Apr 2025 10:52:31 -0400
Subject: [PATCH v3 1/4] rust: alloc: add Vec::len() <= Vec::capacity
 invariant
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-vec-set-len-v3-1-c5da0d03216e@gmail.com>
References: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
In-Reply-To: <20250407-vec-set-len-v3-0-c5da0d03216e@gmail.com>
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
 rust/kernel/alloc/kvec.rs | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 7ebec5c4a277..f8045b6c8976 100644
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
 
@@ -289,8 +291,8 @@ pub fn push(&mut self, v: T, flags: Flags) -> Result<(), AllocError> {
         self.reserve(1, flags)?;
 
         // SAFETY:
-        // - `self.len` is smaller than `self.capacity` and hence, the resulting pointer is
-        //   guaranteed to be part of the same allocated object.
+        // - `self.len` is smaller than `self.capacity` by the type invariant and hence, the
+        //   resulting pointer is guaranteed to be part of the same allocated object.
         // - `self.len` can not overflow `isize`.
         let ptr = unsafe { self.as_mut_ptr().add(self.len) };
 
@@ -822,12 +824,13 @@ pub fn collect(self, flags: Flags) -> Vec<T, A> {
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

