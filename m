Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78282494F5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748338537; cv=none; b=IDdw9iFOqctzhUrfN8kd/OulEHvuCMXFpuWZ5MZuQCsCEnoDe1P8W6Xx7Ig7piqCzWvjfynySkk0vdsEglyITdxXR9b6iN2rTy6Fdrl3Y5mFqPHe85Kthp+PcH+Uq26MRz+rC+/wyivW+Tsh5hgsr0Q5KyZBQ81+DRaSu4GT+GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748338537; c=relaxed/simple;
	bh=Wnm3koRQ8G5EYdhIQvsrDwQZTREYgxacjvE+VsFjNO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SI2EQaCrOM85RohHlw+TclUKfiA6pBoTtPkREKR5+e4Ce6oHg8s0fRyUvECgywxoqP0IoP/b7eP5O06cBxi1igumDW+0re64tm2OiszmvJY02qqSW2W3vespDM22p3OKX/9+O9UpV8BykCLLj8VyFdLbsIs6tRgk80IE9H13QRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6KQf48D; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6KQf48D"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af5085f7861so1555327a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748338535; x=1748943335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6993xgkMSdnABYekvT8YV7euLLfszrK5W5NkvKD+kRg=;
        b=b6KQf48DLdlM5gsD4RxS0gQmgP8jAQsB/Ff9q6Rca+WF1Lq8lfckqQ43uieKwO/DVY
         ldAHsgfPFVw/yTYCx8AQrJ2uqzFnR3Ju+hGeRiLPzvcGVnLsTfUrchF4bVvBBxBGzwKA
         OinH6ei/tBunF7oijqboxhEs1vwqM5yyY7mSsl3Pzak/crYV9OdnnNzXl/MMAsiY0tgs
         wYA3OAKcf5YWsQGsg9eT3bOgtiP8AQovToJwbpBx2NX72r3lWIRSPAXdb+qhJY5xm4PI
         c2uUOnfjwgGnQL+nHDsPOuPsU/jUBM4cUlkj5DY4NsjUMEFUa6hfCobYIT+E2MldX0Hu
         4GkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748338535; x=1748943335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6993xgkMSdnABYekvT8YV7euLLfszrK5W5NkvKD+kRg=;
        b=KZm5c0ugdY9P78Ez9lpJC2zDdRFXBSqsnkoLU+aHVmsOk8aeo9I4q6rxCwvMDkDaG8
         CF0Mvzi86vn+7vB+m3SKMWVlZQ1Tk6VSIdDxpxI7d8Zq9DjvArxWli/a5wfyFy2ZcLpw
         TcM1Rlpzxms0STwL2NCQWbRJcpy4kt3nl9RKlhHK25T360PZYHhxOfwsrDBm1PINiyBO
         jpAag+UfJx1A4mwxZPNDUWJ+J7eCatuq1qlSfUTR6gdmPp1k4R+UyxtDJ7Rj5EUmG885
         38LYM/ORYkx6gdpRoW3oiVYgd61HifJGA8LwmFhzemmNSBXRWeggILcg+xeCnPDvyLzi
         ofIA==
X-Gm-Message-State: AOJu0YwLPPtkuTcWu2cNLjLuNm6KlTUKGBUpvmkFeUx1c5qLUOmbUFS+
	xOL6sbDMv3vzOXv2hTYGe/Yvc85kl3/lKnQxGaWYvfYST8ilRXzgoQ6N
X-Gm-Gg: ASbGnctKRY/p3K9QJdWLzO2QcY8ff2FA7y/GSfiVUFVt26329fT4AvMkoLCexdizATh
	9KVpmfHZ4Xwy1qU9qMIEX7yuidRFVO4HTdlnP3W2Yj03nTDM0NeojF6L+ecY7V4aDvtvJdl6sg3
	ssNPfMDVtmsog4PyW2lkjRxpXIB+vmwNS7nGLIcjCVAyq5TgYqCyTbganjPVbpiwTbgRjO+zjOb
	Q79VshzzyMG/wU2M/27xShKdsAELwKmn8TasLpRyXsOIE73vVktxb5PlCiwLMatXf9t+mbNZ3vh
	IgWA0AERYXinXP6yiOPez6Rgajv60BPDIJJBf4aGa0dezytuQsePF5wkqA==
X-Google-Smtp-Source: AGHT+IHOtK+6iCHvraosQLQ8K27/Xw8ttnakSw2C25MhOYjco0nnORqPYSAihSX0HWBxXvDz2WR0Lg==
X-Received: by 2002:a17:90b:4d84:b0:311:b3e7:fb2c with SMTP id 98e67ed59e1d1-311b3e7fcd0mr1793621a91.13.1748338535059;
        Tue, 27 May 2025 02:35:35 -0700 (PDT)
Received: from gye-ThinkPad-T590.. ([39.120.225.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b2d80sm13795313a91.4.2025.05.27.02.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:35:34 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org,
	Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH] irq: Fix uninitialized pointers
Date: Tue, 27 May 2025 18:35:30 +0900
Message-ID: <20250527093530.958801-1-gye976@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix uninitialized `ops` member's pointers to avoid kernel Oops in `irq_sim_request_resources()`.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 kernel/irq/irq_sim.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 1a3d483548e2..67fd1de5d197 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -222,8 +222,12 @@ struct irq_domain *irq_domain_create_sim_full(struct fwnode_handle *fwnode,
 	work_ctx->pending = no_free_ptr(pending);
 	work_ctx->user_data = data;
 
-	if (ops)
+	if (ops) {
 		memcpy(&work_ctx->ops, ops, sizeof(*ops));
+	} else {
+		work_ctx->ops.irq_sim_irq_released = NULL;
+		work_ctx->ops.irq_sim_irq_requested = NULL;
+	}
 
 	return no_free_ptr(work_ctx)->domain;
 }
-- 
2.43.0

