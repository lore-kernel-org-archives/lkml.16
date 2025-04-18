Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA6A1E832D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940542; cv=none; b=UgRwROsVVoaiB6RqbkFuKffhRUcmgbi/UM6cYeIKQcvWwNvjrPVyRG0txt/AGqFY0LSYTlURSW5xA5xvbTe1CnarCHHBSwFnHZy0MWRWASzU0YC+skD8lnnObme+Q6OJWyWWHnipk8+4eSYrJtVxonXVJ2DKVL9y77P7fhQat+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940542; c=relaxed/simple;
	bh=cRxn5nlMFzHkKXcDkJd0zJyisFZEajZpHXhTkCsE0rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leFgS3Ju+PvQg5SU4G9ijcyScXXONL4c+9IGnIlNvCAbfwteypWHUt5MF9XZNUo2ZXk7OWsxpfPM/kQmwgxPWi3D6ITpvmG1lKNRsUNSMZ3EO0C77pgC4duDKWM/FMfkQE7ObTDdx6uFcbPnz0X1bVpqah1p9HZxENlUY0fjiNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=nhM2J2bA; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="nhM2J2bA"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6feb229b716so13781947b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940540; x=1745545340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry3u1M0EzAmd70j1/Rem5lasv9JVJ9m5YCoAnIZljm8=;
        b=nhM2J2bA7OKDcTKjkfAB7hGccfY/JzallIBztTgHVggUuShq01aQlNKmOal8AkLzSo
         4nqHPJtGq58ejsKt7gqk81IpAxY4e8R82f+MMOVhjcQWrH3lGfJcDD1EyYf+ZdMZS4A4
         Zz6THuAmjOrygWpjv2TDVtyQBQsqbVMaBD5KkgGsWe/ydiS9ICkWwiHhHefde1wgfTYL
         YA4gr0EZ2Lfp5uFVLDWYNhsn/D6n8PQoMZhY1gA8M+3objzshu0w9tqsJO5FnGAOv911
         IAv6lwrEL4zUSYb6/msZ8QgHYd4vCooR/LmVCVcXJVdW2Yk12UGT6eiRF0Sv6grFB9iE
         SZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940540; x=1745545340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ry3u1M0EzAmd70j1/Rem5lasv9JVJ9m5YCoAnIZljm8=;
        b=IOld2mRJRKoswQpSK3QPCZnz0BSBxBR868lhavZwFR4Xgv/e6+szORaHc/gWiDqkZl
         g48y5fSVZJzBX1lLGLxe5UbHSBkz2F6y5nb17b4bojEzf+sXw5KNwUIzxgSyph5ULAzm
         5UwfdkIpt8jpp31L3jsAgPZevaFUoeD6QLRsfh6d0eEc+n5l8LNvhYPcAXQHw5pgGgfn
         XxyGwo0910B81GFOKni1RyjsQRTjvt8Nws88V4hTkcVdpETctvJWlUjK4GfitDL60wfp
         Gaon0J8PLK8JO+iD8DDrlBL5MPdT9NHVM4umKvGw/Rx22ERwj9XeskprMfnx73Fh40H/
         Ay/g==
X-Forwarded-Encrypted: i=1; AJvYcCUrhBhMQVZD6WgwBz1tTGJ4xuCsQiJWtSElIzz3eHrIoYdm9fLN/AbJpZO6Kc/ht73UKcRgYT+7tnIo3A8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM46xFPNPF0N9LosL4BF5CJWeJUcDjf4ln5qtRI1oQwI4vHjrP
	lZS102EjyJNcJ+R5XWE9sA0rhZHSj+kDyq/FwFv4ueTj3IkTkTxOzoRv4g+xzG0=
X-Gm-Gg: ASbGncvXJwDtkmkucWOeZ3Y8KOqFEVGNfUW2I3gODOt0gMz/JvjLJelevGPw7MeEUDc
	Cj28450jc+SUhpVeJE+NY5bAZhKADzzuvGS3m2lXwFZ0Mtx9iI7PyqXAj9f59ze9F2mUtukjQ84
	YwBPQbr+Tw3y3m4r+kFJdwfsmipk/eUN8ZpznR9RMeK21YF4NtidUdc45vvkvY/pGPgxplcaRWp
	rktobo3wy9DSawRr+sw/tMNd7YUBaAMEOjUX//z1Dp5gZXL5LraXjarXGl6oOdUwKNzaU7fAXtJ
	oZzlqetLlGJ37vLXO2REP/hx3xs7Cq4yclYIeEB+AsF2CZYPrnO5H5Wk67X/o9z9cckBIiGTb5p
	1K24O4DwQfCoSJjjJQMnTaWxdaAPn2MB/ELTOrQ8+RhWWsaE=
X-Google-Smtp-Source: AGHT+IFrciPglYLYetltVBIt5I65E2xFh+XR+HtHWRbv1ZpAq0Bi5q1Yqh4U6lAfus6mr6hW3ATOcg==
X-Received: by 2002:a05:690c:670b:b0:705:a95f:edaf with SMTP id 00721157ae682-706cce10357mr12594357b3.26.1744940539858;
        Thu, 17 Apr 2025 18:42:19 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:19 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/18] rust: workqueue: refactor to use `&raw [const|mut]`
Date: Thu, 17 Apr 2025 21:41:27 -0400
Message-ID: <20250418014143.888022-7-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/workqueue.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index f98bd02b838f..3a8e05ac6bd5 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -401,9 +401,10 @@ pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit
     pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
         // SAFETY: The caller promises that the pointer is aligned and not dangling.
         //
-        // A pointer cast would also be ok due to `#[repr(transparent)]`. We use `addr_of!` so that
-        // the compiler does not complain that the `work` field is unused.
-        unsafe { Opaque::raw_get(core::ptr::addr_of!((*ptr).work)) }
+        // A pointer cast would also be ok due to `#[repr(transparent)]`. We use
+        // `&raw const (*ptr).work` so that the compiler does not complain that the
+        // `work` field is unused.
+        unsafe { Opaque::raw_get(&raw const (*ptr).work) }
     }
 }
 
@@ -510,7 +511,7 @@ macro_rules! impl_has_work {
             unsafe fn raw_get_work(ptr: *mut Self) -> *mut $crate::workqueue::Work<$work_type $(, $id)?> {
                 // SAFETY: The caller promises that the pointer is not dangling.
                 unsafe {
-                    ::core::ptr::addr_of_mut!((*ptr).$field)
+                    &raw mut (*ptr).$field
                 }
             }
         }
-- 
2.48.1

