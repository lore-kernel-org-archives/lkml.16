Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8E0284672
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434397; cv=none; b=rAlusd0njHwNxTrd8FJNvSE51BVmLrqD1IptG3ebkkYDKOlTYJQLGpfRmrwoYMcrojQc/vKgdoHm05lJyQVsjemKJdk8VBLEgS+0Mk+k8s9XhDZZodsHHgTk9G3LvDB15Ry9zxdA+AzH3qqGjRGPqYniniM+3XiE9hSIueXGxpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434397; c=relaxed/simple;
	bh=rl1DYff208utY7B4albm0ztL9bncdC6Wfr37/QGcCvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ie8zRUx/Q31PUvDZBjNWAUw6/GHsBlo2WjmqkCQYiP8GFJ0HQdB8vNlNWorMaRVy34ghk5bOPdHYRDqgYjNDrsd4E31UNXwEw5MPlXBL9RbCtYCgXEvzfczEMrwcnIsMRwr9rk1upvxsAIO5yfdTerB53KdINU9QNq5Nh1KBuxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DrMQ029l; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DrMQ029l"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604533a2f62so7000351a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748434394; x=1749039194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UmkYBDuhm77tmexgekeXNedIehqsLYbAaP26M4i/3g=;
        b=DrMQ029l38hUFTUKHAluVoZKHVwmuEKbH/IDnZ3VBA3CjGDw+2WnJIp0RbP36K+WTJ
         SLPRQ3UsHhH/dLSuXtD1rIb2TpNLRTQ+p5oPk8Cj8O8OrUk5L4Nq82f4UL0TjO79pYAT
         mLR9TkXI+UacG2njhmEmoju4lS32tb8VlK5+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434394; x=1749039194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UmkYBDuhm77tmexgekeXNedIehqsLYbAaP26M4i/3g=;
        b=tWc/npxXWvFu55wGanCOzOGue3abPZqs3F/6Jdb/opHJkt/eJsYEiYTuY/Ab2DmZGJ
         sZew8nn+SKrIHHCmEv8YQXVH/Ri2SRP2HstCltNuOv+Tr8EXkL2SyyctjNxqMbYx6btG
         gK/EryHL3RhBOpvuYjnTHy4cwpAwPm7uaZRZydEx4vOSewFHYJuDgMCj0DrED34k3pM/
         kJZ/QGMRuVG2mcQYz06Rynz0P93CxHLU5Ou73zzEEWLA61AuT851qR+23HFw59xVL1tQ
         5TW3wz7ErNYBwd6obprykkpRA8jQ9Q9fQN/2H2OkQoyjPXd+KjlxyRnHMWMDJ477/xjD
         mfTg==
X-Gm-Message-State: AOJu0YwaSGjkVbX0EepZ4DS7qRlwv51HwGmbyHqIOfOh9653XUbRKxAE
	xqFEsjIzGqCRS5F4HR6LWtAIZFOMlmhOJn6xijBUOwN7XoAROvT+XO6mSRGYyo24RYuVCUMy8mt
	9UOlS
X-Gm-Gg: ASbGncs+mgfmSxKlFKI2JMO1Poi3NjWmQI+/CVPZWr4VAxjs0e5c8T/YBIPZ4qvWmnC
	fGgN4tWV4XbTHrmdOyqOwIQT/HOUCtVmndyfIcw8BTmf1PIzd5aihW8UnTkzc9Izx9GczjsGyqh
	e+0y5dPt+ZQPrjL3m64Gxh+u7tEAaAv5aH/ZCmDls/HW9OvtT/5gp1qzLLwf6ksUBod0ledliGg
	MOX7+vt5zs0Enpj6mWsLcreKZqvM6dDwWNbUcNp/Bl4PD7PUXtz3cHopfefYa67fOCKueT4XV+2
	blBHMS/o/GL7xoYkt5UOEbDAP8DUBtFXSArQddXcBskyTz6vlCpOC2Gq/i7OTZj236APwu2Jaof
	EQ2c/FIDKjOFU
X-Google-Smtp-Source: AGHT+IGX/l3aYv50yZQiAwumavns5Baq8oSOepnjn19OavmavGdcIsWU1pqdCC9aSgoKvq+TMQezmg==
X-Received: by 2002:a17:906:f58b:b0:ad5:557b:c369 with SMTP id a640c23a62f3a-ad85b1c2be8mr1532953166b.33.1748434394098;
        Wed, 28 May 2025 05:13:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5631:61bf:398a:c492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b8afsm98523266b.170.2025.05.28.05.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:13:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] ARM: dts: imx28: add pwm7 muxing options
Date: Wed, 28 May 2025 14:11:39 +0200
Message-ID: <20250528121306.1464830-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0

