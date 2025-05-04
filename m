Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09A91F30C4
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746352431; cv=none; b=cq/qf4QeIL76v/llCNoeeKIiuNJTQqfCdsERNQoPsn0a0kB6xyCXBRoNyEdw6/OwiUpBcawxiElN6M8HIzKj2AZy1YAh5zKtwjoTJg6moSj8FEWqXKsM19eZeRTg61f338lqOzfe6Rw0Tg8lLrv+skCsDKgeN+r5lymZ2Go2whs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746352431; c=relaxed/simple;
	bh=kR6rswlwwIYujb+EJ0yOVEFScg9Jru2OEjE3Kvh/Q84=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sPGw6VWw4m8aCHb3fTCCsTkvrwbQDlI7rUEeHX0uaqKqo+U6e62lGia5Wt3u8sE0IYBMElt3nBWBFTjTHoSh4Vetkg0eG3P386nu6tvXIEeR5+ShZbQxav8FY66oZFXGaJiWM2VuI5yYL+QAuiWblU0j/APKGeX9hBOi+L3bJtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fkR05YwZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fkR05YwZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so17673075e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746352428; x=1746957228; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hLjo2Urmr03naf19fIolYJZFVTpPiE8779NTKQlY+0c=;
        b=fkR05YwZ/J2BzRZj4WKzzWGD/iwRFofk1cIXjY+lNaRYqL6UEpObAs/ws85ReQZVA9
         RKBn2hpRofCOg5kWFQTedJ71w6FtDKvQbI2nSq2gGBWzft91PH/A9NxzQlyjOB5AThsw
         By1ZuefjgZcT/uarMcj3k6uRbT1KOUb/KPX43JuuL8wYOsMRHF2TFMYsSofooLOLOImf
         TX1ycZm9je7gzxIOg1jzQW9cmm/DhA1DvI6LaA+HfzH0R6RW9FtdcGzkuq4T4l9FtD+x
         d5SgNpe2fIvR3Zrp53kGVH0pH3SsGsWGvCVeRbDdFKzQCaZiFv8S+GvZbKXsIRFgLLjD
         uJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746352428; x=1746957228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLjo2Urmr03naf19fIolYJZFVTpPiE8779NTKQlY+0c=;
        b=NaujlEYleyJy0nllyDbajMKf80JFXq+eIEVvjbJIljsPV8dnFJpktj5pbfVXvzpck0
         SMalq5HNleJOlLpllgF2MJ6CdaYiOtXtMjqp6QbjGIwaxbb+d5gyp2UPfQ+2rvd3E0L6
         WonHEkhiCykckrfbPzfQCIgq7PxS7R7gN9QwYHA7cqSBaCDtphSMjh0tuW0FwPevLE/4
         5HB0oyy2snPgCKACqgs4qmoqa0/uYQPyHGCo2OekNpUnMJjaipjMnrMwFqM3eF+OTog3
         Ywh/tRM1cxt0IY2XhA4k79/lvY5a/i+JUvcCBD3eRih2tMAJkhmR985GW1aGOe7SRlR9
         H/Vg==
X-Gm-Message-State: AOJu0YxVXuyv7H2B+W9fmHj56+DLo1sqoqx4ncZy3t5ZF0kpNT53qKC5
	B7xptcu5JwHCP8kSB1Q24YtYJ98lR0DrdCouxty9rhe7pK0hQgt3YoI1vyXVMAv43WhvDSv/Xjv
	XlF6lRQkOlWwpzno7wCXwqcpyv9tIeiR4lIs2L6F42GRaobLRoyxGDe+eYIrdQvRw18VpfoGdHO
	uAvj60k9a7DksX+H53w6xBo0KIzEaiwA==
X-Google-Smtp-Source: AGHT+IH90gqSPJxs8k9nVTdFHRkCC/+sHj+b3LeroAd+gdqmLY7ywJfO2ETmybdwDECaqma2vA+qbFP+
X-Received: from wmoo8-n2.prod.google.com ([2002:a05:600d:108:20b0:441:c147:991e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3e05:b0:43e:bdf7:7975
 with SMTP id 5b1f17b1804b1-441c49486cbmr22764355e9.32.1746352428071; Sun, 04
 May 2025 02:53:48 -0700 (PDT)
Date: Sun,  4 May 2025 11:52:51 +0200
In-Reply-To: <20250504095230.2932860-25-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250504095230.2932860-25-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669; i=ardb@kernel.org;
 h=from:subject; bh=4KgoJzYmdouJK1RzBO038uMdZjYS6ocYk6yPrPHnQMw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPc4tfjUuFv7w+wzBWI0676+dkxPddmnZ5R7o+0AyKP/
 da/2zq5o5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzk9Q2G/xUdPIviW/av19Cz
 urCmLastaxvf2kv31AOfM1UlpFmpmzMy7HknzW7xI2HzRfk7izkz7Tdw7rX+cv/6MVbJExlHk++ EMgAA
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250504095230.2932860-46-ardb+git@google.com>
Subject: [RFT PATCH v2 21/23] x86/boot: Disallow absolute symbol references in
 startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
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
index c7e690091f81..7b83c8f597ef 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -35,9 +35,17 @@ $(patsubst %.o,$(obj)/%.o,$(lib-y)): OBJECT_FILES_NON_STANDARD := y
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
 
 extra-y		:= $(obj-y)
 obj-y		:= $(patsubst %.o,%.pi.o,$(obj-y))
-- 
2.49.0.906.g1f30a19c02-goog

