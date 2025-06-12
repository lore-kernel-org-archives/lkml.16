Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E087FD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749703794; cv=none; b=PrnHLsCy8uJHoWEHrle236huduv9OjhzcfA+kxfi1/ELNgAn5HmMewDOcyZd3ceh9UyCHaKV2eYIzoWvsMYHHV6azWG0nTaxPN19yyspJznNvI0qXXEEo4p+1xHpJfSMz7wIQhZJ4oAs66kdsDB7cFrgViOjFkQjrsrLlfv6eBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749703794; c=relaxed/simple;
	bh=GR66hGVXdlKu7SEarFLErk8993y72ho0y/Vqw0tX3WU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VUxMCaZdu0aBc53Xpt6zABcJOpatLqkEHfZmRHaRY9sbNguqS2KodBQQpdVkxuxJbOblcy129m0yxu4tGlciZG71q7h5QWzqjeU8Str8Oy/I/9/sAyT3XWaZApftZfn6GzV3RHCbMp+YrxKeGy6/d5FIK015AS3Nx78c5vZWASg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hf9chkZ5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hf9chkZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749703791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OBYtJIhsv8X1JURlzf2kgMeWsta7f4jIzlInsevvCtw=;
	b=Hf9chkZ51CWFAGZ+RPu1fUj71Wj96Jpi/nji8ymCe6aH4GdkEqWA+/Oqm2rCy8c+eRLw2Q
	60+xAz+7Rp6/VK4qQjN0nLGDfWT/1TroCLPT3ixE2efGjTUIaBhoF00SsnF3pJLywfC2AQ
	khGrB9/lgqLVWIhN9knJgt/fvysj0b4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-547-r1I6eT35O1Kf6RL3nzOTaQ-1; Thu,
 12 Jun 2025 00:49:46 -0400
X-MC-Unique: r1I6eT35O1Kf6RL3nzOTaQ-1
X-Mimecast-MFC-AGG-ID: r1I6eT35O1Kf6RL3nzOTaQ_1749703785
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 29F3D195608A;
	Thu, 12 Jun 2025 04:49:45 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43E1119560AF;
	Thu, 12 Jun 2025 04:49:44 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: seanjc@google.com,
	xiaoyao.li@intel.com,
	yan.y.zhao@intel.com
Subject: [PATCH] KVM: x86/mmu: Reject direct bits in gpa passed to KVM_PRE_FAULT_MEMORY
Date: Thu, 12 Jun 2025 00:49:43 -0400
Message-ID: <20250612044943.151258-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Only let userspace pass the same addresses that were used in KVM_SET_USER_MEMORY_REGION
(or KVM_SET_USER_MEMORY_REGION2); gpas in the the upper half of the address space
are an implementation detail of TDX and KVM.

Extracted from a patch by Sean Christopherson <seanjc@google.com>.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index a4040578b537..4e06e2e89a8f 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4903,6 +4903,9 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 	if (!vcpu->kvm->arch.pre_fault_allowed)
 		return -EOPNOTSUPP;
 
+	if (kvm_is_gfn_alias(vcpu->kvm, gpa_to_gfn(range->gpa)))
+		return -EINVAL;
+
 	/*
 	 * reload is efficient when called repeatedly, so we can do it on
 	 * every iteration.
-- 
2.43.5

