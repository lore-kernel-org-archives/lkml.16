Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6FF1A7044
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746352425; cv=none; b=DkId7NS7IgN2bixM3q7nPj+nSOdTPKzIXYdI/Zah92MsJXqppB4R8qWgsgRfiAH2zH1KVK1Y2ZwPZ+lTAsUho5jfl6GRuo8bPqBN969s6OhwSbK7dikpNj+cVN7BMyiX9IHtB1ErUfbzQahW1bOo8DJW75PPtPitrhM0uLoJ6ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746352425; c=relaxed/simple;
	bh=iwQiKCrnRw6e5t0cbBba0LK388tT/jjrdqhKVRDej5Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EYhTk5X0CmvOJSz4yRPtUh9BpTrspMZKsc/mwtgSucDsa8rnEYbdAFqugwcSm24Lo1Fs9etC9pWLh1B63GAAVwh8ckCKUmLcXizLe3d+0FkhervYl05ZJxnLLMe/bQ9ORjVYZZtw0VT7NKJUFT0kr5DC05wQqvXSnuMpl6j/PzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qYqZ4xwb; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qYqZ4xwb"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf327e9a2so25727185e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 02:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746352422; x=1746957222; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=09I89rcrSx0lGt2Hht5eDxGNoY/1U5TFE9afFv+NSJg=;
        b=qYqZ4xwbGYbWZyLbms3wb67/1uPTOjphrcgsmow96gpinHW7MJVOcqy2sqaBX3D/kP
         UTU03PP7LaHT71R8BHnglrLXGpI9x3LFCsL9XSsr4iQENXPlcRMpEROknFvT2RK0f+ft
         FgsSRcuMIWFabqDjeABN4acuQhtaOT8C6dlraYM4Fmza0gJrLdhI2m3MLXaRbg25nTfd
         T4pvpSSTB/60FRmwJBTVpCaE/C++fKIdNml+WATAT7ZM8p4blFLbEd6zo00otzokXfM2
         2NJnjCJ0A1mijAHH9PYJm6louk/nOWw0Feu46MbgIuLmOislMknHyG82zcJuzXI/iXeA
         oTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746352422; x=1746957222;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09I89rcrSx0lGt2Hht5eDxGNoY/1U5TFE9afFv+NSJg=;
        b=gDMpuadWncMJ/Tu4KxHSqblAW9Z21Ct83lAPeUzgiIg1cd55Xr+WiP+XP0e5pp55z+
         B3WjXxKhQajn8qnTYNoFmeEniK++WJ8uLGhAyTHWkcRIuVyoaI/Dx5y6Jdx6iuSadb23
         OA4cqVOb525YoWb7JNu8pxku7yFGBeQwaYVdsCt0xPxM6lc5E8/MDTSBWSorsfkCwuqG
         gCBK+KkH5YSKp/0AeWp3Vf2r+R+LCR5Z/SoYMu0B4GqWQ3FWfk8+levbUCDkB0sSxZtL
         W8R9DagV+px7a8j39pUaHAp+6J0IiXyjVZDtuRy43z4MX1Ml4XjIilJNe7rg7eyEjjdt
         Py9A==
X-Gm-Message-State: AOJu0YwDnmqszmQ/9DLK8MVkX0jO6iYElbLoQU7ey0vOPe2Os31Jppr7
	P6rIPO/yM4B01v+TpEv8zbsnuTmcJ2DiocNyElppWYXKfSLxjbVygMhNmVSCvuGSo/V0+Y1AKmm
	sb4KI8QRwnNk9jV7RzshS4iRwf09uCmNCwjeOQLqa0iUvtQfDglqqJ9jt1Eq9zOmVvanqo9crx4
	W3B/zcieNBr6HN/vKmeMv5bF9DG5hIDw==
X-Google-Smtp-Source: AGHT+IEHBRZOthoNCWHQ+QuYQRNm81nOsUZ5ai5bBhDx4UgSm07jqGJS8LMx1Ev6Aa64AbUsy2b67Hgg
X-Received: from wmbbe3.prod.google.com ([2002:a05:600c:1e83:b0:43d:2235:bd45])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:510f:b0:43c:ec0a:ddfd
 with SMTP id 5b1f17b1804b1-441c1cc4826mr41965635e9.6.1746352422181; Sun, 04
 May 2025 02:53:42 -0700 (PDT)
Date: Sun,  4 May 2025 11:52:48 +0200
In-Reply-To: <20250504095230.2932860-25-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250504095230.2932860-25-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672; i=ardb@kernel.org;
 h=from:subject; bh=Tkjl/5QM7fobSnvXL0Qey90uzdX00dsND7VqTMhk7jY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUPc4pvD32nLKrTrLjJ3Zcm1/TnFXHT3i8aMvVtNXUri9
 mU6bJvfUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbyeC/D/4ofnQc+LPupJH3P
 yf1ASoLTi4Dtq3JCtvk86uBnObP6nxHDP61Nms2R7MeXzFid71bEVrCoc2b24aSVhw2k1F3rF1y 4zQoA
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250504095230.2932860-43-ardb+git@google.com>
Subject: [RFT PATCH v2 18/23] x86/sev: Export startup routines for ordinary use
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-efi@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	Dionna Amalie Glaze <dionnaglaze@google.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Create aliases that expose routines that are part of the startup code to
other code in the core kernel.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/boot/startup/exports.h | 14 ++++++++++++++
 arch/x86/kernel/vmlinux.lds.S   |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/arch/x86/boot/startup/exports.h b/arch/x86/boot/startup/exports.h
new file mode 100644
index 000000000000..5cbc14c64d61
--- /dev/null
+++ b/arch/x86/boot/startup/exports.h
@@ -0,0 +1,14 @@
+
+/*
+ * The symbols below are functions that are implemented by the startup code,
+ * but called at runtime by the SEV code residing in the core kernel.
+ */
+PROVIDE(early_set_pages_state		= __pi_early_set_pages_state);
+PROVIDE(early_snp_set_memory_private	= __pi_early_snp_set_memory_private);
+PROVIDE(early_snp_set_memory_shared	= __pi_early_snp_set_memory_shared);
+PROVIDE(get_hv_features			= __pi_get_hv_features);
+PROVIDE(sev_es_check_cpu_features	= __pi_sev_es_check_cpu_features);
+PROVIDE(sev_es_negotiate_protocol	= __pi_sev_es_negotiate_protocol);
+PROVIDE(sev_es_terminate		= __pi_sev_es_terminate);
+PROVIDE(snp_cpuid			= __pi_snp_cpuid);
+PROVIDE(snp_cpuid_get_table		= __pi_snp_cpuid_get_table);
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 9340c74b680d..4aaa1693b262 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -517,3 +517,5 @@ xen_elfnote_entry_value =
 xen_elfnote_phys32_entry_value =
 	ABSOLUTE(xen_elfnote_phys32_entry) + ABSOLUTE(pvh_start_xen - LOAD_OFFSET);
 #endif
+
+#include "../boot/startup/exports.h"
-- 
2.49.0.906.g1f30a19c02-goog

