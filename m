Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A525621D596
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523914; cv=none; b=B2hQZqdQmKmarrExgu7hOVgm7aSyC/86vDm+AJGp0TW4F3izocM6bUrOKTnyLSnX2uV3JTSD87ZhjXwHo/tJ+O43WJEBjDyCBHfKWHlWjlaQs3nAwSDFxzvF1c6WVXvbXDJz2tdedf0SXAfT8jLaAxsQUEFXCm9/d5gl1grQCOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523914; c=relaxed/simple;
	bh=RefrmAkQ0L+4IQy+OTCdYSqXd/r04zNM+VND4kN61fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EetsRYcdPpMGHlXhFyjKXs1fHgarcy3gvg5praz3MBP6ZheTNj7qzeEU37A2mb3K1yHdpQTthK3lZu/X75yDtBbyIw3qSRofVBKkvwSlEzMOcoVdgVYA0wqj/Q82G1ggNsp95lkWv2sZ08tiaahh/yjfzCeJbblfAhtMuqVVzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0aONPLX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0aONPLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dIfnqOGSQOH72XfcWRssGMHV1iaqS8FYDinT6SkIDjk=;
	b=L0aONPLXxzvdHp1JIHZC+0II1jdX5vchpaXb0RO/OK5wQyt21U1J0+bPRJ+d9+fhZvxXjq
	2t6N+XMpLPV4qhW2UZ242esbb7msukr+Gmf5jpMPc010CsVSAvA0aNrGB4Idhb0mMNVGt3
	lUVHTH16v9GK3QRo2b1L6l6vqEvUrnU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-9kax3A6IP5Wqo44BMnVglA-1; Tue, 01 Apr 2025 12:11:50 -0400
X-MC-Unique: 9kax3A6IP5Wqo44BMnVglA-1
X-Mimecast-MFC-AGG-ID: 9kax3A6IP5Wqo44BMnVglA_1743523909
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39135d31ca4so3063388f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523908; x=1744128708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIfnqOGSQOH72XfcWRssGMHV1iaqS8FYDinT6SkIDjk=;
        b=sTLh539faEhtYiq9EeUwO7TZpdYesjEkL5YSaoDYuJ2nkA5ggbu3GdgP7qdZQEQ9Rq
         boXmPtWmueSOWeY8gO6HRjLQSd+rOCNbREgwMAlqVneDzv8ghca395dQvPnrOMzVyrIK
         Cb7bG38rV+DUz6nAljb/xiX37wCOKFPgYEiSf+Ya7NT8WCoItl8YB4Q1aLvpp1gFBqf+
         rO9p/3gtAS6xrihP+zGDyKprWFco7SuhVIweCRibdHA9WVlpjE+2+hlytsmcCadrUETq
         xueEmID6IlbE2qAtIdTrS6xyOf/pOH5ELFjRElYUpaInnlRKOCED5Ky4XiJgr5skQ9+D
         12oA==
X-Gm-Message-State: AOJu0YxfqiOEvjGd6/2gEiFN5EoL2LhSfgaIVZ8CqV9kJN1xWwG5IldF
	VuOCE/Rmi0+7Ngie5Yyh5oqOi1/YJC4J9/Vb0vdBnbI0G5eWAbrOMsDRFEQ8xfBTbHVOtujRyCy
	lABjxo5uZmu/xE3idwp7ig/a9efEp+qMrOGYp/9miE4ZUmJOMRuidMHkElLSGBNQVUCSOTwfuyJ
	EMZA8pdi2ypMto0M+xm0bC5foHDgPVsBcmHVPPMg1Ucw4XgQ==
X-Gm-Gg: ASbGncsVAPoDEXGgPXe/In+mb956yYU9A5a0bCoccsS1FjvvPQIG21xdbXxO7X7oQBl
	pN3ATRRAthkZKdAnKvdWHdcJi8Xys7AT5bIe2O7Xn1aps3Xi0F+1hwhXRZ8z+PvBcZk2mX4nBAA
	v+kXhiGeRP3Svq2Ye7Xj7COdddXAmCklrpImRPLGgp1MQJ4lwTzVOp4bSwuCwo+LadGi13+rMjO
	MY4YxOCyefmhgl9quYYOJzUb0o9UTUSJAoB/F6M0UBqv3WL8Bht39wd0RhIE4OmnXzbjLp8pe+j
	hBSyDmzHSxVEAlpsgP9dTA==
