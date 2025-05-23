Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9A14B96E;
	Fri, 23 May 2025 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748004907; cv=none; b=qdkf8AgzsOjPxPff2XPzpyKuGbyqv1ezljsEhkWCXh/bsI5ocTlcBWwu5GGPcgJoOHmvOuT4utJ0T1DjcW/ziBXSClCF+dF9SFOmePtRlIsOWxpEt67E+Ev9TAWT9juVyZQ9YwncIDPXbOYRMwns+9lzAwxE6kO/8cNpkgtqoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748004907; c=relaxed/simple;
	bh=UGO20Ph0m/03hTKf8vS+w+bTRY12hJNYL+9+4BG3VpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5s/wxBpCElfmLuvpPCU7SsNulSukIL6LU1CZaYN3jctSc3RaMdTbIybZ2aPDJ5dL5J+7w71IUU46Uw30YxtQOvan9qslZpJgs8Pt6CGj81EP9KmCTNVE3HmPZ1nnmsC/81+xm43+8B0NYqhT6p7SD/bReR/2iUkYOWhI0jB/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqsBI1K4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqsBI1K4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F703C4CEE9;
	Fri, 23 May 2025 12:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748004906;
	bh=UGO20Ph0m/03hTKf8vS+w+bTRY12hJNYL+9+4BG3VpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dqsBI1K4OXbeScHKCQBLEclO45JlZHNR4JTfIPzvfdr8j8ZCB8JWL6FHvMSnmqYUS
	 MG6CrAtDw9FHrOURNGgxoIe24waEPhBrRbs+wHetcrnGizbEx/9TMp7JYNdZBDIHwc
	 vCnwOEVM/+o/+O+ytvRGMux8G/ZBCtFhLjeNPzVAnWWnAsfDTB23Lpgg9you//QQp6
	 0U2biS7XhmAKwUpStEMrOBT23SmAR7j7U2zp3qMZ6Hh3mCnZbgIpyUH/1YpN09S9q+
	 QF2D+NefnzH5jmUORgbSKVozjOIGHJfc6AreaqXMxpPvamORlhzGVpD93JCFxk0WIh
	 Qqz0cbIjzBZyw==
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
Subject: [PATCH 3/3] rust: pin-init: feature-gate the `stack_init_reuse` test on the `std` feature
Date: Fri, 23 May 2025 14:54:13 +0200
Message-ID: <20250523125424.192843-4-lossin@kernel.org>
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

When trying to run `cargo check --all-targets --no-default-features`, an
error is reported by the test, as it cannot find the `std` crate. This
is to be expected, since the `--no-default-features` flag enables the
`no-std` behavior of the crate. Thus exclude the test in that scenario.

Link: https://github.com/Rust-for-Linux/pin-init/pull/50/commits/2813729ccacdedee9dbfcab1ed285b8721a0391b
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/__internal.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/pin-init/src/__internal.rs b/rust/pin-init/src/__internal.rs
index 557b5948cddc..90f18e9a2912 100644
--- a/rust/pin-init/src/__internal.rs
+++ b/rust/pin-init/src/__internal.rs
@@ -188,6 +188,7 @@ pub fn init<E>(self: Pin<&mut Self>, init: impl PinInit<T, E>) -> Result<Pin<&mu
 }
 
 #[test]
+#[cfg(feature = "std")]
 fn stack_init_reuse() {
     use ::std::{borrow::ToOwned, println, string::String};
     use core::pin::pin;
-- 
2.49.0

