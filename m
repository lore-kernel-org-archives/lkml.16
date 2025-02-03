Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E610FD;
	Mon,  3 Feb 2025 01:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738545582; cv=none; b=Ynr9VGuZLmp6g+Uz5r9pwrooXRtN2jL1xb0ivEZ74QBlcK8BWtSV0U+S6A2SD4Vyv2bL207maX5JeawHdZNgCwOGxl4SH1WO//zB5CTzU2HyLwmzUKWhkdG6O5BnRjRJKHWP/LCmJRGkpkBDa2EQDr9TNLE+nB0RGE3FmQcERdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738545582; c=relaxed/simple;
	bh=bYcoU0mwJ+CXhT4fhT/dxf1ul9bd0TV8O1ada/Gvuhs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZ1S58rY315YRWcBx1Yr84Md7RS4JG4A2w7+EYCXXa0+nyh5wREk7cy5AeC68O2hwzMmzG8KydXuShYP2hnyIn4sRryeqbQ2c0Bj9Z82lowz0bKMiK6eEhqYRT0K6xpEcK52AbO7PX8nLuJxAKZNjer2ocDRGHK8cDehHmDhFH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc1hKcxp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc1hKcxp"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2efb17478adso6382390a91.1;
        Sun, 02 Feb 2025 17:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738545579; x=1739150379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTy4qS01FLMytEtpMeOug8rr1n5yyzrMe+Tl/rJy/8g=;
        b=Gc1hKcxpfdOE2yo90+7F+Sm/aLos92U8FrUjHnDIYeuRAo45qTrTBcmHeR8zUQVTFB
         88dsULLXWK7yiWEtnwV+CdXjtnWq9gO/MKY2h96GjrDML0g4rcTWPz6H9wFJL1OBVqGC
         HDBUB8TvGbEZFqz9g9N2BkN2DazN21gdAa4d7NCzKMuWtwuAcQthmi86JtHOnvavVGPe
         CauovCHgleQJUVUhsdyS0nUZpPZY+yU1Dz+JZflkUGDxM+aPiSMuGCmvTaxFEYyojl4O
         OlP7jsFMVeArMA/NCYTHCZ5PFJOqeFYVt3wWxkiKfJh2wvsibIuC3gU8YHwsD7MHjn0V
         kcMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738545579; x=1739150379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTy4qS01FLMytEtpMeOug8rr1n5yyzrMe+Tl/rJy/8g=;
        b=flJxxa6zUAgvjjSeN3OdZnMMZcsNyjIK9vFQZGODP/d0OmbsIrOTgNJKWKFMdWASE6
         psuqnIuprvr4Mo/kq4TxQSbFu+4Z1OwUiPObhgyocoPIuSEf36fj/b0U4RN1zbW9cE5b
         g9MjSd9HNohFL8CG4WxjZ6hDvqmvl1cDy7uT0cV5EP/61NY/WyhCsj+5g/y21yNUVHIj
         q8PhpuMO+GTsakERLukHjWw8RYrxuXA0cmumeAgtGjpqr6DbLJUmsapcKv24Tv46zqPI
         5S/01rcml8/WSSLWdSH2eO2fSepMzd/cannUXLSyxUSCpf2OMSVhaDTpufjEhVKf1Of8
         zY5g==
X-Forwarded-Encrypted: i=1; AJvYcCVLBzndNVz4CikWGgNy7suKwS+mO+xIncT6NBIUGcVCnz6MkFLFiAOvu1FOUHGWuCNIIPJUTILUkBfr@vger.kernel.org, AJvYcCVqcjQsH8QjPA1Ar5eqHfu3ykDWlYMw6qG7R9laNrlDFAFF8WyfsTfVvGACtNoPh2TRWY65h3EaeY3ePSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYnhcnw8LuE/MPqU035TeVfHRIPxRqWNg/l9BRMlrnK8wJqRHJ
	/wyW4k/EKaQyMTCyPMcY2jbmW9IJHjc/yczG+untAeqg9exi29av
