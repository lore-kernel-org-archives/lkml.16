Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004F725B669
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749193811; cv=none; b=tVgxKA+N7x/K3JlRcPA6lRIewvD9dDHhNXoDs7YZ69fEl58eerQO2ewajBApgv9HirlxLFlvAhHACM+jkXhU0rmPpKS3jhbm4cLusFNju1FJH5w/a0TotcXq7mCWD3IjWk6h0RJgLIdGmUBNKlULYr8KEnCeP67GTwX6lNthINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749193811; c=relaxed/simple;
	bh=PugHqvCbDg2TUwclG7nY13vUGrUcBAujU/E6fcsr05E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPbBBheuldoSqO2IpdsZhjPRIH46JoJkadpOKkWPBeZz6dTR1Fo2bsktGOnXq2It84b9UQ2CQYSIoOH2FIYeufHllQ6MIHgHGAlbnleVfvw9ayGgBhiahLTBCTOyTQyWfUD3A8Wd3R7Wrn8bJE585vwrVjEt2/lblE0+4epZ45A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YJSQRiyU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YJSQRiyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749193808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KuePHXfM3UKI4Kv8fQkBuRMJ48F3aL7s6VW16J3fp60=;
	b=YJSQRiyUr4qHWPicJSbWJMBXUpln4D/CJDTpOSp2iYD8P449MoCHFgfLV568KQGgqRGrc7
	gzPTxVGeZZ6IR9xuGrxVxnPQ6iQ/Ca2kAxeGMiDFtId4swJ6mGJFH+sFZBdmN+wSB4oSuw
	3FlFdbTOM03GNxNdh51Q3rzUGKTl2sU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-AqZ7nWUuNr2BV3nZFgTHwQ-1; Fri,
 06 Jun 2025 03:10:04 -0400
X-MC-Unique: AqZ7nWUuNr2BV3nZFgTHwQ-1
X-Mimecast-MFC-AGG-ID: AqZ7nWUuNr2BV3nZFgTHwQ_1749193803
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E50111956096;
	Fri,  6 Jun 2025 07:10:02 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.225.83])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2384F18002B1;
	Fri,  6 Jun 2025 07:09:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Fri,  6 Jun 2025 09:09:51 +0200
Message-ID: <20250606070952.498274-2-thuth@redhat.com>
In-Reply-To: <20250606070952.498274-1-thuth@redhat.com>
References: <20250606070952.498274-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

From: Thomas Huth <thuth@redhat.com>

__ASSEMBLY__ is only defined by the Makefile of the kernel, so
this is not really useful for uapi headers (unless the userspace
Makefile defines it, too). Let's switch to __ASSEMBLER__ which
gets set automatically by the compiler when compiling assembly
code.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/riscv/include/uapi/asm/kvm.h        | 2 +-
 arch/riscv/include/uapi/asm/ptrace.h     | 4 ++--
 arch/riscv/include/uapi/asm/sigcontext.h | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 5f59fd226cc57..5364c7141b4ee 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -9,7 +9,7 @@
 #ifndef __LINUX_KVM_RISCV_H
 #define __LINUX_KVM_RISCV_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/types.h>
 #include <asm/bitsperlong.h>
diff --git a/arch/riscv/include/uapi/asm/ptrace.h b/arch/riscv/include/uapi/asm/ptrace.h
index a38268b19c3d3..beff8df80ac9c 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -6,7 +6,7 @@
 #ifndef _UAPI_ASM_RISCV_PTRACE_H
 #define _UAPI_ASM_RISCV_PTRACE_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/types.h>
 
@@ -127,6 +127,6 @@ struct __riscv_v_regset_state {
  */
 #define RISCV_MAX_VLENB (8192)
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/include/uapi/asm/sigcontext.h b/arch/riscv/include/uapi/asm/sigcontext.h
index cd4f175dc8376..748dffc9ae194 100644
--- a/arch/riscv/include/uapi/asm/sigcontext.h
+++ b/arch/riscv/include/uapi/asm/sigcontext.h
@@ -15,7 +15,7 @@
 /* The size of END signal context header. */
 #define END_HDR_SIZE	0x0
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct __sc_riscv_v_state {
 	struct __riscv_v_ext_state v_state;
@@ -35,6 +35,6 @@ struct sigcontext {
 	};
 };
 
-#endif /*!__ASSEMBLY__*/
+#endif /*!__ASSEMBLER__*/
 
 #endif /* _UAPI_ASM_RISCV_SIGCONTEXT_H */
-- 
2.49.0

