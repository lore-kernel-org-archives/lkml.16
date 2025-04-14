Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238B21F582E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667326; cv=none; b=Hl5UBUn7DUXcdGbdOz8nZToesjxAaaEuRVPd9ayhnLDKWIZnZW3/pvRu7IEQYfId1bJt0CQRmp+Rwe7TOGP/SZvrM+Ir11fpCiG85MBgvwUyZGF/MBggt35c2AvGieoU+f2boZLAmi46lQ0ipA0NieugnTITzaxjvq0bEn6MTq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667326; c=relaxed/simple;
	bh=aMx9Y8yg9u7zGybONWu10zJHt9fn56Xrul3yrCGrmiw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tRPcT5Vx9POMoCtGTQ+7W5vAu/Z/FNJ7LqrEUmexLCGB8D85Z9ttyrF4a3wNUkeZ7NwkonrxlrWgPFPjv6FH03mfb1zeJoBZxOns1xXH+zG64k+OkR4D7WSqf9yT1t68NAzYrcguBjydsanWhvqxBlOlRo+c1VjsiuCkGTYYkio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mGFHrws/; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mGFHrws/"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-73917303082so3143675b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744667324; x=1745272124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mkZdsxn912Ec/RO9dX550ory4AVTuswu3a/DbK4HeYk=;
        b=mGFHrws/PR8P7Nl5N/vXrcgQBAJyFU/MHyBeZPXg8ckGLhL1abgSpeVLveRG5m4i+G
         UsSRYlwuWHH3BY14TcGFFHiXxOBToAR2mb6pj6nLJMUt9WhbFFloSkOb4zkLOe7LyTCO
         M2Csb174i7Uzcuqh28vvkjLFXtfHxeFRjbj+zjcLV8zlREmRTCo9KaIrFSr0nu+tfMaD
         KykO3xrCly626Cvb+HVUyPL7ibf6y2er/fVtJLugEIO+jWODQC96qLVk/JPwBNAE69M5
         OPbjMhgUqPk+7gPbb9N1hKzakoAbSNVqDwd0saXxY6bmKDyDGJUA9Unh0hpoKca4oXvJ
         CO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744667324; x=1745272124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkZdsxn912Ec/RO9dX550ory4AVTuswu3a/DbK4HeYk=;
        b=Nm/Vn1yRfdE4IZEH7ZrWX/Vsgc88L4ORW11MSrqV+IpiA4ydpIefwOts3bx2KyCLV5
         h2llChLJTkbWVyCKZLTaI5g/C3fgl4wVhPnIqcuRD3wbmfVGwNjngXtwj/vVd1vLQdco
         NwhtErLl+4pOGDvPodaCkhDkgcV8ja6m4wfy4AkFOx3th1E6d5WUVhAY3XvvpeOVfGdo
         jIKHC1bhk1s/AjN//oUIEI8XZ0gAvem46OX7RlOE0egy+5FkotOyF5oA34H1pGeL0qE5
         9qSASdhlrCUbqIwyHVa2lCxLxHOsJtFyoy568yIlzlEVY/EU2QwWaoK7maoPYCfRc+SY
         fDmg==
X-Gm-Message-State: AOJu0YyPzRVPSyKfEIpQ9CZ3DR+U557NV/iR1M+vKfFEoHF7NmWs4M8F
	uiEZXbx1Nw29Ms5LC0ts3T6zp+8xnPDpDemfk92G20+pZcOfJHrKbTjVFTsHxwOlgYY/v2nO8w=
	=
X-Google-Smtp-Source: AGHT+IGyn7fV6lwVi5kZMNG97VdOf151yCfd0PSG0Vwo1uhKlLK2WRd5aZhvUE22HAEnE8pDALUKnDFuWQ==
X-Received: from pfbfj37.prod.google.com ([2002:a05:6a00:3a25:b0:730:8b4c:546c])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8895:0:b0:736:4d05:2e2e
 with SMTP id d2e1a72fcca58-73bd11c6792mr14788038b3a.6.1744667324444; Mon, 14
 Apr 2025 14:48:44 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:47:33 -0700
In-Reply-To: <20250414214801.2693294-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414214801.2693294-1-sagis@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250414214801.2693294-5-sagis@google.com>
Subject: [PATCH v6 04/30] KVM: selftests: Add vCPU descriptor table
 initialization utility
From: Sagi Shahar <sagis@google.com>
To: linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Ryan Afranji <afranji@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sagi Shahar <sagis@google.com>, Roger Wang <runanwang@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ackerley Tng <ackerleytng@google.com>

Turn vCPU descriptor table initialization into a utility for use by tests
needing finer control, for example for TDX TD creation.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
---
 tools/testing/selftests/kvm/include/x86/processor.h | 1 +
 tools/testing/selftests/kvm/lib/x86/processor.c     | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 3162c6e8ea23..7c4e545ae9c9 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1178,6 +1178,7 @@ struct idt_entry {
 	uint32_t offset2; uint32_t reserved;
 };
 
+void sync_exception_handlers_to_guest(struct kvm_vm *vm);
 void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 			void (*handler)(struct ex_regs *));
 
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 7c0fe3b138a1..80b7c4482485 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -585,6 +585,11 @@ void route_exception(struct ex_regs *regs)
 		   regs->vector, regs->rip);
 }
 
+void sync_exception_handlers_to_guest(struct kvm_vm *vm)
+{
+	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
+}
+
 static void vm_init_descriptor_tables(struct kvm_vm *vm)
 {
 	extern void *idt_handlers;
@@ -600,7 +605,7 @@ static void vm_init_descriptor_tables(struct kvm_vm *vm)
 	for (i = 0; i < NUM_INTERRUPTS; i++)
 		set_idt_entry(vm, i, (unsigned long)(&idt_handlers)[i], 0, KERNEL_CS);
 
-	*(vm_vaddr_t *)addr_gva2hva(vm, (vm_vaddr_t)(&exception_handlers)) = vm->handlers;
+	sync_exception_handlers_to_guest(vm);
 
 	kvm_seg_set_kernel_code_64bit(&seg);
 	kvm_seg_fill_gdt_64bit(vm, &seg);
-- 
2.49.0.504.g3bcea36a83-goog

