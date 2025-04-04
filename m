Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3159821C176
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743804428; cv=none; b=Vhtsp4Em/z5i4+2KrsZITIjXbof5UUtI63ClI8TENW600k5WO1XsPEI61nDwa2TCEbM4aaQWUA+jexlgXfkPNXPjA7cfR47Q0BSLqgm/ubjmnLuam/F1FpeFV27a0N7KxZMmp+6fls4IQC7nd53Y+S3yelqIqASNIqhRA7KDtDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743804428; c=relaxed/simple;
	bh=E4YqHNQ4gPeYFwy7PnyB6caqFhd7nH8+voL1clFcF6Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RvDS/juZ9mGeVyw4ZFZ/1umKS+biK2CL9weTORw6NwQwFC33a+HX5sIOZIJJVLxqRtROqIEbmWkUwKfvw5Wgv/GrWmmdsJs39PrizEWTO9N8QE4GLCJyWs9fSHwrl/PKuSlWHtAa7k4Fr4q61cy6aW0vQlWEYHvam0YkBCjcLl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aq1YiAFl; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aq1YiAFl"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-85b41b906b3so308137539f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 15:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743804425; x=1744409225; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pc9BIslmRtbzEaqCHxhWv7mDukpJW925YKmou2T40Cs=;
        b=aq1YiAFlmibEtVeZZBDr8pdL2qcgat0oDjxJXpDnXihM9beKgVDPCA4Jxvt5mjzD1X
         wlDP7tcZML7RBUOmlvyV2Rz00tc5OH4/985re28sekle1vXGtpKkkJdLb6uPI6l6iHV3
         70nWp6K2gKJIVTn6fWsZw8SrsGUlE1XT0nFtgIlaER20F+phlfL+XRSUQYQ6fVTsi3yj
         zmLEy7emz1O7CYHugbWhWvqgNdp+58ZXR5IxgW0ZRcNWGeQ/9igflAwkwvGjIphhdBKI
         zy3qWWW0VOQ6xuVCEm8buQ1HPEEvs6W/DwL66a6UfByBJfhliBaR08XRa1Efj+hkaDmG
         KZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743804425; x=1744409225;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pc9BIslmRtbzEaqCHxhWv7mDukpJW925YKmou2T40Cs=;
        b=FIwFM2p1MHVNeWxm0qrW8lunCjDEozFNZ+1HXFOttjHtZ38uBkHRpAEiIVk1ogOi+L
         60nzREwmnCQXxeeeSt2UsKzzep+ZwBEic0pZnWDfk3VpSoJTt4jcCXBMv+CPc8buxPTR
         niIlXoETnJjWkAyvD4y3XkiOGCk8EZJi+e0mubkrGu1ZKCX4DdAT1AyJSvgwpyhTNsfQ
         ElpIwt3kotfz+iFe/CxmnLLhTXqKlUREAo2mb27FEYSufZ5i5Kewz1c9yYGqZT0qy3Lt
         iXmIuIm041deywYv0c2Q6aKELP1nR99Vog397ArinuUAUdgustkWprfyWeR5LYZJej0f
         5Fnw==
X-Forwarded-Encrypted: i=1; AJvYcCU3suYYNMUvx7VHAVVopUgZ4m0BU3sgmRWtHRerpGR+NgntKXgrfMtr5lzMUiTp9e3QZUB1YpMJbyE0tVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb377A1R78WgAHLxuYPn+j3p4VbWnyrVRWqXQ45NeOalphhjpQ
	RQNKuYBrbBEZdvjvEuj94JCmRuCC4HVRMt9LBECNegZqE0ZlAU0ZZGYh9BJfihJBPZwIqG0xr2d
	CJIuunQ==
X-Google-Smtp-Source: AGHT+IHdes02xNhbHRa4hrCg2N+VywWvzx8Vq2+IoHciYVBDcUnJpNkQ4rg+6l0nOZiDn4tZhimhX6EbrE0g
X-Received: from iobbf5.prod.google.com ([2002:a05:6602:3685:b0:85e:9686:d0f0])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:6a46:b0:85b:46d7:1886
 with SMTP id ca18e2360f4ac-8611b49b398mr539039139f.7.1743804425293; Fri, 04
 Apr 2025 15:07:05 -0700 (PDT)
Date: Fri,  4 Apr 2025 22:06:59 +0000
In-Reply-To: <20250404220659.1312465-1-rananta@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404220659.1312465-1-rananta@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404220659.1312465-3-rananta@google.com>
Subject: [PATCH 2/2] KVM: selftests: arm64: Explicitly set the page attrs to Inner-Shareable
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oupton@google.com>
Content-Type: text/plain; charset="UTF-8"

Atomic instructions such as 'ldset' over (global) variables in the guest
is observed to cause an EL1 data abort with FSC 0x35 (IMPLEMENTATION
DEFINED fault (Unsupported Exclusive or Atomic access)). The observation
was particularly apparent on Neoverse-N3.

According to DDI0487L.a C3.2.6 (Single-copy atomic 64-byte load/store),
it is implementation defined that a data abort with the mentioned FSC
is reported for the first stage of translation that provides an
inappropriate memory type. It's likely that the same rule also applies
to memory attribute mismatch. When the guest loads the memory location of
the variable that was already cached during the host userspace's copying
of the ELF into the memory, the core is likely running into a mismatch
of memory attrs that's checked in stage-1 itself, and thus causing the
abort in EL1.

Fix this by explicitly setting the memory attribute to Inner-Shareable
to avoid the mismatch, and by extension, the data abort.

Suggested-by: Oliver Upton <oupton@google.com>
Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 tools/testing/selftests/kvm/include/arm64/processor.h | 1 +
 tools/testing/selftests/kvm/lib/arm64/processor.c     | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/arm64/processor.h b/tools/testing/selftests/kvm/include/arm64/processor.h
index 691670bbe226..b337a606aac4 100644
--- a/tools/testing/selftests/kvm/include/arm64/processor.h
+++ b/tools/testing/selftests/kvm/include/arm64/processor.h
@@ -75,6 +75,7 @@
 #define PMD_TYPE_TABLE		BIT(1)
 #define PTE_TYPE_PAGE		BIT(1)
 
+#define PTE_SHARED		(UL(3) << 8) /* SH[1:0], inner shareable */
 #define PTE_AF			BIT(10)
 
 #define PTE_ADDR_MASK(page_shift)	GENMASK(47, (page_shift))
diff --git a/tools/testing/selftests/kvm/lib/arm64/processor.c b/tools/testing/selftests/kvm/lib/arm64/processor.c
index da5802c8a59c..9d69904cb608 100644
--- a/tools/testing/selftests/kvm/lib/arm64/processor.c
+++ b/tools/testing/selftests/kvm/lib/arm64/processor.c
@@ -172,6 +172,9 @@ static void _virt_pg_map(struct kvm_vm *vm, uint64_t vaddr, uint64_t paddr,
 	}
 
 	pg_attr = PTE_AF | PTE_ATTRINDX(attr_idx) | PTE_TYPE_PAGE | PTE_VALID;
+	if (!use_lpa2_pte_format(vm))
+		pg_attr |= PTE_SHARED;
+
 	*ptep = addr_pte(vm, paddr, pg_attr);
 }
 
-- 
2.49.0.504.g3bcea36a83-goog

