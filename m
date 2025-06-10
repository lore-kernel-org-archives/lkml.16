Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A46323ABAA;
	Tue, 10 Jun 2025 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749562125; cv=none; b=NJ+alBCui79n1T/x7o7SJK314YUBG4X111Tsub3Xq4sBx61/Y/fpm+Akx8R2ZxTydugIKUnsIkgiA1cfoL7hv4j0jYO3jn5K/HQdqAd9IMhNU3FAM6WuuAGHjRxsEz7fwIBf1QAP9QNwEhslPzT3oqbgg+ckhqyP5hDkt6fTxR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749562125; c=relaxed/simple;
	bh=NRoPuLsRJOm5rC5ZB155G6bpOMGKHlkV77L8xCoa4OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=De2Qv4xgoNFzYLkUHCnChQFXYKKtOefUui5wgbB/OYjGv/EWONbDk7GzRXVSBCgpmjQCufVSiUoAmXOZGDcBlcwZLRDpJUbdQXHUmv6uI3VZIGLjd2T1E6HnB4matcf3svvYXE1QQfywz27wB6+4SuX4m0izCQ11elipGUa+glA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HYLVuPZr; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HYLVuPZr"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so3636365a12.2;
        Tue, 10 Jun 2025 06:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749562122; x=1750166922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mvvzlMbDdYmXYPtcaFob3b+rqUp5cEbqhNbwJWVQeI=;
        b=HYLVuPZrmQPGHKmGKhFoHGLhufytZoDTd//edxU+7OJgkHsZkBJO+/WGke32uf4Ydh
         zLWOAUSr4Yj7FFsPFoP6ESlmPHf/eE+/Jgk2TSpchMFFVXZ/k2v0Pii9/G0KolxdfXIg
         Sl7p0qUxgbQs/t9Th8YjLw17gmDKKWu1gkdi8QPNuj22NTGXd+xXi+9pzFbLUL45Ml6D
         VwIvWpNjEsPR8qITEpcvZtC4or5h8efb5Z91ins/dZcrLwGhm/NL6g4TVZuCZaRqmHXN
         9T4CGsbq5pz2vKEu3GcdfoNbgFprE8ZAZDaScgJ5597gz/7zKHwvLFigGE8dkWupLHE4
         4rBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749562122; x=1750166922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mvvzlMbDdYmXYPtcaFob3b+rqUp5cEbqhNbwJWVQeI=;
        b=hp4a1lMMXlqqlTPdSZGKvmq9iJnp0zUUUvBp1VAq+RWTJmVJp09pbAF1SwEMEN74vR
         HG/VM2sioiNDrdLLuIZ5shA+50LCwDvf4qx8rwWcphf003UoOXwagQBbPtokipml8Fyg
         621wDz1F1Fojjy8/7lS/NzRgPU79sfbUJZaL9mERU/N0ZoB8jO+hMtNk3IF7YeZGext3
         9J8kF0NjGxCxQ535DqSVDslumWmt7xqoMVnivpdG6rggPEvf5jTVdDmr1FX1E6s5eZrC
         Xk3nsW2s8F8N9wnRC4fupClbcOQFwjV3ltj+YQKYDc0PXD8zrNtG1QY35RPtV3uW7mfv
         zG/w==
X-Forwarded-Encrypted: i=1; AJvYcCUzX5OMapcW6KJtTcg3ZOVn7qm75epkiMKpGdhvzYNxZPnPx49sT5c8C9UDOdmsnV2Z2w30c6PhWVSkBVjLuRg=@vger.kernel.org, AJvYcCXMuv4Cb0gTcbniq1vtRZ1sg0+mC0RtXYwFXm8daKZPQ12Y8neA/jpWCooBdYh19hKZynA0xbdSuqQF6YY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPHGmyLzEAl+ewD7oG1ogDgjUavVbqZPjZQ2KcC6Bel1JEAZ8n
	R1zD3//+GGu9cmbcmX42r+oZicZANawusEy6Qi4TT5BsmnB5D9bN2+pP
X-Gm-Gg: ASbGnctA4UY/KvkIHkO2j2HuHYFn0obNyZBdeoRluv4MBALyOMLz5FAYzt7IXf3CRyS
	fLoxRWnJ2WB4UjT5UYqUL5RWwZQL3LfoVDISqjx8kvjTDhIzmh3PLf7RcQlFUE22Qh10ZclPlsP
	H3uz1F2UE8EbuJomU+7xnPK9JMFRu5g4eg22KjDzZD5frXYO9lRChwtYnuGmiSu3YjTWN6XHH/e
	55VXnPkK03LryaYXrEF2gq0IXfGuqwwt/Ilk0WFHYuBZyqSSHwgRORGdfMVjzP5Z3qboQNAVrk6
	gzmy7Oj3+ojIUXQYI5sCJsVuU3Z0e9np9+RB/FZ2Hh9Jb+hof3gRQsETLGjDa61NyoAhxGjxZP+
	A1E19YtAerHB9UyB/YAJyC7GHesCPbMSbaZ7zKoCOxBohGg==
