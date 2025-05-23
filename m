Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C852F3E;
	Fri, 23 May 2025 12:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004902; cv=none; b=Uow6kBtlne7fCe73G3aEOs6tVwCxKCsX4q8oUqKLPXqfIEEqzgyeuhn/Rxl/sBulOJZDswbdv97FyDNylHwiHaLbtEXS4lb6qoSzHEIIN88vT5PolgHCBIgbesDKI+o6LN581cZ8bnt86qLxjU6SZAWWPJCwicEH1bVTsGqatqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004902; c=relaxed/simple;
	bh=zS2qZ1fIE8zCrAcJ/WMTG/eQWd+QMqxNhGkj9gw9I1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GT2WBNTSpaPs1htIUfYI85JbS9WZTEZpOagV9Kp9Wp6jitM7hhoLKxv/Z5Hcs4+OnYmb4P/J/d6kmZr7F0y33MK2z3KYxhI5vE/FGylOQvFUi6QDz0Yt+UGcpXGCSYHCh0QtIcbA/67tTKPq6ll9jGEJjKXzNcNj9ftL4W0nqDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHYGTuKT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHYGTuKT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB3BC4CEEA;
	Fri, 23 May 2025 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748004902;
	bh=zS2qZ1fIE8zCrAcJ/WMTG/eQWd+QMqxNhGkj9gw9I1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uHYGTuKTb7yh5ax6IouJzGnymbzT3CZ0w4/MmFYbfEMi0loxcgs5ahTGHLewqMwQ/
	 LaUmO366jdrmxtWfzwQsrbUKjjntKq5rvDndTmtQ8ayEQBzydW3pyBD/wwjwytgWtD
	 nZ7Sh8k43noU7C36yvuCM29WeAQQWPuAgf60vAM9kHfLWeLopsTCl6UcDrHQbM31G8
	 dJhHdNy2ZGhFMS8L3WMbjxI+wuAnURyzrEpqZpF2HEUCVrjNJ2v8tCfIoTfLkWESzK
	 j5xy44Wx2Ea0IYNUnG656rzePP2gA6PcuYVhICUEX//cLhSunHNGC2zNay985OLjhB
	 YO2ZvR/25LC3g==
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
Cc: Benno Lossin <benno.lossin@proton.me>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] rust: pin-init: examples: pthread_mutex: disable the main test for miri
Date: Fri, 23 May 2025 14:54:12 +0200
Message-ID: <20250523125424.192843-3-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523125424.192843-1-lossin@kernel.org>
References: <20250523125424.192843-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benno Lossin <benno.lossin@proton.me>

`miri` takes a long time to execute the test, so disable it.

Link: https://github.com/Rust-for-Linux/pin-init/pull/50/commits/e717a9eec85024c11e79e8bd9dcb664ad0de8f94
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/examples/pthread_mutex.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/pin-init/examples/pthread_mutex.rs b/rust/pin-init/examples/pthread_mutex.rs
index c709dabba7eb..6c4d18238956 100644
--- a/rust/pin-init/examples/pthread_mutex.rs
+++ b/rust/pin-init/examples/pthread_mutex.rs
@@ -139,7 +139,7 @@ fn deref_mut(&mut self) -> &mut Self::Target {
     }
 }
 
-#[cfg_attr(test, test)]
+#[cfg_attr(all(test, not(miri)), test)]
 fn main() {
     #[cfg(all(any(feature = "std", feature = "alloc"), not(windows)))]
     {
-- 
2.49.0

