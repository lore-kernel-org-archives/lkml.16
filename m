Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223A241693;
	Thu, 24 Apr 2025 10:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491132; cv=none; b=Fyy52nYASEXkf8etqXMLByQ6Tg3xBag+Dzgc1WODSYC12R4PcFYRxLNvHLZmjjIwmzOpW0raoW1GRZ9cLJYNKp/ELom16944IIfIvC2N37cGKgMF6DSPTHXJDAFHVkitT6htOaKsfdlcmlq7QglBlXYhnIxJlrEif2hPUW8HUbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491132; c=relaxed/simple;
	bh=TfTzeexRkea+W22p9PrysDEUq3BRt9kb/rMQRSTwMW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+ISAQ3zbiNKoilshiPTxhUG4AsEMzjZr/vJLmP68isctAM5TrZdtbdUpXTzD56y8vwK9DuGwr2eUL0xmDR+njCy/HekIRaXBERxQsebz1JEr07CQwnMsSuMUjgvvxqcv+wqBIAHqcd7wjM9jqqV9h5P9GOF2GtdzQdg9Z0H06k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYDxu6af; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYDxu6af"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-476977848c4so10721421cf.1;
        Thu, 24 Apr 2025 03:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491128; x=1746095928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f626Zq4sA1x5u4WIxeymx2qYBo02OEBs1+dVlap/P9o=;
        b=mYDxu6afYqpvn5jqoVWXHE7UKZux3meEUCy8GBli/HdWCbQ2i0LyPgO2T9BDhZZxQ4
         XRZqIHMWQrtJfYymNrYfiyojnzY6NbklD95yzkzyF/Tw+RHrVOPOk3hab7raRmFLyaQ7
         KhK7Z4zN+3N8jS7JrFJRMPBsZynhT3YWy1JCeeFUu5kb9fvecNr5ba/bSRL9MAqLrS8W
         pNNft+uwvY6f8nqmTjB9e7GSiGU+If+Wh0cvm48PDtHAt6gkruYQtFeODFU76u1Zd+O3
         RyTMVHZz0ORW8fRIG4l5KX0CAWOhbCPgBPhpMV8VCu5mDM5DOrMFUJIUYVF6vn8iiHeu
         XEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491128; x=1746095928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f626Zq4sA1x5u4WIxeymx2qYBo02OEBs1+dVlap/P9o=;
        b=Yo6F59TO8oFs7qPo5HdvfC1DIbaDGYJevTARJKLhLICk7ZK0u9NvUStlKBSpoqq3sM
         o18q3KQWzXJZBuyJ/qF4fs6+PHF0DKj2E3BFj/S1ZAZ3HCWSd45/jdtis3wIdwZSpwYR
         esak6Gr/XiBGWMxVjesIi/OwwJXUZ3R/4/UUkDpicDHPN1CRdgIGevGE/6Azioxq8D12
         maHlZhWRCzlp+fkzfxWGxxIgu5qx5Uje3zXXP0pqBf20QA/lKkQ+PQDBmkB/SWX+m7zr
         MHSZ7TziAwT9kKs/L0hj5UCizoIbIvgXLPt+WT9SS7+if0xaHLyi7MF4OZ1bJTYpf8mH
         CGYA==
X-Forwarded-Encrypted: i=1; AJvYcCWxUaVHDyt/9koFiv6r0/bFr59IZewbyFNC2G5mC7XrEVL+NjIPwiXWTJWjNymq+qu1HAZUDjJkle1N8Y4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy36ayU5RHGAJsklGhm1J/6aIEDTLE7k9AovfQ0wl5uN3GEGE22
	g3BfWUelDMqoFGADX0TVxnJqXcIFTBWG3jVsONZrROzn2tjyMMTr
X-Gm-Gg: ASbGncurf0WhcYnelzzwL+1f3DE+sHKwrKQSfAVBuhQHOyovJdDxDLXgHA76W+0pkhJ
	MZC8w/8HAgVWJGAyCI6mZR4gtFnvMpqKu1AFZAVAJCgLGDE1TJ2JGUeezd8GXaG/peQn708m57i
	FwgYJijM0xcVQd+sWL0JPSIydJYpG0GvayRttuBcGUddzIaW8/AvgUwgFYyW/aTyQW4YPQz0N0B
	lSqUTVMlIX1gBqfloM9ozMsokBRvTE2m1JfSkRQpbaR0CVt9UgYfoMNgd96/4Rq5WGwJXvU2OIM
	bjnIBySUO3HyZYAtzoca5AGLiTkYOh6eoOERj9YLI/+lRz9FpSOWZWS4qgKJ/KMaxfX/RDPmCN0
	dIGM=
