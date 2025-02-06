Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5D61DDC0B
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867912; cv=none; b=HzyV2qvHZTiQJEiJgBVb116eA5yxnjIFoF/V8D4AtWiy+QHZipWY2hbRHxJTOMFwd02Gq8wrtzICidekussGcBEmchdWA8wqisHUStDRaJpN3MBZpF6kwHZ7xx2Pd0bnZPCOARDivE12bmBX3wzhLOZPLwwfGgK2fxvCI370ep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867912; c=relaxed/simple;
	bh=8gup9qocsMoQyKIiT/PYPMfM+/Pc3XHTTCQXaHLecVY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fD/LZ1f863Y3DPEdBLONie7S9UDbLsl30fW5KYnykWrp+XG09kmOJRAUcYapDzfm3Sk/J3vLNiGklgiLQWo7ZJs4ShpUYMuODrhTk3lh2xo0DK17YBfUNW/1URDSXeh2FrxGJ/djP0WI+9aKBKYsLrEJr1HlRO0NpiltFjy/JwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qztbxq+A; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qztbxq+A"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso3848147a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867910; x=1739472710; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2/3TeRATauBC6P9iV7Z+/8og+I9Z6a+H92nsoJ8VemE=;
        b=qztbxq+A8ebbECnBVafzxd2FcBEnbEY2L58E1btElBtYGdXGHCBz13BsGwQqs2kJKt
         Ac5IcPsGBUHLaoJFezudiGBQqmV1YqEfCCvw+wYsVLnJ14xDCgyAPkH6mT6N1SpYk2DQ
         OMvvgHYzFu/xeFjZFhnotPVf6jfc9se9rKYDpwVAX6lPsS0e83pFkPczvuj9ikSACiVQ
         Jp/jGDRe1joPmefNHzKx/XVu2pkRvrOYlajMkyruZ6BL/tvnQopTOGIRn9pwFwVPOHAi
         4WLSEouwMO0u2qIxcqRN4sjwobKgYTNzsdbVfSZWqf9ez4h1StmBC8+YfhNeY+9722Xk
         I67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867910; x=1739472710;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/3TeRATauBC6P9iV7Z+/8og+I9Z6a+H92nsoJ8VemE=;
        b=OnF4cOZ9e4ga76vDwDjH3JviDXdxaBr4qpC9CKK1N0vBBzNF3hMVmd0KCQmpMI+2s+
         9L4hlK9a6KeFqpAB8xL6jnsNtwEupcEeqSTGaezdJ4H/oDv6/Dt5FOAZYy+eEPNgQbeQ
         JjNdvKjI3QooGKsFDHPs/RIYN76X0QZoIEZDIjUi1PPvN25Y2rF2wU4RoQKcnkP5HHsi
         2SDRG+TZ00YyevE2cNCyhbvvkd86UWPluFw3hNwm/rLp9pcL4uB3PqK2IgUMN4d/aKt3
         s27hlE6Mq5qKNQHCPeYNgaBisbykigA0mFrLRr7TNf3/DSqOmhhqNDPr7/Rqvl39PX1J
         HlQw==
X-Forwarded-Encrypted: i=1; AJvYcCWrqcYfmQnozDnTbWBNQUGyjLtley+zyfkXcZT5yNdyLoVB5adkSgs/Y7AR9AAMUOUT76G/4/xNz927FiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1shr71J1R0aUiQJCp4BoQlA15/PIRO8AGnDcuB9sbQxqBI0Nr
	LlhxiOnzoDMVnITd8EeTFyeTcbro5vrW0d35uJ5l6K3TcvKyU0gmBFlvBc08g4hIEBrFkQ==
X-Google-Smtp-Source: AGHT+IFeJiIMbGUP+s5i04ssCNNkL93EOBt0wJtECDoXfHqJC0vwkVyoIA7fvHTV0zvzaIRZ3vC9thCy
X-Received: from pjbpl16.prod.google.com ([2002:a17:90b:2690:b0:2e9:ee22:8881])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3dc3:b0:2ee:edae:75e
 with SMTP id 98e67ed59e1d1-2fa24067d7amr209175a91.13.1738867910671; Thu, 06
 Feb 2025 10:51:50 -0800 (PST)
Date: Thu,  6 Feb 2025 18:51:01 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-22-fvdl@google.com>
Subject: [PATCH v3 21/28] x86/setup: call hugetlb_bootmem_alloc early
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Call hugetlb_bootmem_allloc in an earlier spot in setup, after
hugelb_cma_reserve. This will make vmemmap preinit of
the sections covered by the allocated hugetlb pages possible.

Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 arch/x86/kernel/setup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index cebee310e200..ff8604007b08 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1108,8 +1108,10 @@ void __init setup_arch(char **cmdline_p)
 	initmem_init();
 	dma_contiguous_reserve(max_pfn_mapped << PAGE_SHIFT);
 
-	if (boot_cpu_has(X86_FEATURE_GBPAGES))
+	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
 		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
+		hugetlb_bootmem_alloc();
+	}
 
 	/*
 	 * Reserve memory for crash kernel after SRAT is parsed so that it
-- 
2.48.1.502.g6dc24dfdaf-goog

