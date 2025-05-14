Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED2421C9F0
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211126; cv=none; b=MuChJUKlCO02KXepgCcJZWjzTjmidnRuUtQIWqTOGFlRx4jZD+dt4sc+jb9YfCrQLcgNBCP1dvPASwe7298UiQSLDg0XGaQ39Fl1N7EGXQFLl9QPyNNYhmy2sv1Qr+BTRRSNG+O+XIi/PIups1IbJ7Qxj3OZHm3tZg7yIPHvBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211126; c=relaxed/simple;
	bh=e2pQqiVOxDgNFEozC0iIGMhFjYoToSACQa3AfvGruJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BNoG/26osqBHpg8+J0/ApuqwBpXYWdT3ClFSggZPefZQar5zQxKpweoZiPYRB5TihK/OajDCR+50RfPvN9/jww1fxAKJWoLbyJkZCoCNQXhmJAdral80JhooLCC/lL9cQhYkqZt5QGrmQE1CYaidmm6y0xaSgdAH+hKoGm8F4c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=jz4s1atV; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jz4s1atV"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso43640625e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211122; x=1747815922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pt1EP0ezTYwDfM+B24peCLWSMczcGcs5Rkqpf9JI850=;
        b=jz4s1atVHtB1MpacbKL5RQMtwWYgr5Bxu+2td7xF8msjQFCF/HjVyOP7r3VyrSlnSf
         RkQSN+oAAnliXitvoZuqcdV9VnAE+ESLLkB8ODrB3UdSQxM5LridwnNqxVFNMzORXSym
         duhXNkC804rcnxhkugyM+olBMbw26Lqxyj5To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211122; x=1747815922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pt1EP0ezTYwDfM+B24peCLWSMczcGcs5Rkqpf9JI850=;
        b=UgdDQtS/iwdiUvtX+2SP5eK/xC9c+hFSWc8VfU5gtoyfXpxuy89gRfKB3ODl+Z05B1
         mxNvMrcZGar6LWH+lpEJPJPEQPhdrsZGzGjVGt92vWmQzdMx4OufwslwD+QRhuT0Y4WJ
         ouar8h00yLvfO2wgcbXu/W7hqcPRUBXMJ94iAFrIURRB0+egvPhyLZaSUV/ldGvTUzj4
         tUb6fk4aLyaLChGnwHXqqxjvZcChdp6St2IclPQQq0Dd9TxgdmFfgufjQAtayYdGhKBR
         Ckhyur9XOr08DHeBBF2xtzqrp4DnAgZAF3LUWbe6aTeiD9EANOUrHHStkpJzzqkoR1fV
         e6ug==
X-Gm-Message-State: AOJu0YwNpcKkOtzpuCSVG2cVKrplgugnZCzgIK3HT+AVqxfSpwHcgKa+
	6IonZqskT3YWaOC1ErF3WyxWWOBCW/4MSVSmca87DAlumi5Qa1o2e/EaE/9TXJapJL2catl8svt
	e9pM=
X-Gm-Gg: ASbGncuNnPq36hc+B31pZYb/QA5oazrJuXKYw95H8v+cxAoK5fZ7FKy1AqSJEdxPbuI
	kX4eTUsbIrZL4FKU34BYoWv26tjUf62Rh7Wv7tYiV4XKFQB+L8GADfnL/Slff7+xp1Y3w1EZtu7
	Bn+B3c+ggVaX2Nlz3inQe9la2Lk3CHkVZi2Mi3DlfB2S9c3h8xL37aBC7Z51AirCwDFsJc5dCbb
	ftc6S4CSnbsINVW0gkDFXFq+ZpKjqQO+vcfQ78OyRHKds6xSgZzP2nHvDIwbTwH5JbujAYcBj8y
	7AfQDBcggmUjCO+DauRYT4Z73YjogTLWugASmXmuJnTfyQeSPNdpz9PQevK3rUlUqYMDggohucT
	9FZ49yaOoti3ZUB8MfrhN/rMGEXJZ6EdgRj6KQqs2Vek=
X-Google-Smtp-Source: AGHT+IFjDXXwQhSURwlfHmcLE4irqIStV0UgnScTM4HB5AXLneqabf/gWJDu9GBdpVyWbqQMxTEylA==
X-Received: by 2002:a05:6000:2505:b0:3a0:aee0:c647 with SMTP id ffacd0b85a97d-3a3496a42f0mr1760633f8f.17.1747211122654;
        Wed, 14 May 2025 01:25:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
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
Subject: [PATCH 8/9] arm64: dts: imx8mn-bsh-smm-s2-common: Increase drive strength of pmic irq
Date: Wed, 14 May 2025 10:25:02 +0200
Message-ID: <20250514082507.1983849-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

Increased drive strength of PMIC IRQ pin to increase reliability on the
reference hardware.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index 04112a83b1d3..ea8d741c6904 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -364,7 +364,7 @@ MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA			0x400000c2
 
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
-			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x040
+			MX8MN_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x041
 		>;
 	};
 
-- 
2.43.0

