Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D716A241C85;
	Sun,  9 Feb 2025 21:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739135106; cv=none; b=RPc2HUOnDQ/uNKzXI5UmbTaaiYMToJ1atRkS8kibJST/bGlhWpRDUs1s2LSAnMJuQeGw2nnrR+tXp6UgD3JKE9sN9BJ8Iok0Jhde+izobUUJbf/AcbLiK2I0EfudV1OkTkfjQhjKCOhim0SoSf7FzNnOdlUUmOU+2SUnNQHzDy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739135106; c=relaxed/simple;
	bh=FRjp3B0gA0PKWMi2B4e32Nxjc9e32/N2gbKa+Jjb4xQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EKWxXIA1nZ+xHH7Bl+8c5i94VuAnlohM6ZvXDFuxixeJnAryPfMpMrnnfswescmPvNaGa22TSyTiDPL+XI1+2+Z38Ur8MQncYyxknkeoIANIbb7KrNgDX9MxsLBx8gIK69NkYlQxdUEc0L/Ec7+PgElct+IsB/0csDjkH1tWJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGAVSiaz; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGAVSiaz"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e43c9c8d08so34749966d6.3;
        Sun, 09 Feb 2025 13:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739135104; x=1739739904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFQ0ho6VbBrY2Rzr+NCGRpkume1oxn7BRMZvKM8hxxc=;
        b=aGAVSiazUaGbPE2IHJ4AFsZ3AfOafZe2lXPXUEqDl2KmReLHArbC5E2EbGY+82xxpV
         6azaTdsvmQfDeQMyyaSm5awRG4l3fdpAQze0z4PaMs74jz9+K08qUDleu/nm5K2uRlYd
         a48yT+ORrur+ZnFQGPkAcI2ImXh2fi+68yHblleH/uKA4gfYAHBm+1Q8o4lNvvgxd105
         +n1RaR4ymCchcq6Il30s6sgH6djo9RIdkc8/YX9h7kBZYgSeAN+Qb4d7ZUENnxBzLAqS
         3pj+KWLvsS2lpqt/PVPHWlhL7V1HoQOlLIaSXB7+VC+A/plAHe9F9aF2H9882L2bei5N
         VhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739135104; x=1739739904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RFQ0ho6VbBrY2Rzr+NCGRpkume1oxn7BRMZvKM8hxxc=;
        b=jH+Ssan7E/wj2dsPQX4dqCdqXKA3AuQgX3kKF1azNd5vrIiFU/+jCLb5aexbfdqfFX
         SG8BdpiuUg/+Xb02pmeBGBjHIVNLDZY/mDj7e7x9THnKfjoSgVJA9L22/L+TQ2dF4WM6
         bBj2yZXA7Sa/8BxE/Q7GJ6iw/QIMuzG7RSdWMhiAq7YTYcefWNJWdx1A1NIjdD1fgWnN
         S3ZmwJO1ZxjxUXoefzsF+kLvjvYg8c9bKTuqVhTxLmwIJovC17K++I2ledGktzKNv4rB
         cjaozMTgeomZeVve+hpmqgj/8TpEf3OuBYUSOV79WmRqffG5fAL58OcRaHoS+LB3GdU4
         nSCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNNKi4PUuiqdVEpMotBFGvCdppNzvYFlwD9Tg5oGnSmlVeOzi2xKiuMcCl6WjZtFQ3ge86oxp/1IaBODo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfFftAfMnEbJ23ldGS6GbmLi8wz9Rlt/O9y76L/IpaAUAFvqYf
	eq5WPfTkvkOs2AtqGGyFnWIBOn+XAnJrTavI77pnA15SN5K7rGnlvkHT/Ulw
X-Gm-Gg: ASbGncuwk0uZG7NLe/jXrIie9oEvi5CSlNkw0lRv0uXXrdY+ZdBqNdi/xtRb14tDYr4
	tWA1WO8yrrlqyfwn16epJ0PmmrYcoTo/z8NsUu0OE844ut5piCJXKGpyhUOBbQP5kIDCwRhQ40y
	4usWMCehIYmWOysSFQPjYp5rRVYSytWNE+C8uxiOW0Njzeo3jDMRQclNM5ndzElTfFtRr7fu3zw
	gj/o2F+hAeCHhUsgDLv3TetVYHi9bPceA56fiSbtHeUU8s/ZvJr9AE3Uwjn6Up8f5Mt2xFl1zSU
	TLwbS6W02SUYvdLNg39aXGtEpxm4pObyNrPUkC0=
X-Google-Smtp-Source: AGHT+IEexLu2nwKencVozCQfn+x27EPm3zwA+kxCgIAilxw9gbhWKPm7tYkiYjOA959zEtk+KGf2Ig==
X-Received: by 2002:ad4:5f89:0:b0:6e4:3cf1:5621 with SMTP id 6a1803df08f44-6e4455e883emr166987456d6.12.1739135103633;
        Sun, 09 Feb 2025 13:05:03 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:15f6:96e9:3308:934a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44d545327sm24915476d6.33.2025.02.09.13.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 13:05:02 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sun, 09 Feb 2025 16:04:46 -0500
Subject: [PATCH 1/3] scripts: generate_rust_analyzer.py: add type hints
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-rust-analyzer-host-v1-1-a2286a2a2fa3@gmail.com>
References: <20250209-rust-analyzer-host-v1-0-a2286a2a2fa3@gmail.com>
In-Reply-To: <20250209-rust-analyzer-host-v1-0-a2286a2a2fa3@gmail.com>
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
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Python type hints allow static analysis tools like mypy to detect type
errors during development, improving the developer experience.

