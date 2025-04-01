Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7E82206BF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523920; cv=none; b=AllMgTmFYm1kM5DOD3u1gFMuUNq1nZ7jE4IsbSOdaYBtgTatDRTIjl8O21yeJPqYXoa/7EcKXAw19E4XydlfsaBIXR9khEBmyls3nnSZanytDMLniaq9Kz87CURtYsdBrFlHHtvGhgQFdg33tgJo/51LpioNOjjttYQctG+AKTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523920; c=relaxed/simple;
	bh=aUHeMAtza3lALIkrYa7Cju0Ow+Rzlcu6X1bDd+6rBGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ir/zaJXcpJs6RleLqnYjHy3qj7sW+mB71c3OzHgNT30aOtULRC34ayGNnZopnW3XfMXeemFMPJwVTOT6jAl8RiwU5A5N5ocw7w9bBw2OmWhtVJ5Li1UFp/GnKFAz3htIQEoi/ahgep65bubbX5YtcktIIOerKDGhysCJrdpYvAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KfXaY4Or; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KfXaY4Or"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DC/nMXHGZlSx0sJ7rLf3alDuDl6Zb/0M1re23sBSw4g=;
	b=KfXaY4OrTh5qNkXM2uPRt8LL+xurGk1bB5cyjc11brzhi0R7eHPWzrSUbk2FpU5bErMLOe
	sdZlzbHfbedhxAQ4cUnO7I73QmEjINqDi6HswCEM489QWhIn4xZVJDfWCsbM6ClPSF21K3
	JxOLZ5tLSqWxwhh5po/Er5CqP/+tfts=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-JHOL8XskNqSl2ex-hmMmhw-1; Tue, 01 Apr 2025 12:11:55 -0400
X-MC-Unique: JHOL8XskNqSl2ex-hmMmhw-1
X-Mimecast-MFC-AGG-ID: JHOL8XskNqSl2ex-hmMmhw_1743523912
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so51390285e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523911; x=1744128711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DC/nMXHGZlSx0sJ7rLf3alDuDl6Zb/0M1re23sBSw4g=;
        b=EqbuA8G0DRPOoHTLoqaqT48MDIlY6mZJNMRggre12leMIKFaIPiQlA7COJCBPRbH2W
         EJQNbzS7DTXWHaSRLRWVxvUFKIT5vHboswVW6j4VFLiUgvfp+SHNa4jKWiJjxSnOPH2k
         hMthzzXO+55WRgp1bJ0+Q4KxQKVDK/alpHig1UNhLb2PJHo0ecxAz6Wikt1D88cwL8XU
         Oki8XpSTVk8TeTBCiOmLU/3t+DVvpirwz5m2UiHbWIAt879pY5oLyOwn11vE7slzyr2x
         Bgx3MgarkeXz6NOxvTJNpJJB8Ht2Dz5HQCR0LweYNlS7PyDMGVBLy3+STx61zMr2flrm
         1naQ==
X-Gm-Message-State: AOJu0Yw6b9ju4wi3o/pqUHvxeo24jvZ9hODDR0uZhwphFEYU8fqB8cnE
	O0rCuB+MIGbodENqAidQeIqldM9yfAQUrF099adIkaKDtvdxLhcprVXrd0juwfhfHuj9C59YzE+
	lCUmojLoBqQnQF61ZVTwUUyp8rTZ3E6a1wFYgVUYFKhGuuPwtx2JyhQwdy8kaPO3PrOr/l9M5yN
	fXFgoFmD0F519aOzOrjRJO1zRu5ERv6B06/fYI16IYtlTRjA==
X-Gm-Gg: ASbGncvDKhziXboGGd/KEjzgum7GAWSsYHrj3f8Vp0qNO8ptwVnHcKhFhRuIJP1f5E3
	tQBPsaoeup8005aNwhi0aBpbvlexiZuo/orYhxYAou2CYg6wzbQ/NP8AOmdoIKvxW/vPHlUhV5A
	+UQ3dNAAIVhtFOCb6SGMk9IayPr+EOLePrcQpF1abaxYGC8qo7W26Kv/T8yxXJeS2x4QD3fmQG0
	NXdqlkJJ00qhtzHwDFnMeQxkXsaWC2S5BX/IO5kYxSSJ+x9UyM4MYVQ/6ik42aGZPOGb9hYM3ll
	VaXkHE9dG0m/uF/BLFK/Hw==
X-Received: by 2002:a05:600c:444d:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-43db6248f51mr106824795e9.15.1743523910868;
        Tue, 01 Apr 2025 09:11:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6cteiO2nE177KrCSu7vAEZTo6A+KIZLn6H0SoIEEXCGg9tK9PGpoiT8WxAi5lNC52sLjZ4w==
X-Received: by 2002:a05:600c:444d:b0:43c:fe85:e4ba with SMTP id 5b1f17b1804b1-43db6248f51mr106824335e9.15.1743523910433;
        Tue, 01 Apr 2025 09:11:50 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm14276926f8f.7.2025.04.01.09.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:48 -0700 (PDT)
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
Subject: [PATCH 15/29] KVM: x86: pass vcpu to kvm_pv_send_ipi()
Date: Tue,  1 Apr 2025 18:10:52 +0200
Message-ID: <20250401161106.790710-16-pbonzini@redhat.com>
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/include/asm/kvm_host.h | 2 +-
 arch/x86/kvm/lapic.c            | 4 ++--
 arch/x86/kvm/x86.c              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 8240f565a764..e29694a97a19 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2334,7 +2334,7 @@ int kvm_cpu_get_extint(struct kvm_vcpu *v);
 int kvm_cpu_get_interrupt(struct kvm_vcpu *v);
 void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event);
 
-int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
+int kvm_pv_send_ipi(struct kvm_vcpu *source, unsigned long ipi_bitmap_low,
 		    unsigned long ipi_bitmap_high, u32 min,
 		    unsigned long icr, int op_64_bit);
 
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index d8d11d9fd30a..c078269f7b1d 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -861,7 +861,7 @@ static int __pv_send_ipi(unsigned long *ipi_bitmap, struct kvm_apic_map *map,
 	return count;
 }
 
-int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
+int kvm_pv_send_ipi(struct kvm_vcpu *source, unsigned long ipi_bitmap_low,
 		    unsigned long ipi_bitmap_high, u32 min,
 		    unsigned long icr, int op_64_bit)
 {
@@ -879,7 +879,7 @@ int kvm_pv_send_ipi(struct kvm *kvm, unsigned long ipi_bitmap_low,
 	irq.trig_mode = icr & APIC_INT_LEVELTRIG;
 
 	rcu_read_lock();
-	map = rcu_dereference(kvm->arch.apic_map);
+	map = rcu_dereference(source->kvm->arch.apic_map);
 
 	count = -EOPNOTSUPP;
 	if (likely(map)) {
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 9f699f056ce6..a527a425c55d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10101,7 +10101,7 @@ int ____kvm_emulate_hypercall(struct kvm_vcpu *vcpu, int cpl,
 		if (!guest_pv_has(vcpu, KVM_FEATURE_PV_SEND_IPI))
 			break;
 
-		ret = kvm_pv_send_ipi(vcpu->kvm, a0, a1, a2, a3, op_64_bit);
+		ret = kvm_pv_send_ipi(vcpu, a0, a1, a2, a3, op_64_bit);
 		break;
 	case KVM_HC_SCHED_YIELD:
 		if (!guest_pv_has(vcpu, KVM_FEATURE_PV_SCHED_YIELD))
-- 
2.49.0

