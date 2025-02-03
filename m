Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F3208978;
	Mon,  3 Feb 2025 15:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595424; cv=none; b=b3ejyCocrzI3myeDj4WbWAr4s4HXihcbQFeuanNKCarF0yAe6FceVqGZJji7Qo6XRQpAtBEr+bNczH7D/0TVl0LewE1u1yrWeFoA6LpjuSIKokrtFx22GRcSzuv8UCQp4nbJY6RWgWwDkvHP8u0jytZH4gFTU3hPGPfoa6qbcBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595424; c=relaxed/simple;
	bh=d2IJqaWH63Pns1hiifXnCmRVS0Gds6m+BDdNnp+PTN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kk/86hDplgPoBQMHsKdCIUfbDzKU6FKIOuMnxnfJJp+RsqyUlOGK9EdrWduW8OXMWimA5wBRrIJDyfQOe7odEfzaFqYU9XyYuYEcCvtK3vVFDdC/pSwsbSqWPBx+6vqJaUdyyjfmlqiLd7zO2EuL8fUtTc2U2VlWQ5TxKN841a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJ8z7MwP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJ8z7MwP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6BBC4CEE3;
	Mon,  3 Feb 2025 15:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595423;
	bh=d2IJqaWH63Pns1hiifXnCmRVS0Gds6m+BDdNnp+PTN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QJ8z7MwP2h5O9cLHGtKkqL8Oy1kcDBfX0QlzdTbTC+UL4pp4DaEuyaz0lx035H80+
	 P6DOSgzuYL3EfgnkKBlzxI1jckeNltcrl1HXcvBqM04nCAEzxMO0B27cOlkywxaNqx
	 lvll0hZk3MNIBO6KFiH6NpTFHfX6A/GYVXL4Am6ZjyAwff+GR52CKTB5RUO1QjIKSh
	 NDWg2VBM1I4Ktm71JZrUI6HT4+b38OicHL1xuqOx/lcoaRdzudGwXvl40PnuOlodiS
	 CVFwwu3Fqdy2iq/wIUNcYhNmIydzSvuLLxcz5sldpPMGVpQLDpWJkN5XLA0XcNfYs6
	 CEnKOzgcbwUQg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:51 +0100
Subject: [PATCH v7 05/14] rust: hrtimer: allow timer restart from timer
 handler
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-5-189144725399@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2541; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=d2IJqaWH63Pns1hiifXnCmRVS0Gds6m+BDdNnp+PTN4=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvSVkNoE+hMIzaTfEZByT9GPrTgvapfS3gol
 IFt8h4p9RSJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db0gAKCRDhuBo+eShj
 d5hFEACxLpe7wrrNf3ATC/4OO/XO5LzoqvwYgdXYHKCRjZbFd8WzFC57k0N279UEAqEBh9ry1SV
 ma0fPFzrYCilOZaoWa0cMT95mZf1NOYiEmZGggmpeH6Tf+ky+w/uvFWjkmD1bIiOjBIbcIMMSvP
 +pSAysrDijpx77g9i1jngTQwPLYhHEhUvrPpYjgxtK2iR0+nkMqELr5BiPBksmOfpym98S9EZ61
 o3QZMma9kJ1GplfpubkQbiZIvibtleFxahDTkgTOBo6nDiY8EfwLqMXrZ/T7W7bv1ug4TLvz/C5
 H3fmTpUvIiLjYfuoqLmP0BJ54YYcDW96vTZclLhN3azOLlB1Fo8TBmuHp5lUMWNCm5DfHMcBwTn
 RG2uYBg10e2TVmxRnf8/Xg04RH73VKM8ZG/tNOlH3RK/tJcRpy90AbtWjZxvVJZikAlzUTTWR19
 ZXy3NgsJ3+zOsb5xoS6ohGbAUNYmpFA+EhyBZRfikaMD8S8pU5YFzuzX9utZ2NUKhrGKDPy4kVU
 c7L6+T9NNQ8j6srMXvdjaqRCYBoF+DHAH2C+W96R99QSl68LPm+UBXt6SNszYIExVL/WMNV59rt
 /SNnJRMgVnf8kPWOpzbP8MuZDvz4XBwe2hgQ8Bi4RuKqD0jVIwj2lFehAI8vLObruvWj65mB+hB
 Z4iWYU+kKMPwjDg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This patch allows timer handlers to report that they want a timer to be
restarted after the timer handler has finished executing.

Also update the `hrtimer` documentation to showcase the new feature.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs     | 28 +++++++++++++++++++++++++++-
 rust/kernel/time/hrtimer/arc.rs |  4 +---
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 3494c00481a4bd25735edf44b6bdcbec9810243e..3ed7f5ee92fc5f9f4cc108c373ac40480f5307d1 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -183,7 +183,7 @@ pub trait HrTimerCallback {
     type CallbackTargetParameter<'a>;
 
     /// Called by the timer logic when the timer fires.
-    fn run(this: Self::CallbackTargetParameter<'_>)
+    fn run(this: Self::CallbackTargetParameter<'_>) -> HrTimerRestart
     where
         Self: Sized;
 }
@@ -278,6 +278,32 @@ unsafe fn start(self_ptr: *const Self, expires: Ktime) {
     }
 }
 
+/// Restart policy for timers.
+pub enum HrTimerRestart {
+    /// Timer should not be restarted.
+    NoRestart,
+    /// Timer should be restarted.
+    Restart,
+}
+
+impl From<bindings::hrtimer_restart> for HrTimerRestart {
+    fn from(value: u32) -> Self {
+        match value {
+            bindings::hrtimer_restart_HRTIMER_NORESTART => Self::NoRestart,
+            _ => Self::Restart,
+        }
+    }
+}
+
+impl From<HrTimerRestart> for bindings::hrtimer_restart {
+    fn from(value: HrTimerRestart) -> Self {
+        match value {
+            HrTimerRestart::NoRestart => bindings::hrtimer_restart_HRTIMER_NORESTART,
+            HrTimerRestart::Restart => bindings::hrtimer_restart_HRTIMER_RESTART,
+        }
+    }
+}
+
 /// Use to implement the [`HasHrTimer<T>`] trait.
 ///
 /// See [`module`] documentation for an example.
diff --git a/rust/kernel/time/hrtimer/arc.rs b/rust/kernel/time/hrtimer/arc.rs
index d1c90631d00362bdc38be1ccc75429ae294ab544..109eded0e73be853313abbe1a3540a5b1b8706d7 100644
--- a/rust/kernel/time/hrtimer/arc.rs
+++ b/rust/kernel/time/hrtimer/arc.rs
@@ -82,8 +82,6 @@ impl<T> RawHrTimerCallback for Arc<T>
         // timer. This `T` is contained in an `Arc`.
         let receiver = unsafe { ArcBorrow::from_raw(data_ptr) };
 
-        T::run(receiver);
-
-        bindings::hrtimer_restart_HRTIMER_NORESTART
+        T::run(receiver).into()
     }
 }

-- 
2.47.0


