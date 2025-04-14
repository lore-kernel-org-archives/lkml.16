Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712F31F9A95
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667328; cv=none; b=sflKpjXMS12CRbbGd8RsB3LJRsTn+u14hkl0qt3aOxn+OY2wMjBxmoSatRHhQB1lH/WZSaw9pV4EPqVshWQOnKPYkOu/bM2CGELRC77Pos0FyFmjrIkQJ/yDBsDgfFIu/dpF6kZf7NhwgtJ6o5lOEdO9VNF1wTUwzamzOHj9zgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667328; c=relaxed/simple;
	bh=ptYBoTz+/EbjYTkt8XFx0Bk8DGdwBpH8kJ2Od3eWPAY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HAOM25MB2MKukJr7fuwcCDUdlCD2b6tLpgLIVyDNbRGVF4895v2F4oWgHQ8HU4s+82OaLDnA81Bnbz1HhjfAQPdfLnFLEJGLWnRhMARR9z3y0OHgSQuTqIqGLSSCCC6Au0oomDpAgWO5/8j2u0lWRioHCwZbcQb3cEoSJ55as9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jrGBjjBT; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jrGBjjBT"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736c89461d1so6668567b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744667326; x=1745272126; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCdko98Qd6rp9A1N8oHD7jtlI+IPaJZ0aheoPLnwsBA=;
        b=jrGBjjBTEJd3zrfOMmW1Lx7bZUXKAahAalGDW+YGo/el8QoXlda70oPmjHR5mVHpRD
         vVLb5/ZzkLE4jq0k75uiPAwqvg79dzPc2Pvq+ISSv5lc/HSypK3dKByNAaVIk9IRsjCt
         1TgirfKQI5kF1751jpJFHsAgB8G2s77t6qWdahBToyVp9rk9+Zz/Z8EIGoa3rsEk+wM/
         +1mJHsqOu1VxPECxuwFhVdRIXAonlRdyxOJix2ImEiWgxvevQGqfZSHtUYPHFsYDdGFr
         msXhrDug1+JcoxMT+jx35hYLLcBAfSpBzeGC+l3OMUJXn0c1yUvFO+TTrMJjPu5ebm/v
         XkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744667326; x=1745272126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCdko98Qd6rp9A1N8oHD7jtlI+IPaJZ0aheoPLnwsBA=;
        b=lO5kZUz8BaXcc6ZiWVOBBof6wkneuH3lR5wch81tsDqrbeUb6r3T4BreGXoDMC89Au
         x2gI/gAty94Txxw5T0kHwGU4hI3GSTJYEejnGil2nHjRrsqh1s1Z+4f6geIi/zGytM8l
         FUgD0sI4TLvMxxWH7xbnIq9Gkkt7NvX6w7DT5qhuFfi9a77CNxAUovhAApnqk9VK8cwd
         C028wGJn8wdmFD5zBRVsif5Urrw3LZpRcf3VKywXyONriDMTR6XKPjO4HOnLAx87janq
         xm8ToFwiKzvS2352/CF7DwID/hxacGD1y+o9Oumj18xqo7+vzKYgLFFjjUYYb1J2x7KC
         wB1A==
X-Gm-Message-State: AOJu0Yy8qkoA+POO7PXdeQbpc0Xl4eRbG9EwCbTRkO2Lh67LttSDeq8A
	tP2F1rprTiezbMqouTgjk81KoLikt/10vH93yO1Kp/NODBdwSJ8Dkx3DwKlbaxm4KK0Ba53VQg=
	=
X-Google-Smtp-Source: AGHT+IGr7W0kEZe93pHtUOr8ZSofHO0CTBmu5Jm7VKOaZBiUGCdmAzU5zoLX0YAwOOPzFO3MwDUm+6jQFw==
X-Received: from pfhq17.prod.google.com ([2002:a62:e111:0:b0:732:858a:729f])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8890:0:b0:736:ab21:8a69
 with SMTP id d2e1a72fcca58-73bd0ea93eamr17123698b3a.0.1744667325855; Mon, 14
 Apr 2025 14:48:45 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:47:34 -0700
In-Reply-To: <20250414214801.2693294-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414214801.2693294-1-sagis@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250414214801.2693294-6-sagis@google.com>
Subject: [PATCH v6 05/30] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
From: Sagi Shahar <sagis@google.com>
To: linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Ryan Afranji <afranji@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sagi Shahar <sagis@google.com>, Roger Wang <runanwang@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Adrian Hunter <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Isaku Yamahata <isaku.yamahata@intel.com>

Let kvm_init_vm_address_properties() initialize vm->arch.{s_bit, tag_mask}
similar to SEV.

Set shared bit position based on guest maximum physical address width
instead of maximum physical address width, because that is what KVM
uses, refer to setup_tdparams_eptp_controls(), and because maximum physical
address width can be different.

In the case of SRF, guest maximum physical address width is 48 because SRF
does not support 5-level EPT, even though the maximum physical address
width is 52.

Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
---
 .../testing/selftests/kvm/lib/x86/processor.c | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 80b7c4482485..1c42af328f19 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1167,13 +1167,27 @@ void kvm_get_cpu_address_width(unsigned int *pa_bits, unsigned int *va_bits)
 
 void kvm_init_vm_address_properties(struct kvm_vm *vm)
 {
-	if (vm->type == KVM_X86_SEV_VM || vm->type == KVM_X86_SEV_ES_VM ||
-	    vm->type == KVM_X86_SNP_VM) {
+	uint32_t gpa_bits = kvm_cpu_property(X86_PROPERTY_GUEST_MAX_PHY_ADDR);
+
+	switch (vm->type) {
+	case KVM_X86_SEV_VM:
+	case KVM_X86_SEV_ES_VM:
+	case KVM_X86_SNP_VM:
 		vm->arch.sev_fd = open_sev_dev_path_or_exit();
 		vm->arch.c_bit = BIT_ULL(this_cpu_property(X86_PROPERTY_SEV_C_BIT));
 		vm->gpa_tag_mask = vm->arch.c_bit;
-	} else {
+		break;
+	case KVM_X86_TDX_VM:
+		TEST_ASSERT(gpa_bits == 48 || gpa_bits == 52,
+			    "TDX: bad X86_PROPERTY_GUEST_MAX_PHY_ADDR value: %u", gpa_bits);
+		vm->arch.sev_fd = -1;
+		vm->arch.s_bit = 1ULL << (gpa_bits - 1);
+		vm->arch.c_bit = 0;
+		vm->gpa_tag_mask = vm->arch.s_bit;
+		break;
+	default:
 		vm->arch.sev_fd = -1;
+		break;
 	}
 }
 
-- 
2.49.0.504.g3bcea36a83-goog

