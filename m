Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C64F1CDFD5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 10:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762573; cv=none; b=bEzkQv9TdaYjSUwwJjGFVKefA9M4WtTpTtpZqHf2/qZaDZFaPQOvtztqRwbO87eqbZDBTl99QNr0BCRm4vujhXp86V1SWeIj7jowg7xACvdaDJJc6/nHZbjTq/FRFIGIru+AA0ZGDu85x8ra0TQVNU25jYB8h8GwUCdUUyvPB44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762573; c=relaxed/simple;
	bh=pIzQK1XQVUOehm2a0IDXKr9Yx+FlZ4I6aBSO5ZnRFr4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tmAG5OR1PwceJ/Odx+9FJYZ93EJLBja/2mh5gMPMSXuyPNdYuf2800aEfyDeTUOOxhZKI0TqJrIQ4ekh75Y8gtOFjlMTnIqRo0qRar3vwYHXRizzvWkf0aQPApThXkH8cXSBNsDHAHtJxDriovMZ0YfVRUnPZcC6lsDW3Fpjoaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M9uWLOe7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M9uWLOe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743762570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mhILDOeGcZxr2T6k437hnDwGzh6WW1hiZTYtqJGkNJ8=;
	b=M9uWLOe7e7VBbtOnUD0p2LgkyMuy57sV308mhb2h4irgiunNyZo2c7mQjXI6FbImh8fx0X
	c6zYnW6aorItavWRjK1GFOMTb0BbIeJTnXyRXpX1EcvX2Lw0QTpc9pof1MTb50nP7k7i3X
	CJlfELgXgcRVUvaLycr2e8phR98XPyY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-Q3rCyVHsN7KUCmAHM2zwpA-1; Fri, 04 Apr 2025 06:29:29 -0400
X-MC-Unique: Q3rCyVHsN7KUCmAHM2zwpA-1
X-Mimecast-MFC-AGG-ID: Q3rCyVHsN7KUCmAHM2zwpA_1743762568
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5e5d9682f53so1828996a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 03:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762567; x=1744367367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhILDOeGcZxr2T6k437hnDwGzh6WW1hiZTYtqJGkNJ8=;
        b=JA0tq887EIhpH4P4jlPHoTNVDjrg1Q3NK1yFeDxVyWI55JbcbVK9dFf/e4CHJDnlFk
         Yr7NSye3HvG89y0Fpq+WePC/FA1gXn3bvXYdkQT8Jf7FKkRuHWSH6mTOJ5QGbomkEaua
         rffJhePXjBUdFAqyVM+wBn2QEIXtAU7Yxmu9iiVLjbnRKqDQrSG6yK57abuOp6Np4pVG
         poDLMGKkSJZWpIayUDuJP1nQ2W2jGFgNRiVeLloU0uPQxVnojSr42qQHYdtPWGemp1Mr
         mzWwfvedzg7O4oLarrocFEEIb6TZIwy8qOBr1dvhDYN1wBSS3rIS7P/p2YvpFSDhkI2S
         e/0Q==
X-Gm-Message-State: AOJu0YzLUqyHjminvftEpM53EBAlWFxJyqsG8lTi2SUnOsnzqxkh4QLu
	E5K7abvJwWhsmcQj+34Be9HIFNGtaIUChipRvJDEmm/et3xfeFDjrlsl+jIr2I7uruc3Knp6EzF
	+h0ol6bN+gDHP5hXwrhPmy+RZ+iOzOrqUSzjqIWDmbZv+lxAVrXw+ibcEUC1H+RKIXz+FnfT0Zg
	xErOdk/k7RVShxNGTWrSjd6RjyWmJnn53TV5wI5ixg//tA3Q==
X-Gm-Gg: ASbGncsUrY76jKroo+1W83g3sF4e7VkgbIw6S1lmdLpkoxlzTgmOHi1j+4WqMUF6A7d
	HVmDmDEXN2D7jUsbA05gDAU/5d5o6zaZvaCVdPhNmGzIVu7Jiyh6jH/qcxThBCAgqPAJoDYdP2f
	adLBQjdJh3OgaBiOs0PgXPiD1WFdYpwgZPwtCoBvhAmBC5cFuEZCO4JOSrTFwWz3ZBHSNweM4Fi
	WRTbO5kC9qj3n5CBPHKurSVys+uWkYxPlwvCLrtLrUI7rXaEScfywS4JTqVCL1PrOwgYnKZuIAf
	hKdU3Dh/gDyma6W5wVA5
