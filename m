Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7521CA16
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 14:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747578207; cv=none; b=FSQeOuPTiH75fp7pTX4JeN48LgLPfz16OVW3yaqdxcdt+glIcMxxka+MhIJgU3un/p7DiwsJiDxVZr5Aw2m4n6q3AackFRlhnskPbUAzjWC1/teXij7Gq0cgP4196Akh/4XiChmwkKfOgjWAtI4Eif3S0aWM6GI5/5ekDGTZDYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747578207; c=relaxed/simple;
	bh=u4nzde3IqcYplyBX2JM423s2ztuIqT7tNIImFrF4mBY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C/JPk3jNY20jpei7gcH7iuHkAQmVynoVUXMv5z7MXhc0aOsjyGNUgNkGhrQwK3kTSYwoIluu5Q2WcEq1Jha2tDhNipJcq4MYPrKN1hbIIZVHoOCi93zLWrxQuZPHRDgXBm1SH0xQr/IVsIdjLpIIlsgBd8z7xLn3Pj3A8j+acp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C3cC415U; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C3cC415U"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-232054aa634so7723215ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747578205; x=1748183005; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jw2dpSffr8RX9goKmQzU5QzfxiCiCR6iGea0YOCC1M4=;
        b=C3cC415USGnCawAWVoV+Y+8nCijGhnxcfjZW0bdNItrsI/r7J9m6y9riKf/yjtC+Dd
         2JLdRKb2LnGAv6fTxoXaB0JSyyzzRlnxu7SeTc8+AyQc2eYtKmf2Dqmu6SwsWmhGXWIy
         RNR55HHVMNuQI2n8HL90FTdPkBCq8UTl+IMBVu7YQSEBffj4GoGLqXP1gIYY+dSMhXGB
         z6gPwf/R75Ep/kzZTxOQgIpGI3clArv/BaNqA+tqQgx3qKVAiVXgp8ZXhJZq5f3wOJJN
         dnwH9lftPqnXzyT0pQ87/Q+T8gViJkSFcZcAkeLtWP+OBR6bfpIME4rRKc7lT908uEoQ
         gEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747578205; x=1748183005;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jw2dpSffr8RX9goKmQzU5QzfxiCiCR6iGea0YOCC1M4=;
        b=BNL7lQYnbYN2fIwkVyU/SLrCXGyCTNpRfWSHPwzEcvL5aNwXWmtU/YRk3OITjyEy0f
         qfxLovdVQVdmtgvDIQRX9cDfs4sijbEVXkX/zGVnRQ9O/5kmyekiFXhgzaUM7yBUyBdC
         t8SmLJlcfS0UhGzBYPrqvnJqo22Rcq78M3x8YW87/9Qd2ccRMix9PSRcPNM9mLeRPvhl
         yXbcMwHrbuocBM7xKhKqnVgJHkLIo9EEze5BTESHnQxIJH0vdkpp+1sGR5DbO12NqORH
         wbRNXB8nByiGmPGXoK2dtNdo9gxvS4PcLuy3TPXvzl15KKFPw/bgsIsYlw8TkTPyqCcN
         dDrw==
X-Forwarded-Encrypted: i=1; AJvYcCXyUrBAB/rWSwjwutCTSnfp6qCPvOo67ODPWUBbBtM/ni5JeumOghsECaZKD9bXESekIPA7JrAr9lnFEls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ELY84V+VZS9Sv7Jnw1iYNLn3qfTFjCKW/4PPVGf95ewU6rdS
	GyrwGYF56T6222hFKeQOvjlxbiybpF4c+XAfTWhuEVScwvJAb+ZB8Hekr93Si6qniHZp+UAeiaA
	f/C8QSBQU8uYKZofgTVr8Nw==
X-Google-Smtp-Source: AGHT+IGzKyPFMK6YyK4TGGsc6lr8b7/MNxcwKiEDM7oMNN3Ku0K0uTb4I+HdKbUzhe8ilI6IRXoO+yKkaMNPsrkp
X-Received: from plbp13.prod.google.com ([2002:a17:903:174d:b0:232:1c72:1f78])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ecd2:b0:224:2384:5b40 with SMTP id d9443c01a7336-231de31b3dbmr148737165ad.24.1747578205410;
 Sun, 18 May 2025 07:23:25 -0700 (PDT)
