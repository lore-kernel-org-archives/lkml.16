Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1BD227586
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643544; cv=none; b=YrbUw6ASvrPTMS9MQ2tc7qLw0tzDL9B5P+H3spLFD/10/g6wRzpOL830dt2aqCNsKolm0fZBsUgwYlPfBLP62qM47GRumdPtnGxHFBg7sf97Rq7mAtEIwqHv1jPEXy2sV7gQuSwKyw2Mp8Lf9qwDJTdY2QHMBMPtS36KkJ3R+O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643544; c=relaxed/simple;
	bh=cezdU2bQL4U/SmpjZpHsgWLGnEQHdGGqsWftSuehstM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r2f+9JgRgQYc2tyBXQNaxSlHEKwTqPFTnBxvukXp/QIJaBLNiz/emep3XbeAnvnGLP6dCqsnXI68+6RBH8WilKi4fAUmTp6RV2s4ULCJRDjRUb8yikXkvrGwmgruxEofz4TMPFKAXCU3pmUw6izE//alB3h3luZDke7kOfOdTwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cR7jjLLa; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cR7jjLLa"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c3d06de3so1289360b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751643540; x=1752248340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGu8D5CO2g4ATuM30TaqWjSMbmUsVDtUpJDi7E1Auq4=;
        b=cR7jjLLaqLUdLRnaQ6AEWpLsmiBpJi+O9D94HIw1h0HbcusZux+xTSTdWEjWLIz9wt
         fQY9otN6JpHEdlavvwsTB683HPosgz7PhVtlCymsD24o+CsY6F3KR0IXPgxiDfj7thf6
         uGDhiftkBXZTvYEtPjHR026/4WHHPw/yo7dmLCt5gm7jAzETEf0kzHwpa7p6TA8DxKU6
         jb5hU0hqL21l3XIg2YqAwjB56+IOtgTmzP0mYfLNNiuIQXjZ0/6lahqpWIKwgH9w+PTf
         l9TbgzuF034XEil6vwpuTILqtcpTqpXqOGDfALPdOTTsb7+Jjgezrb8byW9iRwpPrP6b
         oF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643540; x=1752248340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGu8D5CO2g4ATuM30TaqWjSMbmUsVDtUpJDi7E1Auq4=;
        b=VWsF57uCufn4ct7j88300grM4Eeg8hLgUXjFteCN+v/eHT0isqFxcZfli/NqAR0zyx
         Z3d6L4kxqllWSAzZNtht0MGM6CCeeqgkEaQKA3EdqMlHcttscsQbw1U1MHjxYDQhITAE
         q2A0WXWXHfl3gyFgIZGidbukz3U4eHuTBZYj2dgiirn43Uw5ClopMySukmYoxPZUz0S8
         6lPuggBOw13VF0FqWss5g2EaFM1fCFP9XQr+vLQW4VgcWjQUCECRION3+RH1wPDIfZqD
         AwJwdu/Hhpb3dkkf4JO97uRGWTrsEq3HmVl0ySuGsKix+dwRQL5V8ph3SVpRVQ2RX5NY
         C94g==
X-Forwarded-Encrypted: i=1; AJvYcCWQ1BWIK118+JlEl3tbKcNaa4hCggETmbADhz7mYLFtcL4qaWFWVnUvBzwH3Fz39ZmmnH2qQlNuQb9jUfs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+oY8RxusbUNnRLqzt9iVo2mqI3lcBRhbllYoo4G9VDi0ey7/X
	+Q6geZ6F7wTYYoDFiVUKa7+2y4GJwhOQWevZzLwJLMbyrSlSbc2xL57l8c5cXrlSdY0=
