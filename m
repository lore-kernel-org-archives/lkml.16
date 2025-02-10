Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654C4261380
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219258; cv=none; b=NxtBZ+q8xxM3tkJ8OdhE3SfuKQIMN/n3PDPXz+M4aT0pci/XyBiRpAnMwE4Uz8X0h5FbADdJMnHign8BlyALjpsp/j+gSLD4b+qxxAsBWt35h8hmu/zt4U85Jd8o0JlPRNs4xwaOXJZCpTak2/BM8os15IW553+lXX9g+pPRxgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219258; c=relaxed/simple;
	bh=zWvCMjEUr0fm2YGOtkO5JQMRJ3MfHFejTQpY2YYRpeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ij4q3N1iYGjqZ6X5OftaLI3FjkRxil1/Obs66jjZrb2Li2tDrWiMggG15cEVt4Ju/qpCeSKSeX2rx+JVLpYG7lRIlJpvkD2RzJa88NkKrJFYrJn58qPGZSuNnCJimCog8QBTdydTzWfRiNBG3Aggmw3XUoRGi2IFGLxn7pqAUQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=k0WpeWPa; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="k0WpeWPa"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f573ff39bso66572325ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219257; x=1739824057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=k0WpeWPaq8hgRQ9Ha2rVV/0mN9SFOGihKHVgQuw5DyqHjJ/dZ6ylpIjBcQLLONeKBJ
         yh9V0PiBX5YOLho1qfXolkqnX1SG/JZLulhHuU7UDizs/hd0kJ9L/pbfBcAYYo4ohVbx
         QCuE/yKnPqu5eUFUQXVajbu+zhfqDWMsQ2vsAv05p/BsnRuVwlWKN/SunCVcVRF5Zfbl
         X1oO2F24x0ZMOFnTgP5FbskCaTsBWWEYKZtQKFCu8cRmF15g02/9JWcdTEMj7pWjQM6p
         3FzhE6p/CwqAlGxvAySnQZX8EzycDtPfGIQhwEYrMdKLcvGN1tdAT3TE7hBTusK10Vdx
         +uZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219257; x=1739824057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=WAmUGYRoIK+Gdi2gduu8N6Kl4lstuG7e8kEE1ufTk8LuMvir1iPo0vjH7sEQjrsSRi
         PkcbwUq3bd2dLledP4f58HymfT7NOtWO5Yt1cDMTJrNmMSvbpMm+3cZElPiqxsf9pgf8
         /eeVuT7mqPoLVEjlk3+y6SWonJfwpTwhQhk+a0v5Glmm7ifl9sZTfF7shEFRXfQPG7ld
         ptuI0SBlpN6sgBHQ9RUme2RiUQSMG9Swa0TAnnZSRTVepelKBLtgRId+ckEYn2gBherS
         TuG76AlJavmSNW0RpbPrea8hbhCGN6lze5cQ+k/I/5jEzP4ZU9+2ayFfAqSaS89lvwBS
         TyUg==
X-Gm-Message-State: AOJu0Yx1D3PLzLHStN2w3OlCPPlGr4krryrgbrNDfoPrPgSsy1WYp3JD
	c1D4l732jXx1ifmep7u8fOY5oIfnutEnhiZftK14VdlnAI7p6L9UsHwn94Vdw5s=
X-Gm-Gg: ASbGncv3mnK9GC5qOrKVCN7EHZxrfPF0FkIY1a4zJ7iiROU1iQWf/c9NSAZXaTjXCi4
	8mgsvwcQbO8MLeNg3s3v3NeV1S3jJnxRjOv5oGFh4AXv4cNIiZ0EUXH6HAEgsW1va/FuIN9bhQ6
	LY1CtEi0t56ltCYhhz3BYEbruyHAnIPNu5oNcIISjvTWDQUmMUc/AcE+3oq5wQYiTP/LLwilFBz
	WYGGz0L2X7nU2ymNhXbTyAbT733ab3TqtXQurr+SIg9rDwq17N8V3rz8kzP3Z+QAkoZDgnaC0hm
	C12BwzmPzWgX2vbhjnbzP6EmTw==
X-Google-Smtp-Source: AGHT+IF/dAuKVSsF4xfi2H6sG4wlPlN+BXXOHG9nKEFkchqxVssSaBrEBlASEgV9299c+TKy14VoKQ==
X-Received: by 2002:a17:902:c94c:b0:216:1543:195e with SMTP id d9443c01a7336-21f4e1c8978mr260581855ad.5.1739219256955;
        Mon, 10 Feb 2025 12:27:36 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:36 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:55 -0800
Subject: [PATCH v10 22/27] riscv: kernel command line option to opt out of
 user cfi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-v5_user_cfi_series-v10-22-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

This commit adds a kernel command line option using which user cfi can be
disabled.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/usercfi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 6e561256bfaf..be08e5bb6e62 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+bool disable_riscv_usercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -390,6 +392,9 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_shadow_stack())
 		return -EINVAL;
 
@@ -469,6 +474,9 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_indirect_br_lp_instr())
 		return -EINVAL;
 
@@ -501,3 +509,16 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
 	return 0;
 }
+
+static int __init setup_global_riscv_enable(char *str)
+{
+	if (strcmp(str, "true") == 0)
+		disable_riscv_usercfi = true;
+
+	pr_info("Setting riscv usercfi to be %s\n",
+		(disable_riscv_usercfi ? "disabled" : "enabled"));
+
+	return 1;
+}
+
+__setup("disable_riscv_usercfi=", setup_global_riscv_enable);

-- 
2.34.1

