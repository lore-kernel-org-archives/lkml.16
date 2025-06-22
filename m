Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A98C1F3BB0;
	Sun, 22 Jun 2025 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750618714; cv=none; b=f8FsJ4iKXw3QIrEskXq/gudTq52onhrfiSO1EdEomRmD8LBIlZ0befhFaXmlfl3oA2xLsgprZd5qKQ9EJKfEtnhmcOv2KwQKvc4P2EhsLQa9gK42t6NUeuiiHw6z72czXRGLCiQsOdpoGAolZ78ptGHz9xE26DfFE/0hp0cR0q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750618714; c=relaxed/simple;
	bh=SllmjV/k/a3b9zxpBVF7Og8sgYm08X5JW9dC+m7zWXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f02hVB+RK3y0lX67lM76HzD8ta61y67Yiybg7si1QzPdSwCTgOEP5hdMqK6ralxvsfoxhNX7S1eYgTL0qY2UufglU3lUJez17M7owD8oYAKJZS9FKozt65ABPq2gRKfUOSMtzcjSKJ8pjEu+srvX5I5j54vatnm5jDFXbjv2xHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gabv1pMr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gabv1pMr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d6ade159so26155335e9.1;
        Sun, 22 Jun 2025 11:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750618711; x=1751223511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uSVO5sTqAoj9Cyt8EcznPZsRyzi2cKVQFTlXzQdwggE=;
        b=gabv1pMrRMA+T987m7ZAmO7qs1kPln4yqo9b55y0OiRUccK41g8wnWGvfCQ/x2WYMM
         OCJCmjcDQjC1MTQrkBuvu+jCVKQpFKhu/ipWrXlJxKWNIFY2qfVHoKmmJjQHS+aCfeVD
         gYV3kj8JKuDWhuiwfCB3cjfLox8Q5NTZHUya2aUaO/wkBx/Dx53AjtJ3XkpFa8QCizSp
         uo057j5eayarJCF2Ay9CxM8SiwZgvQ2qpslLKocM5qXwa0GDAkXl7LNcluEfnCAnS7fo
         wESFVtzxBYD+hVpBoC24wRK8LYJFde3DbMLJS1NLcTgjFmLfgPSkv80BHy2cs60a11FV
         nbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750618711; x=1751223511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSVO5sTqAoj9Cyt8EcznPZsRyzi2cKVQFTlXzQdwggE=;
        b=BEvnHY7ARwlzBSErFP80SeXBTq5zutifZ0E3vz48WC9xtYpHY7E8lBH4PJyFcv2Wbx
         ElGhF8BuRsUY4RAcaGVFYSy63vFwplLEkLoeTViSkqasAodqWegS06cDVs8mvQi9TPbU
         axbL5hGso64EAXwsbuCqeS338AGvqbdKoVTZ6MXQ0PzDhAwg7EvneF3/HCa9bAT5sQq9
         xJknQeG9g2h4jbmd4A98S3tRq0Hcm8Gd6E466y36r8liZem9165BPf2mNRPxJERfVODI
         fDnbLv8uT/F0VZOdD/SwcfG++jN8SQTBnDLpgCqCR+31H6kYLpZzepSgNcOImvaEDgtM
         8Bdw==
X-Forwarded-Encrypted: i=1; AJvYcCURhG8s4/DpZ67xvWJIdKCuzcpj0/vi+jJY8VRHXFsspo5mKDUgpyK3uhzmhUVtm7fUi15wkAy/5zHdeCy0@vger.kernel.org, AJvYcCWHzcnHj0EJu8vx0Goa8bhBFthydsZT12kYPyXtAAyb3xdZYQElDZGyy5b0GghDNN6D/o9Lid9uN9IX@vger.kernel.org
X-Gm-Message-State: AOJu0YxOWyLhRftR8T9Ojr1A6Bq/sQxSclzLSZHuV+MmvmEonTBMyHCL
	x9+UnpgKe7LELdt12D8QJNey2+9mZJbQCea9QHXCtHfxE+s3qZz/8z1SbAc62iEE9LQ7
X-Gm-Gg: ASbGncufdBhnDPPEaX/uLR2g0usaEmTyjhBXkY4THRGj5OSnDDd6NligHFgf/mG7ZZo
	7T5AqF0j3FszMoM5cikAAVDzVfZ0bgyRjpIF/vdXpreg0iHbnLPLj00YHUtFliB+nhzrcjxibGv
	YLuuz7LcndZR7sdm2Zr8M3hfPeWd3AGtyAF3Hby4NCDyZwWbUR2UO3TovCXqyxQ1Z6VUtZPtRJL
	za636cg3S7/FCOQyNNSgjrpAInEB3OqjcKsjNVTWrRRvQFcF8mtUzkDXSXfPFZOFHgt/wa4CnAT
	khhGQGKM2LmzY4jd3F8eAmeVmiIu9+aANvZ0i+T61cDy+fVCFNKBU9cVkm0GlbqLf0RDjH8+yUQ
	s
X-Google-Smtp-Source: AGHT+IH3xVQDsV2b3eNirbfyc89CSjt22T6srKK0geP2sYvw93s1z7TyOBPUqY/JjE4XrqHgNi24lQ==
X-Received: by 2002:a05:600c:46cc:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-453656c3168mr94060515e9.27.1750618711137;
        Sun, 22 Jun 2025 11:58:31 -0700 (PDT)
Received: from nas.lab.vially.dev ([89.101.66.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d1391sm87238045e9.9.2025.06.22.11.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 11:58:30 -0700 (PDT)
Sender: =?UTF-8?Q?Valentin_H=C4=83loiu?= <vially.ichb@gmail.com>
From: =?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: =?UTF-8?q?Valentin=20H=C4=83loiu?= <valentin.haloiu@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Enable HDMI receiver on CM3588
Date: Sun, 22 Jun 2025 19:58:12 +0100
Message-ID: <20250622185814.35031-1-valentin.haloiu@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable support for the HDMI input port found on FriendlyElec CM3588 and
CM3588 Plus.

Signed-off-by: Valentin Hăloiu <valentin.haloiu@gmail.com>
---
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
index 8171fbfd819a..5fbbeb6f5a93 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dts
@@ -335,6 +335,17 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &hdptxphy0 {
 	status = "okay";
 };
@@ -478,6 +489,12 @@ key1_pin: key1-pin {
 		};
 	};
 
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	pcie {
 		pcie2_0_rst: pcie2-0-rst {
 			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.50.0

