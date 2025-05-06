Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E40233739
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546545; cv=none; b=oEh1MXeDkYFbvdOTfqBy6MisyUwdT3WhW+XST8Pv9YWCKon3BKlG83zn3EzDAJ96Vf1BWXhp+25CzjfiW5e1AYcpOCjmqJEH+NSArYN+VEfddklDuEsmB3gk+CfMdhTrTdSYaLOCDHYeq3MemhoLlvW87lq6N9HoQSGLl9i8rug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546545; c=relaxed/simple;
	bh=UARF0lPC1EgqEyWogaTtRAWdzkCpuJQTtUJwEt1KEqE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=roisb4gw4RaHlevrZhNHvsblnm6l28BM91eCmkpLpWtymM8qMUy9KZ3XhE5d8GqvPYe88lEC+CUhS7LapQHvV59wZ5wa1yfTfFoJ+cpP45ROr3nb8sO3vKY4V/Zyxne5bRujyRKZ3DDwZGrWFlpXIGFd5Vcek07bYaf/02hHB68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LYErRW7T; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LYErRW7T"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso34367355e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746546542; x=1747151342; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gK5YYsEddwXo7K+PVd1vswKQw5Ntnh4pwifpdx+QGmM=;
        b=LYErRW7TifPfuOyaXu+24CO4zrdibI35fOEtn/RRq8LrY4DB+UpNwHfCjO2jmFncbc
         qifCSLORe1R56eZA2nNkXAMPu0p1gyk7FbwGLP+bcRZ8GNXTlUsNYSN564yZKiHk8N0F
         Xyw8En/J0ZGN40piYCnDQMyLyC4drDPZQ5++R9mtNIQoINe4vEsQpCeba2SxKEaYEIb6
         ahIcufaCnXILh5axXyNXJr+GINc9RrRwM/AIyo/iZGwYo1N5RrWHJdLGH9EmBbzLEAxo
         3lySB6fObn2IMkNYCmUlwYSo3dv8un3ofYjXyyXlP6jXwIheeoVgkhejz4eVFSgkKP/e
         CRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546542; x=1747151342;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gK5YYsEddwXo7K+PVd1vswKQw5Ntnh4pwifpdx+QGmM=;
        b=Wd4BG3qh1fOQBExlaaHB6yjzeS5f6QIgZSJV/Ft+KU3atgPEv6LUrSMJCIfQXTYkSJ
         UBngPnPc87qOq5JnodKl5Ws/iHoR+YKPcZxSPg2u2ezSVArWRM4M8JZFCLvRI6lnySW7
         D0fewT8gLOJaktqK1OrFd88pAcKd4r0s8iMCB/ywqV0NfOH7N12yUowwbUWVNybBCqoD
         HD5J//DRS06yyeUMNAqoQzUUq1aNCBqNMS/l9UdbY7gtKOrl09m6VyZa43PKBF2S06J9
         1xv9I9UmpxKOikw3irHd+GEbeUcc95zf8RJO+oIb8LAB8jsRfDzhLLip2unfOBBv4BJw
         NpoQ==
X-Gm-Message-State: AOJu0Yx86TbpZSvmFx7s3K/Sg2YZXb4lP3DGeaX0KccVlPLBePUx/8iv
	muI2jK2A9etHGFiAoYRuXEMrzfMAyNUocti/fg21UuRApmIY+PH3zU8yqyx6s2X91ughvMAPW13
	u9mQzXlsrpjxh+OSkE3kOEfMlRbPo1mfe5sh0cRYfDjNnJxrTpkACRUjPmlCjQ76FzSXEL57BeC
	lGo8ufmM9y1s5ji/R0iCHZcSLzr+7oIg==
X-Google-Smtp-Source: AGHT+IH8asEO33RG7HIEzO6SHVvsnrxlEmfN+IjZQpkLJsr8uJztEAG4pk/eWJ4oxoCwTyYPk5Rel9B7
X-Received: from wmbfl15.prod.google.com ([2002:a05:600c:b8f:b0:441:b38b:9cc3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3ca5:b0:43b:cc42:c54f
 with SMTP id 5b1f17b1804b1-441bbed4726mr161333125e9.14.1746546542017; Tue, 06
 May 2025 08:49:02 -0700 (PDT)
Date: Tue,  6 May 2025 17:45:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376; i=ardb@kernel.org;
 h=from:subject; bh=tAfsWs9fcPLcgMGHyakjWB8jEBYqibaK6ilnBZu6r94=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUNKb27e3TMrNr8+xXqCpfkp35e5Si827Gw//sjHv8TB7
 YbN769LOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEsjYxMjxcd9bnnqT6GanQ
 oGIZxyM/X62t3WQ3b+ryYNv2eUqiPe8YGV6u/HLj66sF8UWGwZ8z91TuCzO+lqF/Ndm08enfDdZ Ln/MCAA==
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
Message-ID: <20250506154532.1281909-5-ardb+git@google.com>
Subject: [RFC PATCH 0/3] x86: Robustify pgtable_l5_enabled()
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

This is a follow-up to the discussion at [0], broken out of that series
so we can progress while the SEV are being reviewed and tested.

The current implementation of pgtable_l5_enabled() is a bit problematic
because it has two implementations, and source files need to opt into
the correct one if they contain code that might be called very early.

pgtable_l5_enabled() is widely used in functions for control flow, but
also hidden in global expressions exposed via all caps macros, which
typically denote true constants, and not expressions that change value
based on whether some global variable is set.

So merge the two definitions into a single one that always produces the
correct value and is as efficient as the runtime one it replace. Then,
set the underlying __pgtable_l5_enabled variable before calling into C
code, so that inconsistencies are no longer possible.

Finally, replace some of these global expressions with an ALTERNATIVE()
based selector that does not use control flow to choose between the
values used for 4-level and 5-level paging.

Build and boot tested using QEMU with LA57 emulation.

[0] https://lore.kernel.org/all/20250504095230.2932860-28-ardb+git@google.com/

Cc: Ingo Molnar <mingo@kernel.org>
cc: Linus Torvalds <torvalds@linux-foundation.org>

Ard Biesheuvel (3):
  x86/boot: Use a single source of truth for pgtable_l5_enabled()
  x86/boot: Set __pgtable_l5_enabled correctly before calling into C
    code
  x86/boot: Use alternatives based selector for 5-level paging constants

 arch/x86/boot/compressed/head_64.S      |  6 +++
 arch/x86/boot/compressed/misc.h         |  3 --
 arch/x86/boot/compressed/pgtable_64.c   |  6 +--
 arch/x86/boot/compressed/vmlinux.lds.S  |  2 +
 arch/x86/boot/startup/map_kernel.c      |  1 -
 arch/x86/boot/startup/sme.c             |  9 ----
 arch/x86/include/asm/page_64_types.h    |  2 +-
 arch/x86/include/asm/pgtable_64_types.h | 54 +++++++++++++++-----
 arch/x86/kernel/alternative.c           | 12 -----
 arch/x86/kernel/cpu/common.c            |  2 -
 arch/x86/kernel/head64.c                |  5 +-
 arch/x86/kernel/head_64.S               |  7 +++
 arch/x86/mm/kasan_init_64.c             |  3 --
 13 files changed, 61 insertions(+), 51 deletions(-)


base-commit: ed4d95d033e359f9445e85bf5a768a5859a5830b
-- 
2.49.0.987.g0cc8ee98dc-goog

