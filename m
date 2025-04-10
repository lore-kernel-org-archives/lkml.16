Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AEF13B298;
	Thu, 10 Apr 2025 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246776; cv=none; b=Akl1iB/8if0r15H5TMVPnb0rX8fp7nJvvOkly/bJi3wxswAWV8bov543LWCYPPHabXI20zJRTD/Im4Sc0EN0jUkEjZotHCvJjgEfqaFm5zxcaQJvMV8gZxq7Emtl7AA+qLHgGuC2O/mB9gFCLkkauynBOJBjoiaqWKggJkwOHZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246776; c=relaxed/simple;
	bh=UEZYxJlRW14QjAti+3oPkm9GRt7N6qkSO09zD5qhw5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eELgqKOag5XDnmSwhmwb+Erh8g7gx2+vGQ+q1YyCAnSA7LPPYHoHc1mwN+9sNIBFeLEfXoA8HoolY45MP6AS+tUCAfLr+ryZnoaIWn6kXyqY9tgUADkKM8mTBcVAqalh7oPST1OMWTo+Er0WE2R4IDy0JK/kFln7pEcvkIQvM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C8Rbcxo6; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C8Rbcxo6"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c7913bab2cso30828885a.0;
        Wed, 09 Apr 2025 17:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246774; x=1744851574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7lDTk+D2aN9K2o2aETqca5tZlWTc8yezMYzKKwzeFM=;
        b=C8Rbcxo6qUwJWtaCmss50/QOh4mOPbsDxopB1DSCLv42AmNnwm3grT9erFgZdF34Ie
         BtNi0Jk57n/ECMHnYxQZjHG6YWFHYmpO2r0wTNb1jA7qzONoMJphMovi3+mmPPO6zeGX
         AyDhyZ77RZSZccKTu2fRYOK9hHKYtrVRsADjfAnO/9uv305P2jsugX8drRdGFTjKeIaW
         vQDz05RlCuol+JyzQ/nMrM/ZRfMlp2w2Rg9f3E9fQNofC373JxoacdKY14Oi7apgw/gZ
         Jh4rw2JNOPuwsCc0WsL3A5bIAKShe6ePtBU+h7TY9ExIRvHVJMIRgLkCBeZcozYPd/FF
         8TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246774; x=1744851574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7lDTk+D2aN9K2o2aETqca5tZlWTc8yezMYzKKwzeFM=;
        b=QqJgEsWjFq6B5Zhfp/fsL/AhP+vfb9/7Hhp2z2apSQyM3edR/n5iR9i9dyk8gMnfib
         vo/gNTxq1qGTJAubTAGc8XFJ+6bU9tvomrzGbFo3yTqGe2WRCF6daRX/ZFxc0mL8zOT9
         Pdnwvb08AwTwKe7nqS9OWllAL5u6CU0qTPj2a1k9qv+Ir7oETciJt9KWv8PcH6G1ERrM
         BtIRkQcNw91g4Obr6orU+L3Wsdv6k6retkCGbQLrVi90F4zU0BFaOazCwe11H1N3bz2H
         6FKwg+2BuNJCcvA0puVXyM9xkI2Qpwz7mwB/04L3hhD75Zrvv4AsTqB0A6YwdePl9UjY
         FSag==
X-Forwarded-Encrypted: i=1; AJvYcCWEJgLmIn0/H5Sn/5kMW2pMIAHrZ/oRen2LD7gAp0RUBckDuNXaeKihPzjnK3ZUD71FhOpILCAI9/+8BeC4@vger.kernel.org, AJvYcCXVMfs2XFjFZLHEbDtxlvkCquXWKyjQ/6B7r65A5vwdYkUKMLdrAf+nmG7gID5Qpp7vhZWGoY7y3sI2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwa+Hbn/srYQkEGuyRFf48d1jRgQbaIuvIn6DQ+BPTW2lkyEjI
	EiwFjo2jPdTHBM5wBnM80gzoEaQeHU1pMSAkXqWBYxQltRboQ1Vz
X-Gm-Gg: ASbGnctW9wZ9nBW1df/LESDKUrYVVBZmfNCVjYeVfPmUmRp9xJAf+6c3ane23qgQPb7
	IwWFie4YrPNQYBAJ6I1AoxFOluRHCiEJhC21SXfgXXn9fZsPbn2THNe6mytle51iDunE6QqXdqJ
	BDDZQSzbKeLcZvYi4CGW8hsMUJ8TfqO8qLXysUSc3XssQL+O5Z0Sku/fAJ3Fb/96GYA45rrxHfQ
	V2NGrVAlMwsOPVeBp4/82aXrStwY0ScW5gdZgOmRfdA4XMSpPh+d3h3VgVj3rQXeqPheFkNLxYA
	/PJ7RuhzgxiHk/NtPcLm8NKuXZM3rmmT8flMl9YAY65RcU/S+995yFpfpvWhjfJ/4QChQexdO4h
	WtIH1V2svh9CLlog=
X-Google-Smtp-Source: AGHT+IHwE4DM0JUskEgUnwY5l5TziwQzQmMz//45AfxohgItU6xab/F9UoiQdWp4h++rosDEZifOkQ==
X-Received: by 2002:a05:620a:2549:b0:7c5:56c0:a8 with SMTP id af79cd13be357-7c7a7659969mr135047485a.1.1744246774043;
        Wed, 09 Apr 2025 17:59:34 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:33 -0700 (PDT)
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
Subject: [PATCH 5/9] arm64: dts: imx8mn-beacon: Fix HDMI sound output
Date: Wed,  9 Apr 2025 19:58:59 -0500
Message-ID: <20250410005912.118732-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI bridge chip's sound card enumerates, but it does not generate
sound. This is because the sai5 node is missing the flag telling it
to set the mclk as output.

Fixes: 1d6880ceef43 ("arm64: dts: imx8mn-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
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

