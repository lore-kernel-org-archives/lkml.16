Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CDB1FCFDB;
	Wed, 16 Apr 2025 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765318; cv=none; b=K+eWNMUeTJKjne3Wqi9nUiv1ZOlIR6EhQRR+6+HnJJBLAelrbuo/kRvLIglSU5Icmj7I4J5z6idaEWqOp1emJNa0AvkTlZ3J4T7MPM9LA7+hFtlO9YrUG2PQ4qLC0VR9W93SOsgGvYg0C3Wk/sE4UoK7NYNtqyHFLb6j8ApFGFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765318; c=relaxed/simple;
	bh=dJdnvoq92krnkPDc4GwTU2yY/XG/8yYrqwYJO2Nqfxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oewq3EqpDBVoIZaU7xLKGalqTN27LhNPko0SpgayOAHCfkJHmDUjq3Dqt1mL5jVNjdgJpH5ZrZ1PthQxRli640z8u9U4ngATZ5s5fVCEXa400Jon4T/2cq9TEXhwqy47jSirY7LGGQP2lFCffag92W0H5pLzGBrH9/qq/I02IiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtaKexKq; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtaKexKq"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-477282401b3so61894431cf.1;
        Tue, 15 Apr 2025 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765315; x=1745370115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkcqt7j20Cq9gXaZ++SLKIGkgWo6g4XTTxRtlvgsjns=;
        b=YtaKexKq0zURoMjCDqfbWtHhvFzR0dx/YeBwGtdnb2nGRGv56dPnvezx0m8sf3RTgp
         ZhXvIOVc5bOtyF49KIcx1VaiF2a73jOuFXeV2rSVoUotlVn1g4zVHSw3DpoumeE1iOC5
         By6lKv+5TfiAlKZQTqoJTm5ZcSSBtQf21jV6s8sq7GgASl+bhvUB3+1Fop0eKn7Rax3I
         D0RwTLxdIowVCpKFNKvyeeCM5LKQhj0iRQjDNOdk5zGhndD3d+OOCSMCvl1d9veb7y3W
         XNkoOmLbZF60JfIkfHSP86rb6/bgpSgmTRz5ivDk+j8MsoUlqhmR1Os1JpGfKg9lUCQQ
         l9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765315; x=1745370115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkcqt7j20Cq9gXaZ++SLKIGkgWo6g4XTTxRtlvgsjns=;
        b=tE7y7M4VZnjnC9D9ez5lM/4Ffli9cW57rTAV7kB1JkEhn7jdPCqiTx0aKGpIpckZcf
         hSkp7i4MX0bkZGWBKmQff/gkjvudnH02982j8MvlyJHdoLzaBCO8jNMG1l6BW94jLTMK
         uuNOwmYv62xGFZdHOYY8v/JPvqaBSzzlJy7qPc4yajbYnYeuPdEhwB4OgGvxXxmdGsx4
         YELaXadnkqvTe8dkcA43Cg5TXNpV8QdZ8YSJLgQgd4aGqJK+QYsuPVPjAAvyaQ3/cic9
         2uaOB48hP3LY/U82+A3nvoT+wJ35GncJgqF4wE7dSgnL1lAobiT9UjtgW5ngE/w1dp1i
         y/5A==
X-Forwarded-Encrypted: i=1; AJvYcCWPFzPPNM5GaK0Pq4FFJU2TPJwt+3VlTvoJ1j+UKvaRm/WgeIJMHu0P6WaT51/oe4qJpNDC3KQWVyfn@vger.kernel.org, AJvYcCX/D6yp/EBZzyUHwBz9gyqFbb1x1CSxrhmrt+D7AJLerpjhYdinn5/fXWp0ZdDQovGU7HvJ/5QQmAnqqfuP@vger.kernel.org
X-Gm-Message-State: AOJu0YxHMpbRd4W0b8/aqq9j6a9lTrPB+XQyPJZd5hahTMS/3O1a/MkO
	M6PP4qhds/B7KkZuAgXO2xLGxUJn0uOAaly9PntZdF2bxc+VR55W
X-Gm-Gg: ASbGncujGuoCkOWCglm+He++rozTWPQ5uG2r9Zy/BH0Ji2k5SgzC+i/6JNpJLIBsoWI
	DOxYsj+If4jUGFmzE2H8qGPc5WQLkWwOu4ExJpvMFJWhOMdbDslDwNbhWrFrDjcrOGhaXkt/vST
	weDzI+e3BaLcnqFJGcIeogOgPL24gq8vYeQkFMmoPpFs2rl01AqCPCbvefpw8GML0ZAE8jiwbUq
	BsMPTijtEIhkWN4qAWbo89Yf6cG1UR5w0kaiIGGZOJbpAX4/cHty8PoGwBMQgZ1yaGbJm4A5yu9
	0Hs3uY3HMJgvDexnxerDYNwNZ9JO1bDly43sxUx+cRxNi5LDlwvj+nSVPNZaTPIuY+O0Ah2b8qd
	6hpeGIloc9ydljys=
X-Google-Smtp-Source: AGHT+IGL61nVIyHlwCc5yIDgO8Ggv3BrMCi7sfU9sNUu6VGxyESewGpo9fushCvrmYo/ZJTSEOUl7Q==
X-Received: by 2002:ac8:5a10:0:b0:477:6e8d:6081 with SMTP id d75a77b69052e-47ad3a04fe5mr25016551cf.3.1744765315409;
        Tue, 15 Apr 2025 18:01:55 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:54 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 05/10] arm64: dts: imx8mn-beacon: Set SAI5 MCLK direction to output for HDMI audio
Date: Tue, 15 Apr 2025 20:01:31 -0500
Message-ID: <20250416010141.1785841-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI bridge chip fails to generate an audio source due to the SAI5
master clock (MCLK) direction not being set to output. This prevents proper
clocking of the HDMI audio interface.

Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
the MCLK is driven by the SoC, resolving the HDMI sound issue.

Fixes: 1d6880ceef43 ("arm64: dts: imx8mn-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
index 1df5ceb11387..37fc5ed98d7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1

