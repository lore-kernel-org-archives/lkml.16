Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57168221D85
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 19:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743795657; cv=none; b=G3klNK8supLBfGIoC8spybigHG03wFDiLS3Y0037Q+2Ig6XBStnvcGaCWTANBFhicD67p35VvI3JKrzQPlOUSywL590EuWfGvOc/6xwcsf3wCiQRkuc9j6VmNPIxT07bFEpM3CpxHUNMfRw9R3ge5aNKFVmQmzo9g+otmZR3Zbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743795657; c=relaxed/simple;
	bh=rAx4qAmD55M9tfIGXl5YoCVA83RQWFiazrLX3izC4S0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wtw/InzoAT0wZDmeS7S0GdOPXnqEKYynbWMMp6VC1aFoOif3QHcvL0HpU+OS3Y4k23sD3brzrERBcrQMTUnThoLG/ogYtkjJokHHUJMfEbEqg9phWlSmoZHR4a9Ch1T/1b5ATpOr3vscML1Zehr5fDbYw0wvFWqiFxIBvucSuVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d39jnbMn; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d39jnbMn"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af98c8021b5so2468765a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 12:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743795655; x=1744400455; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bZC+Ik33WL0W2RRbulovk+dibdQdMDMKKv8TRtkvhyw=;
        b=d39jnbMnmHb2v/Qoz4d4/kycFUFsD2IYWQW6J/HgRN2IpucxpZH5ptv1UMmxKqv825
         nggjK6zAGDNBzuS5wbE9gp2fC/X/NvTvV9dcroek82ZXsTOymkCdhqwPmVHO5b5XQqIK
         tOe3VYlpZs8hdycNJso6FwnFY2dTh9Eeif3GhdiiL9oTx1KsPTNR/JyJuUxujcQFzb1C
         E8kiTVm2JwnixZsU1vDSVGQRlpkmONz5Db6EP4Xy/fnlAcKO+hjE/+5SmVmQs9+2Ojbb
         clJ2H0YZhigDWwJa9lcOxfe705u++sPOxS1qXJIANZvm+Z7FbA1N0vqLEZCq0jmnoxSo
         ncVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743795655; x=1744400455;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZC+Ik33WL0W2RRbulovk+dibdQdMDMKKv8TRtkvhyw=;
        b=Kmmc8rIfq/Sy9ip6tPzJMfk2Uhm5UPU8RvYr11MSCWKhHL1E4gqOvwYzMb8iFeYJ7F
         0p66dqczIvJtCzpj+eLHaRj1MjHVBdK/BlEGss+5ifh/V5Vsk33acaNtw0bdJkJFkBM6
         qIUPz9foLhcF4uK1EugXBF/Yjb2VDxBb18jVaRMHvAJ6Hu7W2v1nlP3CJbIbkNCwZuXF
         qjZ2+fSXTlM8vIJA2MWWxyp6arGylbhTk/GtzQ8UfnZJZe/gLVbvzhSRKB4nxYBe4PAg
         26GaB9FlY3jUcJgLx6BRQCcYiWGOnmkqo/s6w/FmXaqPrVSI3bdXN+OdCgVFgCOsDyDb
         vGAw==
X-Forwarded-Encrypted: i=1; AJvYcCVfYj/hQN/hP7TozNapNHXSPN4pHoRikKjVZ4sJ2Eq/b1URfU7XHMjqam8DwX6QTuwTHia2x6ZLaAECofE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz76bw/Kom8lqlgSnGsyy6pjDhzM+nmQ0my2Eirm0lfdbb3HGta
	dCyfSntUzzvROZ2zow9LfuENxbzeEboiYGDdZ4R/dzlS3q11vq4jfbcIHbMENFJS1Yb6N3E8Izj
	VcA==
X-Google-Smtp-Source: AGHT+IFQWL9LigLNP0a/K8uREP9gQEOYzG81Hr4sts6sxEYIr+yeo+mdbybE7LvF1mbotb2pbsREFg7UZT0=
X-Received: from pgc1.prod.google.com ([2002:a05:6a02:2f81:b0:af9:553c:ea73])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c78e:b0:1f5:7007:9ea5
 with SMTP id adf61e73a8af0-20113c0964bmr1123119637.2.1743795655565; Fri, 04
 Apr 2025 12:40:55 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri,  4 Apr 2025 12:38:55 -0700
In-Reply-To: <20250404193923.1413163-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250404193923.1413163-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404193923.1413163-41-seanjc@google.com>
Subject: [PATCH 40/67] KVM: x86: Skip IOMMU IRTE updates if there's no old or
 new vCPU being targeted
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Don't "reconfigure" an IRTE into host controlled mode when it's already in
the state, i.e. if KVM's GSI routing changes but the IRQ wasn't and still
isn't being posted to a vCPU.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0d9bd8535f61..8325a908fa25 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13602,6 +13602,9 @@ static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
 			vcpu = NULL;
 	}
 
+	if (!irqfd->irq_bypass_vcpu && !vcpu)
+		return 0;
+
 	r = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, host_irq, irqfd->gsi,
 					 new, vcpu, irq.vector);
 	if (r) {
-- 
2.49.0.504.g3bcea36a83-goog

