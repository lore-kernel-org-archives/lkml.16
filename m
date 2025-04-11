Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC86126BF1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377331; cv=none; b=h+drNvvLIpItmoWnQ2B5Pl79VfpwvDMMA1lkWoHzlJhYf3iOL+l2Fgfhub3+t/wXTuTyYGJgSZCswaEi5s6pUHxjz68htmg2mhgfUGK9WgwxPSUkTDsMGPa1Gk1oG2eLpErSPYZ/eqfbz07+inmYX7uxi6noo4kL/br6/mc+9nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377331; c=relaxed/simple;
	bh=1swIy7rxFEZEpzVbtoG003Ve9GvpHlafYnb4ccnIdDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4+3QA+zn5OB/hyw1c1xebI3NRA6IjZ+PtLiv5HhvwGeWkM+ypiFMGZP/VvoUezcM/hQJF00O54Bus2LgVZdUKJ+atLoqAurvjLH9X/vc16QXGsZevvHuQ4//h/E84wv4NZOc3MbiVBYRxF+fJ+11qdKYGYCWG45z73GqB1BnNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ezFwS2pD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ezFwS2pD"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227b650504fso18804635ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744377329; x=1744982129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/PuzfNro6+y5gilkjTT2xRfkKu3sAMB/YAOWIAOfRU=;
        b=ezFwS2pDzDzWZIZh3ySYop5umZohIo3OIWo8pbiIKCMWM97e7RM/sd5lMOAXJhMapi
         QPm4GaZ9ih4wi4wFxvizSsA/Wph/7Q/kESaUxUG23Wfl74/cVk8baBiJkFBMlCuH1rw2
         nxGQoqGmBWzB8iv7w8l7veDd6ZGwR0eXB0sJVjRF5R/IQT3jOcyc/trvyhfezx91sqaG
         F89IKrfv3A9iD8NyYXcJq7n7cS/2Vup3poDiqsu/bIZ0gCegMi+uH07KJZ/jojxRt/OD
         NFArmOFxfyPa9QBIpmpjhrTDCL8AyywWO72UbtL0az5+XSHuFYYUqlFwjVrXIfWBGA9w
         NPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744377329; x=1744982129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/PuzfNro6+y5gilkjTT2xRfkKu3sAMB/YAOWIAOfRU=;
        b=slTmD/Cj8MLjRodey406uu7U6BTOTXT2hFrANfLFJF3Pp/qnphZatnKi5sHDnav7AS
         qPWSwFYnkFEigLY4AKgB9YzYLfKJDaPjyk9azsN6wgXky2Y7YRPXzev2+7v04ZbgcbD0
         OPtDj3w8ZTr3vPO89Vbe0grs5kQQJSUht99nO1KXJoSpH7u5118vsaMIkG2i6YcMFKUf
         ObrJ/N9lEUfJpsv0lwUpLBGNjcYWv6qQQIeL/YZwZCWWHLR26mLEvamE6Xg8EV+by/jZ
         GQZkNeaM9TIx/aU95q4S+6gLpNwTcSHsSL7zM/E0vDzyFjiQLejtlPWIoFceRLfkStB0
         FPGA==
X-Forwarded-Encrypted: i=1; AJvYcCWjmnCp4cGbniN6MI/YqFKsvt5Op/AAAntPzeAQG1lDkY0ASTwUKrcwrH3GGpRlAtg1qc1YHbXP/lwxiC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG7u4umTTfKsjt0s9N3/tybggiN/k3jnncosMKrQ1JCW2hGgZq
	TOTnUqIT1/iFhEaZ0loXf299v6tiaBqOHlpPccsnV7WUgqYm9Y9CHbFbNiUte70=
X-Gm-Gg: ASbGncs+3pyPJfpgtGjujj2eA9dhn2JvEwRjRJmz6IofNrp86z30dWR0jjI6Leozxww
	JXsllfPaGEv+/q6labZyPIib12hImhDne1pgri2wngSQSwDcTjiUp9Ew70x+lufBoM0JY63vvPC
	X+dvYVwWNtbVpfK0qG/mAELEVBg89aeZL+AryMRZE9skvhMNVB48Bb2eHCLaMmcjH+aGwQAHvPX
	Zttu6o/YQ0NMFHQK1HW4rmsaGIf1ozO7+lQ7ihEglL5d0bIZ0O652xKqJG0++DRHa4GQdo6XYM0
	CzB0CwTHKpDiWA/G8C8cV6ojgFsolgE=
X-Google-Smtp-Source: AGHT+IHitAgPlQRhs5N+Pq3jnUrMsP733j1aryRrbpuBG1bREkPzJLptIcFojxxM3RnqxYYr08nnJw==
X-Received: by 2002:a17:903:41c3:b0:223:60ce:2451 with SMTP id d9443c01a7336-22bea4adea2mr41309915ad.15.1744377329094;
        Fri, 11 Apr 2025 06:15:29 -0700 (PDT)
Received: from localhost.localdomain ([2a12:a305:4::308a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c95cc6sm48245005ad.122.2025.04.11.06.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:15:28 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 3/9] dt-bindings: pwm: marvell,pxa: add support to spacemit K1
Date: Fri, 11 Apr 2025 21:14:17 +0800
Message-ID: <20250411131423.3802611-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411131423.3802611-1-guodong@riscstar.com>
References: <20250411131423.3802611-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "spacemit,k1-pwm" as a compatible string to support the PWM
controller on the SpacemiT K1 platform.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
index 9640d4b627c2..1e3cabf6a89a 100644
--- a/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/marvell,pxa-pwm.yaml
@@ -19,6 +19,7 @@ properties:
       - marvell,pxa270-pwm
       - marvell,pxa168-pwm
       - marvell,pxa910-pwm
+      - spacemit,k1-pwm
 
   reg:
     # Length should be 0x10
-- 
2.43.0

