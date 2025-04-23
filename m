Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C461F237A;
	Wed, 23 Apr 2025 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437837; cv=none; b=K9eR53GK0NstN7itDaF6Szu2/TTMopxa50qMrMz4dkCGuMKGPD0ZqU2KCZNbCfLixUuFq6kPowPp8fkFw+wXZ+VeaRCoIwYT5cMn7wa5Qf+Z38JEmQcs34YIORT6lBxiuwX/voV+pIMrdtHl2+A2JjSIA3QP4c44i8bMLlbdYXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437837; c=relaxed/simple;
	bh=xG9cEaz9YW7KP22n23Ih5arjN0+uinwkt2SR20vgfdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GX4LerzLzbTmzx4N7PlFt5604YfkD/EOw4TrDw5HP33/JxitNtRCH0wr7oYo81boFudDEhHnFUYA/E6s1R1dCXQSuQGO7cjpo+DhhI93yBD+QYBqUR2Q0DeQ10DBAMGyWEOViH+dcRcJGYcv4NtEPdDnXHaCH2AZVInJr9LE3ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNXHGAmj; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNXHGAmj"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso2896561fa.2;
        Wed, 23 Apr 2025 12:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745437832; x=1746042632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYUrxA/2gfBLF1+27NTj+OBtK+zQ8lXHsSjkwdkRDIU=;
        b=fNXHGAmjspo1082BknclSJ+APPICU/A6oZ3madkNG2NfpThTkPtvcNQdGyEGfI/QUE
         lbtzqVLjSXXxnVUAq2LewQHseoZwE8PKtWWzEBVNgfxr/gsoA5v5vb8cEe6iEMrY9s7W
         ug9TYgy8Pq7BQZu2Ma/8Jt0f+RSiMUvy1KsDs6jQ9Qda35szF1vzatn7SCHb/VSGWkMg
         GqrZ5+z7r537DOSjVERfh0ShpQJyOyCHs1vYw4YEp2tqiOFoGXIw089aaNRcJsIUV6Wd
         8RvV97zIX5EPuGTnohyjgL2SQnLtXHKAl7+9/SDCA8Q6KRFwdgOFS1JjRADzNnEycI9c
         RLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745437832; x=1746042632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYUrxA/2gfBLF1+27NTj+OBtK+zQ8lXHsSjkwdkRDIU=;
        b=cocpsVED9DJ6NzkngIIzd6Q+lF+sCBwZyvD2pZ6iYCAX9sh3Es8BKlPOaqEhN+3gmh
         yKO8b6rvym2Y67XVd+MjPuZrf5/3666+5CWQGvUwf5XSrzgKF2gtvva6YDCp6QBrTp99
         1eQeZD33WgPjSTDChBBaMHmwfdH1EJr9x98waZPOTFONa/CEp7nIDmyjek70PaYt1rl8
         8A51JhQDnxudzWUSwueZdVLa583iCunCZn2TYAYwKpkr6j+VlO4zydEk2ydempOX9p4y
         Tv/m8MxZvw5Bxm6rLrslv/QA8RouWny55fGnK6CpMT8hqFOdcaku/HKAxrhEjvNZtzWl
         f+qg==
X-Forwarded-Encrypted: i=1; AJvYcCWMFVgaJBEPgJC7XpCiOXqHTgUMP/nMHDqct5vvivBRbhla/253vG1zn/JPVduteLE92oVznXef44Kusw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxV50ivK1jgmPxtZ/K4MCABxr2p4Jucxs0y5SYRcdf8M9KzEmHd
	fkvP0xmbJtkr0ZmdDRr/D3hCWvRoactfJmbcdGvBIL0gaoA2Vw31Pnyq8Zvh
X-Gm-Gg: ASbGncsNYEo9pm/FajmMEvJVU7Rs1Xc7SGGtPBPPqKgNPRSjXsJ0S9GW4B251cGJ6Eh
	VxYQ/J1lM1Kz4iC9SaqOqOt922JawO24Sf9WNWI3Qj4cvRTnq5LRvwFcWhl4fMJFH0PgGuYlcfO
	V7OzdjAd/iI17Ah3bjkzbM0UYDvu75O4QEg9qeR/GL9v09i/mowi4n7HPya+Cvmp3BmZbPrw2/0
	CgDdm18AZDZ/Xlcnjf2KefgWuwDWsoqRnXiVGCVzqHIVDhB90DlLrzhVNnm+XMWS0aH6i6u8UtC
	yVvm4x1ZgNcrSTuYHlD2K5nEkoIb5JmU3q3dJ0KNpcVmYuOuSy8spYKke8uVhGdYB/vKk2QLaFB
	UoLyfDptaA71nZUGikw==
X-Google-Smtp-Source: AGHT+IESWfOAZPZjRYXyFWM7rXgeYTfWmK1Qyz2OtdVTDldE0Yih5s/XsEwfNuMLE4uqx2wPorecQg==
X-Received: by 2002:a05:651c:1588:b0:308:f827:f8fa with SMTP id 38308e7fff4ca-3179ffb0522mr661101fa.27.1745437831907;
        Wed, 23 Apr 2025 12:50:31 -0700 (PDT)
Received: from buildhost.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109078423bsm18984721fa.43.2025.04.23.12.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:50:31 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: richard.henderson@linaro.org,
	mattst88@gmail.com,
	arnd@arndb.de,
	paulmck@kernel.org,
	glaubitz@physik.fu-berlin.de,
	macro@redhat.com,
	mcree@orcon.net.nz,
	ink@unseen.parts,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2] alpha: machine check handler for tsunami
Date: Wed, 23 Apr 2025 21:21:20 +0200
Message-ID: <20250423194958.30715-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is an attempt to implement a machine check handler with detailed
information on error conditions in the event of a machine check exception
on the tsunami platform. This work is inspired by how machine check
exceptions are handled on the titan family. This patch implements
processing of the logout frames that is generated in the event of a
machine check. The logout frame contains platform specific information
and is helpful in pinpointing the source that triggered the exception
or fault. Some faults are recoverable, such as a correctable ECC error,
but others may not be possible to recover from. As Alpha hardware is aging
we may see more errors due to failing hardware and proper machine check
handling can assist in detecting and diagnosing such errors. I hope that
someone finds this useful, any feedback is much appreciated.

The second version of this patch has all the changes in a single commit.
Many thanks to the guys at #gentoo-alpha for the feedback. below is a
summary of changes and added files:

