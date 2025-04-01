Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E97220693
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523919; cv=none; b=pF657aptzwY3i1jxfpq7Gqz23EZ3NeEfY9DQUdfI79CfdlXHP9FUkW+Qt0Vi+A6b3jQvyV/Rn5aA0MoSMIrR4TAOQxufXv8/s48St3gjuT2b0O4l/HdP0lpab8kcgr958YLD+p2OhqVVGoTNUnJSOAsCJ4fjJAKv7U18WMzui0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523919; c=relaxed/simple;
	bh=4+ShkaclNBVkSqlXTUWslO5wly515CBbMa70/QPy/14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZXZ0cQ8WDvseV1BO2ZEP2z15oNaqeTKpzRJUwpTMlWMr9XhgGTjCxNVCi1XrO8nPIJF6Gkl2DCHugpu85GHKcW0WLoX3l6DS01MYH90FilJXrl02LDty9DpTXfZjLlXquJ+HexTYaAJV/eWfLL5zk1E7jtW56stsEK1+8fq0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a5ziWGK0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a5ziWGK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UaINNrC6inNW3Mym/pTKp2ET1N4DSwNzn/ffTCwZc4A=;
	b=a5ziWGK0oKoIHNuJiQnGEyZq+DPHg7XmLjZcn5tlBwoJUbdMHwT0ayn/ErPo3Bf3xIvA/7
	5qXhc5Lo0TQ+dZDYi8+RjHPVO9FWf26rMuHiaIUyQGS2GEBS4PDu68Tg42LXkYu5U0oTif
	VC1VRMZoqL22QsTLmjy8nnsN4yipIU4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-w22qqOqoNwerR4J-IIjKBw-1; Tue, 01 Apr 2025 12:11:55 -0400
X-MC-Unique: w22qqOqoNwerR4J-IIjKBw-1
X-Mimecast-MFC-AGG-ID: w22qqOqoNwerR4J-IIjKBw_1743523914
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3914bc0cc4aso2885721f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523913; x=1744128713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UaINNrC6inNW3Mym/pTKp2ET1N4DSwNzn/ffTCwZc4A=;
        b=GQvdHrQSTB0cJ4BEzhC5O2yOgH58Ktqui0CM2y08172oaJrupSMWnybMqVt1l4Turs
         qwthxNn9adzTQD1cX44nPRfvFZjMX8LLqG1eInu67WOGtWVq54jpt/6OavBbS9Nv/SOS
         /63lBt/r/2bhdnKx7cjiNK1Fp3UzAW9o/2+QzWGdu2g7TnjfPJAL3Jn0eZtf27f/Gklg
         DUuV8WYf733qvsRcIwRwcXutxNs0XKl7Ih96cAIiBb7wq3Tg8+tQRcEooJd3Ly/8ildM
         uc2/Oq5qmLnYWF9oW/M9gyFBUepW0RPYkwMrgf5HK3/tcFE6jUW2JTLX9eo8VB7h6O/F
         tMWA==
X-Gm-Message-State: AOJu0Yy8OK5kO9UT1SxKN33iuzRgU0HwjEBZVJVqs8g6GRRjL+RAKiOI
	sv835MxQT6uuPqslZhkXl7ArWL9tBmEO3BDJnvFbK44SALTl1SxMmAFziALjN2AzQDccFWbdSy5
	SydSe5SV2q8o670fKx7/Ih975vS6ojrs/J6WypK5p9c3S7xVr6GMEgwRqPQwQRkyQg9t+03Durq
	BjgyCoqq0idwcD2AR5IAbouZi5ngXmeSyyot4W12Dv5dT5Sg==
X-Gm-Gg: ASbGncsVmo9e9HvLfaX76knvxC9UQUpbFd8/lWiM+sKi02DMosZ6FJV37SysEWyEqvQ
	+r+x2J9+R5w4QNzLFiA/Ms8WwP0to3qZpWQ4lGuwz9Iov4Yf/u/tYiPxQ5j4MVcrysSulIhqeN1
	wcEvXRPRMv6iyrXlZvPts+ImKlf3Hnqp5A0KSpnBd4SUcolRaXFnizQLtcsECQpnm+M7GGmg1/F
	wLOcojMxEWMVN3ur121AES19A/BQGK1N0PyN3meBLptPL/cJD+kECcK4GIjGiTI376nu0RAxxAB
	qIyn9LoFvYA6LYG+hbexKQ==
X-Received: by 2002:a05:6000:430e:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-39c268eae24mr2570939f8f.0.1743523913230;
        Tue, 01 Apr 2025 09:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHP7UEfcGfLr0vO0H9IZqm3DR9p/GuTN1cmhrTGdbGPRl5CO1PoNYMm3svPGs26HA+6q4WUQ==
X-Received: by 2002:a05:6000:430e:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-39c268eae24mr2570871f8f.0.1743523912597;
        Tue, 01 Apr 2025 09:11:52 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a41b4sm14291601f8f.85.2025.04.01.09.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:51 -0700 (PDT)
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
Subject: [PATCH 16/29] KVM: x86: split "if" in __kvm_set_or_clear_apicv_inhibit
Date: Tue,  1 Apr 2025 18:10:53 +0200
Message-ID: <20250401161106.790710-17-pbonzini@redhat.com>
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
 arch/x86/kvm/x86.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a527a425c55d..f70d9a572455 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10637,6 +10637,7 @@ void __kvm_set_or_clear_apicv_inhibit(struct kvm *kvm,
 				      enum kvm_apicv_inhibit reason, bool set)
 {
 	unsigned long old, new;
+	bool changed;
 
 	lockdep_assert_held_write(&kvm->arch.apicv_update_lock);
 
@@ -10644,10 +10645,10 @@ void __kvm_set_or_clear_apicv_inhibit(struct kvm *kvm,
 		return;
 
 	old = new = kvm->arch.apicv_inhibit_reasons;
-
 	set_or_clear_apicv_inhibit(&new, reason, set);
+	changed = (!!old != !!new);
 
-	if (!!old != !!new) {
+	if (changed) {
 		/*
 		 * Kick all vCPUs before setting apicv_inhibit_reasons to avoid
 		 * false positives in the sanity check WARN in vcpu_enter_guest().
@@ -10661,16 +10662,16 @@ void __kvm_set_or_clear_apicv_inhibit(struct kvm *kvm,
 		 * servicing the request with a stale apicv_inhibit_reasons.
 		 */
 		kvm_make_all_cpus_request(kvm, KVM_REQ_APICV_UPDATE);
-		kvm->arch.apicv_inhibit_reasons = new;
-		if (new) {
-			unsigned long gfn = gpa_to_gfn(APIC_DEFAULT_PHYS_BASE);
-			int idx = srcu_read_lock(&kvm->srcu);
+	}
 
-			kvm_zap_gfn_range(kvm, gfn, gfn+1);
-			srcu_read_unlock(&kvm->srcu, idx);
-		}
-	} else {
-		kvm->arch.apicv_inhibit_reasons = new;
+	kvm->arch.apicv_inhibit_reasons = new;
+
+	if (changed && set) {
+		unsigned long gfn = gpa_to_gfn(APIC_DEFAULT_PHYS_BASE);
+		int idx = srcu_read_lock(&kvm->srcu);
+
+		kvm_zap_gfn_range(kvm, gfn, gfn+1);
+		srcu_read_unlock(&kvm->srcu, idx);
 	}
 }
 
-- 
2.49.0

