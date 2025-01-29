Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB01F37B7
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190572; cv=none; b=aJmmq9XdLywHtZxAWjz7IvqAG9QMAs3BhjIsNXiLlwWRpEVauw0Av6eNRRy9AOZrtvNSfsXDtWdPgM58cAddSzfzgGjtFqdWwlV93EgHkgFHmD92aomB5xK9AMFGBKMgqEwvAftsxLPzMI3caJXRHnZF6pFTuix163papvzr8RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190572; c=relaxed/simple;
	bh=PhxBtYJUW/kKgXQ6h3YdeGhAEyBHcClaMjIq80aDBUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EMDhrm6mLBX/MN3zDMT/LutpaTt5NrAAzL6LDpg39hKPzntgWE9PvqS39zFH9HhLUAZps513/1J3bQPAzUdMJK6hRm/Jg+cMTPqxsvI9IhN3s/YJiU6JZlPp/PHzMLVhdQT099IO+D8jAp9eeSh1fV6Rm9wp8mHuU6Y8ILbXn8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Me1zxBgo; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Me1zxBgo"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21650d4612eso3943495ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190569; x=1738795369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m0+bWUW0pfRrXDtFyRBgF5DnwWrUxEqL81u9NMeAeCs=;
        b=Me1zxBgoXq34sGQb77SNNdIob1wQAfZKJqPNRmOIussKiF5kaXYIth1944NH6pcQf2
         xLdJFygE/CLx/HMZg3i87klYl08OLzIUkQ0U3WFwjiSBcVGK2m9xqYKH4c4jnCwG83Gy
         hMG0+Q+tsgN08NGaymKNxThG1RODu6ADFoo4S9y9ml5tRO4xXXeZC26tuW63OUP9ipdS
         7dxUFEBScgXo5tlLRtTSQ07lx12f0SyUYbD6zle+X3GYlZtQvlZZafAqVK5ht0Dmmi0u
         G3ElVJoZFY6JMLGsG3bGlfdYXeYkOkBK5okvKOUJnK2x/w59T2k9mh422oik6BKmloCc
         m+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190569; x=1738795369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m0+bWUW0pfRrXDtFyRBgF5DnwWrUxEqL81u9NMeAeCs=;
        b=KnhII6T4YEeLgbOhs04r1sjoARfxkANak3KsHUlGUex/cSOTQNLihvvqf9YTrUsDpf
         eC8dkvByGsbXcZ/KI7ZjStIyM6Xgvc8mC+d1YxXJsS/NvK5vDn0vLym1j+rp9mDW7xHO
         2hjPcuJvi/sx3ajW7Dhybd8ulg8pbwwnqzS72hNLEKWEcgXZuzUpp5lfsBLSz5BGHLAc
         3NFEv27nK9CoVtbar3pMYV8FKzJRmyn5yl9iYeOizD37cyCyi+mARUabDBqPCq5sz0Nk
         SUIhtBFTw928l29YZI0j8Peo4Bmb3E5VdeKn08F37tbzTaFybGKiDBE0TmdqNILszYGN
         wsQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEbHukoBD7qNiqmkQ80pRWVO7UNkouw1KgDfDdrl7JdjmtG9nNKQWtewHNVVTtBR3I6BfNwDE8zBb/cxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpkMwuTWFjXT8XG+gI0Ol5m98LRHmIdCYAELIMKan8ui/MlYmB
	p1UqkZpw/Zk4pEEnLykep8bOyGIGfqnfeTEURQPRxfQ+GQBMFgH8lChyl1hbMwGMAOuqXw==
X-Google-Smtp-Source: AGHT+IGzEL5Rip0Mz0fmGy5xX7dEt6FjPy6j1I5Lgvi49arCFvPrf2CjjL7zxLhk7rZXQGyKts87I7hf
X-Received: from pgwg3.prod.google.com ([2002:a65:6cc3:0:b0:7fd:50ab:dc45])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:498:b0:1e1:a647:8a54
 with SMTP id adf61e73a8af0-1ed7a640d32mr8499455637.20.1738190569677; Wed, 29
 Jan 2025 14:42:49 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:50 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-22-fvdl@google.com>
Subject: [PATCH v2 21/28] x86/setup: call hugetlb_bootmem_alloc early
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
2.48.1.262.g85cc9f2d1e-goog

