Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764C2212B34
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817230; cv=none; b=TviTdYc7HOMkRf9OFEcVoCbbumPzgvRkes9ZhjkkqqJ91c+dHEHS+p8d7qas+FR6KCfMx/L2eaokXurAcRliGZUFCvvK+RlraVlpOR7NUasV9K6UdL30lAwZKH0d44XjwuZrpYo2ev/FJ7oI7a7uPoP/jdqD+Kw+dWTDKCIqPR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817230; c=relaxed/simple;
	bh=uu6A7iueq6DtipNuS6Phk5LGlAI7BCi/IestivOyyuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cq8tmAk2GYwOKqGyztGMiGcWiFU/5G2b2DFsLS/Dx2vvltpLDmviztBU6w/Wloz74MDV/jxFM0wjX//moxWDYlO9eKBnPk6A8f5CA+6Ug7UGm8cyJcC3fZM00In1WotSPJlqo5IXqFTlp0Q7/0OhJp241GC2gJqSOIBck5jMKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jLFhr8R0; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jLFhr8R0"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-5e6d978792dso6061657a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817227; x=1745422027; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+5woTKLEDxUzA3eOLn0hsAEJ5MJo4JdU/wMD9M47qc=;
        b=jLFhr8R0rjBD6ZkEjsLJUIBozZHCH+BRMLTH/b5pJ4x7nbenNmQUQc96V7NRpHp9AX
         B77OHDLOLKUNTOQTy4tdm1uvjCEfeK9A9kjHaF9VP+bVfJBmAroX2VQbgIYBYaog99es
         50sMIl73YZq5DEZ2fyDFXwo8EkGIMBBn6YzBmvJhtpjr/aQl5Hf0cNA9Qayqyu7jjQF+
         sndXB5GzGtpvFs/Ye28FJWrLMd86MvHDPcD77ppzZkzlYGZY+Ulv49lg2VAjTMtDH/Zp
         bNfPvOkYQynICMFUugi6Xi6CiqF8JRCmgUduVLDf7nCVadjKcGFPs2xJbjiEXzE8HXE1
         oY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817227; x=1745422027;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+5woTKLEDxUzA3eOLn0hsAEJ5MJo4JdU/wMD9M47qc=;
        b=uxM5Pie3+oFLnBM0Iqn65XiciFCa4uTZOadsuCYau+rhsSMcrDrdJfXTDMSPcZJC3K
         xko6CRkQdOUQt3vqBQ2ItOrHw8XloGHKGnsbIKiOakmwcOJgR+FdqxYHpEdRkQfnXeVj
         a/fi0wwOdLFf0X7nKS85TG0VkgM+XlVFSXl5bqSnL6Nu33b1Ss33tnjsQU3u6/emIu6O
         eO8DFOpdg+0qZXJBE4xkn+s/tk6xRNvyGqlNwsw9qpT0VAecLKYoKT83ZZCZ0Ln0dpPT
         N4W4MIz5uivdZC4/Brf+ORIRjrTNu/CsxmHQx3PIVLcEJ0le6PB2VH1CcmPiZL5ldG/x
         vruQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpf96CmCOpFcYr3p+/DnKnZhAaVYjgf3DDkG44XvKkyw5QBIOZ+rvYguAr0S1QeLDMqMJSdMbwpQkjE7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMrZDAzjA0IHoEFTSbQwwuYyPIlk5e4SMoirbiumDuzhYECpgQ
	B/tesAVs7ggy9XY7TmKW9sN6RMpqCoBI39xlTCYfriHjE/UYty2P9SoNFt4dgGmf0JMAN0RdI2C
	kY7q0uw==
X-Google-Smtp-Source: AGHT+IGCybzKX7dX809ygOrq+ajkf80dzTivmVZqG7Y0aKxNYJUDug4w5qsQZIOiGF/fQUZzevVuaJaQC1OG
X-Received: from edqt19.prod.google.com ([2002:aa7:d713:0:b0:5e5:339d:60ab])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:42c5:b0:5eb:cc22:aa00
 with SMTP id 4fb4d7f45d1cf-5f4b748ff90mr1896967a12.19.1744817226898; Wed, 16
 Apr 2025 08:27:06 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:47 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-8-qperret@google.com>
Subject: [PATCH v2 7/7] KVM: arm64: Unconditionally cross check hyp state
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Now that the hypervisor's state is stored in the hyp_vmemmap, we no
longer need an expensive page-table walk to read it. This means we can
now afford to cross check the hyp-state during all memory ownership
transitions where the hyp is involved unconditionally, hence avoiding
problems such as [1].

[1] https://lore.kernel.org/kvmarm/20241128154406.602875-1-qperret@google.com/

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 91b757e3fb4c..709d286999a1 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -702,11 +702,9 @@ int __pkvm_host_share_hyp(u64 pfn)
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
-	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
-		if (ret)
-			goto unlock;
-	}
+	ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED));
@@ -762,11 +760,9 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
-	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
-		if (ret)
-			goto unlock;
-	}
+	ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
@@ -792,11 +788,9 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 	ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (ret)
 		goto unlock;
-	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
-		ret = __host_check_page_state_range(phys, size, PKVM_NOPAGE);
-		if (ret)
-			goto unlock;
-	}
+	ret = __host_check_page_state_range(phys, size, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
 
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
-- 
2.49.0.604.gff1f9ca942-goog

