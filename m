Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98422676F6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388192; cv=none; b=YemCe1PMOBdrC3Jsb+0ThLEdLIgTzzULnRKkSM/lphqmiout4aJWoXIMe7CCLs1JyS4k4vYdFgf6uKUt47xfurCZ/dVZI2eIvnySGkcJTcQYmI/HpuRaFz/MRiqnLc7smg9PPUD89lbnh5oDRUDfIColHbxovGj0RjZbAoHJBkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388192; c=relaxed/simple;
	bh=6Nf3p87xmE+b+aldFiQfNcyvNboXQjvT/SrC191QSNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8bCgeRzgWcCI8txxuD40jcXmmTAQUfNuFkAHkEfgOryOYFnJZ1tDynxpkv/+UJB8B70meqmL9wPb2GKUIO2cum4TKig47fDrjs2f84qkkZfkJ5QibjHuqIhjGg++JJyd3gnnquLcFrL0SFu3LwVwFbByy0wVp8tjg4geFc+dwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=j0DNoqSe; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="j0DNoqSe"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so9195588a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388188; x=1745992988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=j0DNoqSe5sC91W+M7bcpRK8phdrgFrsbg2Yn0zbvMOM4yvLft1L8MRe8HyEaFmq0gV
         73U5mROhx/P6SBweFIyMfsYikg8ncBcv4xNezGdIyD0T4SQspnA5/04JdyR8Bh8MWvmv
         Ht4sFFWoEr19+tW2czrNt01CW9SXTf8rJgsRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388188; x=1745992988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=k+Xn13w9HWOsi52DYkxcsVYmGYF9gqrrgbW38MEpTOkPA1+z8cAzNGepVWs5Qm72Jf
         IwGT0/HRl9jxK0O1odf5DYaOXt2YnowlyrzoGX6zR2rVJZXDm4zHgcYMc9V418uggyPu
         QMDiwTU6M93THwqhWv3JZuP6y81CGhszsJDdgKyuAOHjU8HUIe9gDpTav8LMrvF5Ibcr
         azlrj4ANqhlqTe8tcmLqPRRMiJ21ZR3IN77Lsd8rx+s/k353UHjf4j8wpKw4wsxKRmu7
         Vhe3RHlEKMDT0+tS+cxhOf0oKamtNiC0+nFR5gSHY5Ex77Aj0fmmHOzpw4xlSu7htfP7
         9JJw==
X-Gm-Message-State: AOJu0YxyDXcpprPCFunQAfccyAY7S1q5Y3sMUDRZ/0A4xh56bQj6/fhx
	CMv6ihHdOvAoZSgah2uE7z4Ea2QpLONl43SaR6dTuUk9x9YR/QwkT8D2cQBTfLdc0VC+iSLsHcs
	g
X-Gm-Gg: ASbGncsYyaHOI7zPSy6HsQ4TklBAsW8/MAeDmtdo5wXEFtMTof7GyQW6rTqMGkp9BV8
	puKgfPMRVCHOTDsanljZI5gzu0fP/RbjLecssnWUhWAyVcKtesg1TciRV8tRREgsFcmbcWuu78m
	q7KWn1Qdcl2+NWAdZuolFS0VDFNYg/lIwKDghIUAEuY2AkHj9h7XOSiVYchaoEfTd7lbAAIXk7w
	mI6MaU6rPan0E5yzllgtLsguziARaemnGwUZhjt/Tlt/dvrVYJ+yo3p3sczrZ9NkkZ0IfPUwRX/
	HJW2W9rMJzefU8BCmiTDl3ao6cH/va0dS0uyeRcwKBpm5gyh/4eyxR8myl6BbzKW1WmF8zeaHs1
	dG7L4
X-Google-Smtp-Source: AGHT+IELsWvXw7F5FZt767HR+UyBJn9wcMcKkXhJc6P2zEo6Q4Ars/jQw/zuDlIzWD0FzCHnIL24gA==
X-Received: by 2002:a17:907:9708:b0:ac2:9ac:a062 with SMTP id a640c23a62f3a-acb74b38943mr1561283466b.23.1745388187989;
        Tue, 22 Apr 2025 23:03:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:07 -0700 (PDT)
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
Subject: [PATCH v11 08/18] arm64: dts: imx8mp: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:25 +0200
Message-ID: <20250423060241.95521-9-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..78d71aacd0a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

