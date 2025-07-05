Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771C5212FBF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 16:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731308; cv=none; b=N80IGU9conATwXtI4+C6jLODWuzs/bqBIDVyUwHGsqxSFvsb5+ekygV25bkaLIO6sATsLco6LpWrt5Ye2oebAXtVUxpaD0wQL4DZ3/LpFYkZoXCAviIfyM+vs3VqVTmBt0zd9nNDMYuAoHETtpfsx7L39ZxOtH80Il81oAaObu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731308; c=relaxed/simple;
	bh=Ky7AqemCkVmMIAjThO44EJNBWsdKFa4UkQ6VX2MCZ/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hG+G08AE0u3Jh1TFY69Bu4QwS9EEKI+8ZGO5wQkMSG3MhMYZr5K6X9ETBOAOgWW/zSZDhexf4ZQH40xdDRqHDkQEUHxfVAaIUhS45VOmtsV09Kh5rH1gMckxwplLBd/sQxQIYvgTKwe3mhl+GgGSx/WVQbnH85m3Vv0dcKAr/7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b38KISmb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b38KISmb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so9593895e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 09:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751731305; x=1752336105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sz6y/dMCpkhUsvhC6eoGg/wj0MWvy9QjBo+xiW98H0s=;
        b=b38KISmb1gDsJ9xQ9O7cEgz6qE03Nep+P10ZqlmUcnw7QlT0FK0x49MrFM0+x/1T4G
         mr0PCAvVvIlUzMbz2+4RJWV0onzPx5DevcyWiDssugEfLElUa4JDVjIy47aoDJOIzFKT
         CiUr69B5uiUDPOB6QVLXuAUKcDCrXtrgfsP0SRXjwNb1RqMEzJBzp4cTcxglkZhX9qCL
         oP3sI+tyuWQALWlHRwdrm2V+kE4GG9IT0GHv96jMEWSPfhAemcx/bxffs9Kfyxf3wUaI
         ILypvR09HiiVeN3yW2V4Ko9rer2NxvrugMT0PPSX1FQsr3Ik6tr97TdxKR5UF93FyaZk
         xHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731305; x=1752336105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sz6y/dMCpkhUsvhC6eoGg/wj0MWvy9QjBo+xiW98H0s=;
        b=XnhwePhcyTQ9ac6kim/1knobvG5Et0PXjy9okw2IQEAWconj+ysoWe/7+oy3sDvriV
         asIU/upOYSoB7W+fTZjaoHqTuJg3wsj/yVkoNhoxETYDkmpEGq1a/bNbIa8x3GUBoI5n
         Xzho9mz9Pjgy5YHdYDOxuOkANZNfOo1zcL4ysRraYAf/moBybIdBzpYHLXwyeNRvKTRG
         2APBEoLkZmw01yhpkHqQRZLLQEipeoY/GdYTGLSCSXlKl/1av48a0xtsLQAqq/X1XZxW
         1PA+Bq9JXwb221neTMiZXGwn1x7zkhJgr9upyd0+H4LcABZkJnHplUZVY76L4zT5KGGH
         nZEA==
X-Forwarded-Encrypted: i=1; AJvYcCWnmHx91XcxVYjDxZk0h7eFXromE2a/UmwO+uKMyVO82RAFXZThc6//MP/yCH56k4K+9pYi22xS5y30yXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDuIUhdWvb9sb42YIh9WI7/qdNlzbPZoRjPi6RLHRTUF2E/aPt
	8hSzLJLgIlTXMZsxPCHCLmVL/RGGkJxLsKMv8WzqCur19sJQnIcO3O9ft0QLVckOFN4=
X-Gm-Gg: ASbGncu1xW5XQ/kBSnBhDPbk1O2deofegEIngDmOiS3wfTNK8seyZe9VZQhYbzkx4w5
	llhxZ68IGX9Smc6OXlmJGdKLaVADdJGME3RpOk7AgJz5+CSFRriJ/YcPMU0XllChrNF8yxtsVdN
	khGuPVJCbuyar/rN/s6jpdAtTu+7l6r+uoUokr/0oNHcab90cIUIn+uhVtoCHA3TTXO5eQsQ/ZE
	PtfGkDqR/687X4HB0plMl8c1ejuC0jI2a0139QV8xLVdvkIqDukmnEPx7J/ypYIvCkiw41OKVnn
	voLgVYFWG1C9TZe/eXpziX+ulo/FPbrt5sdwajA01TryAMtHuQagDeUGasjUsrZSaVnGjUR6Ua/
	rcIZE4EEjUoFvtzKhwNDcBF0=
X-Google-Smtp-Source: AGHT+IHETSmktxEuvLP4pPS1LA3IJRD6F2uDZwYlVN6Nlz5lL2Iwx7RNDqDILpAYuY3Ncdmjd47oOQ==
X-Received: by 2002:a05:600c:8b05:b0:444:c28f:e81a with SMTP id 5b1f17b1804b1-454b3187805mr56230075e9.27.1751731304637;
        Sat, 05 Jul 2025 09:01:44 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16990aasm57709375e9.32.2025.07.05.09.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:01:44 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: ghennadi.procopciuc@oss.nxp.com,
	S32@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/20] clocksource/drivers/vf-pit: Convert raw values to BIT macros
Date: Sat,  5 Jul 2025 18:01:14 +0200
Message-ID: <20250705160129.3688026-8-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the BIT macros instead of the shifting syntax.

No functional change intended.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-vf-pit.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/timer-vf-pit.c b/drivers/clocksource/timer-vf-pit.c
index e1f1e66a2664..be71c215d641 100644
--- a/drivers/clocksource/timer-vf-pit.c
+++ b/drivers/clocksource/timer-vf-pit.c
@@ -21,11 +21,11 @@
 #define PITTCTRL	0x08
 #define PITTFLG		0x0c
 
-#define PITMCR_MDIS	(0x1 << 1)
+#define PITMCR_MDIS	BIT(1)
 
-#define PITTCTRL_TEN	(0x1 << 0)
-#define PITTCTRL_TIE	(0x1 << 1)
-#define PITCTRL_CHN	(0x1 << 2)
+#define PITTCTRL_TEN	BIT(0)
+#define PITTCTRL_TIE	BIT(1)
+#define PITCTRL_CHN	BIT(2)
 
 #define PITTFLG_TIF	0x1
 
-- 
2.43.0

