Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0D91F4626
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475739; cv=none; b=lXgFDry1m3wUcS4G5ULUj6bBND6Dsg+L0RT07HZJ168idBcVt8RUMyEFCZai1z1qwUBM+Xr75fCT6HXnB+bmg1zXPOKP6o3jLddZR5fvNLINbBPau4cvXgGqvvpiZXwsg6LjjiNPX9Jb40IgwyLGViWc2hkdhmIan4iNIMvNxMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475739; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6qri1R+hceiglcygAqsdVLN4TcESKNFlpJSj0h6n2ExPzrrDvpE7nQ6fFnVI4SZr8iHdBT1JD8E7CQzxn6nKCiVfBgFy6MylIDdHcA8cstvwV/JdQb3R/THd41ZKZApGTMozG7KRNxrm/ofAmH03PX5ooxVBGGdsTfNeJMx5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=E34QRgoS; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="E34QRgoS"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so5691125e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475735; x=1746080535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=E34QRgoSkEbj4X6OtPu93OXSgeojddc95KPvVYoEKs4Ja90NzfqNqHmfXjTZdHbzsS
         PJfKvFDmYPvOBzn+C29xV9y626zFmYTjeZ2dJEKHtlOs+HKTKlNXlc4iruprptapVOu3
         AaJPF4rKjv5nbH42arMkCrmaY0tycVj/Vczk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475735; x=1746080535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=c744HpvtJ43ABlBy5GWdm7BY1Z63yXgHfLfIEEbq3ZAsVgbUCevg543DGI2tEZqPw3
         q90iqKdi62Bd+CkUpbk6hDxomDGtqzb88cyiptSZoWds+hROuKo3x25zmldr/Xi1kHJ5
         V8pO7Mb0ABUUqSxtyLo+GyYmEmqJAUgqSX+7VUfmSSHPbGcLFR+TTQLZkh+R3b7cJ2vD
         qXEGFJNh2HyqpoN76VMV2J/pnSXDX9vIKBNqvUL2BKw7/Qk0yDiIL6OhJY2uHCAWCvhu
         sYeDQDWkAIg1bnhDbhdVqKCCrue0YldLowTR8Pvq4HrNG6crFqt7tSjQxU7KuZ+syYsg
         y9Aw==
X-Gm-Message-State: AOJu0Yz0ccwErYsk6kzIB1U21YKnZSDs5Qyl0g8uenn3LwEerrJmE0IE
	UE+fSblkIb/tUeGwbyrWvNATotPw3vKRqYYTh5nyy5falheOB/QeXaRpPORLuNfgBtGecuI49hj
	1
X-Gm-Gg: ASbGnctNFpOW8mLDFwbMSPgnVcvBmTz4tagR/eSQTx3BRYMrwO3Mt7h7nOykqAfxM1r
	UjWGcxqxtLRQ4YS3KF35HkVwKWl3IEfuLIJqexfdh3v7DZ5U1P96qe67yQ0lha41RrmJnY5+8DZ
	+g6zyDOsA2qNPH50EH06lo+Sov3Wrsij+jOpW4oe04HJojSgNxfmJ1t3/ss8HRAiUqfT0SeEDl0
	aFNvMyVcedhknYP5PVXoNRcFLlBQquJlR9+03Eio2on0Ywdxz4UT8Z3bsl2PB6XVOT33AfH70Ie
	VaP+r/1/njpmp35tuIE8sqpN8D3KVHilgIImPjrsF48TjSO5Ge/OHsujEGM9L23kbBKH9dTAPR6
	jNRiX
X-Google-Smtp-Source: AGHT+IFfEKxdwofjLbOX41KrgGZVFzC2ffJ2xkKI3k+BOtUiPjGXL5Rc03EhcJrNDo7yGHkwvRfbrQ==
X-Received: by 2002:a05:600c:1e8c:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-4409bd236ddmr9097865e9.1.1745475735057;
        Wed, 23 Apr 2025 23:22:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:14 -0700 (PDT)
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
Subject: [PATCH v12 09/19] arm64: dts: imx8mq: add anatop clocks
Date: Thu, 24 Apr 2025 08:21:39 +0200
Message-ID: <20250424062154.2999219-10-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

