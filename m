Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE520270EB0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971821; cv=none; b=OMJIvlup4zNZZgbUlkYe5N7Np4oYV4PZzmogQz4v8Kxej69JVTiNjAttWOxwDEe1vD4NOv6H0N7yFnuq11rygAlcsOAaJeQr+jOIndPjOvgEAS/wlTf2D+V6MW0bNECylsw5ZlSakWT4rLjeAcseb9gmUXwiBZwW1ZQKOg4J79Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971821; c=relaxed/simple;
	bh=pLoJ/wWOxF4hATPeF+S4+nCAv8GTTfh4Rs7e8Jmkcbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdLI8CRqXMLer4ypuNcPMu7tLHciNrT2hE2vg0uN8wVARPfOZgQryfO43N0srPqMqVJ/iGn+6cCrPsHw4Y9SfE3DFI9D3lnU0gv/5CNrk5idZsv/PNVloN41hH85jd+v+rLcp0FKWoZXvKuiMNoseyglI3vEeqd8XuF2Dwv4Tt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jd/zPRsI; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jd/zPRsI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=I2pfP
	RHCfMx1686AqGSEqHuKYU80CCi4N80MO83xG7I=; b=jd/zPRsIE1TnNrVaNhTM3
	kxcd/WDZo5qmtQApC/AuzVD8stjDK5bIc5qM73pEmuttirjVkRsB2l5B/FHaXf3f
	1RfwQg+PvUXykIQDPNX0krnoA4YyKv2PWcw80fsxHCAv/0DrHKxyzdT9XnwiuoAp
	stDuu4DnxfMpKe+tJXWgS4=
Received: from node-1.domain.tld (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDX34b+JwJoXuTCAw--.12581S3;
	Fri, 18 Apr 2025 18:22:58 +0800 (CST)
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
Subject: [RFC PATCH 1/1]     KVM: arm: Optimize cache flush by only flushing on vcpu0
Date: Fri, 18 Apr 2025 18:22:44 +0800
Message-ID: <20250418102244.2182975-2-ljykernel@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250418102244.2182975-1-ljykernel@163.com>
References: <20250418102244.2182975-1-ljykernel@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX34b+JwJoXuTCAw--.12581S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zry8Aw4UWrWrtF1xZr47Jwb_yoW8Cw4UpF
	Z3Cw1kKw4kW34xGay7J395ur1rW395JFs8tF98Gw10vwn8Z34q9r9Yk34UAFWDGryxtF4f
	tFWavF1UZrs8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zic4S8UUUUU=
X-CM-SenderInfo: 5om1yvhuqhzqqrwthudrp/1tbiYBAzbmgCJ0IXGAAAst

    When toggling cache state in a multi-vCPU guest, we currently flush the VM's
    stage2 page tables on every vCPU that transitions cache state. This leads to
    redundant cache flushes during guest boot, as each vCPU performs the same
    flush operation.

    In a typical guest boot sequence, vcpu0 is the first to enable caches, and
    other vCPUs follow afterward. By the time secondary vCPUs enable their caches,
    the flush performed by vcpu0 has already ensured cache coherency for the
    entire VM.

    Optimize this by only performing the stage2_flush_vm() operation on vcpu0,
    which is sufficient to maintain cache coherency while eliminating redundant
    flushes on other vCPUs. This can improve performance during guest boot in
    multi-vCPU configurations.

    Testing with a 64-core VM with 128GB memory using hugepages shows dramatic
    performance improvements, reducing busybox boot time from 33s to 5s.

    Test command:
    qemu-kvm \
        -nographic \
        -m 128G \
        -mem-path /dev/hugepages \
        -mem-prealloc \
        -cpu host -M virt \
        -smp 64 \
        -kernel ./Image \
        -append "root=/dev/ram earlycon=pl011,0x9000000 console=ttyAMA0 init=/linuxrc systemd.unified_cgroup_hierarchy=1 psi=1"

    Signed-off-by: Jiayuan Liang <ljykernel@163.com>
---
 arch/arm64/kvm/mmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..fbc736657666 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2300,8 +2300,10 @@ void kvm_toggle_cache(struct kvm_vcpu *vcpu, bool was_enabled)
 	 * If switching it off, need to clean the caches.
 	 * Clean + invalidate does the trick always.
 	 */
-	if (now_enabled != was_enabled)
-		stage2_flush_vm(vcpu->kvm);
+	if (now_enabled != was_enabled) {
+		if (vcpu->vcpu_id == 0)
+			stage2_flush_vm(vcpu->kvm);
+	}
 
 	/* Caches are now on, stop trapping VM ops (until a S/W op) */
 	if (now_enabled)
-- 
2.43.0

