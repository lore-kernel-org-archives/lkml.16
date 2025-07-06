Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9861BD4F7;
	Sun,  6 Jul 2025 04:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751775860; cv=none; b=OoWU5STMrJjVhduwts6DL/LV5Z40+GOmiRfaKKNNs4IqPI9sPXGKX7TO9okXrDEnP4/QQaT79+2+3YXDbjDmki+VyVZiGdEuFT8Ojg0Xop5w2vu1r3ClHDPTsPFdjj+SeEk9FdqnubdOUEWJguCZCRl2NpH4GpNFNw7KVOjLr6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751775860; c=relaxed/simple;
	bh=e4sXPKrnc3fLVMVTpyD19399RSNDY12wmkvO93ocJD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EbjUd/jyqHuYSfBiNRFJoWuJyruQD5XxxF93T5rxICF5Tv/0Qf+Q7VJsKfHgVeOEhj4theAuhs1ypzQjT2ipyxZtFWneCT+FKVRs6KyxgmVhW+AyVvyf1Hob7shsq0RtO1F8vCFr5axX+xKi7LR9MlsQ1lGQoS39t3VguZUB9R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4guEl3q; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4guEl3q"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74924255af4so1933338b3a.1;
        Sat, 05 Jul 2025 21:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751775857; x=1752380657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5hvQYwSO1DDyOFBRxzz4gXM+LbX6JZNHrIcl99wJbw=;
        b=A4guEl3qNG6qfdEX7A9siwAEWt69N7jUXdJNcdJQ+QXtlto0Y8b0W98lKZK+mEeyRN
         cQ172sCrRcJHSkPNLh6/K0xX6zH7r/mK8vt9Lv52YVJ/NtSF60y3MR6a3G1m3WvRWAer
         tgnyNwoSPYGGl2MUpyb8aOgxPkZAzIJdgqkLuFFHKEjEIIuAHeejnwmDQhc2CmfcxMwF
         OJfF7x8mXOjaj0ZwX3R19tuw4cFFApySX+ZPxVS12gqcPQJ5PkbAsRpGjoZ6AU4sR6Yz
         mluN25JFQs9bNdROqP8zD/0VnSoQt4A/1tNdS16O7b16xrWYHIeGpdimh4IPeRjzC/va
         9/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751775857; x=1752380657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5hvQYwSO1DDyOFBRxzz4gXM+LbX6JZNHrIcl99wJbw=;
        b=GAJHAzRDa1d5jIobX43dKYnT4MSVsTdHWh69gvXy3g06m9H5FI5aoiTvdtJ08jt+KM
         bgavuZ4BEgaeoVV/JAPB2KEkh94+z0uYKJVdIMdFNCSFCsZo3Ajq/XiXl766eBVhzwqU
         wI21u3F5OmxjkiEdjncnVDcUaBtG1X0HRsSXB6YPTsm8lwDdIgddCmx73RXSe2pwJw1k
         JrfX0PYsmsiYL+LLqyRhrZFtCU0o3h+JsheZJh2g/GiVn4ekafrbPsLXA+fwRBLB7BGd
         2rEz5ooJr10KTYY3j/w8UAbXBxT8a8XUdwT6lZCeQ603NaoO7pzsXsQRwkAVAI81wAi7
         jUWA==
X-Forwarded-Encrypted: i=1; AJvYcCVH0Vi8y0NMAecD2LYhWItGapXmySm54bzKmZBvRZFOlFLYwVrTw8hr2lRW8QtTnjxEDHCcC48a6HWdMskE@vger.kernel.org, AJvYcCVw5/6ATWkLCktXBeUiRNANUioKlTBs/kjI562xFKses3BKJALdnJa6jtScSHTlNPbr6aLafBhr/Y9e@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0LCMeOv9XARnryVyHT5Aru8x7y6LK+cN+QL5tYxBmTFXUspmO
	zsEZxfa3E0KtMF/0/V8n7EZoSoWBidQ0Keb0sAuon7rliP52nNSoT1CB
X-Gm-Gg: ASbGncuFsyavsGAAMIjvUsVVjbr0TP6s1rWphU3KWvkwKzxCVwNbuWins9Ml8qOe0jZ
	w7xc8mu+F8Zjbx41We9uAggz4jk/Wx+78ptcbnJMdTl/Rj2hPXW5hYmq4Ot7qKVK1X4A41MfI/T
	FK96lhE6/sdmoeNdMB//DO32WM+EozKvDdOi9jTHbeU4mi3f2po8PW5Z383nOBXZa2CpwgfkAP0
	LFoGYwhmfYFCEeVuZxocA5FRobJwKXhR6u73tq1aPWDmaRx1l63ufIBLyqyaliiCL2CKp2N+ZDA
	IbvJsSV5+LC+cF/wE6c68tgvmIAa+1GGBU5QvdA9vHzSv2LYBfmyYu+6Kb76c5fzMw9dmYWb3V6
	uzH3eGd6U+xySfmaEVMrI3KbMYoLOja4Khu3Q7E3QTwfzdcnYsA==
X-Google-Smtp-Source: AGHT+IEDh07y4O5UrpWhHEn8NMy7TKn3Wcl/ge+wEXWwvw6/1ARreXKO3us1HCxZEGHLcjY9QbNDfQ==
X-Received: by 2002:a05:6a00:6ca6:b0:74c:f1d8:c42a with SMTP id d2e1a72fcca58-74cf1d90239mr7504338b3a.13.1751775857389;
        Sat, 05 Jul 2025 21:24:17 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417f206sm5287067b3a.76.2025.07.05.21.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 21:24:16 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v2 5/9] ARM: dts: aspeed: wedge400: Extend data0 partition to 64MB
Date: Sat,  5 Jul 2025 21:23:55 -0700
Message-ID: <20250706042404.138128-6-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250706042404.138128-1-rentao.bupt@gmail.com>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tao Ren <rentao.bupt@gmail.com>

Extend wedge400 BMC flash's data0 partition to 64MB for larger
persistent storage.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
Changes in v2:
  - None (the patch is introduced in v2).

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
index 3e4d30f0884d..cf6c768cbad5 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
@@ -92,7 +92,7 @@ tpm@0 {
  * Both firmware flashes are 128MB on Wedge400 BMC.
  */
 &fmc_flash0 {
-#include "facebook-bmc-flash-layout-128.dtsi"
+#include "facebook-bmc-flash-layout-128-data64.dtsi"
 };
 
 &fmc_flash1 {
-- 
2.47.1

