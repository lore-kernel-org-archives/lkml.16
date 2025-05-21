Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E96E1C8613;
	Wed, 21 May 2025 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747813552; cv=none; b=n6+PtGcys/q2bStrQwasvIn5ICGvq1uHPB8I0u46PCiNynrTQY1yD2DMlMSDXnmH//9Sb00BpvLQGajp+GeiwrjGf8GkS/rSZ85o4ZcpkNnb+rA5Sa6TY9s9wjRlixB4pL5MeGkxGWsfitkHY8AOyoFBKZ5HHF4b4uwNUmYnIMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747813552; c=relaxed/simple;
	bh=p1tOWX83rDWGCiciH5ywZcjKdKk69AxTY5BqVeRA2a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ugk3Q/4+VpPzKWYMGtlTDruz53Qg81vaAJi1v/fDFlBVoxhDZ+EJbvxlpFYRIvRVngwJfr6OSfNoEw1eA2Qft4Y4dgvin665EiC8NkKdho5IQ6zqL1SO7IL9Z5ZDvgGZF7tUBJaASozWbHd1kmJzAUbxKNB0nFfT+YZcH5fIZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BASHUIym; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BASHUIym"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso5702051b3a.2;
        Wed, 21 May 2025 00:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747813550; x=1748418350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nha0T5o4wDHhd/CGGXZ/m2HlO5ptB19/5BLoEUoqqes=;
        b=BASHUIymPrGQhc8WXYmsev6w8l1hvO6v8G1e2PmbrhZRH1s4icSU8venU+dVU/ieCm
         NOUZXxtD9VBfVfZnD1KGpsl9ly4OZBgg7bK7hyutUQuZhhPaJWXWcIybMejL8L7S2mOS
         FaUFCtR6zpGw3cS8CpKwBFYaq845Mppll9/gjtLVPEoa/xoicPK8NAcOM+C7Uatc5R0f
         eQrsPNuqWO9a/jpHr8Ie9GokJdP9VlaAguD+ZdTMfayHF+nIdcCZE5bBzfYwkd6ukDY0
         VPgrFprN1G6ZWwOLKeZH1ksUyO5c/HlBWhQU6YFDnU+KkrUSHdAi8ZsPq7vxZs48MeQZ
         k8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747813550; x=1748418350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nha0T5o4wDHhd/CGGXZ/m2HlO5ptB19/5BLoEUoqqes=;
        b=JEPQeLrAbrCPurZIXL89rnDDJ3VFOQcXgUCv7+QjOYMntxJc+q2BpxPxAl198X2ThH
         LtwB0Q+ORatDdw0wjvIiX7+6SioIRlkExa71wRTetl/Y5M50okdZSdOJyVQg48Shfn6u
         u/lx1qAzaIqnjgBOUhJi66to+SyJged3mTXHp8zPNEVdg5dPcUrS+A8IfNpcyInBgD3b
         TEC54YuioCUBgxlMpNMnygctTmuH0dm23BwDi4zJu8Ou7J+VfnAx06h6/9KToOiRrrSZ
         6hp8NKRdLXa8OLYx+KT267lQrbfu73RgIwwmQ49BXwqbgNZu59h2NrO8AGkBwBRT73sj
         x69w==
X-Forwarded-Encrypted: i=1; AJvYcCUxIL1viL5KnTDp8+1I6KDY/tDRKEzOcpAN+wkrJTWvrukxe7S12cG6pscGZ1SfVELstHOXl4E7JyS3@vger.kernel.org, AJvYcCXUPOFnR0G1ZiYy4u2tjYLXEbC/+qHbDc1DqfiWYk4cGBymOPAay4nyNhUz5cf94En0DvCIt/T6DUSMqDXK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6L1M2VHLCV//ooAzyRw11tfrLKO89D4JgOI7mR7GU9LxACTIl
	A6VJR95QYjioK56pbZ/Xm93ZT1SGP9i5K+tdkOnuzvKT8ZYLbmD+esjB
X-Gm-Gg: ASbGncuFGRnwkumEL166X2JYgMegf3h6nktXYc4jsXHKM0LAuROII2a/m94oPXgH3YD
	nPO2+frKtYHZMQWr7r/muBZZB6T+tbx7zJdxYUW4QPj4QWbe/EB1rGDx/BftL2+K7/QXXyhdwmv
	h0Xr2BpnYqfmYqKU839PmnnZ4lWJt0YOhqR+yNfrnDxkTrGgjQXyBI5rQe85t1fkLRhibbKcW4e
	pPqy6IfXogShigLS2Ka3YLJWTkMB6HkWJB7Z/qZJWliWtzQpXo0iBYFSmEmG+Rc66qciSuWqzm8
	lmVtVCC4nZV6tBE//kQk7dQIBjj2mla9Q05xKxdvfOdzoBnA2Cs6205ZC+iC5hEj
X-Google-Smtp-Source: AGHT+IFLq4eF9bCe+UctUxF1+4yfDJzpMBHqdIf10YZab4gAoLecPeEe5Dr1MpuIPXvytZTQ6lNZKA==
X-Received: by 2002:a05:6a00:4b10:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-742a97eb61emr26036368b3a.11.1747813550508;
        Wed, 21 May 2025 00:45:50 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c882sm9454464b3a.55.2025.05.21.00.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 00:45:49 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Wayne Schroeder <raz@chewies.net>
Subject: [PATCH v2] arm64: dts: amlogic: Update USB hub power and reset properties
Date: Wed, 21 May 2025 13:15:31 +0530
Message-ID: <20250521074535.16488-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing reset-gpios property to the USB 2.0 hub node to
ensure proper reset handling. Also update the vdd-supply for
both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
for consistent power management. Remove usb2_phy1 phy-supply
since now it's managed by the hub reset control.

Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v2: remove usb2_phy1 phy-supply since now it's managed by
the hub reset control.
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 3bca8023638d..d46b6aaef8fa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -42,7 +42,8 @@ hub_2_0: hub@1 {
 			compatible = "usb5e3,610";
 			reg = <1>;
 			peer-hub = <&hub_3_0>;
-			vdd-supply = <&usb_pwr_en>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+			vdd-supply = <&hub_5v>;
 		};
 
 		/* 3.0 hub on port 4 */
@@ -51,7 +52,7 @@ hub_3_0: hub@2 {
 			reg = <2>;
 			peer-hub = <&hub_2_0>;
 			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
-			vdd-supply = <&vcc_5v>;
+			vdd-supply = <&hub_5v>;
 		};
 	};
 
@@ -311,8 +312,3 @@ &toacodec {
 &usb {
 	vbus-supply = <&usb_pwr_en>;
 };
-
-&usb2_phy1 {
-	/* Enable the hub which is connected to this port */
-	phy-supply = <&hub_5v>;
-};

base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
-- 
2.49.0

