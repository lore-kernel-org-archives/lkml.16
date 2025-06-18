Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A89219E83C;
	Wed, 18 Jun 2025 02:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750212014; cv=none; b=Cjh2oJ+inEFow1cMwGxdkSZQX//sjtS6GSVB8ynszi5BVAAbxUTFEnZbiOyYNryFJ/BRy+YuDQmWz0X7+GKYe/Xw+lRSHV8383l4B2abloY7nFY+IRcqqgGmv73nt3IF1N+fWUuBWYCG4rt8RuVBOAjEpLQOYb5vI2LxbItLTmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750212014; c=relaxed/simple;
	bh=4zqU+l9rhTwWzFuu2Ui7WUDENfRl3EuHFlNyG72UCGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LERVi+wfuJ/wFCGYIZ9VsJcg002YzWGFZWRmwOUBbb6rFSn4+o4vrYk9gUFNYf2O9uDu6SF4Kp35Wo7BD/BHRVA1ldimHT26SgBs/Bh7CUQ97Li0bmfNSHubEnlBAf7Yy/w/r+J0vTd5mJheY2NLfz6ZEosofZvMUY9TqFNZJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjw2L7Wy; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjw2L7Wy"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3135f3511bcso6324043a91.0;
        Tue, 17 Jun 2025 19:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750212012; x=1750816812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfVuzvHvA/2anFPm3rhSsiY2QauhvyZNq2kIWdnb8N0=;
        b=fjw2L7Wyou4L+DhmUpaMZhElCHuKy4SFbz8Shu7U5tkOtrCEAozrb+Ey/qMwMhw296
         V689qXJJdZJPzKzdZzMWUkSr9XVHZ7U7ppCh/MvITZfpfozY9Fx+j78bM5E4w4A/oFEZ
         Vxg7PnyWhRmoGCftq1Qg4gW7YXmBsrX7CC4GDf1rxOrNId28F3XN4d3icJbEsgrHkdKi
         7l1SBkBje1VhVw+1zJ0pWtD2PwXRLv77a9kWqJb+BF86FtrTDAXlEVEp5KpS4FDVH6lp
         wrZ5U99peatQG+odL6DqdJyASB9XWCy5NTRfczvXV6QPfUmBmcjXFsYywj0+Wlzij6QP
         JsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750212012; x=1750816812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfVuzvHvA/2anFPm3rhSsiY2QauhvyZNq2kIWdnb8N0=;
        b=FHit+fqBFlC6fvQPzRd/ww1JfNTskLkhd+w/5FJ7Z2hOo4BF/GEoq+J5K27W1PuOrp
         C2vHJlvru9ooiGl2+QT4j5bwG/pkyX60ICXWFjAZbv8pI5840hZF4LmmsoS3zNyKH7yV
         LPodSq5qCI0ZnBb/umwMEtlTMaV2SoZ3rSpDr6T3E4TwrzAb9ashkr2U+b4ACXuNlqBK
         8Ul/KB57zhb4WMHASRsf8MpzCz6qM56fTSbUa9cNfQPQwDOhiu/Ip6ID3GliWgj4JiAc
         TShbjZVE4r844Pzww7fp331WQq7GRwe5TEjWIJ6tyAlcLpKypWExwIeCmIc6tsAArP81
         eFOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVuBusx9RD8E/dbM6qyfLVm875DPqYNpwXT8sC0BZ95TQurkciimkpCOwx+CIJ38XCoX4qFnxao2kxFMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBSISHKEO3MqOxiQFFqQJyW5z144OwV+VK0mXjFUm85TIbGBR3
	M8KdzZ+ByAU3NXgQvPYP7+KXjzInjRlb7vvU6THAZ/PB+DUGVWOP6T6i
X-Gm-Gg: ASbGncsNfQ2uG/HWDg1fV6ZM5/LLCk5GjdXFC13tubuieTavldP8UGNPf3Rmv7XayZa
	enCUbgCNwHWtLhkfNDtZj7d5+vwEPBXrz8RYXr52c8Ft6p+OmxJeLwta3b2bGvkJ8I6lSuilkux
	KVrG2F4iCLO+swnjr5EjRQjRpUwR4juvwp5zTBfbs9vRKEAJ+EDyLUBu+RuoEG/a0iUUrrUF/MD
	7xscak89dXOtR9AhUbCuOvQTh+QUM69UWqaQtfYTw7mD94CboBU/Hyr3qAehn4yBbeNMM/+0MLb
	FZlbYk/YxwDpePa5yZkJjT/HIEWEwoyfUNwwM8QMJeRX7UAPqp56VksvdmnNSA==
X-Google-Smtp-Source: AGHT+IHWCPRYDnFWn8oETguqq//0JZUxmrEFYPkvKs/tO5/FbBUcPDK5wCS+PyGgBZWbXbKIFSLoxA==
X-Received: by 2002:a17:90b:28cf:b0:312:1c83:58f7 with SMTP id 98e67ed59e1d1-313f19d17c9mr29041866a91.0.1750212012223;
        Tue, 17 Jun 2025 19:00:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313c1bca4c7sm11437374a91.3.2025.06.17.19.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 19:00:11 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 1/2] riscv: dts: sophgo: sg2044: add MSI device support for SG2044
Date: Wed, 18 Jun 2025 09:58:48 +0800
Message-ID: <20250618015851.272188-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618015851.272188-1-inochiama@gmail.com>
References: <20250618015851.272188-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add MSI device tree node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index b50c3a872d8b..c97bd62e5f06 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -63,6 +63,10 @@ mcu: syscon@17 {
 	};
 };
 
+&msi {
+	status = "okay";
+};
+
 &pwm {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index f88cabe75790..aae4539dea98 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -32,6 +32,17 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		msi: msi-controller@6d50000000 {
+			compatible = "sophgo,sg2044-msi";
+			reg = <0x6d 0x50000000 0x0 0x800>,
+			      <0x0 0x7ee00000 0x0 0x40>;
+			reg-names = "clr", "doorbell";
+			#msi-cells = <0>;
+			msi-controller;
+			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
+			status = "disabled";
+		};
+
 		spifmc0: spi@7001000000 {
 			compatible = "sophgo,sg2044-spifmc-nor";
 			reg = <0x70 0x01000000 0x0 0x4000000>;
-- 
2.49.0