Date: Sun, 18 May 2025 07:23:15 -0700
In-Reply-To: <20250518142315.241670-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250518142315.241670-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250518142315.241670-3-changyuanl@google.com>
Subject: [PATCH 2/2] KHO: init new_physxa->phys_bits to fix lockdep
From: Changyuan Lyu <changyuanl@google.com>
To: rppt@kernel.org, akpm@linux-foundation.org
Cc: graf@amazon.com, bhe@redhat.com, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, chrisl@kernel.org, 
	pasha.tatashin@soleen.com, jasonmiu@google.com, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pasha Tatashin <pasha.tatashin@soleen.com>

Lockdep shows the following warning:

INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.

[<ffffffff810133a6>] dump_stack_lvl+0x66/0xa0
[<ffffffff8136012c>] assign_lock_key+0x10c/0x120
[<ffffffff81358bb4>] register_lock_class+0xf4/0x2f0
[<ffffffff813597ff>] __lock_acquire+0x7f/0x2c40
[<ffffffff81360cb0>] ? __pfx_hlock_conflict+0x10/0x10
[<ffffffff811707be>] ? native_flush_tlb_global+0x8e/0xa0
[<ffffffff8117096e>] ? __flush_tlb_all+0x4e/0xa0
[<ffffffff81172fc2>] ? __kernel_map_pages+0x112/0x140
[<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
[<ffffffff81359556>] lock_acquire+0xe6/0x280
[<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
[<ffffffff8100b9e0>] _raw_spin_lock+0x30/0x40
[<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
[<ffffffff813ec327>] xa_load_or_alloc+0x67/0xe0
[<ffffffff813eb4c0>] kho_preserve_folio+0x90/0x100
[<ffffffff813ebb7f>] __kho_finalize+0xcf/0x400
[<ffffffff813ebef4>] kho_finalize+0x34/0x70

This is becase xa has its own lock, that is not initialized in
xa_load_or_alloc.

Modifiy __kho_preserve_order(), to properly call
xa_init(&new_physxa->phys_bits);

Fixes: fc33e4b44b27 ("kexec: enable KHO support for memory preservation")
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 kernel/kexec_handover.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 69b953551677..f0ac6a9170f8 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -144,14 +144,35 @@ static int __kho_preserve_order(struct kho_mem_track *track, unsigned long pfn,
 				unsigned int order)
 {
 	struct kho_mem_phys_bits *bits;
-	struct kho_mem_phys *physxa;
+	struct kho_mem_phys *physxa, *new_physxa;
 	const unsigned long pfn_high = pfn >> order;

 	might_sleep();

-	physxa = xa_load_or_alloc(&track->orders, order, sizeof(*physxa));
-	if (IS_ERR(physxa))
-		return PTR_ERR(physxa);
+	physxa = xa_load(&track->orders, order);
+	if (!physxa) {
+		new_physxa = kzalloc(sizeof(*physxa), GFP_KERNEL);
+		if (!new_physxa)
+			return -ENOMEM;
+
+		xa_init(&new_physxa->phys_bits);
+		physxa = xa_cmpxchg(&track->orders, order, NULL, new_physxa,
+				    GFP_KERNEL);
+		if (xa_is_err(physxa)) {
+			int err_ret = xa_err(physxa);
+
+			xa_destroy(&new_physxa->phys_bits);
+			kfree(new_physxa);
+
+			return err_ret;
+		}
+		if (physxa) {
+			xa_destroy(&new_physxa->phys_bits);
+			kfree(new_physxa);
+		} else {
+			physxa = new_physxa;
+		}
+	}

 	bits = xa_load_or_alloc(&physxa->phys_bits, pfn_high / PRESERVE_BITS,
 				sizeof(*bits));
--
2.49.0.1101.gccaa498523-goog
