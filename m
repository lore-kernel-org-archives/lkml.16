Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715C725B1C4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751348300; cv=none; b=aJ9sHIqJQjxnO6y1PXJLJx7Bk8LziDqsEKY+glh5ZjbLMkvoC6YLKK4xMT8FRzrONrpHiMouY2jRdcf50BXrlCMWSDsuGLXdu2Weu7WVMBdlgRTa56A2Jms0ls0Uk+A0agtt82XkujGnnpWvZhbdQcWO3fnUxXsc0510scCSrLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751348300; c=relaxed/simple;
	bh=fKfOf8gVMMFphhh/Km20vvANfTe32lWbtdBJasF0Orc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pe6dgrN9WeKQVW3A3zHE7P+BMEzPmW1FxRWJTYSD86HhwiBmG/Ye5JNeMonOwzxrxLGrSqjnnE3JK59uRUopBs5M47XPfvX2WtP8lor7eluUWkWu7xxADI9f0Meq+JG9HVxS/aSfGQuLiSpB3AN00zalTIxctcaRRNt3tI2ANOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BTD18JZG; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BTD18JZG"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2363616a1a6so22773205ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348297; x=1751953097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBY768blUCx3GgOj3PZ2sE3UTLG71MWHW7v9NvluTM0=;
        b=BTD18JZGfdzXvMoFzXLrdIzpONCOMi3K7y7s/56UWpDomNDx88Z18Yps+OpMLOQc+O
         sdnh+E3pV9ZP/vyQEr1NRJ/8GdAKHMZiP31xZbShe9qps4i6UXKXLrtXpZ4MsrStLURl
         BFXPIx457kUtv0HP5dEChO+3cZs/eq5XvWjouW2bh+c2gNAWxS9FEouteRoCmdSnoK04
         I6HDy8PkZ+c4PWkRWtQJFY09/odZ8p2K0OjUQ6Ql00dnUc0DJ1afaSHHliHVvaudo8JF
         GMW040xMzmlflt+VH8Q3BssZ5XCbwBnEc7kqdl90Pn7WCoqYv7O5KK2kj9jIFyZqfH2J
         wRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348297; x=1751953097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBY768blUCx3GgOj3PZ2sE3UTLG71MWHW7v9NvluTM0=;
        b=j5gR3JaaT2oU/wH3Uki0wVRWnGfoW3AyEWOmpBFvlP153LXh2nJNoiPdDNgJol31jf
         hfhybnKAjxKVfenWFTd+9fmXPiXcjd1lEZLmXgGpdEOdBtCqbjUcDPQ6eg/GJOMtQurV
         0/SwCNXIgrmbsT+UTkYXLD6Otu8Ef8Gr2SLhuPjHwwaVILo/2QN025MrkgcHL2zZPggH
         fvLuRrMWQUai81gB6caCme7fSQbeg4pUVSHE4ad9P5YTtUyv5jN9rSTBwTh+G2T3jZm/
         gNvL3bgOajBGH7dHDvtyqIPvCnAMdoFnXP3UVwnKTu3N7rBuHkVq7qWorXtYPeLJcHSG
         heOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbwn2sVZ84qUdcWTu+5A1cBEiyBJZiKM+StU8HujfhTfJ9swfOlD4KmjOE0l7xqx16ykJBZFl5jlhck0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGBwej6I8p4fayQAhvbnO3HzOSnPHBB+TyA40MMgs2lKgkszpZ
	wR0vneQHspoXOeSn10m1+bUmBGepRenfLlG3eYr24pPkJCz4ehMsw9MHmsVUIflZSIibWpYmoRS
	bWc8qtabuP3Nl
X-Gm-Gg: ASbGncsPJqQshPai6XeIreW7PzyTxqcFtY/6YMvY3su1M4PtYjc03h8bRgKxjk0OUMD
	t5PZoxJtj5coLZQA8RDAyewrx9ZM+9KlyvYoJH4pdCOAlzPePkkjNrVx+lkHdKu7gA1Atgsvzd4
	2bMVxlI1LMLJJUQuMBGjSZP3jhPuOmsi0OVE7UOO/6MhM7RRvdKY88GQLkAvas/YDy75hnG5OPv
	zhYCERvVeJI4qhwRWTPry6Z0cafrx4kVtAzFb6VNy6m7F/njYgv3AnTuFc24a4PJCD7cMghxZdy
	ua8GQjs8Pq8a9rbhxtsrS02Thva2uZJrtMWVe/A=
X-Google-Smtp-Source: AGHT+IHwDteRU6Yz8aP+7dgjVpXAB0rA+2JkOitsu+96XwoftfjHHSIxcqXxmNoS+PXV1A0eJAitSg==
X-Received: by 2002:a17:902:d603:b0:234:8c64:7885 with SMTP id d9443c01a7336-23ac48b6862mr236842415ad.53.1751348297431;
        Mon, 30 Jun 2025 22:38:17 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:38:17 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 01 Jul 2025 13:37:01 +0800
Subject: [PATCH v2 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-working_dma_0701_v2-v2-7-ab6ee9171d26@riscstar.com>
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
In-Reply-To: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Enable the PDMA0 on the SpacemiT K1-based Banana Pi F3 and Milkv Jupiter
boards by setting its status to "okay".

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: added pdma0 enablement on Milkv Jupiter
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 4 ++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012fe56d42ac8a7efdbbdb694f31b6..39133450e07f2cb9cb2247dc0284851f8c55031b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -45,3 +45,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pdma0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 4483192141049caa201c093fb206b6134a064f42..afb88ddf36eb8e5e3bf74fa29f9bc006e45814e7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -25,3 +25,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&pdma0 {
+	status = "okay";
+};

-- 
2.43.0

