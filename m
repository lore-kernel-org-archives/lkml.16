Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8728822256C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523938; cv=none; b=fAOyPMTVIP3STj364roePd0oSJELJ/KdyUmnrv+SU71+qRi2GUs8f3eYGh/zAUobVWl/nmnSI2Lc+IPvv5Wq7saZkBUjBuyI0pebnwKvKDhd3Am4L7gcS9Qso8pFqHQhm+Zmxe7v2YyB/iKCttvpBPKhJl2g9o+JriIItSOR9QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523938; c=relaxed/simple;
	bh=rEEG/JqTWYMnquhcA1NsEvfPwDFWFVv9Eii5wJCc9Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8/cMvm1U/7dyNBpqcg8tGLtcAKnEFFUGyfS10QhzNse/5VjLRS4cWJsfG9Yuae66pIQJObi7U8h57gcEPyZsTxErybNbDpfTm43XVzsPonOjHXqscijTN2aT+tU8Ya+LJg5E/nmZKFL+Lxr0kHYZ6EM23NQrfrRaZ1GVp3JcYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fdcRZeMp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fdcRZeMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=clEaJtGkNoCtPvE/vwlOxKGgMTuZLXXi/afw5Ojz1dw=;
	b=fdcRZeMp+6Cv7Rqo498oJ1QBv8fQH+8f8F/eGvNd4cxAQnIJEDk332GaZb8EqursOYf6Dr
	HVOeeEF7vypGM+KSX5Nn8FXH4WhddoYHnJ2/WcO2Vnv+V0wkM25YKGIvyuTcTdGUpFSZf9
	P0TNN3VOD5yHNlKfQGgWlpN/u1u+U68=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-V-7GX5gmOzily_rnOgwy1w-1; Tue, 01 Apr 2025 12:12:14 -0400
X-MC-Unique: V-7GX5gmOzily_rnOgwy1w-1
X-Mimecast-MFC-AGG-ID: V-7GX5gmOzily_rnOgwy1w_1743523933
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so47373945e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523932; x=1744128732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clEaJtGkNoCtPvE/vwlOxKGgMTuZLXXi/afw5Ojz1dw=;
        b=iBxhICRZ/j7alBtQGadG+ZxYLc4f77+vFesQFOnbltc9BcRZ+hHIup78Kdkqt2rC5E
         aBPfbnPCNZuC04XIkhqwXrhVAhdKny0Z/i+rO/YpR6P6hfiV+aU8w3ukW2YxwCLpOLCo
         LCjTzrXncXwtsm0mRRPgIOvkFe/RyGpiFHZsG+MkKAXGd2IGGM6pmCCqurd+OJ5hxK3B
         fGRVvccbcElVOUg0BkriMy5KWilqyvOFR0K3RF0tsmkBTg+5nV/74NPMp6BPzLwhZDoB
         rmiAfRk8o82DNXHy5hgukOi/DVK9opbjqfgOEud/xWGpaGBgAmJU3Nas2zD4BBJo0cBE
         aYsw==
X-Gm-Message-State: AOJu0YzMU2qLc5nWqOOiwfwAZn+5A0HRr1Hq0I9DQkaWUHWvRI9Cv/0l
	oJe2Q99aLJgCliJbgHI/As+ZyzOfKUAT0FpFDpA0bJYIxK4uWnJI9JIJZ8f8K0/3dKpSn3nP4zg
	AEF44/2KmmNMEvh6fftQmYyDVIVdu97ml8aMtnmnJZmydY342QLgqUY0QWLt4yI1aw8qcS3v5lP
	ag09ORwRwk4UOtvLkA1zq0eAJqeEjUkOeRcDYm9Du37vgPcw==
X-Gm-Gg: ASbGncvd8AU6WBSUWGZ17Zx647XZYLxNythYjoM3GgO8ReEtqw8vzzKIxFIo7KwmdzO
	ayzSSKQQj+IkWRw5a5AMs8twHJ0y4fbAy9cJSpQZwZDe15qqJ7HhaD5O9q/4LzybIpLzPJNouXr
	rur/UKk3NYbES1h6QP2xXlEKFvGHC+ATkcjletgawdqW697Oeb1eG1oWAIRhzK0IGjApGr1SgPJ
	+QHk6+OrOLIeSEHJgs94nkxZd65lVhNrcI0QhPwWTA4OyordjzTPTLhzU6eTfGFVdr2Mw7GQLbh
	e80iTayoz1FbVV8PPFJ0Pg==
