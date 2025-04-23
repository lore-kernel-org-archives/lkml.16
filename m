Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA4D275115
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406661; cv=none; b=JDb4hA7OM15lJDpJvR1tn7dZKREa7EOsDV46tOXr0UH1sTHKO+7BZMimPBes3/2vmxLCDsQ/c86FJlTPpPxE1qBYRo8xQo1dDa3nQejl55IER1v9CzWKtO16lBg2dNU58uA7NKUCZXTxQmVBNFSAABv+XWhB4XIQ3rJ1uR7FfTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406661; c=relaxed/simple;
	bh=TF98LjU0DxqS7tScv4TESve8IJsu/JdhYrzSpfQGKFI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WwiJOq/u+E6DDLfTGRIQcZxXvClLIOIZ27bv88MbsV8doYwtUw69FJj3gi8AYzIzmcW6nIHs61FTlAMkTvIlXoxrLXDs3IdnWEQaKTemvZ5EbIWRmcZ9q1VK0/YLZ0uuLi3LVpR8SVUCUlD7vQ/5BpDOBhJab30WJ28Ai2MrtP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B2oA/Vg3; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B2oA/Vg3"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso44961635e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745406658; x=1746011458; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EIqJY6fyIWDHD3k4SVjhOIrIDaUIAapUqmm2UCnx5PM=;
        b=B2oA/Vg3B3x73NRUgo//EbNDKwncoDFyRRvTWK4srSxom5X23MyzF1CT4/PVF1CRt7
         1PqYhPZbn3qoXbwrdAVzPwQmyLFJBqQ18FXeUGp92WyaAVf17tnqAxWpUqjNAtW9j+hi
         zCmdeOmj0aRc5u7tN6rMwKZwXhWQNh1viUv7TKmoe8V5C4AmUcep9BoiNmY+r2DmH4ha
         Rm+qrYHGjflX6Egdg0byym8RqqcftXAByIpiLy4sRWSVjxSmb9KljI/HRrupxpL3as9j
         cTukRC8XANsSiHlQ6qk5i3jt0oR3pSTfjNVCT/l/eK2ndiGlGUZZ4Ocwfc3usHvaEXFU
         DAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406658; x=1746011458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIqJY6fyIWDHD3k4SVjhOIrIDaUIAapUqmm2UCnx5PM=;
        b=qhF+I9/90Tl5KkTxEfmLmxst8EbsUCMoirrXxzVcfX3+9A/H/zXhDvQnqwPIPIzNdx
         YA6mdDnHuLqCpkUslAbvJFhXPe/3KC1SiSvGkh/baUFKBhH5dnl6pTtkWMXQyLPJQmzz
         hrtlZ0K3dKxWDXK1hIIGHOSFhkLChkFysSg6TVYGFkQqSQH7VGtvcuuEv/4rO5yc1grV
         Uyt0ZrNSxkb+FTRdS/uULfbNtHaUF7qCc4YVkCqCXvJPhzj03gRvGAW78N5I/1Y7M3NF
         GF8LPgD1nqAkZJHXmyvWBN3qtua4bFRCt3S5PS4Q707nnAg03hq9+/hs+nh9e2zCkj3u
         BvYw==
X-Gm-Message-State: AOJu0Yz8S5VSugRDunD8GuwCVlz+S5J4d3MLjsA2FHzWDVGxwW8z10jY
	ZKPztnLzHNMM77rEgioFRDzZx8gpetkykHBtJdgyjS5M80WrCXJq7y5yWmHAOcHCyC5UhiPe4Ah
	cul4aXG+P+wqKR7XTrm0qZ7cMg5bzPVdgh6XUR4Zyh4WvslmS2VlPVEX4IJqooNhjEPsMLxYLPa
	oGg1DPUoYRkfeAGplUJ4GyqimwDRKwCw==
X-Google-Smtp-Source: AGHT+IEV/yAm90+Os9i3vxCkHdHcnFq5MD/ujeqwrPyY4yDUOI1TXBZtEOwok64uhCk1iGiVJY8eO0Ks
X-Received: from wmqd4.prod.google.com ([2002:a05:600c:34c4:b0:440:68cb:bd4])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8709:b0:43c:fbbf:7bf1
 with SMTP id 5b1f17b1804b1-4406ac1fe25mr196371525e9.30.1745406658101; Wed, 23
 Apr 2025 04:10:58 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:10:00 +0200
In-Reply-To: <20250423110948.1103030-13-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250423110948.1103030-13-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=737; i=ardb@kernel.org;
 h=from:subject; bh=NxfR/p2hPSBwNkndB+RtpXfmCPjcurS4X6crKuq8drQ=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIYPj1NzEVzl85V/eXGsJOfi7sdt5XQ9LYdTj3JkO/TsSj
 kdLdr7uKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABP5FcPIMNnRR2jiEb9Hy1lm
 hremJfzevEj8hCf3o5339zXnPcuV5GBkmDPp+DlOtd13D+xJVLwbkPrXNuLY2R/Lkldv6vdZl7R tARMA
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250423110948.1103030-24-ardb+git@google.com>
Subject: [RFC PATCH PoC 11/11] x86/boot: Get rid of the .head.text section
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, mingo@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The .head.text section is now empty, so it can be dropped from the
linker script.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/vmlinux.lds.S | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 9340c74b680d..9c50546b11a1 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -160,11 +160,6 @@ SECTIONS
 
 	} :text = 0xcccccccc
 
-	/* bootstrapping code */
-	.head.text : AT(ADDR(.head.text) - LOAD_OFFSET) {
-		HEAD_TEXT
-	} :text = 0xcccccccc
-
 	/* End of text section, which should occupy whole number of pages */
 	_etext = .;
 	. = ALIGN(PAGE_SIZE);
-- 
2.49.0.805.g082f7c87e0-goog

