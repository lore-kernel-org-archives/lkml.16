Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490221A45D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 21:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565616; cv=none; b=sr//+OWyJeZooeoW+bpJTuIhDTYxqkIOIwjxN8guUwnJoRmu/1NRvgMKZTTib3Ceh/DWPh0QXxoPRk5TrsGZG28ySBmcCP5KQrAXGRFcKUKZ+QfINl6BOyXhMcHaupCpi4phhd0gEf3UGtnP2hiHfwQ+RhkVl5Rbr5AbCju17uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565616; c=relaxed/simple;
	bh=o+DTlUShzMqTWdpVptHXPZF7T6Hpe95l3FZm/2enEAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=opFJ0hYzpBx+G1iAzDQqHKgD39nqQjzGX9dj1RhKawahnVE5DKDsuCSg9+AvPl2TbuSy+x75RqiRePvJtZ0gHTjhNLNRlQt2tKQQGhuOG6YvZzX0+fxRIHIbl6ikHhIALQ7LXa8k6dS5OplKeAXJ6Z9M5FFzmAmAOelbJamVHno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=s70s/p9Y; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="s70s/p9Y"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-85e15dc801aso560380039f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 14:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565611; x=1747170411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=s70s/p9YwSg76W2CTUcTOU/9EKFOSwuKQqErfuIuUBIRKWXo0xgx6dnHv5A21YPgsE
         UjE/KpAvjPMp6/D7tUn76o8B0eG5qcZI3Wwliw/pxspJajr6NsNzj5iCe60ZXHn/H0Wa
         LSnJUApysR8jiBaVWhCKrLcQDy6LFtKcOQ678+06MZInDDv9TXe/YA10ZXgzQobp2lqP
         IGepf4+M8ss5Iovx3620LCehFDUwimyqheTYxrN59v7OxMYxjwwCb6KFBgPKZEkeGV9B
         Z2//pNl0OCSOGJbhMBU4kld/4sWRWf/mBv/8gfKh+V4Ws8PnKG7oqs5zhdBLIxBcRsVZ
         6QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565611; x=1747170411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4O20IXLpg8jEm9xUHHnlctypzKfsB1ZRP9Xc0/of3c=;
        b=LQl0iNmwe/PC0yDE4h3KXf41/era9KX7KN/7bq3NgAv8/d7vf/gPw4CgavBVN/b97N
         0z3OcOkQnBuHKO6YBXoTZfCdiZfBfF5Rh2X2daBRinxgYTILhqxcieV4uSJr4jUB5mpz
         FiS4pZzQG7sFw4C9YPsq/6tgjU7D9cD/7QifT92NVpW3GNx2tFUWbo1kX7KHVcPwo5oc
         nAnt6GlStx5WsAG/ZqLDqjHR3H2WWo9HqI7ITXpipVLaomMQ7FVCCXVMPgox1cnCjSSz
         3Xg7d6nBzyOQgR88B0jOA9Eop44JTjY+KsCz8zBYOIlb7z5W4uMVIqUml6ehl2P1Y5xt
         wQUA==
X-Forwarded-Encrypted: i=1; AJvYcCVXpm9BAkF7WGoD2mBp4X9ZpwjHPKvn8lIfc5zpu+oSQ2vg3Hg8kPv2CNBq0wCj5kgYcraD0BQ30NXdL8c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8kxWXEK6TBYr6l6bllXHiqsSSaKFgEV6MT0zlqqkwCUjd2iUw
	V83NmvOpIckuDLXpjKp6wQUvyXknpFFRgYc5/lfeWPvZF5P+cmi95xV4ihyrknI=
X-Gm-Gg: ASbGncvd+acDRZ9gGyCX5wjsE2q3zLVwvNv+Ej6WOiTQYq+GlvGe24YdbGQRpQGXbsA
	IwYijIkLEdQqMM14g9b5V/XW49UD0dyg0d9T9sbhs90h1pJRITvjiU5WLrQlchx431ckUk9Uq4a
	8R1W6Ol83BKMjhE/oHD+sRViaOYTw642Jr5CXaq0znIBHnH+KyiYlzPO3BceAES7G9PeBMOMs6l
	6d7+yWafNL2eaKmJDZ0W4xOByvnbNGa4IemV53X98WFpeATo8Zo9lQlhDqRutzsXFZGtHYI6mnq
	5k/bzRp3uYnrn0s1mbSZGuXsslPsZZ5Slc8Au1jgEv8xBJvJGA5++q/mnaUv86OYACOGwV+jMPJ
	6TeNVdR7FfO8sMg==
X-Google-Smtp-Source: AGHT+IEul28rdtLnf24eQSg9o53hrAPhvZHN/Ndz1HzML1us6xJoFlvoRMcUFOXYOR8J/ANloTh/Jg==
X-Received: by 2002:a05:6602:1350:b0:85d:f316:fabc with SMTP id ca18e2360f4ac-8674731bb70mr129539539f.8.1746565611497;
        Tue, 06 May 2025 14:06:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:51 -0700 (PDT)
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
Subject: [PATCH v6 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Tue,  6 May 2025 16:06:37 -0500
Message-ID: <20250506210638.2800228-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250506210638.2800228-1-elder@riscstar.com>
References: <20250506210638.2800228-1-elder@riscstar.com>
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

