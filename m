Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204FA2857CE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744292504; cv=none; b=MaE2jSOda2blB/nzUgrxlnlNRgqn+OmvjKh342ay1XvYK/bWxhzPB7WdtpXIU5IoZ1+NdJHAtCzsjpp42D0Uud6Pa3qXIcKRll+7NS5yPWhkTKv21ujxVvhrETahpx1JV72/XzyTqUlbS2BK637ncgVVtWQl2nHgF3BTa1Ndv6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744292504; c=relaxed/simple;
	bh=wiuhW5evU/Rc29bp6zkAQCWkITejo77ob/z9Dk+FeN0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=JG722srbqiT4KNyrVVrvi73b/+USohlTOL+LN5v8XJsXrgXnNPGcjioxlq9svhYVBrOUD6kE7WbIjasStKgNoQfcC1tK3QfRhek1JQRbrggbD5ZwVfOJ3oEFOG917s/EQV438k4A3yW8Z/jJjz/PfbACKIOUZFKDOgQiQ49zKSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QHGCg7hN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QHGCg7hN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ea256f039so7523745e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744292500; x=1744897300; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F5BBjKPIekYrEeVKo50JLFBsOnCg/0jyb52yewb+mRo=;
        b=QHGCg7hNsq2glfe1EvHXCKVz0re+rJ65OeMZ1hvKzOcGvqkwndoQHh1FYWZM2tQ3Vz
         1eFebQ9MNdHgGFdToREpKtsCFG8X9EQdNHdBBuv4xBQGX9dISp6h/5IE9SW9bRvkGGi3
         5HYOQ5DfhaKuhxY5sAa4gB2dPvDTdE75ZH5F+DcjcWYNajI1b2qBDNX2Ei7OM9OBjtiJ
         LqqV8dKomKoijz8AfeEzADaUqxeDpTJB3W1oS60CPUKxe7DsQ9Cn90L1OEMSgXe6lA8z
         ks8tN6hf5mBc2SrfFntrT83mVSDFwJVKsVY/BR5IRBiTF2qqLS5DWIrSxdvuBilI/liS
         hG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744292500; x=1744897300;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F5BBjKPIekYrEeVKo50JLFBsOnCg/0jyb52yewb+mRo=;
        b=IzQqet1HnKdr8QFxJm9RvegbXxrKkzrKQfeQnm4wurm5SPdMacq+oEFSkmdqUN24x1
         3RWOB8aOU75J9Y4c5TjJqVP2NufKGFHSAR6Vs0zjqf3p1PwvW5vjIDvwmF5EMSixzZeX
         lgrpSzyS1g7u0+mGYSljgKxGidih8naPWOA+YIm+IkiBhsnrOxElsmbHmnN2+lbyJ+i1
         4bHlaUeS4Gu0lxfz7ptX3tVfTcun4pPgSagm46vdviVV25z4UJlmqd9VXOx+9+JtNUqm
         w3WB5zHHmpYSXHSMv4Qx+9seoDl5EdjE1tL+I0L8MEXMwAJPRAUqIe2WAwb6OiwRx6aR
         96zg==
X-Forwarded-Encrypted: i=1; AJvYcCVip7kvrrgwgYjsF0aMW6TJs/bTaO7b1KBVPFCmwLZJDFgF04TCwrxDGLNuH1BTRE+37XEdkJWApjyKHHM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk4tW1QCnUkkVCMDKmmIpNsUGdB+v1bJVMkEVyYvN7QDgZxI+R
	lX2IljhkQDcsTTqA0roVzCeKg47MKKpBTZ4XYDJYuJcmy+pBsgcwqAipDaH+qCxcb3rQYQ==
X-Google-Smtp-Source: AGHT+IHd+8MEBe16pE0XLxqL66PgJ7fdjUFAB3h4S7JE13Ct2X++z/lHUScP89jUOURI0VwTBl7NaPAX
X-Received: from wmbay35.prod.google.com ([2002:a05:600c:1e23:b0:43d:412e:82ce])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d27:b0:43c:ec97:75db
 with SMTP id 5b1f17b1804b1-43f2fee0322mr17874155e9.11.1744292500447; Thu, 10
 Apr 2025 06:41:40 -0700 (PDT)
