Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B79270EAF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971820; cv=none; b=BR9YE0MHBYCgeLThjAcvdJc2WZmbNmkJs13A0z2YWUWruT7vwmsVXXngnNjzXlXRHAPkZ/VrdOcpXCY8x1dOHIxorhVZodDTmgh45hqkttFD+9jQ1cJuj6/72jDUrhxIkImDXUe3k7r5H9TNeCCAW9F2gqZOICu7MgmiGODB9X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971820; c=relaxed/simple;
	bh=fmgRhL5vXUT7FBS7t9CJnezLjJZ3VCbnBZ4KpmUy6hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+rux/tAuWq2Y7Qgy6UpiRS6K778hjEvwDKj1PnJJ416YaKK0IyDxTJwuF3rEI21XiqsBuFs+13SQL1Ynbz7RlC4JAk86T79b7kHWxTSrSr25nHNI8cJ0IMmCIFFz982T4AmOvoEj1Rgmz6qEsJ9k/f8yOUhwK1PNG3aDI5wVXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hQtio7i4; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hQtio7i4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=cC8Ld
	NPkcT/2u1+ijE6L5FTUaxOiURX2AC0fC5IpUbw=; b=hQtio7i45XsBdvW0furfB
	S0+QnlQmxaNRB/LCk5JO73Oocg/f0lT84+GA80l0WE3F1oCuou/OVB4/d7FIGkvR
	LTsmZbJzVQrOGn4uOR61CIWAR7rae++EDhf3uquLh6HGyc+HfpJ5HyiHqnjJKgP6
	zUV/8hUheMNSZu0MOq/ksI=
Received: from node-1.domain.tld (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDX34b+JwJoXuTCAw--.12581S2;
	Fri, 18 Apr 2025 18:22:56 +0800 (CST)
From: Jiayuan Liang <ljykernel@163.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayuan Liang <ljykernel@163.com>
Subject: [RFC PATCH 0/1] KVM-arm: Optimize cache flush by only flushing on vcpu0
Date: Fri, 18 Apr 2025 18:22:43 +0800
Message-ID: <20250418102244.2182975-1-ljykernel@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX34b+JwJoXuTCAw--.12581S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr15ZF4kXFy3CF48uF1kGrg_yoW8AF1fpF
	WkA3sYgr4kW34fu3WUJ3yvgw1rGrZ5GFs8JFn8Aw40krs8A3Wvkr9ay3yUZFWUGF95tr47
	GrWqqFyDZrn0yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_YFCUUUUUU=
X-CM-SenderInfo: 5om1yvhuqhzqqrwthudrp/1tbiSg0zbmgCIJDq2gAAsw

This is an RFC patch to optimize cache flushing behavior in KVM/arm64.

When toggling cache state in a multi-vCPU guest, we currently flush the VM's
stage2 page tables on every vCPU that transitions cache state. This leads to
redundant cache flushes during guest boot, as each vCPU performs the same
flush operation.

In a typical guest boot sequence, vcpu0 is the first to enable caches, and
other vCPUs follow afterward. By the time secondary vCPUs enable their caches,
the flush performed by vcpu0 has already ensured cache coherency for the
entire VM.

I'm proposing to optimize this by only performing the stage2_flush_vm() operation 
on vcpu0, which is sufficient to maintain cache coherency while eliminating redundant
flushes on other vCPUs. This can improve performance during guest boot in
multi-vCPU configurations.

I'm submitting this as RFC because:
1. This is my first contribution to the KVM/arm64 subsystem
2. I want to confirm if this approach is architecturally sound
3. I'd like feedback on potential corner cases I may have missed:
   - Could there be scenarios where secondary vCPUs need their own flushes?
   - Is the assumption about vcpu0 always being first valid?

Implementation details:
- The patch identifies vcpu0 by checking if vcpu->vcpu_id == 0

Testing with a 64-core VM with 128GB memory using hugepages shows dramatic
performance improvements, reducing busybox boot time from 33s to 5s.

I'd appreciate any feedback on the correctness and approach of this optimization.

Jiayuan Liang (1):
  KVM: arm: Optimize cache flush by only flushing on vcpu0

 arch/arm64/kvm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)


base-commit: fc96b232f8e7c0a6c282f47726b2ff6a5fb341d2
--
2.43.0

