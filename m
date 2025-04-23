Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9FE25E814
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388191; cv=none; b=YFVqw8cesRcL4VzrnjLGXOmyJdyTD0EiiwVoWzTukHrrEhXPdFfs8UGFFShVV9ORQu+0vtHyYk+mY0t5O8DFhe1hfbT0BZ4IhEoLNEugK3GxC2M2RquMGWmai3zZEkqzk90CAkKNPUuUEs4V7B91sLxdOUEAIn6dkNzXbIDDlbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388191; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlBSnIeyn1AjT3IfkuwJZI3rX/21NkA56YAcmTHVREt8DfqUCTY19Zt1TjjEq9pSbvttvN7Sqs7nGI6JuYGtETqklZNuIhwocJrT+yx5lsuM8uSCxvX/gvq9+AnXhM5XrOqbCvGwJjN3gVVpKTbzlDZ/4LWaRlr1FCDrtIQHcBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=M/8zFNjG; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="M/8zFNjG"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2963dc379so890499266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388186; x=1745992986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=M/8zFNjGeotlFvryTsv2r6nV0LE2DAjUsdorZ8DUVMicOTcZUdL1lCUKpMpzbDqWhy
         2ia4d51Gy3ZYXLpwBAcc4gd0fg8X9jJso6JPn2zsC+dZG/Uf/0yQH5tocwBgB04/lYdx
         Bxb/fPq8PcXWPArFSnSpKS7QC/zwcBTHERvfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388186; x=1745992986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=bl+r8ki5lD0YbWn1H4rkHG2O+4z2bRDqIbCyqU+uykSBUbSmHBnHq3DGvCwaUgxDXE
         F96hhgAYGb/TtWgdZ5Ml3G34uc3rAfZYI3srFcrAaJS5ok6kdoyO4pSIcF7lERJ2zvLr
         yqqEioRZRz4ZLGOzJbBinhNfxhqlkVGLUkNLUVGbvGGKeNBK/N8vmRkE99dvGuvN5RpM
         N6qxEPJl89/6pzmQVycCCIqXRov1H0TyS6xEawsVTJm766AaBFja9OqA6ZZMgghgUfae
         vbx2PHbPNQ8sycOsNmLlhmxjCO5Ik6F+3EunRyBzrHVI7vfsjuLruZ0/zCHyS4Xz8Hsf
         DB3g==
X-Gm-Message-State: AOJu0Yx64+ClrTZQCyhwn/eZNtc720YlK9fBzsat4kC/W1Bk+IJUAuuS
	04AF8TJPhZ8jmJiQ1lpdAezwLI3weCWxYCMuSvdXWL+MhYsmNPY0aEoiIR0ZEba9JKuV1JaRJFN
	V
X-Gm-Gg: ASbGnctByUWffgjnTn2tpaSXb16CMfJjx3Gsc/F9w4nGMnpNjfGvGyWi/oTr0fqLOLN
	6O5/e4Viy6Qis+/T6lAQXEm0/3nETexrosaiKECUaGo53hMsfeIOYIZydlC53r6XsYHtnxJ6qoI
	0tQJeyoYPPU/64uoqDn+NctROfi9KhTQQmL1dff8x5InbqUA0WyNbgjO3dSdo9vlqurLG6YZhSm
	CZj5uY90ZjUABLXEXcJlU07CRMpd79SbFbeWK3r6gbtxZK21NYB5g2ldw50by1g1d0kJ5WNGdjB
	KxGKPLjkhR4vUte3r2dmy2tByoc431T2LTCYAajFYpxYxaBxu+4XN0gluh1VwYcyaOWt/OFn7qJ
	s04zZajoh9tB95cA=
X-Google-Smtp-Source: AGHT+IFHRVjgmo/Rf2x02+US2TOfqy1M37ZfZe16WxtkqyYMdziLzd+0fdDR5em6xjEUFwKXEO/9vQ==
X-Received: by 2002:a17:907:2da4:b0:aca:cad6:458e with SMTP id a640c23a62f3a-acb74dd6021mr1627869566b.43.1745388186587;
        Tue, 22 Apr 2025 23:03:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
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
Subject: [PATCH v11 07/18] arm64: dts: imx8mn: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:24 +0200
Message-ID: <20250423060241.95521-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
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

