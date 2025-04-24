Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA3619EED2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504032; cv=none; b=r6hB37DQMneD21sKl0MvkMW8/J7ZV/s4YlIVSoapn4rEKEFHa4Y+7BS4qigTKK+oicOv6RYhrA7F/B/D6LwIShZoLizPpSsjA6M8a/YJEYr9fLMJE9Ly01vZGH+n5rJld/p/zxh4c/PYeCaD7dGdhp/svRje7ZyoIPOaWUgDetI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504032; c=relaxed/simple;
	bh=CvFb1okbnEK9wiiZwwdcGSqHE02tQmbzZOFs1CBcYGk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MY+vNNK1PkEEUrjoi+2kXQ6tjcSgqo6kRYq32kA/4QmDQmqZpduzRtF7DxcrWBQCcFOzk7MUas4r8zifKxlyUJd5uLjZ6/UV5qhthZhKBZRFCPQyuZQD+1TJ5vpkZS54EDrASo4h3BMT8udTrjdu5+TrgXl5lEM6F5DraMC6jfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iLOwI++f; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iLOwI++f"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1551221f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504028; x=1746108828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvXrACbOQaGlhym8epnVf2FRavXrOILN2RCY7mrPgRw=;
        b=iLOwI++fMXomw84Au6sHZmvf4XEzvfBtSvOEbGXBg1IqUMdLW0+v/JK3OSvPQBiK07
         G7DAOlkh3Dn7nSPFwYfcmRBHN4JhU6Z7fOWSzh4GJgLLSKO1hmkm6NG5WZH0AfoEC9Bo
         NaVFDFNV39iAFQcXUNIXRLyqVzXYxsfBRnVLgKEH3URDsPi8jYpP5eiVPiklRMRJO+fD
         KUIEEE9ixPIFXkDrY/7Qt3c6/QbTS76DZoKYstIM7n24LZL98RND02LEMC+RNX+PpEON
         PTHZTJSA7cSemMaHjeV4uQBh4Xu/4+vnuIYtqe3zD61Dyl0L28stdByuBTQVTBs9JVfw
         TXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504028; x=1746108828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvXrACbOQaGlhym8epnVf2FRavXrOILN2RCY7mrPgRw=;
        b=R8/a5c937dnrXOnSxEI+auQAeB/rf/t9uEqRTg7yKkFhVSfg6JmaH0Wn9xTaIlerpy
         XWfNeVA4zjxQxF3WgtzzNAJRjyLinzFV86WwhUZSQQEQYoCREAaDweVJ5ymEUjmn41si
         KJDBNDLkfyxkZIc71oC6rEozayzxwNjau9c7ShtfkYoT7OM+ajexWg4/ABtTuI2rMjjk
         z3AL6SEgB0eto6c0ycKjlrJa76wcuWRDoLvJNsKT+bIvShGIAmhMSGn+hlV8s2A7tXqQ
         u8GG/VSa0KmOQG/UeCDk15ZtN1nFC1y/7/4hFWjP11Ws6IsIF9dNvDVEy7GV6ItO1cK+
         ZdXA==
X-Gm-Message-State: AOJu0YwHn44QLMjPNorUrx/z/BMzpNitTQ1jFX1LFwz8aBdhahoUlRxd
	3tbuMDRIPzY/0dcgKtRWRBRi4zgpSYIuOAtTZXwvAxW1sn2qmVVmlRrQufwx6zb+YtFu3GF/45m
	cDlM=
X-Gm-Gg: ASbGncsyxrZvCH2cGE2vw/Odfle1Ux+kYUByM9oUXCGxPGr1gAwLPtkiNP3rGXGKvpY
	csB3KoFql5NNhUXd4SX2GGh7PPuf10rU9d/MUlp8bNVERozKaUyIaT/qM1fv5JPKdZG66tR9D1/
	d6eswyxNyecNhY4hOwlLibNociTTv904Zv7XtJMsXwLuf+VEOQfUqRfJ/BDY2WISKUjGc1ohkFO
	Vu1UmSZqhtZMd8ptow5zyPVb/1H64/XmQVTjAwNRjC29ntwgRmiY0Ad4jr9CwtZNwus3qU2iuP7
	aAPXGDM/2DrlRKZITzYJVQ0kYj3AzfkzWeAVslxrT/emwwWt8YeCEF7HXfIrXPxPgFqOD3uYPGD
	ww58O5xIh41uQiq0Nrvm43TfADu8=
