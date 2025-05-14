Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6B41D63C3
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200216; cv=none; b=bPT6N5sSt+sFR3wnc0gI+B1fv5zimy2Jb7jTjvv6RynUeQ/QFUn7k/0X1HKuXhAXXEYpLWJftwCqPPxuVGh5dqreDbSieap4z+qbkGjhmlLFESpV2CU67AZMxWhjFoTKoUdlR/VjDKJvE/pAoFvyIC69R5Im8IsZdybj5g+WYpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200216; c=relaxed/simple;
	bh=zfRw9Q6wMM5hfi/a/N4gYjmSXwSiWk60aFMz9qmobxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fXekazEqrrumg5c7vLSBF+YkRlyZ4GjylTKwxToQ/JGWPpNYhTJ5t82Z0XIkzLAogom09eqhG8KE4EePRKDZxAaQ9x/smG6NotWDph7m6syCldSNO+tn7Elr3Kmd2YfgrfcIVfyndstYLgtAAwPa/yaw+uKXMgCDcleTmaGfpOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyA8C2QY; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyA8C2QY"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7426c44e014so3017725b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747200214; x=1747805014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=goylnnXwS8ybZyEks8opAvaKL8A6WtBVF6S/CDmfx2I=;
        b=CyA8C2QYJvlok4viOB83Iy8/qzIL5voatVUYNOqdFHoP3usD/C4SG0MiBBe4NNhlCf
         aJawv6XInCR9E3BhhLMXp6XJ/L4EHZzVoQXqj/6NFGY51kSRnyORTrmMIPXnyfcpCMs+
         nWe2n1wGpjuS3thNbAhTd4noNPjMCQB8uQGjoh2Vk6JOnseVqXoBl1qMQ7uXp9R1Uecg
         AsukubwMF/AocxcX8cRXcITiV++Xmu7iMKZqdHvcO4WQRMeY+0Dhn5vaTVFo2CE7m+pF
         dJSjK4JzJpw3cUbhGXEc18eSMcQmn7V8mi3lsOiQTPmzVkpey3wlDEq2/LfGXTnv0oKd
         U7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747200214; x=1747805014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goylnnXwS8ybZyEks8opAvaKL8A6WtBVF6S/CDmfx2I=;
        b=W0bDEBVvp2y9cOdy806Q9DRn4ZjweOeKDfNZZ/dJQEwebpppPLc3lKET8UJi8o+vIo
         izTrAqiTRBLwg0twZ88kg6HKJUtpzSrCCNMGUSk8EOashZK6wUwLMfLXoN16ls/Vk30Y
         pGUGDeY3GH60ywaLf+a+LisxbcROA/7K60RJovwRJxTb53n6V64XoUEQAWdCPRLDn0VA
         flK6hY/kwQNgfzFVi4zIhcpR0Yi4HGfYES/gX/RGT/Rv4Ka7wFIv0Ihy6hhfacy6STdM
         4An/CzalSdFoJTn1PqyzWbTDNbkNVe5WvwyqnumQGwWXrK8yr+jRbpdTwGuIgfIdQmJ1
         c01Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKW86D1la/UoXVvoZiLNpAk1clrKHpr3RveccAVmnf4WfVw5kWwGCUd8Uldp1ObhziwcuQRyQJAipMLlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzytDEiqUL6mKpmYx0NCrBHbGPrKE432tkN+GQJB0BVeol8NNkl
	qebXpiAkDZ/Km7eZjKEluVpeiCRxExvxuXySYqqtf1+Ax2LK41O2
X-Gm-Gg: ASbGncuZEF7tkrYxQolh6n1YaapYThcjC57ucciQdU8IdXMT6Ol4XWLYLxjhdV380OF
	hAiWLXk6/GRuphlKwERTI04feJd7aweEG4syavWbLsOo5/XO3fnnziNYuILQGByzWBYV7XbVjYI
	On/koC4EbAtmwrTI6SmQLSEvZ/xOOp3dC9OwhsV6tOGGfogJxt4W9Rpig8BP3uGRKJzCqZ0JhHv
	Ajt7yRX3vtj9xLg4P9yGFjefEHQBCUmZnAf6eweqOdLHE3CuDCzTXPkCjnBMZuW1u+O6It18gF/
	a6Fp5wBas9DbJtY/S+aHyAcw87+vXxV8p8fwDhzmsJlAz68f7Lp5zfOr98u3o9ujziq+pw==
X-Google-Smtp-Source: AGHT+IElzChTEhLjYwx8jW3A4q9KnQyI3f1Xl4EGUUaR9HnsdocrPUlzzgKm0VhWDIL9nynTBByXJQ==
X-Received: by 2002:a05:6a21:398c:b0:1f3:3ca3:8216 with SMTP id adf61e73a8af0-215ff0abd4bmr2898128637.5.1747200214365;
        Tue, 13 May 2025 22:23:34 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.228.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b235199034esm6864786a12.66.2025.05.13.22.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 22:23:33 -0700 (PDT)
From: Siddarth Gundu <siddarthsgml@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Siddarth Gundu <siddarthsgml@gmail.com>
Subject: [PATCH] m68k: apollo: replace strcpy() with strscpy()
Date: Wed, 14 May 2025 10:53:27 +0530
Message-ID: <20250514052327.96537-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() is deprecated; use strscpy() instead.

strscpy was chosen because the code expects a NUL-terminated string
without zero-padding.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Siddarth Gundu <siddarthsgml@gmail.com>
---
 arch/m68k/apollo/config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/apollo/config.c b/arch/m68k/apollo/config.c
index e161ecd76035..d4cc145e1611 100644
--- a/arch/m68k/apollo/config.c
+++ b/arch/m68k/apollo/config.c
@@ -7,6 +7,7 @@
 #include <linux/rtc.h>
 #include <linux/vt_kern.h>
 #include <linux/interrupt.h>
+#include <linux/string.h>
 
 #include <asm/setup.h>
 #include <asm/bootinfo.h>
@@ -218,7 +219,7 @@ static void dn_dummy_reset(void)
 
 static void dn_get_model(char *model)
 {
-    strcpy(model, "Apollo ");
+    strscpy(model, "Apollo ");
     if (apollo_model >= APOLLO_DN3000 && apollo_model <= APOLLO_DN4500)
         strcat(model, apollo_models[apollo_model - APOLLO_DN3000]);
 }
-- 
2.43.0