X-Google-Smtp-Source: AGHT+IHtkwn3++A75SlOwbdMJloQJtQTjKGgkfWI+4V5/ua/xt13pEbwzwYBABeDdAIQ3j26IE4FMw==
X-Received: by 2002:ad4:5ec6:0:b0:6ed:cea:f63c with SMTP id 6a1803df08f44-6f4bfbc77f3mr34544906d6.6.1745491128414;
        Thu, 24 Apr 2025 03:38:48 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:47 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:34 -0400
Subject: [PATCH v6 06/13] scripts: generate_rust_analyzer.py: add type
 hints
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-6-40e67fe5c38a@gmail.com>
References: <20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com>
In-Reply-To: <20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
 Tamir Duberstein <tamird@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15-dev

Python type hints allow static analysis tools like mypy to detect type
errors during development, improving the developer experience.

Python type hints have been present in the kernel since 2019 at the
latest; see commit 6ebf5866f2e8 ("kunit: tool: add Python wrappers for
running KUnit tests").

Add a subclass of `argparse.Namespace` to get type checking on the CLI
arguments. Move parsing of `cfg` out of `generate_crates` to reduce the
number of variables in scope with `cfg` in their name. Use a defaultdict
to avoid `.get("key", [])`.

Run `mypy --strict scripts/generate_rust_analyzer.py --python-version
3.8` to verify. Note that `mypy` no longer supports python < 3.8.

Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 163 +++++++++++++++++++++++++-------------
 1 file changed, 106 insertions(+), 57 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index a7f94f3be93e..6fa4cec0e506 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -10,16 +10,48 @@ import os
 import pathlib
 import subprocess
 import sys
+from collections import defaultdict
+from typing import DefaultDict, Dict, Iterable, List, Literal, Optional, TypedDict
 
-def args_crates_cfgs(cfgs):
-    crates_cfgs = {}
-    for cfg in cfgs:
-        crate, vals = cfg.split("=", 1)
-        crates_cfgs[crate] = vals.replace("--cfg", "").split()
 
-    return crates_cfgs
+class Dependency(TypedDict):
+    crate: int
+    name: str
 
-def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
+
+class Source(TypedDict):
+    include_dirs: List[str]
+    exclude_dirs: List[str]
+
+
+class Crate(TypedDict):
+    display_name: str
+    root_module: str
+    is_workspace_member: bool
+    deps: List[Dependency]
+    cfg: List[str]
+    edition: Literal["2021"]
+    env: Dict[str, str]
+
+
+# `NotRequired` fields on `Crate` would be better but `NotRequired` was added in 3.11.
+class ProcMacroCrate(Crate):
+    is_proc_macro: Literal[True]
+    proc_macro_dylib_path: Optional[str]  # `pathlib.Path` is not JSON serializable.
+
+
+# `NotRequired` fields on `Crate` would be better but `NotRequired` was added in 3.11.
+class CrateWithGenerated(Crate):
+    source: Optional[Source]
+
+
+def generate_crates(
+    srctree: pathlib.Path,
+    objtree: pathlib.Path,
+    sysroot_src: pathlib.Path,
+    external_src: pathlib.Path,
+    crates_cfgs: DefaultDict[str, List[str]],
+) -> List[Crate]:
     # Generate the configuration list.
     cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
@@ -31,17 +63,16 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     # Now fill the crates list -- dependencies need to come first.
     #
     # Avoid O(n^2) iterations by keeping a map of indexes.
-    crates = []
-    crates_indexes = {}
-    crates_cfgs = args_crates_cfgs(cfgs)
+    crates: List[Crate] = []
+    crates_indexes: Dict[str, int] = {}
 
     def build_crate(
-        display_name,
-        root_module,
-        deps,
-        cfg=[],
-        is_workspace_member=True,
-    ):
+        display_name: str,
+        root_module: pathlib.Path,
+        deps: List[str],
+        cfg: List[str] = [],
+        is_workspace_member: bool = True,
+    ) -> Crate:
         return {
             "display_name": display_name,
             "root_module": str(root_module),
@@ -51,36 +82,30 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
             "edition": "2021",
             "env": {
                 "RUST_MODFILE": "This is only for rust-analyzer"
-            }
+            },
         }
 