X-Google-Smtp-Source: AGHT+IEBkZ1IBJCII/ywyTdMC0fLKprAp65skAqA7s+zC8i8AN1EGINZeECW9VcRyNwMhKCFTJTxcg==
X-Received: by 2002:adf:fb4c:0:b0:391:1218:d5f4 with SMTP id ffacd0b85a97d-3a06d698d62mr2225510f8f.23.1745504027803;
        Thu, 24 Apr 2025 07:13:47 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:47 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 02/34] KVM: irqfd: Add architecture hooks for irqfd allocation and initialization
Date: Thu, 24 Apr 2025 15:13:09 +0100
Message-Id: <20250424141341.841734-3-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some KVM backends, such as Gunyah, require irqfd structures to carry
platform-specific state or setup logic. To support these use cases,
introduce three weakly-defined functions:

  - kvm_arch_irqfd_alloc()
  - kvm_arch_irqfd_free()
  - kvm_arch_irqfd_init()

These allow KVM backends to override irqfd allocation, teardown,
and initialization logic. The default implementations simply
allocate/finalize a standard `struct kvm_kernel_irqfd`, maintaining
existing behaviour.

This change is required by the Gunyah backend, which uses these hooks
to associate irqfd objects with Gunyah-specific bell resource handles
for IRQ injection via hypercalls.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_irqfd.h |  4 ++++
 virt/kvm/eventfd.c        | 31 ++++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index 8ad43692e3bb..e8d21d443c58 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -61,4 +61,8 @@ struct kvm_kernel_irqfd {
 	struct irq_bypass_producer *producer;
 };
 
+struct kvm_kernel_irqfd *kvm_arch_irqfd_alloc(void);
+void kvm_arch_irqfd_free(struct kvm_kernel_irqfd *irqfd);
+int kvm_arch_irqfd_init(struct kvm_kernel_irqfd *irqfd);
+
 #endif /* __LINUX_KVM_IRQFD_H */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 11e5d1e3f12e..5f3776a1b960 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -32,6 +32,24 @@
 
 static struct workqueue_struct *irqfd_cleanup_wq;
 
+struct kvm_kernel_irqfd __attribute__((weak))
+*kvm_arch_irqfd_alloc(void)
+{
+	return kzalloc(sizeof(struct kvm_kernel_irqfd), GFP_KERNEL_ACCOUNT);
+}
+
+void __attribute__((weak))
+kvm_arch_irqfd_free(struct kvm_kernel_irqfd *irqfd)
+{
+	kfree(irqfd);
+}
+
+int __attribute__((weak))
+kvm_arch_irqfd_init(struct kvm_kernel_irqfd *irqfd)
+{
+	return 0;
+}
+
 bool __attribute__((weak))
 kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args)
 {
@@ -153,7 +171,7 @@ irqfd_shutdown(struct work_struct *work)
 	irq_bypass_unregister_consumer(&irqfd->consumer);
 #endif
 	eventfd_ctx_put(irqfd->eventfd);
-	kfree(irqfd);
+	kvm_arch_irqfd_free(irqfd);
 }
 
 
@@ -315,7 +333,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	if (!kvm_arch_irqfd_allowed(kvm, args))
 		return -EINVAL;
 
-	irqfd = kzalloc(sizeof(*irqfd), GFP_KERNEL_ACCOUNT);
+	irqfd = kvm_arch_irqfd_alloc();
 	if (!irqfd)
 		return -ENOMEM;
 
@@ -396,6 +414,13 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 	init_waitqueue_func_entry(&irqfd->wait, irqfd_wakeup);
 	init_poll_funcptr(&irqfd->pt, irqfd_ptable_queue_proc);
 
+	/*
+	 * Give a chance to archiectures to finish initilization.
+	 * E.g. Gunyah needs to register a resource ticket for this irq.
+	 */
+	if (kvm_arch_irqfd_init(irqfd))
+		goto fail;
+
 	spin_lock_irq(&kvm->irqfds.lock);
 
 	ret = 0;
@@ -452,7 +477,7 @@ kvm_irqfd_assign(struct kvm *kvm, struct kvm_irqfd *args)
 		eventfd_ctx_put(eventfd);
 
 out:
-	kfree(irqfd);
+	kvm_arch_irqfd_free(irqfd);
 	return ret;
 }
 
-- 
2.39.5

