Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31DE297A46;
	Fri, 23 May 2025 14:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011932; cv=none; b=i82L/BChaNvG8Ne3uAlemcpz4fwHHcdW1eq/AfD+rj1RcTpgq79n5ix6IQCdIMxY29hJJEn9mKm+f94CINbK37n94/4qvjFrdYZrQ2FQczwqEIykBmW+x0w5Y4Gtl1P+Wcqr51xoY5mtMSTcVu3xALEeCUWOCpNY/rDxuQuyny4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011932; c=relaxed/simple;
	bh=9SnhNkgZxHMQ5g6HjXgwOZSujdCME27mBkxlwAlRLKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bnYV2v3pgxl+NNwIc+/9gXiOeLxTjf9JlcBsmI8k63uwcYuXWHtbr+osA0s91cBqUgg6Ey/apBeb1WKhCFzS/ZW8eqHn3ZsQri/p6/4GbRV6OVMDalA+GJK21+E7SkSySgrmxdclUD+Oi2q0YJtQL5ktmIWs2hdr6dmzSTdE3Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7iS6qZs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7iS6qZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CAFC4CEE9;
	Fri, 23 May 2025 14:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011932;
	bh=9SnhNkgZxHMQ5g6HjXgwOZSujdCME27mBkxlwAlRLKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z7iS6qZsKbaP/yCqsF5Hblyh8ivwYsMIYlF/N+NKYiVEC7aINlTB4y97V1GGo26cc
	 eakhpmnVQFg9T9yQnNweyJpl+gmC+PWWmGKW+snUtGCN8cawFigS5/av/Zp1gtqhsZ
	 Y2VuXFk+PiRD4suR4WpNiTKrrocmlsv5B6X6Ywbqsk60Yf/FJ4m3Vc9PboHT7k9OW5
	 qpX1823t9ucqWNMjmbAElCfA/ID5UuST6Bj+xQQYLg/bWQalwGs0vXIZvuO8ZgojCy
	 3KNURX9+4bJYZbaEKJCnICHbAUkj66pau+QdmkrNOGdSgJm0NUbfGYD+iGLATbOaCb
	 Rnn/DEWKBfXeA==
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
Cc: Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/13] rust: add `pin-init` as a dependency to `bindings` and `uapi`
Date: Fri, 23 May 2025 16:51:03 +0200
Message-ID: <20250523145125.523275-8-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523145125.523275-1-lossin@kernel.org>
References: <20250523145125.523275-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows `bindings` and `uapi` to implement `Zeroable` and use other
items from pin-init.

Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291565-Help/topic/Zeroable.20trait.20for.20C.20structs/near/510264158
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/Makefile                     | 6 ++++--
 scripts/generate_rust_analyzer.py | 4 ++--
 2 files changed, 6 insertions(+), 4 deletions(-)

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
 
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index fe663dd0c43b..ac1ee1a32495 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -137,8 +137,8 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
             "exclude_dirs": [],
         }
 
-    append_crate_with_generated("bindings", ["core", "ffi"])
-    append_crate_with_generated("uapi", ["core", "ffi"])
+    append_crate_with_generated("bindings", ["core", "ffi", "pin_init"])
+    append_crate_with_generated("uapi", ["core", "ffi", "pin_init"])
     append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "ffi", "bindings", "uapi"])
 
     def is_root_crate(build_file, target):
-- 
2.49.0

