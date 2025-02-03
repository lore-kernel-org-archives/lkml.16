Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF986209F24;
	Mon,  3 Feb 2025 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595418; cv=none; b=NcJEAbXah0uSTLPrH18QtlVAoNGsldjwFzP/e3jEsFDC2IiN0P+71B92cfW45p2Pmar0atW5PM8sMCDzRmr56NbSjKMpLMbc/3vTbBvwoA7JOtweYLkrUp23Sge0dIYzpDjQMj3yW04qSYe+3rJHp6IndTgf3P1hkjKPOhc+I4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595418; c=relaxed/simple;
	bh=8XpJSLJ55SDaveXMAsKmhWitbwmSWaNN5s8GVphJwa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZCH0FQ17gUZszGOYR9xy+LxFjRSdvUefrZcROnxvT2N3P9k8asmZrTY2G4JjyNdS3QCp/qYCALdsRV4mosDX6U+S0a+qdt8m9hyrNJRFlzVDYKKtYYh+GwFqNaqmsMGzpI0YZ8YPO7sTNfDfyyAyLCjpo8F/lKIA0GhhtC0RSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJpJHC0x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJpJHC0x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8904CC4CED2;
	Mon,  3 Feb 2025 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595418;
	bh=8XpJSLJ55SDaveXMAsKmhWitbwmSWaNN5s8GVphJwa8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JJpJHC0x07Y5CchLCvOLz9TBYC47t98cl7rBlbmGvZmzuB4MO0SV1xH2KeNTUMES9
	 8oZ5v8uvofJpXq+xCl6bY3nVryrpcKi5508RYFjclcNKQtIODnxyEFbxL2/6qrFpjw
	 sAENjnBXtZlu4uZuRlAwXo7KObmUNCsgsWYZbl9VVOPbrTRpsBAAVpC/9pOsqek6dD
	 AcwnNYTmIlkrTZ6eFJpGf+9tCmcAz8WKW/WFk7G4lvi249f9VHKBcMRgCq8dOINwXp
	 qjFL3RUELAMpS6Ulo6WK/o6SbRVkjW6PYXbtn/wGVnd3mwwcR887MvwUhrb0GYw7XI
	 Uf+1WPAXUSN9g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:58 +0100
Subject: [PATCH v7 12/14] rust: hrtimer: add `HrTimerMode`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-12-189144725399@kernel.org>
References: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
In-Reply-To: <20250203-hrtimer-v3-v6-12-rc2-v7-0-189144725399@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Lyude Paul <lyude@redhat.com>, 
 Guangbo Cui <2407018371@qq.com>, Dirk Behme <dirk.behme@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5684; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=8XpJSLJ55SDaveXMAsKmhWitbwmSWaNN5s8GVphJwa8=;
 b=kA0DAAgB4bgaPnkoY3cByyZiAGeg29mg1CJLD7qglfAHRz/AtnmuDAWDlGEUKD7x6RpE6GPnU
 okCMwQAAQgAHRYhBBLB+UdWv3wqFdbAEuG4Gj55KGN3BQJnoNvZAAoJEOG4Gj55KGN3YpcP/iLA
 gqInH0l83EXOodpR/B8oqfNyHqnar4uAQDSpdPSle4fraeRVX3z3rZd6lluyQqxXjXOzy/PncGi
 GBij8nbsfXul45u36eeSzmOxy/s52lKWZYeHWB0kSF2v2m62tZ+cB5IQTIVdf83k8pV0NmeTdoU
 CKUTNEgIi99pp/04bMepRhdIQ1Igi38qyBpJzpK4VEZ1OzHV5B9YEL1LwxgvPfUj6fRVhydJGGH
 Lfvq9ivD0X3nueLIUksz7WV1tEzVuamtjtx8IYhxdJeRGgYtPiQrswfJmT4X6uVMhB3T/JAc3u9
 3jU/U4ICGJa+AU8X79zVEG6L73uoP7Mukj2KS5ZIDh/NIr1A8YjcvQuxok8VRTTloDjE4Cp2DjH
 vDoNKbH+fkCejJsZ74/s7z9x88XENwo0F0wgBmfkzTtMS9KeuSCo/2WmdquDcUAu5lUeolMkzxy
 dKXAppVLndtZkP7t/DPqIqFmnzKXw13Nq1ga0mCrH3baaNArzfAQOjeLsw1Jrv4w2bim7S48K5C
 ZAGGfozWybrplFLsugU23uzGBfnT6iLG0HW8RvaNBjM/j0zHjS2H/wQ3Dkt64A+suaXASctjnH4
 A3OGxdBC3nWeK5uw8EwDqUglot6z9bTePFkoy5uc6TaJ2TpmPPKBPVcvQHbbYdy+r7Ulb8LdKIz
 riESH
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow selection of timer mode by passing a `HrTimerMode` variant to
`HrTimer::new`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 86 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 5eaf86fd099566e9d837a1d394e666fcb8f8dab4..6a7344cb32647b6ed033c22fc3774981708c3a67 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -59,6 +59,7 @@
 pub struct HrTimer<T> {
     #[pin]
     timer: Opaque<bindings::hrtimer>,
+    mode: HrTimerMode,
     _t: PhantomData<T>,
 }
 
