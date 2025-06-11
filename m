Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD5E238C0C;
	Wed, 11 Jun 2025 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629127; cv=none; b=bKFf5uWlIn159hQibaoxSL9wV4Hcu8yrOHk6noBAx+u9DZaEApWazOBwE3Nc4n0tyAu7L1ltdr1UOpRhoMP2P7I+P41YNWtX3mD4g1HLYvl3V4M3mVcDMbVjPAkiFkr68v3woMOA3fMiugqkZlMFmx8AhxB5/VSKvq9tOjq6SLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629127; c=relaxed/simple;
	bh=t5Jgw0qmNIYlnScmL649R6MYZehTuG15J329DAoPuM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FVM2KFJog5aRs7VPr21849vfpxe4C2eHZBbYRSRhc8MAoDhXA2mI9Lb3iQ+scFlU3vLEyuZ9IR0/LxwCqmZHeA5KUElXuMy8ATXuGM7vf3gouYwIhu8nHRdQN+ivZ4qZYvljuFxOBID2w+/Jc+fVc3aOgPGWk5Zp40vzDi70Sh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBvE/n57; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBvE/n57"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c33677183so51871795ad.2;
        Wed, 11 Jun 2025 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629125; x=1750233925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNzuAa/Uazdw3p5L2VOhfCBO9w/r53QUlAR5HnqCwzk=;
        b=IBvE/n574hEE7/vQ5y7Eb76xC2f/PE/89QU5ZAmpOAFOdQi1CwJfpUt37r0WkHltJ+
         pByVHGTbkpY/8+JrhTHnxVvV6OMuwW+pQViGW6rofTAM5LMR+An3n6nvYA9eitlmSKI4
         M8YxQhzPwuZSA/9AkMDpzVkThEClYdiw9Bq4KRdxSlG68t1AmsVXnRJy62n10h0/6Odb
         8RazDfN//CBHRjvhS6GZUvRtUkt5ulDVxmCABeRjS0XqAZWXw508VmsJwnFRwkUJyy/D
         VlNlrUP7pD1hxi8FG5ecFmKXblIuy7mBPngQOGNEpIf3BmN6DHBw4ZYlFnVZT4816G1j
         EPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629125; x=1750233925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNzuAa/Uazdw3p5L2VOhfCBO9w/r53QUlAR5HnqCwzk=;
        b=X/hx5W57YAWARwcoakcSt/sSZ9QdWu+BG7mtShZ3aIvk/tJudGHB7LiAVa4NCErVLd
         xRtajGQ7NBiRj8gb9KIwwhkBXadZ8Zvy9zfw1R4372JOqlX0PSG3nRUusAtj4pDrxWwa
         i5hezPCMYOb9KLv4UglfsGS03btWK1lnHGI2o5YsrROtDve2B906k6ol7gd6l5EhPYh9
         VcxZ+NQjOOdYQmzgDygLSJyR51UdPLKghCvsmNh4mNwEMx4q/zw+cNBI1W/KT+jqe7Qm
         eEr+17dldZyh49Edt+l2ow5aoFHDSAwaUgttbeeOU/bFJz1rA35AVwL9VcyfAsT2oOCC
         8WaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGXsoQHZgFQhrF1Ixj4sxzKP8byLd3N/JbJWA8aTstynaaNFUoNRWPqRmC2+FJG/KANAMydQsQeruxPXQU@vger.kernel.org, AJvYcCXj31s+BAVDP0z0mW0o5REaTPPb4AHGtpWU8eE7WKL/bkTJS1z9dJ5b2ma0A68ktLMW5wBXjdV3L0Q+@vger.kernel.org
X-Gm-Message-State: AOJu0YxVtHfPn6zUvRUDOypBMk3bi9BRcpGrzC13iV2wB77As1Ru5R6K
	6e06XXscylS4iBs0Hjn8/CjQcKJmfUjWdn6G725d16NbYh6Omx8sC0yx
X-Gm-Gg: ASbGnct/p8ncKJ6JeI1mJP4vdDZOyVR6utkAedasOF68f0Hzf8XNHcxMgC+AdgCG1PR
	Q3W+pB+RCjbjiDrUuPF/9MpdtfEuEKFPq3hFxQpBBdqMTSWlWrJBnE+KB8+4VBv54ke9wPGv2yw
	nHH1j2q0Kpts1OYvQi7nmD6s+162Z2XTIkkUSmDWpnzvbh+31d0bieXl0pAuVDYtNfbY8lms3z6
	0Ens4p6hSBC53I3REDGwhEIKMxQ054bbCYZOpt7PZdM4rDM54sVWg5BiHYKTt9Al81RiHBUEtAl
	yQ2+byG2Nxg1mRRluTmHD4A139YGNPn/gpoIMiXAtcvbTHSu7Erj5UhFurcF7dxC0Rk8pTDlQuD
	ftwK/8uyZs+WL/HKHMh6KaV7zzRVOwmKHdo2DYgIucK+8v/mqXHD7VitUfvp4uBJEIlX2NvB7YQ
	zKcTdLnQ==
X-Google-Smtp-Source: AGHT+IHoyKh/sH8/DfqDm6/YTmj58rUQ/xaund/2a2KvsOZBw+ZZaPMZVA4RQVLdez8ySceA+Rd2qw==
X-Received: by 2002:a17:902:ce0f:b0:234:8c64:7878 with SMTP id d9443c01a7336-2364260d248mr28868105ad.11.1749629125239;
        Wed, 11 Jun 2025 01:05:25 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e357-b8a8-7759-271d-6134-9aa3.emome-ip6.hinet.net. [2001:b400:e357:b8a8:7759:271d:6134:9aa3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2363ad90982sm21283835ad.220.2025.06.11.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:05:24 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v2 2/5] ARM: dts: aspeed: harma: add fan board I/O expander
Date: Wed, 11 Jun 2025 16:05:11 +0800
Message-Id: <20250611080514.3123335-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add GPIO I/O expander node for the fan board to detect and monitor
fan board status.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 3a215bb1e220..344e20394665 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -218,6 +218,25 @@ temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	gpio@12 {
+		compatible = "nxp,pca9555";
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <116 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","fcb1-activate",
+		"","";
+	};
 };
 
 &i2c1 {
@@ -273,6 +292,25 @@ temperature-sensor@4b {
 		compatible = "ti,tmp75";
 		reg = <0x4b>;
 	};
+
+	gpio@12 {
+		compatible = "nxp,pca9555";
+		reg = <0x12>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&sgpiom0>;
+		interrupts = <114 IRQ_TYPE_LEVEL_LOW>;
+
+		gpio-line-names =
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","",
+		"","fcb0-activate",
+		"","";
+	};
 };
 
 &i2c3 {
-- 
2.25.1

