Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0208462
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744977456; cv=none; b=XSfBt0agIf53lhFS49HW8jMz22aTWOOicDoE3VypkGB31XhdmBJ99ohkIwlWijGmoEe2P5cOPnQFIoTr2Xq4Kab0untwAoAcD6ChEmRyYnn/eYrkfJcnlC/iXK6+xaffu/Z0i0gb7BQmNPUxIrR/FKhOAKG1uyR3J5Y0n4E37zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744977456; c=relaxed/simple;
	bh=sJP8Us5CzGWYOTYL74RlLZab/s5HE4dKwWjZOTJQMRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GRwKCgtNtb7HA2raEF6E18RoI3Fl9ucjswPqNW7KOKrBsNyHV/fFxFES3CSrRc7U0MuDTFtACCvzAgbs1I/7RzcX/FTy8TsbNSALox/u7GQMYqmPKUeUH730riM2LbMQF0ybsQuyHEvgFHjKK9EbnMVMzFND3IBhcjfPqimDWmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JHz+lV3u; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JHz+lV3u"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso8321785e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 04:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744977453; x=1745582253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qWA+Zes13+SS6MsGo5ooM2vzszD3qD9soPuMxb4Uoo=;
        b=JHz+lV3umONgflGiUfP1P2v98YLeLs9pR96gqW9vvzYZyGqCVEdnRWUStZe2gQ4n8l
         Eudo21M1JiXM0kD/NHWc425AwNt7/OrJ/G6YC1M921vQEhemdPTsnOYz1WNT3GNbRweM
         NL4GhJLMB7iN/5Klgqoc0YXYVSs70cw4a++H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977453; x=1745582253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qWA+Zes13+SS6MsGo5ooM2vzszD3qD9soPuMxb4Uoo=;
        b=hoa0slKBWWTKcmQJjCpD2kSHgcNHtxh+OvZnNV7H+ZCOTFoG/TU1AAW9ez8h6ihBJt
         ylNpUhMD67mKb1teMOJiIEyB1667UXPgPUmnr88I+BkO9EILZpABcyWinqy9WK9nlXmQ
         I7+SceLWYhgRz6IYMfqBoRjZTla0GS6FsHL03sW1fGbcYQVCp3kFfijG0xQZmpVSTN3O
         1DR28b5/vM2O0kDL1qW9uqSsX73dXouWM/4zaZ0HcIvCsTQcHgDT5y+jBX7/uC065nUa
         QM8Zmu6Z0JC38+L0pMdJnQQWradtprwJHZsT7tMC7dY230CTakC3TOTPjSRDMtwQBYlm
         qIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF0myBXif0NmKEQ0QHx1EvLT5idJSEHefh5DvBo+Q5C5bZW673bwo49W5GQJKqOHfJ6gLbcF4CvibWRzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUyMGCfnwmHGbfarYR8myy2lyF/HSa5wIrjlFs+xNYzAD6gtT7
	yO/q3+nOHr0s93cd+7dpeOE0A6lo7wj4wS4/wbGGnbnvH4FlcpPwHZYEurn2kw==
X-Gm-Gg: ASbGncui6I16GchlOdevoyhSsmceEHHdwaZFHTm/7pt/ia7pauT7alW5qL8arwMjYRa
	oa9PxuLAeMJdJiVngSoN9cuPhWBUHAoyUW87HS/KpbqJC1oeaZcrMUb6hS//lDtBATLwkm5K98F
	BBKnzFiba+fvJXyMBC2zoov9wNY56EMxkVjNSQzQ8ydKlfWj17vseV50Y38P2v+DlG7lLiVHGV1
	EBubeDfQooPKUnxP6znpBEFxIddi87DVisqAMlaoTojhAhDAccGKA52baTr/9gm9RGOqNssG0lt
	FiRU20PD/VXoSAIIpPxtsUU8ZWBTO1+MMjF6kWGSHRH1VSafCr15OrIj/s2cJXr4p9TsDbduKaR
	BHXpdyblhqZk1mWev6f29SUMZt6+UfCmF4oKd
X-Google-Smtp-Source: AGHT+IEtzKO6e4gR1e98cXozIzDzG9qGFo4R+n1x2mAYncHYFYpNpOjAioT5ZlPd5x7Fxeb2Rhbe8Q==
X-Received: by 2002:a05:600c:4f0d:b0:43c:f1b8:16ad with SMTP id 5b1f17b1804b1-4406ac2194cmr17478775e9.30.1744977453186;
        Fri, 18 Apr 2025 04:57:33 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (187.5.148.146.bc.googleusercontent.com. [146.148.5.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4a4856sm2497723f8f.81.2025.04.18.04.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:57:32 -0700 (PDT)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Dmytro Maluka <dmaluka@chromium.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Yue Haibing <yuehaibing@huawei.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT))
Subject: [PATCH] x86/extable: include asm/processor.h for cpu_relax()
Date: Fri, 18 Apr 2025 11:57:00 +0000
Message-ID: <20250418115710.4154311-1-dmaluka@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Include asm/processor.h to prevents compilation failures due to implicit
declaration of cpu_relax() in ex_handler_msr_mce() when compiling with
CONFIG_X86_MCE disabled.

Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 arch/x86/include/asm/extable.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/include/asm/extable.h b/arch/x86/include/asm/extable.h
index a0e0c6b50155..c22e524276a5 100644
--- a/arch/x86/include/asm/extable.h
+++ b/arch/x86/include/asm/extable.h
@@ -3,6 +3,7 @@
 #define _ASM_X86_EXTABLE_H
 
 #include <asm/extable_fixup_types.h>
+#include <asm/processor.h>	/* for cpu_relax() */
 
 /*
  * The exception table consists of two addresses relative to the
-- 
2.49.0.805.g082f7c87e0-goog

