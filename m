Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E5F6FC3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743863856; cv=none; b=kUwIB51Nlfjk5NE00kDpwoVeM28s24IVkt2cftLcqF7fPfYND5f+WsQxKwGoYv1XNSIzjkD+B11tuGfA6BlBdANTdvD9ELhTeP1bcGsiIqzJ3WLkaOKGG+UOkZpKp3gdbRNvweTHYlvf12+8Y8lZM9HjqgR/67ekaxOKsOK8wzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743863856; c=relaxed/simple;
	bh=pXLKmEwNDTBZtCeK7Q8AWrXj9MMBRKoyR3cM3epQvv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ltyvfs0WQbEb8mzi5pf8KQEt8zvzIRjmEz27eXntucdIMYUEMJ0nxYVKBAKQs6z4Ib5CTxbzsDclHfMP/kfXjxoQTs9t6vcK+PanUOdHVhD5BnyjwKsALC7Ok7mSt93wKZGu6TF/+bvN4+z17gAMOp8Wl5ZQCa6NqpZJJ5NrWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IM+tizNF; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IM+tizNF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3996af42857so2675397f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743863852; x=1744468652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9OlVokaPz3TD7YpKo822xXOy7MwdDKOxXITZ4KWICw=;
        b=IM+tizNF6oWcTZWnv3uLMli5NIxBk3M3x0q/BqYqsshnCeWizkSoH4r8N/rBNNIqUD
         uC/5nx92wNBUSKr3kmV5JcvYoIY+BjuoHyS4oGvZMdWJfqzauI6Qt0GpuGPBOzX+LyaK
         xc5PhW+hkNTIFS1P77E3gLbV4BjH7DES7rgA+hsJOIiZJsVTzshqlXO5e/NYMacPEM+Y
         gb+MNKnbjFN5yPvMLd6496yGMlMas4fWiRoeaHutec3xTFJcf2euxVcaaiRHcExNr4Ov
         wQrbsW00XeLHCh7zS1H1ISn9Yrs2tnUzu1rzhEUEjehAOmPcU2+VmMt0ijfJWXTABugO
         GHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743863852; x=1744468652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9OlVokaPz3TD7YpKo822xXOy7MwdDKOxXITZ4KWICw=;
        b=Fk7SCavqg7F38tq8rxX9ghS/whz+rBv+HERGkiDEYSqabSNdCAA19o4j7WxgiTS9U7
         pAFaK84BXaBzoHpSCnzxq3dj4srZb5IaS+lRqjL8CpmUxfM60PF3d+QfaQUdYV17BNux
         xis0kpUr1IR3TwUKASsPhVE3xulPRicMSqu6tmmfHrH4K0xJOS659GwaB9JlPOG75XB7
         Z3R+7DMhWyxHda6FGGk6LWFuvfG9A3uYmD9cq8TCGrecm90CBXF433H3qUaxPqHdYhQq
         CVQllA/pCf9AY+yfQR1KY1ArY4fwcRDIfj4t2TIvs5f2G3kzF+QKfAizg8KOaJMFX6/H
         WY3w==
X-Forwarded-Encrypted: i=1; AJvYcCUh5gysNuPwGKTa9m+9B3rUXOjfmyanfxbOn3PD2rbQvHWLvcid7NXRxUDqS4tXP3FQMvogvg+zc66EHTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwreJVZvJnG0DJ3SfyYEvJ7uP2hXY1EfbwWeeCXOdW6npI1kp76
	DEhXTj35u8g+B+peI3GndR7tLa9XAxH9SdCQvB1eNFtSiDKVqJYCwthwq+dTxxXytLVn/fEoIL3
	T
X-Gm-Gg: ASbGncsOnvUISgQrNvSlMdHQ1gJLeuhZYeWqpgc9dKlm8d2Hb8bb9aavw9YjhYqBSU+
	IPbFR+4GNsKDCYSN33xhSle67C584q2ti4zkwrPoBSd0I5EFGEslFypP20p0rBsueqjX0GSjbjY
	iyVTKRABsAVQTTJUegQPGavLkoqxLU5+aeZkMCYWGgKGPyaFX1CrN+z5UT2ChU6AoWj1M2YGAVC
	tK7xxDog+NjcuyUFKA/8AlAqYNbS0zuCjXkR0rtmtNmz/csJKE8ycHVaMG0m7b7uMLmlfaKlW14
	J+sizWpYiUqWbYZ3nuIjAoyxVcI2d9IMwjKwHVasfSIMpdfZb5yh9TGv+b/q1dgqUv9+XSVccwg
	ePSY=
X-Google-Smtp-Source: AGHT+IHb3QJwOjlJgpqTi5VzDr1QcD7qjQLv6niEM8Jbh6KrXovQeFV4QfcID6UNo7WIbiuJ1fvxWg==
X-Received: by 2002:a05:6000:4304:b0:39c:dfa:e86c with SMTP id ffacd0b85a97d-39c2e621d14mr9954585f8f.13.1743863851873;
        Sat, 05 Apr 2025 07:37:31 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1794e94sm79341045e9.31.2025.04.05.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:37:31 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [PATCH] MIPS: rename rollback_handler with skipover_handler
