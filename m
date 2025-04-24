Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE8D1F3FC0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475735; cv=none; b=AvKvN1zxOqYvueWY34p6xUI96/K2lAqAP9+FPnx1MhMqnaDRxQsedCH4dQ1Rpc9Vuj+QyyLPI23fJD6asuCAdskQftP+Rkkw+zvVwytkSbrhSfdTmSd8TGR5kx7udMtCXnWsF5elPLaNFxLtH8w1PbaaLNJB+UTHIeXUDqSD2X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475735; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2mR4DqnBcuvnArA1XjC+uJaFoCYazltp6MXmFHC/HntonSglwr/oCjtli8uyAGxC1Vs9wHm5s8QvVlu0FxoHb3QbapM/XtuNhBSxVxGOWA7N+IexACraTA4JAmDyCEhA7o2tNy7f0MyK86HZ6HlPas3/CYbQHjztD3c9ts4ZlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cE0plK9w; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cE0plK9w"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so3779465e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475732; x=1746080532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=cE0plK9wNcJ0u5S/HXeMOiNCTEf5aK+t0iTs2Hpd/IXlcOdr+ZeoARiMMftGobz7Sc
         XvRQTW9yC63yvoFMxv9ZqoMwsX9FArMXmyS1VZK4ePynW3iYzrN+8wpdlKjlcx+/4Irm
         1shjmpSbvCnArmWjYWkGfY1m8MT8+y7e64mIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475732; x=1746080532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=jEISvG0a+gmjjSMztrw+9D/umpsGvHeyeqRxizPjPHKJOfdDWNyXSk831SQY+nrbcC
         1X7alrR73wu7gU1jN6qSqmniTQWQ98oasajqaWhgeMczv+/UcFyg9VINb0alY9fD2ou7
         luVHhhqAfayAbaxS8Xh1/LafwHn9gKj5/obsNkv0YLGcFMfGY2bSMp2ww9/gbpWHeTSa
         9SMJr+syDd/iSCvoEvo5BuAMHkZcjUygOOye6U0UAzTxD5TK1Vlu8eA26Mo0pXISXwxG
         W49zJf/Wd055kAeRhUd689+KAjLRzJBU57CCUFSQkgONVQQq7rvrGxgMZdYDBdIFr0kJ
         2xgw==
X-Gm-Message-State: AOJu0YwpynmPL8mWHK2HioWL6526ECMga9KM4lt4xMwjPAg92P71yfpR
	PvWrfYuEAQdmECRjyqBFhPfBs8cGOROUjRqDWbn5vSheTjSTfLOVGHGqp2Dc7C9Jc70VmQqXmif
	g
X-Gm-Gg: ASbGncsRzjb9HDE3g9nvNhcvUGnIhLpfhl9Uxy1ivo12oKhm2l2b44CTLZPIYyWZHQ2
	kXLQ56wcPtRqhTC2/HCJvewMhF1uLvkutmqZUXwNg5IouCG2DSVrVj1CukBuIv5Y2meIroVTnvZ
	iL0mxmsnZhTiLGbIqvYuHcwiwvo2EfVbn/xfm+5wIZEO4748T3ZksaxsKUl+gZUFmKhcRRvM7K7
	U1cgNmaz/8h6V6dCrOuKhhk+dMf0V6sHEYPCrFdBRTECDWpt3kebV14DSY7ud4BsfXHyDU2HCng
	1soWEj/LGUERI9vt9uRxnJ7jqdeifKaE8nsPrUxQN8UbuOkMEII1ZPV7z00ipsiJr41NlYtYU9E
	8hIWh607h5boLrzI=
X-Google-Smtp-Source: AGHT+IEfP4KDLP0ELF+YdFHzWQR/nKs0MjW8gMXZNg1m5ZDmDJsijDCe2zRl33Nt4gAvs8xI/MK0ZA==
X-Received: by 2002:a05:600c:3554:b0:43d:16a0:d82c with SMTP id 5b1f17b1804b1-4409bd050a7mr8473415e9.2.1745475731840;
        Wed, 23 Apr 2025 23:22:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 07/19] arm64: dts: imx8mn: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:37 +0200
Message-ID: <20250424062154.2999219-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