X-Received: by 2002:a05:6000:18a2:b0:39c:dfa:e86c with SMTP id ffacd0b85a97d-39c27efc018mr542266f8f.13.1743523908039;
        Tue, 01 Apr 2025 09:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEH9kQ+udDvKebNrdMvaVgGuN+oLXLUK6O9cvy6KAk/oIwzHbZqyR7QPJ1CTGQr9niaqGFOA==
X-Received: by 2002:a05:6000:18a2:b0:39c:dfa:e86c with SMTP id ffacd0b85a97d-39c27efc018mr542224f8f.13.1743523907620;
        Tue, 01 Apr 2025 09:11:47 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66ad1esm14707692f8f.52.2025.04.01.09.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: roy.hopkins@suse.com,
	seanjc@google.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	jroedel@suse.de,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com
Subject: [PATCH 14/29] KVM: pass plane to kvm_arch_vcpu_create
Date: Tue,  1 Apr 2025 18:10:51 +0200
Message-ID: <20250401161106.790710-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161106.790710-1-pbonzini@redhat.com>
References: <20250401161106.790710-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the plane to architecture-specific code, so that it can also share
backing data between plane 0 and the non-zero planes.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/arm64/kvm/arm.c       | 2 +-
 arch/loongarch/kvm/vcpu.c  | 2 +-
 arch/mips/kvm/mips.c       | 2 +-
 arch/powerpc/kvm/powerpc.c | 2 +-
 arch/riscv/kvm/vcpu.c      | 2 +-
 arch/s390/kvm/kvm-s390.c   | 2 +-
 arch/x86/kvm/x86.c         | 2 +-
 include/linux/kvm_host.h   | 2 +-
 virt/kvm/kvm_main.c        | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 94fae442a8b8..3df9a7c164a3 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -427,7 +427,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 	return 0;
 }
 
-int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
+int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
 {
 	int err;
 
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 470c79e79281..71b0fd05917f 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -1479,7 +1479,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 	return 0;
 }
 
-int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
+int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
 {
 	unsigned long timer_hz;
 	struct loongarch_csrs *csr;
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 77637d201699..fec95594c041 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -275,7 +275,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 	return 0;
 }
 
-int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
+int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
 {
 	int err, size;
 	void *gebase, *p, *handler, *refill_start, *refill_end;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index a39919dbaffb..359ca3924461 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -762,7 +762,7 @@ static enum hrtimer_restart kvmppc_decrementer_wakeup(struct hrtimer *timer)
 	return HRTIMER_NORESTART;
 }
 
-int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
+int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
 {
 	int err;
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 55fb16307cc6..0f114c01484e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -107,7 +107,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 	return 0;
 }
 
-int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
+int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
 {
 	int rc;
 	struct kvm_cpu_context *cntx;
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 46759021e924..8e3f8bc04a42 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -3970,7 +3970,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 	return 0;
 }
 
-int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
+int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
 {
 	struct sie_page *sie_page;
 	int rc;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2c8bdb139b75..9f699f056ce6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -12293,7 +12293,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 	return kvm_x86_call(vcpu_precreate)(kvm);
 }
 
-int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
+int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane)
 {
 	struct page *page;
 	int r;
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 99fd90c5d71b..16a8b3adb76d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1622,7 +1622,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
 void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id);
-int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu);
+int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu, struct kvm_plane *plane);
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu);
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 06fa2a6ad96f..cb04fe6f8a2c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4207,7 +4207,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm_plane *plane, struct kvm_vcpu *pl
 	vcpu->dirty_ring = &plane0_vcpu->__dirty_ring;
 	kvm_vcpu_init(vcpu, plane, id);
 
-	r = kvm_arch_vcpu_create(vcpu);
+	r = kvm_arch_vcpu_create(vcpu, plane);
 	if (r)
 		goto vcpu_free_dirty_ring;
 
-- 
2.49.0

