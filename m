Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652A0209F23;
	Mon,  3 Feb 2025 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595459; cv=none; b=XLZTiVg0l9q2lvJznUjQShyPyfs62hnxKzN2c5UWflR1LAY4iWf5CzilDfUhZLlslwMrtNYhY4k7578IlNP82/HorlBi4GdL1aG7UvUEavO7pWKcpjmJ+S8bL5ceSeciUc5YA5C/urpyo3wzp4v+F5riIDfsM1Y73zxIPpraoyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595459; c=relaxed/simple;
	bh=HZoGD1YbTc2gd4teU8xM+77OxuJ93bWRZzduVcfa/38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ner3ryQptqvpU/xezbLUH4fZ0g5ENLaoFA7zdvgqnW+Po6B7/mKVCd0t23izH/tS4yawbqwTN9A1YFoXqT2z6Jqgt0LAj9LOd/DxsHSVvzI0suiLa01ZWyEwi20jr4ADxlWknWH9bj5HZTEiBHSfg9duonWSeeY7V5GvzPbtiFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzjRKqEL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzjRKqEL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAC29C4CED2;
	Mon,  3 Feb 2025 15:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595458;
	bh=HZoGD1YbTc2gd4teU8xM+77OxuJ93bWRZzduVcfa/38=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AzjRKqELTZ9G+YwfqXMSbm/r4o7wsKMoVfGnayrmjzw4pu2kyz+kNMpgkh+pN8TvN
	 KblJiucN6NR4gFweHNG1LTnmNxjhg7SB7kgzMs7rbrQ0aZopPzg3SsI+7AfqW2gAf7
	 YRyUnJMHjgeCJvFfroxAXOmS5DRSYV1W/1Bj7ClhzRFSyev2ncck72vnilZ/bQk+bO
	 Xg7GTUu9uIgwSt8r+HoyEBos0k+a1+Y/QR148RIEdTUuYo+tdb/V5EgRMwq/HQ+Tkm
	 w12XzSwppcFEwCtuJEsH34U2QCJ21wBp/dYX8tTF4FejUQDYX8dW/owVfVmXHYrHZH
	 1rD9JBTUaZQFQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:52 +0100
Subject: [PATCH v7 06/14] rust: hrtimer: add `UnsafeHrTimerPointer`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-6-189144725399@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2123; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=HZoGD1YbTc2gd4teU8xM+77OxuJ93bWRZzduVcfa/38=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvTpw6F6f0HK86YQSnRtdtnxTyRrgMfry/RB
 hGyasKtHo+JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db0wAKCRDhuBo+eShj
 dy97D/9nXmE3elTd/sz/RGVMLpNUWCQkvu47IRMaapAx1lc0FJ8mWORtDHSn/7jdfzjyJpIRaAf
 lNax661vCNO9FJbqdho4Xp3TfQZU4i+SIQSSh5SekwjHY+lWkpZZqneKWtxcQkfVWGbCuZyq+b8
 MUJuTtlCBNCdYKjF1oy+7avBHVYXh6bOUi5YTwv5DiY2klT4fdoem3M+Q5ORcguBKA/URLbLTgm
 sV/opHzc2dH2SRMsgsLYx0COf2WcV0n4bFJQd/N3P68+c6IP2C2OHC0mHusbFC1xVF7DSYC0jw8
 wU/HJ1rJMxFxA0kwYqYZj19W7MpiPWMt5lk15xFE/VK5pMkz04ljZst2zICNbAcrngypM098Ec0
 HkiYAOtaJSnLwEaGp0Zbr/IeRaj42rf6chazsPvFI8rEQa+YBwm13qL9CUrIvf3MyNctIvqTWeW
 dEVA0mrVXBWyPg8x/tfOWWIWxdwaUHhqtrC8oX6InNPl2OUza1jUfa8rUQ7lT6CcZ057gv/Ej2N
 qCtAUt/H7DhdzF7gmEFRaFxAP3D5/34oWo/QRWHjY6RmV6DAdLwDX2t9GlGRCsq7enHpXZc9ELT
 lBk0fblafwHHAE5z9F5ggDfudJrz122p+kUaWdX/qG5SVNr89OR46MClNzP4AFfWyf8zL+bR3GB
 pJx6tTp1FdlKn3Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a trait to allow unsafely queuing stack allocated timers.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index 3ed7f5ee92fc5f9f4cc108c373ac40480f5307d1..f5b360c9472b2a4a90c608be1a470222204ffcf5 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -157,6 +157,37 @@ pub trait HrTimerPointer: Sync + Sized {
     fn start(self, expires: Ktime) -> Self::TimerHandle;
 }
 
+/// Unsafe version of [`HrTimerPointer`] for situations where leaking the
+/// [`HrTimerHandle`] returned by `start` would be unsound. This is the case for
+/// stack allocated timers.
+///
+/// Typical implementers are pinned references such as [`Pin<&T>`].
+///
+/// # Safety
+///
+/// Implementers of this trait must ensure that instances of types implementing
+/// [`UnsafeHrTimerPointer`] outlives any associated [`HrTimerPointer::TimerHandle`]
+/// instances.
+pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
+    /// A handle representing a running timer.
+    ///
+    /// # Safety
+    ///
+    /// If the timer is running, or if the timer callback is executing when the
+    /// handle is dropped, the drop method of [`Self::TimerHandle`] must not return
+    /// until the timer is stopped and the callback has completed.
+    type TimerHandle: HrTimerHandle;
+
+    /// Start the timer after `expires` time units. If the timer was already
+    /// running, it is restarted at the new expiry time.
+    ///
+    /// # Safety
+    ///
+    /// Caller promises keep the timer structure alive until the timer is dead.
+    /// Caller can ensure this by not leaking the returned [`Self::TimerHandle`].
+    unsafe fn start(self, expires: Ktime) -> Self::TimerHandle;
+}
+
 /// Implemented by [`HrTimerPointer`] implementers to give the C timer callback a
 /// function to call.
 // This is split from `HrTimerPointer` to make it easier to specify trait bounds.

-- 
2.47.0


