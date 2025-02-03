Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89CE208969;
	Mon,  3 Feb 2025 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595394; cv=none; b=CuZprf71RYda5FOKmj/VZFi/XTXPHtD9wZWW/T7E+WEoWRyQALlHW6s3Ix/WB/sizIYAweYRQhco5sXKfjdlLRBGLWVP6qYZi+aDCOho2E6v4oUal1G39PNpe73a7DYvZM7Gdp2LVq9W/tQ/Sp3Pogt685mW/B2hyt5qrD1qvGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595394; c=relaxed/simple;
	bh=mPCXOTNw3fV8ROYk0QkFsga+IGKpcdmhxz0eOJ4TGTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwVYCa6StZ+hvLWWHH4lJcUk6CSB11aU8XAe0oq6BNuAyY4yWzHqWoVm0ShtUQ2UzTVfzX+xglOf6uXYV3ogMIHHXYJHExtkvAeNWOFEUHW0mgBuE5tEU6i0iCUAdhtpzewmJw2tcCyrw3aGazaBx91rODw69Vcm2IGz17CYaAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAfO20X6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAfO20X6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA906C4CEE0;
	Mon,  3 Feb 2025 15:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595392;
	bh=mPCXOTNw3fV8ROYk0QkFsga+IGKpcdmhxz0eOJ4TGTM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YAfO20X6BfQmjZbJxZ1tHMRmWtaaL3OgdurpnWGG+5Mh8MZH3n9aXDAs6qEtA+FGF
	 UTXN2G7TINh/fTl9l4qe3r3B6gLcWjG4QKFpyl/51TaPVLXjAsTbw19n6W8NFFLakR
	 QfdeDhSQGgr5JZ9ApK7Or9a0IxBx6/c9zOwnukPx5pLLB2/DkPc9auirhQ7wBSgD+1
	 2KWXo2GTp3vkdp/HIpGJkEUaBh6at01d/CKl7lb3kWVUKvVpgExEzJbW0zoME92adg
	 SOlb8tnxkhw7m7s9alEw40j5kxMZOg52wbobrYKvDHT1gSNT0etcQFwhb3z+Z1/ktW
	 eTXa9Jk45NxDg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:59 +0100
Subject: [PATCH v7 13/14] rust: hrtimer: add clocksource selection through
 `ClockSource`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-13-189144725399@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4052; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=mPCXOTNw3fV8ROYk0QkFsga+IGKpcdmhxz0eOJ4TGTM=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvayf8eo7Va9PqH1uyARlh3GcrEKsLMbWZKH
 IKUDGLSZN2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db2gAKCRDhuBo+eShj
 d4NUD/45zBevqrRd7f059HTRKFT3T49H/E22kn7Eo7nzGlLUz+HKFIqRsTCNh3ciCVewuMWkEx5
 Y/DJ+V0e16YDuE0sTzxz9JNpU4iWOqvVr+ugwhy86OyDhF/rwLNnbNZATzsrx0F6uQ7h1NTs+eS
 WZuu5i7Lz9Llhrn9y0RJTbkVHcnWegq8AE1XRgrc2bbbtsHMWWvdReEEMa8uE0Qbg7ll+dyCnSF
 fWC2el2SzgIFiqizYv3d5+d2Tke5GHm48jDojr+1xYNFgY+cBxxu5WT1qGlsPqne4+lrijM/NaJ
 Y4gIj4l/tjn9vRuxIzlzWtY2MYTTzTLgrZCjBsjOpTWpJivvhDtbxkrnpE/5eupC0f1PAy3XY3i
 WTu/bTTM8vb377Ymz/uiACPs55mDwKZFjv2yneSxcPABIF9an32XCMd7DpkKrf+TCC66bolUTWY
 yk4+dIQeYqrYOmn6BVlS2SSS6MEDonx1dqqgzdgik0Jaj5NPIRWRQPkchCazVxv/2BwOOMO8iq7
 Budmh+gbYwwgdJHk2s9CywoMEz7NGSaJduJc9poP0GZtVOwaeVm+LsTdeMou0WI0XRxnBSP//Oz
 HIVzeFt3vJKnpCI5iAZvIvf1/jU4sr0XqvSv9zsGpkoNC45MxN1m9qGQNPSDNiTYcH61tn1Hj2R
 MM2i3eszGSBAxyQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Allow selecting a clock source for timers by passing a `ClockSource`
