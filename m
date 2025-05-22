Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70408271A74
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 23:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747957067; cv=none; b=ZHf4MQQSlJtvOk2o/JyEnFmQoTRw0eiBN41NzeUIRxRyvesPoXw05otSzX2LMgcUV++lOPa3TQFXaB0taJGUJHNXJwNheBUU4+iX+4mqJoNIFGI9ObqP3iNMRYbcBih4y+npaNbgIwWzO6grFPWueZieH18gxmWyvgMD6olKLZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747957067; c=relaxed/simple;
	bh=Cf+rTiT37xWtJra2of8I2bzpA8nA/Gdxil8f28LKGj8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E+mVhOkkA9jnZtIjG2W3ltfbRMD07ePMPGhP/eVmfdJzbU/LjZ/zEHH5lzzqjZOSnLkrkWI7aSFvB0sLB2lYQd424mPEMQZSC8IKYKPDBK2vGC9slCfjFvWQotMooVBJZpbwmaU3MO4h9rUzGs6lRgaV545NNxwfWE30q41ERQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k24CJp0P; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k24CJp0P"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e9b2e7a34so4903326a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747957065; x=1748561865; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bZZENoThSq2WPUG3cA9ljTtD8JyVh5aqU2sA4XXQXGM=;
        b=k24CJp0PVCjvkhOg15+EM8LEYadnBZg4C6kkBB2UqoyY/k+6yZ6KJQdmnfk0Hwi2cY
         9AUQAuhkEpRCcmmbuVpgSJdqb1VR00ciLK85kQ5qLvTNRj4PjCOKaKdW585KeHz/ogxt
         CQm5W+xxVgnOMMkFmYPJRWZ42/RJ4G9eZXnu+mlPFMe/HfSFC0iSKI3FO/upHnRxhZEy
         ouPITCUHD42WF/O7Ia4cJjeDFqLJeM6X3CR2KBw0+T/dzc+skLPAyoPtHCCSeHSSLQ0a
         Ta4T18RBYOSIE5Hz63/qU9uvOFto+5q8mMSaB3n+3BLi3ASChk2hIXFFAnNGcPhNsC1m
         Vcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747957065; x=1748561865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZZENoThSq2WPUG3cA9ljTtD8JyVh5aqU2sA4XXQXGM=;
        b=T7Hz8lMJ/2I/Cj3gbuT6xHFjjCPIoAMHaKWa1TwxG9GDjKdTLzARXnKyPjF5Sbreut
         ey9vEQOaB3GsT9R/1MoRP9cXS/ComuHSg1ShThhiCyNbVIL7iKNPWUtSI7F8OFlu6sMh
         bM+EDUCLtCQ6cRd/Rejhnh+wxyGmQIZLuNMW8YWRiUJsYcaShjUxkuBJU82LQEP3P7Nn
         DlrXxsrY3rxsitYeD/W/HmWk2Ki5z1CTqKNVcNQV8CQWSI0OzdPVgM5m85oaOjRAUXJy
         m1ItFixz0TodZtgTl8g5vT8tjvmxD4G+m3fwWjq5BLkDE+MWMb45IAZZ3yL/WVSMeNOV
         v6uA==
X-Gm-Message-State: AOJu0Yy5JSBdep2TbIULOKW850XZsHuR91zFoNNAXZzLjSltNqu7xaJJ
	b6wtf+pGa+NrBVgeybPXx7VCXZlnVCn65Z41eUcUb6L3R5B6Bcp+48MRxRVMgoeyVSjDjK6q1bR
	xbrrqbg==
X-Google-Smtp-Source: AGHT+IFExGJrdJE3NdFkvdN8xCuUi0nMv/3Dpb1wQbh8E9OJ+IjqmD6ZkqC1r2VP7vreaPIjC/XPdl8z9gU=
X-Received: from pjbok18.prod.google.com ([2002:a17:90b:1d52:b0:30e:7f04:f467])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d44e:b0:2ee:d63f:d8f
 with SMTP id 98e67ed59e1d1-310e96c9598mr1434238a91.13.1747957065045; Thu, 22
 May 2025 16:37:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 May 2025 16:37:26 -0700
In-Reply-To: <20250522233733.3176144-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250522233733.3176144-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522233733.3176144-3-seanjc@google.com>
Subject: [PATCH v3 2/8] x86, lib: Drop the unused return value from wbinvd_on_all_cpus()
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Kai Huang <kai.huang@intel.com>, 
	Ingo Molnar <mingo@kernel.org>, Zheyun Shen <szy0127@sjtu.edu.cn>, 
	Mingwei Zhang <mizhang@google.com>, Francesco Lavra <francescolavra.fl@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Drop wbinvd_on_all_cpus()'s return value; both the "real" version and the
stub always return '0', and none of the callers check the return.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/smp.h | 5 ++---
 arch/x86/lib/cache-smp.c   | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
index 0c1c68039d6f..028f126018c9 100644
--- a/arch/x86/include/asm/smp.h
+++ b/arch/x86/include/asm/smp.h
@@ -112,7 +112,7 @@ void __noreturn hlt_play_dead(void);
 void native_play_dead(void);
 void play_dead_common(void);
 void wbinvd_on_cpu(int cpu);
-int wbinvd_on_all_cpus(void);
+void wbinvd_on_all_cpus(void);
 
 void smp_kick_mwait_play_dead(void);
 void __noreturn mwait_play_dead(unsigned int eax_hint);
@@ -148,10 +148,9 @@ static inline struct cpumask *cpu_l2c_shared_mask(int cpu)
 
 #else /* !CONFIG_SMP */
 #define wbinvd_on_cpu(cpu)     wbinvd()
-static inline int wbinvd_on_all_cpus(void)
+static inline void wbinvd_on_all_cpus(void)
 {
 	wbinvd();
-	return 0;
 }
 
 static inline struct cpumask *cpu_llc_shared_mask(int cpu)
diff --git a/arch/x86/lib/cache-smp.c b/arch/x86/lib/cache-smp.c
index 7af743bd3b13..079c3f3cd32c 100644
--- a/arch/x86/lib/cache-smp.c
+++ b/arch/x86/lib/cache-smp.c
@@ -14,9 +14,8 @@ void wbinvd_on_cpu(int cpu)
 }
 EXPORT_SYMBOL(wbinvd_on_cpu);
 
-int wbinvd_on_all_cpus(void)
+void wbinvd_on_all_cpus(void)
 {
 	on_each_cpu(__wbinvd, NULL, 1);
-	return 0;
 }
 EXPORT_SYMBOL(wbinvd_on_all_cpus);
-- 
2.49.0.1151.ga128411c76-goog

