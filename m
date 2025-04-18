Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EEE1DF271
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940538; cv=none; b=n7DOxzYosLK/bkq0QN2F65SWgsy3WDnDkZVZTHW6Pi73HDb5p2xTUDcI6VoZNE4+kb6JScVMBeDgC3Fxn8Qv5H1xcF9HiVSJLgzitV3QiWk8NDLQMnY9RrS4HlPj/d9Irbg8VwewgY2/k2xpCZT09/GWBB7IuyZXKW/bbs1n0YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940538; c=relaxed/simple;
	bh=AsXerO6M3JJeGimaY8r23ZEYRge1XS9d6tD5VYo6WLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TrnbsjCx/P/jwEyik3GGLe6hDBGA+c1TisT+Ub7dXKd6RAVi0PHOjLoEjTWBSk6waWc3UbHpzl1z+r3IPiQ9dJtBxnLynB9BH12IOUlxOuWl2ALSGjWNAhXuv74SzyjtxCIcj3GA6wcT/fnIQdltG+bqsBRBbzCfrG/XbQNsvVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=tZHOk7Pz; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="tZHOk7Pz"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-703cd93820fso13599677b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940535; x=1745545335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KVr9YoaGaQgWb5xariEP7OGZvSaNc2U9G9atBahdE8=;
        b=tZHOk7PzZ5hFQbMPVsYyOaQUAZ3JAJ1orsikVgKRG9OEAyR4jScQ7Yr4ElW5hRnL21
         OmFOuol0VAqCdbX+Jh/8qGV1MR8S4q+xt5Bb46XcVYPolCbXYZEoXPr3vcyJzXci5ZKt
         XaYILBnoIimuWv1t21Cql7K6U6bLLLYpePG6ZIGqIPqaAE7KdCmTUs0aNWhyR+hGBD+h
         ibiSxKauIUoACs7eJ2BAOTUm+wvSY2mfS/pElIV6o2q7HOFO7QlrBy99M+4U4YvZODG9
         bhn/m5/jbQ+CPBlhcKGIg4lFz2j4Oz3ITZujljPXixUGDSnnZJ/d8tvBySuCI5rPzrhM
         3/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940535; x=1745545335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KVr9YoaGaQgWb5xariEP7OGZvSaNc2U9G9atBahdE8=;
        b=i07+TJyqNa9NO3c4iVWOe05sEUX0Xm3IUr+LcpjRufFAq2i2rHytVE3L5Cpg8VcCoZ
         5T2UPyDDo+2Qh4XlkcJHJo9Y4x3/ALCUZi8mrqHN5eNikzk4yWWuzwllCph4WreccMJ2
         pPDXaGWgCgrVQM71PmlyrfwKew8uLi2ydoIiY7qpCTsMjFRlAIxCBw5d7jVMricFzAgT
         Fq0WIGeos7Zr1MW9BlaP4MGqNBe69W41SF3peTtZHKemZHMkQ4L4pdMtV2Igd3JMPIMi
         /5LGMwRR5Ab2UMAd9uCReU7Ip6G6XQusb1OZpEBfUaTQaxiaW7PKvhfeFYYRHY4j7UrG
         3Npw==
X-Forwarded-Encrypted: i=1; AJvYcCXJhg5UIZVou9bYJedBPecUY57oqFU5L1loCuGhtHJcX1fZIoTbhKQ8tcpvAnloXbe6JgJ6Lyd/dKDWLKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBTGNxana0IpeQjFBo3MgUBRBV9uPGzZi4ybU4VJDwuD8AywWh
	MCwWHU4RxUbZJPz9mhWD+XBVGmyg+Fw6OT2UE53vNKWohId4nB7VS0oKxK44pKY=
X-Gm-Gg: ASbGncu+qrlcvDBBtSFr0IKyVtEYYHLquuvJFb3RCtkcD1BRaJFsdKvmXu4JovxurRI
	ub7VRnE3vYhAfOH4axmZZImpg1c2OWJ5yqVaDUeDuXz/QJu18Wp41bsumSKQta9wPkrODJylk6o
	0O91JspnPk8mAOZ+B0pfSBQQyehA2IIt2cNqnkvCkJ+DDvGR4KLOxRS4XOO4zm9GV7K96bo3K7s
	loDSOrvjpLhq/EDTBKzKJRoMvU1F6929O4U8GjdFpQE6RrSdjjOszZsDCZEgDxHD0o0XNcgViT5
	cwAGnbrve5ZuKFaQy3nvDKJGQC4R1YFB5DAsGsJDocxtNZar8+cQrfNgQILJJB7Yv+pko+IGpmc
	TLpsBf5J8FpD6F5H2guhFsg9h9K6lt7k2ZO5i
X-Google-Smtp-Source: AGHT+IE/O6gWkQMozzU/sZ0vQ7iAMIJZ80Gw3gnlvoeuFzX09jFzx3stefvWq4XPYCQQb119QbF5Vg==
X-Received: by 2002:a05:690c:670b:b0:6fb:9c08:4980 with SMTP id 00721157ae682-706cce0e007mr15660347b3.27.1744940535286;
        Thu, 17 Apr 2025 18:42:15 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:14 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/18] rust: kunit: refactor to use `&raw [const|mut]`
Date: Thu, 17 Apr 2025 21:41:26 -0400
Message-ID: <20250418014143.888022-6-contact@antoniohickey.com>
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
 rust/kernel/kunit.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/kunit.rs b/rust/kernel/kunit.rs
index 1604fb6a5b1b..9f8165b15a37 100644
--- a/rust/kernel/kunit.rs
+++ b/rust/kernel/kunit.rs
@@ -130,9 +130,9 @@ unsafe impl Sync for UnaryAssert {}
             unsafe {
                 $crate::bindings::__kunit_do_failed_assertion(
                     kunit_test,
-                    core::ptr::addr_of!(LOCATION.0),
+                    &raw const LOCATION.0,
                     $crate::bindings::kunit_assert_type_KUNIT_ASSERTION,
-                    core::ptr::addr_of!(ASSERTION.0.assert),
+                    &raw const ASSERTION.0.assert,
                     Some($crate::bindings::kunit_unary_assert_format),
                     core::ptr::null(),
                 );
@@ -261,7 +261,7 @@ macro_rules! kunit_unsafe_test_suite {
                     // (as documented) must be valid for the lifetime of
                     // the suite (i.e., static).
                     test_cases: unsafe {
-                        ::core::ptr::addr_of_mut!($test_cases)
+                        (&raw mut $test_cases)
                             .cast::<::kernel::bindings::kunit_case>()
                     },
                     suite_init: None,
@@ -283,7 +283,7 @@ macro_rules! kunit_unsafe_test_suite {
             #[cfg_attr(not(target_os = "macos"), link_section = ".kunit_test_suites")]
             static mut KUNIT_TEST_SUITE_ENTRY: *const ::kernel::bindings::kunit_suite =
                 // SAFETY: `KUNIT_TEST_SUITE` is static.
-                unsafe { ::core::ptr::addr_of_mut!(KUNIT_TEST_SUITE) };
+                unsafe { &raw mut KUNIT_TEST_SUITE };
         };
     };
 }
-- 
2.48.1

