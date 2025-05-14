Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5258B27510A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747219399; cv=none; b=Vp7Xji9uVaPBd/Fk6V0PyZYIiHR5ttT0gWS6rM/amZCaPU/OKg6JG1LTKXMw/mgUzfaVLwAcfU3XU8b3EUFl0zxJ3bG480Rj/AmJzSbrkbVYga0HQe4Q5i+WkXFuAzrOWPlgLswF4hO+018OznTRKWsns6qr68uv3if4xgZW2kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747219399; c=relaxed/simple;
	bh=hWgX7qXvIT3HZAzoYoIDN1xkBbDXH1YUNgUPdd4zZ7U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oRkt86gZpbi56iCnv1qSn8h9Hv6fIBOca8rDxrows4oUmFfHvNPQ0INeFDXV6fzOK8QM8hrooP6O72ZhVz3FSX6IfOJqLhAtdbXPPmF4cz1Fj3zxOBeG/oGYsbiDDIpQpw/NsrlJSnMV/QO2ETApAZWYLqX6202JEw/GtatT8Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QOjgwXIk; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QOjgwXIk"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-441c96c1977so43514705e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747219394; x=1747824194; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOB58JVAymn9DIOyvp9CG9R9zCpbYXA0Lhh4NhuM7zs=;
        b=QOjgwXIkRU946IQUPUpCoHZtdXagisq4V/wWkZLEpXMIZj7XmrHmmei+dwRSCh0koD
         Fbp5OdrA+Pu5vL3mA9S8eq02FNU9uG1dNX3GHwz/QvqX+k0pcdPNXFuxMExNU4susc2a
         hVl84sXNT6cEg3JCrBdHD9GlVMYg5HK1N+U6N6jZJioNgNzL3TThZME1M3C5V0y6NgEQ
         7vo0U/GLdTtben8JhiMWz7mS5jK5K+gVexwwkqMeLGkbgLERrj+5AHMY48dIOiuCpANE
         Hd2L9zaJodJY6M445I2Ph/Og1RHbp7bq3KEtBeO27PfLiANTF0Bs0Sgo8/ySeMs+ZcZr
         i8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747219394; x=1747824194;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gOB58JVAymn9DIOyvp9CG9R9zCpbYXA0Lhh4NhuM7zs=;
        b=pQAFC7p60DxAxkqkF5Me5slXu++i9eP5Zkje5cpQjL+SEP2kLpSB4dkHLffukrJ9Ne
         Shv9OiTXEpcRQrbD0wJ58Oh/sZnPsYdzDebVdL5ZyV+GEDK2Yd4itdp1zDUZjjOOME2Z
         wSTYvBlXWX91E22IhPVCqWs3E9dptlCwU3kpckvNzuG7VtuV/ijE3qbUTdmJ/++ZPrSG
         mqZOIGUZEDMJUiiq0F86T7UEf0fcmISxyL+jQ277ciRUr+Qfm1wZl5jIie1QHMHLo4UK
         JQ6mAMUTx3SlRy/cSuFgy8JJNyHg+aAhgKrQdQzkxS7+OBv0ce55PNQD6wC96qrBmm+v
         9Lsw==
X-Gm-Message-State: AOJu0Yw/pMrpGiyzdQsVva5a3snOP1Wp2+IxtL07iCq2k9+P4aIxC6mB
	z7GMT0FdKzLrNH+hAJirWy7r5SJzcAlkXBNgIwOsePN6Kd/JCVGCjBzL6/UoPVu0ICC/UtOEbtQ
	uo3/UND0EwYdGexSWAtg6eEYz2v6wZOyC+nd91/hitzxsYUcThaECn+3UunsQJ8ULGD9vIMLFn6
	WuDkSYUZTrSNLvrIzC2sRwVg9OoEMgkA==
X-Google-Smtp-Source: AGHT+IH9JnZfF11Zn9zczUS7Jbcn8wqjwD3wJ09uDKapVoiH1A30r9OSnDQs2RLOqgnOkbpg+QzLIHOy
X-Received: from wryv6.prod.google.com ([2002:a5d:59c6:0:b0:39a:bec7:76db])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:1acb:b0:3a3:4bd8:4c6
 with SMTP id ffacd0b85a97d-3a34bd80595mr1452005f8f.59.1747219394674; Wed, 14
 May 2025 03:43:14 -0700 (PDT)
Date: Wed, 14 May 2025 12:42:50 +0200
In-Reply-To: <20250514104242.1275040-9-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250514104242.1275040-9-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080; i=ardb@kernel.org;
 h=from:subject; bh=x4z2VkW3ceTma4YBru6lhP3tx3BetAlSCCBd3CfJhOE=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIUOlePWzkK1+1yQeBzuddHitFuz+12q64uLX/hGPGZc76
 uaWr23sKGVhEONgkBVTZBGY/ffdztMTpWqdZ8nCzGFlAhnCwMUpABPhO8PIsDjqSbYGv9muzhPv
 5K6pRW1dHPExf/M5t88JOdOUorQ8jBgZjm+ViQsr3uj70KC61UXcRCi5tdX626WHAkpSzPULbL3 ZAA==
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514104242.1275040-16-ardb+git@google.com>
Subject: [PATCH v3 7/7] x86/cpu: Make CPU capability overrides __ro_after_init
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

CPU capabilities are set at init time so they can be made R/O once the
boot completes.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/cpu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 08a586606e24..19b310bd55ae 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -702,8 +702,8 @@ static const char *table_lookup_model(struct cpuinfo_x86 *c)
 }
 
 /* Aligned to unsigned long to avoid split lock in atomic bitmap ops */
-__u32 __read_mostly cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
-__u32 __read_mostly cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
+__u32 __ro_after_init cpu_caps_cleared[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
+__u32 __ro_after_init cpu_caps_set[NCAPINTS + NBUGINTS] __aligned(sizeof(unsigned long));
 
 #ifdef CONFIG_X86_32
 /* The 32-bit entry code needs to find cpu_entry_area. */
-- 
2.49.0.1101.gccaa498523-goog

