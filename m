Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E91B0434;
	Sat,  8 Feb 2025 13:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739021555; cv=none; b=Oe5f99UijciEAckYOEweQheKE10rasWnvS8Qf8oTSgx3CrixPAh+VYmu4FiJ8jPb/QQBp/Xj3fIxW1w0DYbwhsVwb17uv7w2rSsVrHJNHm4P24/WcXd7co/mbSC+QhlPPv5yN1NZoyF6DrinwtSUf7U0BMDyq7QgBJXw2JUp0FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739021555; c=relaxed/simple;
	bh=hp/QlQLnszYTXmXShP+TaYAd6/NZl+NFs1iWbFohFHI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ym41/NHq29fiokjfdTwzMoP+40JrrL1raVt77SuGVx3E1MC7eimz9xNxJ6iPFfgKnLIPajiEUOcGvP9tu0b2vxo/K5o/HUiJMWMLkkQxFQ8Qq9sw56MALotIS87gk9Uo6LJLtuZSYcSU+MhUX+iKJ5wcFVAgtv5hw9F0ndKZfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=nedYq9wv; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="nedYq9wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1739021543;
	bh=hp/QlQLnszYTXmXShP+TaYAd6/NZl+NFs1iWbFohFHI=;
	h=From:Subject:Date:To:Cc:From;
	b=nedYq9wvVjyXvYbGtNTq7IykiSjVwjwDQR3DCmWdVFJPHBrplMPO924UOU9qCjehx
	 h6m+0fdWzgtZ09f37oIEJyYbnCulq+ZFiEBlAYpLhdRhVYDiyo9a9gmZrBckOOnFUs
	 weP98sx/U4I6g84JmXbIiW+RUbnfmPCRw3J826ys=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] rust: two small improvements for kunit
Date: Sat, 08 Feb 2025 14:31:13 +0100
Message-Id: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKFcp2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwML3aLS4hLd7NK8zBLdlBRjU4NUw0QTM+NkJaCGgqLUtMwKsGHRsbW
 1AFKw9mBcAAAA
X-Change-ID: 20250208-rust-kunit-dd350e1a463c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739021542; l=1659;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hp/QlQLnszYTXmXShP+TaYAd6/NZl+NFs1iWbFohFHI=;
 b=IgP8Mee3WFJPHH1HUqpdpDmGN6N60+iuY2FCyO62LHiCtEiHnFshVBTKBYNxlsYs+eiIliakf
 lQ9v0s83iHGA1hc6Ot4GAkcNkK7AX8Ed6AX1VO8wZSM0MFGQQpiY53m
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Two quality of live improvements for running kunit tests for rust/.
While today there are only the doctests, more are coming [0].

	$ ./tools/testing/kunit/kunit.py run --kunitconfig rust/ 
	[14:25:48] Configuring KUnit Kernel ...
	[14:25:48] Building KUnit Kernel ...
	Populating config with:
	$ make ARCH=um O=.kunit olddefconfig
	Building with:
	$ make all compile_commands.json ARCH=um O=.kunit --jobs=16
	[14:25:53] Starting KUnit Kernel (1/1)...
	[14:25:53] ============================================================
	Running tests with:
	$ .kunit/linux kunit.enable=1 mem=1G console=tty kunit_shutdown=halt
	[14:25:53] =========== rust_doctests_kernel (135 subtests) ============
	[14:25:53] [PASSED] rust_doctest_kernel_alloc_kbox_rs_0

	...

	[14:25:53] [PASSED] rust_doctest_kernel_workqueue_rs_3
	[14:25:53] ============== [PASSED] rust_doctests_kernel ===============
	[14:25:53] ============================================================
	[14:25:53] Testing complete. Ran 135 tests: passed: 135
	[14:25:53] Elapsed time: 5.431s total, 0.001s configuring, 5.314s building, 0.086s running

[0] https://lore.kernel.org/rust-for-linux/20241213081035.2069066-1-davidgow@google.com/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      rust: pass correct target to bindgen on Usermode Linux
      rust: add kunitconfig

 rust/.kunitconfig | 3 +++
 rust/Makefile     | 1 +
 2 files changed, 4 insertions(+)
---
base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
change-id: 20250208-rust-kunit-dd350e1a463c

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

