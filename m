Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FE812B93;
	Tue, 27 May 2025 20:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379135; cv=none; b=YAgXgjLb0KOqwzBMg564h48lmlvJRhS/81dUFHlI133jyttquuf6Jk5Dw38Fbh193RgFwELlCF6lE9BzToc6BONi7CLXgtF9C7M+szOP1KQeFcR6efNaXXDbW3LT2PDq7UJKiZqJj6i24dAennw8HFzNFTeIJtMWThGseEUUxyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379135; c=relaxed/simple;
	bh=e39syxMfWcpndgEllNrUQx6K9DL82OtNwwFXdrGad5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kYGlV3XCOUuEwhvvaE4ZLNwD9S0AgRnvadXqHgopDVGFU/oFDO9YuLzw54kAujYbsJ7wBIBzZ+VvT3jKUxR49UfqWJQcHr0OdDPhXxbmJ+n1tG/wASespvz/T495L1eLz1cNRVTlGCzhOsFdAMeS7zzEqOS80O4Iex8py55Yxic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xgio8Z0s; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xgio8Z0s"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c597760323so358136385a.3;
        Tue, 27 May 2025 13:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748379133; x=1748983933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LKaeKldw1Ck2sQZVVbHbkbW9fD7EOZAjJqusQZCOfK4=;
        b=Xgio8Z0sAC+F6+k71ICwupOqh5okMW34KQfHd7ZG9cZZ4ATUdcybebel9VChciJjcB
         0ggOyVGPzVZzF1ltwjN7Wwxs/ouOe5NahEoOFTmWl48eqEIrBBD0AudwriE3BQgSYhpx
         q7iR0O+ZV8pRLjYwaKVxfEAgP79AOuNZRRFToP3nDLnitsach0onnnHu9tJEyYW4Vwym
         R6LhpESX4euEmtILbqoE4caXPiVETa/uiCeoxaqqm28F6A+95RKCx8o6OBP0xFRva3jO
         Ii2K9dbsYDQD5OjToNBcpABmNnJStk4Ttg2u/uufqsdVWq7zV/i9BYIaVSlsk1+njFhi
         6QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379133; x=1748983933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKaeKldw1Ck2sQZVVbHbkbW9fD7EOZAjJqusQZCOfK4=;
        b=DaQsA1+4+A4JUqOpNevSK/jhMsiDFja0zpJ/duKx1ng2YrjEGiDW5v/iYEVh6UJyva
         ePXF2fvmIxYM1J39ZnkUtj2Hmf8OvpZyE5BpLOo7U4IiqS/IygzqENDo3yxXEPxTIyx0
         sL10dWkmySEPf7NdhQNtKNT7hFX5TMRvMzfUUPxzx7OfKW2ajmQcejMKDRlJ3kQn0P8v
         J+/D1kNVurF4QxNGztu4PsxI8/CGFGae2g8Ge8zAJY3ykE3/aqESspgSdokjyR93IQjg
         07uNbGunYunGfT97eV8MrgSX5Wrby2qgVDeNt4sDtFxMvHcFmdMN6HGgtwlS8S8YewGe
         e5Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUfRcMapPwhcnjMbDCvYtN2CNe7QAYbPfsmk2GORDdQIHel9Q7mNfH+FShQ4dBwZQ1TqRgjUNBS/9gGLLJ5Xzw=@vger.kernel.org, AJvYcCVtQm5EUUkymzZOVT+dCLW22+iDO/RNCDykIhTNixwtu6RQiE/zN6u+5DV9edrjQcrU+bonUtoBRPhtKjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXxa94W2VhN8vQBrxppzP5nluywRm8KmW09f5U+vo3Xb1U4GF0
	xEg9oQsRI/Tu03sDzR+E2fdbT2HZ+/oWXHRCy6m8d8u7YmAgRQpvFuK5
X-Gm-Gg: ASbGncvVAB7nry2v6Uop6+Tcbpsg3qoMzBv0xHvV3ME3nJKQFYURMBOdVoRRuUEpbge
	ImqYVCI/no+J8votuMg/LSod/BFRjV06JJszk57HXGCazqMcWWPI5PAUAh3ap2gafZoCJMnFjQl
	IpJjagBaFFEBxL/ORhjX0QaQJVdNOFuNHjX3EnhVJTdJf29niKeB6HfN6cfgTopU36hlq/KE/D+
	AUapVOgx6C6UVZxPSyYccKcuiye/4mi5K5M3RUVGVhwfhuk2qUPOzO7kFXAde7UYo9l6WVw2FDR
	cpXcBxPOQWd2ZnzqVUy90zFoo/jhWAmtNQfBegx7+i6S/3VSeFKZkDrs9Xkm3Q==
