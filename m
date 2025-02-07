Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD78238D35
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 14:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940087; cv=none; b=jMvmC6D77Wbm405uGuWoaxV4kyFqwNZDNgQA6ERUTkZi9AYEA28LupF+gsde30FU05A9+aSHqOYeBjw4Y4wSPle5UU4BIu0A2J66oy7vGfj5XKL615JvF83mbfR2NeS5mS7EVjP3bLZi4JqJ8/NIqbQBajL4AJ2mY2URlLhSzIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940087; c=relaxed/simple;
	bh=ZCRFTCY1hi3XMbgWbwzaOADq8bLynRa5HB5rf6QanHA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fl0f5qgmVqdKggwZMya9k6GIOT88/J98eFzutmk6qckjMlpaewqlx526XHlpsBHYAFFYmpiZd9pzx/bQ2MAZDL7qZPxQjw4pYawDqiP6MLsMI9JbrhcRBX6igVkfOM5n3XTroCKLl53RbpsPC+1vz+4Bd/QtYA/kqDvZjZd1sEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XCWH+U6n; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XCWH+U6n"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5de573292e7so103773a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 06:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738940083; x=1739544883; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxUuvHn55P4VJoa3VPKXet3o2roscTj71cLK/0XsCo=;
        b=XCWH+U6nLMubKCsEzoQx7/nyy+x16f0+2kISo1G9QCXjSNOr8cMCswcANMxQBBxx1g
         KqH9pwkngKuJPKDJP/jQOvLG/umj48pVnQ5uodt0ZIW3z4lZVIsclEyf9Ne3mWo58zgE
         fLngrGq4svFcgY8Z/4rYJbkginJgQV9QQsMvkQUR6oNfwXcf0xduZXK2St+EUxSzCd3m
         6rkIz1xogPFSp8GAYbxHY/sYlWkWRJuSz8vBrUuOlgIMJRACZ3bUAKQ+MwnjbbGs/TnO
         cHRFcDp1m0R2h4t1Fc/ozdkdS0/k4vJgYmnoO9k4cdfSjrGgwt3ReZ15MLocnwlWTxu/
         +vhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940083; x=1739544883;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QlxUuvHn55P4VJoa3VPKXet3o2roscTj71cLK/0XsCo=;
        b=d/xkDVMNniJe049806jmTDW/OSJ92pNlyLXq9LYqi0EhUeeq1hV5uNC0u4cqNOxJH7
         mc9zITSNQVmpL2k/nUPv1P5pGnqozLSVFuIIUIG0qMThoTbt7MmgNmPgphc/EZ8nBefy
         bD1qHRQsL2QwDYD0emX2dYUN/1vN6g2U17j5CrxxWBpHUeHUtEr/ATlcF6Va1V+OyaVh
         asZuv8Fl14+FhSJwVCd9jU/H1O5g4hyEXJIDb0p8VB/Dh8wpI+tEw9dzLB7XB+UNHpsS
         4AX6IFXEWUjpWAHdWcB0VtRD5/cldOHAuGwiYs5fE9Wu4hDk/hbK165ZYaxB14nP8eHA
         2z5w==
X-Forwarded-Encrypted: i=1; AJvYcCUMn+ZZ95CdMw2yuQKjuzqu2QhSL7eaOeMWExjX8ZX67qQ7oy3eGeDQLZ79/nVo05DCq8zyE/z4X5zK9fs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+pOC/pfKWKEAQoS/em+/WtkAO+LFqHtBUhXyN+ew3DE/LnBlA
	7JgvYKN5bJP1Iq7Eyo6pCDgoCL+OJ1Z1UyZd1ixye48MRYmtfA5RVqg2gdK2GxvfCR7LDAwj9yl
	0JtWuNA==
X-Google-Smtp-Source: AGHT+IEuPMCv7YqXJlNHwKccMEWSYS/+UUaEr2aDY+SyLUIdyjbcKQ2U586hKi+BCjLaIqvUPKXUd5QYm4sG
X-Received: from edax2.prod.google.com ([2002:a05:6402:4142:b0:5dc:110c:e5e2])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2546:b0:5d9:f21a:aa26
 with SMTP id 4fb4d7f45d1cf-5de450a9e4cmr3320543a12.24.1738940083729; Fri, 07
 Feb 2025 06:54:43 -0800 (PST)
Date: Fri,  7 Feb 2025 14:54:37 +0000
In-Reply-To: <20250207145438.1333475-1-qperret@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250207145438.1333475-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250207145438.1333475-2-qperret@google.com>
Subject: [PATCH 1/2] KVM: arm64: Improve error handling from check_host_shared_guest()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The check_host_shared_guest() path expects to find a last-level valid
PTE in the guest's stage-2 page-table. However, it checks the PTE's
level before its validity, which makes it hard for callers to figure out
what went wrong.

To make error handling simpler, check the PTE's validity first.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7ad7b133b81a..41847c04b270 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -943,10 +943,10 @@ static int __check_host_shared_guest(struct pkvm_hyp_vm *vm, u64 *__phys, u64 ip
 	ret = kvm_pgtable_get_leaf(&vm->pgt, ipa, &pte, &level);
 	if (ret)
 		return ret;
-	if (level != KVM_PGTABLE_LAST_LEVEL)
-		return -E2BIG;
 	if (!kvm_pte_valid(pte))
 		return -ENOENT;
+	if (level != KVM_PGTABLE_LAST_LEVEL)
+		return -E2BIG;
 
 	state = guest_get_page_state(pte, ipa);
 	if (state != PKVM_PAGE_SHARED_BORROWED)
-- 
2.48.1.502.g6dc24dfdaf-goog

