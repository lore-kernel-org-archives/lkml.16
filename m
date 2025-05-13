Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9C6212FA2
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747176509; cv=none; b=Vz2+nZJI/KECRaWEaLmafQ2MRfGn/vQetciL1fnwJFUogS3GCRw5V0lmmsUu9zjvp2nbWyYf6TdWk7dbYNeJU2AKuLrSgHQiLwkOsw+TAQM3sv2y6uQ6bk2PPLwTnEBBsWkJpwdEqQPQ1uzRsD2x5qLh6d0aaAt+27zG9F7ni5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747176509; c=relaxed/simple;
	bh=U601SMudynNSsZjIuOIkDQ3ktITnRD+m5nt3VRuNJf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WoEG+FNY1Gr/MsgXptmf5zSAYkQEAxec64qis1HuUrcHNeuHiv7Wtij1Vc7Jl4ljBBcPhVMNlDkSVZaCX7JcULCvsLZuiDaGsF+LHTBOd/RlSGAYw671Q+J+/UamIGTIE/0U+1FKFDa11gmY7GYvEvqP4XbTk1UZPZ7pKZSPBIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J/3hxZiC; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J/3hxZiC"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-740b3a18e26so5431856b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747176507; x=1747781307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkLyMTbGlJXb7d4nD6pFtOPSL5QHuutzi+7fasvDY2o=;
        b=J/3hxZiCz7gpBArqzrYVWC0eiAo24Q4XsK21X5/lrnjx39N4SbbcQRyY4PMnxkMlZs
         940SRggrJdgjreN+t1J0qVv4ZAptwvTc9eNVFS20qJe868TxrnBJPSeioCQYX0HiNxd8
         tcBqTXR1ZBjbidQt0rWkwmLLbWb0e6ynv/GUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747176507; x=1747781307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkLyMTbGlJXb7d4nD6pFtOPSL5QHuutzi+7fasvDY2o=;
        b=bbwV+HXX9sEwgemj3UlYoKH/3K/zWBngOVgs3rQvZRWGW4I5bCzAnbbqMWxBrHCNAK
         0tLf/jdT94dZ2FBwFxaiV2gdba7X3dmUIlUbsZSlVncqeLVxxW/Sbj9otGLVmuvh4+xt
         biEIJurun4vezd33i8mAeKKN4oW9scXpoRycYb9KuDsYzyYC1/4IShuS1kZH0U0vxT8v
         gNs5dEBpC3AxFUBtzrM1sjdUiMklcvwJYvGYjUk4n37htRR8X4f3tT/FR74whAGI1QWs
         3ka6xRjF9C0rwZnYUHszOut4xhMs2VD4UtySfU8sMybaoYAUFAstsbOaY4SUY+pfu++N
         r0lA==
X-Forwarded-Encrypted: i=1; AJvYcCXvGwHnrf8Xc1GB7Ip+tnBu2C9Hp5MCbvNOSB6OjhSZ2ztDv+mVcSXOxp2JWe5BBeMmiS3s0k6h9dQ/ck4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjpOzNrHem8C+2ybLRzGeFLNUAv/t+WhMMag5sgzcwpwfcPsr
	qk2/9NLV3CSv3puf5WWYcMMA2gTipcJZqq2EBugX9zavFhNe8+jdjM5qJBEMkkDIlBFji+w+iGk
	=
X-Gm-Gg: ASbGncv+A7jX1RDYE29zcQDFV8zlOLL8bnnR+IUTC4ba0n7/ptLt35HFwf+aTSnZpq3
	2ij/Uy2TfSZRG4qZBGNOi3qcEHfh39X4qaXmvc/h9uqJpAM2hf0hQinY/ZeHnvAuXC7mqjB3LET
	3siFPoncFHd2HQZnvZgzgPCQJn54b8/oFxLIw5xz+21OLJK8Qs9YcY2x5qdWwzzbtgyk+44rvGf
	UsTvUA4xVzP3Ahs8FFtX/R9Rv+FZC+9XLEd8RewUX920SP0XHwEE+FUQBMT8iXoOsHk3CcmMMoi
	GZaOrVQQ8BXJOgWQm75iGv3UdA0/isf57Kzu1hTwqRW4gxV93C8EwulOks7aAEWz+dOLw5MyoXi
	N+iw/wbuq4t0qpg==
X-Google-Smtp-Source: AGHT+IHblR3/2uQG5jNf6U7wWEdXn5/JlkesMPjg6q8xTPdedpMsJPq8+hDnn83rmw7qGoVjmmbNmg==
X-Received: by 2002:a05:6a00:b85:b0:739:3f55:b23f with SMTP id d2e1a72fcca58-742892cd549mr1629461b3a.14.1747176507038;
        Tue, 13 May 2025 15:48:27 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:b0a6:1dea:5306:7727])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74237a1149asm8212317b3a.118.2025.05.13.15.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 15:48:26 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Douglas Anderson <dianders@chromium.org>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/2] genirq: Retain disable depth across irq shutdown/startup
Date: Tue, 13 May 2025 15:42:38 -0700
Message-ID: <20250513224402.864767-3-briannorris@chromium.org>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
In-Reply-To: <20250513224402.864767-1-briannorris@chromium.org>
References: <20250513224402.864767-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an IRQ is shut down and restarted while it was already disabled, its
depth is clobbered and reset to 0. This can produce unexpected results,
as:
1) the consuming driver probably expected it to stay disabled and
2) the kernel starts complaining about "Unbalanced enable for IRQ N" the
   next time the consumer calls enable_irq()

This problem can occur especially for affinity-managed IRQs that are
already disabled before CPU hotplug. I captured these failures in kunit
tests irq_shutdown_depth_test and irq_cpuhotplug_test.

Perform a naive increment/decrement instead of clobbering the count to
0/1.

Tested via kunit:

  tools/testing/kunit/kunit.py run 'irq_test_cases*' --arch x86_64 --qemu_args '-smp 2'

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
I'm not very confident this is a fully correct fix, as I'm not sure I've
grokked all the startup/shutdown logic in the IRQ core. This probably
serves better as an example method to pass the tests in patch 1.

 kernel/irq/chip.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 36cf1b09cc84..cc6d2220ceae 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -272,7 +272,9 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
 	const struct cpumask *aff = irq_data_get_affinity_mask(d);
 	int ret = 0;
 
-	desc->depth = 0;
+	desc->depth--;
+	if (desc->depth)
+		return 0;
 
 	if (irqd_is_started(d)) {
 		irq_enable(desc);
@@ -290,6 +292,7 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
 			ret = __irq_startup(desc);
 			break;
 		case IRQ_STARTUP_ABORT:
+			desc->depth++;
 			irqd_set_managed_shutdown(d);
 			return 0;
 		}
@@ -322,7 +325,7 @@ void irq_shutdown(struct irq_desc *desc)
 {
 	if (irqd_is_started(&desc->irq_data)) {
 		clear_irq_resend(desc);
-		desc->depth = 1;
+		desc->depth++;
 		if (desc->irq_data.chip->irq_shutdown) {
 			desc->irq_data.chip->irq_shutdown(&desc->irq_data);
 			irq_state_set_disabled(desc);
-- 
2.49.0.1045.g170613ef41-goog

