Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6545920126C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514475; cv=none; b=sddy7zpDb7x33ZR9AVgj6TpyIamV5qk3CJZATD3zWt+04Fm2JqKf4YBNiIqropwrMCGTODmiwQYfzRFi0+eqaEQCQCdGbucO8VQXwGulW0uBjoCes7uZooxWS0lWZI4oqrtXyIOZcTypDODxUlh4mVQ7MCs5NJLlZKeXYZvS5Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514475; c=relaxed/simple;
	bh=r3QzTeFYDf09MmkMKibn4mU/T2Bypce6yg7A92nQvFQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=A3W0/DGUFC2giF9vEuITsYlNYeJ0WzpFHZaNK1vv69FU5rCb4IZ+96XphqEcqFjobeijAPTcFivxFegZCRpanoj7MG4OoFVn+dTt6Z1w1v5ZOqwjNl/KV8Ibu3lRnlwOPb98ja670dfv/EF/ckZTtzDQnWs0Ky27UeqTdaD2FhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BiBkBbJk; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BiBkBbJk"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39ac9b0cb6aso3555227f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743514471; x=1744119271; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UqrcYPPBRmQhvMW/kM+vDe95JQ3RLhDp/53XvXrkUX4=;
        b=BiBkBbJkUGITAKvE9WBVL9geYoblbStAo+zNyr73IuOAsV+PkMzrnRFcIxuLZPzku7
         O7H8OH1Q8L6bMXCpa9TE7glKfrA9YL3hw8AWw/5Y4+lD7+CS9C48spHSmwalbLd6razk
         kEY44jDTaI4NKIojiZTUGWOqbVUxRlH51CYWsR+k0OImx7TtYSJgvm6QVIhdxp2M72Vq
         P281Ei96ieWaOK6fVCHyEOsj88pUq9n6TFLRvW8qBop0DOtYe/Or74mwfkYQu0XbvEJh
         Lh3vNQZb+jxVIc1v1NEf8Fu6GYfddwHb8oVSUQfr/sxcj8PDBaRy3dx7+S0gtoRextwY
         Rmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514471; x=1744119271;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqrcYPPBRmQhvMW/kM+vDe95JQ3RLhDp/53XvXrkUX4=;
        b=SN3gTSZ240vUGdnEjw5cdnhxeiuyjIUd9votVpmQibqF7NyBdrRQc6fQVTgUgbrOIo
         eSUz6jkadenpH53GX1OVBG38w7WYKb1W8+pwmOMfHPXwfNc2PP4XWL+zkO9zgiK4pjlf
         myGK/JRCLgxosy+2zeUfE2Jr0B90UOSgmWWJEqbRsm/rCjAc3krDHhJCJkVE0i2Ioj4K
         3Nn5LDoTxJwVcTCrndLdmGomJqWlvswIrHOKhbdQP5/4pbPOYc0PQNZ87Bkq5blixxqR
         r06LtR+oM8kxFn2BxyxrWHWS5Usk2q0xu+Ehh2o0WILxAUVEpF86Org+Dz+Kxvx3uaI8
         um3Q==
X-Gm-Message-State: AOJu0YxrbJRPOgbXAfh550nhgy//i98YQSFpgtfpP9FyfijFheGW52L7
	jCYkV73HmwQcxSR67utZNx1V9CTOkfZD2SdR0saVKTl5rii4QyJJ02uVVd/q65c9UmYsuA==
