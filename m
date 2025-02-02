Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357791FF1BD
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738527838; cv=none; b=ndy2cFFIa9F594fRWZy4VlNN0iD/PisiNVOtmGxa+6AM73da+cUTztLlr0LYv2l2Osl24Pz1jrDVORk0ZlsiMpBvDlMS4CLaVeYQfpvxMuWdIIjzrPT4UmDbffN1/UYo2DoPxiqf2fqjFfZ7qw4KYo/MqY3tOmEG810p7cDjHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738527838; c=relaxed/simple;
	bh=7WhydFusAix6csd+qPOThyWVXeiQbRvo6PRMBDJvnqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=acWEq61jRFiCDuDvRESZhGyI2H/0XytP7WhVKyXjgpx4hDlaXWsclrsIs8umux6bHpYHhJjy6Nob7xvs0EQ8TjOS9JX38hdbZqTXRYl3b+Et9N2WPZirfmgQXnUCcBpZQCmW2+0i/25z+3imzn4fSDxJB3qfsHSYsS+4dxhkyns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yh6Xbgff; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yh6Xbgff"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4678cce3d60so39024291cf.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 12:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738527834; x=1739132634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjpd1OiEDC32ZI0oS2KzIJVqOGJJUMCsg9bDjHIDTa0=;
        b=Yh6Xbgff76AE+tbCidPzss/WntzL186qDEcOygtDfoj3iCX92oT2e5oyMk2ZoMr08W
         0bK31vlELbw7jyWyOnbtOW9AawtWI8seRFa6v4LIL8HZtRU95Pc0WVTPUt3OBVtx/abS
         kLV70EGyCGtmCNx4sZRgXg/w5EMGa6KQ4D9OugQMSkYcJZNB8If5ydL2Ce5dCq1V+hAv
         JlVlScQEbfF8ljD+x5L/jBLmJx+TZSk5N8I5JdArk29777ZSXn0zmrSIp6pb03nTO+SS
         vmNUvIortaRzp9ZgIfBkzkLINYsuahgxoND6EbXwOqk8btLsR41qnbjntzu+aIS5o1gT
         MzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738527834; x=1739132634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjpd1OiEDC32ZI0oS2KzIJVqOGJJUMCsg9bDjHIDTa0=;
        b=Mc2RRHqaXR5BYuTelE4TgaSpGb6pHYIoklXO5+MstIDq7Zfr+JpS26ujRFQ4thuDbF
         +QWWJvVQxOTRFdfRkFMhzz63wh8sVRCKr1U7plWZ+uTTFiVixjuTLBBp6aSos2WdhaUG
         rvAA9CYyRvCqhIwT0WfSbltV7RNj99UySpvCMhUHo6jsMaAEB3W+ibwMDYKXzUmy1hok
         YzwyobNjtLdOoYAk38VmMCszbYdrKnfHDbgyTHResFf7DycIzvNsb1b9eaol0bpmGBW8
         lUKl9YqP2hpnVG+g7Xm60ReESQ0Hboe+S5j7/AJH+2PcW87yVjLB8pP+4f0Hgv80GfWC
         5E0A==
X-Gm-Message-State: AOJu0YzDW2O2ktbkMq7cxntMNTjvZflUXMhgYu/bgMGLDTp/sImenV9P
	JDrU5Gcm7UwQWHQlo0F/paFzhh1oXpwi5DQWW0zBxTkQuObaaZmh1N72
X-Gm-Gg: ASbGncu9hCwc8HJRO8W8MribNqkGdIWArXosg7MGqX0xgwC7SKh/Xc8ytE3rWq5/jtE
	0QpmFqzK3vqzwInUcT5Fsvf8MVncrPcfZst2it0JBPlOClTpTYUeBFvQudkJUZq5wbX7vT8Hw18
	82CZ5LkggsN01OmQJ7Eppm0P3GA5TsfFJ84yG30hBlZFR+2iX9UjYw3ugf9HWIOmNp8cdMZIbDc
	ks/wQzuN/CO9gMsKH56HRwOmO5LzB6M489dzS8Q5fXhWIURNgq93lSL+/aWQ30IkFh8QmFf
X-Google-Smtp-Source: AGHT+IGMN3syLu75/wtpz05z5bMuChlKkoKUM6nFyYkHbbJMH+zP6yLgYX/9OcnqC350CyrtDG5WlQ==
X-Received: by 2002:a05:622a:6110:b0:464:c8f2:e553 with SMTP id d75a77b69052e-46fd0b26873mr270818171cf.42.1738527834221;
        Sun, 02 Feb 2025 12:23:54 -0800 (PST)