Date: Thu, 10 Apr 2025 15:41:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3415; i=ardb@kernel.org;
 h=from:subject; bh=0sC8JgPvEW8/YSxATGrJydJbVmEf1dh2DbwZblMNlDI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf37qbrnNXUVT/gmbLN6qpyQ7xX/tOH5AyUboycVVc+85
 XZJfNHpKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPpS2X4X5Kk/81XWmJafqNZ
 p1Gzc5f7wxWXBB6wh7eUMZb869eLZGSY6ZJzbMmE2+Is+zt6H0u0FX+UvKOYuZFp/pPExdOYjnn yAAA=
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250410134117.3713574-13-ardb+git@google.com>
Subject: [PATCH v4 00/11] x86: Refactor and consolidate startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, linux-kernel@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

!! NOTE: patches #7 - #10 depend on [0] !!

Reorganize C code that is used during early boot, either in the
decompressor/EFI stub or the kernel proper, but before the kernel
virtual mapping is up.

v4:
- drop patches that were queued up
- fix address space error in patch #1
- add patches for SEV-SNP boot code - these cannot be applied yet, but
  are included for completeness

v3:
- keep rip_rel_ptr() around in PIC code - sadly, it is still needed in
  some cases
- remove RIP_REL_REF() uses in separate patches
- keep __head annotations for now, they will all be removed later
- disable objtool validation for library objects (i.e., pieces that are
  not linked into vmlinux)

I will follow up with a series that gets rid of .head.text altogether,
as it will no longer be needed at all once the startup code is checked
for absolute relocations.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Kevin Loughlin <kevinloughlin@google.com>

[0] https://lore.kernel.org/all/20250410132850.3708703-2-ardb+git@google.com/T/#u

Ard Biesheuvel (11):
  x86/asm: Make rip_rel_ptr() usable from fPIC code
  x86/boot: Move the early GDT/IDT setup code into startup/
  x86/boot: Move early kernel mapping code into startup/
  x86/boot: Drop RIP_REL_REF() uses from early mapping code
  x86/boot: Move early SME init code into startup/
  x86/boot: Drop RIP_REL_REF() uses from SME startup code
  x86/sev: Prepare for splitting off early SEV code
  x86/sev: Split off startup code from core code
  x86/boot: Move SEV startup code into startup/
  x86/boot: Drop RIP_REL_REF() uses from early SEV code
  x86/asm: Retire RIP_REL_REF()

 arch/x86/boot/compressed/Makefile                          |    2 +-
 arch/x86/boot/compressed/sev.c                             |   17 +-
 arch/x86/boot/startup/Makefile                             |   16 +
 arch/x86/boot/startup/gdt_idt.c                            |   84 +
 arch/x86/boot/startup/map_kernel.c                         |  225 +++
 arch/x86/{coco/sev/shared.c => boot/startup/sev-shared.c}  |  375 +----
 arch/x86/boot/startup/sev-startup.c                        | 1395 ++++++++++++++++
 arch/x86/{mm/mem_encrypt_identity.c => boot/startup/sme.c} |   19 +-
 arch/x86/coco/sev/Makefile                                 |   19 -
 arch/x86/coco/sev/core.c                                   | 1726 ++++----------------
 arch/x86/include/asm/asm.h                                 |    5 -
 arch/x86/include/asm/coco.h                                |    2 +-
 arch/x86/include/asm/mem_encrypt.h                         |    2 +-
 arch/x86/include/asm/sev-internal.h                        |  112 ++
 arch/x86/include/asm/sev.h                                 |   37 +
 arch/x86/kernel/head64.c                                   |  285 +---
 arch/x86/mm/Makefile                                       |    6 -
 17 files changed, 2208 insertions(+), 2119 deletions(-)
 create mode 100644 arch/x86/boot/startup/gdt_idt.c
 create mode 100644 arch/x86/boot/startup/map_kernel.c
 rename arch/x86/{coco/sev/shared.c => boot/startup/sev-shared.c} (78%)
 create mode 100644 arch/x86/boot/startup/sev-startup.c
 rename arch/x86/{mm/mem_encrypt_identity.c => boot/startup/sme.c} (97%)
 create mode 100644 arch/x86/include/asm/sev-internal.h

-- 
2.49.0.504.g3bcea36a83-goog

