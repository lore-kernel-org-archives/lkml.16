Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2721254852;
	Tue, 20 May 2025 22:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747781322; cv=none; b=NUSGPdwblaiS8hiQRkS8YBpLmups9P9Z94W8YKA/8Z15J6AVmtAS0Qx7rQBMvDVUYZcsjQ+f/dx+5trnjXeyLCBAZg0+yAAlVyCEVFsroq7OLCWNbhYOfy/sMk2nxqqrGO6r6MFEjbOl/CyK3CYt7XuDmPb3mB1WTZvg2Oax9+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747781322; c=relaxed/simple;
	bh=/2Cb9WY6bPkayYtI4ghDmErFFoZgsljPtztUSgmA8/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qor3dWdCw22AtNa0Znc6PANxMk5D6hkmJJzdztkrqSfzPj8u3lmU5Xyvogo1gjsRcZt54GcgnQuKTrTuKX7WqoZ0cYZMVsOjvka9eC/DAu7gbDYhzoblG1vTRH/9MVUK/K/qVpFN7e3d46tlPzaNjVRzGMOj3Gy4ybNE6RYPsGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mjH/qZTX; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mjH/qZTX"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c277331eso6296924b3a.1;
        Tue, 20 May 2025 15:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747781320; x=1748386120; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gTck1yGqn34V0Z4W8SweTAUMX+2ktQbzGZD2RnyEFtg=;
        b=mjH/qZTXn7oifFq7fPaJbsMbWqEjyssiCvR2Od7jbSwZWdD6iLSjRPDmAha/oaPZtA
         5NVxzkCFHV5UfAcGknG+/veHP/ehCw7TsMBvOjXW3bULWZbOmIAOW46WWc4QePvl7rwV
         aGHwRPwkZMGpjgKhn0+yyh1dUQWHWInImjoy1zXH/e6nabOrFOHX9BXfyqcvNvYAZ4ts
         NuVxrTfPWmpq85FFQq8pmGIDlw7H8Ax8jfiT7+Su6GSr0PLInl2BZoCRIKkcA3DJSj3B
         TaX4yMj4EFau6t9sRaKvPYm1DquHRoV1JLR/heVlpOFlZ0BYGxx6kstpgdkW7jsbXlvF
         lhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747781320; x=1748386120;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gTck1yGqn34V0Z4W8SweTAUMX+2ktQbzGZD2RnyEFtg=;
        b=dp3yLIQKhmJDclF/XCT/kCFm6cS6GYuf31gL3nzYta8JqQDshNGHuJAk5XIXuKQEbM
         0+NlDxY5JAM8YwRVFL49zcUvg6e1uIHNpTCDYRwolErOBaAY6yxVhft8VNJHLzcI7xbR
         sY/ICX9qzwKSGWQtQCAS8Ky5GyLfIHi0+7b5QS/5G19wWrAtuw9reZrqoytZ05pPWDHp
         vddjmC+j+6XoTlr+0KY3ynFWDpR99sAAP4Uygj/q9rmmqUH+uRMFM7RjN3V9RdhW9Vs2
         jdewGNUTVWy3oIBjgEqVZ7brvnLrPlb43L5c8CXtBHBWMbJXhU5+CQYatIPPOjoE3q29
         cJfg==
X-Forwarded-Encrypted: i=1; AJvYcCVR4/k5Em9755FIm1Lk7HXzVDAZ8ZPNHiY943n7g5g+/gdj63ib/VhBl64xQpBtUDyNQ3MuQaRB/kgSlpM=@vger.kernel.org, AJvYcCWOFZzxxKBi2qvEDpn3T2jZg1lFnK6/z5H3l2hEF+ajR1bbapnQtNAC+UbSDGAZ2KqDxuOonOTyekD62Eup+MM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DVAbVGN8ITNQ7bixA2NjidqoVqNXjvMHcmaZaVik31Kx79X3
	Muc+xFqRHBnnXft4OGuPBqJW3XXDVRlHuyhfuTyXNKOQSb8vMy6i+Ta20N1ju1c3
X-Gm-Gg: ASbGncvma2ccbzLVw4ktb36blc7avT/kWZ+aDHoCP1VT1P08x3qDLuUaWYGVwoXkaAN
	vVFpPScISe5cjmFrMMNk5oVSaFEm/uYnmjKyYcYBMUgVSRBCPGPodXSQs0u88nayFncQI6PdKuj
	SfqCY5tDLxrfc9HqfuJ7C1Ac2sUiSVmfIt7+7gwIQThaywUjwQXNKnVMb9P4Z+2ZdmpbWPLsmeP
	dm85sn2u5ZhR6nIrgtNEKPs+BfNFnbqX1E/F6/6lSPzNm2RfWwHfy3CPnsi1nt3a6fNjVSZfbhL
	eol2hjjgvmifd+3kyvyvya60izzW7BbyoSEflona7hRbEPBkTnth
X-Google-Smtp-Source: AGHT+IG2X0pomsnFUCQa19hCElWt5qNsJlHFQAhMvQ4eYIPhael32C2ELAIMHyvCUOkhzqa8EkvDjA==
X-Received: by 2002:a05:6a21:3942:b0:1f5:8cf7:de4b with SMTP id adf61e73a8af0-2165f84b77fmr28235687637.16.1747781319816;
        Tue, 20 May 2025 15:48:39 -0700 (PDT)
Received: from [127.0.1.1] ([2601:644:8500:5dd0:565f:91c6:a34c:f6d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c86asm8739999b3a.57.2025.05.20.15.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:48:39 -0700 (PDT)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Tue, 20 May 2025 15:48:37 -0700
Subject: [PATCH] arm: Fix rustgcc unknown argument '-mno-fdpic'
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-rust-mno-fdpic-arm-fix-v1-1-44e77fe6b2a1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMQGLWgC/x2MQQqAIBAAvxJ7bsEsofpKdLBaaw9arBVB+Pek4
 wzMvBBJmCL0xQtCN0feQ4aqLGDebFgJeckMWmmjjFYoVzzRhx3dcvCMVjw6frBrlDXt5LqmriH
 Hh1DW/3gYU/oAqSl0WGgAAAA=
X-Change-ID: 20250520-rust-mno-fdpic-arm-fix-940a58bf9433
To: torvalds@linux-foundation.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747781317; l=1766;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=/2Cb9WY6bPkayYtI4ghDmErFFoZgsljPtztUSgmA8/8=;
 b=dD0YMCC8TsOC7IFCio+JlJzS+fFX1g0IwQRGhA9s2diSjuMpAGIPX3Ee2hG9VahQMcIbrK2cl
 bN54N5hVbo7AGgCE/g84rx9JmJkY+x9eoHA3sVDBMeJ7VKlSVi2Ujca
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Currently rust on arm fails to compile due to '-mno-fdpic'. This flag
disables a GCC feature that we don't want for kernel builds, so let's
skip it.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com/

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Currently rust on arm fails to compile due to '-mno-fdpic'. This flag
disables a GCC feature that we don't want for kernel builds, so let's
skip it.

It seems like this bug went through the cracks, so I went ahead and sent
it. Hopefully nobody minds.

Closes: https://lore.kernel.org/all/CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com/
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

