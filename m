Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42585282FA;
	Mon, 30 Jun 2025 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751289057; cv=none; b=D1ykw6rbVCkL6WS+7pyTwpT/0qbXuztael/7lg7ZVJIR+i1gHb//SdKbjAVXPhnp9tqPf2fWCkVHkAt2gKJsQ+QY7EpoWOEaNh8l7n7NuGN+czCaca2Z57gnePH2omTOIcsG2Y7K77jtaJn87d22zixupyANjn+nR420+hriXz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751289057; c=relaxed/simple;
	bh=zTanlzol4nrqsNN6Ad+a+tZNxjt6u1+sQebSyo8YjmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tqjNTBTPua8m5CgcWmh6dB18Sn+PSI6UNNb5cWWRx1z35AvChYu3tM+NSYt2aF5eseQa2ZmDvbC7ZCMBd/DbK2E6tyKfHQVXwywzKV8ZWyJYTZRIsuLusiMafEiuI8UQ1dFAQ7gERE4rIKJCPNRRraooUFmQuLHcLcllcNevaPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiQFnxoZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiQFnxoZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-747ef5996edso1790982b3a.0;
        Mon, 30 Jun 2025 06:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751289055; x=1751893855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+DLfm3snRYFkb9TKEMAfI7I8jXbRrBgn5m4gNtwXWdk=;
        b=aiQFnxoZfT/xSNHCJfizDyazoQJDOxL4WFnVmZZgT6C51r+9qG791LCnvAcNI/NETG
         I5+WaVKVdWS5qPhCKz77w3/jmp9MGv7FavSF3hxrfsFjxiHJ07+vxaivjMFKKan2WYyJ
         rXW0CtReIzSAS4LOaWJ3JBLUh0OaAZvt5C4AcySf39wfTO26Kun5T8bMwxqpKR2sVxVu
         JbUXeP1tp8GHWo3fWzynzxEqDg/aizPAp63Fq2a6XT/3hvUfSVwevr0lv/uEl2+hK5W4
         B5pmNHMeL7Gp8wUBpBPOCTt8jyxDzMI74D2oKtL68sCCixOE+g9vAoQohjF+iS3Vg1iL
         gsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751289055; x=1751893855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DLfm3snRYFkb9TKEMAfI7I8jXbRrBgn5m4gNtwXWdk=;
        b=TFoYG+w27QP9ONUKt+chlgstT7y6UANjNo8T+Y14+Kdhhpa/7maraAbxLQL4+LLCA0
         nKPZBwnc/UZs4S98sqhOjZoqrrYpHH8rYMH2KCvkMquW4QMYdx6qRD9jZ4qBHOUUWdcp
         9eCzIQhmL4k7rXGNZzdEL5aA8VUfkx9+TUYAmHJbU50V0JERXxgM3U9ANyzWyjbnqrDI
         053N47/2IgQNwmyVgJhLfKb8prGQhqiVsuTm2fdBHCpAOU/xmE7qo7YxQJOBEV1AfgGA
         W22ifp7WWScsHWGRDipKQd6FijvcWrR1PAzfXOWSl7ckB69eYFisRdXoC3qL5A3PTk8q
         iytg==
X-Forwarded-Encrypted: i=1; AJvYcCUH4X0ri/2P8cP2hE+Qd/ojQeodTAO/X0Zzxpq3rqiL2f5xCyprYF+tEkpwY5vurNdRYgZE0Tb3XkclVqk=@vger.kernel.org, AJvYcCV1aTVhurhpbZ/RoV7ngwFhGKCn9LPSlSOPHG+exsGkZDmFhmPFNTAyWriuUgpkfpoLR9UQ8PbFrQzVnFPBay4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl4kzU2BwWvfPMeCGgQ1R9V9P9GsCFK6ZWQEMDVK09yC73sTE8
	TX3zYbYNREBDPxJgfb15ppcmfS/VceM5EkE/PMRXElabXRj0C/qFUwYT
X-Gm-Gg: ASbGncuKTIMjnB92OEgOePqjkI8G9jW33coVwwx9JSCKZmeMBJRHIrteaQaOZFnnaed
	j9khC+QWrXDpnkw8266ci1czZSDOqqxOPYaFrziRhb/JiLp92Bv37D9HldFvfoEij0f+hP3EEoG
	roSH/vGf2V4i9/j5iNyA7h+w/U/VbWTo+19zRSU3HO0r6rZiqzGrmVH+xe1wBW2QAdt7Ij/rZ2P
	iSRs0AVtqKS1k3clOvevVMdyUZV4p7CME5T7tjtYlQeY7hlfL7h1OgvtCdxstM30eswFVVWSqrH
	5qagHSlNBoqz9R5aM4DKV20s1w5fGfyzR5NCc8kqJ0EIXNZ++CD7skMPffgO4Yvc4uSc0VPY2Xx
	IKMqql2LWFWLfHwxsbNOaKRMqInHVc2X5/Jc=
