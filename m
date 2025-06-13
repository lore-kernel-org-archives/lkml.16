Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F142522BA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842060; cv=none; b=govW4UG+WJLCpjKy74s43yfrNPhIrthl1maYTr1GVnjyWbEiXkDtnjmbblAXErJEB0CmZhpqeeEkPfi2/uSL1njfQP7oWUJrGTXwy2Gzh8bSGmwZp9UInmbZ9l0ZOrNDY1HUV1fwjALYmXhLshj8WUh+3eFZwnt8ESmCRJBHAQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842060; c=relaxed/simple;
	bh=rcNojIrkKk71ZnhBfmVVb45xpOUbdROsZ4vsY+fOfXE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ce4KWTWG8BpcXsWLfa7tcmCOZEbhTmZwHea7SzJYRnfQqblso4zCcCoAET8yk/Oj6Ee+v5q3lqbeWIglhn7v9ULjeuM5j5daFp7/z0h7PC2lMGnGgWwesWl84Y5I7EVpgbwD98Eh7HA4Y5kkP7avYwbuK1Je1RqBhk47KqBLCt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3VVGb4jD; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3VVGb4jD"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b2f02cd1daeso1712001a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749842058; x=1750446858; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gcb9ynWPHJDnOBsaC+w2WlTETP9YsMoWaIZTF4OWeus=;
        b=3VVGb4jD0ht45eFYVRBwyFPG+6Tiyius9NlrGnIVY+TPsyeXbLgurSUjB+gWr3/Xy+
         uWy2Edbij3ynqh6p36w5D1RKemjO8O8YgfthsuUZvAVtRkBjOn4j3sd23DOmMEYmv3Yq
         lSmwMFisjypvc8HHBOnz0R4G8v3+jQZ+Lcp0IcD+Ow0awWMq2eBtHv3gSC2DWFvJkWQr
         M+kkCBtemAqzmyUnSFMoiPHseB3PbxfPCttIqrCBNI2homAQ3QLfW5cDJA8X3HeJdzZc
         iAgbXSp7LVgQ6z5ZSwolAYpdZbMjUsbxJbaYdLEpmyOyQkgYuO8WZiGD79VqjdYKni4M
         hcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749842058; x=1750446858;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcb9ynWPHJDnOBsaC+w2WlTETP9YsMoWaIZTF4OWeus=;
        b=SNqo+8KuBqPO7t22UVGilrlk1h2O9RQJ1j1vgLDauig6YQTPYRJmD4lMDNlgw+hUyB
         WHqy6iii1oKCaelMfcGSCZTmyvF3aWNnMajJVhuGk2Vmqjtr2e2oZSrC8AWW0Wi+Ljdl
         8T+ltcktEah3xOaa7RCReQXSlOn4QMuQtRjIBtdMOybwveBcQMkcqFPSCHV6DPDMaPDL
         JwUx5kgbjCloKhSUtxcu5eWiay2sGJlqE8jJKrOwPuXxvb8qtEjPCJvyoKziUOyPq8IW
         u1x4Aaas4UirmixFRQIEeUBLkKj5JJ9ELwPKvrSc1JUz+WbHzUR+LWCchhf86jR2tUPg
         DlQQ==
X-Gm-Message-State: AOJu0Yxzm7k2apKHU2Ace0/4MAh253heuiBGS7z2wGhyQ0R/DYL5a0gv
	75RQEETeULXEr0GF7w7ke7abW8h8SpjiPW0StvbDxNohyn8nu3rFfn25kZgeCT4K04ra0uWQGWo
	33w==
X-Google-Smtp-Source: AGHT+IEsw8JvuYmpQZvLNlubbPq4JN8tgwPDg0ZH3gf2iYtNn2ncDksTRsRAcT4gWuA7GIhv67eR9tNt9A==
X-Received: from pjbqn11.prod.google.com ([2002:a17:90b:3d4b:b0:311:4aa8:2179])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5250:b0:312:1c83:58fb
 with SMTP id 98e67ed59e1d1-313f1c6f67cmr1129215a91.1.1749842058508; Fri, 13
 Jun 2025 12:14:18 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:13:31 -0700
In-Reply-To: <20250613191359.35078-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250613191359.35078-1-sagis@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613191359.35078-5-sagis@google.com>
Subject: [PATCH v7 04/30] KVM: selftests: Add vCPU descriptor table
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
index f2eb764cbd7c..37ad1e4d86ba 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1178,6 +1178,7 @@ struct idt_entry {
 	uint32_t offset2; uint32_t reserved;
 };
 
+void sync_exception_handlers_to_guest(struct kvm_vm *vm);
 void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 			void (*handler)(struct ex_regs *));
 
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index da6e9315ebe2..d082d429e127 100644
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
2.50.0.rc2.692.g299adb8693-goog