@@ -72,7 +73,7 @@ unsafe impl<T> Sync for HrTimer<T> {}
 
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
-    pub fn new() -> impl PinInit<Self>
+    pub fn new(mode: HrTimerMode) -> impl PinInit<Self>
     where
         T: HrTimerCallback,
     {
@@ -87,10 +88,11 @@ pub fn new() -> impl PinInit<Self>
                         place,
                         Some(T::CallbackTarget::run),
                         bindings::CLOCK_MONOTONIC as i32,
-                        bindings::hrtimer_mode_HRTIMER_MODE_REL,
+                        mode.into(),
                     );
                 }
             }),
+            mode: mode,
             _t: PhantomData,
         })
     }
@@ -336,7 +338,7 @@ unsafe fn start(self_ptr: *const Self, expires: Ktime) {
                 Self::c_timer_ptr(self_ptr).cast_mut(),
                 expires.to_ns(),
                 0,
-                bindings::hrtimer_mode_HRTIMER_MODE_REL,
+                (*Self::raw_get_timer(self_ptr)).mode.into(),
             );
         }
     }
@@ -368,6 +370,84 @@ fn from(value: HrTimerRestart) -> Self {
     }
 }
 
+/// Operational mode of [`HrTimer`].
+#[derive(Clone, Copy)]
+pub enum HrTimerMode {
+    /// Timer expires at the given expiration time.
+    Absolute,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    Relative,
+    /// Timer does not move between CPU cores.
+    Pinned,
+    /// Timer handler is executed in soft irq context.
+    Soft,
+    /// Timer handler is executed in hard irq context.
+    Hard,
+    /// Timer expires at the given expiration time.
+    /// Timer does not move between CPU cores.
+    AbsolutePinned,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer does not move between CPU cores.
+    RelativePinned,
+    /// Timer expires at the given expiration time.
+    /// Timer handler is executed in soft irq context.
+    AbsoluteSoft,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer handler is executed in soft irq context.
+    RelativeSoft,
+    /// Timer expires at the given expiration time.
+    /// Timer does not move between CPU cores.
+    /// Timer handler is executed in soft irq context.
+    AbsolutePinnedSoft,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer does not move between CPU cores.
+    /// Timer handler is executed in soft irq context.
+    RelativePinnedSoft,
+    /// Timer expires at the given expiration time.
+    /// Timer handler is executed in hard irq context.
+    AbsoluteHard,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer handler is executed in hard irq context.
+    RelativeHard,
+    /// Timer expires at the given expiration time.
+    /// Timer does not move between CPU cores.
+    /// Timer handler is executed in hard irq context.
+    AbsolutePinnedHard,
+    /// Timer expires after the given expiration time interpreted as a duration from now.
+    /// Timer does not move between CPU cores.
+    /// Timer handler is executed in hard irq context.
+    RelativePinnedHard,
+}
+
+impl From<HrTimerMode> for bindings::hrtimer_mode {
+    fn from(value: HrTimerMode) -> Self {
+        use bindings::*;
+        match value {
+            HrTimerMode::Absolute => hrtimer_mode_HRTIMER_MODE_ABS,
+            HrTimerMode::Relative => hrtimer_mode_HRTIMER_MODE_REL,
+            HrTimerMode::Pinned => hrtimer_mode_HRTIMER_MODE_PINNED,
+            HrTimerMode::Soft => hrtimer_mode_HRTIMER_MODE_SOFT,
+            HrTimerMode::Hard => hrtimer_mode_HRTIMER_MODE_HARD,
+            HrTimerMode::AbsolutePinned => hrtimer_mode_HRTIMER_MODE_ABS_PINNED,
+            HrTimerMode::RelativePinned => hrtimer_mode_HRTIMER_MODE_REL_PINNED,
+            HrTimerMode::AbsoluteSoft => hrtimer_mode_HRTIMER_MODE_ABS_SOFT,
+            HrTimerMode::RelativeSoft => hrtimer_mode_HRTIMER_MODE_REL_SOFT,
+            HrTimerMode::AbsolutePinnedSoft => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_SOFT,
+            HrTimerMode::RelativePinnedSoft => hrtimer_mode_HRTIMER_MODE_REL_PINNED_SOFT,
+            HrTimerMode::AbsoluteHard => hrtimer_mode_HRTIMER_MODE_ABS_HARD,
+            HrTimerMode::RelativeHard => hrtimer_mode_HRTIMER_MODE_REL_HARD,
+            HrTimerMode::AbsolutePinnedHard => hrtimer_mode_HRTIMER_MODE_ABS_PINNED_HARD,
+            HrTimerMode::RelativePinnedHard => hrtimer_mode_HRTIMER_MODE_REL_PINNED_HARD,
+        }
+    }
+}
+
+impl From<HrTimerMode> for u64 {
+    fn from(value: HrTimerMode) -> Self {
+        Into::<bindings::hrtimer_mode>::into(value) as u64
+    }
+}
+
 /// Use to implement the [`HasHrTimer<T>`] trait.
 ///
 /// See [`module`] documentation for an example.

-- 
2.47.0


