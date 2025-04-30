Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A976021CFE0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004820; cv=none; b=pVPqN+Ft9bDRVyBWlWcTFb9HxLx9zXwyFZVdx9vlUuAfAPVKYGbCWZDKcM2PReXui8nx5q9jk6MIbReYO4OXOKNEUyONbKLeFgaiGXJiYrK+AcMpU28C0CizHbY50b3ichhWheencJiLxwTac4S7q0n8StmwnCg4XaHweHtejSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004820; c=relaxed/simple;
	bh=4XMu6PmWiKJtEbyVlX4KrB4GS+s4XTABtUWp9SpHQiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2gCg01FRhE+A6jhG9cPfpaOexGV2OZh5nXsI4CnIbUahX4cbxUeENXRl3bxNbZr0HIDyri9OnvSfkgk4vwu48B7WUbD8OMGDtp7Btzixh/RuHL6ElBgON1T/ZDgAPr7eQBfuh3zQpqSSxt/FF6MqKEspqo7hrMdpAyUM0jWe5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=odcvcYZn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kquq+QO1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="odcvcYZn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kquq+QO1"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746004816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d925zDAc2kwfRYjdGcNdtwZzRyVS9rKiVQOcUxxA/Rg=;
	b=odcvcYZnuikNZQL0qcN0xJ5CtI02ZNWkKxiWWPa0Ad7N18LkC3CQ+FetrC+UdScYC//i5U
	mCL7lk/8CRdvYdd4YjL1sb5d5hM3LHEAdngRZk67EXt8S40C77f180yRkk4GG4QH+cgmF4
	DEcIsEuKyxXxG6apDTwGtyUdpk8UqKr38z553TQO9tPRqm4zesGaPIbpOr1bgbngNcc31O
	5QlShvanxG2utzLJmJHyFXTh2Fibee6CawliBrKfHUpCwg3zBGLibEAC/r75KRxzDBlNy5
	aDEcljcmJiHauNHdz5tBfZZUBdZuOOZ7U5buJENEl/B5XcEi3YGxJQr67wB74Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746004816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d925zDAc2kwfRYjdGcNdtwZzRyVS9rKiVQOcUxxA/Rg=;
	b=kquq+QO1AjUAsdKV+uxn/kzOsqePcd0L/V0SsrHjdlllIgJyjm459NiDdDAo4lmWXoLQnf
	L90sE0YSHNjk0BBQ==
Date: Wed, 30 Apr 2025 11:20:14 +0200
Subject: [PATCH v2 2/2] vdso: Reject absolute relocations during build
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250430-vdso-absolute-reloc-v2-2-5efcc3bc4b26@linutronix.de>
References: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
In-Reply-To: <20250430-vdso-absolute-reloc-v2-0-5efcc3bc4b26@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004814; l=2113;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4XMu6PmWiKJtEbyVlX4KrB4GS+s4XTABtUWp9SpHQiQ=;
 b=Cqd1NFTPQfdv48z6vCZlhE04UKM1O0irx1jjUv8xwS3PLV6Of9e/QUlOWgHhTkT7jW2dZRCDI
 52v/1nA3ol5BBV5d+MbucP1kLfF+rFw3wczVF8rUcdcblECAskVVrgd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All vDSO code needs to be completely position independent.
Symbol references are marked as hidden so the compiler emits
PC-relative relocations. However there are cases where the compiler may
still emit absolute relocations, as they are valid in regular PIC DSO code.
These would be resolved by the linker and will break at runtime.

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