Python type hints have been present in the kernel since 2019 at the
latest; see commit 6ebf5866f2e8 ("kunit: tool: add Python wrappers for
running KUnit tests").

Run `uv tool run mypy --strict scripts/generate_rust_analyzer.py` to
verify.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 83 ++++++++++++++++++++++++++++-----------
 1 file changed, 61 insertions(+), 22 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index aa8ea1a4dbe5..28ab05de52b8 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -10,8 +10,9 @@ import os
 import pathlib
 import subprocess
 import sys
+import typing as T
 
-def args_crates_cfgs(cfgs):
+def args_crates_cfgs(cfgs: T.Iterable[str]) -> dict[str, list[str]]:
     crates_cfgs = {}
     for cfg in cfgs:
         crate, vals = cfg.split("=", 1)
@@ -19,7 +20,34 @@ def args_crates_cfgs(cfgs):
 
     return crates_cfgs
 
-def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
+class Dependency(T.TypedDict):
+    crate: int
+    name: str
+
+class Source(T.TypedDict):
+    include_dirs: list[str]
+    exclude_dirs: list[str]
+
+class Crate(T.TypedDict):
+    display_name: str
+    root_module: str
+    is_workspace_member: bool
+    is_proc_macro: bool
+    deps: list[Dependency]
+    cfg: list[str]
+    edition: T.Literal["2021"]
+    env: dict[str, str]
+    # `NotRequired` would be better but was added in 3.11.
+    proc_macro_dylib_path: T.Optional[str]
+    source: T.Optional[Source]
+
+def generate_crates(
+    srctree: pathlib.Path,
+    objtree: pathlib.Path,
+    sysroot_src: pathlib.Path,
+    external_src: pathlib.Path,
+    cfgs: list[str],
+) -> list[Crate]:
     # Generate the configuration list.
     cfg = []
     with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
@@ -31,31 +59,40 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     # Now fill the crates list -- dependencies need to come first.
     #
     # Avoid O(n^2) iterations by keeping a map of indexes.
-    crates = []
-    crates_indexes = {}
+    crates: list[Crate] = []
+    crates_indexes: dict[str, int] = {}
     crates_cfgs = args_crates_cfgs(cfgs)
 
-    def append_crate(display_name, root_module, deps, cfg=[], is_workspace_member=True, is_proc_macro=False):
-        crate = {
-            "display_name": display_name,
-            "root_module": str(root_module),
-            "is_workspace_member": is_workspace_member,
-            "is_proc_macro": is_proc_macro,
-            "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
-            "cfg": cfg,
-            "edition": "2021",
-            "env": {
-                "RUST_MODFILE": "This is only for rust-analyzer"
-            }
-        }
+    def append_crate(
+        display_name: str,
+        root_module: pathlib.Path,
+        deps: list[str],
+        cfg: list[str] = [],
+        is_workspace_member: bool = True,
+        is_proc_macro: bool = False,
+    ) -> None:
+        proc_macro_dylib_path = None
         if is_proc_macro:
             proc_macro_dylib_name = subprocess.check_output(
                 [os.environ["RUSTC"], "--print", "file-names", "--crate-name", display_name, "--crate-type", "proc-macro", "-"],
                 stdin=subprocess.DEVNULL,
             ).decode('utf-8').strip()
-            crate["proc_macro_dylib_path"] = f"{objtree}/rust/{proc_macro_dylib_name}"
+            proc_macro_dylib_path = f"{objtree}/rust/{proc_macro_dylib_name}"
         crates_indexes[display_name] = len(crates)
-        crates.append(crate)
+        crates.append(
+            {
+                "display_name": display_name,
+                "root_module": str(root_module),
+                "is_workspace_member": is_workspace_member,
+                "is_proc_macro": is_proc_macro,
+                "deps": [{"crate": crates_indexes[dep], "name": dep} for dep in deps],
+                "cfg": cfg,
+                "edition": "2021",
+                "env": {"RUST_MODFILE": "This is only for rust-analyzer"},
+                "proc_macro_dylib_path": proc_macro_dylib_path,
+                "source": None,
+            }
+        )
 
     # First, the ones in `rust/` since they are a bit special.
     append_crate(
@@ -107,7 +144,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
         "exclude_dirs": [],
     }
 
-    def is_root_crate(build_file, target):
+    def is_root_crate(build_file: pathlib.Path, target: str) -> bool:
         try:
             return f"{target}.o" in open(build_file).read()
         except FileNotFoundError:
@@ -116,7 +153,9 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
     # Then, the rest outside of `rust/`.
     #
     # We explicitly mention the top-level folders we want to cover.
-    extra_dirs = map(lambda dir: srctree / dir, ("samples", "drivers"))
+    extra_dirs: T.Iterable[pathlib.Path] = map(
+        lambda dir: srctree / dir, ("samples", "drivers")
+    )
     if external_src is not None:
         extra_dirs = [external_src]
     for folder in extra_dirs:
@@ -139,7 +178,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs):
 
     return crates
 
-def main():
+def main() -> None:
     parser = argparse.ArgumentParser()
     parser.add_argument('--verbose', '-v', action='store_true')
     parser.add_argument('--cfgs', action='append', default=[])

-- 
2.48.1

