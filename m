Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AFE209F46;
	Sat, 21 Jun 2025 11:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750504998; cv=none; b=f3G0IQYINt78ZxOEtkL+w17PjsTyoTqzvIYAJa4/qmv0MQvqx7zBWcVMZ8denqtehOvOr1pWXsTCls4M7R16bhomZ0CJNldrF4XkfHo9vfsu6mTd6aKL7U2q5vKmLDu4owU6gOj/PQg70XkZ2RwzgYUmYOU0Djc/juMJp83vtwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750504998; c=relaxed/simple;
	bh=7NM1yG5YzQ8JicsWuohUOCWC31cpq61zxWivMC3BXFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EUECgc2ijLCvqekY8jfCi7bjb14uWLR5Uq6b9Y1uLm0VTrkVyQ2PHonxieHgjwwlH3YjlwkoXzNCB093FAR5Zz7ofvWDZys0quxPqzEZrA8XJQGwIU0pYyItKsp4Km+ursyRco18bFD8TUeAa0eFjNCNjQr6ltgwuJrEIrOZdz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKIpqoIx; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKIpqoIx"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3de18fde9cfso12155585ab.3;
        Sat, 21 Jun 2025 04:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750504996; x=1751109796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fyspq0V2HWwwS+VnZ1WgkjemW6T0dfdq87ixJii18ZY=;
        b=UKIpqoIxKZRS2wmX9+MDGrH7fJRruHzO4KjUYPEGYWaM22jwWSVXhkamRNrftHxKxk
         Kzt1jlIDox3si2B85gxMW0+nBtlG3daZq63xGDwblX1ARalx2E5Aoy/vvdSLA2dAtZyP
         pGuXNuE/M1EbUZh+mPFVWiJS3/F78MKqDbeVaJqXEiGXgwtasgn8NTcX+lcEtP2bJgSz
         oy9hyoOD0fW90WwXB0SU4f2sZ5aPp9NI/arlYh6J30p2rPV3M/GJ7ehYIVBjHEIVx1Ge
         obYHhLV26u9lsWI8O8z80WCDH+cTIe4qDbFRL86YQKyGQ5/YtzGtDyue61GmfisEaQF6
         N+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750504996; x=1751109796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fyspq0V2HWwwS+VnZ1WgkjemW6T0dfdq87ixJii18ZY=;
        b=rUDXkJXrZ1DGGwjqaMAZU1n649Guot9aMdt7YgJ7uOWvrYoyenOMaq5Ha3BgumeRaO
         dImfqrhx7sEcCFSEFC71jag+IkWFZ9UGD9iOYIFBqpYdChn2LWYF4lE6UygnackqAyLz
         om07oZU7gvkxY76lLh79SaelbZ/ImTLTBNRxDDw2PikYOKGD191RH34u10V8tKKGKscQ
         e9VDcfR5lAizMRCjjp9Hxg1vQLtvMNt6wHP/rnpUwQNXYmDRWnbldccbd6mU4Ezw5aG1
         3cP7tqVawKeq2TuZK9I/XLF65gL4CccY469iKjzzkQJxdKa9y8S/jPKpLSTrC2MzGPII
         9G4A==
X-Forwarded-Encrypted: i=1; AJvYcCU5RAD01VL4tPeM0UbT2tpcxYMKeJOI1c1pmAOI1zl6Odq+UiXzBkbiIkABt5+tP0Qll7RoJxEqMhH7@vger.kernel.org, AJvYcCUvqlV7xug98eLZYMjY36ggd/sHN6QpKZZBStKopthSbqN00DcSy7vtzQMEDpLy80uTfFXCc6cG3sAiwG1B@vger.kernel.org
X-Gm-Message-State: AOJu0YwF6il0KxFDMkNKGhyM6DdtcMJ89ThT2YXT2nX1UieZZZoEY3B8
	51CUc7VjL0NnIJpIyD5/4OashOeav87D42W5X0aiye6dEVxd3U4F43Ab
X-Gm-Gg: ASbGnctfo3leP8gIByg9rY11Dlds1zN1vu2ZUUGJGwDdgqGvCiyv2JevRC8TRBCvgXX
	QpMzYZn0ouowLc1qEVnmaYl4cQHxlhtUMpaSTqlw/V7+/e2ROavLxvU4Eplwlcz34YLl4re/0wx
	dxFO+ruVtZum6bMZRwMHlB0C4BZiwxlWOeZb2fqQU2XlimiBcdymu8RL0rcF/TO8HSLG/YZVfoE
	uv+VkPx7KSJr0U4C9lIgrVIT/KQ7XKdZ+TWcg8hHrWVCKqsXPA6HX7H1X/yMx+TzFk6P3WWpcRe
	SJRtvI3JFZVzKPsuO4trA2d8IXgwTD1RgoYfzKJDyjWmWoe6a4S4blItYeKWBjiBKxoWkQaZm+G
	sMlBwSDRdJzN7totghCHnj0rrM0zFOK73D9Lr
X-Google-Smtp-Source: AGHT+IEbOxBx/Sd+Bsqwp70aHm+2E+WsoOI4o1sbT5qYTMXDbDTw25OzNNsCWFVkE+Cq2EY8YZaaAg==
X-Received: by 2002:a92:c267:0:b0:3de:25cb:42c2 with SMTP id e9e14a558f8ab-3de38cc4f87mr72766065ab.18.1750504995670;
        Sat, 21 Jun 2025 04:23:15 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de3761874esm13654385ab.9.2025.06.21.04.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:23:15 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
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
Subject: [PATCH 2/2] arm64: dts: imx8mn: Configure DMA on UART2
Date: Sat, 21 Jun 2025 06:23:10 -0500
Message-ID: <20250621112311.68101-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250621112311.68101-1-aford173@gmail.com>
References: <20250621112311.68101-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recomended to not use the DMA on the
console. Beacause, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 848ba5e46ee6..b98b3d0ddf25 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -860,6 +860,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MN_CLK_UART2_ROOT>,
 						 <&clk IMX8MN_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1

