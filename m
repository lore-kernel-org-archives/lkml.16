Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF811E4A4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617319; cv=none; b=BFbJxAJZRT9lQ9JtAChhDaeHWt0sION1sbuz/azO7MIw2+KjFLLLdsTAptDLdbQbUavppvumjiNdetXqgCwpD2nKyP11DPdisWW03hb+nPDamDGE9QQ6Q35Z4OGuijavq9Xxom5sXcochBE8F/V8826b1KavfnGEyyMaSVkkXQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617319; c=relaxed/simple;
	bh=+RDv0AfnKFndIp5eluzATbsGfP3lW0ovSTexJV94xMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FHTCetWptkHQGhk68Lvcs+SIeBiz7mKm+dcRyK2xiGkm1trMbG1qp1lejlwe9UixzWF35O+vqCTEAfaHBvib8uCDI54YUVW++9HTSGyDG9LH73wVAF+0mAWewLsJGSwKifi5HF0yP7/y7e3WmzW8vXNWwzk0abR1iSMJjHgG5a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8p2SNCP; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8p2SNCP"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac25d2b2354so9644466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743617316; x=1744222116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8Kb39OB5uuwR1Yc0ADKZ9WLus1mECNi5SkaV+jNYXs=;
        b=L8p2SNCPYosQxZ0yE1mSy1AEq7sqYGhKKWiRZ4B/PXqZydPo+zZMLFS8P1CcyNNBWj
         3vSwHYZ0nQr+e6UK7SKbjwNdVdFGTaN+wdgc7fFgEk3JByula5FNo7DWINSA8lGLzspd
         XdiFdPiveLyKrEhvF92fNdpLc6VikrqWhsl0dVIGT+i762wvQj0GYvkNvBhJqtqhs1uT
         b+e6BHBWf37T6OBH5YCtcM+OIVOHFr64xzPnCxC+gXWHDWyCW2LdMZKIgPGeomPcefGC
         Y9lcRtxuqCfIQ94TXxHkXTnw7ixqSsKoyTmKJQ49NL7b0kEw+3GMf/XjwMN4KxWo+Y+c
         1bQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617316; x=1744222116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8Kb39OB5uuwR1Yc0ADKZ9WLus1mECNi5SkaV+jNYXs=;
        b=TnVhgDSFBen/3NMMa3YdBQkhr+MmfqHH6pXkQ4JHaX0cXigh7xbij+yCOLBkyj3nYP
         AVcagiJFDMeFBo+OYcIPDTxfVSfbXWa3ICmPbBUMfBp/o03geckDlK613QMheiEUVX/y
         B8jmDmmMWFSRmPCdsonorl7eqoDIFzt+v7ym9aKJWuw9y24bDzM9X6on087pKvysVOlo
         XOMm6kSlqlvT51LTksRqEhccXgY1TUEzI+andMY9rD6fsZyaSilhmaRtC//Y5izo9BAX
         HZvF9cWGaH/+uS0aQMSwZXZmh0V0wTZUSnDScjUUXOqzuiPabrWkXV8iNlsAmbFsH0qj
         0Kwg==
X-Forwarded-Encrypted: i=1; AJvYcCVvavDSBx7ugeebmp9ZVxayrloZEfEnu3VRSQdjG+u5jn8jMVbBeS/SWE+QnVzsMkv6+CkXlb3g2JMC0KU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNBV5rJAtH8BfRLvYQiI5tkA7xCASuKe+JQjdaHRensRFpfmVI
	BHbdWOeRdUaAHg9NgXLMT6mUvG77k57RP26UPJ13VZrfLreU8Z82
