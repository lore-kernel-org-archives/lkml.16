Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F51283C97;
	Mon, 19 May 2025 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665599; cv=none; b=IqZwwhumAwzrBsnRqO5OgzWrNHEoHlKIuDtAtXSp8jDnpkwDL3kqNvY5CKjt2Y8G0VtvLZudMOh/dNAHQrhrfKyg8M+nK7ESAvAH5eO+3j0WZ6wjFigT7AAEEHBPhU9OU+q8rysiEjvprd9lqS78lH0ArpyVPXj1B9sW+njMWxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665599; c=relaxed/simple;
	bh=LlgyKOkIjeOrsH6cU0SxQLBz2yybyFfPXRPS0jolXh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Bp5GjddpMtWicKxo3pKHx5FqKGmOoE4oF+DpfwDt+V5d6LJfQKY+F9jyzG+woG+kWuUsCJ3NnfFDOZmju7ilw70LDe1hd8gYXASHBqpvyP748Z1kT1DlgCK4rSzvXGolIcXV1pyjPAkd34PK2BtWeYfMbWY5OOCPXR1C9tsWggE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mF2JquK8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mF2JquK8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335FEC4CEE4;
	Mon, 19 May 2025 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747665599;
	bh=LlgyKOkIjeOrsH6cU0SxQLBz2yybyFfPXRPS0jolXh8=;
	h=From:To:Cc:Subject:Date:From;
	b=mF2JquK8bLw40iGet/6TAAT2zTEOkA1RNNRHolUbfT+IGjx1n0UegRPyl8vZ400X4
	 MGc/YejGZM1I7KDHkiG1Z/Wae3qd6XkkJl8MRESlBAidG9T+bsI4xmhh5g1j0Mopnl
	 I/Rxl/+0d/slaML7MuCBlmhuLD6yRXHylWE6kvNi9H7Jc3gyJR9OH9n74DI7t67PHq
	 alIGlYxp6yfQ+Ypgr7sgryatgqS1nIYWjYoaamBlQ3p6iGcKvodETsfThPhAG5yHul
	 +2zB6ibGvgMLeyaOvZ0r9GKS7Nj+Hhe20q8M4U/5UGZLZy8DkRG+W+Bx4OuRTe1VRY
	 KEo6dzuRUgIoQ==
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
	Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: mailmap: update Benno Lossin's email address
Date: Mon, 19 May 2025 16:39:51 +0200
Message-ID: <20250519143952.11412-1-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update Benno Lossin's email address to `@kernel.org`.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 1c70e51c789d..ad38ec96f783 100644
--- a/.mailmap
+++ b/.mailmap
@@ -134,6 +134,7 @@ Ben Widawsky <bwidawsk@kernel.org> <benjamin.widawsky@intel.com>
 Benjamin Poirier <benjamin.poirier@gmail.com> <bpoirier@suse.de>
 Benjamin Tissoires <bentiss@kernel.org> <benjamin.tissoires@gmail.com>
 Benjamin Tissoires <bentiss@kernel.org> <benjamin.tissoires@redhat.com>
+Benno Lossin <lossin@kernel.org> <benno.lossin@protons.me>
 Bingwu Zhang <xtex@aosc.io> <xtexchooser@duck.com>
 Bingwu Zhang <xtex@aosc.io> <xtex@xtexx.eu.org>
 Bjorn Andersson <andersson@kernel.org> <bjorn@kryo.se>
diff --git a/MAINTAINERS b/MAINTAINERS
index f21f1dabb5fe..fe5786175d03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21252,7 +21252,7 @@ M:	Alex Gaynor <alex.gaynor@gmail.com>
 R:	Boqun Feng <boqun.feng@gmail.com>
 R:	Gary Guo <gary@garyguo.net>
 R:	Björn Roy Baron <bjorn3_gh@protonmail.com>
-R:	Benno Lossin <benno.lossin@proton.me>
+R:	Benno Lossin <lossin@kernel.org>
 R:	Andreas Hindborg <a.hindborg@kernel.org>
 R:	Alice Ryhl <aliceryhl@google.com>
 R:	Trevor Gross <tmgross@umich.edu>
@@ -21282,7 +21282,7 @@ F:	rust/kernel/alloc.rs
 F:	rust/kernel/alloc/
 
 RUST [PIN-INIT]
-M:	Benno Lossin <benno.lossin@proton.me>
+M:	Benno Lossin <lossin@kernel.org>
 L:	rust-for-linux@vger.kernel.org
 S:	Maintained
 W:	https://rust-for-linux.com/pin-init

base-commit: edc5e6e019c99b529b3d1f2801d5cce9924ae79b
-- 
2.49.0

