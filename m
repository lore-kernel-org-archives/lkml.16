Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2DC2135CB;
	Thu, 22 May 2025 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915357; cv=none; b=AuEIOeO0jGpzKnmqNHj4+wOgA0g470jvpa5b+J2qYF8GqJaH2fJ85XDVvI/OzHsljXTfN8bhqXCw5aoyCJDNEhQSn8a4q6tQ3OM7ZmWaqTYY2loV/xAaxkwb9xtHhsWC2VQ6UorkOI8od9n412Atx13SvwIJng6a381jZKDZFaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915357; c=relaxed/simple;
	bh=/vn8DZJJrQxpSvPyCXIYRYluHXY05MJLF9VTkT2YuLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=vEIL7q5CRCo2drTSRjmrD9jT8lf4n+06YoKq1s/kZySCm2fxrDLxMPJhOfuX3ptXCWaT+eQGS0Piy7XM0AS2ibOInC8uKYj1gVtNyNnpBry5EKtwcFHojOxcPGSlA5u0+VEoHnFP+2QRcVIrYyo6kbDkPMs6cOtRYTNpwWgiuSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkPTXyfk; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkPTXyfk"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso7641670b3a.2;
        Thu, 22 May 2025 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747915354; x=1748520154; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Js+VfP2B7Z0Aw6YScxCHyKm02Nvx6oGOp/8rmQrjYsE=;
        b=JkPTXyfkpeF5OxrI90hDu+MDZ67Nz83cvPOOgvY/1EkBq/o6pwMrgU7hP93D7N3pVb
         vbhFurTstS9OJ8x2gD0NIHvB7awKbLQ7NJxlX8oOKQ0T0mVAJV3/wy7gxIBtl7g5swY5
         y6MjOc048mClxh7qFwrsjk8MAYRkrAFjdjdXmP86uYZhjSHwVVm1L4koLYz0BNBrkBF0
         ea22d1uDScgxvw/koIr7o9lTz3dEWCFDPIYRUMPMRvVm+JCLge0ZGU19CLd0ztlkLSRW
         aEoGKfEsbXEnseONrTWNlxDVxZULs2PiO/tMQXSx33/kt+qtlb0rEyBhLqnw0RhOZjJH
         WSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915354; x=1748520154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js+VfP2B7Z0Aw6YScxCHyKm02Nvx6oGOp/8rmQrjYsE=;
        b=Y1SVP14RN35v6H0WEAqDqpxJepDVpADTA5JinX2texqvIFB3a6SrG8ShTADnqlGOiR
         PJD6k6cvWbjfERJIp7ALVYS7TViGWdRUOraUjLA/PdZx+5UfPZX2D7IaCtTcHQWcuz6X
         /HZQmjufej6vtQg8/NYOKb/gURDoVXPsIWBcd679l4KJsoMfDO3aSwVpHAliBDqlRf85
         GKkkDj9q4tpDQuOP7LGScb8xfYME7tIdbyMiT7s1xaZ9A56GKHnDvt8WqGCDXfj6XQfG
         aLEGn38IjvhD3DNNJFwws0Kid+6api1enD5lcHky7FyFXMHb6b9H9xIcEQneaH8FCLhu
         5LOw==
X-Forwarded-Encrypted: i=1; AJvYcCVsxkQik0mGD2iYHjgwC8NFUqPwIQir4yhb5GSv3g11z3GaHIPPaFbXIcnZnuexyytf/g2ltkZlpndour8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBL9vQT9J/PHbuNZHwTEMMbpa/fYM+polme22yRSb9l5j0c83Q
	GuFYUfZI/HrfZdP13hudV0MF7BptfiDVD40alKdpjtvDh6i1W4w4OjjQ
X-Gm-Gg: ASbGncvxogxR3//NaZa+4NVoszT4QjUBAXT4g3mfDAJ5AWkurIZok/8CAHg0lp10JLQ
	Vk8OSUQYu4R1uusE3LI+VWW8k9wZp8CsxXIvVgFH5lMxzyj/Om+EDw71qRKS8UX4XIMB82DSpH7
	Th66yEbZYPMUtGXKh5iZf2WP7eLOLOSk0VsSm/ClKu0Ft2yB0w6hPCKzKsoOYFUYtBtXnQEDgaq
	Q6rEHS8Zlkr+azvtKrEUTUCGetsPzfn6BTm/A40CkwTAh4r7YvaeUKHMTf1xyVJ/08ioifhuLei
	S29+/9G/h+FAGU1skAV1luwfzahSq8P1x0tlhfBepVSBipMDW/1S
