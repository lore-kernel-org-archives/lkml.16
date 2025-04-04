Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F21B21B4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762575; cv=none; b=SFSGh742Q+s9Q/yuUh4rUNUt2gHhQLhOGewdrp3BvKtuDSL+wvuXoJ/HVpSI2Z0j5T+4rJPSAFdOQyCJTPYgfU8xBgqnfi2B7ZToQJDcL+CafiE67HEdjJNJxvSN6Gjqywa3e/AcQaF2psrClXJ7YtPndi3NZ2Qu68VgOPPTIbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762575; c=relaxed/simple;
	bh=ZXP9PdtNz5G4gmYwe9qut0Sxd9Ty7phi4XqNd27CsSM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQJqTOf31J3S1rS9AT7N0YwLh86qLu6jm/u1Rt8d0Q7J/1rrcvT/7dZVrH2qnYfzUDF2vpVwyyYt0VKOKachwORty7+ckCQ4b6sFl4E2fcaBH28dutSiO7s3J0See8L0StXZ0NG1+PYjlwQlBaLqtJWGf+g0kJ5JO1fFkWIiEdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fC/G40EX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fC/G40EX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743762572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fh7eVIHVK7DZbml0KKr5DVpGA1dcsH/iEq7JogkgDmY=;
	b=fC/G40EXrH3amn5X0kRTDKnfgse98NnxzYRpAVu7V2yUa2v4MIBxzPVYno8WohkmAX7xoA
	yp97eUdDjDCCUJsAsA4nHAkH1mb7kqCMirkcdqxB+xoX+KPPxo+GSYmZOnhiI3R9clp8VK
	ZW6aHTr25NqfvCNygswfdEVNiF+76HI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-8CWqUdUrPH2sbYNP0bVlUA-1; Fri, 04 Apr 2025 06:29:31 -0400
X-MC-Unique: 8CWqUdUrPH2sbYNP0bVlUA-1
X-Mimecast-MFC-AGG-ID: 8CWqUdUrPH2sbYNP0bVlUA_1743762570
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5e82390b87fso1693699a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762569; x=1744367369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fh7eVIHVK7DZbml0KKr5DVpGA1dcsH/iEq7JogkgDmY=;
        b=o/ph+ovAHZZ2hzS/hjYkcijEkJEQ71zotxI+un2EeZGLfinTzRt0JmoqDCOFHloMlE
         EW9J0w+qkr+kr1SzlhSjonUtd7lBn9WwH9oGifr5zSKLyVFYLcjvWUGMZcKlPUCu/kSv
         OlAIsNSrRhkYGX3sJLZpiqMWDszpG8nxXFWM3Pz6dibxS8fHMWiF2WuPwNWeWlkjQRvk
         ilLuojU4AP392YDZcDcB9bsZex+WVNqYAq/27XemkNxg9ZOp5nHdt2Mn4c2ea76lHn1f
         7eRPwvB9kgcyzocu3UuHastzeE9adpuyzXsyL6wCmjm75B76nPx9uI+RXG+iWhcyexBU
         8mSQ==
X-Gm-Message-State: AOJu0YzWTx8TVR/Pp9eGJQhBBtk+uIIe+QeSU5vG0qF4QId31vGDpHL2
	T8nUo7L7//Zd0tI+GaUBZ6n3EMbsXZPmW7hFsEd6KmK3ifqHpJDlcot6YqVpIalhu83r7vz2LNP
	41xTaQ9PclEJMfqKyWbG2JYSDgyRi6vElaIjpoQ/EWM0LjTs+/QZpr/Mjt8KayOtfvosnP9v9Sa
	wI76V0x0qMosWY5uPnHNSHhv3rgMdQdxK87EgMyPfwX+WdZg==
X-Gm-Gg: ASbGncucOiYQAoyx+BK1Q4EvaMRuvqPpIlePRr29V90NaH4qA7JKoXUJs3GkGfzuZoS
	xyl7PUMSp8y+ZXWgV4EV/4aEbjrnTddiQ3SHAqMr62KJ8ANhxxv0LyNChQD1BsgEdZAqySVTjLv
	C1+nlLOgyGNJ4p2yOidQNIk19Lk1Rc54l2qvGdian4Fkrd5AbFrfw7g3THZZOHyovbzAe0IFwlo
	yswMzUOchfFAOwzIUAJcQ/xzFfky6pQyiZrxmUw8nag7DRsDDl8ttHqwZBcnYIvLE48+4e65dDw
	ooN6ercsdXMUKBMdCHd4
X-Received: by 2002:a05:6402:51d2:b0:5e4:92ca:34d0 with SMTP id 4fb4d7f45d1cf-5f0b3bce08cmr1901634a12.20.1743762569410;
        Fri, 04 Apr 2025 03:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8YM5bc59qwjlQ36hgK1HFf0sMPpa9wPrpfputnw4Z5kCzZUI7+et+MKVBd0PZ6GNYMaCHiQ==
X-Received: by 2002:a05:6402:51d2:b0:5e4:92ca:34d0 with SMTP id 4fb4d7f45d1cf-5f0b3bce08cmr1901617a12.20.1743762569036;
        Fri, 04 Apr 2025 03:29:29 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.230.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f088084f17sm2174115a12.61.2025.04.04.03.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:29:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 3/5] Documentation: kvm: fix some definition lists
Date: Fri,  4 Apr 2025 12:29:17 +0200
Message-ID: <20250404102919.171952-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404102919.171952-1-pbonzini@redhat.com>
References: <20250404102919.171952-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that they have a ":" in front of the defined item.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index efca6cc32dd5..e5e7fd42b47c 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7938,10 +7938,10 @@ by POWER10 processor.
 7.24 KVM_CAP_VM_COPY_ENC_CONTEXT_FROM
 -------------------------------------
 
-Architectures: x86 SEV enabled
-Type: vm
-Parameters: args[0] is the fd of the source vm
-Returns: 0 on success; ENOTTY on error
+:Architectures: x86 SEV enabled
+:Type: vm
+:Parameters: args[0] is the fd of the source vm
+:Returns: 0 on success; ENOTTY on error
 
 This capability enables userspace to copy encryption context from the vm
 indicated by the fd to the vm this is called on.
@@ -8662,7 +8662,7 @@ limit the attack surface on KVM's MSR emulation code.
 8.28 KVM_CAP_ENFORCE_PV_FEATURE_CPUID
 -------------------------------------
 
-Architectures: x86
+:Architectures: x86
 
 When enabled, KVM will disable paravirtual features provided to the
 guest according to the bits in the KVM_CPUID_FEATURES CPUID leaf
@@ -8896,7 +8896,7 @@ available to the guest on migration.
 8.33 KVM_CAP_HYPERV_ENFORCE_CPUID
 ---------------------------------
 
-Architectures: x86
+:Architectures: x86
 
 When enabled, KVM will disable emulated Hyper-V features provided to the
 guest according to the bits Hyper-V CPUID feature leaves. Otherwise, all
-- 
2.49.0

