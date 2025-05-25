Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449731F4289;
	Sun, 25 May 2025 17:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748194497; cv=none; b=tQ26a9OenhJPAEdCGPkcWlYsGKIVXhnpb05Egtvh5dQRzDew/VH89HRZPAaCpjgNPi9yAmYFeXpLYn3tXho7haIOm4+BDxadG4e1owA5kEqTlUanXvPVh/YJci1PafaMhhZB1mxSNEN2xukSfgn6Mt4l/eNJccGVcqCvduDR6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748194497; c=relaxed/simple;
	bh=FuaLd9YnT29y00ZR0LH0Z3neXVY4wzCj/xo9pzkkmrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PJeyWOdC07/fyYUzL6Sn4uKFdmQDlu+zSvHlHP4hqkr0ELcYC8fDw6sDdftiNdAEs5CuHqT+fAc8hDFJNtpiRwnZU94ZzxTVRAx7TjTln9NUcp5aFzN5qQEfHctPbVO1NcSS/IWDW1L+LReE2A9PXcjZytScUM9glsa9wPb4Uuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rNxbHvmW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rNxbHvmW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B79DC4CEEA;
	Sun, 25 May 2025 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748194496;
	bh=FuaLd9YnT29y00ZR0LH0Z3neXVY4wzCj/xo9pzkkmrw=;
	h=From:To:Cc:Subject:Date:From;
	b=rNxbHvmWQD5ebSFR2tAa/TyfH9q6OWztXpy0N21h0+AgWimebrKoHjlHJ5ObKorzv
	 0/qMiNWnaBXE8THR1aKe/fIfWXMQU80uPg/UNg2bwVcY3A2dXh95rOE904NnAOEtX3
	 BYVvhQLzSDBTloEkFRqANkhcgf/j78xHEeKQqKUmKI2yH5bxQXhbH90oN6Xq2iSkZ0
	 kPB02t7JUXwgvQDLV2nxYu/ttLlIXz8gZ9IuFSV/YzPSOI3WXk2jg/hM0Bc8U24SSC
	 H2AMSG1zVtJz3U4d3ql+z9T8f3KuUdJqUzyUczXUzBPhdS6CXDayNx/uqrvDuKLKQ4
	 T9kolGpBuH9RQ==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: stable@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: list: fix path of `assert_pinned!`
Date: Sun, 25 May 2025 19:34:45 +0200
Message-ID: <20250525173450.853413-1-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit dbd5058ba60c ("rust: make pin-init its own crate") moved all
items from pin-init into the pin-init crate, including the
`assert_pinned!` macro.

Thus fix the path.

This occurrence was missed in that commit, since it has no current
users, although binder does.

Cc: stable@kernel.org # I haven't found the commit in stable yet, but just to be sure.
Fixes: dbd5058ba60c ("rust: make pin-init its own crate")
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/kernel/list/arc.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index 13c50df37b89..a88a2dc65aa7 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -96,7 +96,7 @@ unsafe fn on_drop_list_arc(&self) {}
     } $($rest:tt)*) => {
         impl$(<$($generics)*>)? $crate::list::ListArcSafe<$num> for $t {
             unsafe fn on_create_list_arc_from_unique(self: ::core::pin::Pin<&mut Self>) {
-                $crate::assert_pinned!($t, $field, $fty, inline);
+                ::pin_init::assert_pinned!($t, $field, $fty, inline);
 
                 // SAFETY: This field is structurally pinned as per the above assertion.
                 let field = unsafe {

base-commit: f26449565019315650c9fe87743b10103910ca6b
-- 
2.49.0

