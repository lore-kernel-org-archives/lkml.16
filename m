Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AF220C49E
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 16:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746116710; cv=none; b=o20Dv1AmimMTlpTHqeOCuOn3hOzfro8bwB/MUrOhu83LcUlaps7Ta9dAmKbpexsH5nJ6gIIUEANLyOx9LjP4enZ4Jr5kOy2oud1bI5s+v819WFq4SCoCKq/XRcRmGCmcNB46PeNSTeY/NI1pn16oDAAYoQChzJYovKPbSBd4A0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746116710; c=relaxed/simple;
	bh=MZX842/TEq7rjwC81wP2go6spu2ZfkhRKugLnYcdJ30=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LQTZnbp2mDyMKCV8ru6u4weNTzBO2BJiRib4MunvzeEig4iaLL0noFfydbmLRyxyROH26RkBZGwj0HVDsmr+PSErsTrdWkJbd4qbpmg9pAGpTctdtZYiUrNl6oEjXUp/X0yj1rlOxx9SqiZIaKUL50HNQTnX3UCBH8oh/B1Zw7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W/ZGNFvV; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W/ZGNFvV"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so5345255e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 09:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746116706; x=1746721506; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AI2nSAsFsWzNJdU64PivkZrYjUoeKEX3B/t2Pe5a8FI=;
        b=W/ZGNFvVO2yBvfZhwEZ/2DvHFiaCSh9b/45eoSxHgCU1pqIa/4E/r2B/rs5HkEZXAh
         QE6RZMRVpg9ud8Yidsk4yUhzCic03littwq8Qy1QadGqluxbyr1ZfOhSErDZPu145aHV
         x7ytmdXAl95bifAyd7Vs4/ITeza9HMu7naha50ao7auwDTGDYL+3DLLz79sRWN6yi2pn
         mNteKmGobeM+cmouawnsK9a3xurZ/kMrINLG9j5r/B6ut7/qMQfO9gwMircV/kil7gQg
         UdFWBpxPynC4DBgDJXS9ogoOtNmhn2otuTPGI/dhNgpbBbGv2VjxVQKgQ/Rx3s/WhGt4
         3cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746116706; x=1746721506;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AI2nSAsFsWzNJdU64PivkZrYjUoeKEX3B/t2Pe5a8FI=;
        b=XkzlTvZPuCwIZXgwniacxTVIldGnan/TkXD3V1mfg6ZC4uMP3ffAcBLWXHgXuRsenm
         qFQFVNEwKY7AcoPAChcYMJDxJuEbsOK4LRWkY4v5api/PekhRhQsYeZJMRJ3p2vssdWw
         6cr1l9IhJCSDAM7qmo9ESv0Jl1rUK+Nse8QU9ZPa35yy4DRS05NTUvYgliS4EAY8RimI
         rlloxj9vD1KF/zpsng7DiJk+Dd35nhrxIZCr1DAuL2QY1l9xXSnjrC4VwJvN0BYo6rAf
         gmbi1q9q8rhg2cGyQkokLvvM3R5B+3YKQcogJd97d8Ie8EhujA+Z0hjmBy0yg3Nme3Ja
         VELA==
X-Gm-Message-State: AOJu0YwvXkoo49iBmvv2PM/xMZK3OzpFSca/eIHsnDitJbHwUYBLQq1i
	L+VKl+8ZIYm024reZR8dleScDb/Nd8CyqiO2iX+lE3eiJoPFwE/n0slOZO+oLYSfQnM+NvBRQxD
	B3RK3vTNSp85r44p/W6ZU+KlStHKRatp7MKx7OqlYmer6ho5Sm2m+WLpo1VhAXuiYkbBDjQRSpU
	QbdFxtfuXuw35ogPvV7WSs6Q6Vzk7viOHoEst3kW/Ga1HAnVqdaWM=
X-Google-Smtp-Source: AGHT+IHsbGCA8+vwhzRHIxkKrjDFt5m58pGdLfYxuW4Tr9qxaJAYAoo9b65Uo8DyDirAhoDJRbJuBViIBI68MA==
X-Received: from wmbjg12.prod.google.com ([2002:a05:600c:a00c:b0:43c:eaf6:525e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b03:b0:43c:f332:703a with SMTP id 5b1f17b1804b1-441b2696c9fmr76954205e9.31.1746116705959;
 Thu, 01 May 2025 09:25:05 -0700 (PDT)
Date: Thu,  1 May 2025 16:24:50 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501162450.2784043-1-smostafa@google.com>
Subject: [PATCH] KVM: arm64: Fix memory check in host_stage2_set_owner_locked()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

I found this simple bug while preparing some patches for pKVM.
AFAICT, it should be harmless (besides crashing the kernel if it
was misbehaving)

Fixes: e94a7dea2972 ("KVM: arm64: Move host page ownership tracking to the hyp vmemmap")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 2a5284f749b4..e80f3ebd3e2a 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -503,7 +503,7 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 {
 	int ret;
 
-	if (!addr_is_memory(addr))
+	if (!range_is_memory(addr, addr + size))
 		return -EPERM;
 
 	ret = host_stage2_try(kvm_pgtable_stage2_set_owner, &host_mmu.pgt,
-- 
2.49.0.906.g1f30a19c02-goog

