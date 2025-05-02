Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66DD26D4DB
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 23:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746228704; cv=none; b=R0fkQ5RGA8HyeK8GqjDnkZe2y2zlaXA1mAoMTyL+RRoNxQFj7x/CXUm0z6XtGICjaDs4cQsZcr6fgPNN6/pOoKrjKa3h4TkaamkGVekD6ceyJ6tHxiWfok0Nih+UEHCcCRxCeBsJLU/AVUdOOu736v1Bo564kEs+wn2XA+cLwXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746228704; c=relaxed/simple;
	bh=ZMNfJGQcTcXW+Ox6hYmgZeihjxgbaJ9GC8ja8XfQDIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QHcUgNCIH4gS4s2d9ER1E89v4GvRt7mupGlbTJ5W1rBsfm+yw8afhjhVczMgUMqu1gst8RRAuP5PmO4IezU+sS0Mxi4vGgJFzJFWheFFqPtVRaQVE/alY5jZ84Ee3YznNBSDB6gjJ5ji5bAbS6Avavnbew9XiTliLyKMdYD0rkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=18HwJNA+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="18HwJNA+"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22401f4d35aso31993395ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 16:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228701; x=1746833501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=18HwJNA+jNEjHssSdz8k35ksx/YcNamXZ509Y0daT++K9avwIxdxcPPuFnO7T0GBUY
         vQMdvlme7HIxYCrmJxgiS18xpMt8El8BKdM6lN5KMM6iGwPQnWTXVrhDac5PjVMlrkeK
         oAn3trOAOHyQu0ktns8YAoBKtY3uPer/pxjrYRX97jeOzLFTXP1aly65Mi2KQvFPAFnK
         3TMNxoo8dFtkpwbP0pmWHW5sLMx5TDqKiBSQ1njJQ0V5vo1zf82AK8Qxoch7BXGIaORc
         KyV5mfFc8zeBDU/LCvUkN7Kn58v1ePG2fZR3bLhH8VqlyuwVurW4WVOhsq5FffkJ2aVJ
         cDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228701; x=1746833501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXNrGX2eIDDqqmRRfhE1GhCa5+tzqdtGdU7JTzGQSvA=;
        b=kwqXxpOVXKMv122H+BvdSsypoDElcsFM1TjlE/o2Y5clnMQ/96xyD/3YOxRkWrpsCr
         8vnayOrKCo4GwEfjFzYwhm5J5kY5TLOpFuWiLaATod59Yma/ZTGqCuk93nvYK0vn1D51
         eHS9TWFbC6HDcfUQ7h/+Zuwhf2WNZpknGNb+wereEyjYOuzYDCQyFfLCzJ1m0J7l5pt3
         IfRrjnb2NDuezCD7fdroBPJ1Fphc97si3D/8zTutwxg191diQSNn8dkau9n6knEaTx2W
         LjRL+yS1jetxd/536wJ1rffaa3iUnxa9wfMpU8uwfGXvecQkz8Nx6mJ6ONNDefljpstk
         6m0w==
X-Gm-Message-State: AOJu0YxwxP78KM/ZMipR3PvD7CKvKm3973smpmvk/uMg8EDGA5CM30pi
	5aplMpesYRBvOUQC0RYWiZKI0QW6ItT5aKjg5/+k7BdzeKQGs+bPpaji7XPGVfk=
X-Gm-Gg: ASbGncv7rJK9GurjflNxbQb85YDuVpZqqCRzwvpvA4aAgJhPEqoZgvQE76AR2qXBrl3
	oJmFOYaYGP/m4LhZMJYIhqmzLvRA+xt5Ymkzuk1ZaajQgL+bm6BwZzv1BCMi5XiK7LDxvdsx9Oh
	oRDDJZ29YIK9IyJ7GR+G2iPLigPTwgzXD/ZBVw4jh1DVsJeioyLU64pAQfldk7z4Kj+BdjWSDwS
	J1xd6IHAeU1wvR75fDfTMTFpy10iVLL7wNp9q/c2+vO8PXfW7dnZFY4zG4CfxU+ms7gvC1Szt1g
	vpjv2idENqcOFvdmBDYHkWuahRF1CwSINJ69ChSumv2XXC6H9qM=
X-Google-Smtp-Source: AGHT+IGRr6wQ1qcGc/lz4VxDCk43KskABVIwgRKbdbOIqZA8WBWJNWwxAj/SPcLzrSkmv2eXNnxADw==
X-Received: by 2002:a17:903:194f:b0:22d:e57a:279b with SMTP id d9443c01a7336-22e18be2486mr17248525ad.24.1746228700973;
        Fri, 02 May 2025 16:31:40 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:40 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:51 -0700
Subject: [PATCH v15 20/27] riscv/hwprobe: zicfilp / zicfiss enumeration in
 hwprobe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-v5_user_cfi_series-v15-20-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

Adding enumeration of zicfilp and zicfiss extensions in hwprobe syscall.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3c2fce939673..9bc96881dc9b 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -81,6 +81,8 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 55)
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
+#define		RISCV_HWPROBE_EXT_ZICFILP	(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..c86cba0e4506 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICFILP);
+		EXT_KEY(ZICFISS);
 		EXT_KEY(ZICNTR);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);

-- 
2.43.0

