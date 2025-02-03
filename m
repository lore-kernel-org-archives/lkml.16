Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E3B205AD5;
	Mon,  3 Feb 2025 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738595387; cv=none; b=pFLJLGsODAvdD+Degne0tHUZxRuGmu4JrUtv71KQSPkgZRoDhvlGW2b/Ch7UbOO9k5H89dO0FjHeNVrmc0+ozzL+jWqkKbLRGsFXbq4Zl9v01kWe1b8vaHOzHXOJN0h4nHSZdmOutfd1Cdv6Utehbnt9v40nydfYlysIavGOCsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738595387; c=relaxed/simple;
	bh=koTsfaELOAtmEpKSGKM4AVcZqtKOTEJWBGKssbsuAso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aw8PRwE9AFFL63UtYtsPr5qqoeHSmMOt5m/r5c9XkVVXowbkTPSqyMyZsoPc6+4MJTYxtnnGKePxce052bECFC6QoI31Qi44YoUgrneDCmIXeksCeJjbBpwqWdg55WqD1oM3yImCoU+5KCw617sEDZkav/gmHDXi4cD4ABOolos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1cLqpZM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1cLqpZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A2FC4CED2;
	Mon,  3 Feb 2025 15:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738595387;
	bh=koTsfaELOAtmEpKSGKM4AVcZqtKOTEJWBGKssbsuAso=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D1cLqpZMpm67PS1kZDwUBXJOuhVQJnIPL3M2K8fd/P/Xn211CdydqRsXApJ8BYwzb
	 ZH1G8FztAHXsII71JW56iIdA6RVdSxEZMTlFhqSnlpTluua+QKhK9At78on38yM5aP
	 f1ZChl5g9h7ruPAr6Rp4QphkvMWByqO0hOYcuLAfrTN+owp2sxR6PMYYcl2ICaH8Eu
	 OUghubW9YYk7qRYUg57anqh+bHnli2s19sMxCDKzYOzwM6bPiUJY8WOwY5S6t87d0p
	 HLcJfTF3BNlfR8AxAJR+7FM8zoHkDJieeHQb91ASQTfvoGhZZfuJ3ZA291lp+LgZS3
	 SGj0uoedjwoLw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 03 Feb 2025 16:07:53 +0100
Subject: [PATCH v7 07/14] rust: hrtimer: add
 `hrtimer::ScopedHrTimerPointer`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-hrtimer-v3-v6-12-rc2-v7-7-189144725399@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=koTsfaELOAtmEpKSGKM4AVcZqtKOTEJWBGKssbsuAso=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnoNvU/C8Nmpvkfj22QXlj5bIXKfGG3P/znoy0G
 1v6bi09wzWJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6Db1AAKCRDhuBo+eShj
 d/gYD/wKfNG1FyKEJXc/6I+XxguJA+/IHGx4wRPznUqfCZIBXzJ6OTds4IWqymdwyECzvkACXCm
 dN4OD9c069s7zk7mp1KxO1KSX6fYdF60+RXtyS5u+H5nhb/4Lh2GHahds4Z5fHBqgZmflMlsX5a
 2tdIV6JNHAjxKoUbRP6/L2b9NxSVSPLvwEcDEFiCXWRpaDh/kSmgDHI2qmT/QP4nlKSJbl3/aWH
 unPfN0zZgPWRo+Ew+ioJkUpmsVpd/e9ef+w0OoAD6PMLv9xBl5opZQjl0xmpvI8qxhejPyIHvGe
 LsIeaHKtlh6YqXtqNJ+2p7ZkrAVntSqyfOZRElLLRKFn33xcr/dZpbAfNNle4FEIFzk9TXzVhqe
 fTa6/HIxlnKBD949ra1+neTGMqydVJlaYI+nYGkHoUJel8hVu0ONmGC+DYYDDpEaoWtPxGa3YQt
 RZU181DPwtsAarIiVa14Lo2izEfwNK11GoQxEInIp6ipYz5lCQXmoLIzQOydTjV621cV6h2BXVZ
 mMvYi0VKY9mJie6vAtwW5M5NSOZ0YXlwljJDpairC2pOYhS+JVrUfsx+1jB6LFeq84gU+SDbvhB
 /7Ds9Qfs6naqC+oXkgCyUk1+oHX8xKvwyg/LGaGFD/D2GM3lTRzxRCoY/33i1dHem1yIy1NGg0J
 2rsJGU1BmTHWLoA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add the trait `ScopedHrTimerPointer` to allow safe use of stack allocated
timers. Safety is achieved by pinning the stack in place while timers are
running.

Implement the trait for all types that implement `UnsafeHrTimerPointer`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/time/hrtimer.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index f5b360c9472b2a4a90c608be1a470222204ffcf5..4d39c3526a897cba3b76589f21d0866beaae0c4f 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -188,6 +188,39 @@ pub unsafe trait UnsafeHrTimerPointer: Sync + Sized {
     unsafe fn start(self, expires: Ktime) -> Self::TimerHandle;
 }
 
+/// A trait for stack allocated timers.
+///
+/// # Safety
+///
+/// Implementers must ensure that `start_scoped` does not return until the
+/// timer is dead and the timer handler is not running.
+pub unsafe trait ScopedHrTimerPointer {
+    /// Start the timer to run after `expires` time units and immediately
+    /// after call `f`. When `f` returns, the timer is cancelled.
+    fn start_scoped<T, F>(self, expires: Ktime, f: F) -> T
+    where
+        F: FnOnce() -> T;
+}
+
+// SAFETY: By the safety requirement of [`UnsafeHrTimerPointer`], dropping the
+// handle returned by [`UnsafeHrTimerPointer::start`] ensures that the timer is
+// killed.
+unsafe impl<T> ScopedHrTimerPointer for T
+where
+    T: UnsafeHrTimerPointer,
+{
+    fn start_scoped<U, F>(self, expires: Ktime, f: F) -> U
+    where
+        F: FnOnce() -> U,
+    {
+        // SAFETY: We drop the timer handle below before returning.
+        let handle = unsafe { UnsafeHrTimerPointer::start(self, expires) };
+        let t = f();
+        drop(handle);
+        t
+    }
+}
+
 /// Implemented by [`HrTimerPointer`] implementers to give the C timer callback a
 /// function to call.
 // This is split from `HrTimerPointer` to make it easier to specify trait bounds.

-- 
2.47.0


