Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FD2252906
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200237; cv=none; b=SepIEs5P8PXbDCh0fHaevFG7MeM/jgEAHLuZFF4L2sysMi1krSXDXAjLue6bO5AKHxT2i+qEbZ5PkpSFn0UlgzTccd6G9sARpHRoeF0kRiwkf/+UlFrgKdbDexhVGyn4q23d1NRMh+G108qyUBQiRTbGEXGRy39x3lKrF78TCmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200237; c=relaxed/simple;
	bh=f1cUq1UU1acaXrytvJEwuasE5bEnYhx5cwjqMWLkEMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZks+DQo2hy58ermjFe+B3dJ1nUa7I+ksVoIyxpCx/eITQvca3M4h5rrkY/5tSkgibTJIMakpyUhqdVGGCOQra8SxIr4qSkn/MDHXE8ViwxnN1FzCi4kA3bB/IfZJivITpbjezTsFHnDPGUY0HxNCcPMXQBIxNAylm8y/0v18J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5PR983c; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5PR983c"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361815b96cso30073335e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200232; x=1739805032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl2nJlOCFZTAIC1OoXJAI/OcnqLnmeZQqMPsY2a6JMo=;
        b=J5PR983cFvWpJiLCK4xFR/JpR3jI6+8dl3c5Mlp+B58JJfK+bMW6CjBJln6oxBUyfH
         DrwBNPCRf4XvwKiIqQ2z5GtcToyPsc20nuApREzRREW3lpYBdDZabVH3oDjDZZonwaIy
         PBELRHweUfaH7nyqeXmPlhswb9UiPlf+VBAU8yW5oj5m0OYt8SxUOc3zWTXMBYDHWj82
         P5O9Y7UNEXtGP67YCn0eddmoFZTTQ02q2U/5YCMtUwWrUDDB7zllQekQwPRe0eWT1cDo
         pZSRJ1/gP1TmlMqzLLcODegSCaf8k/exM4saCRPtVdUCZDQ/cBaOWVimg2FucZ0J6dLu
         4oKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200232; x=1739805032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xl2nJlOCFZTAIC1OoXJAI/OcnqLnmeZQqMPsY2a6JMo=;
        b=G5anqj0oJCHE2B0CAOYxobuRIYi0/jm8Psbslwof5V/YhfJMTkJGl9l3ZKwbJuoVDH
         i1UZksY/rV9FO0/g+D7gjEbdzJ++mPwkT/1jmwSvHCr1Rny5gjUtgC1Kr8ouHmyRudq2
         46ELrbQxyZz8WCqgdqcsyYVCIm/AWzpe8N8uqVNAOaX90QQwIoLXCX1nxz6fbTH0GoMt
         WuXnWXvCCQYnC+1azuTrgcRXWdi2uOz3sf4LcSI1ChXUu8+OgYS1qPWZvJrq1j6AbWj1
         1hbpqahhicaJx9ReuLoDbvbOMHC7jew32jVltFWbnT7Pa98Oxcuw9Mo95Kom8KJDeZ38
         VfaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBCH+59eS7i85bc8e5Tv1O+eNFlr5l9c8OoPuyooFV0aFSqDCbzLVDA/nbjKFzYy59Zhwl5Uz5KEEoV10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGY8Hy/C5yGQSlQ6URhaDPaGa1Mva29CkiFlM9JOry0tKFbf5E
	XmJT3GM96R3EjWcYybXzjgfFpTjpw/pyUdkssFlFeC4zijq+BduO
X-Gm-Gg: ASbGncsBpMsNckqSOk7BVLrcRPKwWLjTZdpiInyJCoQcsc4rmXdN67f6RAl0cb8xXZz
	hoIjz28DZnMwb5L6PjZjxoXaKst8WmqU8fQxFwhpOPv5s8kqWBggLBYEZm5Bdn+VAzszd5HDOhj
	F2h413c0MnAGLKRFeXseNg1WteH+KwhXyeXbcA0Ua/iEHuGe0WNVSCxvvwOzkFyOKs1CNnuY/3X
	A8KNvuLNHm/iLnGpUvDhlt4qtHXK9NR3en6bdv6808a9vGnc1MkRuItT6/Xkrz0klAkCgRRudhR
	FZsrwq+OmkTCNaKPjk5A3NV4cjOdIjqzaLECYEXzmibOUDpNQ/Y=
X-Google-Smtp-Source: AGHT+IEHu5etgn+A71oVAkdO4/2R9sTH3Y7763cMKXHK3U/jOMtFLHoAyQ/xNkUp4HQgu48VhWZ9CQ==
X-Received: by 2002:a5d:5f4a:0:b0:38d:cfff:c0d9 with SMTP id ffacd0b85a97d-38dcfffc217mr9125602f8f.39.1739200232299;
        Mon, 10 Feb 2025 07:10:32 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8881sm146834645e9.28.2025.02.10.07.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:10:30 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/2] staging;gpib: Use Kconfig PCMCIA compilation symbol
Date: Mon, 10 Feb 2025 16:10:21 +0100
Message-ID: <20250210151022.4358-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151022.4358-1-dpenkler@gmail.com>
References: <20250210151022.4358-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drivers supporting the PCMCIA bus were using an intermediate
symbol GPIB_PCMCIA for compiling optional PCMCIA support.
This symbol is no longer needed for the in-tree drivers as the
Kconfig symbol is available.

