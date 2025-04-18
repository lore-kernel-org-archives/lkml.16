Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D871E1E13
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940558; cv=none; b=GXiWzUFIi7SKAi3NwKO2q3xazfCqMoJCB8bV3JoOqmjWCVc8Ib/Czmm934/ZH0GsHKf/I1w95TQGyfyBr+y9jJjHI0JxgLMmAJo/9CEK3Gqdz5ZE6KAi4RD1Wc7+oLEoJPt5oUp6Ci9EsIr4IKOCVDIKXyjrB9WuNsaYSB4AIcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940558; c=relaxed/simple;
	bh=LFMQ+L94zjYiQUw6a1CKQk3d4BxJvPyZVxXJ/gsuLJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmLheZigd3StPmSjIhcJi9QHD1WkZrNKF+1JkppOZQ2zAVoTu6461cTJuYj3HMwUDysYK4gqXgdvw/aoDEEvOuGXuUpQqbXQu8znQipjPm90vohGfJTsJLVzu0YH0G+5ftiCkzy7dqtN4PLy5xzp/ETt55npLvWSVGmW13qLR/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=yoUtw0aZ; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="yoUtw0aZ"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f6ca9a3425so16009607b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940556; x=1745545356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AI1pnhwmE+8xokIyOzrC/UhLGaF117Y++3PU7pcVmz4=;
        b=yoUtw0aZQGEeg6U++Ax2CrViqTr8jZpgAYzput8aUMEJfbj36UI4pvXkJabtDfCFmG
         CQSX5Nrf4Wktq4W/2IQz0x7JfJRvl923tBulRpnviphcLCXfv9JQB72MyVi4n0kwq4q7
         SfqKWIsl8aqwo3R6MVR+MtJWDNxoojpaQwPHufBY8LZlivKv/+c3GjJK1g0aZn7zppJU
         e9hms0W7uKC6ZzDvtNYFK5YBG2sDJ9XYEZ3QAs364k/X7bd6LK/cs91RS/75/HEPv0Jv
         I9wcfa/vhBfDb/yf3qauHB3SjHApIusEapdkK6Yid6WeYcTgIGoP04CFfdqisC2YH3Vb
         HjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940556; x=1745545356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AI1pnhwmE+8xokIyOzrC/UhLGaF117Y++3PU7pcVmz4=;
        b=XkV0USTqAlXzMEZmtiuFvWtHMa5qlR8RDgtbk/amq0dI4HXIvNiAOKlOh/SFPyAFE6
         evCpjztF7Zs6CxWb26QvW9Tv3ziOdjBXlfs0EBzTehSSFbqoLsU1KeUPF2nSjEWD+CBa
         dpoUiKiKTz16eLXYdGQ3/cD+ZEQhm4f3qwkGHtHrBXWGuLxA0ahYFoOdPJmD/H4jWj1O
         +gFbkMjExzD60O9DVRSqQo00eGZ2AWW6XOP6XIXROCXW8sWDuEc6MmtWvIknf3o7Biz8
         R/qyiVeTbBbq9kPMtXFaeqsWkDhMWmmuzXRUw/4dBN8jGNmBu/QVynrf5hFupqlDKvwX
         fPvA==
X-Forwarded-Encrypted: i=1; AJvYcCWaiC4txBqF8/prmIUtfutWGSIxXv16Mqblk6MF2/w+B2JtAkWH+WOs4T/3MOIMcoQjv2g74whyWC2pzZw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeIMpbn8G4x0/gf5uc8JnsUJQyDSl8sVpxDAznqXs3Zr2bNK6w
	lWDprY9nql8u6UIPJMOUz4uF9CrztOjnVP+nvUBPiEuDtvfWKFwQHExBK51QDCM=
X-Gm-Gg: ASbGncvzHWJL/WNbCuDuAVejJE5jMTX7Q3fQslq2iBrlymAQB7T+l/391yZORb08k7w
	GQSbglo64vFMqadsuZHfnNMnZUmXOzRaoP9z65qDeJd4WO1ev1a8JElCFOlZJAeTJQm6UhjbCcu
	Qpu6muPvav0T+OKRVk4BrVOuYYxbDtThnOde7nQaobcoohLHtMw/ywc4UvMPD0HAU7W0NBY6AmR
	dICWSKP9MhEtOMm7eWT4rgB/AFsELcIzD1qVsTJ/NDZzd6G5PJf3bm1I6e8HJeCGdNU/UJPj/8O
	wN2ZWlXREbZSibCzQP25YpZgRAuwLFXkGqNpIYZarybzOuPQX0waI9IIF8A1s7Ib1mY4gjZDD4n
	OT0Rkz2OJKgm1JKHUgOkdgaWEbSBT4e/+Q6ob
X-Google-Smtp-Source: AGHT+IE5l+Ui/cDtgXp8hu7x1ECrYQ0A04JvbNLyVuB84n6vD9fpD7okMJpooYtF+P7zid0UiyG09Q==
X-Received: by 2002:a05:690c:480c:b0:6ef:94db:b208 with SMTP id 00721157ae682-706ccde3c6cmr14428537b3.24.1744940556102;
        Thu, 17 Apr 2025 18:42:36 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:35 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Lyude Paul <lyude@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 13/18] rust: time: hrtimer: refactor to use `&raw const`
Date: Thu, 17 Apr 2025 21:41:34 -0400
Message-ID: <20250418014143.888022-14-contact@antoniohickey.com>
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

Replacing all occurrences of `addr_of!(place)` with
`&raw const place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const` is similar to `&` making
it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/time/hrtimer.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index ce53f8579d18..d91d2a655baf 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -132,7 +132,7 @@ unsafe fn raw_get(this: *const Self) -> *mut bindings::hrtimer {
         // SAFETY: The field projection to `timer` does not go out of bounds,
         // because the caller of this function promises that `this` points to an
         // allocation of at least the size of `Self`.
-        unsafe { Opaque::raw_get(core::ptr::addr_of!((*this).timer)) }
+        unsafe { Opaque::raw_get(&raw const (*this).timer) }
     }
 
     /// Cancel an initialized and potentially running timer.
@@ -494,7 +494,7 @@ unsafe fn raw_get_timer(
                 this: *const Self,
             ) -> *const $crate::time::hrtimer::HrTimer<$timer_type> {
                 // SAFETY: The caller promises that the pointer is not dangling.
-                unsafe { ::core::ptr::addr_of!((*this).$field) }
+                unsafe { &raw const (*this).$field }
             }
 
             #[inline]
-- 
2.48.1

