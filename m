Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09C7246345;
	Sat,  8 Feb 2025 13:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739021554; cv=none; b=LeouW3UrspKq/K7FT5hJE8mRvdXajvOQWQLAPZCqcNnanKw9Fe1Mc4udOKUfRvfj7xDkggTSq2Ps2df/NbiB3EUucTYgB9+8dk8ZhbjVbbRvH28oCkfDmYMUDiAMz54MUI3ArB24hDSST0zmPLYsUspP8tVYnGo7gtXuxSftaMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739021554; c=relaxed/simple;
	bh=VLUVgc8NZZ21G0lWwQ7ny+8mZQTDDefFbAQFB+DD/Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IVLCjGLmB9sY4UQGBgnzvFx7o7LaJiQeScsfdwn4/EJNWf+E5E95V91GXdppNl12jASDRuP8hp/rXU8P2RDMdYo+ZOqjRIlLfBTiWgEWSemrOyyWAboJ2prNDMj2Xpzy4BkMIoSa8tn8AqjiTvuf7udWgEg/A2mJsqUkqtBSGfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=MvzF116P; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="MvzF116P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1739021543;
	bh=VLUVgc8NZZ21G0lWwQ7ny+8mZQTDDefFbAQFB+DD/Ts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MvzF116PQKO2uhGizEWzIBzOyiZNXEoh+m5rDgLHtSzQGCijsD8JqAqIpB4dTgeFF
	 3NMYshpo336+7egUGlHi/vO1IU2vzIhpJ069CRiLmEgQ4vkKf85kBg3ZYvadMaA77L
	 h/hOE9Aq+DyASLI7aR+voCQOR6wH48cHFfoFd1qg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 08 Feb 2025 14:31:15 +0100
Subject: [PATCH 2/2] rust: add kunitconfig
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250208-rust-kunit-v1-2-94a026be6d72@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739021542; l=600;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=VLUVgc8NZZ21G0lWwQ7ny+8mZQTDDefFbAQFB+DD/Ts=;
 b=XwK4W5z5Q8bJnP6Nl/qMeWkVL2fm1JRP+9hMubchXYdjO7YrTUnamN3+tDsxa/tbM1Z22BnH8
 zSR2QZucXGUAXh/+tJo55LXESO4FYmRuh7/+WOrb/BQnYCZpoJKyFkj
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The kunitconfig file in a directory is used by kunit.py to enable all
necessary kernel configurations to run the tests in that subdirectory.
Add such a file for rust/.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 rust/.kunitconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/.kunitconfig b/rust/.kunitconfig
new file mode 100644
index 0000000000000000000000000000000000000000..9e72a5ab03c9a122348fea7c1db69e1b3fedcc00
--- /dev/null
+++ b/rust/.kunitconfig
@@ -0,0 +1,3 @@
+CONFIG_KUNIT=y
+CONFIG_RUST=y
+CONFIG_RUST_KERNEL_DOCTESTS=y

-- 
2.48.1

