Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C073D238C06
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817567; cv=none; b=sQbgefRAoxhSwj+MHpHCxu7Cacoa76Aqnh2TqOWJ4+CqUudSAxK0J/j2j4WvQBEdh0QhOWftVtwzT/DmG+HHkNFs1u4ZitXLykayapgz9+Cm0RGjvOessM6RF0UPZw4FvmFc9a4c9ShQiEjQGZcFqjcDI/N79/jNLcI6UDaiHN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817567; c=relaxed/simple;
	bh=eQajN5+UbdrvL/Ldx+cW08Rw+DvkHOtvlerZlZaLVIc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z/MYx8j67Srs4NedefNuUu9cdKpHjDfxTE/2GVL+eWOusq1qbpMJQEL/lqFPN571LSdggoRmBkP4p0wUDUzGUGWbIwDXfF0wI2rr0HCUfQnK1MDEBZ/a86egRKDb4yv7lWupPCr0y4nOM3Fh0yxlDjyly6cIyl0UVMwqLSMpUgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OGdhIULB; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OGdhIULB"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6021b8b2ab1so1407652a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747817564; x=1748422364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AJiY0dAmnB+UfH+dZB+4EMvY/rIoAWOv1DKKoc4lGzY=;
        b=OGdhIULBHBbMKcDHHRiWU9+pYHfg7NVHxds6zUXTr1bU6WW8WrSV54U/jxlijo6lDR
         kikXnYDCY31szHC7JYEnpN99RsTZIrjIcFeEEQyn5SqdP8DDdoW2fh9egermDUNpLLTS
         amulE7jZ+f1quVA/ECU60BlmLgyM5tigKENZE5Yg64FD7iZOvpbMoPLJMMGCUNDDlSV4
         8x0t32TpFr0LCCNIiKjekQqtN3/sfQIcoalDvxU10ziL/iiwjFaDWwykHPrsy0sNLF5N
         I3hVioymMuA+WLqynbjI4g7k/oqdSwG+isd39KcMG58wwthojtGrNB7dRwrPdoJi40mJ
         HIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817564; x=1748422364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJiY0dAmnB+UfH+dZB+4EMvY/rIoAWOv1DKKoc4lGzY=;
        b=cYV9n/wNFjJ90OqKwwV8erMC3oyKSJ80fgES/pudVhuwr2xXsiEuGUh1dcKBrvvgQu
         4lN+xTTEr79aGq6WhLycl8MTu2urhImsxUeHYffgUrinBoaVpcKzj8QCHfhdVnzky3Xn
         aKA+uPpk+fCXFEUyPuUhSeK15n6uz1nV/vpclTm3iCXAXeARbcNW9CMwL7fVmRppBgXI
         Zuws+Mh/JMlUIn4Uc2JM+jnfvqvJDr1kq/qt2dXK3zS5x/Dmma67fPCCDn3L7lRVRtDe
         0XgRrJWNRa21nuLmerdKe2ZReWkgXoCxgsgEVyiNzl1JFSaJP2a7QhEAzdbDFbdJttZu
         5KHw==
X-Forwarded-Encrypted: i=1; AJvYcCWFY5v8HePOrqYTPOVM1SYZoKKfid2paLF409sVV/3dq+AbR+Tl3g9pEMtYEY9aIlopqam2EuBIG5ktmkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2qZooIOAHK+eVFVsX31/R8HeIS+ASc/iTAzTkC1657dw6eUTS
	0Dnkz35DeWUSOV7AG0k+MWvo9KsL6LpLhkiZnLR+DU7lIPE/nI9iFyZqqyNBfFoWWMAE9/ho5M3
	TYZnk2kMz3w==
X-Google-Smtp-Source: AGHT+IHodq3lfHyQMerCm9zhaqia2XNZzzZ97Yu+SrSWxOmKu2QUwAgN+tooDQfU6PjuwBDvc0+HRmp7rGR+
X-Received: from wre8.prod.google.com ([2002:a05:6000:4b08:b0:3a0:b8bc:21a7])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2907:b0:3a3:64b8:84de
 with SMTP id ffacd0b85a97d-3a364b88753mr14075533f8f.1.1747817552748; Wed, 21
 May 2025 01:52:32 -0700 (PDT)
Date: Wed, 21 May 2025 10:47:47 +0200
In-Reply-To: <cover.1747817128.git.dvyukov@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747817128.git.dvyukov@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <0c9f35189b6b98b8770ad2d886b3f275001b728c.1747817128.git.dvyukov@google.com>
Subject: [PATCH v7 2/4] x86/signal: Use write_permissive_pkey_val() helper
From: Dmitry Vyukov <dvyukov@google.com>
To: mathieu.desnoyers@efficios.com, peterz@infradead.org, boqun.feng@gmail.com, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, aruna.ramakrishna@oracle.com, 
	elver@google.com
Cc: Dmitry Vyukov <dvyukov@google.com>, "Paul E. McKenney" <paulmck@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Use the new switch_to_permissive_pkey_reg() helper instead of the
custom code. No functional changes intended.

Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
Cc: x86@kernel.org
Cc: linux-kernel@vger.kernel.org

---
Changes in v3:
 - restore sig_prepare_pkru with the large comment and
   make it call the new write_permissive_pkey_val
---
 arch/x86/kernel/signal.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/signal.c b/arch/x86/kernel/signal.c
index 5f441039b5725..27a66a0697dd2 100644
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -28,6 +28,7 @@
 #include <linux/entry-common.h>
 #include <linux/syscalls.h>
 #include <linux/rseq.h>
+#include <linux/pkeys.h>
 
 #include <asm/processor.h>
 #include <asm/ucontext.h>
@@ -72,10 +73,7 @@ static inline int is_x32_frame(struct ksignal *ksig)
  */
 static inline u32 sig_prepare_pkru(void)
 {
-	u32 orig_pkru = read_pkru();
-
-	write_pkru(0);
-	return orig_pkru;
+	return write_permissive_pkey_val();
 }
 
 /*
-- 
2.49.0.1143.g0be31eac6b-goog