X-Received: by 2002:a05:600c:3584:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-43db62b7c5emr104954935e9.19.1743523932590;
        Tue, 01 Apr 2025 09:12:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcsGAEYE+5PwlQjdEBXjpJ/Slimxfn6OxxsnrMh8halxw+3MQX3DryS9bQZc9lJ/fr1kYiAQ==
X-Received: by 2002:a05:600c:3584:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-43db62b7c5emr104954555e9.19.1743523932128;
        Tue, 01 Apr 2025 09:12:12 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba3b13sm165471445e9.3.2025.04.01.09.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:12:10 -0700 (PDT)
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
Subject: [PATCH 23/29] KVM: x86: extract kvm_post_set_cpuid
Date: Tue,  1 Apr 2025 18:11:00 +0200
Message-ID: <20250401161106.790710-24-pbonzini@redhat.com>
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

CPU state depends on CPUID info and is initialized by KVM_SET_CPUID2,
but KVM_SET_CPUID2 does not exist for non-default planes.  Instead, they
just copy over the CPUID info of plane 0.

Extract the tail of KVM_SET_CPUID2 so that it can be executed as part
of KVM_CREATE_VCPU_PLANE.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/cpuid.c | 38 ++++++++++++++++++++++++--------------
 arch/x86/kvm/cpuid.h |  1 +
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index f760a8a5d719..142decb3a736 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -488,6 +488,29 @@ u64 kvm_vcpu_reserved_gpa_bits_raw(struct kvm_vcpu *vcpu)
 	return rsvd_bits(cpuid_maxphyaddr(vcpu), 63);
 }
 
+int kvm_post_set_cpuid(struct kvm_vcpu *vcpu)
+{
+	int r;
+
+#ifdef CONFIG_KVM_HYPERV
+	if (kvm_cpuid_has_hyperv(vcpu)) {
+		r = kvm_hv_vcpu_init(vcpu);
+		if (r)
+			return r;
+	}
+#endif
+
+	r = kvm_check_cpuid(vcpu);
+	if (r)
+		return r;
+
+#ifdef CONFIG_KVM_XEN
+	vcpu->arch.xen.cpuid = kvm_get_hypervisor_cpuid(vcpu, XEN_SIGNATURE);
+#endif
+	kvm_vcpu_after_set_cpuid(vcpu);
+	return 0;
+}
+
 static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
                         int nent)
 {
@@ -529,23 +552,10 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 		goto success;
 	}
 
-#ifdef CONFIG_KVM_HYPERV
-	if (kvm_cpuid_has_hyperv(vcpu)) {
-		r = kvm_hv_vcpu_init(vcpu);
-		if (r)
-			goto err;
-	}
-#endif
-
-	r = kvm_check_cpuid(vcpu);
+	r = kvm_post_set_cpuid(vcpu);
 	if (r)
 		goto err;
 
-#ifdef CONFIG_KVM_XEN
-	vcpu->arch.xen.cpuid = kvm_get_hypervisor_cpuid(vcpu, XEN_SIGNATURE);
-#endif
-	kvm_vcpu_after_set_cpuid(vcpu);
-
 success:
 	kvfree(e2);
 	return 0;
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index d3f5ae15a7ca..05cc1245f570 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -42,6 +42,7 @@ static inline struct kvm_cpuid_entry2 *kvm_find_cpuid_entry(struct kvm_vcpu *vcp
 int kvm_dev_ioctl_get_cpuid(struct kvm_cpuid2 *cpuid,
 			    struct kvm_cpuid_entry2 __user *entries,
 			    unsigned int type);
+int kvm_post_set_cpuid(struct kvm_vcpu *vcpu);
 int kvm_vcpu_ioctl_set_cpuid(struct kvm_vcpu *vcpu,
 			     struct kvm_cpuid *cpuid,
 			     struct kvm_cpuid_entry __user *entries);
-- 
2.49.0

