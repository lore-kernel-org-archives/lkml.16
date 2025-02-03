Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EE51D63D5
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607531; cv=none; b=W0jF3ha8bmTngdYIoxe1sJPWWCdOAZBPtt3YHy0XlQ3pwlH4CppgKnOtJGYera+paT0R+pMF0yA/I/L+PISHAuhsczLBUxFhAcHSht3jzz/jHhDclDPXadmjgJ7yPub3R+LzFjmatD37lUnNz6kQIgnAUepMkU0AiMw2k6ykcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607531; c=relaxed/simple;
	bh=WCG4x7RAj1A59gvhqFDMZt0/dV83ifx4kdaQVDiGvv8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lNBqcNb4ZDko1PaNqL3IKjksy4U7qll7eNKyDnxyHxAytFhtc71FNRPrFzqs6vYXMRtWjucb/GeP3dVK/HrP7yd5gZnwgYOLC8S70r720OhI9PVDw4HCUjS8N2Jk8u3PtjmNGKNuV0YCwJXSFm/MqNQCEVdM3shk1XQ5PTjVRR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=J023LZet; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="J023LZet"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738607523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKoag9c+54nBr8hdoUHJ8XU3VHyJTR39TjaDM4YVK34=;
	b=J023LZetrpn9POuixVTXOKfMMZl421/P1IcBET4+XJGCwKJkSNWfwBVpPONX8t+8OgYW1K
	xwHbeOQMTY4bawwQU0pUOKrb6xP3JdpH/Dpz6Z7DwDa/448NJICLVP3CS9AHihzWrEvfmF
	fBHxAcXPw2UpGoNeNE0hnZC9Ul0bK4s=
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
Subject: [PATCH v2 06/14] KVM: arm64: Remap PMUv3 events onto hardware
Date: Mon,  3 Feb 2025 10:31:03 -0800
Message-Id: <20250203183111.191519-7-oliver.upton@linux.dev>
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

Use the provided helper to map PMUv3 event IDs onto hardware, if the
driver exposes such a helper. This is expected to be quite rare, and
only useful for non-PMUv3 hardware.

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 62349b670cf9..60cf973e2af9 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -673,6 +673,18 @@ static bool kvm_pmc_counts_at_el2(struct kvm_pmc *pmc)
 	return kvm_pmc_read_evtreg(pmc) & ARMV8_PMU_INCLUDE_EL2;
 }
 
+static u64 kvm_map_pmu_event(struct kvm *kvm, u64 eventsel)
+{
+	struct arm_pmu *pmu = kvm->arch.arm_pmu;
+	int hw_event;
+
+	if (!pmu->map_pmuv3_event)
+		return eventsel;
+
+	hw_event = pmu->map_pmuv3_event(eventsel);
+	return (hw_event < 0) ? eventsel : hw_event;
+}
+
 /**
  * kvm_pmu_create_perf_event - create a perf event for a counter
  * @pmc: Counter context
@@ -711,13 +723,13 @@ static void kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
 
 	memset(&attr, 0, sizeof(struct perf_event_attr));
 	attr.type = arm_pmu->pmu.type;
+	attr.config = kvm_map_pmu_event(vcpu->kvm, eventsel);
 	attr.size = sizeof(attr);
 	attr.pinned = 1;
 	attr.disabled = !kvm_pmu_counter_is_enabled(pmc);
 	attr.exclude_user = !kvm_pmc_counts_at_el0(pmc);
 	attr.exclude_hv = 1; /* Don't count EL2 events */
 	attr.exclude_host = 1; /* Don't count host events */
-	attr.config = eventsel;
 
 	/*
 	 * Filter events at EL1 (i.e. vEL2) when in a hyp context based on the
-- 
2.39.5