X-Gm-Gg: ASbGncuBGqaHFaZl1EtAvlcPuhz/osFiyfe3smRIzX3TjG+8f6XB5yOYwA/SqzVwVu/
	APchJY3rlRB08n85JI0cBhwxgEXCdzvLZWfAcrHJufVDHogvbQnSIZgvMgICg+3ClgMkXXzl+o4
	qyeXhEgcYKWOXHmHugKtJB/GDWDhtxPDdIna07MizK6CwjBhGUM7kn+F3JrXxQta+rAHb+z9GC6
	8Hjoi8gwoIK7q1lo3rAxIpI5v1+U7caIgfK/5LB/s1KOEPHpM6ZHBqKuokRqW9+9FWPmiG8Sk7F
	sPETYE9t9OYt+fxV3d6lz528pMXMv71V1BT2zrO+KhS+IeXoNJZ8daKRW+aVW1Cdh6XPlOnckYV
	ifgCqn3M6mW3jYQZehJU=
X-Google-Smtp-Source: AGHT+IEy5K6TN3PEoTMk39/X767PpUlO+bEGeE+f/+6Ff0hJG+gUrinbRE67z7eLIyDgw9OeZ6XYHA==
X-Received: by 2002:a05:6a21:a8e:b0:220:a3de:a083 with SMTP id adf61e73a8af0-225b85f3eafmr5148507637.10.1751643540342;
        Fri, 04 Jul 2025 08:39:00 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee63003bsm2084818a12.62.2025.07.04.08.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:38:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/2] RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization
Date: Fri,  4 Jul 2025 21:08:38 +0530
Message-ID: <20250704153838.6575-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704153838.6575-1-apatel@ventanamicro.com>
References: <20250704153838.6575-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is one HGEI line associated with each IMSIC VS-file on a host CPU.
The IMSIC virtualization already keeps track of the HGEI line and the
associated IMSIC VS-file used by each VCPU.

Currently, the common AIA functions kvm_riscv_vcpu_aia_has_interrupts()
and kvm_riscv_aia_wakeon_hgei() lookup HGEI line using an array of VCPU
pointers before accessing HGEI[E|P] CSR which is slow. Move the HGEI[E|P]
CSR access to IMSIC virtualization so that costly HGEI line lookup and
potential race-conditions when updating HGEI[E|P] CSR can be avoided.

Fixes: 3385339296d1 ("RISC-V: KVM: Use IMSIC guest files when available")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h |  4 ++-
 arch/riscv/kvm/aia.c             | 51 +++++---------------------------
 arch/riscv/kvm/aia_imsic.c       | 45 ++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c            |  2 --
 4 files changed, 55 insertions(+), 47 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 0a0f12496f00..b04ecdd1a860 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -87,6 +87,9 @@ DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 
 extern struct kvm_device_ops kvm_riscv_aia_device_ops;
 
+bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_imsic_load(struct kvm_vcpu *vcpu, int cpu);
+void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu);
 int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu);
 
@@ -161,7 +164,6 @@ void kvm_riscv_aia_destroy_vm(struct kvm *kvm);
 int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
 			     void __iomem **hgei_va, phys_addr_t *hgei_pa);
 void kvm_riscv_aia_free_hgei(int cpu, int hgei);
-void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable);
 
 void kvm_riscv_aia_enable(void);
 void kvm_riscv_aia_disable(void);
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 19afd1f23537..dad318185660 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -30,28 +30,6 @@ unsigned int kvm_riscv_aia_nr_hgei;
 unsigned int kvm_riscv_aia_max_ids;
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 
-static int aia_find_hgei(struct kvm_vcpu *owner)
-{
-	int i, hgei;
-	unsigned long flags;
-	struct aia_hgei_control *hgctrl = get_cpu_ptr(&aia_hgei);
-
-	raw_spin_lock_irqsave(&hgctrl->lock, flags);
-
-	hgei = -1;
-	for (i = 1; i <= kvm_riscv_aia_nr_hgei; i++) {
-		if (hgctrl->owners[i] == owner) {
-			hgei = i;
-			break;
-		}
-	}
-
-	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
-
-	put_cpu_ptr(&aia_hgei);
-	return hgei;
-}
-
 static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
 {
 	unsigned long hvictl;
@@ -95,7 +73,6 @@ void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
 
 bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 {
-	int hgei;
 	unsigned long seip;
 
 	if (!kvm_riscv_aia_available())
@@ -114,11 +91,7 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 	if (!kvm_riscv_aia_initialized(vcpu->kvm) || !seip)
 		return false;
 
-	hgei = aia_find_hgei(vcpu);
-	if (hgei > 0)
-		return !!(ncsr_read(CSR_HGEIP) & BIT(hgei));
-
-	return false;
+	return kvm_riscv_vcpu_aia_imsic_has_interrupt(vcpu);
 }
 
 void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
@@ -164,6 +137,9 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
 		csr_write(CSR_HVIPRIO2H, csr->hviprio2h);
 #endif
 	}
