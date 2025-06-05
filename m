Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED87B1A38E4;
	Thu,  5 Jun 2025 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749138790; cv=none; b=d4HDPKlxyPGVHV/DltBN+acsEGrsdb+jr15SMsX7POMvm90qB3jB7GJUaEynLHzSI1bYcAVKH3PspmZr6thAX8qn21UXFj1gBLm58oqaxRcE9JtU7vU7So466otjwH5uR1isVllASLoGsnQmO3dPrpfF1niPhkLOLHIs4CUUIPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749138790; c=relaxed/simple;
	bh=fiN+FZko9+Fu7eOm/rhVSkG/bkyXnVLs4lXx+1GXUNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YWMDpyt3E2a0z26pRkBhc4vbyJ1vHvU0NJEvfWBbRlpF3YaYjZEchIhwmCC9T9tcvWUpjVrqovVfcfOVXYnxlHjAAO60F+GqDgDApfOwXPa0PfLXqpgbheyBq3V3w4H1161Ym/HX6Rrp2HhB9B0Z6SVZ+NDFUHWJn2fzNV7Eijg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g19L8dpQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g19L8dpQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD20EC4CEE7;
	Thu,  5 Jun 2025 15:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749138789;
	bh=fiN+FZko9+Fu7eOm/rhVSkG/bkyXnVLs4lXx+1GXUNw=;
	h=From:To:Cc:Subject:Date:From;
	b=g19L8dpQIzYuX6uW15QpXvyBA/ziqBMsZ/rC69KWzot7+LPgJ0xSGmyqhV+gwNA/L
	 KvYNwOR2G+9VqYypavamq6Eh/b/CZbks/AP6rbFbwu2AzXULtnvRxEEDXgdTtokIHh
	 1q9uh/atvyCbrcz6JteH0enpOsP/v6STSCV+xPZ1UPKHRhYNiHKtz9KW6Qhah6iJBs
	 GbkhzxUwiLoe85JqCqfqIqW6QS7n/oN6YXMH3ijWRwqXVF9DQvXjNXpPy+hMrHL2G1
	 3Ip3tZKz1iTSiJ+/8jPslFEL0bJPfJc+VHznByCHuFl36SLJPmFYbXvO2g5UdkWKsy
	 wPqZKhmyslvyQ==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: pin-init: examples, tests: use `ignore` instead of conditionally compiling tests
Date: Thu,  5 Jun 2025 17:52:54 +0200
Message-ID: <20250605155258.573391-1-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change `#[cfg(cond)]` to `#[cfg_attr(not(cond), ignore)]` on tests.

Ignoring tests instead of disabling them still makes them appear in the
test list, but with `ignored`. It also still compiles the code in those
cases.

Some tests still need to be ignore, because they use types that are not
present when the condition is false. For example the condition is
`feature = std` and then it uses `std::thread::Thread`.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/all/aDC9y829vZZBzZ2p@google.com
Link: https://github.com/Rust-for-Linux/pin-init/pull/58/commits/b004dd8e64d4cbe219a4eff0d25f0a5f5bc750ca
Signed-off-by: Benno Lossin <lossin@kernel.org>
---

Depends on https://lore.kernel.org/all/20250523125424.192843-3-lossin@kernel.org

---
 rust/pin-init/examples/pthread_mutex.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index 6c4d18238956..49b004c8c137 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -139,7 +139,8 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
-#[cfg_attr(all(test, not(miri)), test)]
+#[cfg_attr(test, test)]
+#[cfg_attr(all(test, miri), ignore)]
 fn main() {
     #[cfg(all(any(feature = "std", feature = "alloc"), not(windows)))]
     {

base-commit: ae8b3a83fb9de394f609035041cd7a668fda2ab3
prerequisite-patch-id: 8d7ade67c2e5189bf8a2c91253d925e25744cba5
prerequisite-patch-id: 0ebbd4a86bebeff23257870db92a1b0fe017c481
prerequisite-patch-id: 1437fc7adeff6e13abd433594da923272b9388bf
-- 
2.49.0

