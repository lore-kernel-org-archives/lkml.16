Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15FA27F4CD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321548; cv=none; b=B2863T1jTda50de6KSPIkDaTTh255rYuT1qdGCU680/DSnFH+k+j87VAYUfBo+SQpnzGPWM99/H4+SGNFhQaa/Z4pAPccicBQMN2PI3aw4xy/CT8Mngnw51byoie274XHt03qEaj/wgKCG9WNOTnpWG/hdArhbi/mJV3+XfEwAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321548; c=relaxed/simple;
	bh=nz/fuTVSmlRp4LlYNxLUGp/0GbnwwjWJRrmA/wS6Qkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwqewP4VcFLSvwL62eXQ1GsmJPl87jI6AHyuavTk+LU4yczwMb6KlsM3XFV8Zk5CAiC3CW8pcljprtJg0ahEVO7irrBDC+JGun/rULNKGoInMScbltb94fRkNrPTdp9ABF6++VVTFH9t7BGz/XLEtkpmElj2tp92s7RsVgV/dCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=quvFyP4o; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="quvFyP4o"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so44212055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321545; x=1745926345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64ebY0cPXav0ihOCjI5v6o2sTgtjyxjpauAoewNWoww=;
        b=quvFyP4oblm1iehPppf3p12pziVnJlKC+FL6aV7tOQfvnu+iC3LG2rC8Sat51qHagp
         r3yvY1hRZm797Ccy1jHqHJiIv7CIFUCBvDRE3/J4aVoxwSPdLibDd4m/h4IZp/KHBxZL
         D/pFtkzdYtZlvtoQ7gtWN+6a8nMMmAD3LnyAfbr6uEn5bIPpRW0eV3WkvpwqCuZlq1BF
         NXhorWp+z4AyxABmWVzztaZP+zb+HHruI39hVTpTLRadeW2TQVFn9TWHBZBsoDj33xc6
         DgXyaxgArUvOc/C5BZ5ROAoGR+StTxHy8P8XXXPmWSHJUyQVedyROrdFb/tbbrceRNHY
         /3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321545; x=1745926345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64ebY0cPXav0ihOCjI5v6o2sTgtjyxjpauAoewNWoww=;
        b=gyGtWjZFqcwh4eTNzSsvJX4vSfRL4ZA4T3yY1tKwF975zHdWZs9AC8ppxrRm90Qlp8
         mZUQqPYtsbzc7Gu+/5Thn3FmfjflHM42BfZes41Z4Q45FrwwfLeNNhzNKIJC19bsPEZY
         DsJNRJBnrQrx8r/WMusOmdJLNz/8vJB4bcU8azkvDDbdHoSLgFZDTiMg+t1MwJf4kfn/
         NQNHc1ZcvLTxt++hCvssCqImu+e/azImFncBhCsQC6DZEJOT3qOaTbKw04iavuHwNeNx
         Bxx/Ic3Yv5ruqV5VhUOvH+ICZU97iZwdtlZDQPnargMXw1Kn8slBcvV7SkGXXqJHvSGp
         fbaQ==
X-Gm-Message-State: AOJu0Yzws0ntXUVGC3ViJEsQHDZpeg9NF5/8UrK8r+bHZRKtt2BR6VSP
	pM7Bj0JzdjkrupPq6eaZ79xG7Gqg4MRvZHbKqysxt0GwV5G36JZbWsvidvaYC5MWTeJ+UYU9Ub3
	W
X-Gm-Gg: ASbGncv1/8E63r9zW4dOMsNHkDnUoaMZbwhvECdi8h8keuNB9Cnopu1YNXQpIJiTgdq
	gX6eKAnn/+JRRGNqFtURYCfZTZ9JHVg4KP+tzhq9xkjluETghZmQemQxMI5Vf2UCGz8ZSU9JmgH
	i95HI73457ZU6MsJXK+L3q13fRzhBIJ7cylCAOOSNza1fSf17wJGQZepSxatDtFc7pnFsXsv06l
	9t7yFiZX5kyC+A0wvS3QOgAUaNatxUfCyBWf6ljuwbDxFJru7sIMHAcn4rYNNFQEl740VS6XsZO
	FjhP9dte6Yhhi7jtUDfH07n2VfXIR9Ph/ybj+dAK9FRS4TyJfBXh
X-Google-Smtp-Source: AGHT+IEyDv+QP1EWTmSMHRE/uIeHGYYUBcOw1Q2Wl1sMO2LldMVdHnU9NCNTqj9cN7+ATDWFNxMd8Q==
X-Received: by 2002:a05:600c:4c96:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-440697e1215mr95282895e9.16.1745321545291;
        Tue, 22 Apr 2025 04:32:25 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:24 -0700 (PDT)
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
Subject: [RFC][PATCH 10/14] kmemdump: coreimage: add irq registration
Date: Tue, 22 Apr 2025 14:31:52 +0300
Message-ID: <20250422113156.575971-11-eugen.hristev@linaro.org>
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

Register irq info into kmemdump

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 077b65cae4cb..2144edcc6157 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -2,6 +2,7 @@
 
 #include <linux/init.h>
 #include <linux/elfcore.h>
+#include <linux/irqnr.h>
 #include <linux/kmemdump.h>
 #include <linux/kmsg_dump.h>
 #include <linux/utsname.h>
@@ -74,6 +75,7 @@ void register_coreinfo(void)
 			  sizeof(jiffies_64));
 
 	kmsg_kmemdump_register();
+	irq_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0