X-Google-Smtp-Source: AGHT+IEb0NLLErVrv/OqOcKaCsqjLHA7spOa7s+ntrl9dz85xfprkYxf/8+tgyzQqhGJok0XgYjuNA==
X-Received: by 2002:a05:6a00:2288:b0:746:3025:6576 with SMTP id d2e1a72fcca58-74af6f222dfmr17479678b3a.14.1751289055423;
        Mon, 30 Jun 2025 06:10:55 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b27dsm9090770b3a.84.2025.06.30.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:10:55 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org,
	boqun.feng@gmail.com
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
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
Subject: [PATCH v1] rust: time: make ClockSource unsafe trait
Date: Mon, 30 Jun 2025 22:10:11 +0900
Message-ID: <20250630131011.405219-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark the ClockSource trait as unsafe and document its safety
requirements. Specifically, implementers must guarantee that their
`ktime_get()` implementation returns a value in the inclusive range
[0, KTIME_MAX].

Update all existing implementations to use `unsafe impl` with
corresponding safety comments.

Note that there could be potential users of a customized clock source [1]
so we don't seal the trait.

Link: https://lore.kernel.org/rust-for-linux/Z9xb1r1x5tOzAIZT@boqun-archlinux/ [1]
Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 64c8dcf548d6..a90c386dda3a 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -59,7 +59,13 @@ pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
 /// cases the user of the clock has to decide which clock is best suited for the
 /// purpose. In most scenarios clock [`Monotonic`] is the best choice as it
 /// provides a accurate monotonic notion of time (leap second smearing ignored).
-pub trait ClockSource {
+///
+/// # Safety
+///
+/// Implementers must ensure that `ktime_get()` returns a value in the inclusive range
+/// [0, KTIME_MAX] (i.e., greater than or equal to 0 and less than or equal to
+/// `KTIME_MAX`, where `KTIME_MAX` equals `i64::MAX`).
+pub unsafe trait ClockSource {
     /// The kernel clock ID associated with this clock source.
     ///
     /// This constant corresponds to the C side `clockid_t` value.
@@ -67,7 +73,7 @@ pub trait ClockSource {
 
     /// Get the current time from the clock source.
     ///
-    /// The function must return a value in the range from 0 to `KTIME_MAX`.
+    /// The function must return a value in the range [0, KTIME_MAX].
     fn ktime_get() -> bindings::ktime_t;
 }
 
@@ -84,7 +90,9 @@ pub trait ClockSource {
 /// count time that the system is suspended.
 pub struct Monotonic;
 
-impl ClockSource for Monotonic {
+// SAFETY: The kernel's `ktime_get()` is guaranteed to return a value
+// in [0, KTIME_MAX].
+unsafe impl ClockSource for Monotonic {
     const ID: bindings::clockid_t = bindings::CLOCK_MONOTONIC as bindings::clockid_t;
 
     fn ktime_get() -> bindings::ktime_t {
@@ -109,7 +117,9 @@ fn ktime_get() -> bindings::ktime_t {
 /// the clock will experience discontinuity around leap second adjustment.
 pub struct RealTime;
 
-impl ClockSource for RealTime {
+// SAFETY: The kernel's `ktime_get_real()` is guaranteed to return a value
+// in [0, KTIME_MAX].
+unsafe impl ClockSource for RealTime {
     const ID: bindings::clockid_t = bindings::CLOCK_REALTIME as bindings::clockid_t;
 
     fn ktime_get() -> bindings::ktime_t {
@@ -127,7 +137,9 @@ fn ktime_get() -> bindings::ktime_t {
 /// discontinuities if the time is changed using settimeofday(2) or similar.
 pub struct BootTime;
 
-impl ClockSource for BootTime {
+// SAFETY: The kernel's `ktime_get_boottime()` is guaranteed to return a value
+// in [0, KTIME_MAX].
+unsafe impl ClockSource for BootTime {
     const ID: bindings::clockid_t = bindings::CLOCK_BOOTTIME as bindings::clockid_t;
 
     fn ktime_get() -> bindings::ktime_t {
@@ -149,7 +161,9 @@ fn ktime_get() -> bindings::ktime_t {
 /// The acronym TAI refers to International Atomic Time.
 pub struct Tai;
 
-impl ClockSource for Tai {
+// SAFETY: The kernel's `ktime_get_clocktai()` is guaranteed to return a value
+// in [0, KTIME_MAX].
+unsafe impl ClockSource for Tai {
     const ID: bindings::clockid_t = bindings::CLOCK_TAI as bindings::clockid_t;
 
     fn ktime_get() -> bindings::ktime_t {

base-commit: d4b29ddf82a458935f1bd4909b8a7a13df9d3bdc
-- 
2.43.0