+
+	if (kvm_riscv_aia_initialized(vcpu->kvm))
+		kvm_riscv_vcpu_aia_imsic_load(vcpu, cpu);
 }
 
 void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
@@ -174,6 +150,9 @@ void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
 	if (!kvm_riscv_aia_available())
 		return;
 
+	if (kvm_riscv_aia_initialized(vcpu->kvm))
+		kvm_riscv_vcpu_aia_imsic_put(vcpu);
+
 	if (kvm_riscv_nacl_available()) {
 		nsh = nacl_shmem();
 		csr->vsiselect = nacl_csr_read(nsh, CSR_VSISELECT);
@@ -472,22 +451,6 @@ void kvm_riscv_aia_free_hgei(int cpu, int hgei)
 	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 }
 
-void kvm_riscv_aia_wakeon_hgei(struct kvm_vcpu *owner, bool enable)
-{
-	int hgei;
-
-	if (!kvm_riscv_aia_available())
-		return;
-
-	hgei = aia_find_hgei(owner);
-	if (hgei > 0) {
-		if (enable)
-			csr_set(CSR_HGEIE, BIT(hgei));
-		else
-			csr_clear(CSR_HGEIE, BIT(hgei));
-	}
-}
-
 static irqreturn_t hgei_interrupt(int irq, void *dev_id)
 {
 	int i;
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index ea1a36836d9c..fda0346f0ea1 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -677,6 +677,48 @@ static void imsic_swfile_update(struct kvm_vcpu *vcpu,
 	imsic_swfile_extirq_update(vcpu);
 }
 
+bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu)
+{
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	unsigned long flags;
+	bool ret = false;
+
+	/*
+	 * The IMSIC SW-file directly injects interrupt via hvip so
+	 * only check for interrupt when IMSIC VS-file is being used.
+	 */
+
+	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	if (imsic->vsfile_cpu > -1)
+		ret = !!(csr_read(CSR_HGEIP) & BIT(imsic->vsfile_hgei));
+	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+
+	return ret;
+}
+
+void kvm_riscv_vcpu_aia_imsic_load(struct kvm_vcpu *vcpu, int cpu)
+{
+	/*
+	 * No need to explicitly clear HGEIE CSR bits because the
+	 * hgei interrupt handler (aka hgei_interrupt()) will always
+	 * clear it for us.
+	 */
+}
+
+void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *vcpu)
+{
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	unsigned long flags;
+
+	if (!kvm_vcpu_is_blocking(vcpu))
+		return;
+
+	read_lock_irqsave(&imsic->vsfile_lock, flags);
+	if (imsic->vsfile_cpu > -1)
+		csr_set(CSR_HGEIE, BIT(imsic->vsfile_hgei));
+	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
+}
+
 void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 {
 	unsigned long flags;
@@ -781,6 +823,9 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 	 * producers to the new IMSIC VS-file.
 	 */
 
+	/* Ensure HGEIE CSR bit is zero before using the new IMSIC VS-file */
+	csr_clear(CSR_HGEIE, BIT(new_vsfile_hgei));
+
 	/* Zero-out new IMSIC VS-file */
 	imsic_vsfile_local_clear(new_vsfile_hgei, imsic->nr_hw_eix);
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index fe028b4274df..b26bf35a0a19 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -211,12 +211,10 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu)
 {
-	kvm_riscv_aia_wakeon_hgei(vcpu, true);
 }
 
 void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu)
 {
-	kvm_riscv_aia_wakeon_hgei(vcpu, false);
 }
 
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
-- 
2.43.0

