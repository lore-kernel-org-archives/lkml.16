Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8299A207644;
	Mon,  3 Feb 2025 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586917; cv=none; b=Pq8Y8Rfog2uBPurQw4zVsm/55Pu3l+/Py60UDu1e1dn17LfJCyHQNxem9Z+ThT8Ek6vc+EQiDZ6UzQrf7zEIN1Tfc6+RxazHDKvlN8bB3d4C5JOKoT75fCCa/O0qWMaE8vn2q8hTRF7iogB9B2AbNFhiK2gN47EEB1Tmvf2OzRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586917; c=relaxed/simple;
	bh=iof820EKKKMpDSBwk/VGn90Y3m/jD1O5AzQTcc0iV8k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oE1oRy04tJvUQhfA+2bVuKWyjAyPs/8JYABeuAAHuui6GNaMkwcJF8YfP5/5vH0fDtagHP48RCiKsxWsRWuOAfFDtX5cSUANNArB3Vx0bT9Gbp/GLbW+ICdds1EuYjzqIu20R87mqMRoHXmSZRutfRVw7mAYmEXOPlIeRhRpEa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6INJIPg; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6INJIPg"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21670dce0a7so88582995ad.1;
        Mon, 03 Feb 2025 04:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738586914; x=1739191714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=twHwwtRQqwdawa+fPo20Qdo3qbha0a8mea1KZO6bLrk=;
        b=i6INJIPgbeW+13ci9tpU2UZKB191iJrVmubTn3sJ/3tbQWQgeZyxXCQCV+UtDeo+x8
         VdVGhtpWWMEtTy+SFbES+eK4NA2pAqwqmQhEvE/FMEwvzg4ER82T7xkkGW0B/9aN1/hQ
         blyYio6TAARfOV/WRA4MScdAT44DvnNYn0EmUwl14WD4QXW393Md7GvkRZ3i1lPBWIzD
         0GCrAsmej4n9VpruJICQ6aIScbnQK59Z2x9p+XbWT9M1yhMgAwJUCXorQG2iZSrxO/L+
         On1qawoyn+COqPD7or+J57iJ01uIqS8WgAzv1T4PrNbrHiM+3Rob+2AyMsiwND4tN3NB
         xZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586914; x=1739191714;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twHwwtRQqwdawa+fPo20Qdo3qbha0a8mea1KZO6bLrk=;
        b=VYGBZ1Df0qkXSvYalqfbcaZnYnQbR2h0R73RtwLyYxYPVdKC1aYILp8vKdgkGOZI0j
         ms/Nd7F4+eE0e/O8qV/zwXMqY3B0lBIWKGDbrBfoImv1FV0j2x2a/FoyO2jv7ewvyLTy
         ExpTQAEtnEE4mGw78K3zyIheA9KHqFWNKS0jS5akpkw28nI9EpaoWeBZ8oVhfrXcQMnr
         CHN4g2xlFbVEtYELSlCEyiPKT4whCIpgdwsOh9sxYGBCwC4wTu/lexbc/t/YHbSVaWBe
         r7SruZlGTXGugjUWap/WO2KmOvvNJlfdCVvWffxZm3tNcVcKl/gsqQuvj6e9lQ1tSHcb
         ES6w==
X-Forwarded-Encrypted: i=1; AJvYcCUocDWAy7RsjrBZc9XfHTX2cDwcQyBQc9FXMgJiROA0zC0QGRsYzPGV5xrwosGzQpr9aUr6UcXMZ0oV@vger.kernel.org, AJvYcCXsH3q1yZXLv84AwK8a8ZmKYR8ogF8YB4jVTcwnE1OQluNkOIYdNyxinQipjm37dVLm6MfctndyidM0JEEY@vger.kernel.org
X-Gm-Message-State: AOJu0YyTykrZnahhnpTqDHnbVrCUTGKH6thDAIixiWnxRJDPkZO/kZu+
	TzWwsWI11Kyn7XU1G3Vz3pLLt/reDzqXFbCZTENJIkts7gHrLpvS/Cj8fVE7
