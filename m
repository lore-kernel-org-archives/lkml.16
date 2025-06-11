Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC826E6FB
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749642072; cv=none; b=QrDo0rdK/bhs4rSOUdV8VnEy1SIoHsiqORIjpVx9wPqWrrrHiKOV/AP8QsA8lKp7Gye/63WJcPAp5besJ4TRGSuNJN8wiymSTPAbJpvke3+kkwpaKKuFxFiZ4aPJ3wL8qT1f1VjxZQ7O6RbAslx4KdGBKeZZNWMhp0Xdku5A7tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749642072; c=relaxed/simple;
	bh=BB+Nq4F+8DHpKe8k/Pe8rlDtNAN4oPXZ6KzMZWcNRZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jRRNIHgXwgwEnjA1uTjewjhGUGulD8UEbmDoS17KepToxLlCEKFyeuuc+L+UGWLwS5IuslP6KujRk+BfxwvRAcvI2zpt2yxCgL3d2sJRX5ym2N8jIIwfOMLwCFf4HGhqH1BWbswUv2uAXUaHV6GID1HLP4qKKeEQUKnPgqpf990=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CP797MET; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CP797MET"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749642068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X/dEf6y1QQViYh0BIS69b+46T8p06RdlIURI7TvyvZw=;
	b=CP797METHBa78M9i5LP/nXh4Ov3AS+p5QdCLCXTsZYaRPT/rM7pmKxCUqh18wFdLwhPsKW
	5+7rxS3oanj+bMeTvxclqP8AP1xFvGSHh3NIUeJYuXb3gKYd+ppUtfVs/BgtE1HVe2bpiP
	18dvCEieEWZYmT8ODQhNRvEkLLW4CqU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-BJAHw46xMayePwBNNpMOoQ-1; Wed,
 11 Jun 2025 07:41:06 -0400
X-MC-Unique: BJAHw46xMayePwBNNpMOoQ-1
X-Mimecast-MFC-AGG-ID: BJAHw46xMayePwBNNpMOoQ_1749642065
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C33319560B0;
	Wed, 11 Jun 2025 11:41:05 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.174])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7DB8C19560A3;
	Wed, 11 Jun 2025 11:41:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-m68k@lists.linux-m68k.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>
Cc: Sam Creasey <sammy@sammy.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] m68k: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Wed, 11 Jun 2025 13:40:55 +0200
Message-ID: <20250611114056.118309-2-thuth@redhat.com>
In-Reply-To: <20250611114056.118309-1-thuth@redhat.com>
References: <20250611114056.118309-1-thuth@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: Thomas Huth <thuth@redhat.com>

__ASSEMBLY__ is only defined by the Makefile of the kernel, so
this is not really useful for uapi headers (unless the userspace
Makefile defines it, too). Let's switch to __ASSEMBLER__ which
gets set automatically by the compiler when compiling assembly
code.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/m68k/include/uapi/asm/bootinfo-vme.h | 4 ++--
 arch/m68k/include/uapi/asm/bootinfo.h     | 8 ++++----
 arch/m68k/include/uapi/asm/ptrace.h       | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/include/uapi/asm/bootinfo-vme.h b/arch/m68k/include/uapi/asm/bootinfo-vme.h
index f36a09ab5e79b..b8139eb393524 100644
--- a/arch/m68k/include/uapi/asm/bootinfo-vme.h
+++ b/arch/m68k/include/uapi/asm/bootinfo-vme.h
@@ -33,7 +33,7 @@
 #define VME_TYPE_BVME6000	0x6000	/* BVM Ltd. BVME6000 */
 
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Board ID data structure - pointer to this retrieved from Bug by head.S
@@ -56,7 +56,7 @@ typedef struct {
 	__be32	option2;
 } t_bdid, *p_bdid;
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 
     /*
diff --git a/arch/m68k/include/uapi/asm/bootinfo.h b/arch/m68k/include/uapi/asm/bootinfo.h
index 024e87d7095f8..28d2d44c08d06 100644
--- a/arch/m68k/include/uapi/asm/bootinfo.h
+++ b/arch/m68k/include/uapi/asm/bootinfo.h
@@ -16,7 +16,7 @@
 #include <linux/types.h>
 
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
     /*
      *  Bootinfo definitions
@@ -43,7 +43,7 @@ struct mem_info {
 	__be32 size;			/* length of memory chunk (in bytes) */
 };
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 
     /*
@@ -167,7 +167,7 @@ struct mem_info {
 #define BI_VERSION_MAJOR(v)		(((v) >> 16) & 0xffff)
 #define BI_VERSION_MINOR(v)		((v) & 0xffff)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct bootversion {
 	__be16 branch;
@@ -178,7 +178,7 @@ struct bootversion {
 	} machversions[];
 } __packed;
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 
 #endif /* _UAPI_ASM_M68K_BOOTINFO_H */
diff --git a/arch/m68k/include/uapi/asm/ptrace.h b/arch/m68k/include/uapi/asm/ptrace.h
index ebd9fccb3d11f..d70f771399b40 100644
--- a/arch/m68k/include/uapi/asm/ptrace.h
+++ b/arch/m68k/include/uapi/asm/ptrace.h
@@ -22,7 +22,7 @@
 #define PT_SR	   17
 #define PT_PC	   18
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /* this struct defines the way the registers are stored on the
    stack during a system call. */
@@ -81,5 +81,5 @@ struct switch_stack {
 #define PTRACE_GETFDPIC_EXEC	0
 #define PTRACE_GETFDPIC_INTERP	1
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* _UAPI_M68K_PTRACE_H */
-- 
2.49.0

