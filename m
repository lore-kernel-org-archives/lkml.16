Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3373225C83E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 09:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749633748; cv=none; b=Ty89yuxg12pU+NlAArxJybpEVk3tBRjPd++sT7qNlTnp01s1/LDefSuvw8yppr9A32oCNHnnR2wKTtFz3+r4f3nB4mKMjAjLRFPdO3wuBaIgZtl62ZtsO8nsqn80KFwWmPrL6RHfjr29v8/fTqUAA0FR+nnnhsLKfW30Je3iBG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749633748; c=relaxed/simple;
	bh=mIAtGDHPvKeYdgafPU461SwU1pvMX0e9L3qKBEtEQp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Usl1DhtXA819+VlCQs2O6MctH5ehvOEUQRGUnjdGrmoZ945Qe02VscXBdAXqnQz6ndPZ5wpK3guIxd0Tt4la9o3ncSE7LvrzDvKF6eAujxcytT2QSPU7USgr/+p8nJQOm4gFy+c82FZmYzJmW3z1LfAnv9wF2A8+4lxtER7Iftg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GL6NHJdh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/7HqhDUo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GL6NHJdh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/7HqhDUo"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749633745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0wTJl4RIVSFj/J21gRTDQ3w5OE3XK4ggTZJSCDLD2I=;
	b=GL6NHJdh8oRCBHoc0pCvwGt+FMm6CmPZDaSPIyv0AwYaPhxb6cgvtH+x7vJMNVY1OvbVAI
	0Fcd0Mg5z7ACVlsKkKr9GLrbmp/yN6erZB9Dqysrq4OJ5Wp5KOgoHP7NEjAup6dOP20C8+
	Qj+nQ+46L5YgUEr8Cv78NgVN7B8FVAJZgeIQcMtleDiPCobxuF791zte11xQITQbB5DbJP
	qEkaZ7pqplVdht4OWG2xF9S46mLE85l7rmEMx26hg5dh0fevA7HHj2iBN0hE4s6ycTm9M3
	V7o+ysyNJ6bKBnaNaWJpGv8ctCgNrT1J8rRDGZC3cRjx3oxsP4gTKds75cdnJw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749633745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0wTJl4RIVSFj/J21gRTDQ3w5OE3XK4ggTZJSCDLD2I=;
	b=/7HqhDUo5GHztwH4u2uOVsaIcikw4P3TFVxK9YTQ1WvyeNbCBVTlHRglhhFUb3ok/wdW/N
	137plfNu6ojVANAg==
Date: Wed, 11 Jun 2025 11:22:14 +0200
Subject: [PATCH v3 3/3] vdso: Reject absolute relocations during build
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
In-Reply-To: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749633741; l=2264;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=mIAtGDHPvKeYdgafPU461SwU1pvMX0e9L3qKBEtEQp4=;
 b=saA8vG7G5+nuYZSAIasKPk5cLM4d6JKHzQ2YGvNfixdyOAnpwSO6H7XzKmIVedADkizpqv1bb
 jU+UQS4HuWOD3hih0qgzsdHbpqtAnSo8QNwysBfBekBxh9MTlcW2DV1
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All vDSO code needs to be completely position independent.
Symbol references are marked as hidden so the compiler emits
PC-relative relocations. However there are cases where the compiler may
still emit absolute relocations, as they are valid in regular PIC DSO code.
These would be resolved by the linker and will break at runtime.
This has been observed on arm64 under some circumstances, see
commit 0c314cda9325 ("arm64: vdso: Work around invalid absolute relocations from GCC")

Introduce a build-time check for absolute relocations.
The check is done on the object files as the relocations will not exist
anymore in the final DSO. As there is no extension point for the
compilation of each object file, perform the validation in vdso_check.

Debug information can contain legal absolute relocations and readelf can
not print relocations from the .text section only. Make use of the fact
that all global vDSO symbols follow the naming pattern "vdso_u_".

Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Makefile.include | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb68497181085752f8 100644
--- a/lib/vdso/Makefile.include
+++ b/lib/vdso/Makefile.include
@@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
 #
 # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
 # dynamic relocations, ignore R_*_NONE.
+#
+# Also validate that no absolute relocations against global symbols are present
+# in the object files.
 quiet_cmd_vdso_check = VDSOCHK $@
       cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
 		       then (echo >&2 "$@: dynamic relocations are not supported"; \
+			     rm -f $@; /bin/false); fi && \
+		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS.*vdso_u_"; \
+		       then (echo >&2 "$@: absolute relocations are not supported"; \
 			     rm -f $@; /bin/false); fi

-- 
2.49.0

