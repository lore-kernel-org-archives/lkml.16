Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A70E28FAA7
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789659; cv=none; b=AKq0QFSR7fp2/4mpZ2edctrzjDzx9OjV2jOY7gDT0gzhHFMnhtbyBOjE0ClwYCOB0gF5KjP/pYeryJur6PNZGVVdF2FWwWDtUICH5YI5p/npb3asVFeSDPvHca7/npP8Q9Ne+tHlNaNjw976ru6uZ3DP54wmGYjIm42DoM9Sy/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789659; c=relaxed/simple;
	bh=o+DTlUShzMqTWdpVptHXPZF7T6Hpe95l3FZm/2enEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSpxNW1VbguMd8c2URSxyKcZJR8rizZ4FT9XQksPdhvs3EUFQz6MNeCPXq9pnjZGvRkRWoMEVRhRGAtViZsHXVob22bnvNkSLEHBRrLZswyYZbU74jPFd3AnZxMCBGF9L8sZg1s++Te0zJpIcL3DtCfu3c3fZ1EoYp+ahYWQ1s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=qr9zk9Tm; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qr9zk9Tm"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2d4e91512b4so1328514fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789657; x=1747394457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=qr9zk9TmzFk8u5MrPNvNPZzy3U+PAr26qcHdBeV9ev3ayi5VBpR24n1oO2oUYpWFii
         iyRtw2IOGA1GE4h2XyKASz/PFMqDDKwGhkLrecOmPBRqePnwb2bH1sTj0oEfLyjkghOj
         WjoPI51jH2V09069nGrpOiImLsMmKOwdBnSt9QKBpqkCeIB9UfE7iL5e76Qjw1hIBOqL
         g8VWDORsilCuUnMo4PYhv0x0qUu76nUGr4+Z9Gfc38+YnEffAnK0pOjnrU9WjU0JTJrh
         p0iUhiK5RZwwAe9LuHBaNGU3SaJGGBGZOd3S5PphSP5t/L4koTDx8z8gZpkzoiWR/LOR
         z3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789657; x=1747394457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=L4qXvljQKk8K3/ZJeWev87L2rT4oORPVWaQ3S8CGDw4X9j3aP+QXIVLF/rHfJOA1Jl
         w2jOAMidG04RAv1tYKJzfdDKcy46dvWMv4CNakuh0KUNjVKtm2KkKH3OPWpTDUfhCOGc
         +FyQ4r8kdHfR9eHWsH9Kae1EChjMnyRfcz0T8zOfJ9hqVa09wTkwr8XvlfhM3y3E9bde
         JHuOJ1YJRYstVxSM/W9uCFXo4B9DeHFEWFT4iqgcnUUewQEVZuPTxmTKXJxtS6jKhwFU
         5cGpjV1D8VU3Y6D7xAvR7srPfCRQDanidvwi+RluQKJtY99LWGB3N4w0947XEg74BbT9
         RCbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDVSCpctVj4gMwTJ4wfCP/iad+JFz6gIuPNIxPoSZEEqUZBsxqR4HO9C9o57z0KJ9CgHxHJpmXPaZ6nGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9aDFXXLfxBTy1YG7nqW+eXlj5Np3+vGmpPdYPxQW05RDVf+iF
	Z4IRo9KEh41lghG1azIq5SmIsLR4oB2LANxMsIp2N8hIRGcbTn4vuCKbrIJS9sPgwjVTTuSaf/p
	q
X-Gm-Gg: ASbGncsHzWLyhzKojqUzmirytiF9rVodbVfkx4Rdu/32x8dpDKOalmNT+SNd8G0bjRf
	6qQeNoip5UWp92neDzWdAtbpWDzQHOI1XcPFtpql1EVJ4vTfIVoeGP3fA75/eKs+/X2XOJJgLJs
	H2xRI/bgLyitNhEC7cZQ0cUvUNdzlOhrggApTRujEVuJ2ZPJb9eae0BcVpAAWzYrHDBqyiolQeM
	NOV9Oyske7jMpefHsgqpA+xVNYkMe417wN2sOXr4hlGIDXVUWPqSMXZAFzFj4aSZGr0jWsz15s9
	NQAMN8wi5UJ0z81RZouRDDgNYrKWLJKOljIw0GTD/X8JHNGvhJoBnOs8TN9pd0YSMQFvUzGgYn/
	wOHIXbrVLqiuWow==
X-Google-Smtp-Source: AGHT+IHhcPDh8pSsBNqyKD2nWRDYn4h+n+ZvD9Pi5ASi8e+tMvfh3KEcYvhc33cDnA1c1ksabwra3A==
X-Received: by 2002:a05:6e02:198e:b0:3d3:f4fc:a291 with SMTP id e9e14a558f8ab-3da7e21748bmr40779945ab.19.1746789647038;
        Fri, 09 May 2025 04:20:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:46 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri,  9 May 2025 06:20:31 -0500
Message-ID: <20250509112032.2980811-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509112032.2980811-1-elder@riscstar.com>
References: <20250509112032.2980811-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 6eec6328c26fe..f4afb35dc6bc9 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2

