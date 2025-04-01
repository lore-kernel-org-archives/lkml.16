Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D0A2236F6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523945; cv=none; b=JyZbJFpSSSRJa9glip0eAhcgRiCDxdOBlEpYRsN6/lNuOwzo3sGjdP1sB5DD/fDhlSv9hJlgZ6sSeMQhnocneoyYECCjNo8GaDHAaYEea7C1mQvdKTudDJzJ+gYASukFByyRha1oolhokqZszv1J0wmg+bkzYj0zpKet6o3C9jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523945; c=relaxed/simple;
	bh=Jr48n7DTkbCOMB/d0GEJ1ZQWRT8vQDsoeXOK//lT2/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QMx6vUW7NEInjj4isWX1wWT+cQKndBQeK+HwyWUU/Hf+GAOJW0tSspXxCnXfotTPLKcgnJaa5QFkodkzzXSrh9/I+hMscOHo/Na/Lla369GVPv0t7Hw2WnQCqCDjyelwEfB+/d6f6VbHeJ+wDiqo4AiC1ZnKG5av5v9FMF2A87c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eO8K3TFN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eO8K3TFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMmSY+BAN+od5q2oN5V+h7YwfbF4XF3XqSY7nT/C4e4=;
	b=eO8K3TFNNyfFXoH8F8dWLrMwdH629XyAeyR4emBFCS4+bZ1MM8pRGGBmlgZsjtKoGr4Zcl
	oj8joZWqaZNoFHQy9xt/qBOEvFC/FHl69cyce/gpKt1nvk5M26c00J5/ksM216MnKgzLIr
	Fif5IBGNpsc7Y+QfkCQ3eMBG2u5PUwY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-Ocxnm4yCMY2KPrUAnhTCQg-1; Tue, 01 Apr 2025 12:12:22 -0400
X-MC-Unique: Ocxnm4yCMY2KPrUAnhTCQg-1
X-Mimecast-MFC-AGG-ID: Ocxnm4yCMY2KPrUAnhTCQg_1743523941
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so2996989f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:12:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523940; x=1744128740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMmSY+BAN+od5q2oN5V+h7YwfbF4XF3XqSY7nT/C4e4=;
        b=sE5emEoUogAsyk333E6dy/9FU9emsNWeNP1VWJDM+wntCSujK+eka3ATJdPGbTqZQ/
         YX7hjT+FJj7IuBL39wfrbSZSyzeHHKTfCPOZcw4Rn7SJYgEsPm9Hchho34QJjegkzXoL
         ++aS//MWwZWO/R8N6vw0eEFXm3a8pAgcB4ff8/wBVZuqBx+PJuAa+qxd35ZBHmE7m4Oh
         dSZY4VlQbAXEFvEmx5NqDoeEjWTwrGPFjfV4u18u1h5TSzc9txatrf1hS+ZMe7+oquJO
         R29RDcWGYHwpRmwZVAc/BPI5iYuw+cLT2kP8nWSVtwE99xgEM18GOwH81NJAE9gyHIv4
         fotQ==
X-Gm-Message-State: AOJu0YwnLZL2KF5KHDLlJBcRo+QXRze4ZWgXuueblSWcYduPMkAWn0EO
	OO/pMT5MCPYS1ms42VyKHtMASfp768uXogVB6SCpW5xS5dRpPeSAZEvqBh/Y7crNWJ5OXBJqe+n
	bglGi6dYyLcKvAonjhvoIuxiPZvxASxvm9T5KCYxzMB4i5OOKo9eVjn/drMyM77jKeoyIAh15q0
	2HckHwMDnNMs+uieVE1rjdtl2IbbuljArk1mJXVBS+3drubQ==
X-Gm-Gg: ASbGncu8k/K7o7lWfihyn8dEMcmH6Y3gScexk0yHDLJorHQfnpby9D4MN/fnPkp1AfY
	+l8+Gi0oVVorwMdA2BnMB8SWQD3zas2XdNz91OOnAMN3w+PpEt/7sfg+sp6TZzblpFqNgDHTSxK
	dE/mDgqBi3ZooF+ypbfB9pXW2XE6F3ccBRs+Gtwzfx4TzwPI7Jrok53wxI6lY9rRJ2+/N0+ifNT
	YzekyRV3Iq3b9STHw5OMp2B+NnVoyrYyvs1yNpc2nxQHYHS/0k28qPm6DNEaL31BC12Zzex3Ew0
	i4e/pOm3XLuWGcfrCvd4uA==
X-Received: by 2002:a05:6000:188b:b0:391:20ef:62d6 with SMTP id ffacd0b85a97d-39c120cb835mr10465222f8f.11.1743523940245;
        Tue, 01 Apr 2025 09:12:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFwlHiQzmqyX2anRC0qQyOVR2lkXQfjeA/y3ngR7h2MBX/VCdz2HKMdJUXOZo8Odrhhl0ySQ==
X-Received: by 2002:a05:6000:188b:b0:391:20ef:62d6 with SMTP id ffacd0b85a97d-39c120cb835mr10465179f8f.11.1743523939799;
        Tue, 01 Apr 2025 09:12:19 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fbc1716sm158501095e9.15.2025.04.01.09.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:12:17 -0700 (PDT)
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
Subject: [PATCH 26/29] KVM: x86: enable up to 16 planes
Date: Tue,  1 Apr 2025 18:11:03 +0200
Message-ID: <20250401161106.790710-27-pbonzini@redhat.com>
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

Allow up to 16 VM planes, it's a nice round number.

FIXME: online_vcpus is used by x86 code that deals with TSC synchronization.
Maybe kvmclock should be moved to planex.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/include/asm/kvm_host.h | 3 +++
 arch/x86/kvm/x86.c              | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 0344e8bed319..d0cb177b6f52 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2339,6 +2339,8 @@ enum {
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
 #endif
 
+#define KVM_MAX_VCPU_PLANES	16
+
 int kvm_cpu_has_injectable_intr(struct kvm_vcpu *v);
 int kvm_cpu_has_interrupt(struct kvm_vcpu *vcpu);
 int kvm_cpu_has_extint(struct kvm_vcpu *v);
@@ -2455,6 +2457,7 @@ int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages);
  */
 #define KVM_EXIT_HYPERCALL_MBZ		GENMASK_ULL(31, 1)
 
+int kvm_arch_nr_vcpu_planes(struct kvm *kvm);
 bool kvm_arch_planes_share_fpu(struct kvm *kvm);
 
 #endif /* _ASM_X86_KVM_HOST_H */
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4546d1049f43..86d1a567f62e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13989,6 +13989,12 @@ int kvm_handle_invpcid(struct kvm_vcpu *vcpu, unsigned long type, gva_t gva)
 }
 EXPORT_SYMBOL_GPL(kvm_handle_invpcid);
 
+int kvm_arch_nr_vcpu_planes(struct kvm *kvm)
+{
+	/* TODO: use kvm_x86_ops so that SNP can use planes for VTPLs.  */
+	return kvm->arch.has_protected_state ? 1 : KVM_MAX_VCPU_PLANES;
+}
+
 bool kvm_arch_planes_share_fpu(struct kvm *kvm)
 {
 	return !kvm || kvm->arch.planes_share_fpu;
-- 
2.49.0

