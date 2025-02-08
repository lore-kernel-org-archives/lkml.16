Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7124634B;
	Sat,  8 Feb 2025 13:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739021554; cv=none; b=ZX7KrppcscCNplwlXcbuBk9ObHiHcyIiodE3d4lvchIjPIb62wkN+YU/pl0D1N5C1sIkhs+qKO42gU7QTVgyJqSqG/gnFTTm0OjOUR6Yw8JFhkR6LqW8JUsut3Q9M2eh5IWjkfw8baIy2BXY1fSpL8hxE1Gh+sT9HqCs9vPLheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739021554; c=relaxed/simple;
	bh=Djc0doMI8bO1ADSSZS2fGxM/XL2BPWbQKQ4SfyNsQCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvsdk0ju2lm3vzFZLBpwRLN2mb+rRL00KkhVsVcl4LAnHLTTqg/E9+T4K6jcHWVG/bmULzl9DDVsSKZpmNHwHhX/hGkoXhw9u9pU7VXqrlFa3QwwCmtYx67Vx0xQiesCfMJ1XFb33SHJjDYHpNPk5fthVECj64a1JBBy8/DOw/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=rQADWEgh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="rQADWEgh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1739021543;
	bh=Djc0doMI8bO1ADSSZS2fGxM/XL2BPWbQKQ4SfyNsQCg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rQADWEghpq9bZcIo79e4IKn2SjuOKao0j3o4g0XWfOhQUC9Yx/fGFaPTWPOkFeEao
	 nVZ6Ri6Hk19vZferQaVH1uKGynrhgl82kApD9mvUTRx03uaC+HnXIePyeX7U7DtfHV
	 uzcbx5BnsTWHySQL14qB6CJUixdRmHHDfHn8Vd+M=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 08 Feb 2025 14:31:14 +0100
Subject: [PATCH 1/2] rust: pass correct target to bindgen on Usermode Linux
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250208-rust-kunit-v1-1-94a026be6d72@weissschuh.net>
References: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net>
In-Reply-To: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739021542; l=1021;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Djc0doMI8bO1ADSSZS2fGxM/XL2BPWbQKQ4SfyNsQCg=;
 b=dXnp06q4bro+DEBeuU/Lp81e1upBO4+8Fsb3FxIIoi9uNuNGEJbP3p6ibP4m3AgzmjFBW6wES
 Gw2FV9ZAcsmDY3btDwpe6pqx50n9XC8BK8gFhnpIznDTY5vojQQfkvB
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Usermode Linux uses "um" as primary architecture name and the underlying
physical architecture is provided in "SUBARCH".
Resolve the target architecture flags through that underlying architecture.
This is the same pattern as used by scripts/Makefile.clang from which
the bindgen flags are derived.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 rust/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/Makefile b/rust/Makefile
index 8fcfd60447bc89ba2c66a4f341288db2387b0956..a94fafb91d7d743c6c1b2248479c0d723964e5c4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -245,6 +245,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
+BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
 # All warnings are inhibited since GCC builds are very experimental,

-- 
2.48.1