X-Gm-Gg: ASbGncuGNU1dnT5bofv5X9SGkfdQyI/amJcQ93nJUS95qxVjgWsZUq9KVBnsdBtkQOW
	umsXByB66+200kYR4mztpHFRKOBgydNWYChzaJrQOyGzX4xCdq+48WD+tnVfAJm7GtG9IO60S4v
	lN38wZqp2FuJfTE6cO0fs0Ig0hPlKEGXIjT2bz5tyLZImaS1rvBllsURh+Lp9kuSPF3HiyPzoWE
	zVcrhnZqFQzALgedGr8bmYhaaZwbC78DFs0vQb5VSXrKnfVK/Hm6iXaUjyjPIUgHr0+Jb3Lpo6i
	MtOmE9kNrgGDRL75
X-Google-Smtp-Source: AGHT+IFkG16Fy+xKUEcl7Zhyfj8sYFQhncAIzcxpAp+kKdyRiKIyPZxsk0Bgs26S0+b7QvEEARtYmQ==
X-Received: by 2002:a17:903:2a8b:b0:216:3c36:69a7 with SMTP id d9443c01a7336-21dd7de0fc4mr329572215ad.45.1738586913809;
        Mon, 03 Feb 2025 04:48:33 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-acebddbb0d4sm7835225a12.10.2025.02.03.04.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:48:33 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
Date: Mon,  3 Feb 2025 20:43:39 +0800
Message-ID: <20250203124747.41541-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds performance-controller and operating-points-v2 cpufreq
nodes for Apple A7-A11, T2 SoCs.

Dependencies:

- arm64: dts: apple: Split s8000/s8003 SoC DTS files
https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T

- Device Tree for Apple T2 (T8012) SoC devices
https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.com/T

Note, this will have conflicts with Apple A7-A11, T2 PMGR nodes [1] due to
both of the series adding things to the same part of the .dts files, they are
unrelated, so keep both of additions.

1: https://lore.kernel.org/asahi/20250203121831.36053-1-towinchenmi@gmail.com/T

Nick Chan

---
Nick Chan (9):
  arm64: dts: apple: s5l8960x: Add cpufreq nodes
  arm64: dts: apple: t7000: Add cpufreq nodes
  arm64: dts: apple: t7001: Add cpufreq nodes
  arm64: dts: apple: Add cpufreq nodes for S8000/S8003
  arm64: dts: apple: s8001: Add cpufreq nodes
  arm64: dts: apple: t8010: Add cpufreq nodes
  arm64: dts: apple: t8011: Add cpufreq nodes
  arm64: dts: apple: t8012: Add cpufreq nodes
  arm64: dts: apple: t8015: Add cpufreq nodes

 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   1 +
 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   |  45 +++++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  10 ++
 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   |  45 +++++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  10 ++
 arch/arm64/boot/dts/apple/s8000.dtsi          |  53 +++++++-
 arch/arm64/boot/dts/apple/s8001.dtsi          |  59 +++++++++
 arch/arm64/boot/dts/apple/s8003.dtsi          |  53 +++++++-
 arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
 arch/arm64/boot/dts/apple/t7000-j42d.dts      |   4 +
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
 arch/arm64/boot/dts/apple/t7000.dtsi          |  46 +++++++
 arch/arm64/boot/dts/apple/t7001.dtsi          |  52 ++++++++
 arch/arm64/boot/dts/apple/t8010-7.dtsi        |   8 ++
 arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   8 ++
 arch/arm64/boot/dts/apple/t8010.dtsi          |  86 ++++++++++++
 arch/arm64/boot/dts/apple/t8011.dtsi          |  79 +++++++++++
 arch/arm64/boot/dts/apple/t8012.dtsi          |  83 ++++++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi          | 123 ++++++++++++++++++
 21 files changed, 773 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
 create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi


base-commit: a14d9039c2aea103eeedc5602ebab731ef3eb73e
-- 
2.48.1

