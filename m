Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECF818EFD4;
	Thu, 22 May 2025 17:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747934754; cv=none; b=EIp4Ak4Re7iLS4iilXnseUBYdsgpVgB9sSTLLcg9ws5aboSfmpHmbwyjToFbmeJpGVzx1Bj22WF+Dsfa2R7Cctc4WBJzTb6Xz96QcE2Hk/raVIFlda8prPheG4vKGDtXcczV7odTiJw/2pvG0qJLEsx2F7FbaL/eF+2LLx7vwxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747934754; c=relaxed/simple;
	bh=82eeY7S9X+ErSqlbmJJ9cDEYxH4iPqrtKfDwwFZuGDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ol+t6U8VXrVx7IPgjwmsSIx3RxVU9Fax420L6+mL1lvCkgyufrMRBaaKsibrFyhIgqWPT/uKKouTpTKCXcf3KXz/x/2Zc/8RXeSdmrCg8XsSQ1uYxu66yuj1mJr1Lm+EIpNrWQ81bJmOJnkJKqXAZAaTbqzOeyLt3kj2kx3aVCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKO2sDdj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKO2sDdj"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73712952e1cso7604881b3a.1;
        Thu, 22 May 2025 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747934753; x=1748539553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pFr/FIpQMKlaLcrurcFbynkq0Hg0CqVLJ+7C8ocO9M=;
        b=bKO2sDdjIrQbhlYBM0IPhqQdZirG2oCE5xGMA9/ZpRcX/pq+V7+SpfvwhFLy7+WijC
         WCq2RKv/UseMDgfbx3gqeFKPpMwtqD6SmzqNcWAI3GTol6hiwwEk0vAH53auJjzAcTfX
         W4d1CrEvAeuDZ41H+m/DKBvHjNjKkZgOy3dsClQPjBl90hPeVfYoxmyoVWtkrhG9RHA7
         kYBgDH3vQVPxKLyoYMij5nrNVfxCzbqlLXpGU6p+usd1lRcKJbIq3/A+WlUU4SWivtVa
         nye+wdETygbyJTdPsxMfWiRoIV/5HxU7yWKhaf2Krz2poqgzXQMYk7KsbwoaiYVW2v0J
         sHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747934753; x=1748539553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pFr/FIpQMKlaLcrurcFbynkq0Hg0CqVLJ+7C8ocO9M=;
        b=nQdeLlokDBHbTMLLLMjquMJ6RgKtfRq9XbCdduRSQkUVbJFw0tGkCnahglQE8GBGOd
         Am9nxacoBHRDrfLbczwdIFSGLjfyGPCc0E3VxmUrBpCP6brFDh6fo8fPko99ehdUQ1hS
         kisbtCLIVM1VEW9WYDyXkE3OS0b5FdZncDyaam9RS+tVMzjXx2UB8dD5FduYKa73BuVz
         HnLpqeoo/lbHZHH1JWS4vvDVEudM0Xu+p3CNHm7RNg3e+iRL7yA4zGVB+SZpi0ooWwNm
         zqbObsglV/61qUIgkMTSPQRWPysRsmd1hcq/LLTHWfbwSIiMYuu6x3KxScyIA2umfoCr
         SnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcofkvzdX0zLlAU6zKnhkLs83hLpCcyuRQp1ZpcaLiHTVSgKUditQvav6SfA1RNpnOnpB+R54YVuivc/Ql@vger.kernel.org, AJvYcCXBAaxnQV1cNQbIWda6GgUfnPl1/mln9z9L1WTQE9chmc/tDTlfw6UXBAqBZ4gKRbV5NkqX6rxCH+w5@vger.kernel.org
X-Gm-Message-State: AOJu0YzZgl7mRnEdP8quqIQ00KYRfDnX2GEo48is89e2iJIbQauhh45G
	8UoRwnbIF3NdzHkytREGL6+yewfl+oLBDvTSNxJxwrxMbhCjTYTGFQXa
X-Gm-Gg: ASbGnctO2t7dA4DgwJ2G2sJl3RBLnfnex0mbnCyBlzQQ3clasalPbnsT202YPFYHhHT
	yaqSpKvqAJTdZt9FR2qkyuFHry1z/XOi0ynVU70t370/oqOC+uWQfe+1KaTGe2oEJK0kma8Nsxl
	zx22XaBz0DczqGWEwjLwFoFFDymbGYOsP01FKzFTs0+9lciZ8uEPJcxHYwwt1LUZLER7+j6nuTb
	tf9UwEw3K/HpPAuXsJgui0QurLD2GBkMow0cX5ylXnJsaaAALgUXuU9yj6dYriGgrROB5Pi3R7s
	16e6bvSmx462giAKj3SYIPsjCgS8d5diPCM3lWPLXLoNaLUkah/3X9Lbeh7lopeH
X-Google-Smtp-Source: AGHT+IF/flt4pJtLA7UrwpzFBJxrvaKLM4EJukN6eKdUd3/S73UJzdF9uXaIhdKMuhPjyFbvzvs3IA==
X-Received: by 2002:a05:6a00:9182:b0:740:6f86:a0e6 with SMTP id d2e1a72fcca58-742accc48a2mr30771056b3a.6.1747934752634;
        Thu, 22 May 2025 10:25:52 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982a08esm11471586b3a.112.2025.05.22.10.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 10:25:51 -0700 (PDT)
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
Subject: [PATCH v3 1/2] arm64: dts: amlogic: Update USB hub power and reset properties
Date: Thu, 22 May 2025 22:55:31 +0530
Message-ID: <20250522172535.302064-1-linux.amoon@gmail.com>
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
for consistent power management.

Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: dropped remove of usb2_phy1.
v2: remove usb2_phy1 phy-supply since now it's managed by
the hub reset control.
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 3bca8023638d4..ad959f8bc1acd 100644
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
 

base-commit: 5cdb2c77c4c3d36bdee83d9231649941157f8204
-- 
2.49.0

