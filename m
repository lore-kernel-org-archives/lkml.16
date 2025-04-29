Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A812D1918
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931369; cv=none; b=lQE3klng3PilJnJmqPNk5JG6cUJ4khLGDpTRcui57Fs4CvbKLyjsT4w8KG2CT0G6ABjqNanRBn6q6PCFX6H1DjQKIV/YgiOLJMXfIg4b3kDySu1GFY8+TrEIFp6Mma/NKF4YjbaZY2k1YM1qEFmnCswMQ2OLRGrOgVFJ6LSNrR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931369; c=relaxed/simple;
	bh=9ioab1t8nXmZsDjk3HszCYql2zzBu0n7CbR97op4z8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOVwwZMAssunmMdfv7Sxrs19VRfHgD0fD7vpQFR7ZNPi+KnjlwjQcjNFXBIJAjq2AAiv12139jEWWLyrRKlHFmxyvleba5GT/CC/PcQKkLITXZms2QAl8+TUvHt/eo9KXdyZl+v0mSy2Za3Uruxf2xXgchJlwdxVGBTR7Z9ijdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=D83lzDxK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZzP2ctHO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="D83lzDxK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZzP2ctHO"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745931366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0g0kq1GJUBlyV/4mQJ3oyVCKLrTdBKzHhBh0h2Qg2mo=;
	b=D83lzDxKEAZKLS4xvhsGKAkVZ2FickjGHV3/zzSVppOCWil0Tbzc8wufIlnJBVvuWYsyuk
	C8iU/e6zFpn8ZBPdEDk3grjFVTFOr3Sei/Le6LRc7T3cpYi9Hasga/O+D6cQNV2zM4bULR
	kZPbmKxFEjVeONu4cmYT0ds/CMFMyKilPUyuQp/ObDMg6hu1orxhWQuBiiVD9TuphEJDOY
	SCWByvzmGiyVJ0rC7Zy1xGukru3pBwY/X6NiR7kEvNaRXMsm1TOxuohBy32eFegUWyH6hS
	0AqpHeDkWwBiTTAAfITX5ZI92CyKnliNE0NnvbbTKF0Etr4y9+ksLsHW05Y/Gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745931366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0g0kq1GJUBlyV/4mQJ3oyVCKLrTdBKzHhBh0h2Qg2mo=;
	b=ZzP2ctHOk/iRiYGC2HJzCvIlvid5mdyxGKtuWdGZmF4K/4eRWmqmwAyb8IOOgI8EvFysi9
	lBdHmjUTAvjfzcBQ==
Date: Tue, 29 Apr 2025 14:55:37 +0200
Subject: [PATCH 2/2] vdso: Reject absolute relocations during build
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250429-vdso-absolute-reloc-v1-2-987a0afd10b5@linutronix.de>
References: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
In-Reply-To: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931364; l=1750;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9ioab1t8nXmZsDjk3HszCYql2zzBu0n7CbR97op4z8s=;
 b=GqG+9nPu7ZpzsSRTLeO2J+RE6AibS1nmAQY+eWO/BXhGhDl4ouHvQk/DiwhEMyISnB+xhLsVj
 EaQ8sXrRPAnBp0itVvNsR/q6jLtqLGyAfNgi6F8tfv7Q58pRYAmmuOb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All vDSO code needs to be completely position independent.
Symbol references are marked as hidden so the compiler is forced to emit
PC-relative relocations.
If the compiler does however emit an absolute relocation this will be
resolved by the linker and break at runtime.

Introduce a build-time check for absolute relocations.
The check is done on the object files as the relocations will not exist
anymore in the final DSO. As there is no extension point for the
compilation of each object file perform the validation in vdso_check.

Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Makefile.include | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
index cedbf15f80874d4bb27c097244bc5b11272f261c..18fcc94e4d6bf7abf374c7a953349e7ad75f8a18 100644
--- a/lib/vdso/Makefile.include
+++ b/lib/vdso/Makefile.include
@@ -12,7 +12,12 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
 #
 # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
 # dynamic relocations, ignore R_*_NONE.
+#
+# Also validate that no absolute relocations are present in the object files themselves.
 quiet_cmd_vdso_check = VDSOCHK $@
       cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
 		       then (echo >&2 "$@: dynamic relocations are not supported"; \
+			     rm -f $@; /bin/false); fi && \
+		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS"; \
+		       then (echo >&2 "$@: absolute relocations are not supported"; \
 			     rm -f $@; /bin/false); fi

-- 
2.49.0

