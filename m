Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0C92EACF8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444403; cv=none; b=SYQ8quwsa13Rn9BwaXwseeCbw9M2Qz68jZ7ItnTQO4TPeSLkxyDStmdA9dxlKRaVkV3gBUMn/b2rEVVEBntJ+cH1NebmfrtQ/i1YlmYQcweUNrqQ2iSOCgHzZOOfTr8wIrEeE7jkl+0nmlgFEiHLECXpRgAhaVrsaNKpUin0YCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444403; c=relaxed/simple;
	bh=ucRzHJWp7naudgx3oSodbDo3ziwW+nJdx1fM+yiieLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P1U8nHkFhUbR5wSh8kn7g0raC8Y/KdeEQ7YV8bTlmUQOdKEFC5P5XyBJJA/Xvq/iK7txNYhTh6VLU8YO9w0s0xt3vh+kAND+LpFGlSVns4JipcgwE79+kixSeY70u8LS/P5RHL0E7AJuvmx7YZJgncuyQurnyhA6mkOR/RrmU/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HtUMFBGb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HtUMFBGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750444400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ew6cYXJ5tlWvgkgeybcpF+VZLjwvJDFqrgIT2wI2peY=;
	b=HtUMFBGbuHxeBHKTqBwSye22QcPj5hyIR2nt/dL+X5B8qDjVNYkyYAyas4MTua+8/P72nZ
	0huseTbvOt1m9M7vH9eJ5zYYAX+gb67XB51TkqDhqPpFgTg8FfErAb260eibF32ozTenaA
	jKfe4gHCXesRWtKZJIUIRVZ/ztRc5vU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-25-7yf16FjtOpapJiIk6xmmOQ-1; Fri,
 20 Jun 2025 14:33:15 -0400
X-MC-Unique: 7yf16FjtOpapJiIk6xmmOQ-1
X-Mimecast-MFC-AGG-ID: 7yf16FjtOpapJiIk6xmmOQ_1750444393
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E228195608C;
	Fri, 20 Jun 2025 18:33:12 +0000 (UTC)
Received: from virtlab1023.lab.eng.rdu2.redhat.com (virtlab1023.lab.eng.rdu2.redhat.com [10.8.1.187])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6D5B7180045B;
	Fri, 20 Jun 2025 18:33:09 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	pbonzini@redhat.com,
	seanjc@google.com
Cc: rick.p.edgecombe@intel.com,
	kai.huang@intel.com,
	adrian.hunter@intel.com,
	reinette.chatre@intel.com,
	xiaoyao.li@intel.com,
	tony.lindgren@intel.com,
	isaku.yamahata@intel.com,
	yan.y.zhao@intel.com,
	mikko.ylinen@linux.intel.com,
	kirill.shutemov@intel.com,
	jiewen.yao@intel.com,
	binbin.wu@linux.intel.com
Subject: [PATCH v3 0/3] TDX attestation support and GHCI fixup
Date: Fri, 20 Jun 2025 14:33:05 -0400
Message-ID: <20250620183308.197917-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The userspace API is the same as in v2, consolidating everything into a
single KVM_EXIT_TDX where userspace is free to ignore unknown TDVMCALLs.

Together with this I have written an extra small series that adds supported
TDVMCALLs in the KVM_TDX_CAPABILITIES output, and also adds
SetupEventNotifyInterrupt support.  I'd rather include it in 6.16 but
also it's better to do that as soon as the spec is finalized rather than
earlier.

Since there's nothing really interesting in there, I'll hold on it for
a couple weeks hoping for more movement on the spec side.

Paolo


Binbin Wu (3):
  KVM: TDX: Add new TDVMCALL status code for unsupported subfuncs
  KVM: TDX: Handle TDG.VP.VMCALL<GetQuote>
  KVM: TDX: Exit to userspace for GetTdVmCallInfo

 Documentation/virt/kvm/api.rst    | 59 +++++++++++++++++++++-
 arch/x86/include/asm/shared/tdx.h |  1 +
 arch/x86/kvm/vmx/tdx.c            | 83 ++++++++++++++++++++++++++++---
 include/uapi/linux/kvm.h          | 22 ++++++++
 4 files changed, 157 insertions(+), 8 deletions(-)

-- 
2.43.5

