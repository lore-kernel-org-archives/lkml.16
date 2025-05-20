Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10CD268FD9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731199; cv=none; b=gNPAcXDvW5RvTkzLocuSr9UbqvMTPscChRaOHQBsfus2ymcg2uetZTUwynAl1S/JQSLOHEiLH4e2Vy7xskw6YMw0T2EzNjwmJc6lLF0mwnRjZ8ZULL6y8kBJ7KNMarq9AWdhDwWt8pyDgGE2z3mH6eDiSgYeF75ILYYgg9ldbvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731199; c=relaxed/simple;
	bh=hPOMBWnOUvxfs71h6DqG8XcRcD6839MahtJxJVD2WVs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lvNbxhDtauA7bKbI14gVKZqq3Qy2o3h1M6VDb8L719+JODmHmkbqqmGTFYeFlKrpTykkMFM69wqL6vjfT8ng9l3cwi054Lxg8s0aPIMhi8BRxn3184/wMc95Z5Vhnz8ziPQ5ktjI1VcZAoPzH8r2J3GQwzclSgAjnmWZhhP6loY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mxkxWEcc; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mxkxWEcc"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-442cd12d151so37827155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731195; x=1748335995; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iaiebv1iUlPjNsuMmhJjesUK4sbc8xArY8P1OHZ/a4c=;
        b=mxkxWEccIVw9Hivpk+s2+v/8q4XekYvrzELseMdM7EGnqA9dxKcNyYrCwtigMlJGtz
         zpiKu4zGNj9Uz76sQuyz7fURPqqIcuLaGoqxwy5MqAy2xv8BJAbf/spz298nsYIMbY29
         +Y6hHqbEykheGxzDPxNBSeExFmDMY/dbDgcaozSHcV3KI7EMEBnpvpWmt97gT5fgtCAJ
         +0tLSSFp5hN/nv331FjCDXfPmT1WvONnp8a4pBpL4hX5U7EF6Q6/e4xYcBMGAJmDP2xb
         wf/X718he1pHg+wNSQCLl8DKmM/+OPLhuwP5yavp8w5oOBydkB9xkVahq0gfzd84zk25
         H/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731195; x=1748335995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaiebv1iUlPjNsuMmhJjesUK4sbc8xArY8P1OHZ/a4c=;
        b=SIQwS57ndngUOyGf3NVU+epIk1FHaLFsVdFIHAnCMNt43a1dsBBgt37YCibka566Oi
         NZgta2jTv60UntV260oqtGbAQokiNpXKMBvw6IWuCZ07WItXgc8x+/fQxcDGOia15jR0
         Yyynv3ed7wgLvbAVWKbdoVAFCM1laNkMDBQ0vsfqqrezTFEFubhBO8hoIlDXNZ31lWN/
         wJ8MglknU71ssh+mtz4hTrBu4j6foyrTSncMyAZB3IH6kqhJevfNHiY55D7RWrdPlMsP
         NGFkhtD+zuStvZfK1rAr/Q//jZxLybNkE5NA7lzMfspfCBxryNnhFwCksjdNo7I9I30Q
         Oy8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtmVziMS7hiyE3pTeaGSg1Lss9t5YcAF6MDjUlrYqyATmEdTyQq3lj32Fj/CYDycVvkaO5oMRoqT5OuIM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnN05oq0Q1kMfy9h5dlvGdm7YytPEZRkkrMQbXsq4wTn2YrTIV
	qGoMxBax4OuwUDK/LWuOnadmXl1p6X4uBH3fn5ubk1Aubbu+amJte9PPF9wGtxooQcOm/VqGAg/
	U1b9ZuOS4ns0TKMcQ9L4CQQ==
X-Google-Smtp-Source: AGHT+IHpkZxdcW0elwcmz1T5vd4Wk49F8B5i3CFYJRUb7n4RGyA8tbVGoOAC7m8rZnfR1snVQ+54871TJKr2vkjF
X-Received: from wmqb3.prod.google.com ([2002:a05:600c:4e03:b0:43d:1ef1:b314])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468f:b0:440:6a37:be09 with SMTP id 5b1f17b1804b1-442fd6312f8mr169931545e9.16.1747731195203;
 Tue, 20 May 2025 01:53:15 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:59 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-9-vdonnefort@google.com>
