Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3591F2512E0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696721; cv=none; b=YD49Z6GfYwuaNZ+bwzttmIv7UXdWCy/fC7TFDxUa2e32AyPITaeYJXoHujdtw6Lta+G9MtCnH0rSMLhpkZsdzSrbTIhbL/O/702cy1sHlL9YPz0CFoUG3v+DG/7T0orLrqjayC7JoMSpacDCJXJQPh6qia1ijdoryx9l8x/WOgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696721; c=relaxed/simple;
	bh=xWKvujlEc3a1G/hEnaEb4bbqAxOmpfHOmP/ZHXTCPoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AFYAB9sx6iTAOTjGDnBXuytvVuledOOKM8aG6JBjIHWvD+eTjyFYIdr5vB2ZpE93PPFh8Zb0PnKzES/FjI/27uyJMeXjD4hftnSzv4VPq0xOF4F9q42EAEaa7SO6A0BiHFEKpOnr+ElFzghIXwwLKexOr5Gpmo9qYu0FWcDpIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZF06Q79g; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZF06Q79g"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso980736f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743696716; x=1744301516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0qah5r0YxopdSOr3j8EB+UePdxFcMbP+QyWfcyYnfk=;
        b=ZF06Q79gpeeZJqR2sSQoJmY3m6ysRNnxaGVa6jNVWfEELTtpX+Im0IgY/mV4/UdZds
         3Lgm+enRane4PZ99GtwX+qoXPX+nfqqzOJwhNk07hvCA/weUIzvhlpX45h/nOAtHGL9w
         cZ8XuXyU19qfsU/4zFPtATYCPDY2JWSM+AppvEPaxkqZlF0URtRchevw05942zmldiW7
         sJSEi1b/qncMb8AiY6NVpGJuIPzY4i6HDZ/VW4zqWRsyBopHqm1trqebY/80jixFj6Ld
         QU50J9avKkf+wGWj6Spx8Yuu2TKOGBYM30MCOm8b/EBtIveezTwwLJH5KCZx+x1TEQLV
         QZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696716; x=1744301516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0qah5r0YxopdSOr3j8EB+UePdxFcMbP+QyWfcyYnfk=;
        b=l/lhk9lBQzKHZQya8VnqC6Om42TpzWyGg3JkYYCrjTGHhGtbUyosU/c6ru2JhWNGPH
         kpSa6tY4d2HW98O1q9iO3gecAEykr7JHHDnqcMx3senvfftTtLijGYQ7JWTBjzsjhay3
         bPhL3vdsbcqI7QN9kRcePQpwOFdLDDiBoAxytCWvD+eYmd1zbKevFhl2kenssn4DC0OB
         Aj49rH6RhKR5JTMNKwuDJhnCWs6SvbWNFtjStRc6XYpeOuTLmMxBYsgvwjnD//7Q/Xi3
         BZZDqJhaNl3vRlGXTRKMiZpNChRVYm1o72G13kXFc29awL2KNZFl3fxUfLeRGUih3Qje
         j5uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUi4kkNweHKtLsZAtNk7zjrvZ4RpivSlzXDIPqHESHF1EP7J9cbcOo4EdxbY20Q4YRoeFpwqObvtzOXgyw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq86pcJc8rfwwiwY9qM2WKr2QdogWZKqh+z1iPhr6EEXj6WtNF
	umekfNpKV1NCiEHSe3ViHKqY+w0HqVY9Sbfy3AUAZE6M2vCcOpTGSbv48E8PZK4=
X-Gm-Gg: ASbGncvLQohoApP8sRZiFPvz51ghRniMiaBHBf4RYjpg3VzKnoGyn9w+WcfoBzLFCKF
	EU1zboZtqvhO9seqcT6eO4kj7eI6Gkh3sAwG5m1eVZaq7KtpAjzuLXF4sTPhirRTwQQdVlNwk1i
	AbkTcBh09vHBOY7uGxaa5/JyBUUrwVMHpJR8iOu8vhVuSErYXuy3C2TrGRGZL1rk8ShSGC3mEeE
	L7VrLKqn+m5nGhThPb3ECjaasu+HwFKWtZ6rgGrHQ9hFGlw0NKJ0Li/65+Y7vho3Ub3wTKP02on
	WGac1kwnccIt4YLIX33giW05JlPZ90dxYu9Vyi/oQXXJlt9tt/i57tF5ndn/lke1/QR127xWF2+
	dWw==
X-Google-Smtp-Source: AGHT+IGHiHks5yY0kEiPYjy6t/YMBcLUNF8gYXeM9L8Y9BZZqlH8uwv5gbCILM3Ud6Tju1r2KbkGkg==
X-Received: by 2002:a5d:64c6:0:b0:38f:39e5:6b5d with SMTP id ffacd0b85a97d-39c12117d3emr19232449f8f.44.1743696716567;
        Thu, 03 Apr 2025 09:11:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226acfsm2112383f8f.88.2025.04.03.09.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:11:56 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
Date: Thu,  3 Apr 2025 18:11:43 +0200
Message-ID: <20250403161143.361461-3-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403161143.361461-1-marco.crivellari@suse.com>
References: <20250403161143.361461-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing .cpuidle.text section assignment for r4k_wait() to correct
backtracing with nmi_backtrace().

Fixes: 97c8580e85cf ("MIPS: Annotate cpu_wait implementations with __cpuidle")
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Acked-by: Frederic Weisbecker <frederic@kernel.org>
---
 arch/mips/kernel/genex.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 46d975d00298..2cf312d9a3b0 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -104,6 +104,7 @@ handle_vcei:
 
 	__FINIT
 
+	.section .cpuidle.text,"ax"
 	/* Align to 32 bytes for the maximum idle interrupt region size. */
 	.align	5
 LEAF(r4k_wait)
-- 
2.49.0

