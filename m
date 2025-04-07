Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAB922C35B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026084; cv=none; b=j5G067dtPYMBnMMWwXQuaOkUuI15Ii3cQAy9UnkPmflG2YLreAjVKT1Ljp8XTKbwIAGDmNlsdbmcf67Qu/L+ZAtl7SCCs7sUMJ7HTNF1H2xjdKH3rzJ3TYziS11xJF5jQ/IxIVFX0vm+djSrxZdqcFVgSVqbJz2WnLwkRaYj9j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026084; c=relaxed/simple;
	bh=hZf9aBKMYg9drwsY1ZL3tP8lX7Ry40MXQxQH6VX6yLs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZqcM7RRPM4qh3pic7RyBZGWvPC1v9zwfZ7G1aPaBepQ3vBuhRtZSFG8/lGAFnGQ92QSPTD/3UD6tjGb5yeVrKjaKAwe6ZMMflfhcdNNl3hR8zynS8ticBTSVCaXotMF6JTd0FWbxzZVCAnevTHabvG73e6h12pI3no7pvsBIJ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=TKVvAOKg; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="TKVvAOKg"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e6df1419f94so3240938276.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1744026082; x=1744630882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6bubJ2d+BmHRmgs70y+zlLbzWUmkntEheMY266sG6w=;
        b=TKVvAOKg0TBr3B5Kiq8MJxmlziDzie3v6l1PCQp5ym6lNVef2dYPbCzsepK9Y8VPEs
         zshjdtaCA/6thT2DLnQCAKvmioMuLqQhmtCRtF40O9HzTTks1ag14odFMVx+6TbUpXPA
         nj44aL4vG9WCejRi7xdBHhLzSb88muj1YPhS+loAYfLmLRe0lOvvnnDXdkRsQvrrPSJw
         7JdogvB2FYFaIeaPWMz8OcouKnNC4Fe8HAekztPyJjOoNdlL8h+wOG0AHtXHX99aufv+
         354gXaaGuVc6avnHZ3o0Jxak2lMiKfuK4m+ePPhF0rvWLly2Q9oWPMmJBBq16HBrl/6D
         OXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744026082; x=1744630882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6bubJ2d+BmHRmgs70y+zlLbzWUmkntEheMY266sG6w=;
        b=rBYnuNSmPntOReyN1YMT5st9ssQbqJ5Oo2ko9W/MhttiEGqnLQVqMn7YNekr4qSZgZ
         LKZO3/YqLjhyZ51Ly3v4fIUZPOOQTCn1fPQD0tvpuR5aElp6ZKq+yhT10nhC5KnA33hk
         cOXFl0xNOKXg8vik1S/BM1ouQ2gd98iHYDhFGFDmStpowWoH7byzDrwsaBIZC5QsyWL2
         vKPyYyrhs5JcT+0FWPtyILK3+ihqwfxEgjjqdMxYMlU0jK9ZJy0OM8kT8HWqVMRpWyAG
         bqBjg/vqy/fv08Nya/LzgahtPDCdssKY+dycyloTwmAM5h4TT0tMFaA10LhLVy5HcXbR
         6hOw==
X-Forwarded-Encrypted: i=1; AJvYcCU3xzILiPL4tQXlFkH0pzgwg951B7+EhpOkGz0o4FO9Nc7k8JqW+4C3j3EKcMv1v/26DaQjFQC9MNQUwt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVAapJhIVeKIQlmzWQapUvHfjdlVPfiSsxVP7Rb1EA05ksnDSo
	n60WXoftWgk1y3ZZg/QQVL6z5KyfS7dEJ+QAoI+PMzjbme1YzpHnfYQWURSoi7M=
X-Gm-Gg: ASbGncv0E2g1sIuZJXiJKsCoH5Xm2OqvdjVo3AFpAPLQbwerohNg4VSDw7R7kN0CswB
	TG9GDKi2NYBc0kP7BtEfMmQ3fm7sFFHS4Z00K2noF9x6IC6IH89GPVTmwGoiHx467f/rbBieGNL
	SPumWWmqutDjZIvJOxeAVIJWbKyhbni/zWtDF2mPbotwMbJfrBamamvQtT8sRZ8hGDuSHVF8Wfd
	bTDkjFTOgOAN5RGr0NPWg2znxYa8uDTLLIHRQuIwZkAMubZZ3m0qon2ICZLDhD92W7AELEwzGaG
	dwyw7W7nC9DDIep9y91e1szqHjssSxm2tAvxuUypaNYPHsdbznhxwLu+nYhdpRAtLrx7MtnDPfu
	ZKiLR2az/k/fF4EIZLw==
X-Google-Smtp-Source: AGHT+IEH2+urCNhcYCnjnsCmCmufxjCnfY74JrlqFCW51UfpadBY73PwrLHZ9pw8pkedOhJGBs1p1w==
X-Received: by 2002:a05:690c:3345:b0:6ff:1fac:c4fc with SMTP id 00721157ae682-703e3358b44mr203631067b3.37.1744026081737;
        Mon, 07 Apr 2025 04:41:21 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-221.zg3.cable.xnet.hr. [109.60.82.221])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-703d1e2fe51sm24841567b3.9.2025.04.07.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 04:41:21 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	soc@lists.linux.dev
Cc: Robert Marko <robert.marko@sartura.hr>,
	Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH v6] arm64: lan969x: Add support for Microchip LAN969x SoC
Date: Mon,  7 Apr 2025 13:40:28 +0200
Message-ID: <20250407114116.3211383-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the Microchip LAN969x ARMv8-based SoC switch family.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v6:
* Rebase on top of next-20250407

Changes in v5:
* Rebase on top of next-20250131

Changes in v4:
* Rebase on top of next-20250115
* Pickup Acked-by from Daniel

Changes in v3:
* Rebase on top of next-20250107

Changes in v2:
* Add forgotten LAN969x architecture support itself

 arch/arm64/Kconfig.platforms | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..77f2b481238a 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,6 +133,20 @@ config ARCH_SPARX5
 	  security through TCAM-based frame processing using versatile
 	  content aware processor (VCAP).
 
+config ARCH_LAN969X
+	bool "Microchip LAN969X SoC family"
+	select PINCTRL
+	select DW_APB_TIMER_OF
+	help
+	  This enables support for the Microchip LAN969X ARMv8-based
+	  SoC family of TSN-capable gigabit switches.
+
+	  The LAN969X Ethernet switch family provides a rich set of
+	  switching features such as advanced TCAM-based VLAN and QoS
+	  processing enabling delivery of differentiated services, and
+	  security through TCAM-based frame processing using versatile
+	  content aware processor (VCAP).
+
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
 	select PM_GENERIC_DOMAINS if PM
-- 
2.49.0