Subject: [PATCH v5 08/10] KVM: arm64: Add a range to pkvm_mappings
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Quentin Perret <qperret@google.com>

In preparation for supporting stage-2 huge mappings for np-guest, add a
nr_pages member for pkvm_mappings to allow EL1 to track the size of the
stage-2 mapping.

Signed-off-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index da75d41c948c..ea58282f59bb 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -173,6 +173,7 @@ struct pkvm_mapping {
 	struct rb_node node;
 	u64 gfn;
 	u64 pfn;
+	u64 nr_pages;
 	u64 __subtree_last;	/* Internal member for interval tree */
 };
 
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8a1a2faf66a8..b1a65f50c02a 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -264,7 +264,7 @@ static u64 __pkvm_mapping_start(struct pkvm_mapping *m)
 
 static u64 __pkvm_mapping_end(struct pkvm_mapping *m)
 {
-	return (m->gfn + 1) * PAGE_SIZE - 1;
+	return (m->gfn + m->nr_pages) * PAGE_SIZE - 1;
 }
 
 INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
@@ -305,7 +305,8 @@ static int __pkvm_pgtable_stage2_unmap(struct kvm_pgtable *pgt, u64 start, u64 e
 		return 0;
 
 	for_each_mapping_in_range_safe(pgt, start, end, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			return ret;
 		pkvm_mapping_remove(mapping, &pgt->pkvm_mappings);
@@ -335,16 +336,32 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, 1, prot);
-	if (ret) {
-		/* Is the gfn already mapped due to a racing vCPU? */
-		if (ret == -EPERM)
+
+	/*
+	 * Calling stage2_map() on top of existing mappings is either happening because of a race
+	 * with another vCPU, or because we're changing between page and block mappings. As per
+	 * user_mem_abort(), same-size permission faults are handled in the relax_perms() path.
+	 */
+	mapping = pkvm_mapping_iter_first(&pgt->pkvm_mappings, addr, addr + size - 1);
+	if (mapping) {
+		if (size == (mapping->nr_pages * PAGE_SIZE))
 			return -EAGAIN;
+
+		/* Remove _any_ pkvm_mapping overlapping with the range, bigger or smaller. */
+		ret = __pkvm_pgtable_stage2_unmap(pgt, addr, addr + size);
+		if (ret)
+			return ret;
+		mapping = NULL;
 	}
 
+	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, size / PAGE_SIZE, prot);
+	if (WARN_ON(ret))
+		return ret;
+
 	swap(mapping, cache->mapping);
 	mapping->gfn = gfn;
 	mapping->pfn = pfn;
+	mapping->nr_pages = size / PAGE_SIZE;
 	pkvm_mapping_insert(mapping, &pgt->pkvm_mappings);
 
 	return ret;
@@ -366,7 +383,8 @@ int pkvm_pgtable_stage2_wrprotect(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping) {
-		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn, 1);
+		ret = kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn,
+					mapping->nr_pages);
 		if (WARN_ON(ret))
 			break;
 	}
@@ -381,7 +399,8 @@ int pkvm_pgtable_stage2_flush(struct kvm_pgtable *pgt, u64 addr, u64 size)
 
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
-		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn), PAGE_SIZE);
+		__clean_dcache_guest_page(pfn_to_kaddr(mapping->pfn),
+					  PAGE_SIZE * mapping->nr_pages);
 
 	return 0;
 }
@@ -396,7 +415,7 @@ bool pkvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64
 	lockdep_assert_held(&kvm->mmu_lock);
 	for_each_mapping_in_range_safe(pgt, addr, addr + size, mapping)
 		young |= kvm_call_hyp_nvhe(__pkvm_host_test_clear_young_guest, handle, mapping->gfn,
-					   1, mkold);
+					   mapping->nr_pages, mkold);
 
 	return young;
 }
-- 
2.49.0.1143.g0be31eac6b-goog

