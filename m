Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97771221703
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523923; cv=none; b=OR3x+8vAc47FovmIVugug3XrFr+0VFvCEPV9eACoZ44PYAbgjZSRBcLbsL5uW25ySnyRVkx7IPMmJc/Hca3Ug6ezl/1sDef5rYkG8TKV1S8S2vbuMN4mY8Xo3rpDlkIiwxUB5diZiDwGN+HuarOB4gfE6B1H9NGB3jwlKMEYANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523923; c=relaxed/simple;
	bh=2CI/mkWBrTgnbik9OCHRAn1y+W1g2QV9UjWHcVB514o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XhcMEApsptTeJynU3Gu7NZApijbWziQNncwEeS85Qocv9P/22etPxqJPqYCDi8tMNP1XpB9CUnZ+q57Me0sVdujXyGrKjXbQ/3vpi8aUfp+wj9VY5s0e+kR7ib5ULdfoT3KxlaULnIzhO0qNd9a5kcsEfqzfd2xdVg60rWej9Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L5+R+PkQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L5+R+PkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jloFR1LDGvNeXK6NZWVsMX9b3AeMl8ttvkfYFFUhR2s=;
	b=L5+R+PkQBVIojOOAGNx8XWaJ/sB5vhxU4ca2PQ7fHXyfsr4D/BFHogDf5OkNp2DV0+QA9M
	DEoiNwBweEuvGZ4rd/BTMQEZMunrXaPk2yIFdHL4FaNoHBoXZvATCdWpscf1yRwjGaSFBd
	sPPLEcRzFGOA2Xvl/LevGIN6Lut6OXA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-HcHhYcCzPyOF83xDi8NCJw-1; Tue, 01 Apr 2025 12:11:59 -0400
X-MC-Unique: HcHhYcCzPyOF83xDi8NCJw-1
X-Mimecast-MFC-AGG-ID: HcHhYcCzPyOF83xDi8NCJw_1743523917
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so47371935e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523916; x=1744128716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jloFR1LDGvNeXK6NZWVsMX9b3AeMl8ttvkfYFFUhR2s=;
        b=dF8z8gnP0qXb86pp2ENL5Pw1U2h09yrd6pf8ID72Jq/nXxneoqKXQdtMu8eaZsim+P
         axGxVq6JpjpFUzpBkkQdQl+gczy2cHtBDCq8zcGaleP9IHfGgPGeEubbbK+lfUXNfJfT
         oAMYkrZg+UcJijtNCCSmk4Lx24t01OHai72Kzn5/zyV/0zGSAt5RitCz3t7MHitO5Wl0
         qlEImjc6cMokFLv77o7YJy8rb1oHNoEe1niU+4GszNvqFAgm4sVpIE0oh7DTsrSTZHtl
         lNSKlAb0FxitHaWKR2gbLaVxUYTtkHv77mUnsMJKYWPjXLe/2pwxksdxiIIUBFHR6xrj
         5aNA==
X-Gm-Message-State: AOJu0Yw8f2nj3icGhIqpypx/CaPvrJKHCHPzP4Av9POAAeVYw3t4ldTI
	YcCPyWvXQIksMSaR+XpJav+j+b4XdViSrfaI5jqamOHjj46QGW44ZEbGOZjsg7X11O1zMJ6G9U8
	flC9I7Mp9xqbFL7Ut8UXRm+jJVZef6bcy8NcYLDeXyiweY5sY1x4yfN2zf2r9JMHKQ4mhCjiWRa
	jR/m+afSATJNQ9FxzkkUIrWkh8iDhTwtEo95SVceEK889tug==
X-Gm-Gg: ASbGnct+4TsJm4MrYY801nc2QMnkUqSx3gVlcolhF808UpxW86FT78mBmZY3cnBquMB
	kYJAJA1f+yOKzYc0rTnAOfJHU5v5j4/SssQdcEGhHqQSAmQ2BRO06/s8mRgHhIPy+M4ZkoVkdjR
	TpoSrhGJ3FBgHGc9tlUN1MANRp/1nVLj2UpqdD4HlGmnA/igRsRHoCUmCUcFh4kc2BPrapuWah5
	IVOy2CXrZKkSIqrfQJIC96fF8lvY48VhrZPusGnMeQJzhqJ7wnuOb7L9DrMJSbIiQi8oVQDTSJp
	eoUHxcsoY0lYwi9mkfV3YA==
