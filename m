Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D74280CE8;
	Tue, 20 May 2025 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747768997; cv=none; b=XEsDxSvxYpmd1Wmh4k/c7ZE43KZ6keGKHK9F+nEC47QrWMF+6edx0UAvUREy6YTWAY7W4c8fl/hz/o0uN3HTPrrmdgDA9oARsrrHzpOFoJEUJqh8WcYWtJsXyExieczHAqit2N1M3prxDuuxYPGP0JH7aZhdY/EgojWXu9vlsxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747768997; c=relaxed/simple;
	bh=mWS8KyyQ1PrF5TtrhvCz26jkaL0hL04kQglXSaVrpKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ol0XfeijF2nQPwvnynevHW/8lcnuvW4bD2MxEQaFjhtzj1RmfLcxgYa8tCfYaGc4pLiyPOsl17uFkXHkdjzfXceEboIJNCxSYyjBOCsPGRxWzxcPZ9Jbds1wfsxJ3RTLjpj9GGV+4Y58txwhkdanFv7VrHjMA2kQhAetYAuJODI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRk7sSb+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRk7sSb+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA086C4CEED;
	Tue, 20 May 2025 19:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747768994;
	bh=mWS8KyyQ1PrF5TtrhvCz26jkaL0hL04kQglXSaVrpKc=;
	h=From:To:Cc:Subject:Date:From;
	b=rRk7sSb+b7gp8RVPGRoDTUY55IiYJIPiPnguzBORLNmiPN/Pgo6hC2XBXh/NZIFH8
	 8XPmuMd9dT7yyBc4IZ2x3EnJg0H+fualA4Ol/N1QbW1zNvLJuFxJDyR+czinsbBOa1
	 28vU++sEdSsxM56KmDN2vMaP2nFxkVuaIpezb1RXx1xM/3g9qdjd6ZG279YUjlCjtg
	 NcDNqUbBXm4GMCcEwHIDPvQC3NePkhYk79JJAdqgBFNaSu894bo0AEuXs+Tvyq5wf1
	 thVBI+G4B4hvJTjv5N3hQdA2psMtvNk9xIrK0NGL8Gons5AewruxhQfswtSjoNBcth
	 GEqhwqxgmDo0w==
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
	Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>,
	Benno Lossin <lossin@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: add `pin-init` as a dependency to `bindings` and `uapi`
Date: Tue, 20 May 2025 21:23:05 +0200
Message-ID: <20250520192307.259142-1-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows `bindings` and `uapi` to implement `Zeroable` and use other
items from pin-init.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..1bee11ad5452 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -513,17 +513,19 @@ $(obj)/ffi.o: private skip_gendwarfksyms = 1
 $(obj)/ffi.o: $(src)/ffi.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
-$(obj)/bindings.o: private rustc_target_flags = --extern ffi
+$(obj)/bindings.o: private rustc_target_flags = --extern ffi --extern pin_init
 $(obj)/bindings.o: $(src)/bindings/lib.rs \
     $(obj)/ffi.o \
+    $(obj)/pin_init.o \
     $(obj)/bindings/bindings_generated.rs \
     $(obj)/bindings/bindings_helpers_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 
-$(obj)/uapi.o: private rustc_target_flags = --extern ffi
+$(obj)/uapi.o: private rustc_target_flags = --extern ffi --extern pin_init
 $(obj)/uapi.o: private skip_gendwarfksyms = 1
 $(obj)/uapi.o: $(src)/uapi/lib.rs \
     $(obj)/ffi.o \
+    $(obj)/pin_init.o \
     $(obj)/uapi/uapi_generated.rs FORCE
 	+$(call if_changed_rule,rustc_library)
 

base-commit: 22c3335c5dcd33063fe1894676a3a6ff1008d506
-- 
2.49.0