Received: from citadel.lan ([2600:6c4a:4d3f:6d5c::1019])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46fdf0a74dcsm40800871cf.3.2025.02.02.12.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 12:23:53 -0800 (PST)
From: Brian Gerst <brgerst@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>
Subject: [PATCH 1/2] x86/arch_prctl: Simplify sys_arch_prctl()
Date: Sun,  2 Feb 2025 15:23:22 -0500
Message-ID: <20250202202323.422113-2-brgerst@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250202202323.422113-1-brgerst@gmail.com>
References: <20250202202323.422113-1-brgerst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use in_ia32_syscall() instead of a compat syscall entry.

Signed-off-by: Brian Gerst <brgerst@gmail.com>
---
 arch/x86/entry/syscalls/syscall_32.tbl |  2 +-
 arch/x86/include/asm/proto.h           |  3 +--
 arch/x86/kernel/process.c              |  5 ++++-
 arch/x86/kernel/process_32.c           |  5 -----
 arch/x86/kernel/process_64.c           | 18 ------------------
 5 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 4d0fb2fba7e2..62283097a7cc 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -396,7 +396,7 @@
 381	i386	pkey_alloc		sys_pkey_alloc
 382	i386	pkey_free		sys_pkey_free
 383	i386	statx			sys_statx
-384	i386	arch_prctl		sys_arch_prctl			compat_sys_arch_prctl
+384	i386	arch_prctl		sys_arch_prctl
 385	i386	io_pgetevents		sys_io_pgetevents_time32	compat_sys_io_pgetevents
 386	i386	rseq			sys_rseq
 393	i386	semget			sys_semget
diff --git a/arch/x86/include/asm/proto.h b/arch/x86/include/asm/proto.h
index 484f4f0131a5..05224a695872 100644
--- a/arch/x86/include/asm/proto.h
+++ b/arch/x86/include/asm/proto.h
@@ -15,7 +15,6 @@ void entry_SYSCALL_64(void);
 void entry_SYSCALL_64_safe_stack(void);
 void entry_SYSRETQ_unsafe_stack(void);
 void entry_SYSRETQ_end(void);
-long do_arch_prctl_64(struct task_struct *task, int option, unsigned long arg2);
 #endif
 
 #ifdef CONFIG_X86_32
@@ -41,6 +40,6 @@ void x86_configure_nx(void);
 
 extern int reboot_force;
 
-long do_arch_prctl_common(int option, unsigned long arg2);
+long do_arch_prctl_64(struct task_struct *task, int option, unsigned long arg2);
 
 #endif /* _ASM_X86_PROTO_H */
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 6da6769d7254..0f398a42c1e2 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -1043,7 +1043,7 @@ unsigned long __get_wchan(struct task_struct *p)
 	return addr;
 }
 
-long do_arch_prctl_common(int option, unsigned long arg2)
+SYSCALL_DEFINE2(arch_prctl, int, option, unsigned long, arg2)
 {
 	switch (option) {
 	case ARCH_GET_CPUID:
@@ -1058,5 +1058,8 @@ long do_arch_prctl_common(int option, unsigned long arg2)
 		return fpu_xstate_prctl(option, arg2);
 	}
 
+	if (!in_ia32_syscall())
+		return do_arch_prctl_64(current, option, arg2);
+
 	return -EINVAL;
 }
diff --git a/arch/x86/kernel/process_32.c b/arch/x86/kernel/process_32.c
index 0917c7f25720..2bdab416298c 100644
--- a/arch/x86/kernel/process_32.c
+++ b/arch/x86/kernel/process_32.c
@@ -215,8 +215,3 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
 
 	return prev_p;
 }
-
-SYSCALL_DEFINE2(arch_prctl, int, option, unsigned long, arg2)
-{
-	return do_arch_prctl_common(option, arg2);
-}
diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
index 226472332a70..e067c61b5fca 100644
--- a/arch/x86/kernel/process_64.c
+++ b/arch/x86/kernel/process_64.c
@@ -980,24 +980,6 @@ long do_arch_prctl_64(struct task_struct *task, int option, unsigned long arg2)
 	return ret;
 }
 
-SYSCALL_DEFINE2(arch_prctl, int, option, unsigned long, arg2)
-{
-	long ret;
-
-	ret = do_arch_prctl_64(current, option, arg2);
-	if (ret == -EINVAL)
-		ret = do_arch_prctl_common(option, arg2);
-
-	return ret;
-}
-
-#ifdef CONFIG_IA32_EMULATION
-COMPAT_SYSCALL_DEFINE2(arch_prctl, int, option, unsigned long, arg2)
-{
-	return do_arch_prctl_common(option, arg2);
-}
-#endif
-
 unsigned long KSTK_ESP(struct task_struct *task)
 {
 	return task_pt_regs(task)->sp;
-- 
2.48.1

