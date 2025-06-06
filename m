Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03803289812
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217695; cv=none; b=nuzOnc5uaCYvXwLhl6UbUr3a3KfMgzUNLGrtfzQGPrmB8mN1n5mHvk0+wwDjgr7ixiY2nmppVUgxNBMM4f0eaHUx6ZqrY1cO7qGM6uumsaIIWxNMjWUqwfmdVIkypqubp3FUHegnZLBx5wpKn1Cm1vLq0382YaQwqg6EF+c4hzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217695; c=relaxed/simple;
	bh=Oi3QsCzRxepRdbDtewkYUCbSzibLPqhb+4LK9MdIn8A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uATNzF0HLDAhlhav6vCOLiFTPEfO/EnhLZwcah/dPCpzNLMFvs1NfUa78BBNt/VczGoZuNF9LQkWojnMuFvlOz+3UnoSRXlXLMkMZbYCU02nFBhCGScSmyUiSCe6BjZsbo1f19TifHFVzZwSN63CW8mqi6trjahAf/EDD1b+Rh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3igN07b; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3igN07b"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-747ef5996edso1691231b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749217693; x=1749822493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU7d5eZEBEM5ZZef60sJsbo5aCH1yeHkH+fQHK1apWU=;
        b=N3igN07bGz7zWS+KLAag224Vibq0NJVHO+piwILybxwjUYr3w91g7bU3gPeBtCOwgr
         ecG9XayHLe9PnGSfR+QJ9Nw8wNx5SFYHOrGRj3W/j0M6RpWKO4YNgOnenFeyOY1fxEHf
         siirvrQ0fxFjYLHLDPF+QTuxoNJ/eBdwyCV5Eq0AL++eYRQRi7jerx3r2YhPa9d7Mwao
         oKeM5feU8n2rbs4DwbWiAJ1YTJVyPN8IsRhW+50RKx1iyO2hdQSvTEmGm8rxAOZb8BmY
         kKKmoUjHYli41B9G/t54oENI+yTUoPWfXYpF2p+Do8ynnqvAk4gjGG3M0vUlb/tZ5nfS
         4S9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217693; x=1749822493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kU7d5eZEBEM5ZZef60sJsbo5aCH1yeHkH+fQHK1apWU=;
        b=wn8JS4E4oShkV8YH+7sD39GnDADNfuzyThWXXa+2P038Kc9d4ETpl8Ivw6yhsjh6f/
         4Q5iF4xbJQZ360nffIKRvTbN5+jhPD+9nPAlgqMoxI35c3h6vPqq7PweFADltpfzlC6+
         oRPZpSdrn6L6uh2Glmk9qZNRWeJnkGwR01JRIPW0BLVBRkRrJ4z5O5uJVXiISnlepsT3
         enCaEnznzQO08vlmH3188s2+8ZX68U5Ge9kLxosqvTps/NMIaduwrPOyYNXMOcfdCVOC
         HNzidUJBP8ja3+pditp9KAwkt2XtIphxT14vXkETNCBG2qdWDRUMr9apBHL1hhqKj0wE
         US+w==
X-Forwarded-Encrypted: i=1; AJvYcCV+yIhchS35YaqQW5Rd+mBIeTEYPuS03/BqkVsCrjp3yv8VvflZmetppPZqEljamvxNh1YlXRjzAMrEPeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwElvpb26Mktws1aZ65JEpAKlCbNumIjLerwlVgrDWhOkoEzZu/
	xbkEoQnOUbD2xB04HItU/M2Oyjc+5p1jixuKWlvsYwzsdxFJPT1hwh3j
X-Gm-Gg: ASbGncsbgfwkG+tcD/PWskIqUO19/TqnpmA0W1BMgTjp6rrOded83IdUVJNr9qP1r2T
	Hb6QDKi5Oeq38TLySjDOvc7e9rmizlWFQaZTb6h0BZx90h/ZkkSlbeETLvNj5T+e9kYwpND2TOh
	afuV24l/8xSwU+fVPcB4IC/jir65uC5RgJ6dXOqT/CKlje5GxoWDNctfne1fzvqE6fV4zTu4BbN
	eReOEzC5PNzanO6lzcJXh8cGlEt9ua3LQjUZ/nMXnlOMs3MeN5VHCHecwhFUVy7ZqkawmgO8K3c
	IMfcQbWYcvXsqljU282GlPCju9xu2+QBhTWohYy/MHJZvcC37ZalSdPm0FgZwUkNvWjlX/wmIO1
	aHcRQ/Ta7M9t6hgvF
X-Google-Smtp-Source: AGHT+IGDoK2JlG7KoYJ5vVkB4BKmEp/jqZJehdcJafNyJAIF9KFDbi3qeJO0gnBEIMGaNHfzjrn6Og==
X-Received: by 2002:a05:6a00:10d3:b0:736:51ab:7aed with SMTP id d2e1a72fcca58-748280aca00mr4408977b3a.16.1749217693258;
        Fri, 06 Jun 2025 06:48:13 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c1168sm1296798b3a.136.2025.06.06.06.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:48:12 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 3/3] riscv: Optimize gcd() performance on RISC-V without Zbb extension
Date: Fri,  6 Jun 2025 21:47:58 +0800
Message-Id: <20250606134758.1308400-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606134758.1308400-1-visitorckw@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binary GCD implementation uses FFS (find first set), which benefits
from hardware support for the ctz instruction, provided by the Zbb
extension on RISC-V. Without Zbb, this results in slower
software-emulated behavior.

Previously, RISC-V always used the binary GCD, regardless of actual
hardware support. This patch improves runtime efficiency by disabling
the efficient_ffs_key static branch when Zbb is either not enabled in
the kernel (config) or not supported on the executing CPU. This selects
the odd-even GCD implementation, which is faster in the absence of
efficient FFS.

This change ensures the most suitable GCD algorithm is chosen
dynamically based on actual hardware capabilities.

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/kernel/setup.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index f7c9a1caa83e..785c7104fde7 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -21,6 +21,8 @@
 #include <linux/efi.h>
 #include <linux/crash_dump.h>
 #include <linux/panic_notifier.h>
+#include <linux/jump_label.h>
+#include <linux/gcd.h>
 
 #include <asm/acpi.h>
 #include <asm/alternative.h>
@@ -361,6 +363,9 @@ void __init setup_arch(char **cmdline_p)
 
 	riscv_user_isa_enable();
 	riscv_spinlock_init();
+
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_ZBB) || !riscv_isa_extension_available(NULL, ZBB))
+		static_branch_disable(&efficient_ffs_key);
 }
 
 bool arch_cpu_is_hotpluggable(int cpu)
-- 
2.34.1