Move functions tsunami_pci_clr_err_1, tsunami_pci_clr_err,
tsunami_machine_check to err_tsunami.c and enable pchip errors by seting
perrmask in tsunami_init_arch().

Populate the el_TSUNAMI_sysdata_mcheck struct with the tsunami regs
in core_tsunami.h

Add err_tsunami.h, which contains error messages and mask used to
parse data from logout frames for the tsunami platform.

Add err_tsunami.c, based on err_titan.c and implementing machine check
error handling for the tsunami/typhoon based platforms. The
tsunami specifics for processing of logout frames is according to
Tsunami/Typhoon 21272 Chipset Hardware Reference Manual and
AlphaServer ES40 Service Guide: EK-ES239-SV A01

Add err_ev6 and err_tsunami obj files for CONFIG_ALPHA_TSUNAMI
in Makefile

Add function declaration for err_tsunami.c to err_impl.h

In sys_dp264.c, install handlers for processing logout frames from SRM console on
the tsunami platform.

Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/alpha/include/asm/core_tsunami.h |   7 +
 arch/alpha/kernel/Makefile            |   2 +-
 arch/alpha/kernel/core_tsunami.c      |  37 +-
 arch/alpha/kernel/err_impl.h          |   8 +
 arch/alpha/kernel/err_tsunami.c       | 707 ++++++++++++++++++++++++++
 arch/alpha/kernel/err_tsunami.h       | 199 ++++++++
 arch/alpha/kernel/sys_dp264.c         |  17 +-
 7 files changed, 941 insertions(+), 36 deletions(-)
 create mode 100644 arch/alpha/kernel/err_tsunami.c
 create mode 100644 arch/alpha/kernel/err_tsunami.h

diff --git a/arch/alpha/include/asm/core_tsunami.h b/arch/alpha/include/asm/core_tsunami.h
index 3391e95754f2..6fb6adcb6c4f 100644
--- a/arch/alpha/include/asm/core_tsunami.h
+++ b/arch/alpha/include/asm/core_tsunami.h
@@ -283,6 +283,13 @@ union TPchipPERRMASK {
  * Data structure for handling TSUNAMI machine checks:
  */
 struct el_TSUNAMI_sysdata_mcheck {
+
+	u64 sesf;
+	u64 dir;
+	u64 misc;
+	u64 p0_perror;
+	u64 p1_perror;
+
 };
 
 
diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
index b6c862dff1f6..34c75e76ced4 100644
--- a/arch/alpha/kernel/Makefile
+++ b/arch/alpha/kernel/Makefile
@@ -54,7 +54,7 @@ obj-$(CONFIG_ALPHA_MARVEL)	+= core_marvel.o gct.o
 obj-$(CONFIG_ALPHA_MCPCIA)	+= core_mcpcia.o
 obj-$(CONFIG_ALPHA_POLARIS)	+= core_polaris.o
 obj-$(CONFIG_ALPHA_T2)		+= core_t2.o
-obj-$(CONFIG_ALPHA_TSUNAMI)	+= core_tsunami.o
+obj-$(CONFIG_ALPHA_TSUNAMI)	+= core_tsunami.o err_ev6.o err_tsunami.o
 obj-$(CONFIG_ALPHA_TITAN)	+= core_titan.o
 obj-$(CONFIG_ALPHA_WILDFIRE)	+= core_wildfire.o
 
diff --git a/arch/alpha/kernel/core_tsunami.c b/arch/alpha/kernel/core_tsunami.c
index fc1ab73f23de..7a6c1aab5f8b 100644
--- a/arch/alpha/kernel/core_tsunami.c
+++ b/arch/alpha/kernel/core_tsunami.c
@@ -346,6 +346,9 @@ tsunami_init_one_pchip(tsunami_pchip *pchip, int index)
 
 	pchip->wsba[3].csr = 0;
 
+	/* Enable pchip error */
+	pchip->perrmask.csr = 0x0fff;
+
 	/* Enable the Monster Window to make DAC pci64 possible. */
 	pchip->pctl.csr |= pctl_m_mwin;
 
@@ -448,37 +451,3 @@ tsunami_kill_arch(int mode)
 	if (TSUNAMI_cchip->csc.csr & 1L<<14)
 		tsunami_kill_one_pchip(TSUNAMI_pchip1, 1);
 }
-
-static inline void
-tsunami_pci_clr_err_1(tsunami_pchip *pchip)
-{
-	pchip->perror.csr;
-	pchip->perror.csr = 0x040;
-	mb();
-	pchip->perror.csr;
-}
-
-static inline void
-tsunami_pci_clr_err(void)
-{
-	tsunami_pci_clr_err_1(TSUNAMI_pchip0);
-
-	/* TSUNAMI and TYPHOON can have 2, but might only have 1 (DS10) */
-	if (TSUNAMI_cchip->csc.csr & 1L<<14)
-		tsunami_pci_clr_err_1(TSUNAMI_pchip1);
-}
-
-void
-tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
-{
-	/* Clear error before any reporting.  */
-	mb();
-	mb();  /* magic */
-	draina();
-	tsunami_pci_clr_err();
-	wrmces(0x7);
-	mb();
-
-	process_mcheck_info(vector, la_ptr, "TSUNAMI",
-			    mcheck_expected(smp_processor_id()));
-}
diff --git a/arch/alpha/kernel/err_impl.h b/arch/alpha/kernel/err_impl.h
index 737b958a586d..64da787203ab 100644
--- a/arch/alpha/kernel/err_impl.h
+++ b/arch/alpha/kernel/err_impl.h
@@ -86,3 +86,11 @@ extern void titan_machine_check(unsigned long, unsigned long);
 extern void titan_register_error_handlers(void);
 extern int privateer_process_logout_frame(struct el_common *, int);
 extern void privateer_machine_check(unsigned long, unsigned long);
