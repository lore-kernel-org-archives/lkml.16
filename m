Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F18B1FA15E
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206353; cv=none; b=n8lDEj17o79OqvnAWoRQobv5b02N+eU5nMZMYQw2z80fOgl/ODYK0aapABimnav1IvqBr5peWosR+RPksTeroWE1pS6lnZJWMtM1ehRl8QgCidYjY5gv6Bax7DzkH6ocdsZSgRKE0Lw2StXrCznueMx0WfZQdGSHAsV/sGXyx9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206353; c=relaxed/simple;
	bh=PSloMT7Rx2inJOV3KMd3Zck3Us+DxfashHtyFpyXkJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AhvtCL9RLOVHgksMAAzckjCiFYqRHvRoe3s0ucS93iJmRZoV8WhgyyNvfwW+nOPSt10SBHVVe27v4X6ScU9lKJiu30AS8TPGLdKjAZDKeqvcHXYrxfDCToAaSudHVrIsaesktak4AyMMtSR5XEhnPqa/DNN8gfoKJznPgrNz8KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eyTEtKDL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eyTEtKDL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so37050505e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747206350; x=1747811150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsjFEA09j+sM7FAAoS3tj2IZ7u/MK8eK35o8RJtHzgM=;
        b=eyTEtKDLLJ9ZVBQZK79eDuyiVTeC2dU//SUL5+l8u9EhTAX+LShGYz/HVsDPdLmpQw
         yzogE/gv8YHnjuhzgmgY//x5ywpObel2J19g4tObD3aUlznuqOLoss5E7gWROmHIxyyb
         Bfa4t8pXQlIjRXAx8bK0MxeIBlyGeOs3j7qII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206350; x=1747811150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsjFEA09j+sM7FAAoS3tj2IZ7u/MK8eK35o8RJtHzgM=;
        b=sW8GORKqZx2Es5gin8GMFTBwqrg+Q6B835JU9qgX7mB/F2ANB7BcxpVLJwsrMOnO2d
         Yto6Yb+4KC+B+j10oe01GEbL0Ow1Libysn/Zmiyb2qIEsybCOevn9Tyu4ecIpYnQRAaa
         LJDgUX50JDSvgIZ91QFTThsMuwIVFnUexlcog0m3xO9Qx0nZhCCa2JMl+2A++8anj/Om
         JT/wpAfgk4+XLrj2QI/Ie2iM/lThTlt0F4YZ6gFLsviHVA47OBBJgTo1FABOAr1GwXnH
         zMZF5BadMBO092v/MVZwu28oevRpfsHMS9IYSPqk/xPCPLTZUfnfG1uxNjvmNRoOpG0F
         C+uw==
X-Gm-Message-State: AOJu0YzZuTweyXnDPecOf0JhnjHbahiKF+Md7PEU99S+BK2akHtKEzYD
	0nLwMqGgETDPIqRW1Y/f+REHiMFCAG2CA/8t3UuF3moUu9jFRPQnb30E9bt6JfX8y/U4hB30CY2
	36Xo=
X-Gm-Gg: ASbGnct25ZR8HLB7x3mnvLktSyofeehcJN5WEZ4rnvEmDEoaW2uxI6u8PWXx1Yj56mg
	L1oy2VZDuj7CxpFBXg5YUfnx/89FgjSeKqjJyVargprBui4GWFbIjW4YzFcvBCNV8eLlELas79/
	TbeSkSUTaoKuJf/L5/gepdSDHXNOmMEosX5hLwo3sPHXw09Ld95KULCeISMjfyT7g868z3mjr8V
	+MRBdFl30/yMTDu7uqCnOCA0w0iPGVDiMdINY6byvl3jdNjbg2l8SKV/ojZ38JAJi1Yd6nI0T34
	IsdOmW7GKE4S88D8FiI4mQ+iFBiYAiOdJ0YAXfd8laRSvrhYczT9M7ZSO2qkjZ6g6MFMurbRw4z
	rd5wSKCFLfTH7MnVjhvqFkuRTsDgj0sAJcJmL/NSMyr0=
X-Google-Smtp-Source: AGHT+IFP3OZAR0dGoXkyYTq8TW0unWpQGNJt+dN4divr0wjJZfTsT15iqaNFB4zXPgGA9rG4SvnMNg==
X-Received: by 2002:a05:600c:3c8c:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-442f210f732mr20320025e9.16.1747206349632;
        Wed, 14 May 2025 00:05:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm16688175e9.29.2025.05.14.00.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:05:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Leonhard Hesse <leonhard.hesse@bshg.com>,
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
Subject: [PATCH 1/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable hardware rng
Date: Wed, 14 May 2025 09:05:33 +0200
Message-ID: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Hardware random number generator is now used for cryptography.

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 6159ed70d966..5c32d1e3675c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -29,6 +29,10 @@ &gpmi {
 	status = "okay";
 };
 
+&rngb {
+	status = "okay";
+};
+
 &snvs_poweroff {
 	status = "okay";
 };
-- 
2.43.0

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
branch: bsh-202505-imx6ulz_smm_m2