X-Google-Smtp-Source: AGHT+IFUfcGHUGTZuh8PBG3hJykgcW5tGM6RfatDYfdHDl9OEZ/cbEfIi2zoXQjK/bGAVEtGOGHpjQ==
X-Received: by 2002:a17:90b:52c6:b0:311:b5ac:6f5d with SMTP id 98e67ed59e1d1-3134769e684mr24557616a91.29.1749562122490;
        Tue, 10 Jun 2025 06:28:42 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3134b128050sm7969276a91.25.2025.06.10.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:28:42 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v3 2/5] rust: time: Replace HrTimerMode enum with trait-based mode types
Date: Tue, 10 Jun 2025 22:28:20 +0900
Message-ID: <20250610132823.3457263-3-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the `HrTimerMode` enum with a trait-based approach that uses
zero-sized types to represent each mode of operation. Each mode now
implements the `HrTimerMode` trait.

This refactoring is a preparation for replacing raw `Ktime` in HrTimer
with the `Instant` and `Delta` types, and for making `HrTimer` generic
over a `ClockSource`.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time/hrtimer.rs | 164 ++++++++++++++++++++----------------
 1 file changed, 90 insertions(+), 74 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 280128d7e982..23f9f1ba8607 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -98,7 +98,7 @@ pub fn to_ns(self) -> i64 {
 pub struct HrTimer<T> {
     #[pin]
     timer: Opaque<bindings::hrtimer>,
-    mode: HrTimerMode,
+    mode: bindings::hrtimer_mode,
     _t: PhantomData<T>,
 }
 
@@ -112,7 +112,7 @@ unsafe impl<T> Sync for HrTimer<T> {}
 
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
-    pub fn new<U: ClockSource>(mode: HrTimerMode) -> impl PinInit<Self>
+    pub fn new<U: ClockSource, M: HrTimerMode>() -> impl PinInit<Self>
     where
         T: HrTimerCallback,
     {
@@ -127,11 +127,11 @@ pub fn new<U: ClockSource>(mode: HrTimerMode) -> impl PinInit<Self>
                         place,
                         Some(T::Pointer::run),
                         U::ID,
-                        mode.into_c(),
+                        M::C_MODE,
                     );
                 }
             }),
-            mode: mode,
+            mode: M::C_MODE,
             _t: PhantomData,
         })
     }
@@ -389,7 +389,7 @@ unsafe fn start(this: *const Self, expires: Ktime) {
                 Self::c_timer_ptr(this).cast_mut(),
                 expires.to_ns(),
                 0,
-                (*Self::raw_get_timer(this)).mode.into_c(),
+                (*Self::raw_get_timer(this)).mode,
             );
         }
     }
@@ -412,77 +412,93 @@ fn into_c(self) -> bindings::hrtimer_restart {
 }
 
 /// Operational mode of [`HrTimer`].
