Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9442B1DF271
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747473416; cv=none; b=dtscmdmWMIkNFe3FMccnwxRr7xj/xng1ccHJ8nrNe6ViTkONyW27Qb3kYziO4oJY4rZADLGvD+Nl8HN9/rCUM73h29Iuz06TX4KW1wDI/8BLVBqcEb9uF8nl2j8rMmqcjTMIQMfwjWwfIxtgIoh/9m0rSTGqWGQYLUpFFFFotrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747473416; c=relaxed/simple;
	bh=YTRMDon1bbH1VEcrlHc63BkhAwnfRloZ/j1aJBIxrwI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j6SnxcoopwSN9ndTLRJqnsLl46d4KidktGVpjEJeqLZLskNjH/89nSA4SgTNy0R13bWIUNr1G3me/zyxevgfB5k4haZ3lt8jiAatLLAAI8CfIW6d++FXg7FGVduVPOGEZf8EHCptn+OMsXT0c0FN8eOmpfTXYWbWuWf4Zorr1P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A47o9X4f; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A47o9X4f"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso14957515e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 02:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747473413; x=1748078213; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDoNlRqiItndadEJ074/sC5RRxG1d1oYzgqZU9Rxc24=;
        b=A47o9X4f4GesbzXb3cE23y3GfzoTipEJ40keQiMplKvF8R7cpfUDHMFYgyLNXv+iZt
         DDR9xdLLoGffQxXCOPzrs7MjlMUOy0JGoHWcivYTuG7mIJORd3864FiJ29E9Dvv810yM
         0hAOVlMtjmae4Y94BcnzGzYxqf+9XSn/HF9SxqW6sT9pIaR74Q5ayAC6w5nS76leL1DC
         +XZX4Z9Zb7McJpFDuYS4+VVMaugI1jZ0WZNO4BKPG55jywlcTvHOHzHaVqg6mY7X3QFE
         fyTOV7UorJEwovSm5+151qhsr5Tv1ddrOge+cQ6lMFENyRKRGYkjuxAS+PEPxshrOWIX
         Pstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747473413; x=1748078213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDoNlRqiItndadEJ074/sC5RRxG1d1oYzgqZU9Rxc24=;
        b=EVSE7BvRMTIYKV5Iphc7eMu2+Z+yNdBLYu60u1FzumFnw3n6QQm8syUVFm6XOcBv9i
         05Bvds7H8FjB2u0lt9mwZqK3rxKeCJwNJBY2MRe8XxxAG60xG7L4tvx3Qlo4PqaFELJq
         LwaUcG6Pg9YAn9rAVNiz26nULXKKGvex0qRaHNjWyqC8DSQByegeqcaphR8BNKM1uNwr
         pcffWLmNSKIG1qnj2DYoQFUTjvdqJjD3Hm5xOzT2zN6slBS5WlCvW5fcW942ChOyPU6H
         1abTQC6XOJEXdcvT0jKM6XRstYbIvC7ljPWtieqvP7T/M4pu/gG1fDSr8Smv06aKzP9X
         8B6g==
X-Gm-Message-State: AOJu0YxhzJo2cCL5rHvQjFNYYkNqKuzdqM0iS2FfGx9YQQd51KS/+QwS
	MGrVmXAFl8MslPD+dQVAR0x6aLW3mSXHQV1tsqjCGL9oZGiJZ2iHD9rw3afsVPBYYbpaVDlvWqT
	t5cvjN9zgekaKjicReRRzmByIjz6Gqr19QAB72Tv21PZksyG1ibZslwrB9wFXXOdREx4gbPYZec
	zG4+qVXp7g5Cs9sIvqiuNajossKYTElliv4w==
X-Google-Smtp-Source: AGHT+IFwO+w4TLTta2LbHnxhnJljQlZZ+ZqN82hjZFvLHt6QcRo8zELLQbatUM8N6m0AxQuQvDJYte3F
X-Received: from wmbea10.prod.google.com ([2002:a05:600c:674a:b0:43c:eba5:f9b3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3d07:b0:442:f904:1305
 with SMTP id 5b1f17b1804b1-442fd93d54emr62847335e9.6.1747473413005; Sat, 17
 May 2025 02:16:53 -0700 (PDT)
Date: Sat, 17 May 2025 11:16:42 +0200
In-Reply-To: <20250517091639.3807875-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=ardb@kernel.org;
 h=from:subject; bh=C31qclDK+T9suY/4QZ4rdvfNkVOVPbLM73aWDom88co=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUMj+GeywYdb4cfS2Ob2HfG00HuvfPeZ1gGh+qNMW3O2r
 XabesCro5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEyk+wkjw8vT18rTbwgfPJl3
 9Z6PkmbQppDC8ut9tovbA7btVH3T/52R4UZQ7dWkhQs7fL0PpfksdbBuXMGqfLP18mSGj3xLlt9 p5gAA
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250517091639.3807875-10-ardb+git@google.com>
Subject: [PATCH v4 2/6] x86/cpu: Move CPU capability override arrays from BSS
 to __ro_after_init
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

In order to allow CPU capability overrides to be set arbitrarily early
during the boot, the underlying data objects should not be wiped along
with the rest of BSS, and so they will need to be moved out.

Given that CPU capabilities are set at init time, and shouldn't be
modified after that, move them into __ro_after_init, which is part of
the statically initialized kernel image.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/cpu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 67cdbd916830..579d5b84e183 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -704,8 +704,8 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
 }
 
 /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
-__u32 cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
-__u32 cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
+__u32 __ro_after_init cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
+__u32 __ro_after_init cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
 
 #ifdef CONFIG_X86_32
 /* The 32-bit entry code needs to find cpu_entry_area. */
-- 
2.49.0.1101.gccaa498523-goog