Use the Kconfig symbol CONFIG_GPIB_PCMCIA directly for conditional
compilation of PCMCIA support.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c        | 10 +++++-----
 drivers/staging/gpib/ines/ines_gpib.c       |  8 ++++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 12 ++++++------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 381c508f62eb..7785d674f397 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1111,7 +1111,7 @@ static struct pci_driver cb7210_pci_driver = {
  *  pcmcia skeleton example (presumably David Hinds)
  ***************************************************************************/
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
@@ -1501,7 +1501,7 @@ static void cb_pcmcia_detach(gpib_board_t *board)
 	cb7210_generic_detach(board);
 }
 
-#endif /* GPIB_PCMCIA */
+#endif /* CONFIG_GPIB_PCMCIA */
 
 static int __init cb7210_init_module(void)
 {
@@ -1549,7 +1549,7 @@ static int __init cb7210_init_module(void)
 		goto err_isa_unaccel;
 	}
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	ret = gpib_register_driver(&cb_pcmcia_interface, THIS_MODULE);
 	if (ret) {
 		pr_err("cb7210: gpib_register_driver failed: error = %d\n", ret);
@@ -1577,7 +1577,7 @@ static int __init cb7210_init_module(void)
 
 	return 0;
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 err_pcmcia_driver:
 	gpib_unregister_driver(&cb_pcmcia_unaccel_interface);
 err_pcmcia_unaccel:
@@ -1611,7 +1611,7 @@ static void __exit cb7210_exit_module(void)
 	gpib_unregister_driver(&cb_pci_unaccel_interface);
 	gpib_unregister_driver(&cb_isa_accel_interface);
 	gpib_unregister_driver(&cb_isa_unaccel_interface);
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	gpib_unregister_driver(&cb_pcmcia_interface);
 	gpib_unregister_driver(&cb_pcmcia_accel_interface);
 	gpib_unregister_driver(&cb_pcmcia_unaccel_interface);
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 22a05a287bce..73dafbe68acb 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -977,7 +977,7 @@ static struct pci_driver ines_pci_driver = {
 	.probe = &ines_pci_probe
 };
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
@@ -1410,7 +1410,7 @@ void ines_pcmcia_detach(gpib_board_t *board)
 	ines_free_private(board);
 }
 
-#endif /* GPIB_PCMCIA */
+#endif /* CONFIG_GPIB_PCMCIA */
 
 static int __init ines_init_module(void)
 {
@@ -1446,7 +1446,7 @@ static int __init ines_init_module(void)
 		goto err_isa;
 	}
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	ret = gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
 	if (ret) {
 		pr_err("ines_gpib: gpib_register_driver failed: error = %d\n", ret);
@@ -1474,7 +1474,7 @@ static int __init ines_init_module(void)
 
 	return 0;
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 err_pcmcia_driver:
 	gpib_unregister_driver(&ines_pcmcia_accel_interface);
 err_pcmcia_accel:
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 2e1c3cbebaca..3118fe7613f6 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -1396,7 +1396,7 @@ static const struct pnp_device_id tnt4882_pnp_table[] = {
 };
 MODULE_DEVICE_TABLE(pnp, tnt4882_pnp_table);
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 static gpib_interface_t ni_pcmcia_interface;
 static gpib_interface_t ni_pcmcia_accel_interface;
 static int __init init_ni_gpib_cs(void);
@@ -1461,7 +1461,7 @@ static int __init tnt4882_init_module(void)
 		goto err_pci_accel;
 	}
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	result = gpib_register_driver(&ni_pcmcia_interface, THIS_MODULE);
 	if (result) {
 		pr_err("tnt4882_gpib: gpib_register_driver failed: error = %d\n", result);
@@ -1486,7 +1486,7 @@ static int __init tnt4882_init_module(void)
 
 	return 0;
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 err_pcmcia_driver:
 	gpib_unregister_driver(&ni_pcmcia_accel_interface);
 err_pcmcia_accel:
@@ -1524,7 +1524,7 @@ static void __exit tnt4882_exit_module(void)
 	gpib_unregister_driver(&ni_nec_isa_accel_interface);
 	gpib_unregister_driver(&ni_pci_interface);
 	gpib_unregister_driver(&ni_pci_accel_interface);
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 	gpib_unregister_driver(&ni_pcmcia_interface);
 	gpib_unregister_driver(&ni_pcmcia_accel_interface);
 	exit_ni_gpib_cs();
@@ -1535,7 +1535,7 @@ static void __exit tnt4882_exit_module(void)
 	pci_unregister_driver(&tnt4882_pci_driver);
 }
 
-#ifdef GPIB_PCMCIA
+#ifdef CONFIG_GPIB_PCMCIA
 
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
@@ -1889,7 +1889,7 @@ static gpib_interface_t ni_pcmcia_accel_interface = {
 	.return_to_local = tnt4882_return_to_local,
 };
 
-#endif	// GPIB_PCMCIA
+#endif	// CONFIG_GPIB_PCMCIA
 
 module_init(tnt4882_init_module);
 module_exit(tnt4882_exit_module);
-- 
2.48.1

