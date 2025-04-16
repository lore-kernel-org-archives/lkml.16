Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA522080F6
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744817221; cv=none; b=LUuNSsBM9a4B7tk0382cavK9Cmwr1k3/DV7tCYlNpwbB1AIw3n1k3Lz46sXBe8OvEi/+sDYdcaOW+ffR1J9of1DjQ/JVvi3TXrJ+YD5OLyn/nel755mpyRean9Y6RxNgwSfIk+HAHgPWmDLMVjOh2Y5k5QO2YgdJrJzn+2p7PC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744817221; c=relaxed/simple;
	bh=2VwDODIxhUffdZwjAx4r5VNASzG0d9BWhmRZ0Me6Fuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=afwVsGrWbezC6gamcSOYMbD/cwBM3oMUXprOPENYONqqEBzwPKM1AU+J9ktlcJbZdKeV3+zuBbd0mknslGmRboKyW5vDK9+0DDmBo8Wrl0/BFz2KT99Z6tStKUiGUuZuAy9NlxyvXrUbJbSECA7k9ywINzo3TiYaLyfrvSYxcAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nX/t+EKq; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nX/t+EKq"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5e5d9682f53so5918925a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744817217; x=1745422017; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sWpGHRaShaKEt1EwgADnEDZtkiEBTsCp5JfVvOy2vqs=;
        b=nX/t+EKqf2wj6L+Pj5N3d48H2QZ4u6/HqG22XQvu/lDqGG+0RaKgkRMheHc74eymzF
         gwx7Td5vi7emtLeyzebo9Qvm5PVzUq12BgphvcDPKRI9E1w2YyM8+uKkv9fmu3LF4K8B
         sktMut8S38g/JA9nto158n/CbjhFm6cc6g92A2xmHYV5uQS1nLCmnlOtRxob6q3MiPES
         zU/VsEuWyv/ESBpNSbbcBh+Vzldl3I+gXYh2NJfg9B0/7jXwY/IlAaJhZMEIUyCkkPll
         RCKsvmeDrwnPbpvFmVlvPEYnAJ2Fx/nQOulWQewXL4bsk3xjd5j/5WTB2tdz5QYMmdR5
         qI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744817217; x=1745422017;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWpGHRaShaKEt1EwgADnEDZtkiEBTsCp5JfVvOy2vqs=;
        b=cdjz4Mm3cBEeduYABH2qCvBYEj/axZWnTqpYY3IDruiFONy24/srZoKcDrsQxJtc4q
         1mbSktb5cPf7PnyBrVSBVyorwuIG+pULNep4/8O96z74ilbfB+pnmfVjDdY+Kz/tEm+J
         epvY9E0hZpKySiEjgw1QugdQohID4ECkOmMRFd9d5dEY+Imu+g5JN7j3CU3a1MZGzCoJ
         RJSbtBUAQUtbDPOTzP+suryhR83i1qV/eDJlJ3VCsMvT0dqAxCazIIurtHccp2ExQ7xY
         RVNMdIiBcyxz+eqpWlnITn0FwdzqN6SWnU0j6cfL1e+vb1znQIzFbxkNxbL4E+Tx9ZVu
         KPdA==
X-Forwarded-Encrypted: i=1; AJvYcCUWMlJg5F0o8HFOxYER1SbprsU52Bf5ESt9YCT9pFOCuKuL4qqGrlYGlhX3tMj0EtQXsaS9pYenm0PAJoM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw30Sf+bBU7NN0xcLfXK442n/UtEQeVCCGxIYcdpYACagCPjI5c
	X4f7l5FW77nH9xvmlEJ2Y3C+irNVZxoUkS9SV4TrPY0/sd6iqDOC9FyMoYqRb79HGZmykVDck98
	1kwm5nA==
X-Google-Smtp-Source: AGHT+IEoG2AXXZ1tWBUhjh5KrFg0jiFxDBUl8QZtd9ikeeeP7z6vejMB73nvwGYxLNaTouC7ucA8ZutxaU7j
X-Received: from ediq14.prod.google.com ([2002:a50:cc8e:0:b0:5e6:e69f:4a7f])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:34cb:b0:5e5:3643:c8b5
 with SMTP id 4fb4d7f45d1cf-5f4b75c8c33mr1934847a12.30.1744817217576; Wed, 16
 Apr 2025 08:26:57 -0700 (PDT)
Date: Wed, 16 Apr 2025 15:26:43 +0000
In-Reply-To: <20250416152648.2982950-1-qperret@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416152648.2982950-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416152648.2982950-4-qperret@google.com>
Subject: [PATCH v2 3/7] KVM: arm64: Use 0b11 for encoding PKVM_NOPAGE
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The page ownership state encoded as 0b11 is currently considered
reserved for future use, and PKVM_NOPAGE uses bit 2. In order to
simplify the relocation of the hyp ownership state into the
vmemmap in later patches, let's use the 'reserved' encoding for
the PKVM_NOPAGE state. The struct hyp_page layout isn't guaranteed
stable at all, so there is no real reason to have 'reserved' encodings.

No functional changes intended.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/memory.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
index 178028172c0b..bf28f9f9de65 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
@@ -23,7 +23,6 @@ enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
 	PKVM_PAGE_SHARED_OWNED		= BIT(0),
 	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
-	__PKVM_PAGE_RESERVED            = BIT(0) | BIT(1),
 
 	/*
 	 * 'Meta-states' are not stored directly in PTE SW bits for hyp and
@@ -31,9 +30,8 @@ enum pkvm_page_state {
 	 * entries). For the host, meta-states are stored directly in the
 	 * struct hyp_page.
 	 */
-	PKVM_NOPAGE			= BIT(2),
+	PKVM_NOPAGE			= BIT(0) | BIT(1),
 };
-#define PKVM_PAGE_META_STATES_MASK	(~__PKVM_PAGE_RESERVED)
 
 #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
 static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
-- 
2.49.0.604.gff1f9ca942-goog

