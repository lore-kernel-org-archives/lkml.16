Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD3C242913;
	Tue, 10 Jun 2025 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571357; cv=none; b=K+97AS7P+ENjEgrM2e63y0QXS63pIG2toU+PWGBaShvqE4MruVVMqWpRc+pVTyHYht/xP97ydwZyGJ1p5GgpkUsOBysSjFKcbI9F83GfoOa5ykCCKn0rkwYaCG55K1Sfpp0Wc4O8uCpZfCdVMa9KNh8T6dZBbc5uCHbPQGiLofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571357; c=relaxed/simple;
	bh=Awsl7fijRZNRNXlMpIo+LphheeWbL1Ih3YboNOf3cPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qSPRaCuh7hc8S6iaubCPMRQUizx3l24+7ClkfCzR5Ajg41ADtoAgw1dzcOPYw5C80CLsbYiZQbt2uYSUan2RDyQEPNjIQGUPnZJ84GLLRWVf86qcXN/n5hSrznE8NMZz8QH9FdukOTpa8WzRPyc6CRph5Kd5II8hziwJWqFP9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoIthHM8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoIthHM8"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso48674785e9.2;
        Tue, 10 Jun 2025 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571352; x=1750176152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBy9QjZf0+4gjDOghZ/ztTm0V0wUCXKsc4ePrWpOXtE=;
        b=EoIthHM8oXP3sBRXlM3cEPZKZTtirIL8gNMy1aaTlTrcXfVHcNO4ZEFeIF/nBB15HS
         EewFfmX/3a0pPD29Fjpq4wVIjiEw5BQFCNSp5epuTak/iXVctOWOC43q2umrbkpUXmdK
         fAySPZDkwR/r7skFwlzgiSYDba67KPpmi4NsMTnVYy7Fozp5dVVYFuSz/8GzqN0wKqTi
         bT8fUySpKUi6D6/nVad6ozKksGna82onNEra1fCYsPj4g+cXidYrbqcReEWnnsFPMOH3
         XCftM4Bum2aHH48gk+rzavH3uk3HQm1P6u2lmOxsfresTwCMQ82mO5Ew0D+qyBKpiKfH
         YI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571352; x=1750176152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBy9QjZf0+4gjDOghZ/ztTm0V0wUCXKsc4ePrWpOXtE=;
        b=utJCnQnubt8GCeamXM1J0ZG49Of+MUD8DQtfmlv5yctJtSiuaa4b3M1ghYHOh5JUZq
         abyBXXrTB22DslFN54TKHLb/51319Le5OpmYi2z6Hj8O7VUr2Nrt0GOKKmcIhHMxpCEg
         O2N680pqC/LQwlduRtxY3yThe+0zlY8EtP393f5GfetZptSphaK2i4BtvBALcX+ijUUh
         BewYDDvGidvcODPIqvV0emi3uuis+jTAImDQE3tAPhOAZ6+7nbnVpN9Rm8mE+O87K06/
         4Lx4K1pEytYkIPoq6AdpmcpZSwz3K3diPtxf2m77adZ99rGl6aQvEEEcLw8okaGMf6iw
         KjTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPP8NapQYX4TgJ33G/qKg5R94OlXxqO1Feu8pRlFastd8T15asMO54bZvQGNc/i7DtZI/jutvVj6mL@vger.kernel.org, AJvYcCWQxPSi+xen0pxQBaAI869P0XquJb3bOXiYhrLivvoGXsv8C6O8rpiczq/KdVlcLdun4lcbxIyJYswiKrp2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6HJGsfLyo+J9f/1KymIlnCgmdWMeDs2ZETNRvzo3hJCUIyQ4o
	yayCfm0tqqcefjMMkFfGINFxVxK7NQHYgPrwVCs2vsyfQfh4e1Vrd57RW+pRzd6G
X-Gm-Gg: ASbGncuZ9dyrDbpeQqu5ieeOOKD10gG3m+UcqCJlwATtIypUasX1ggogMjBSGGkGImv
	qCyksDZJdiw1PcGZ5Y+29UKgd04PpoicenNPbHx8YDNX6x/18/yPxCJT9FaUTtQcfvAMgp8yyuY
	6mvaaIph0JuRuc95UZjZI+HmOzI5FcQ8TagpU/lYzgbbcSzC5OACXC9j+MViLqvfQDAcxMYcrpt
	O2d+EreanjZJBtrorAhAZXhbeu8FBqkSgRC5VkObYCsdAeXUQk5q+2Cltg1oeENabT/vmmh1ivG
	8N8EwH99jmm4WTzy8Ap7BZNdJVeGRx6C47vhWX2Lov4hM7GInF6rHMh5VQjhUVSSz7wkpAnoC+7
	f+cPlDPpGSD8kcmY05dYTGrw=
X-Google-Smtp-Source: AGHT+IFlLzTJeUuewdTAL2iHVlMGazp305kQFv+kHaCRhgmhrh9tVXxRlRAZrnMhHVuL1e982fCHqA==
X-Received: by 2002:a05:6000:2289:b0:3a5:2fad:17af with SMTP id ffacd0b85a97d-3a531cf30abmr13544526f8f.57.1749571352279;
        Tue, 10 Jun 2025 09:02:32 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:31 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue, 10 Jun 2025 12:01:52 -0400
Message-Id: <20250610160152.1113930-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b550f225856..26efea15f6b0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2435,6 +2435,11 @@ dsp: dsp@3b6e8000 {
 			firmware-name = "imx/dsp/hifi4.bin";
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

