Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239B22BDC38
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848955; cv=none; b=KE5Jbo+/IYTcpmtPKwr/1a0IOpAUlUw1OmR6tTamlA7sIx/LgBzbdHKl7bt04YSaIRMqboxlvUDH6uvUf87NnbMQcd+VwSrFZQVs5QYoIdMwcYOu8aNsnwMPV6HNRUjTrpe+IzzuTdvOj5h0XP5j9w+Aa2VW+/sBsi6X7k0oXs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848955; c=relaxed/simple;
	bh=Y+NflATt1BbVg4AJe27l0CDfySeQP4HOlxRLdzEDkE4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GdJKstpnwGOB0CSTKHsL974qsFKrbgZBffrXW5JuL31FvgNN5QqwDQFeh4zhrAylGP/UZ6MasSyE7G7fdCCSJefpk2UlCEfY5PtujxgEjoxBeOcgggkZYK3fijLbxw3iHEhdsP+7LjQvC9jA+DuO6fuT0qklIGloN5kT98jzMmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B9QTmq+I; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B9QTmq+I"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-60724177a1fso1460278a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750848951; x=1751453751; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V1GXLq2HqBHIx1U8RtZLo2I2pqPpplv4UNHwKqoIWBU=;
        b=B9QTmq+Iwg9J5FChLsLUtVUd6CNYlFSTIk+ySvZdCDtjNmyw+uqbhAsgakNxe3kZId
         ncn3TbmxH6FA30bypLLuK+IuscQlxBCGZkgqcXoGfke99eL04Yev1S0EuTMBptC9P/jI
         bpSR2oW1KW5ESxf66D5SnlogsZTlcxxPihBQ3rVgB88/c8FYMJ30KneS2eW/dGhasP+H
         7/EGr+fgosP5tArQtsW+oUzqBBkKzUiJ/2Ah7vEorR21JPyZ+pw7lE61ELHvNzMEF1ac
         NjzqsrnNYm61YY2qLms7QPa9wEFEStdKInAg8Z/J0BqkAaSHFv2bZAe3JzGrFdUrfnxN
         4xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848951; x=1751453751;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1GXLq2HqBHIx1U8RtZLo2I2pqPpplv4UNHwKqoIWBU=;
        b=Kuot7M/rRZ/jJjBv2nxFgqUrG5J3sghgWLmLDPjz5YbXimGlrwmcbw2/AVWMGS8Ynb
         D5XaMQP6vlJSA8XSjYp9rf7Sv9Ycoqq7D/LIbhFcUHT4/kdrMHISZWHsAtEq4L5p2nE0
         X2MyTxWJVSbNxINBC2tgfEeeSGgsS946nfkSmOMd+Y/wsMnC0ue4feWkC0uEhiWgAZ9N
         X4zYN2UnFxK1Fc8cH0lznRDfx/yt219NjVwzt87COc4hkF2zgmP920diwiOlzHeHyzUI
         9HfEVWZRVhVukPr9hmPCHcHTq5KLyyrxwaMcXEF0gHaZbMiOQReaIr0nXkTPIbMiUTaW
         fjtA==
X-Forwarded-Encrypted: i=1; AJvYcCWYSgXwRg1517jvzcuUELAdLODj7psNBpdwop4julnaLf0AgBfzVMR/xtwUpktmGJQ4rs+pLcNpPHw+IjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysXM1R8t61a5CV7gJgD54bIy5Cbns4PU0o10eAA2zcSdt4fbbz
	AD35ieTwas5Zp/6QC9XJr07MA7Lc8+fNVQOEAMBjqKMlr5GpqX+gqEnchXqr/2M40NWceNlaMUK
	LOXFENBNwNw==
X-Google-Smtp-Source: AGHT+IHUR8NzJ9FFoX9Hr5oMdShDNs6NRkAE3kBsnjpl89mkWn7cGms6VUHj8zcgECBy48WdUiyOSlbMzG/D
X-Received: from edtb19.prod.google.com ([2002:aa7:c913:0:b0:60c:5b8e:e20b])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:35d3:b0:608:8204:c600
 with SMTP id 4fb4d7f45d1cf-60c4d31789amr2084880a12.3.1750848951221; Wed, 25
 Jun 2025 03:55:51 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:55:48 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250625105548.984572-1-qperret@google.com>
Subject: [PATCH] KVM: arm64: Adjust range correctly during host stage-2 faults
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

host_stage2_adjust_range() tries to find the largest block mapping that
fits within a memory or mmio region (represented by a kvm_mem_range in
this function) during host stage-2 faults under pKVM. To do so, it walks
the host stage-2 page-table, finds the faulting PTE and its level, and
then progressively increments the level until it finds a granule of the
appropriate size. However, the condition in the loop implementing the
above is broken as it checks kvm_level_supports_block_mapping() for the
next level instead of the current, so pKVM may attempt to map a region
larger than can be covered with a single block.

This is not a security problem and is quite rare in practice (the
kvm_mem_range check usually forces host_stage2_adjust_range() to choose a
smaller granule), but this is clearly not the expected behaviour.

Refactor the loop to fix the bug and improve readability.

Fixes: c4f0935e4d95 ("KVM: arm64: Optimize host memory aborts")
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 95d7534c9679..8957734d6183 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -479,6 +479,7 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 {
 	struct kvm_mem_range cur;
 	kvm_pte_t pte;
+	u64 granule;
 	s8 level;
 	int ret;
 
@@ -496,18 +497,21 @@ static int host_stage2_adjust_range(u64 addr, struct kvm_mem_range *range)
 		return -EPERM;
 	}
 
-	do {
-		u64 granule = kvm_granule_size(level);
+	for (; level <= KVM_PGTABLE_LAST_LEVEL; level++) {
+		if (!kvm_level_supports_block_mapping(level))
+			continue;
+		granule = kvm_granule_size(level);
 		cur.start = ALIGN_DOWN(addr, granule);
 		cur.end = cur.start + granule;
-		level++;
-	} while ((level <= KVM_PGTABLE_LAST_LEVEL) &&
-			!(kvm_level_supports_block_mapping(level) &&
-			  range_included(&cur, range)));
+		if (!range_included(&cur, range))
+			continue;
+		*range = cur;
+		return 0;
+	}
 
-	*range = cur;
+	WARN_ON(1);
 
-	return 0;
+	return -EINVAL;
 }
 
 int host_stage2_idmap_locked(phys_addr_t addr, u64 size,
-- 
2.50.0.714.g196bf9f422-goog