-// NOTE: Some of these have the same encoding on the C side, so we keep
-// `repr(Rust)` and convert elsewhere.
-#[derive(Clone, Copy, PartialEq, Eq, Debug)]
-pub enum HrTimerMode {
-    /// Timer expires at the given expiration time.
-    Absolute,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    Relative,
-    /// Timer does not move between CPU cores.
-    Pinned,
-    /// Timer handler is executed in soft irq context.
-    Soft,
-    /// Timer handler is executed in hard irq context.
-    Hard,
-    /// Timer expires at the given expiration time.
-    /// Timer does not move between CPU cores.
-    AbsolutePinned,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer does not move between CPU cores.
-    RelativePinned,
-    /// Timer expires at the given expiration time.
-    /// Timer handler is executed in soft irq context.
-    AbsoluteSoft,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer handler is executed in soft irq context.
-    RelativeSoft,
-    /// Timer expires at the given expiration time.
-    /// Timer does not move between CPU cores.
-    /// Timer handler is executed in soft irq context.
-    AbsolutePinnedSoft,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer does not move between CPU cores.
-    /// Timer handler is executed in soft irq context.
-    RelativePinnedSoft,
-    /// Timer expires at the given expiration time.
-    /// Timer handler is executed in hard irq context.
-    AbsoluteHard,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer handler is executed in hard irq context.
-    RelativeHard,
-    /// Timer expires at the given expiration time.
-    /// Timer does not move between CPU cores.
-    /// Timer handler is executed in hard irq context.
-    AbsolutePinnedHard,
-    /// Timer expires after the given expiration time interpreted as a duration from now.
-    /// Timer does not move between CPU cores.
-    /// Timer handler is executed in hard irq context.
-    RelativePinnedHard,
+pub trait HrTimerMode {
+    /// The C representation of hrtimer mode.
+    const C_MODE: bindings::hrtimer_mode;
 }
 
-impl HrTimerMode {
-    fn into_c(self) -> bindings::hrtimer_mode {
-        use bindings::*;
-        match self {
-            HrTimerMode::Absolute => hrtimer_mode_HRTIMER_MODE_ABS,
-            HrTimerMode::Relative => hrtimer_mode_HRTIMER_MODE_REL,
-            HrTimerMode::Pinned => hrtimer_mode_HRTIMER_MODE_PINNED,
-            HrTimerMode::Soft => hrtimer_mode_HRTIMER_MODE_SOFT,
-            HrTimerMode::Hard => hrtimer_mode_HRTIMER_MODE_HARD,
-            HrTimerMode::AbsolutePinned => hrtimer_mode_HRTIMER_MODE_ABS_PINNED,
-            HrTimerMode::RelativePinned => hrtimer_mode_HRTIMER_MODE_REL_PINNED,
-            HrTimerMode::AbsoluteSoft => hrtimer_mode_HRTIMER_MODE_ABS_SOFT,
-            HrTimerMode::RelativeSoft => hrtimer_mode_HRTIMER_MODE_REL_SOFT,
-            HrTimerMode::AbsolutePinnedSoft => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT,
-            HrTimerMode::RelativePinnedSoft => hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT,
-            HrTimerMode::AbsoluteHard => hrtimer_mode_HRTIMER_MODE_ABS_HARD,
-            HrTimerMode::RelativeHard => hrtimer_mode_HRTIMER_MODE_REL_HARD,
-            HrTimerMode::AbsolutePinnedHard => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD,
-            HrTimerMode::RelativePinnedHard => hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD,
-        }
-    }
+/// Timer that expires at a fixed point in time.
+pub struct AbsoluteMode;
+
+impl HrTimerMode for AbsoluteMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS;
+}
+
+/// Timer that expires after a delay from now.
+pub struct RelativeMode;
+
+impl HrTimerMode for RelativeMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL;
+}
+
+/// Timer with absolute expiration time, pinned to its current CPU.
+pub struct AbsolutePinnedMode;
+
+impl HrTimerMode for AbsolutePinnedMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED;
+}
+
+/// Timer with relative expiration time, pinned to its current CPU.
+pub struct RelativePinnedMode;
+
+impl HrTimerMode for RelativePinnedMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED;
+}
+
+/// Timer with absolute expiration, handled in soft irq context.
+pub struct AbsoluteSoftMode;
+
+impl HrTimerMode for AbsoluteSoftMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_SOFT;
+}
+
+/// Timer with relative expiration, handled in soft irq context.
+pub struct RelativeSoftMode;
+
+impl HrTimerMode for RelativeSoftMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_SOFT;
+}
+
+/// Timer with absolute expiration, pinned to CPU and handled in soft irq context.
+pub struct AbsolutePinnedSoftMode;
+
+impl HrTimerMode for AbsolutePinnedSoftMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT;
+}
+
+/// Timer with relative expiration, pinned to CPU and handled in soft irq context.
+pub struct RelativePinnedSoftMode;
+
+impl HrTimerMode for RelativePinnedSoftMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT;
+}
+
+/// Timer with absolute expiration, handled in hard irq context.
+pub struct AbsoluteHardMode;
+
+impl HrTimerMode for AbsoluteHardMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_HARD;
+}
+
+/// Timer with relative expiration, handled in hard irq context.
+pub struct RelativeHardMode;
+
+impl HrTimerMode for RelativeHardMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_HARD;
+}
+
+/// Timer with absolute expiration, pinned to CPU and handled in hard irq context.
+pub struct AbsolutePinnedHardMode;
+
+impl HrTimerMode for AbsolutePinnedHardMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD;
+}
+
+/// Timer with relative expiration, pinned to CPU and handled in hard irq context.
+pub struct RelativePinnedHardMode;
+
+impl HrTimerMode for RelativePinnedHardMode {
+    const C_MODE: bindings::hrtimer_mode = bindings::hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD;
 }
 
 /// Use to implement the [`HasHrTimer<T>`] trait.
-- 
2.43.0