X-Gm-Gg: ASbGncuYHmeRUB3h8Lrq704OmpYVrtbfxK8ESCEyfpa2QJ477yOa0l200B4KJ5xqXZI
	OJYKrE76aQv05uQSA9q0538ChEJrnCgiMLx/jdYOSmWMd0FpT4ePNzFoJ3aMjbD6l3yEChhaVml
	PAaVy57KUbi5IMdeoydK063886J8IUtJbhRea2YVkl3qGGOtY+BxPkESFNAC+lYEtI0nkVkC7Ti
	UP4iT1UqYdi0SlGlu2VR9rVVeoUiFHTi/HNyeVeX0ZwVbq9bm1NJ1OKVFZhkSYGEhwCsQeFgdXJ
	tN1tDwSRh1RcTsBc
X-Google-Smtp-Source: AGHT+IFJrVG/Isbfklx6SiV4JhJSrBkvBKw2E0MI7P8JC3NLIvtNmNc8vFHEIdAi8pEBlrngLxzR2A==
X-Received: by 2002:a05:6a00:a801:b0:725:d64c:f113 with SMTP id d2e1a72fcca58-72fd0bdae06mr35239126b3a.3.1738545579166;
        Sun, 02 Feb 2025 17:19:39 -0800 (PST)
Received: from ubuntu.. ([175.141.178.229])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794b1sm6758939a12.53.2025.02.02.17.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 17:19:37 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: andreas.noever@gmail.com,
	michael.jamet@intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Rahimi <rahimi.mhmmd@gmail.com>
Subject: [PATCH] thunderbolt: Remove the TBT3 Not Supported bit
Date: Mon,  3 Feb 2025 01:17:47 +0000
Message-ID: <20250203011842.13305-1-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since USB4 v2 specification has removed the mandatory requirement to
support TBT3 on a USB4 Dock UFP, the TBT3 Not Supported bit is not
usable, as when it needs to be read there is no USB4 Link.

This change was introduced in a "USB4 2.0 ENGINEERING CHANGE NOTICE
FORM" published in September 2024, titled "TBT3 Support on USB4 Dock
UFP".

Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
---
 drivers/thunderbolt/tb_regs.h | 1 -
 drivers/thunderbolt/usb4.c    | 7 ++-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 4e43b47f9f11..7c5d27571b66 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -212,7 +212,6 @@ struct tb_regs_switch_header {
 #define ROUTER_CS_5_CV				BIT(31)
 #define ROUTER_CS_6				0x06
 #define ROUTER_CS_6_SLPR			BIT(0)
-#define ROUTER_CS_6_TNS				BIT(1)
 #define ROUTER_CS_6_WOPS			BIT(2)
 #define ROUTER_CS_6_WOUS			BIT(3)
 #define ROUTER_CS_6_HCI				BIT(18)
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index e51d01671d8e..e25a594649b2 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -241,8 +241,8 @@ int usb4_switch_setup(struct tb_switch *sw)
 {
 	struct tb_switch *parent = tb_switch_parent(sw);
 	struct tb_port *down;
-	bool tbt3, xhci;
 	u32 val = 0;
+	bool xhci;
 	int ret;
 
 	if (!tb_route(sw))
@@ -257,10 +257,7 @@ int usb4_switch_setup(struct tb_switch *sw)
 	tb_sw_dbg(sw, "link: %s\n", sw->link_usb4 ? "USB4" : "TBT");
 
 	xhci = val & ROUTER_CS_6_HCI;
-	tbt3 = !(val & ROUTER_CS_6_TNS);
-
-	tb_sw_dbg(sw, "TBT3 support: %s, xHCI: %s\n",
-		  tbt3 ? "yes" : "no", xhci ? "yes" : "no");
+	tb_sw_dbg(sw, "xHCI support: %s\n", xhci ? "yes" : "no");
 
 	ret = tb_sw_read(sw, &val, TB_CFG_SWITCH, ROUTER_CS_5, 1);
 	if (ret)
-- 
2.45.2

