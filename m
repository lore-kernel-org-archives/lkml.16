Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1AA21931B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523903; cv=none; b=kSJM9Q2CeDPyPIaDWUpI1bEUHgmywrDksdQXKCKFgaKuAeH4zm/9ZZ7lpCsDsCyXwr6Fo/sE8m5+g3gpPQTdAN1iOHlhyq22bG5GSuja66yEn1gBCfVrTpYI/55BfG/8BADH+EuUJ2BemOZFMNbcmO16DaATI0tDJbPr4rWCBnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523903; c=relaxed/simple;
	bh=RE4EXCpfxhno9yiUXTtOFR2cTLxZp7UNPnnGbcmpDXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6JE6FOvoXg+YzHQX/ROZIPIfskJqf8nCGbfHqDE51wK6MuugxZZ57NE0iYemipWFtAOjKwTv4NzDHnLKtKikFKYh5IVf8NSiZfUIb3nxPmpWa0MxngvVnBofYK9KjEwQ/5wo1HsHjNpfoYdbYbCQgKTadw1K1uHefakEfycOc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L09+prFm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L09+prFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yjR3mqM2w8v8J+UuArqg6Kc21meadYNT6Oek6yPNa0w=;
	b=L09+prFm1/04hc/+LM3Mne8810t+B/ri5hwsO7QGSX22NL300PzutUWQCZyv253UQzrmZM
	SF3yMhpHRTWPZDhUXhntGkxG4YgpDzZfGSnj9A+7DkognaDaKD4bmav2pmlVH8/DIuEeW4
	ySxru+pLT30gmF4X6SVrP/HVwtlWsfo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-9GYbNK46PKy_nIm-QFHTFw-1; Tue, 01 Apr 2025 12:11:39 -0400
X-MC-Unique: 9GYbNK46PKy_nIm-QFHTFw-1
X-Mimecast-MFC-AGG-ID: 9GYbNK46PKy_nIm-QFHTFw_1743523898
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39c1b1c0969so1860315f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523898; x=1744128698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjR3mqM2w8v8J+UuArqg6Kc21meadYNT6Oek6yPNa0w=;
        b=lAhrJSvI8/UORUcPAyC0EKK169ZveDY36IeOsTGKqhzMnANtEvZ9fTlQMAF/0cHh4T
         LKiL4E0kRcjay32XttBeWt21LcDD2JVm7B7qnyq/GhBzMRmPfaxr7KPByGdURAGMeXUR
         FC+RFoVDWx75o/sOCQd+79OOuIcxYi+WbvOKYWYoXA7UG6tRM6RroftwoqIks2aOgrwo
         eQc5WOf4NhliYirhG5QQqXjZCeX+3wadH6EeM4ylOmU9FTH5avXZPkN4dL+l4pKCu50C
         zgKAlXw9bh74volD/jaxHXjsyWqLVO7g4bwtMG5Kqtq1A8Hi+NhAgorkFpFIhPi7/+MN
         jpnw==
X-Gm-Message-State: AOJu0YzYg+u333RoP7CfSiKcXlmjCmzgDHqE85H6qA7XsVswEixdfDOt
	n69QxtXMGy+AtlWzdVoRTKewd59+8mhMSz8ogRrpQDC/QU8eXf4S7Pf5A/Xo/nTUT5cdYy2GKwg
	oaUY5TZsVBonYKspocXOOwF1OSwNgcVYjuKhtGQNc4tNOzENVufGgsMovLBxco3P0TvB3CwfX7u
	5QzXcTUMkE8bNlwdcZylX+KAeeGWlUDMzQS7T430ONurjNcA==
X-Gm-Gg: ASbGncswMgO38U+L+DLBpbFLrSSeHy8y1i7Thw9bawGqKzNZtfuuV5sTzVd8NYf/Mdg
	VqrZDwEBhgwbHU72YwzvzkvHwxwUd+87UNnTwIH0v4InF/FrDb9Gtx2uWOuY8+KnRUIweB/5eG/
	ZCG/Xo/jKL8ivgj50eV/8kumQOl1HEjUDwdQucHnxkQ3aos5pnzDJZw8GcNg0gh3ivSlMQ8uCEo
	6pXC4RSHdO7WPGtk7pPS6BX45wW/+ycxjQQMRDJlW+XlYt8YK4zB16MCMQuFGQ+1KmmpdTGrJ1Z
	Ajx3d4Zdre69Hk50kgTBPA==
X-Received: by 2002:a05:6000:1863:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-39c120cc8a1mr11575921f8f.9.1743523897800;
        Tue, 01 Apr 2025 09:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf14Rq+IqwJ0RMb19wAyhNB4F46l/fAlyv854rgC7681D5ZIz2UVlu3+YdbiTNo+4kZUtxqg==
X-Received: by 2002:a05:6000:1863:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-39c120cc8a1mr11575872f8f.9.1743523897271;
        Tue, 01 Apr 2025 09:11:37 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0afsm14662940f8f.65.2025.04.01.09.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:11:36 -0700 (PDT)
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
Subject: [PATCH 11/29] KVM: anticipate allocation of dirty ring
Date: Tue,  1 Apr 2025 18:10:48 +0200
Message-ID: <20250401161106.790710-12-pbonzini@redhat.com>
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

Put together code that deals with data that is shared by all planes:
vcpu->run and dirty ring.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 virt/kvm/kvm_main.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dce89a2f0a31..4c7e379fbf7d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4173,20 +4173,20 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	}
 	vcpu->run = page_address(page);
 
+	if (kvm->dirty_ring_size) {
+		r = kvm_dirty_ring_alloc(kvm, &vcpu->dirty_ring,
+					 id, kvm->dirty_ring_size);
+		if (r)
+			goto vcpu_free_run_page;
+	}
+
 	vcpu->plane0 = vcpu;
 	vcpu->stat = &vcpu->__stat;
 	kvm_vcpu_init(vcpu, kvm, id);
 
 	r = kvm_arch_vcpu_create(vcpu);
 	if (r)
-		goto vcpu_free_run_page;
-
-	if (kvm->dirty_ring_size) {
-		r = kvm_dirty_ring_alloc(kvm, &vcpu->dirty_ring,
-					 id, kvm->dirty_ring_size);
-		if (r)
-			goto arch_vcpu_destroy;
-	}
+		goto vcpu_free_dirty_ring;
 
 	mutex_lock(&kvm->lock);
 
@@ -4240,9 +4240,9 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	xa_erase(&kvm->planes[0]->vcpu_array, vcpu->vcpu_idx);
 unlock_vcpu_destroy:
 	mutex_unlock(&kvm->lock);
-	kvm_dirty_ring_free(&vcpu->dirty_ring);
-arch_vcpu_destroy:
 	kvm_arch_vcpu_destroy(vcpu);
+vcpu_free_dirty_ring:
+	kvm_dirty_ring_free(&vcpu->dirty_ring);
 vcpu_free_run_page:
 	free_page((unsigned long)vcpu->run);
 vcpu_free:
-- 
2.49.0

