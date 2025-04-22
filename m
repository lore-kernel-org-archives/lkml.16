Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E53D2C1797
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745355922; cv=none; b=fH4P7KR9aM4hQeI/99N/fiomM2FGpDQb98TdJfkDBFWSGGmClzH2VN7eLZo76JMnn3p/CiSpK+JHwc2WJmgPXzmtc55q7AZ/ziKwprnYq+Mndh2Bboa2RvccQkKkseYdj/iy7bu7PZLKKReApAPMr1fD0gNO/yp+If55RMIhpUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745355922; c=relaxed/simple;
	bh=v+uRwsLHOmfzDIF0pS527DuRyohTPzs55tPRSQDz0WU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=A9r8pzySuVeNSz36UCdbS4QyLF8wc0397FoRMs8jI6XOt0O/A4KhMOc1Gh+84A/TKfuL6jBYg7He9fZSZGyTOd5sTNiU8eYBkKrwKqw88W3e5088n4m6hGO9N7xocs/aZ/pPd3misbl2GgY7Kwa95Fnw0EfsZOxoAmxXsLJmx7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B6nJ2SWE; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B6nJ2SWE"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so42245235e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745355919; x=1745960719; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n3xzr97fcLCVm/TFf8Ltlpp7pDJFo4k3zJ++YTMvpc4=;
        b=B6nJ2SWEw0n3+FxtyGenxh7//MA2sDzSvc/cxmQ+t1w0MfRab+juMmOwIYEYJRldZU
         c8YtLmBucazVuNJfp8gXGvZ9ZqeeLDakD40e/GUX5KTxW7m3zNe1m3ydYh3sGKcaqAW0
         2svj9glutHtKEo6jJJO7tkJHr1ElRtfefPVPWuPNoOmyr2c3aIZtvyjpTushmRISmjZv
         ohU6PHbDMgZK7dwnbebEfaaTEb7bmVqLpSrhwE2frk/fesI2yjfoaHF6YZCeSyt+xuec
         WoL3pCj+eaZvw3TQwwnzwd0jfkrSRwefTykjtkDXfTBULOKdhiGDYQRrYf7VZvX3pOU9
         HUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745355919; x=1745960719;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3xzr97fcLCVm/TFf8Ltlpp7pDJFo4k3zJ++YTMvpc4=;
        b=EZp4HxB6hzzpASp17Nyy87YEv8pyBjXjbUdCf/VAJ48RBfkdD/28/GWcSBdACxhsf6
         7TEjjP6vNdDMr/yPzvLlI4ZcD2ERuoRmRU5w9qZ7kLHDW3iym9CWjWaOB+9oI52H0irE
         aiRACQrF4m1imwEn92xmid7vW8d0ik9dGE/LABfqTE6n7y0Y8EkdHKRz3eI8xMWFvqUH
         rfzkmBN7jMUV+90jk6e+69vUH82d9EU8jBcjyALqlyhFWhAGeuL4vfaWHUkeH+8JkB7f
         EYg5l8OG3J9PPlaUak3apZlS1N8BnAlWZ7TltB3zlv3slAWUNA4dIQRGFnyOCNupqK9l
         Bq0g==
X-Gm-Message-State: AOJu0Ywas1cOitB6Gaz2N1CqHkjA4FCdNwyFU/5zcVl3CkGL3IeBrO5D
	hctTYHPOpkCFU80T2VOPhQuPVoHYJFM1GBZPhxgRtsyYFkhoR/sZh2t35NKfW1XKsFl6Bge4HPT
	DEDXybt5N0sy/yBnJ09HxbivtA6P9W4I+IpGkRoVgU54gyi7a3lZelTSSxuxoa/5BU3WR0aW7fi
	qAIooJ/ztL8tULwi92PqDWmKvqexzh5A==
X-Google-Smtp-Source: AGHT+IEbPr6RfYyB6bDIsqR5ctTWIiR1x5gwGJliOycccBzchng1hfEmpr+1CfRO1M1GeUqnfz2YJHoU
X-Received: from wmbfo18.prod.google.com ([2002:a05:600c:6912:b0:43c:ebbe:4bce])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3107:b0:43c:f64c:447f
 with SMTP id 5b1f17b1804b1-4406ac163bemr114862075e9.29.1745355918724; Tue, 22
 Apr 2025 14:05:18 -0700 (PDT)
Date: Tue, 22 Apr 2025 23:05:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715; i=ardb@kernel.org;
 h=from:subject; bh=v7Nzmlu0nL1IVS/E9VJILt/bwvWjc5W8Q425XyUylHY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYODpV1+x41zPoJv/pRK3okt3bQp0KTygdupeqE//7Ieh
 r+ekryxo5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAExkawXD/5Tyl1P0Jrm9S704
 6fvXo9G8Ra/MExcae8r/7qg+OC+IIYDhv8eXaMnf1ySzektn2jDJX/mTVDGpcv6hp3KO/oei/db u4wYA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250422210510.600354-2-ardb+git@google.com>
Subject: [PATCH] x86/boot: Disable jump tables in PIC code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, mingo@kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

objtool already struggles to identify jump tables correctly in non-PIC
code, where the idiom is something like

  jmpq  *table(,%idx,8)

and the table is a list of absolute addresses of jump targets.

When using -fPIC, both the table reference as well as the jump targets
are emitted in a RIP-relative manner, resulting in something like

  leaq    table(%rip), %tbl
  movslq  (%tbl,%idx,4), %offset
  addq    %offset, %tbl
  jmpq    *%tbl

and the table is a list of offsets of the jump targets relative to the
start of the entire table.

Considering that this sequence of instructions can be interleaved with
other instructions that have nothing to do with the jump table in
question, it is extremely difficult to infer the control flow by
deriving the jump targets from the indirect jump, the location of the
table and the relative offsets it contains.

So let's not bother and disable jump tables for code built with -fPIC
under arch/x86/boot/startup.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index e5f77e65c083..4062582144f6 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -5,6 +5,7 @@ KBUILD_CFLAGS		+= -D__DISABLE_EXPORTS -mcmodel=small -fPIC \
 			   -Os -DDISABLE_BRANCH_PROFILING \
 			   $(DISABLE_STACKLEAK_PLUGIN) \
 			   -fno-stack-protector -D__NO_FORTIFY \
+			   -fno-jump-tables \
 			   -include $(srctree)/include/linux/hidden.h
 
 # disable ftrace hooks and LTO

base-commit: ff4c0560ab020d34baf0aa6434f66333d25ae524
-- 
2.49.0.805.g082f7c87e0-goog