X-Gm-Gg: ASbGncsEEvJ128xaaWqLHWZkT74e3F8PktItfqfAZalwf9wVtJevgS8m/it//DvEOY8
	ypgh0iUEjNvOSBF9M6UbHLNnO0yiHRc4YLdqb7Io2OGgzvSks+jx3OgZkyG5r6FK20GmMJzsHLN
	ppXPtO/Nvt3DqW+4jc+0WL8yqKxAThkb8WT0YMAITjbVjzJdpV0vxCV1kCLDYjE5S1YW0p5+n/U
	T5jslGESjLr79ChK9x+vTA/XzZYQGkvdp1k5SmGNuAlHa3lCBgz6xhpz0YW+OHDGyFR55Kymj/I
	que53uK+Rt3fqahPXkeI0gd/YJmTtfRekRv9rDY/tSTN+kxQ0zNySA==
X-Google-Smtp-Source: AGHT+IEcKZfM+lOx/8GKL/Yvk0GPY5U/vX8nAHGFiSIYfuBFOB1yJd0EU44QndwgWALhZ0C2d8I5Wg==
X-Received: by 2002:a17:907:1c1d:b0:ac2:84db:5916 with SMTP id a640c23a62f3a-ac738a78c97mr1720049566b.31.1743617315695;
        Wed, 02 Apr 2025 11:08:35 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f8cfsm942503866b.123.2025.04.02.11.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 11:08:35 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH -tip 1/4] x86/idle: Fix argument type for MONITOR{,X} and MWAIT{,X} instructions
Date: Wed,  2 Apr 2025 20:08:05 +0200
Message-ID: <20250402180827.3762-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MONITOR and MONITORX expect 32-bit unsigned integer argument in %ecx
and %edx registers. MWAIT and MWAITX expect 32-bit usigned int
argument in %eax and %ecx registers.

Fix the wrong argument type by changing the type of the corresponding
function argument from "unsigned long" to u32.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/include/asm/mwait.h | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index 54dc313bcdf0..3377869ff2e8 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -25,23 +25,21 @@
 #define TPAUSE_C01_STATE		1
 #define TPAUSE_C02_STATE		0
 
-static __always_inline void __monitor(const void *eax, unsigned long ecx,
-			     unsigned long edx)
+static __always_inline void __monitor(const void *eax, u32 ecx, u32 edx)
 {
 	/* "monitor %eax, %ecx, %edx;" */
 	asm volatile(".byte 0x0f, 0x01, 0xc8;"
 		     :: "a" (eax), "c" (ecx), "d"(edx));
 }
 
-static __always_inline void __monitorx(const void *eax, unsigned long ecx,
-			      unsigned long edx)
+static __always_inline void __monitorx(const void *eax, u32 ecx, u32 edx)
 {
 	/* "monitorx %eax, %ecx, %edx;" */
 	asm volatile(".byte 0x0f, 0x01, 0xfa;"
 		     :: "a" (eax), "c" (ecx), "d"(edx));
 }
 
-static __always_inline void __mwait(unsigned long eax, unsigned long ecx)
+static __always_inline void __mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
 
@@ -76,8 +74,7 @@ static __always_inline void __mwait(unsigned long eax, unsigned long ecx)
  * EAX                     (logical) address to monitor
  * ECX                     #GP if not zero
  */
-static __always_inline void __mwaitx(unsigned long eax, unsigned long ebx,
-				     unsigned long ecx)
+static __always_inline void __mwaitx(u32 eax, u32 ebx, u32 ecx)
 {
 	/* No MDS buffer clear as this is AMD/HYGON only */
 
@@ -95,7 +92,7 @@ static __always_inline void __mwaitx(unsigned long eax, unsigned long ebx,
  * executing mwait, it would otherwise go unnoticed and the next tick
  * would not be reprogrammed accordingly before mwait ever wakes up.
  */
-static __always_inline void __sti_mwait(unsigned long eax, unsigned long ecx)
+static __always_inline void __sti_mwait(u32 eax, u32 ecx)
 {
 	mds_idle_clear_cpu_buffers();
 	/* "mwait %eax, %ecx;" */
-- 
2.42.0