X-Received: by 2002:a05:600c:3b9d:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43db6227a09mr118810675e9.9.1743523916436;
        Tue, 01 Apr 2025 09:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeSHmn91hmeZ7x284dZn+qQrcC5V3D8Ul3VDkKtIvDkX2ROgQp+v6dSPuSJJ1Vzfw+gbjPKg==
X-Received: by 2002:a05:600c:3b9d:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43db6227a09mr118810055e9.9.1743523915943;
        Tue, 01 Apr 2025 09:11:55 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe9d1sm203529975e9.24.2025.04.01.09.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:53 -0700 (PDT)
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
Subject: [PATCH 17/29] KVM: x86: block creating irqchip if planes are active
Date: Tue,  1 Apr 2025 18:10:54 +0200
Message-ID: <20250401161106.790710-18-pbonzini@redhat.com>
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

Force creating the irqchip before planes, so that APICV_INHIBIT_REASON_ABSENT
only needs to be removed from plane 0.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Documentation/virt/kvm/api.rst | 6 ++++--
 arch/x86/kvm/x86.c             | 4 ++--
 include/linux/kvm_host.h       | 1 +
 virt/kvm/kvm_main.c            | 1 +
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e1c67bc6df47..16d836b954dc 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -882,6 +882,8 @@ On s390, a dummy irq routing table is created.
 Note that on s390 the KVM_CAP_S390_IRQCHIP vm capability needs to be enabled
 before KVM_CREATE_IRQCHIP can be used.
 
+The interrupt controller must be created before any extra VM planes.
+
 
 4.25 KVM_IRQ_LINE
 -----------------
@@ -7792,8 +7794,8 @@ used in the IRQ routing table.  The first args[0] MSI routes are reserved
 for the IOAPIC pins.  Whenever the LAPIC receives an EOI for these routes,
 a KVM_EXIT_IOAPIC_EOI vmexit will be reported to userspace.
 
-Fails if VCPU has already been created, or if the irqchip is already in the
-kernel (i.e. KVM_CREATE_IRQCHIP has already been called).
+Fails if VCPUs or planes have already been created, or if the irqchip is
+already in the kernel (i.e. KVM_CREATE_IRQCHIP has already been called).
 
 7.6 KVM_CAP_S390_RI
 -------------------
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index f70d9a572455..653886e6e1c8 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6561,7 +6561,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		r = -EEXIST;
 		if (irqchip_in_kernel(kvm))
 			goto split_irqchip_unlock;
-		if (kvm->created_vcpus)
+		if (kvm->created_vcpus || kvm->has_planes)
 			goto split_irqchip_unlock;
 		/* Pairs with irqchip_in_kernel. */
 		smp_wmb();
@@ -7087,7 +7087,7 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 			goto create_irqchip_unlock;
 
 		r = -EINVAL;
-		if (kvm->created_vcpus)
+		if (kvm->created_vcpus || kvm->has_planes)
 			goto create_irqchip_unlock;
 
 		r = kvm_pic_init(kvm);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 16a8b3adb76d..152dc5845309 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -883,6 +883,7 @@ struct kvm {
 	bool dirty_ring_with_bitmap;
 	bool vm_bugged;
 	bool vm_dead;
+	bool has_planes;
 
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 	struct notifier_block pm_notifier;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cb04fe6f8a2c..db38894f6fa3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5316,6 +5316,7 @@ static int kvm_vm_ioctl_create_plane(struct kvm *kvm, unsigned id)
 		return fd;
 
 	plane = kvm_create_vm_plane(kvm, id);
+	kvm->has_planes = true;
 	if (IS_ERR(plane)) {
 		r = PTR_ERR(plane);
 		goto put_fd;
-- 
2.49.0