X-Google-Smtp-Source: AGHT+IHL8lmwQMoIeewqAqmlRmPfaWEsz3sA9er2qdYUbDlBxZKAUMcpIg2/Hhh0Gm2uwtTFyFkVfA==
X-Received: by 2002:a05:6a21:8cc1:b0:216:1ea0:a516 with SMTP id adf61e73a8af0-21621a0a546mr39814230637.41.1747915354092;
        Thu, 22 May 2025 05:02:34 -0700 (PDT)
Received: from [127.0.1.1] ([2601:644:8500:5dd0:5e58:eb16:57b7:87fc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a987af30sm11038961b3a.156.2025.05.22.05.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:02:33 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Thu, 22 May 2025 05:02:31 -0700
Subject: [PATCH v2] arm: Fix rustgcc unknown argument '-mno-fdpic'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFYSL2gC/4WNQQ6CMBBFr0Jm7Zi2FBFX3sOwKDCFSSwlLRIN6
 d2tXMDle8l/f4dIgSnCrdgh0MaR/ZxBnQroJzOPhDxkBiVUJSolMLziim72aIeFezTBoeU3Nlq
 Y6trZRpcl5PESKOsj/GgzTxxXHz7HzyZ/9m9ykyhRa6prS5dOGXkfneHnufcO2pTSF/E2hL+8A
 AAA
X-Change-ID: 20250520-rust-mno-fdpic-arm-fix-940a58bf9433
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, torvalds@linux-foundation.org, 
 Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Christian Schrrefl <chrisi.schrefl@gmail.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, 
 Rudraksha Gupta <guptarud@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
 anders.roxell@linaro.org, arnd@arndb.de, dan.carpenter@linaro.org, 
 laura.nao@collabora.com, lkft-triage@lists.linaro.org, 
 regressions@lists.linux.dev, Nick Clifton <nickc@redhat.com>, 
 Richard Earnshaw <richard.earnshaw@arm.com>, 
 Ramana Radhakrishnan <ramanara@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Linux Kernel Functional Testing <lkft@linaro.org>
X-Mailer: b4 0.15-dev-8865a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747915351; l=2475;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=/vn8DZJJrQxpSvPyCXIYRYluHXY05MJLF9VTkT2YuLQ=;
 b=coR/zdEQa58AEoBLC80nMQKdtdLpLDptVLzgORI6Pao8YL65d8bAiz1dhRWoZnT7pBD+vubuX
 JaNZHBfjNLmBnc7cWcCagHcM1Hd30mRKdEDdvl+T6f4oE5TXdfemizZ
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Currently rust on arm fails to compile due to '-mno-fdpic'. This flag
disables a GCC feature that we don't want for kernel builds, so let's
skip it as it doesn't apply to Clang.

    UPD     include/generated/asm-offsets.h
    CALL    scripts/checksyscalls.sh
    RUSTC L rust/core.o
    BINDGEN rust/bindings/bindings_generated.rs
    BINDGEN rust/bindings/bindings_helpers_generated.rs
    CC      rust/helpers/helpers.o
    Unable to generate bindings: clang diagnosed error: error: unknown argument: '-mno-fdpic'
    make[2]: *** [rust/Makefile:369: rust/bindings/bindings_helpers_generated.rs] Error 1
    make[2]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
    make[2]: *** Waiting for unfinished jobs....
    Unable to generate bindings: clang diagnosed error: error: unknown argument: '-mno-fdpic'
    make[2]: *** [rust/Makefile:349: rust/bindings/bindings_generated.rs] Error 1
    make[2]: *** Deleting file 'rust/bindings/bindings_generated.rs'
    make[1]: *** [/home/pmos/build/src/linux-next-next-20250521/Makefile:1285: prepare] Error 2
    make: *** [Makefile:248: __sub-make] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com/
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Acked-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v2:
- Fixed patch formatting issues
- Link to v1: https://lore.kernel.org/r/20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..f207ba0ed466 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -273,7 +273,7 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fzero-call-used-regs=% -fno-stack-clash-protection \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
-	-fzero-init-padding-bits=% \
+	-fzero-init-padding-bits=% -mno-fdpic \
 	--param=% --param asan-%
 
 # Derived from `scripts/Makefile.clang`.

---
base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
change-id: 20250520-rust-mno-fdpic-arm-fix-940a58bf9433

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>

