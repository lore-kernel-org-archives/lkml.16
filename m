Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6EC20E32A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607575; cv=none; b=nSgqcU3J55Do53QarhcYnXmm+s6cac5KaZ9AfMJGzoceuNFq7kFHpAN5LQEprUcn9B4Y6ggI/3tPayBePPvmDoGBja9qonX5ehAd2ot89vSVzijt603cpxOnyYJA8csEwYWp8ZopjpXLdyO9y4XJNel+2tpfMzRwUS7/62j4s8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607575; c=relaxed/simple;
	bh=nMm0cEzXGJ+K6fquIlXfLGgHUP0RZmUtQhbzRpZqTw8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ejzcGOPMYy/CIGtYH6VpCtn1IUi1gi9i88IXXAeE+oOEaWGPbMtK7xJUdKxRphLHIuoX1YqVz8mT4xvEyWZTPwWEMzzQwPruLi7/7lAZUhaxuebBpohrdMFdW3HuInZ1ZDNbURXQeRGPLA2dYZWvnn+rIaO/ANf24sKMGmw3IIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lP01iyqm; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lP01iyqm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738607570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KIafL33okyEmcVqNJE6QQCzbjIY3PK1DaOakrU1GSY0=;
	b=lP01iyqm6GNcp0HdNtiFC1Ii0FCWCppkajIGNLxRboyOjkM2ANz3FgLewjCMiMHlGFL9wl
	0OX/FAlJpnLXNNHx2tDEtY/5CsI5NFvnF34zvS39CZ+q22UIix7AACIYYBhRLORqxUz1+4
	bMhhbIXB8UmUGzIMhQWDoZSZU02fwrU=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Janne Grunau <j@jannau.net>
Subject: [PATCH v2 13/14] KVM: arm64: Provide 1 event counter on IMPDEF hardware
Date: Mon,  3 Feb 2025 10:31:10 -0800
Message-Id: <20250203183111.191519-14-oliver.upton@linux.dev>
In-Reply-To: <20250203183111.191519-1-oliver.upton@linux.dev>
References: <20250203183111.191519-1-oliver.upton@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

PMUv3 requires that all programmable event counters are capable of
counting any event. The Apple M* PMU is quite a bit different, and
events have affinities for particular PMCs.

Expose 1 event counter on IMPDEF hardware, allowing the guest to do
something useful with its PMU while also upholding the requirements of
the architecture.

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 97f29153193f..e7b732bcaaa2 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1027,6 +1027,13 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
 
+	/*
+	 * PMUv3 requires that all event counters are capable of counting any
+	 * event, though the same may not be true of non-PMUv3 hardware.
+	 */
+	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS))
+		return 1;
+
 	/*
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
 	 * Ignore those and return only the general-purpose counters.
-- 
2.39.5

