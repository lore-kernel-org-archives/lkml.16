Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A131B3939
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504033; cv=none; b=cchJ1KYt0aYz/KU/YTrI+/WEoVeIfAdTTlDChKXxv5B1sIOeCVI7GmXtz2m6Pj6IAAdYj4sbBeVw3AYjly9PwRdQm4UdSnwGIrv0RSi9Cukr/kH62O034CCxWqU2QgMP6wrHcm1yfQ0wXGJu7yycH1xKUPmeIjs+7SfmShw5o9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504033; c=relaxed/simple;
	bh=wzaNO/FV98NvOhVwcurDeWV9o2lzkiDEMgzO9vOQkfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CpBk0g0oplUdurWgbEkY/mkONqs1c3MMl8bIGjfvOtNFaA1QmwyRArN8bWtzz9VlsgW8BHY1BIRY+9APjdSOiRg3/sqwgV2J+kLZ0oXVSYqtE+GXHsgvfEhk6qNIQiqkLtxnUEboZ2aMerhAM+cZ9bgRObSHdIeI7CxSHLwoupY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJZId15e; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJZId15e"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso840340f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504029; x=1746108829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Hk5UBQTvuxPsQW0619Tu3I4qsqkftwTtmBE5Ybb85g=;
        b=AJZId15e7pdgeqWr+FMAv4lLCiYL8lS9X4n246zeYuB5IaR/DGRrpcovPDeJif1ult
         pCCP+lQCy1PBuRRsue4enbNhuItViUP50zrTPxmT0nYVJuKw/mn8cCZ5OQlhg6eDHW9M
         a05wR8Ubv3dLoceKbyhzZ/riusaGcx+r9eKtqhXZP/YlnDIR6V5OqRyMhOR7PXfzMpu9
         bd39oniRh5fAZXnOSJ6Smcyyg/jnOY7Ep8YHqXr5Ac8Lg6Ki8jPdYS6b+DDfyDjPiHA+
         KmVtSGfJ5KzOQuk2U26Ugg9Q5sqD/HC/WlFq2brgPR9T1soyDON1tKSxraJ1r6NZZ3nr
         p44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504029; x=1746108829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Hk5UBQTvuxPsQW0619Tu3I4qsqkftwTtmBE5Ybb85g=;
        b=DaSRSYTj2VWKIR7S/KegRfvkW+YQeUO1YhtlEO83SJRLIfPjjRTs8+HPUi5oGwuU/L
         lBP3ubLpLYf321eEXa+oE67MEapdR9IybnsYyyYKiikaT4IcG1rN+hl3Ry8OUcCK7iQW
         Tf8l2DqaCs4EmfGd4IIwkiyQpiKN+XUwKU/XC/JJaizWqjzUe5fF34IfYqThMleK4471
         iJIUIaXiB0cmPuqYGYS/9UhOBTjEt40P1uhCL7Km/R7yHpU3alHUCYo/4VBJjisLZ8hg
         0nyS02/jgWq51O/pGJBqEPtKy+KhJgWmwDhlCL0/OkJ3YCABi5P1H+Nheb7t3iLenDs3
         DS7Q==
X-Gm-Message-State: AOJu0YyPFRBXyeNBYm3EwrJ+K0JtIIfDGvvtQrims9lSfpqeiJHO/A9H
	CfDcl9snSAYfA3Yf606pOGCaoTupokirct8qA7W/h/pPs8sr5Taq8jIyJ89nIVNH+WBplbTZ17W
	HSA0=
X-Gm-Gg: ASbGnctj5EClpKDHkAlRtHsoiWrdHBd9weYJ4gpAtbWb4HyTpRkjNUF62tNknmmIgOG
	FZCsWa4r+b7pTMBvTch/wXtN0sA0//o6918DFON/el1AjV6GdLLPtWzVvGASofZaRCsuc/SR0mf
	Mnr5PhPYYnr7x4GiHmhPBCoql/RZoOIpjOdwGgJOaivTkFbi8rK+uaJ5ULyAtht5Qeatetrc0S7
	l8OtjMa1S2AndEiEYdGUujYTkJ2RpUU0xY+xqrYasGcBW0yJxmRX+xcS6C0fuKFhReL3V0ekXG8
	sRFZZc/HB9WBclvB306O42lbAykDpLgRiF4/bCuQ1aB7gHgngIFJCArZqVQv7ksij7H3qfhY6XD
	wag2StZAOFF6y/gxX/uzus+5a5t4=
X-Google-Smtp-Source: AGHT+IEX65fw+AuwIbm8DfCqVPIwMLBPu7X4mEmOAObvmlxgMqJT5rSe8ZZGCXBt4CgJFkEQIJbeNw==
X-Received: by 2002:a05:6000:1a85:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-3a06cf61418mr2487543f8f.25.1745504029007;
        Thu, 24 Apr 2025 07:13:49 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:48 -0700 (PDT)
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
Subject: [RFC PATCH 03/34] KVM: irqfd: Allow KVM backends to override IRQ injection via set_irq callback
Date: Thu, 24 Apr 2025 15:13:10 +0100
Message-Id: <20250424141341.841734-4-karim.manaouil@linaro.org>
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

Some KVM backends, such as Gunyah, require custom mechanisms to inject
interrupts into the guest. For example, Gunyah performs IRQ injection
through a hypercall to the underlying hypervisor.

To support such use case, this patch introduces a new optional callback
field `set_irq` in `struct kvm_kernel_irqfd`. If this callback is set,
irqfd injection will use the provided function instead of calling
kvm_set_irq() directly.

The default behavior is unchanged for existing users that do not override
the `set_irq` field.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_irqfd.h | 1 +
 virt/kvm/eventfd.c        | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index e8d21d443c58..7d54bc12c4bf 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -46,6 +46,7 @@ struct kvm_kernel_irqfd {
 	/* Used for level IRQ fast-path */
 	int gsi;
 	struct work_struct inject;
+	int (*set_irq)(struct kvm_kernel_irqfd *);
 	/* The resampler used by this irqfd (resampler-only) */
 	struct kvm_kernel_irqfd_resampler *resampler;
 	/* Eventfd notified on resample (resampler-only) */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 5f3776a1b960..d6702225e7f2 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -63,6 +63,11 @@ irqfd_inject(struct work_struct *work)
 		container_of(work, struct kvm_kernel_irqfd, inject);
 	struct kvm *kvm = irqfd->kvm;
 
+	if (irqfd->set_irq) {
+		irqfd->set_irq(irqfd);
+		return;
+	}
+
 	if (!irqfd->resampler) {
 		kvm_set_irq(kvm, KVM_USERSPACE_IRQ_SOURCE_ID, irqfd->gsi, 1,
 				false);
-- 
2.39.5

