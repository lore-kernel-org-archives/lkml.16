Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B2C27FD4F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321550; cv=none; b=FTHkB8esztcgExfWeY7rFa4hB6N6g0akIMUvnWEKG4DIZkQiN0EnAd0uA4wbiYlnC95zvayqTcsGBsPaW7ZyncKPSVBQK6IgAa5Nmb4RvHb3AvnPtJUSywLlMrbq6bYPM5fXZ5JvDBKJgG5+kbQYP3W4j03+I0MP87AG9oxfC5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321550; c=relaxed/simple;
	bh=dQBWiaOBeGSAz3TktHG+f+M9wJ7RgZde2mn2/2XVBIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVPrTUBQ7FGtUuFX0/rcJtOm3QfZXTlkFijba2L0EHpi3swXZ54n6MQHEoozKEvpmNTm4ZAElp+qSj3Uow318s8OpyiEtIDSJbsErJbdTDaVyZXaWkVJaAn+oxGyDj7gD41vpNLA1CIMJkwdIxkMurNoePQaISQtLVxKI8+k+MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ARgh0SFr; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ARgh0SFr"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso3535493f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321547; x=1745926347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9iDb6dJHPByHFRUfHN+WUxFJ05ZfE06RQ96hiEBIf4=;
        b=ARgh0SFrfqZAan+la19+075iqfSj8fVFSeu1ZetXoG4zBvEK9fkaYgtP6O54s5us0x
         Gh+UAZsGvKpVpHUdDs/KBZveylDcHs5RuA832aqh7AImxtOZfPD0sP7nZLvFASFO9aM/
         9/6uHQCjPGsP3L/2WNGcpUpyCoFlwrtRNP+f9HYcwxjHRAfIG1Xvll+vI8UUxBDS7W/G
         5B93pYlwD7JPiVZFX858cfv1OxTOvWFWGj3eT3kKKSmpmNsAToxwNsvJLWKwvTT8MFrj
         Vmsn7y3eD2/ehhfUeAXgR8HVuFnPiy8wnM8Gmxy+n42Chf5/id1lZxOPmjQVNM0mWu1D
         Wkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321547; x=1745926347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9iDb6dJHPByHFRUfHN+WUxFJ05ZfE06RQ96hiEBIf4=;
        b=PYlgXyiT2t6rc0Z2XMOMYAGY6bOz4BizZhKEK2v1pN0fbnMsZ+rFsPlC2ECp9lUJBf
         BqfJo7/dRCdWjSZhBnZ4gLKedaL/a3K+52PAKGO25ldLHBY6v9ZukbFXGT0yb5KZh5e7
         nhDyap+FAsimojRH2qhLNhWAx+/18ev6oQWQywxelGlsp2dhkc0DiKKZ2P+xbVXNV/9Q
         IePplw4Xof24sc3bMj+XqN6DUI4uwt84/bpHL+2j9fyWFnpziynjec+vXXTth+M6qm9h
         CWsuHpqP0ZbAwrW8VCVw1o7u8D8RhgLpWYBrhrsXY7Vi1aKwuWUg5UlvPVNmCx9A8sry
         Rawg==
X-Gm-Message-State: AOJu0Yxaa0cMgAQwVUMIfG7VE/c0hALV0MTe6pejMe/KupvGJjuGLWe4
	ZUe4+bW6Ua6HMcxE3+LC1FzohKLsiZLJ7u6z923oz4dK8Hdv+5PpNrI1dBTsWOcAwP3rbcKfZsU
	G
X-Gm-Gg: ASbGnctCBIogE6xAd/EBfZruqyrHmrjSFQ9W676UmoQZ10LCjLMI+XNIq4tUqPXR/JV
	UhdsUW8LbuA8dtS09sTWm6uBAeMhpAHyRzwBpiV2ngbfITMd+3mhF3vmun6REi8/IfA26NlhfTk
	tPG33U+o7KOEwSsKo7QR3aIkoMHXgv2tJSFshCMpDlm8+yICDMGmXmgCK1JQS1yxyxR3Rp/YQko
	6YjLwBZ+pxy+q0AtIRja6jwfWjPEjOirDmQUZvtrPhLKbvZlOnNzW/wwQLcjfGmvcofcot4yeXX
	FqDlsQA0mQ2RbZSoGrcFziiplEqAHNQTTLIjrlL7285aVcA39Y0Oo3UqF3FRThg=
X-Google-Smtp-Source: AGHT+IEcklRua+TIOcJ9V56azXwxEY9ZBfbluuMXCoJPkRtrWwdtYmmWeeqPQxiQXCGvLRp7yg+S1g==
X-Received: by 2002:a05:6000:1846:b0:39c:11c0:eb98 with SMTP id ffacd0b85a97d-39efbae03admr11898357f8f.39.1745321546877;
        Tue, 22 Apr 2025 04:32:26 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:26 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 11/14] panic: add panic_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:53 +0300
Message-ID: <20250422113156.575971-12-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add function to register panic info into kmemdump

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/panic.h | 1 +
 kernel/panic.c        | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/linux/panic.h b/include/linux/panic.h
index 54d90b6c5f47..42a24bae218c 100644
--- a/include/linux/panic.h
+++ b/include/linux/panic.h
@@ -96,5 +96,6 @@ extern const char *print_tainted_verbose(void);
 extern void add_taint(unsigned flag, enum lockdep_ok);
 extern int test_taint(unsigned flag);
 extern unsigned long get_taint(void);
+extern void panic_kmemdump_register(void);
 
 #endif	/* _LINUX_PANIC_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index d8635d5cecb2..a26c9581e70a 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -38,6 +38,7 @@
 #include <linux/seq_buf.h>
 #include <trace/events/error_report.h>
 #include <asm/sections.h>
+#include <linux/kmemdump.h>
 
 #define PANIC_TIMER_STEP 100
 #define PANIC_BLINK_SPD 18
@@ -589,6 +590,13 @@ unsigned long get_taint(void)
 	return tainted_mask;
 }
 
+void panic_kmemdump_register(void)
+{
+	kmemdump_register("taint", (void *)&tainted_mask, sizeof(tainted_mask));
+	kmemdump_register("taintflags", (void *)&taint_flags, sizeof(taint_flags));
+}
+EXPORT_SYMBOL_GPL(panic_kmemdump_register);
+
 /**
  * add_taint: add a taint flag if not already set.
  * @flag: one of the TAINT_* constants.
-- 
2.43.0