Date: Sat,  5 Apr 2025 16:37:05 +0200
Message-ID: <20250405143705.343960-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently the rollback region has been changed into an
idle interrupt region [1]. This patch make the appropriate
changes renaming functions and macro, to reflact the change.

[1] https://lore.kernel.org/linux-mips/20250403161143.361461-2-marco.crivellari@suse.com/

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 arch/mips/include/asm/idle.h |  2 +-
 arch/mips/kernel/genex.S     | 10 +++++-----
 arch/mips/kernel/traps.c     | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/mips/include/asm/idle.h b/arch/mips/include/asm/idle.h
index 2bc3678455ed..c7d75807d13f 100644
--- a/arch/mips/include/asm/idle.h
+++ b/arch/mips/include/asm/idle.h
@@ -9,7 +9,7 @@ extern void (*cpu_wait)(void);
 extern asmlinkage void r4k_wait(void);
 extern void r4k_wait_irqoff(void);
 
-static inline int using_rollback_handler(void)
+static inline int using_skipover_handler(void)
 {
 	return cpu_wait == r4k_wait;
 }
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 2cf312d9a3b0..08c0a01d9a29 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -116,7 +116,7 @@ LEAF(r4k_wait)
 	 * If an interrupt lands here, before going idle on the next
 	 * instruction, we must *NOT* go idle since the interrupt could
 	 * have set TIF_NEED_RESCHED or caused a timer to need resched.
-	 * Fall through -- see rollback_handler below -- and have the
+	 * Fall through -- see skipover_handler below -- and have the
 	 * idle loop take care of things.
 	 */
 1:	.fill	0
@@ -139,8 +139,8 @@ r4k_wait_exit:
 	END(r4k_wait)
 	.previous
 
-	.macro	BUILD_ROLLBACK_PROLOGUE handler
-	FEXPORT(rollback_\handler)
+	.macro	BUILD_SKIPOVER_PROLOGUE handler
+	FEXPORT(skipover_\handler)
 	.set	push
 	.set	noat
 	MFC0	k0, CP0_EPC
@@ -156,7 +156,7 @@ r4k_wait_exit:
 	.endm
 
 	.align	5
-BUILD_ROLLBACK_PROLOGUE handle_int
+BUILD_SKIPOVER_PROLOGUE handle_int
 NESTED(handle_int, PT_SIZE, sp)
 	.cfi_signal_frame
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -276,7 +276,7 @@ NESTED(except_vec_ejtag_debug, 0, sp)
  * This prototype is copied to ebase + n*IntCtl.VS and patched
  * to invoke the handler
  */
-BUILD_ROLLBACK_PROLOGUE except_vec_vi
+BUILD_SKIPOVER_PROLOGUE except_vec_vi
 NESTED(except_vec_vi, 0, sp)
 	SAVE_SOME docfi=1
 	SAVE_AT docfi=1
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 39e248d0ed59..8ec1e185b35c 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -77,7 +77,7 @@
 #include "access-helper.h"
 
 extern void check_wait(void);
-extern asmlinkage void rollback_handle_int(void);
+extern asmlinkage void skipover_handle_int(void);
 extern asmlinkage void handle_int(void);
 extern asmlinkage void handle_adel(void);
 extern asmlinkage void handle_ades(void);
@@ -2066,7 +2066,7 @@ void *set_vi_handler(int n, vi_handler_t addr)
 {
 	extern const u8 except_vec_vi[];
 	extern const u8 except_vec_vi_ori[], except_vec_vi_end[];
-	extern const u8 rollback_except_vec_vi[];
+	extern const u8 skipover_except_vec_vi[];
 	unsigned long handler;
 	unsigned long old_handler = vi_handlers[n];
 	int srssets = current_cpu_data.srsets;
@@ -2095,7 +2095,7 @@ void *set_vi_handler(int n, vi_handler_t addr)
 			change_c0_srsmap(0xf << n*4, 0 << n*4);
 	}
 
-	vec_start = using_rollback_handler() ? rollback_except_vec_vi :
+	vec_start = using_skipover_handler() ? skipover_except_vec_vi :
 					       except_vec_vi;
 #if defined(CONFIG_CPU_MICROMIPS) || defined(CONFIG_CPU_BIG_ENDIAN)
 	ori_offset = except_vec_vi_ori - vec_start + 2;
@@ -2426,8 +2426,8 @@ void __init trap_init(void)
 	if (board_be_init)
 		board_be_init();
 
-	set_except_vector(EXCCODE_INT, using_rollback_handler() ?
-					rollback_handle_int : handle_int);
+	set_except_vector(EXCCODE_INT, using_skipover_handler() ?
+					skipover_handle_int : handle_int);
 	set_except_vector(EXCCODE_MOD, handle_tlbm);
 	set_except_vector(EXCCODE_TLBL, handle_tlbl);
 	set_except_vector(EXCCODE_TLBS, handle_tlbs);
-- 
2.49.0

