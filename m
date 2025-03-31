Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2F421E08D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462053; cv=none; b=fviWhxKSgXOuxZIw0ECddrI9SdAxGchDgVJQOLL/PLLanutEzy+JiNdMfGQSEFi7N90Qz0xMBWt7SJcKwlIQZ8MGqAmqo1z46/QJ3kNI+ulALu+4jkgc9pCPpZUaitv12d/FI7IiaImSNHSy6deGqpTFhD1gJxpWobxFgaD+mCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462053; c=relaxed/simple;
	bh=KGOLMUoqhgT8o6lRGzM2BT8QYWSv9CekKOeXvgxXs90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qxRwC30rj9onoHSnk+D/LA8kkGX9tiHKPpOIU5XAuj8PqMBO+m+aAIiHa1wX5XExaBjALsoEBDT77ovzsBlwQMh66WE8eY3eBzKHv7e0zxZPU4J66dOmqtBpYfKAkRZXabOWX8gQzr339pvx2Q1BcS4QEQdayCRmWO2UIr0kpeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wYQMkyZy; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--willmcvicker.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wYQMkyZy"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2241ae15dcbso115799155ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743462051; x=1744066851; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=;
        b=wYQMkyZy8N9nZOYzO6KxRqJQvrUmw/4qH1j5bWRqEnMG1kDYwCOC60d/rny21PuK8P
         yYws+zq6B7QuxPCVvxx7lKf8U4s/kEKM25fVsC6JE8wCTDYn8LDBvzgAm6WePaVaduDB
         pPg0qT9JZrQnK7BJoI3+GVrRInOm0pz8PD2ykJOPFDeduX3ncidrgARhyftvTHT+dokQ
         oApg/Ei4yUsY3Adods0S0GBc/cfpGnZMsESchzBUHv8VZQB4QVRlNxlDRR7KCHuPYPuW
         KBS2D1QrOsF0FZHn2UoZQAS4lKGezNQWLpytH5s0d9j2msJkqa1WkThupR5Wz7D1121X
         9GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743462051; x=1744066851;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wAloBg1GSJoUoSs1Fe6e5szwOsXLtBgN31oDTUHQ8I=;
        b=bEcfoaTDJ/zT0OjVkbDU2BLXj2q2f23+QD8h3YLZQhdTtoXunARkoOlyPEGjemG10n
         dANOAbdisu56S4AyNSnSCVaH9dDbvyWsq5/g1QSVQLwLQJAJCJgfGg3NhwufpA+cmSCW
         tIYNvPw3JRnTILmIARFeml/fgw0SJp18B4yVeAeOFxWuftPswAt21uk+9WScvhWL/W4K
         FzNbmY1++ZJUt2G4axv2gg3ba8Khkux/SuONaaTxLDz6bg3E+f+en+/VryRlU6fAbG1G
         nS2wAAz7K/RUcdA03wXvT50a6N7y0sWnsib0XqJOoEWAAsKIuT1BJJ3LSCYS8fBsU0es
         fdsw==
X-Forwarded-Encrypted: i=1; AJvYcCXGBx5/UGlt9kQ+qCwHj0F2Zt68K9vgQBZWr5MHt8yrSbjfTGAyX0y/MgFVeYoUgwkcK9uOrFwCM5IJRrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVSy4ZtNgDQxxrnmxRFcf/weYfzt/mCN6iw1Y7hS+xcjrgowVp
	cxf18lzbGOnLZRdStjCJt+O/AliF+Rr3eT4BD3nNH8vcOx6Mi9EPZ/NQ+wugnMuZ/0kjtZfNqBY
	STCZJe2gopiCePJ2C6BnGTqLhuQ==
X-Google-Smtp-Source: AGHT+IFhkqYe7aFPYhXhB/uXFuJRx2APqvedOXzVTYhLwQ5pf0aEv93uw3ToHTM6Wa3C2QveIbk5Q7eGKFiWITWBEiY=
X-Received: from pfbit9.prod.google.com ([2002:a05:6a00:4589:b0:736:5b36:db8f])
 (user=willmcvicker job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4fd3:b0:736:53f2:87bc with SMTP id d2e1a72fcca58-739803994b1mr16712693b3a.13.1743462050772;
 Mon, 31 Mar 2025 16:00:50 -0700 (PDT)
Date: Mon, 31 Mar 2025 16:00:26 -0700
In-Reply-To: <20250331230034.806124-1-willmcvicker@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331230034.806124-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250331230034.806124-5-willmcvicker@google.com>
Subject: [PATCH v1 4/6] arm64: dts: exynos: gs101: Add 'local-timer-stop' to
 cpuidle nodes
From: Will McVicker <willmcvicker@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Saravana Kannan <saravanak@google.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Will Deacon <willdeacon@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Will Deacon <willdeacon@google.com>

In preparation for switching to the architected timer as the primary
clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
property to indicate that an alternative clockevents device must be
used for waking up from the "c2" idle state.

Signed-off-by: Will Deacon <willdeacon@google.com>
[Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 3de3a758f113..fd0badf24e6f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <70>;
 				exit-latency-us = <160>;
 				min-residency-us = <2000>;
@@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <150>;
 				exit-latency-us = <190>;
 				min-residency-us = <2500>;
@@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
 				idle-state-name = "c2";
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x0010000>;
+				local-timer-stop;
 				entry-latency-us = <235>;
 				exit-latency-us = <220>;
 				min-residency-us = <3500>;
-- 
2.49.0.472.ge94155a9ec-goog

