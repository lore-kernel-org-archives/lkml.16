Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F46B2749EA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406656; cv=none; b=udxV03V4M2VrnIn5bxN8iPtG6iQZ+6w1bzL/07lgpQWvLTTvKKdBStk+01X2/7JhgKnz1NWlqZFoQKJZmwK0pOvwjzIy7qpfIleVxBC44IWX+6zF1vyvesQ4iP5qKo4GDS85yyDRdjrP0Zzrq84ostyTFQtZplCXNafTaNJb53E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406656; c=relaxed/simple;
	bh=NEJFfugNNS0wm5pEF6crb+BvqkC0xKljc3xcR+nSPAs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PLG+KUFYxnZFPmVqJU/vJoerBWy9HcMFe6PLqpAO8jbll001BUWvv6jlUiIK9bbTBH2TK0bwXKuPfYl0qJsJgqCQnC9YJ0ZhAOFKRr4l3KLICYH1KAIpAq6wMHTkB5tP0lsOtUkgFmjF/kUuBZCUEmYPk4/Nx+VXwrsfJkMymG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QaR5bSgZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QaR5bSgZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so35398135e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406653; x=1746011453; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+83uvMKBJPVnv8WRj/faVWuMv9FoXyp74KE4V0XVyvw=;
        b=QaR5bSgZ/zvbUvIe9vGzEFFfv5TgzLvhXa4rc6wIUZoQLCuOHbWnRmwL7dOLQRvjeN
         iMgTjCXdrAb9GfwCC5Ta0Yj6uNHxce1ETmZT6jtsM6iNoGMZuMjJK3ARVAog/stweSzA
         AktId4PkZOnwEVAWgX23w/anXmh4/rOrE/x+dEVE3wgGN9j11ygMV9pj4BHNp8mq8p2e
         N8+1J4E1ORKOtEQCH6BWRMpzzqmA5P11S+MsuGt2JuZFtZIci5+JJQUGCP2zN8AocSRL
         ggrrKENyTz6UQRNE5jysTDIumurGDLXtmFaupg9EtWFMQIJWVbKnFl04398nVWKz4p8v
         v8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406653; x=1746011453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+83uvMKBJPVnv8WRj/faVWuMv9FoXyp74KE4V0XVyvw=;
        b=vtpnkyDP4b7F/2FOtie0ReN89gAGmDFG4xeV05dyQeIyxNrL5gwmMKWahdjIzBy2SS
         ogvex5ZfHXouSu7xMf4axUG06CvU31dp7hlLtSSMUW69gT6dMABV52CgN+RlYWsbCtQ1
         DyeYYnIRnyKhKFtTrZSsQhPFfpMY2yvFOIoxynwnHWgcS1GzfDiA/kWM6jADkFq1CKJ2
         bkg5a7ka7r622sdU6DHqKiiQ9Rv5RMnNO/5UiGCAhM3EbtiYPUTy8aNAplohcPMb0Efa
         rhTn/nwLokN0TkSLtxEKCXCdrA83qMwZVYuhqFU1cV06qz2CrS1ey98WRdFgQgfYTXR4
         Yo6w==
X-Gm-Message-State: AOJu0YzmRFhZRg1FXM6I/SWFklWBVSPOQLjBuIfIfdpRAftQUrdHxSJa
	2/xMOpqtoNay5SSm7IGljjsXKmOCtH169vIDkylgWnID5xzEpMaPByD8dxZKkgg6a8Ud0mm9ZBh
	oFGIIRVPe4cosCtjQigtQW6zAHdkTub2Ey51Ey5VDtyPoq51U2YRToewwelmkcKF/SZfe+70JeR
	x84tVc4fn2ExCKeuQDdT6PbLsf5XwsPw==
X-Google-Smtp-Source: AGHT+IHNR7+o9+BQG1YHfyNwGLFFQnSCjks3ze4nTfqI32RirW/RuNpv6da6UId2B/TwpyNZK33gUOan
X-Received: from wmbfp26.prod.google.com ([2002:a05:600c:699a:b0:43d:1c63:a630])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4690:b0:43d:17f1:2640
 with SMTP id 5b1f17b1804b1-4406ac0ed7emr156086625e9.26.1745406653454; Wed, 23
 Apr 2025 04:10:53 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:09:58 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675; i=ardb@kernel.org;
 h=from:subject; bh=LV01tjPpg4Y1pRce+BLB3PHdjlmISpNI2EQkl7VKLmk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPj1MxM9iMFbkFyE0U0vfl2CLvZ+ikcn39zll1J8IEc6
 UkKgeodpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCKt5YwMbfr7Jy0OPbjk3q2W
 S+/d5lY81szh+anS85vv0x+vmwIS/Qz/i7mllSY9KrWVsvHKeV3TnmWzp7Bt4sfz/Qfc/u3oX9f DDgA=
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-22-ardb+git@google.com>
Subject: [RFC PATCH PoC 09/11] x86/boot: Disallow absolute symbol references
 in startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Check that the objects built under arch/x86/boot/startup do not contain
any absolute symbol reference. Given that the code is built with -fPIC,
such references can only be emitted using R_X86_64_64 relocations, so
checking that those are absent is sufficient.

Note that debug sections and __patchable_funtion_entries section may
contain such relocations nonetheless, but these are unnecessary in the
startup code, so they can be dropped first.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/Makefile | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index 4062582144f6..43560ab9e21a 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -36,9 +36,17 @@ $(patsubst %.o,$(obj)/%.o,$(lib-y)): OBJECT_FILES_NON_STANDARD := y
 # code, or code that has explicitly been made accessible to it via a symbol
 # alias.
 #
-$(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_
+$(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_ --strip-debug \
+			       --remove-section=.rela__patchable_function_entries
 $(obj)/%.pi.o: $(obj)/%.o FORCE
-	$(call if_changed,objcopy)
+	$(call if_changed,piobjcopy)
+
+quiet_cmd_piobjcopy = $(quiet_cmd_objcopy)
+      cmd_piobjcopy = $(cmd_objcopy);				\
+        if $(READELF) -r $(@) | grep R_X86_64_64; then		\
+                echo "$@: R_X86_64_64 references not allowed in startup code" >&2; \
+                /bin/false;					\
+        fi
 
 extra-y		:= $(pi-obj-y)
 obj-y		+= $(patsubst %.o,%.pi.o,$(pi-obj-y))
-- 
2.49.0.805.g082f7c87e0-goog

