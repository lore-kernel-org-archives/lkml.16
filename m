Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A9D250C0F;
	Thu, 24 Apr 2025 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491140; cv=none; b=A2h0qSfK0WihoVisTs9Z6BC/9QG0BZShaeYGVC/SPShalf4k2M8wwJ2C7UII+1bu7cN6YMTcrPgFNabIuVi/mRWTtpZ6qx3ye3TLvdJxeDEn51Wy5FxbbsyKkMyiyRV0LzMzZ6DvLjSV82FxuqR9sN/a0U0TLHxlrSz6Ic539FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491140; c=relaxed/simple;
	bh=vb/Y1WPcRIFzcKKh8eXsMqlHpcEVUquwhPRSt3dwe+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V8ODttzcKy3d04lvJxTSSx7mGeJI7ueKoPY9aP6VkCeguLjuDcnsvho3JRx4z+coS1OwXCCizGvKLPCB9kBii+mUlnwo1vv9WJ/QAY2pLm5K15JUG1FB5B6ILy8yBFezMDkaw/8qXr8/Mgk2FS+BoEj5D+PrX44AZlfvnzvAg+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFmocueR; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFmocueR"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f2b05f87bcso9068556d6.3;
        Thu, 24 Apr 2025 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491138; x=1746095938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/YKXEJoV+1VeboMX3tB+oSLUb3sYIKbV0Cc5xFdHfM=;
        b=YFmocueRQJo6ZGAnj8Q2meXTl41eYTSJTDfceLs98eGyMpuE3rT6u87QciRDVmL22y
         BOuoAor9+Bvv7hOYCz2LPZQLZS4w5URRKhTatX5ziI6c9bwboJvjKr0C8ixRNYdV88UX
         0cvwFC2StzmL92Y/LrqNXzFYi7dppwD1Xlo/AvDMU909Q+HPhAK67ATRl8l13EBAzSUX
         e/kKgbT2ecpCiTadi7SACRT9//YNhFp6FKeLiPw4dat3N2iG7Ci0Vcl0LCLlI/nq/LVg
         R9nWrY5VM9gMnlNvHQrClo7vdr8PIdwF7SAHBn+bGEPgwwRyQJxE/en4n2wjfA8pgzMQ
         HnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491138; x=1746095938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/YKXEJoV+1VeboMX3tB+oSLUb3sYIKbV0Cc5xFdHfM=;
        b=jFmcmugzh4w/dvLpA9mPXVzzmWN57lUjKECt9l+ync+EQ2K6BbN7mLCeISqAzoFTMm
         hO36ZFbxNWreQYNe6/9udplKL2L0/yzWSdrIeGghODaZY5wkDilLPdJx2aSxNt5BQWmr
         7zxYjx5Ec9aYF64Mn5mmyzKH8HiH0MvcRN3Rk1ID8lU8bOH7lJk7mFpdmrAdjEeCDjTW
         a9AYNxSyqQc2qZHSR07fkbQjWlQ4FfUQgU12EFiK0f029dX5yDaOwr08rLT/5NNrLY3r
         Sjt9q6OerefUggEehVBPS00ulRWAwEkAcRCIQc3VjVFfif4Sfas9jQGa6JWe2+T6ETkR
         +o6g==
X-Forwarded-Encrypted: i=1; AJvYcCVMFW98WaHhDbRwLlnmZmDo4+PpiOvIWZvrE5nlrb0LWXdnXmcBQZLFMUYw4+s0VrJDlmlOwAnUAFDjPpo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Rly1UpTkI71he86lkQnNdMc0s/JmBhNoVuS8ExeD3LYI5z4l
	ZbcrcAe5lRFiIPZ60x1r+v+Le2TvzyqJ8RuJHKVBCMG0ixpIQf+R
