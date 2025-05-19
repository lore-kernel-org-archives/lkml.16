Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51725278E7F;
	Mon, 19 May 2025 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747658591; cv=none; b=OyRb0Jx3wCO3ZzjBt0REQdO1NxPF6N7HHLXBDluCW574xKRZs4WkdYjSE7i8fBx7UfV/awwnz5N8d/cPglK8vlvItQAdSsYTJ7d21/jc4gmBocKS4cGtxWiiTsp0UkrLJmyNcq5NupPnQu9m4FcaAths72BO1JrmjlzxEYmnhR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747658591; c=relaxed/simple;
	bh=Wt4YKAHkTkMlVp7y6Gkfnn7u3psXRlM9rBdQ/WNXICU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ls7Ll64u5YfkWAftKskKKLvl5m4IwX9dhdobWPB0yUu/xcmwQJ44mkSRkDFMe6xP8w1VyWsYhndOdIstpXK3Ae61evsVxIlOG+ZoizVVHV6t31rSgodTQ3ok5R6wyMN7qFfMNiEN6LExtAsQ2bJ9z90u3BjJiNurpQwRXi38rqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBa09bSn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBa09bSn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529E5C4CEE4;
	Mon, 19 May 2025 12:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747658590;
	bh=Wt4YKAHkTkMlVp7y6Gkfnn7u3psXRlM9rBdQ/WNXICU=;
	h=From:To:Cc:Subject:Date:From;
	b=MBa09bSnxRg8jLxTUJLf9w4dgTBwyHqm68dIfb2uSFcMLZHXZLGb5qVOdTcInxIyT
	 Ux/dgzlTIyKPagPsH5si1GNe8j/Igrmms+OM0CRTaOREAtefE8HH5/ki7lXP3kqA2U
	 wJJjrzvotXRbkuKipcYSJLrMOe8wjKWV7YfOfrbVsKNR1CSrnALeun4yBJe2gya2Sq
	 sGgfT1tD5kkR6L5/vmjTARE8VrLWPBKiHMhuY95sY7M8WPNPE1qQ96PVthx6LtijrV
	 J3A2FBJZuFMFZurjbD8tlVuR8SI6p5XYLyEtl9w6mXPkBSPFRIt+XMHaID34ybrmD5
	 j+j30BrHGZf1g==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	Kartik Prajapati <kartikprajapati987@gmail.com>,
	Aliet Exposito Garcia <aliet.exposito@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: types: remove `Either<L, R>`
Date: Mon, 19 May 2025 14:43:02 +0200
Message-ID: <20250519124304.79237-1-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This enum is not used. Additionally, using it would result in poor
ergonomics, because in order to do any operation on a value it has to be
matched first. Our version of `Either` also doesn't provide any helper
methods making it even more difficult to use.

The alternative of creating a custom enum for the concrete use-case also
is much better for ergonomics. As one can provide functions on the type
directly and users don't need to match the value manually.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/kernel/types.rs | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 86562e738eac..8830f8c2d12e 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -556,24 +556,6 @@ fn drop(&mut self) {
     }
 }
 
-/// A sum type that always holds either a value of type `L` or `R`.
-///
-/// # Examples
-///
-/// ```
-/// use kernel::types::Either;
-///
-/// let left_value: Either<i32, &str> = Either::Left(7);
-/// let right_value: Either<i32, &str> = Either::Right("right value");
-/// ```
-pub enum Either<L, R> {
-    /// Constructs an instance of [`Either`] containing a value of type `L`.
-    Left(L),
-
-    /// Constructs an instance of [`Either`] containing a value of type `R`.
-    Right(R),
-}
-
 /// Zero-sized type to mark types not [`Send`].
 ///
 /// Add this type as a field to your struct if your type should not be sent to a different task.

base-commit: 22c3335c5dcd33063fe1894676a3a6ff1008d506
-- 
2.49.0

