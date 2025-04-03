Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA38F253B4E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743705491; cv=none; b=Qv0XRfGIjlUVSHozO0OnpkMwVlnUC6lnIpXLesPrZzYcsR0lnYDi7CkPsdwSyoVqwD/VDnkzJGnoRDLre0IvwNSHf9XUOuOCQTH6CqFfxIWbp8cAuqFitx5odCtZC6+H1ObmZgp98yLV6JnAiYykcs3Znp6Wvz17wWho8RwA250=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743705491; c=relaxed/simple;
	bh=qORaiLaULs6L5dF+BXjhP23XyfyDBYFgK2j1vKkDrsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HYM4dcPdKlhNpXCcfoZ0RqwApViquiy61EZ9grGjcoAA7FSZ3acuJoOSxoAOdIyEgYFpTqFPVCex/Aog93lwz5W4Tu9EdbWR58k4HB0t3ych9CG1jaZPTSIpdpnTBX+0bT+7v2tyep0Q3fZzLaoMiaIc/6+akq90miW2ham3vC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U/XFVTIb; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U/XFVTIb"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913958ebf2so900546f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743705488; x=1744310288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RAUmoadrt4LgkAajp/0Serm5kZVa1HxkqsvCZqwwdbs=;
        b=U/XFVTIblEWLgsY55e4vq3yJvS7xtveO1iAoi7MscgeBo12Vtxz1dZgBU48L5dKkGf
         gQ5DLZl1+lCXDcoq1V7+8w7iijPhJ/3EdvSbOy+n9SFxK2yIgq65gOvqq+5JxXbBGcYs
         2OkqiGMBPDEmzpvgndac5AhxWAydpoQWam+PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743705488; x=1744310288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAUmoadrt4LgkAajp/0Serm5kZVa1HxkqsvCZqwwdbs=;
        b=Y3eLjdu3uTbjw0Yy92p8QMKs2MKlPOxEnWVCLNAeR33KPQ0+ay3SKnAX+sFrMtF0XW
         LX22t+XtjvvOAqe4XwPfRsPDaHLNkyX2tPFTcuQccjKi8b0SlPyN3UxtnRDO8FSRLk66
         jiWmcOdVKEdufjFHzj4GgCBK60Q7xU/l9bLiIw3lskepv+GtFkEd66PpSqBpe61pNcCK
         6+QQObWQCfuzCvpkDs3nZk1ur5zUHp5aaUByDPwduHw3oe4zGo+k7Mzged5llFzSA3B+
         xj5wxa8Nc7YMZn+5hE3B3T89yQy21N1lTGTtQfd569oHecksE9/yzpt5nOsZIvpNtY7D
         sVGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7tnnUI8VNpLZPhbx2uJp0bNq5sypj4Efx6TZ7f7bOdB9rSFuZQ4Apqodkz8I667tMi5/8dleoCv8ZA+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLaPtbV35hEMmy5Dr89qFHM9VLQjjb6ED3T/RkFt3/XlBYUGZt
	OO0vAzBQF3VagwYSFnqIjDXUlZ4ySwt2w3j1zM2+kmCFd3u0s/gEivsu73PJaw==
X-Gm-Gg: ASbGncsfls7/iQzxH2DLjFv76KQXAxoGPXHZXsTob4fxwS6/PdmquqnTVaUFkALmsqm
	e5nkb4dP6e0mfiysMLGSNTsYrG1I1Jsr0RXKwwhearFUGw0dX/egTZkHw+2k0HJMwZD/ptUzbuP
	WaOZZBYvCEBrkQchDhC+vLk3gJWmkh7I5ZST8ThIhY8eMZb5DDPDkvoJI6ZcBmqXjNA0E3cPlLi
	8NDr8Jk+DqVKH6Z/FjK/XUKT+CWZ3dsH08u+TdNOeFz9afnDbqWCs0BJIuvm+Vib/aXwcK54h1z
	0SL6EP9eXnx7EiA6m/iJyEaNI5ZH+R/m0WDYMnmUAaozBnES/doE5X1FcmbhNJNS+hzknPIfY/F
	pakCX0xr7pCz9LKk76yWjTzQZCX66
X-Google-Smtp-Source: AGHT+IFU+JA0wj4Gwdhmn0pvtzq12d4oTDVMfB0PZk2I2SR11ArXvCwfIkLV7Wt6NWMVRvs/m32Wsg==
X-Received: by 2002:a05:6000:400a:b0:391:2fe4:de0a with SMTP id ffacd0b85a97d-39cb357b0ccmr382060f8f.2.1743705488199;
        Thu, 03 Apr 2025 11:38:08 -0700 (PDT)
Received: from orzel1.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096896sm2503496f8f.19.2025.04.03.11.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:38:07 -0700 (PDT)
From: "=?UTF-8?q?Kornel=20Dul=C4=99ba?=" <korneld@chromium.org>
X-Google-Original-From: =?UTF-8?q?Kornel=20Dul=C4=99ba?= <korneld@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ssradjacoumar@google.com,
	chromeos-krk-upstreaming@google.com,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <korneld@google.com>
Subject: [PATCH] arm64: Support ARM64_VA_BITS=52 when setting ARCH_MMAP_RND_BITS_MAX
Date: Thu,  3 Apr 2025 18:36:38 +0000
Message-ID: <20250403183638.3386628-1-korneld@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the 52-bit virtual addressing was enabled the select like
ARCH_MMAP_RND_BITS_MAX logic was never updated to account for it.
Because of that the rnd max bits would be set to the default value of
18 when ARM64_VA_BITS=52.
Fix this by setting ARCH_MMAP_RND_BITS_MAX to the same value that would
be used if 48-bit addressing was used. That's because the 52-bit
addressing is used only if the caller provides a hint to mmap, with a
fallback to 48-bit addressing.

Fixes: b6d00d47e81a ("arm64: mm: Introduce 52-bit Kernel VAs")
Signed-off-by: Kornel Dulęba <korneld@google.com>
---
 arch/arm64/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 748c34dc953c..38e0bac567f5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -332,9 +332,9 @@ config ARCH_MMAP_RND_BITS_MAX
 	default 24 if ARM64_VA_BITS=39
 	default 27 if ARM64_VA_BITS=42
 	default 30 if ARM64_VA_BITS=47
-	default 29 if ARM64_VA_BITS=48 && ARM64_64K_PAGES
-	default 31 if ARM64_VA_BITS=48 && ARM64_16K_PAGES
-	default 33 if ARM64_VA_BITS=48
+	default 29 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_64K_PAGES
+	default 31 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52) && ARM64_16K_PAGES
+	default 33 if (ARM64_VA_BITS=48 || ARM64_VA_BITS=52)
 	default 14 if ARM64_64K_PAGES
 	default 16 if ARM64_16K_PAGES
 	default 18
-- 
2.49.0.504.g3bcea36a83-goog