X-Gm-Gg: ASbGncuZe4u1EWSmwdnc+MUbE8OWemgTZEXTkEGwhp2WbAvsRqz424bsDS0D6/IM7u9
	71+yFYIFhgfvb7FFceerdkWslM7nw61nD/7SeYjTQ+YBzL0WztvQPdBcZMv+sp1rZtJJPndByzF
	+x/lehanS+Ujs7LD4YgrujgMpLzOvKvob+KLaA8BnnUr+DZImcyOxb9HZolv4/BXkYBEVvMSFAd
	aSSLDu0XPwt/vjKPXxYcIVW70Y6QP07+37fOBFScLpLd1cUbQlKypaO94ukGNb13mEnZoLgQxPy
	5Wg4rC42NqW/DN9+vRnDjaDtaA38icPAkzNBKEP5FJlGzL+b5814XR2pSG28fDvtb/NZ
X-Google-Smtp-Source: AGHT+IFyr1lR5Aaxnk8b2UR/CjVLWvciuCLKxWmzZ7BJI+Cd4BqXHMgauLrlX0jQboQfIcYAn09e6A==
X-Received: by 2002:ad4:5ec6:0:b0:6ed:cea:f63c with SMTP id 6a1803df08f44-6f4bfbc77f3mr34552286d6.6.1745491137794;
        Thu, 24 Apr 2025 03:38:57 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:57 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 24 Apr 2025 06:38:41 -0400
Subject: [PATCH v6 13/13] scripts: generate_rust_analyzer.py: use
 `cfg_groups`
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rust-analyzer-host-v6-13-40e67fe5c38a@gmail.com>
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

Declare common `cfg`s just once to reduce the size of rust-analyzer.json
from 30619 to 2624 lines.

Link: https://github.com/rust-lang/rust-analyzer/commit/2607c09fddef36da0d6f0a84625db5e20a5ebde3
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Trevor Gross <tmgross@umich.edu>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 scripts/generate_rust_analyzer.py | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 5f04e3785854..aa79b56ff6f4 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -29,6 +29,7 @@ class Crate(TypedDict):
     root_module: str
     is_workspace_member: bool
     deps: List[Dependency]
+    cfg_groups: List[str]
     cfg: List[str]
     edition: Literal["2021"]
     env: Dict[str, str]
@@ -51,15 +52,8 @@ def generate_crates(
     sysroot_src: pathlib.Path,
     external_src: pathlib.Path,
     crates_cfgs: DefaultDict[str, List[str]],
+    cfg_groups: List[str],
 ) -> List[Crate]:
-    # Generate the configuration list.
-    cfg = []
-    with open(objtree / "include" / "generated" / "rustc_cfg") as fd:
-        for line in fd:
-            line = line.replace("--cfg=", "")
-            line = line.replace("\n", "")
-            cfg.append(line)
-
     # Now fill the crates list.
     crates: List[Crate] = []
 
@@ -76,6 +70,9 @@ def generate_crates(
             "root_module": str(root_module),
             "is_workspace_member": is_workspace_member,
             "deps": deps,
+            # `cfg_groups` contain the configs generated by the kernel build system; upstream
+            # (sysroot) crates are not aware of them.
+            "cfg_groups": cfg_groups if is_workspace_member else [],
             "cfg": cfg,
             "edition": "2021",
             "env": {
@@ -298,7 +295,7 @@ def generate_crates(
                 name,
                 path,
                 deps=[core, kernel],
-                cfg=cfg,
+                cfg=[],
             )
 
     return crates
@@ -338,6 +335,10 @@ def main() -> None:
         for crate, _, vals in (cfg.partition("=") for cfg in args.cfgs)
     }
 
+    # Generate the configuration list.
+    with open(args.objtree / "include" / "generated" / "rustc_cfg") as fd:
+        cfg_groups = {"rustc_cfg": [line.lstrip("--cfg=").rstrip("\n") for line in fd]}
+
     rust_project = {
         "crates": generate_crates(
             args.srctree,
@@ -345,8 +346,10 @@ def main() -> None:
             args.sysroot_src,
             args.exttree,
             defaultdict(list, crates_cfg),
+            list(cfg_groups.keys()),
         ),
         "sysroot": str(args.sysroot),
+        "cfg_groups": cfg_groups,
     }
 
     json.dump(rust_project, sys.stdout, sort_keys=True, indent=4)

-- 
2.49.0