variant to `HrTimer::new`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 52 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 6a7344cb32647b6ed033c22fc3774981708c3a67..6de8c9d52fd57c491c9ce5eac6904ed89039ba0c 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -73,7 +73,7 @@ unsafe impl<T> Sync for HrTimer<T> {}
 
 impl<T> HrTimer<T> {
     /// Return an initializer for a new timer instance.
-    pub fn new(mode: HrTimerMode) -> impl PinInit<Self>
+    pub fn new(mode: HrTimerMode, clock: ClockSource) -> impl PinInit<Self>
     where
         T: HrTimerCallback,
     {
@@ -87,7 +87,7 @@ pub fn new(mode: HrTimerMode) -> impl PinInit<Self>
                     bindings::hrtimer_setup(
                         place,
                         Some(T::CallbackTarget::run),
-                        bindings::CLOCK_MONOTONIC as i32,
+                        clock.into(),
                         mode.into(),
                     );
                 }
@@ -448,6 +448,54 @@ fn from(value: HrTimerMode) -> Self {
     }
 }
 
+/// The clock source to use for a [`HrTimer`].
+pub enum ClockSource {
+    /// A settable system-wide clock that measures real (i.e., wall-clock) time.
+    /// Setting this clock requires appropriate privileges. This clock is
+    /// affected by discontinuous jumps in the system time (e.g., if the system
+    /// administrator manually changes the clock), and by frequency adjustments
+    /// performed by NTP and similar applications via adjtime(3), adjtimex(2),
+    /// clock_adjtime(2), and ntp_adjtime(3). This clock normally counts the
+    /// number of seconds since 1970-01-01 00:00:00 Coordinated Universal Time
+    /// (UTC) except that it ignores leap seconds; near a leap second it is
+    /// typically adjusted by NTP to stay roughly in sync with UTC.
+    RealTime,
+    /// A nonsettable system-wide clock that represents monotonic time since—as
+    /// described by POSIX—"some unspecified point in the past". On Linux, that
+    /// point corresponds to the number of seconds that the system has been
+    /// running since it was booted.
+    ///
+    /// The CLOCK_MONOTONIC clock is not affected by discontinuous jumps in the
+    /// system time (e.g., if the system administrator manually changes the
+    /// clock), but is affected by frequency adjustments. This clock does not
+    /// count time that the system is suspended.
+    Monotonic,
+    /// A nonsettable system-wide clock that is identical to CLOCK_MONOTONIC,
+    /// except that it also includes any time that the system is suspended. This
+    /// allows applications to get a suspend-aware monotonic clock without
+    /// having to deal with the complications of CLOCK_REALTIME, which may have
+    /// discontinuities if the time is changed using settimeofday(2) or similar.
+    BootTime,
+    /// A nonsettable system-wide clock derived from wall-clock time but
+    /// counting leap seconds. This clock does not experience discontinuities or
+    /// frequency adjustments caused by inserting leap seconds as CLOCK_REALTIME
+    /// does.
+    ///
+    /// The acronym TAI refers to International Atomic Time.
+    TAI,
+}
+
+impl From<ClockSource> for bindings::clockid_t {
+    fn from(value: ClockSource) -> Self {
+        match value {
+            ClockSource::RealTime => bindings::CLOCK_REALTIME as i32,
+            ClockSource::Monotonic => bindings::CLOCK_MONOTONIC as i32,
+            ClockSource::BootTime => bindings::CLOCK_BOOTTIME as i32,
+            ClockSource::TAI => bindings::CLOCK_TAI as i32,
+        }
+    }
+}
+
 /// Use to implement the [`HasHrTimer<T>`] trait.
 ///
 /// See [`module`] documentation for an example.

-- 
2.47.0