X-Google-Smtp-Source: AGHT+IFZ1sRYmlR6BfN6LmxOk0C/pi199cbv60eWY5qfBWmLGtScRn+2PpYVAP+BaHApXJZOI9VX6w==
X-Received: by 2002:a05:622a:5905:b0:48c:3fc2:e055 with SMTP id d75a77b69052e-49f4625c7a7mr255056601cf.2.1748379132708;
        Tue, 27 May 2025 13:52:12 -0700 (PDT)
Received: from localhost.localdomain ([2607:fea8:54de:2200::dd7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a2f927db8bsm1012551cf.18.2025.05.27.13.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 13:52:12 -0700 (PDT)
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: ojeda@kernel.org
Cc: alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Albin Babu Varghese <albinbabuvarghese20@gmail.com>
Subject: [PATCH v2] rust/list: replace unwrap() with ? in doctest examples
Date: Tue, 27 May 2025 16:49:28 -0400
Message-ID: <20250527204928.5117-1-albinbabuvarghese20@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using `unwrap()` in kernel doctests can cause panics on error and may
give newcomers the mistaken impression that panicking is acceptable
in kernel code.

Replace all `.unwrap()` calls in `kernel::list`
examples with `.ok_or(EINVAL)?` so that errors are properly propagated.

Closes: https://github.com/Rust-for-Linux/linux/issues/1164
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1164
Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
---
Changes in v2:
- Fixed patch formatting issues
- Link to v1: https://lore.kernel.org/rust-for-linux/20250525225925.14797-1-albinbabuvarghese20@gmail.com/ 
---
 rust/kernel/list.rs | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index c391c30b80f8..fe58a3920e70 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -82,9 +82,9 @@
 /// // [15, 10, 30]
 /// {
 ///     let mut iter = list.iter();
-///     assert_eq!(iter.next().unwrap().value, 15);
-///     assert_eq!(iter.next().unwrap().value, 10);
-///     assert_eq!(iter.next().unwrap().value, 30);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 15);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 10);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 30);
 ///     assert!(iter.next().is_none());
 ///
 ///     // Verify the length of the list.
@@ -93,9 +93,9 @@
 ///
 /// // Pop the items from the list using `pop_back()` and verify the content.
 /// {
-///     assert_eq!(list.pop_back().unwrap().value, 30);
-///     assert_eq!(list.pop_back().unwrap().value, 10);
-///     assert_eq!(list.pop_back().unwrap().value, 15);
+///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value, 30);
+///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value, 10);
+///     assert_eq!(list.pop_back().ok_or(EINVAL)?.value, 15);
 /// }
 ///
 /// // Insert 3 elements using `push_front()`.
@@ -107,9 +107,9 @@
 /// // [30, 10, 15]
 /// {
 ///     let mut iter = list.iter();
-///     assert_eq!(iter.next().unwrap().value, 30);
-///     assert_eq!(iter.next().unwrap().value, 10);
-///     assert_eq!(iter.next().unwrap().value, 15);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 30);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 10);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 15);
 ///     assert!(iter.next().is_none());
 ///
 ///     // Verify the length of the list.
@@ -118,8 +118,8 @@
 ///
 /// // Pop the items from the list using `pop_front()` and verify the content.
 /// {
-///     assert_eq!(list.pop_front().unwrap().value, 30);
-///     assert_eq!(list.pop_front().unwrap().value, 10);
+///     assert_eq!(list.pop_front().ok_or(EINVAL)?.value, 30);
+///     assert_eq!(list.pop_front().ok_or(EINVAL)?.value, 10);
 /// }
 ///
 /// // Push `list2` to `list` through `push_all_back()`.
@@ -135,9 +135,9 @@
 ///     // list: [15, 25, 35]
 ///     // list2: []
 ///     let mut iter = list.iter();
-///     assert_eq!(iter.next().unwrap().value, 15);
-///     assert_eq!(iter.next().unwrap().value, 25);
-///     assert_eq!(iter.next().unwrap().value, 35);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 15);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 25);
+///     assert_eq!(iter.next().ok_or(EINVAL)?.value, 35);
 ///     assert!(iter.next().is_none());
 ///     assert!(list2.is_empty());
 /// }
@@ -809,11 +809,11 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
 /// merge_sorted(&mut list, list2);
 ///
 /// let mut items = list.into_iter();
-/// assert_eq!(items.next().unwrap().value, 10);
-/// assert_eq!(items.next().unwrap().value, 11);
-/// assert_eq!(items.next().unwrap().value, 12);
-/// assert_eq!(items.next().unwrap().value, 13);
-/// assert_eq!(items.next().unwrap().value, 14);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 10);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 11);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 12);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 13);
+/// assert_eq!(items.next().ok_or(EINVAL)?.value, 14);
 /// assert!(items.next().is_none());
 /// # Result::<(), Error>::Ok(())
 /// ```
--- 
Thanks,
Albin