X-Received: by 2002:a05:6402:3593:b0:5e4:c532:d69d with SMTP id 4fb4d7f45d1cf-5f0b309b682mr2148145a12.0.1743762567418;
        Fri, 04 Apr 2025 03:29:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmoV1MYcdwLtpfSGoF+5ukGiKvJOsY+H/bN0znAVOJPtTTDi9a2JwSVODl/Bxo9X77PYGQTQ==
X-Received: by 2002:a05:6402:3593:b0:5e4:c532:d69d with SMTP id 4fb4d7f45d1cf-5f0b309b682mr2148129a12.0.1743762566946;
        Fri, 04 Apr 2025 03:29:26 -0700 (PDT)
Received: from [192.168.122.1] ([151.49.230.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed1c68sm2047151a12.17.2025.04.04.03.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 03:29:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 2/5] Documentation: kvm: drop "Capability" heading from capabilities
Date: Fri,  4 Apr 2025 12:29:16 +0200
Message-ID: <20250404102919.171952-3-pbonzini@redhat.com>
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

It is redundant, and sometimes wrong.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 49a604154564..efca6cc32dd5 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -7977,7 +7977,6 @@ See Documentation/arch/x86/sgx.rst for more details.
 7.26 KVM_CAP_PPC_RPT_INVALIDATE
 -------------------------------
 
-:Capability: KVM_CAP_PPC_RPT_INVALIDATE
 :Architectures: ppc
 :Type: vm
 
@@ -8052,7 +8051,6 @@ upgrading the VMM process without interrupting the guest.
 7.30 KVM_CAP_PPC_AIL_MODE_3
 -------------------------------
 
-:Capability: KVM_CAP_PPC_AIL_MODE_3
 :Architectures: ppc
 :Type: vm
 
@@ -8066,7 +8064,6 @@ handling interrupts and system calls.
 7.31 KVM_CAP_DISABLE_QUIRKS2
 ----------------------------
 
-:Capability: KVM_CAP_DISABLE_QUIRKS2
 :Parameters: args[0] - set of KVM quirks to disable
 :Architectures: x86
 :Type: vm
@@ -8910,7 +8907,6 @@ leaf.
 8.34 KVM_CAP_EXIT_HYPERCALL
 ---------------------------
 
-:Capability: KVM_CAP_EXIT_HYPERCALL
 :Architectures: x86
 :Type: vm
 
@@ -8929,7 +8925,6 @@ ENOSYS for the others.
 8.35 KVM_CAP_PMU_CAPABILITY
 ---------------------------
 
-:Capability: KVM_CAP_PMU_CAPABILITY
 :Architectures: x86
 :Type: vm
 :Parameters: arg[0] is bitmask of PMU virtualization capabilities.
@@ -8951,7 +8946,6 @@ should adjust CPUID leaf 0xA to reflect that the PMU is disabled.
 8.36 KVM_CAP_ARM_SYSTEM_SUSPEND
 -------------------------------
 
-:Capability: KVM_CAP_ARM_SYSTEM_SUSPEND
 :Architectures: arm64
 :Type: vm
 
@@ -8961,7 +8955,6 @@ type KVM_SYSTEM_EVENT_SUSPEND to process the guest suspend request.
 8.37 KVM_CAP_S390_PROTECTED_DUMP
 --------------------------------
 
-:Capability: KVM_CAP_S390_PROTECTED_DUMP
 :Architectures: s390
 :Type: vm
 
@@ -8974,7 +8967,6 @@ available and supports the `KVM_PV_DUMP_CPU` subcommand.
 8.38 KVM_CAP_VM_DISABLE_NX_HUGE_PAGES
 -------------------------------------
 
-:Capability: KVM_CAP_VM_DISABLE_NX_HUGE_PAGES
 :Architectures: x86
 :Type: vm
 :Parameters: arg[0] must be 0.
@@ -8991,7 +8983,6 @@ This capability may only be set before any vCPUs are created.
 8.39 KVM_CAP_S390_CPU_TOPOLOGY
 ------------------------------
 
-:Capability: KVM_CAP_S390_CPU_TOPOLOGY
 :Architectures: s390
 :Type: vm
 
@@ -9016,7 +9007,6 @@ must point to a byte where the value will be stored or retrieved from.
 8.40 KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE
 ---------------------------------------
 
-:Capability: KVM_CAP_ARM_EAGER_SPLIT_CHUNK_SIZE
 :Architectures: arm64
 :Type: vm
 :Parameters: arg[0] is the new split chunk size.
@@ -9043,7 +9033,6 @@ block sizes is exposed in KVM_CAP_ARM_SUPPORTED_BLOCK_SIZES as a
 8.41 KVM_CAP_VM_TYPES
 ---------------------
 
-:Capability: KVM_CAP_MEMORY_ATTRIBUTES
 :Architectures: x86
 :Type: system ioctl
 
-- 
2.49.0

