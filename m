Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F472920B9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250529; cv=none; b=qRrrWr3mroKmOsXJMOAMBC7svhl/znpTAHDPO2oqtNV/elI4nNByq+9NVAaxwHlw3ENW2zg8gB3gs9VLw6fF6cNM7GVbTHqejQES0yDdYwiI5DPBqsn5hPsAFuQK0t4h4Eg1zVpXivfVR1ytZKI0NBdaglpwWtq8uLj6qW7/tpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250529; c=relaxed/simple;
	bh=jlT7oUjvJOznjnqnhNqTKsiR/OzaJm9QtnlVMZATBTo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KJTbLDAm04JUEPlwWeAj2yqHTU5Nb+FQDZyxEmPEoDQuXR/YsqGltjNR7MBcsp1ZVgAza7Y0oJOLKf3O6b1D9qg9rxXlHiyBWPT7ghaQAEGgAPvVTBZyMuTnQtOIuoxtOU24lDL3OA2480Offe4j/qwEij32tVoujySqRODB+NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OxXOlIQi; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rananta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OxXOlIQi"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-85b3a6c37e2so16805639f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747250527; x=1747855327; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1yNW4zWWpO6G9+zdCVIjhXgj8P623/AU8qHzqkHrm1A=;
        b=OxXOlIQigSM1ytETM0fe5z7nZL7SFX/c/E9UboQ5krTdx0cs81/7nb2+ol9ymt6Erx
         PMlKr0HJlf8azTAbgF6O2M1d/GaLWcU+h/vJmZDELl1yLTd76BprWy6xFDj4/7bpoYlK
         VNkkrty4zUc+wPe2PGEHU6vwY79LLW5SPiMWh7FWZ43DyIw8W4KSBU3rgycVych9q/0m
         +dhmiHuWKDnRGag7bxjSWDfW159+KTfNgUVmk9ea0bi+1ntF+kXE42SiSVq0PI2vPFrA
         TMjpQBMIvguku9hGWaMW1bs87OT6ZQfNzbD41naRVyTZ688bSzCWE/7sdouL8llRH7a+
         NuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250527; x=1747855327;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1yNW4zWWpO6G9+zdCVIjhXgj8P623/AU8qHzqkHrm1A=;
        b=iYZRnw/G9pjqtacrwf0Tu6xJ6My2TIfAFz09fIJu7Y4YCSfAMu1B8UyqVshzWz37i4
         K5qjYa3IIaN69u+XNdUFhRtEJZPS6OrnBajbHzdAVO1CDT+y16mt3jIUnpJKe9tWu3AD
         hfdf1/VJB3rSBLjl6kGZ2hgW25Rwe4d0/4VXNCqu6bV85OzichhHBnqlCrRXkHeyht5S
         xIBGLLT6fU34zbKeoLdAfHXPeVXtFyYRJOByGfCdRh1axzDvMDO9awYFXAtyRiniU5SI
         emVa0GJJoXD2RBsOmnaDdRjTxfKEiX6uwfbeZ1uV5PPz1kPCMvUH0pD8nJjInMfv+bYH
         +ajA==
X-Forwarded-Encrypted: i=1; AJvYcCUBpCrFr2qu/9m0yJqSu+fk8nnpbbmqC7KcY9bn5x93JPl6PeLGknl5uZvDumNWZoSnYXlLgMuJ8Ke+yPg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygi9s2QJCUlGhzGDWQm7gOvc9G3wMijX9tPrbnFQuhrtNz0lpM
	qq2FD2eL4HM1u5mIR2FOJy7N5lHAlftPLk1uwciBa5sVYIkaL6vZjq/U00uWvOdau8fh2/0fZ1m
	fFla6nQ==
X-Google-Smtp-Source: AGHT+IFKQuF2BacC5AkCgJDM9pP+9hGGYSCBt0jtM4p1OPWuCYZziCJSB8eP4NMiOU8nR7NLUAah4kaGb+Oi
X-Received: from ilbbs4.prod.google.com ([2002:a05:6e02:2404:b0:3db:6e7d:fedf])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:3997:b0:864:4b3a:9e3a
 with SMTP id ca18e2360f4ac-86a08e6ef17mr571479539f.13.1747250527190; Wed, 14
 May 2025 12:22:07 -0700 (PDT)
Date: Wed, 14 May 2025 19:21:58 +0000
In-Reply-To: <20250514192159.1751538-1-rananta@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514192159.1751538-1-rananta@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514192159.1751538-3-rananta@google.com>
Subject: [PATCH 2/3] docs: kvm: devices/arm-vgic-v3: Document
 KVM_DEV_ARM_VGIC_CONFIG_GICV4 attr
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Document the KVM_DEV_ARM_VGIC_CONFIG_GICV4 attr under
KVM_DEV_ARM_VGIC_GRP_CTRL, that includes the values supported to set/get
and the expected error returns.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 .../virt/kvm/devices/arm-vgic-v3.rst          | 24 +++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v3.rst b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
index e860498b1e35..2eed2ac13542 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v3.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
@@ -240,17 +240,33 @@ Groups:
       save all LPI pending bits into guest RAM pending tables.
 
       The first kB of the pending table is not altered by this operation.
+    KVM_DEV_ARM_VGIC_CONFIG_GICV4
+      attribute to enable/disable vGICv4 for a VM. It supports three values:
+      KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE: Kernel is not booted with
+      'kvm-arm.vgic_v4_enable=1' cmdline, and hence vGICv4 is unavailable to
+      the VM. The value can only be read by the userspace, but cannot be set.
+      KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE: Kernel is booted with
+      'kvm-arm.vgic_v4_enable=1' cmdline, and vGICv4 is available and enabled
+      for the VM (default config). Userspace can get and set this value.
+      KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE: Kernel is booted with
+      'kvm-arm.vgic_v4_enable=1' cmdline, and vGICv4 is available and disabled
+      for the VM. Userspace can get and set this value.
+
 
   Errors:
 
-    =======  ========================================================
+    =======  ==================================================================
     -ENXIO   VGIC not properly configured as required prior to calling
-             this attribute
+             this attribute or trying to enable/disable vGICv4 for the VM
+             on a vGICv3 configuration in the case of
+             KVM_DEV_ARM_VGIC_CONFIG_GICV4
+    -EINVAL  Invalid configuration supplied by userspace
     -ENODEV  no online VCPU
     -ENOMEM  memory shortage when allocating vgic internal data
     -EFAULT  Invalid guest ram access
-    -EBUSY   One or more VCPUS are running
-    =======  ========================================================
+    -EBUSY   One or more VCPUS are running or vGIC has already been initialized
+             in the case of KVM_DEV_ARM_VGIC_CONFIG_GICV4
+    =======  ==================================================================
 
 
   KVM_DEV_ARM_VGIC_GRP_LEVEL_INFO
-- 
2.49.0.1101.gccaa498523-goog