+
+/*
+ * err_tsunami.c
+ */
+extern void tsunami_register_error_handlers(void);
+extern int tsunami_process_logout_frame(struct el_common *mchk_header, int print);
+extern void tsunami_machine_check(unsigned long vector, unsigned long la_ptr);
+extern int clipper_process_logout_frame(struct el_common *mchk_header, int print);
diff --git a/arch/alpha/kernel/err_tsunami.c b/arch/alpha/kernel/err_tsunami.c
new file mode 100644
index 000000000000..d25cb9e6db0e
--- /dev/null
+++ b/arch/alpha/kernel/err_tsunami.c
@@ -0,0 +1,707 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ *	Based on work for the TITAN platform by Jeff Wiedemeier
+ *	(Compaq Computer Corporation), Tsunami/Typhoon 21272 Chipset
+ *	Hardware Reference Manual and AlphaServer ES40 Service Guide:
+ *	EK-ES239-SV A01
+ *
+ *
+ *	Author: Magnus Lindholm (linmag7@gmail.com)
+ *
+ *	Error handling code supporting TSUNAMI systems
+ */
+
+#include <linux/init.h>
+
+#include <asm/io.h>
+#include <asm/core_tsunami.h>
+#include <asm/err_common.h>
+#include <asm/err_ev6.h>
+#include <asm/irq_regs.h>
+
+#include "err_impl.h"
+#include "proto.h"
+#include "err_tsunami.h"
+
+
+
+/*
+ * System area for a clipper 680 environmental/system management mcheck
+ */
+struct el_CLIPPER_envdata_mcheck {
+	u64 summary;    /* 0x00 */
+	u64 c_dirx;     /* 0x08 */
+	u64 smir;       /* 0x10 */
+	u64 cpuir;      /* 0x18 */
+	u64 psir;       /* 0x20 */
+	u64 fault;      /* 0x28 */
+	u64 sys_doors;  /* 0x30 */
+	u64 temp_warn;  /* 0x38 */
+	u64 fan_ctrl;   /* 0x40 */
+	u64 code;       /* 0x48 */
+	u64 reserved;   /* 0x50 */
+};
+
+static int
+tsunami_parse_p_perror(int which, u64 perror, int print)
+{
+	int cmd;
+	unsigned long addr;
+	int status = MCHK_DISPOSITION_REPORT;
+
+#ifdef CONFIG_VERBOSE_MCHECK
+	static const char * const perror_cmd[] = {
+		"Interrupt Acknowledge", "Special Cycle",
+		"I/O Read",		"I/O Write",
+		"Reserved",		"Reserved",
+		"Memory Read",		"Memory Write",
+		"Reserved",		"Reserved",
+		"Configuration Read",	"Configuration Write",
+		"Memory Read Multiple",	"Dual Address Cycle",
+		"Memory Read Line",	"Memory Write and Invalidate"
+	};
+#endif /* CONFIG_VERBOSE_MCHECK */
+
+#define TSUNAMI__PCHIP_PERROR__LOST	(1UL << 0)
+#define TSUNAMI__PCHIP_PERROR__SERR	(1UL << 1)
+#define TSUNAMI__PCHIP_PERROR__PERR	(1UL << 2)
+#define TSUNAMI__PCHIP_PERROR__DCRTO	(1UL << 3)
+#define TSUNAMI__PCHIP_PERROR__SGE	(1UL << 4)
+#define TSUNAMI__PCHIP_PERROR__APE	(1UL << 5)
+#define TSUNAMI__PCHIP_PERROR__TA	(1UL << 6)
+#define TSUNAMI__PCHIP_PERROR__RDPE	(1UL << 7)
+#define TSUNAMI__PCHIP_PERROR__NDS	(1UL << 8)
+#define TSUNAMI__PCHIP_PERROR__UECC	(1UL << 10)
+#define TSUNAMI__PCHIP_PERROR__CRE	(1UL << 11)
+
+#define TSUNAMI__PCHIP_PERROR__ERRMASK	(TSUNAMI__PCHIP_PERROR__LOST |	\
+					 TSUNAMI__PCHIP_PERROR__SERR |	\
+					 TSUNAMI__PCHIP_PERROR__PERR |	\
+					 TSUNAMI__PCHIP_PERROR__DCRTO |	\
+					 TSUNAMI__PCHIP_PERROR__SGE |	\
+					 TSUNAMI__PCHIP_PERROR__APE |	\
+					 TSUNAMI__PCHIP_PERROR__TA |	\
+					 TSUNAMI__PCHIP_PERROR__RDPE |	\
+					 TSUNAMI__PCHIP_PERROR__NDS |	\
+					 TSUNAMI__PCHIP_PERROR__UECC |	\
+					 TSUNAMI__PCHIP_PERROR__CRE)
+#define TSUNAMI__PCHIP_PERROR__DAC	(1UL << 16)
+#define TSUNAMI__PCHIP_PERROR__MWIN	(1UL << 17)
+#define TSUNAMI__PCHIP_PERROR__CMD__S	(52)
+#define TSUNAMI__PCHIP_PERROR__CMD__M	(0x0f)
+#define TSUNAMI__PCHIP_PERROR__SADDR__S	(19)
+#define TSUNAMI__PCHIP_PERROR__SADDR__M	(0x7FFFFFFF80000ul)
+#define TSUNAMI__PCHIP_PERROR__PADDR__S (18)
+#define TSUNAMI__PCHIP_PERROR__PADDR__M (0x0FFFFFFFC0000ul)
+
+
+	if (!(perror & TSUNAMI__PCHIP_PERROR__ERRMASK))
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+
+	if (perror & (TSUNAMI__PCHIP_PERROR__UECC |
+		TSUNAMI__PCHIP_PERROR__CRE))
+		addr = EXTRACT(perror, TSUNAMI__PCHIP_PERROR__SADDR) >> 16;
+	else
+		addr = EXTRACT(perror, TSUNAMI__PCHIP_PERROR__PADDR) >> 16;
+
+	cmd = EXTRACT(perror, TSUNAMI__PCHIP_PERROR__CMD);
+
+	/*
+	 * Initializing the BIOS on a video card on a bus without
+	 * a south bridge (subtractive decode agent) can result in
+	 * master aborts as the BIOS probes the capabilities of the
+	 * card. XFree86 does such initialization. If the error
+	 * is a master abort (No DevSel as PCI Master) and the command
+	 * is an I/O read or write below the address where we start
+	 * assigning PCI I/O spaces (SRM uses 0x1000), then mark the
+	 * error as dismissable so starting XFree86 doesn't result
+	 * in a series of uncorrectable errors being reported. Also
+	 * dismiss master aborts to VGA frame buffer space
+	 * (0xA0000 - 0xC0000) and legacy BIOS space (0xC0000 - 0x100000)
+	 * for the same reason.
+	 *
+	 * Also mark the error dismissible if it looks like the right
+	 * error but only the Lost bit is set. Since the BIOS initialization
+	 * can cause multiple master aborts and the error interrupt can
+	 * be handled on a different CPU than the BIOS code is run on,
+	 * it is possible for a second master abort to occur between the
+	 * time the PALcode reads PERROR and the time it writes PERROR
+	 * to acknowledge the error. If this timing happens, a second
+	 * error will be signalled after the first, and if no additional
+	 * errors occur, will look like a Lost error with no additional
+	 * errors on the same transaction as the previous error.
+	 */
+
+	/* unclear if this is correct on tsunami? maybe cmd==2 addr=0x80000
+	 * and cmd==6 and addr<1d0000
+	 */
+	if (((perror & TSUNAMI__PCHIP_PERROR__NDS) ||
+	     ((perror & TSUNAMI__PCHIP_PERROR__ERRMASK) ==
+	      TSUNAMI__PCHIP_PERROR__LOST)) &&
+	    ((((cmd & 0xE) == 2) && (addr <= 0x80000)) ||
+	     (((cmd & 0xE) == 6) && (addr >= 0xA0000) && (addr < 0x100000)))) {
+		status = MCHK_DISPOSITION_DISMISS;
+	}
+
+#ifdef CONFIG_VERBOSE_MCHECK
+	if (!print)
+		return status;
+
+	printk("%s  PChip %d PERROR: %016llx\n",
+	       err_print_prefix, which,
+	       perror);
+	if (perror & TSUNAMI__PCHIP_PERROR__NDS)
+		printk("%s    No DEVSEL as PCI Master [Master Abort]\n",
+		       err_print_prefix);
+	if (perror & TSUNAMI__PCHIP_PERROR__TA)
+		printk("%s    Target Abort\n", err_print_prefix);
+	if (perror & TSUNAMI__PCHIP_PERROR__APE)
+		printk("%s    Address Parity Error\n", err_print_prefix);
+	if (perror & TSUNAMI__PCHIP_PERROR__SGE)
+		printk("%s    Scatter-Gather Error, Invalid PTE\n",
+		       err_print_prefix);
+	if (perror & TSUNAMI__PCHIP_PERROR__DCRTO)
+		printk("%s    Delayed-Completion Retry Timeout\n",
+		       err_print_prefix);
+	if (perror & TSUNAMI__PCHIP_PERROR__PERR)
+		printk("%s    PERR Asserted\n", err_print_prefix);
+	if (perror & TSUNAMI__PCHIP_PERROR__SERR)
+		printk("%s    SERR Asserted\n", err_print_prefix);
+	if (perror & TSUNAMI__PCHIP_PERROR__LOST)
+		printk("%s    Lost Error\n", err_print_prefix);
+	printk("%s      Command: 0x%x - %s\n"
+		 "      Address: 0x%lx\n",
+	       err_print_prefix,
+	       cmd, perror_cmd[cmd],
+	       addr);
+	if (perror & TSUNAMI__PCHIP_PERROR__DAC)
+		printk("%s      Dual Address Cycle\n", err_print_prefix);
+	if (perror & TSUNAMI__PCHIP_PERROR__MWIN)
+		printk("%s      Hit in Monster Window\n", err_print_prefix);
+#endif /* CONFIG_VERBOSE_MCHECK */
+
+	return status;
+}
+
+static int
+tsunami_parse_c_misc(u64 c_misc, int print)
+{
+#ifdef CONFIG_VERBOSE_MCHECK
+	char *src;
+	int nxs = 0;
+#endif
+	int status = MCHK_DISPOSITION_REPORT;
+
+#define TSUNAMI__CCHIP_MISC__NXM          (1UL << 28)
+#define TSUNAMI__CCHIP_MISC__NXS__S       (29)
+#define TSUNAMI__CCHIP_MISC__NXS__M       (0x7)
+
+	if (!(c_misc & TSUNAMI__CCHIP_MISC__NXM))
+		return MCHK_DISPOSITION_UNKNOWN_ERROR;
+
+#ifdef CONFIG_VERBOSE_MCHECK
+	if (!print)
+		return status;
+
+	nxs = EXTRACT(c_misc, TSUNAMI__CCHIP_MISC__NXS);
+	switch (nxs) {
+	case 0: /* CPU 0 */
+	case 1: /* CPU 1 */
+	case 2: /* CPU 2 */
+	case 3: /* CPU 3 */
+		src = "CPU";
+		/* num is already the CPU number */
+		break;
+	case 4: /* Pchip 0 */
+	case 5: /* Pchip 1 */
+		src = "Pchip";
+		nxs -= 4;
+		break;
+	default:/* reserved */
+		src = "Unknown, NXS =";
+		/* leave num untouched */
+		break;
+	}
+	printk("%s    Non-existent memory access from: %s %d\n",
+	       err_print_prefix, src, nxs);
+#endif /* CONFIG_VERBOSE_MCHECK */
+
+	return status;
+}
+
+
+
+static int
+tsunami_parse_p_chip(int which, u64 perror, int print)
+{
+	int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
+
+	status |= tsunami_parse_p_perror(which, perror, print);
+	return status;
+}
+
+
+
+int
+tsunami_process_logout_frame(struct el_common *mchk_header, int print)
+{
+	struct el_TSUNAMI_sysdata_mcheck *tmchk =
+		(struct el_TSUNAMI_sysdata_mcheck *)
+		((unsigned long)mchk_header + mchk_header->sys_offset);
+	int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
+
+	status |= tsunami_parse_c_misc(tmchk->misc, print);
+	status |= tsunami_parse_p_chip(0, tmchk->p0_perror,
+				     print);
+	status |= tsunami_parse_p_chip(1, tmchk->p1_perror,
+				     print);
+
+	return status;
+}
+
+static inline void
+tsunami_pci_clr_err_1(tsunami_pchip *pchip)
+{
+	pchip->perror.csr;
+	pchip->perror.csr = 0x040;
+	mb(); /* Is a memory barrier required* */
+	pchip->perror.csr;
+}
+
+static inline void
+tsunami_pci_clr_err(void)
+{
+	tsunami_pci_clr_err_1(TSUNAMI_pchip0);
+
+	/* TSUNAMI and TYPHOON can have 2, but might only have 1 (DS10) */
+	if (TSUNAMI_cchip->csc.csr & 1L<<14)
+		tsunami_pci_clr_err_1(TSUNAMI_pchip1);
+}
+
+void
+tsunami_machine_check(unsigned long vector, unsigned long la_ptr)
+{
+	struct el_common *mchk_header = (struct el_common *)la_ptr;
+	char *reason;
+	int status = 0;
+	char *saved_err_prefix = err_print_prefix;
+	/*
+	 * Mask of Tsunami interrupt sources which are reported
+	 * as machine checks.
+	 *
+	 * 63 - CChip Error
+	 * 62 - PChip 0 H_Error
+	 * 61 - PChip 1 H_Error
+	 * 60 - PChip 0 C_Error
+	 * 59 - PChip 1 C_Error
+	 */
+#define TSUNAMI_MCHECK_INTERRUPT_MASK	0xF800000000000000UL
+
+	/*
+	 * Sync the processor
+	 */
+	mb(); /* Double memory marriers */
+	mb(); /* Special magic? */
+	draina();
+	/*
+	 * Only handle system errors here
+	 */
+	switch (mchk_header->code) {
+	/* Machine check reasons. Defined according to PALcode sources. */
+
+	case 0x80:
+		reason = "tag parity error";
+		break;
+	case 0x82:
+		reason = "tag control parity error";
+		break;
+	case 0x84:
+		reason = "generic hard error";
+		break;
+	case 0x86:
+		reason = "correctable ECC error";
+		break;
+	case 0x88:
+		reason = "uncorrectable ECC error";
+		break;
+	case 0x8A:
+		reason = "OS-specific PAL bugcheck";
+		break;
+	case 0x90:
+		reason = "callsys in kernel mode";
+		break;
+	case 0x96:
+		reason = "i-cache read retryable error";
+		break;
+	case 0x98:
+		reason = "processor detected hard error";
+		break;
+
+	/* System specific (these are for Alcor, at least): */
+	case 0x202:
+		reason = "system detected hard error";
+		break;
+	case 0x203:
+		reason = "system detected uncorrectable ECC error";
+		break;
+	case 0x204:
+		reason = "SIO SERR occurred on PCI bus";
+		break;
+	case 0x205:
+		reason = "parity error detected by core logic";
+		break;
+	case 0x206:
+		reason = "System environment error";
+		break;
+	case 0x207:
+		reason = "non-existent memory error";
+		break;
+	case 0x208:
+		reason = "MCHK_K_DCSR";
+		break;
+	case 0x209:
+		reason = "PCI SERR detected";
+		break;
+	case 0x20b:
+		reason = "PCI data parity error detected";
+		break;
+	case 0x20d:
+		reason = "PCI address parity error detected";
+		break;
+	case 0x20f:
+		reason = "PCI master abort error";
+		break;
+	case 0x211:
+		reason = "PCI target abort error";
+		break;
+	case 0x213:
+		reason = "scatter/gather PTE invalid error";
+		break;
+	case 0x215:
+		reason = "flash ROM write error";
+		break;
+	case 0x217:
+		reason = "IOA timeout detected";
+		break;
+	case 0x219:
+		reason = "IOCHK#, EISA add-in board parity or other error";
+		break;
+	case 0x21b:
+		reason = "EISA fail-safe timer timeout";
+		break;
+	case 0x21d:
+		reason = "EISA bus time-out";
+		break;
+	case 0x21f:
+		reason = "EISA software generated NMI";
+		break;
+	case 0x221:
+		reason = "unexpected ev5 IRQ[3] interrupt";
+		break;
+	default:
+		reason = "Unknown macine check code";
+		break;
+	}
+
+	/*
+	 * It's a system error, handle it here
+	 *
+	 * The PALcode has already cleared the error, so just parse it
+	 */
+
+	/*
+	 * Parse the logout frame without printing first. If the only
+	 * error(s)found are classified as "dismissable", then just
+	 * dismiss them and don't print any message
+	 */
+
+	printk("%sSystem %s Error (Vector 0x%x) reported on CPU %d:\n",
+		err_print_prefix,
+		(vector == SCB_Q_SYSERR)?"Correctable":"Uncorrectable",
+		(unsigned int)vector, (int)smp_processor_id());
+	printk("Machine check error code is 0x%x (%s)",
+		mchk_header->code, reason);
+	status = clipper_process_logout_frame(mchk_header, 0);
+	if (status != MCHK_DISPOSITION_DISMISS)	{
+		err_print_prefix = KERN_CRIT;
+		clipper_process_logout_frame(mchk_header, 1);
+	}
+	err_print_prefix = saved_err_prefix;
+
+#ifdef CONFIG_VERBOSE_MCHECK
+	if (alpha_verbose_mcheck)
+		dik_show_regs(get_irq_regs(), NULL);
+#endif /* CONFIG_VERBOSE_MCHECK */
+
+
+	/* clear perror register, is this necessary or allready
+	 * done by PALcode?
+	 * */
+
+	tsunami_pci_clr_err();
+
+	/*
+	 * Release the logout frame
+	 */
+	wrmces(0x7);
+	mb(); /* Is a memory barrier required? */
+}
+
+/*
+ * Subpacket Annotations
+ */
+
+static char *el_tsunami_pchip0_extended_annotation[] = {
+"Subpacket Header",	"P0_PCTL",	"P0_PERRMASK",
+"P0_WSBA0",		"P0_WSBA1",	"P0_WSBA2",	"P0_WSBA3",
+"P0_WSM0",		"P0_WSM1",	"P0_WSM2",	"P0_WSM3",
+"P0_TBA0",		"P0_TBA1",	"P0_TBA2",	"P0_TBA3"
+};
+
+static char *el_tsunami_pchip1_extended_annotation[] = {
+"Subpacket Header",	"P1_PCTL",	"P1_PERRMASK",
+"P1_WSBA0",		"P1_WSBA1",	"P1_WSBA2",	"P1_WSBA3",
+"P1_WSM0",		"P1_WSM1",	"P1_WSM2",	"P1_WSM3",
+"P1_TBA0",		"P1_TBA1",	"P1_TBA2",	"P1_TBA3"
+};
+
+
+#define EL_TYPE__REGATTA__TSUNAMI_PCHIP0_EXTENDED	6
+#define EL_TYPE__REGATTA__TSUNAMI_PCHIP1_EXTENDED	7
+
+static struct el_subpacket_annotation el_tsunami_annotations[] = {
+	SUBPACKET_ANNOTATION(EL_CLASS__REGATTA_FAMILY,
+			     EL_TYPE__REGATTA__TSUNAMI_PCHIP0_EXTENDED,
+			     1,
+			     "Tsunami PChip 0 Extended Frame",
+			     el_tsunami_pchip0_extended_annotation),
+	SUBPACKET_ANNOTATION(EL_CLASS__REGATTA_FAMILY,
+			     EL_TYPE__REGATTA__TSUNAMI_PCHIP1_EXTENDED,
+			     1,
+			     "Tsunami PChip 1 Extended Frame",
+			     el_tsunami_pchip1_extended_annotation),
+	SUBPACKET_ANNOTATION(EL_CLASS__REGATTA_FAMILY,
+			     EL_TYPE__TERMINATION__TERMINATION,
+			     1,
+			     "Termination Subpacket",
+			     NULL)
+};
+
+static struct el_subpacket *
+el_process_regatta_subpacket(struct el_subpacket *header)
+{
+	int status;
+
+	if (header->class != EL_CLASS__REGATTA_FAMILY) {
+		printk("%s  ** Unexpected header CLASS %d TYPE %d, aborting\n",
+			err_print_prefix,
+			header->class, header->type);
+		return NULL;
+	}
+
+	switch (header->type) {
+	case EL_TYPE__REGATTA__PROCESSOR_ERROR_FRAME:
+	case EL_TYPE__REGATTA__SYSTEM_ERROR_FRAME:
+	case EL_TYPE__REGATTA__ENVIRONMENTAL_FRAME:
+	case EL_TYPE__REGATTA__PROCESSOR_DBL_ERROR_HALT:
+	case EL_TYPE__REGATTA__SYSTEM_DBL_ERROR_HALT:
+		printk("%s  ** Occurred on CPU %d:\n",
+		       err_print_prefix,
+		       (int)header->by_type.regatta_frame.cpuid);
+		status = clipper_process_logout_frame((struct el_common *)
+			header->by_type.regatta_frame.data_start, 0);
+		if (status != MCHK_DISPOSITION_DISMISS)
+			clipper_process_logout_frame((struct el_common *)
+			header->by_type.regatta_frame.data_start, 1);
+		break;
+	default:
+		printk("%s  ** REGATTA TYPE %d SUBPACKET\n",
+		       err_print_prefix, header->type);
+		el_annotate_subpacket(header);
+		break;
+	}
+
+
+	return (struct el_subpacket *)((unsigned long)header + header->length);
+}
+
+static struct el_subpacket_handler tsunami_subpacket_handler =
+	SUBPACKET_HANDLER_INIT(EL_CLASS__REGATTA_FAMILY,
+				el_process_regatta_subpacket);
+
+
+
+void __init
+tsunami_register_error_handlers(void)
+{
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(el_tsunami_annotations); i++)
+		cdl_register_subpacket_annotation(
+		&el_tsunami_annotations[i]);
+
+	cdl_register_subpacket_handler(&tsunami_subpacket_handler);
+
+	ev6_register_error_handlers();
+}
+
+/*
+ * Clipper
+ */
+static int
+clipper_process_680_reg(char **msg, unsigned long reg, unsigned long mask
+			, int length)
+{
+	int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
+
+	for (int i = 0; i < length; i++) {
+		if (reg&mask&(1L<<i))
+			printk("%s %s\n", err_print_prefix, msg[i]);
+	}
+	if (reg&mask)
+		status = MCHK_DISPOSITION_REPORT;
+	return status;
+}
+
+static int
+clipper_process_680_frame(struct el_common *mchk_header, int print)
+{
+	int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
+	struct el_CLIPPER_envdata_mcheck *emchk =
+		(struct el_CLIPPER_envdata_mcheck *)
+		((unsigned long)mchk_header + mchk_header->sys_offset);
+	if (mchk_header->code != 0x206)
+		printk("Unknown machine check code=%x\n", mchk_header->code);
+
+
+	/* Process erros in QW1SMIR */
+	status |= clipper_process_680_reg(CLIPPER_EnvQW1SMIR,
+				emchk->smir,
+				CLIPPER_ENV_SMIR_MASK, 8);
+
+	/* Process erros in QW2CPUIR */
+	status |= clipper_process_680_reg(CLIPPER_EnvQW2CPUIR,
+				emchk->cpuir,
+				CLIPPER_ENV_CPUIR_MASK, 8);
+
+	/* Process errors in QW3PSIR */
+	status |= clipper_process_680_reg(CLIPPER_EnvQW3PSIR,
+				emchk->psir,
+				CLIPPER_ENV_PSIR_ERR_MASK, 8);
+
+	/* Process enables PSU in QW3PSIR */
+	status |= clipper_process_680_reg(CLIPPER_EnvQW3PSIR, emchk->psir,
+				CLIPPER_ENV_PSIR_ENA_MASK, 8);
+
+	/* Process errors in QW4LM78ISR */
+	status |= clipper_process_680_reg(CLIPPER_EnvQW4LM78ISR,
+				emchk->fault,
+				CLIPPER_ENV_LM78ISR_MASK, 48);
+
+	/* Process errors in QW5DOORS */
+	status |= clipper_process_680_reg(CLIPPER_EnvQW5DOOR,
+				emchk->sys_doors,
+				CLIPPER_ENV_DOORS_MASK, 8);
+
+	/* Process errors in QW6TEMP */
+	status |= clipper_process_680_reg(CLIPPER_EnvQW6TEMP,
+				emchk->temp_warn,
+				CLIPPER_ENV_TEMP_MASK, 8);
+
+	/* Process erros in QW7FAN */
+	status |= clipper_process_680_reg(CLIPPER_EnvQW7FAN,
+				emchk->temp_warn,
+				CLIPPER_ENV_FAN_MASK, 12);
+
+	/* Process erros in QW8POWER */
+	status |= clipper_process_680_reg(CLIPPER_EnvQW8POWER,
+				emchk->code,
+				CLIPPER_ENV_POWER_MASK, 24);
+
+	return status;
+}
+
+int
+clipper_process_logout_frame(struct el_common *mchk_header, int print)
+{
+	struct el_common_EV6_mcheck *ev6mchk =
+		(struct el_common_EV6_mcheck *)mchk_header;
+	int status = MCHK_DISPOSITION_UNKNOWN_ERROR;
+
+	/*
+	 * Machine check codes
+	 */
+#define TSUNAMI_MCHK__CORR_ECC			0x86	/* 630 */
+#define TSUNAMI_MCHK__DC_TAG_PERR		0x9E	/* 630 */
+#define TSUNAMI_MCHK__PAL_BUGCHECK		0x8E	/* 670 */
+#define TSUNAMI_MCHK__OS_BUGCHECK		0x90	/* 670 */
+#define TSUNAMI_MCHK__PROC_HRD_ERR		0x98	/* 670 */
+#define TSUNAMI_MCHK__ISTREAM_CMOV_PRX		0xA0	/* 670 */
+#define TSUNAMI_MCHK__ISTREAM_CMOV_FLT		0xA2	/* 670 */
+#define TSUNAMI_MCHK__SYS_HRD_ERR		0x202	/* 660 */
+#define TSUNAMI_MCHK__SYS_CORR_ERR		0x204	/* 620 */
+#define TSUNAMI_MCHK__SYS_ENVIRON		0x206	/* 680 */
+
+	switch (ev6mchk->MCHK_Code) {
+	/*
+	 * Vector 630 - Processor, Correctable
+	 */
+	case TSUNAMI_MCHK__CORR_ECC:
+	case TSUNAMI_MCHK__DC_TAG_PERR:
+	/*
+	 * Fall through to vector 670 for processing...
+	 */
+
+	/*
+	 * Vector 670 - Processor, Uncorrectable
+	 */
+	case TSUNAMI_MCHK__PAL_BUGCHECK:
+	case TSUNAMI_MCHK__OS_BUGCHECK:
+	case TSUNAMI_MCHK__PROC_HRD_ERR:
+	case TSUNAMI_MCHK__ISTREAM_CMOV_PRX:
+	case TSUNAMI_MCHK__ISTREAM_CMOV_FLT:
+		status = ev6_process_logout_frame(mchk_header, 0);
+		if (status != MCHK_DISPOSITION_UNKNOWN_ERROR)
+			status = ev6_process_logout_frame(mchk_header,
+				print);
+		break;
+
+	/*
+	 * Vector 620 - System, Correctable
+	 */
+	case TSUNAMI_MCHK__SYS_CORR_ERR:
+		/*
+		 * Fall through to vector 660 for processing...
+		 */
+	/*
+	 * Vector 660 - System, Uncorrectable
+	 */
+	case TSUNAMI_MCHK__SYS_HRD_ERR:
+		status |= tsunami_process_logout_frame(mchk_header,
+			print);
+		break;
+
+	/*
+	 * Vector 680 - System, Environmental
+	 */
+	case TSUNAMI_MCHK__SYS_ENVIRON:	/* System, Environmental */
+		status |= clipper_process_680_frame(mchk_header,
+			print);
+		break;
+
+	/*
+	 * Unknown
+	 */
+	default:
+		status |= MCHK_DISPOSITION_REPORT;
+		if (print) {
+			printk("%s** Unknown Error, frame follows\n",
+				err_print_prefix);
+			mchk_dump_logout_frame(mchk_header);
+		}
+
+	}
+
+	return status;
+}
diff --git a/arch/alpha/kernel/err_tsunami.h b/arch/alpha/kernel/err_tsunami.h
new file mode 100644
index 000000000000..c20cd72f6a53
--- /dev/null
+++ b/arch/alpha/kernel/err_tsunami.h
@@ -0,0 +1,199 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *
+ *	Author:	Magnus Lindholm linmag7@gmail.com
+ *
+ *	Contains declarations and macros to support Alpha error handling
+ *      and error messages for the tsunami/typhoon based platforms
+ */
+
+static char *CLIPPER_EnvQW1SMIR[] = {
+"System Power Supply state change detected",
+"OCP or RMC halt detected",
+"Sys_DC_Notok failure detected",
+"",
+"System temperature over 50 degrees C failure",
+"PCI Bus #0 is in reset",
+"PCI Bus #1 is in reset",
+"System is being reset"
+};
+
+#define CLIPPER_ENV_QW1SMIR_POWER_MASK	1L
+#define CLIPPER_EVN_QW1SMIR_RMC_MASK	(1L<<1)
+#define CLIPPER_EVN_QW1SMIR_DC_MASK	(1L<<2)
+#define CLIPPER_EVN_QW1SMIR_TEMP_MASK	(1L<<4)
+#define CLIPPER_ENV_SMIR_MASK (CLIPPER_ENV_QW1SMIR_POWER_MASK |	\
+				CLIPPER_EVN_QW1SMIR_RMC_MASK |	\
+				CLIPPER_EVN_QW1SMIR_DC_MASK |	\
+				CLIPPER_EVN_QW1SMIR_TEMP_MASK)
+static char *CLIPPER_EnvQW2CPUIR[] = {
+"CPU0 regulator is enabled",
+"CPU1 regulator is enabled",
+"CPU2 regulator is enabled",
+"CPU3 regulator is enabled",
+"CPU0 regulator or configuration sequence fail",
+"CPU1 regulator or configuration sequence fail",
+"CPU2 regulator or configuration sequence fail",
+"CPU3 regulator or configuration sequence fail"
+};
+
+#define CLIPPER_ENV_QW2CPUIR_CPU0_ENA_MASK	1L
+#define CLIPPER_ENV_QW2CPUIR_CPU1_ENA_MASK	(1L<<1)
+#define CLIPPER_ENV_QW2CPUIR_CPU2_ENA_MASK	(1L<<2)
+#define CLIPPER_ENV_QW2CPUIR_CPU3_ENA_MASK	(1L<<3)
+#define CLIPPER_ENV_QW2CPUIR_CPU0_FAIL_MASK	(1L<<4)
+#define CLIPPER_ENV_QW2CPUIR_CPU1_FAIL_MASK	(1L<<5)
+#define CLIPPER_ENV_QW2CPUIR_CPU2_FAIL_MASK	(1L<<6)
+#define CLIPPER_ENV_QW2CPUIR_CPU3_FAIL_MASK	(1L<<7)
+#define CLIPPER_ENV_CPUIR_MASK	(CLIPPER_ENV_QW2CPUIR_CPU0_FAIL_MASK |	\
+				CLIPPER_ENV_QW2CPUIR_CPU1_FAIL_MASK |	\
+				CLIPPER_ENV_QW2CPUIR_CPU2_FAIL_MASK |	\
+				CLIPPER_ENV_QW2CPUIR_CPU3_FAIL_MASK)
+
+
+static char *CLIPPER_EnvQW3PSIR[] = {
+"Power Supply 0 is enabled",
+"Power Supply 1 is enabled",
+"Power Supply 2 is enabled",
+"",
+"Power Supply 0 was enabled but failed",
+"Power Supply 1 was enabled but failed",
+"Power Supply 2 was enabled but failed"
+};
+
+#define CLIPPER_PSIR_PSU0_ENA_MASK	1L
+#define CLIPPER_PSIR_PSU1_ENA_MASK	(1L<<1)
+#define CLIPPER_PSIR_PSU2_ENA_MASK	(1L<<2)
+#define CLIPPER_PSIR_PSU0_FAIL_MASK	(1L<<4)
+#define CLIPPER_PSIR_PSU1_FAIL_MASK	(1L<<5)
+#define CLIPPER_PSIR_PSU2_FAIL_MASK	(1L<<6)
+#define CLIPPER_ENV_PSIR_ENA_MASK (CLIPPER_PSIR_PSU0_ENA_MASK	|	\
+				CLIPPER_PSIR_PSU1_ENA_MASK	|	\
+				CLIPPER_PSIR_PSU2_ENA_MASK)
+#define CLIPPER_ENV_PSIR_ERR_MASK (CLIPPER_PSIR_PSU0_FAIL_MASK	|	\
+				CLIPPER_PSIR_PSU1_FAIL_MASK	|	\
+				CLIPPER_PSIR_PSU2_FAIL_MASK)
+
+static char *CLIPPER_EnvQW4LM78ISR[] = {
+"PS +3.3V out of tolerance",
+"PS +5V out of tolerance",
+"PS +12V out of tolerance",
+"VTERM out of tolerance",
+"Temperature zone 0 (PCI Backplane slots 1-3 area) over limit failure",
+"LM75 CPU0-3 Temperature over limit failure",
+"System Fan 1 failure",
+"System Fan 2 failure",
+"CTERM out of tolerance",
+"",
+"-12V out of tolerance",
+"",
+"",
+"",
+"",
+"",
+"CPU0_VCORE +2V out of tolerance",
+"CPU0_VIO +1.5V out of tolerance",
+"CPU1_VCORE +2V out of tolerance",
+"CPU1_VIO +1.5V out of tolerance",
+"Temperature zone 1 (PCI Backplane slots 7-10 area) over limit failure",
+"",
+"System Fan 4 failure",
+"System Fan 5 failure",
+"",
+"",
+"",
+"",
+"",
+"",
+"",
+"",
+"CPU2_VCORE +2V out of tolerance",
+"CPU2_VIO +1.5V out of tolerance",
+"CPU3_VCORE +2V out of tolerance",
+"CPU3_VIO +1.5V out of tolerance",
+"Temperature zone 2 (PCI Backplane slots 4-6 area) over limit failure",
+"",
+"System Fan 3 failure",
+"System Fan 6 failure",
+"",
+"",
+"Power supply 3.3V rail above high amperage warning",
+"Power supply 5.0V rail above high amperage warning",
+"Power supply 12V rail above high amperage warning",
+"Power supply high temperature warning",
+"Power supply AC input low limit warning",
+"Power supply AC input high limit warning"
+};
+
+#define CLIPPER_ENV_LM78ISR_MASK	0xFCDF00DF05FFL
+
+static char *CLIPPER_EnvQW5DOOR[] = {
+"",
+"Set = System CPU door is open",
+"Set = System Fan door is open",
+"Set = System PCI door is open",
+"",
+"Set = System CPU door is closed",
+"Set = System Fan door is closed",
+"Set = System PCI door is closed"
+};
+
+#define CLIPPER_ENV_DOORS_MASK	 0xEEL
+
+static char *CLIPPER_EnvQW6TEMP[] = {
+"CPU0 temperature warning fault has occurred",
+"CPU1 temperature warning fault has occurred",
+"CPU2 temperature warning fault has occurred",
+"CPU3 temperature warning fault has occurred",
+"System temperature zone 0 warning fault has occurred",
+"System temperature zone 1 warning fault has occurred",
+"System temperature zone 2 warning fault has occurred"
+};
+
+#define CLIPPER_ENV_TEMP_MASK	0xFFL
+
+static char *CLIPPER_EnvQW7FAN[] = {
+"System Fan 1 is not responding to RMC Commands",
+"System Fan 2 is not responding to RMC Commands",
+"System Fan 3 is not responding to RMC Commands",
+"System Fan 4 is not responding to RMC Commands",
+"System Fan 5 is not responding to RMC Commands",
+"System Fan 6 is not responding to RMC Commands",
+"",
+"",
+"CPU fans 5/6 at maximum speed",
+"CPU fans 5/6 reduced speed from maximum",
+"PCI fans 1-4 at maximum speed",
+"PCI fans 1-4 reduced speed from maximum"
+};
+
+#define CLIPPER_ENV_FAN_MASK	0xF3FL
+
+static char *CLIPPER_EnvQW8POWER[] = {
+"Power Supply 0 AC input fail",
+"Power Supply 1 AC input fail",
+"Power Supply 2 AC input fail",
+"",
+"",
+"",
+"",
+"",
+"Power Supply 0 DC fail",
+"Power Supply 1 DC fail",
+"Power Supply 2 DC fail",
+"Vterm fail",
+"CPU0 Regulator fail",
+"CPU1 Regulator fail",
+"CPU2 Regulator fail",
+"CPU3 Regulator fail",
+"",
+"No CPU in system motherboard CPU slot 0",
+"Invalid CPU SROM voltage setting or checksum",
+"TIG load initialization or sequence fail",
+"Over temperature fail",
+"CPU door open fail",
+"System fan 5 (CPU backup fan) fail",
+"Cterm fail"
+};
+
+#define CLIPPER_ENV_POWER_MASK	0xFEFF07L
diff --git a/arch/alpha/kernel/sys_dp264.c b/arch/alpha/kernel/sys_dp264.c
index 9fb445d7dca5..bb1f5f05825b 100644
--- a/arch/alpha/kernel/sys_dp264.c
+++ b/arch/alpha/kernel/sys_dp264.c
@@ -34,7 +34,7 @@
 #include "irq_impl.h"
 #include "pci_impl.h"
 #include "machvec_impl.h"
-
+#include "err_impl.h"
 
 /* Note mask bit is true for ENABLED irqs.  */
 static unsigned long cached_irq_mask;
@@ -282,6 +282,15 @@ dp264_init_irq(void)
 	init_i8259a_irqs();
 	init_tsunami_irqs(&dp264_irq_type, 16, 47);
 }
+static void __init
+tsunami_late_init(void)
+{
+	tsunami_register_error_handlers();
+	/*
+	 * Check if the console left us any error logs.
+	 */
+	cdl_check_console_data_log();
+}
 
 static void __init
 clipper_init_irq(void)
@@ -521,6 +530,12 @@ monet_init_pci(void)
 static void __init
 clipper_init_pci(void)
 {
+/*
+ * This isn't really the right place, but there's some init
+ * that needs to be done after everything is basically up.
+ */
+	tsunami_late_init();
+
 	common_init_pci();
 	locate_and_init_vga(NULL);
 }
-- 
2.45.3