-    def register_crate(crate):
+    def register_crate(crate: Crate) -> None:
         crates_indexes[crate["display_name"]] = len(crates)
         crates.append(crate)
 
     def append_crate(
-        display_name,
-        root_module,
-        deps,
-        cfg=[],
-        is_workspace_member=True,
-    ):
+        display_name: str,
+        root_module: pathlib.Path,
+        deps: List[str],
+        cfg: List[str] = [],
+        is_workspace_member: bool = True,
+    ) -> None:
         register_crate(
-            build_crate(
-                display_name,
-                root_module,
-                deps,
-                cfg,
-                is_workspace_member,
-            )
+            build_crate(display_name, root_module, deps, cfg, is_workspace_member)
         )
 
     def append_proc_macro_crate(
-        display_name,
-        root_module,
-        deps,
-        cfg=[],
-    ):
+        display_name: str,
+        root_module: pathlib.Path,
+        deps: List[str],
+        cfg: List[str] = [],
+    ) -> None:
         crate = build_crate(display_name, root_module, deps, cfg)
         proc_macro_dylib_name = (
             subprocess.check_output(
@@ -99,7 +124,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
             .decode("utf-8")
             .strip()
         )
-        proc_macro_crate = {
+        proc_macro_crate: ProcMacroCrate = {
             **crate,
             "is_proc_macro": True,
             "proc_macro_dylib_path": f"{objtree}/rust/{proc_macro_dylib_name}",
@@ -107,10 +132,10 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         register_crate(proc_macro_crate)
 
     def append_sysroot_crate(
-        display_name,
-        deps,
-        cfg=[],
-    ):
+        display_name: str,
+        deps: List[str],
+        cfg: List[str] = [],
+    ) -> None:
         append_crate(
             display_name,
             sysroot_src / display_name / "src" / "lib.rs",
@@ -122,7 +147,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
     # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
     # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []))
+    append_sysroot_crate("core", [], cfg=crates_cfgs["core"])
     append_sysroot_crate("alloc", ["core"])
     append_sysroot_crate("std", ["alloc", "core"])
     append_sysroot_crate("proc_macro", ["core", "std"])
@@ -166,9 +191,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     )
 
     def append_crate_with_generated(
-        display_name,
-        deps,
-    ):
+        display_name: str,
+        deps: List[str],
+    ) -> None:
         crate = build_crate(
             display_name,
             srctree / "rust" / display_name / "lib.rs",
@@ -176,20 +201,23 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
             cfg=cfg,
         )
         crate["env"]["OBJTREE"] = str(objtree.resolve(True))
-        crate["source"] = {
-            "include_dirs": [
-                str(srctree / "rust" / display_name),
-                str(objtree / "rust")
-            ],
-            "exclude_dirs": [],
+        crate_with_generated: CrateWithGenerated = {
+            **crate,
+            "source": {
+                "include_dirs": [
+                    str(srctree / "rust" / display_name),
+                    str(objtree / "rust")
+                ],
+                "exclude_dirs": [],
+            }
         }
-        register_crate(crate)
+        register_crate(crate_with_generated)
 
     append_crate_with_generated("bindings", ["core", "ffi"])
     append_crate_with_generated("uapi", ["core", "ffi"])
     append_crate_with_generated("kernel", ["core", "macros", "build_error", "pin_init", "ffi", "bindings", "uapi"])
 
-    def is_root_crate(build_file, target):
+    def is_root_crate(build_file: pathlib.Path, target: str) -> bool:
         try:
             return f"{target}.o" in open(build_file).read()
         except FileNotFoundError:
@@ -198,7 +226,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
-    extra_dirs = map(lambda dir: srctree / dir, ("samples", "drivers"))
+    extra_dirs: Iterable[pathlib.Path] = (srctree / dir for dir in ("rust", "drivers"))
     if external_src is not None:
         extra_dirs = [external_src]
     for folder in extra_dirs:
@@ -222,7 +250,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     return crates
 
 
-def main():
+def main() -> None:
     parser = argparse.ArgumentParser()
     parser.add_argument("--verbose", "-v", action="store_true")
     parser.add_argument("--cfgs", action="append", default=[])
@@ -231,7 +259,17 @@ def main():
     parser.add_argument("sysroot", type=pathlib.Path)
     parser.add_argument("sysroot_src", type=pathlib.Path)
     parser.add_argument("exttree", type=pathlib.Path, nargs="?")
-    args = parser.parse_args()
+
+    class Args(argparse.Namespace):
+        verbose: bool
+        cfgs: List[str]
+        srctree: pathlib.Path
+        objtree: pathlib.Path
+        sysroot: pathlib.Path
+        sysroot_src: pathlib.Path
+        exttree: pathlib.Path
+
+    args = parser.parse_args(namespace=Args())
 
     logging.basicConfig(
         format="[%(asctime)s] [%(levelname)s] %(message)s",
@@ -241,8 +279,19 @@ def main():
     # Making sure that the `sysroot` and `sysroot_src` belong to the same toolchain.
     assert args.sysroot in args.sysroot_src.parents
 
+    crates_cfg = {
+        crate: vals.lstrip("--cfg").split()
+        for crate, _, vals in (cfg.partition("=") for cfg in args.cfgs)
+    }
+
     rust_project = {
-        "crates": generate_crates(args.srctree, args.objtree, args.sysroot_src, args.exttree, args.cfgs),
+        "crates": generate_crates(
+            args.srctree,
+            args.objtree,
+            args.sysroot_src,
+            args.exttree,
+            defaultdict(list, crates_cfg),
+        ),
         "sysroot": str(args.sysroot),
     }
 

-- 
2.49.0

