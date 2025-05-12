Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E2A297B72
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074747; cv=none; b=LI544BwFKXapaGgzBrnFaNnwsCcELvMSXriMuEMbZ5fpY3baV3T6POvqn5kUNBK1DzXXmmEL5NIuZ9uxe0pClnyLQkylcKjGIlZUtgOJsA6QYm7XFxypmcsR4qwD9dWGJMf9aw37Ue4f22mZASDAp3gVRxciER3TM+Ym4yAjM8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074747; c=relaxed/simple;
	bh=KZJEwnPF2oP9YPtwzisRM5EnPhICPVWmlwFr/un/FRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brvd15IhP9NX6l3pvZ/i3f1MHn5Eq0TbeyfID8tRs5w7RLEQ61h0PqSblQcjJdg9eaf5C5oxDz9EuxFocTVSP0hE+kBdOyQX0z7rPczO24Y9fHdv8CoCinGnlMGDTc8TDdhRiutUw0TXgAs8gUScSpZjrixVHwk5SQr07O/KTAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=oDT9UmQX; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="oDT9UmQX"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-85e73562577so507903439f.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074744; x=1747679544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyAsDOHX0TzSNx8TRSfIb8QCj6vETa2EWwj7A6u+8bU=;
        b=oDT9UmQXV8dBmXK5S+NLUe6HI2cW15SYDuOUdyf7xEiSQrqM5aV5Z6+to25+RUHFjf
         j14aNFd64PHAYjzBfVLIF/MBOkWTFguQhgf4cnKF7cyX7CN58AwGkVpVcmYhSgmhmp1z
         UGnSNaZgyvWz5V1ItUyK7wsNhcu3RwVRxU9AyEl0nCUutftlxoZBtsBr12OjTOThtZyv
         n7c8XU3Ph3aPWVTh2XAgG+rexeF+TU1mBAkUCygYdOJX3z3oE9F/vbzNNM2C13oqT01h
         Co/HYWhVggZ/Uh6BjDjNrVbjxW5ln0kZaNisdNJyAvBYBKXswqM5Oi+br3a8/JZGJWPY
         1GdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074744; x=1747679544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EyAsDOHX0TzSNx8TRSfIb8QCj6vETa2EWwj7A6u+8bU=;
        b=WPmIHIxTUFkkJDE4MKrH3YZzzg9aN4RAtWfMVzjT9BOY5N5av2uUf8mT+3obI5z9Mw
         Qbsw3UVcT04+VNh4goM9ORmSfkJacJdRPHf9PFfiVziRQoGJmXNxFJr9M22BZAtK1dUl
         rP1Im35gGme74zwj4j9bSTutHLfC7AGe2k7iwIclTPRi3OI0FB98Z+O8nutz6WQ17ZZJ
         ShrAUQnb4zqSYtKTiVzILzuyq+QNxJPIcnhfE+WYZHmEDrOACS0pQ+RJ1qED2JMaj62s
         37yNjzeU458jEldH06HBIatLXMG5BnzAhm1yexsY6p0mJaj1S0umhkDo4U37BreShaT5
         L5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVC/f0hnhWT9NenxfY7N55DHVe2uIF0n3PzOXZncf4HD8o8X80UOaN00ZQ7RaYt/tXADaleWquC6cZEEu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkVNsf1pOjbZEI8x7B6gMjrBnaFx3XBeBLEGzdd9ck3+ylLynJ
	suYNDxIsdFQovTbbb/g9q8i0ZOVBPrWqd9qIw1SLwcRfsj7OWG3R22oacxpnt3Tpp9fnl4TstsT
	3
X-Gm-Gg: ASbGnctVeJifGTA5QfrHKW7CXOodGb8jfjjaNk13KnJ+WJQ2GomA/hjwlCwPf+rXIza
	yaW7G9xXpMnnOclidrRJbp9rv/k6AjGhtM8hPo7A7II7/9loLP4qOhrtzfuQ9+n0KR8Lh2Ni0SZ
	bVkBqD/w1QWmOROe1i7n9ODyoVKIDWwEFKMj50aN/uHfof/uTJvqbYAR+LMmGrO8SKhMrwcfho+
	cl9M0jbe53V/pDDmmh52vhXNnKkVFBInl5EY68kCI2eKw+Dka0pNFp8jjz2qUv5uBabdxDy8v1+
	XNzdF1gg4X6KmlX79lol7Fi4Brkyn5OQIFWosvI4CLkFipaiEEbCt5u0akOMiywLyIoUXR7va3A
	040H5+kNinS0TjHvbOE5uIptC
X-Google-Smtp-Source: AGHT+IFp8y0gq7FRiygtuXYQxumD0qfklzDcQqew2MqXSZ32JaN7tFBN5F+L1BBzUbVI3IjffHBXLA==
X-Received: by 2002:a05:6e02:3784:b0:3d8:1dc7:ca7a with SMTP id e9e14a558f8ab-3da7e1e1acbmr157948855ab.5.1747074744563;
        Mon, 12 May 2025 11:32:24 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:24 -0700 (PDT)
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
Subject: [PATCH v9 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Mon, 12 May 2025 13:32:11 -0500
Message-ID: <20250512183212.3465963-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512183212.3465963-1-elder@riscstar.com>
References: <20250512183212.3465963-1-elder@riscstar.com>
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
index c0f8c5fca975d..de403bda2b878 100644
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
 		syscon_apbc: system-controller@d4015000 {
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