X-Google-Smtp-Source: AGHT+IGmSRiC9l1BwOq/7ZNiSzTOBdNdhV6XVf3LSR16Q1blbswjg9Bi8FtklNjOzc3n1robVqTSa8gn
X-Received: from wrzh6.prod.google.com ([2002:a5d:6e06:0:b0:390:f0cb:a7f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2508:b0:39c:2688:4ebf
 with SMTP id ffacd0b85a97d-39c26884ef7mr1622849f8f.6.1743514470878; Tue, 01
 Apr 2025 06:34:30 -0700 (PDT)
Date: Tue,  1 Apr 2025 15:34:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3310; i=ardb@kernel.org;
 h=from:subject; bh=Vzt9FpakgAEX/BbJnGXYZ4F+QtVe6L2bldOo2LnVndI=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf3168j3t6uO+O2wKm1OedVWvED33tQXebdPXW9jffI9x
 vyypPTRjlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjCRur+MDLdrVogJJbK98jjS
 eOSs6aINsnP2HLE13b/S2yXp763XVaoM/+O3vA6qLeSROP34nuZ0Nb0Ig2MH2x6eeN4Xe9ks7cS 0BRwA
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401133416.1436741-8-ardb+git@google.com>
Subject: [RFC PATCH 0/6] x86: Refactor and consolidate startup code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Start refactoring the x86 startup code so we keep all the code that is
shared between different boot stages (EFI stub, decompressor, early
startup in the core kernel *) and/or needs to be built in a special way
(due to the fact that it is C code that runs from the 1:1 mapping of
RAM) in a single place, sharing all the C flags and other runes that are
needed to disable instrumentation, sanitizers, etc.

This is an RFC so I have left some things for later, e.g., the SEV-SNP
init code in arch/x86/coco that is shared between all of the above [*]
and will be tricky to disentangle; there are also some known issues in
that code related to EFI boot that we are addressing in parallel.

Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Dionna Amalie Glaze <dionnaglaze@google.com>
Cc: Kevin Loughlin <kevinloughlin@google.com>

Ard Biesheuvel (6):
  x86/boot/compressed: Merge local pgtable.h include into asm/boot.h
  x86/boot: Move 5-level paging trampoline into startup code
  x86/boot: Move EFI mixed mode startup code back under arch/x86
  x86/boot: Move early GDT/IDT setup code into startup/
  x86/boot: Move early kernel mapping code into startup/
  x86/boot: Move early SME init code into startup/

 arch/x86/Makefile                                                             |   1 +
 arch/x86/boot/compressed/Makefile                                             |   4 +-
 arch/x86/boot/compressed/head_64.S                                            |   1 -
 arch/x86/boot/compressed/misc.c                                               |   1 -
 arch/x86/boot/compressed/pgtable.h                                            |  18 --
 arch/x86/boot/compressed/pgtable_64.c                                         |   1 -
 arch/x86/boot/startup/Makefile                                                |  22 ++
 drivers/firmware/efi/libstub/x86-mixed.S => arch/x86/boot/startup/efi-mixed.S |   0
 arch/x86/boot/startup/gdt_idt.c                                               |  82 ++++++
 arch/x86/boot/{compressed => startup}/la57toggle.S                            |   1 -
 arch/x86/boot/startup/map_kernel.c                                            | 232 +++++++++++++++
 arch/x86/{mm/mem_encrypt_identity.c => boot/startup/sme.c}                    |  45 ++-
 arch/x86/include/asm/boot.h                                                   |  10 +
 arch/x86/include/asm/mem_encrypt.h                                            |   2 +-
 arch/x86/kernel/head64.c                                                      | 302 +-------------------
 arch/x86/mm/Makefile                                                          |   6 -
 drivers/firmware/efi/libstub/Makefile                                         |   1 -
 17 files changed, 372 insertions(+), 357 deletions(-)
 delete mode 100644 arch/x86/boot/compressed/pgtable.h
 create mode 100644 arch/x86/boot/startup/Makefile
 rename drivers/firmware/efi/libstub/x86-mixed.S => arch/x86/boot/startup/efi-mixed.S (100%)
 create mode 100644 arch/x86/boot/startup/gdt_idt.c
 rename arch/x86/boot/{compressed => startup}/la57toggle.S (99%)
 create mode 100644 arch/x86/boot/startup/map_kernel.c
 rename arch/x86/{mm/mem_encrypt_identity.c => boot/startup/sme.c} (92%)

-- 
2.49.0.472.ge94155a9ec-goog

