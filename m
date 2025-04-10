Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6931D381A3;
	Thu, 10 Apr 2025 00:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246767; cv=none; b=kGMNREbK9gCDw7FRx7Fm4vy+84zMXRup1IsD54rtveDjVOUGFVeCBbinQhN9UkTWf6BP43RlnxwNeyzvzAdMH7MORPKmriXKKr0vVu1oXdhP3CIxd9JhXFx5KR4ANIh6GwZbQABTtX0s6yrsA1TCcvC7bkjET+gKht6e8yXNqbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246767; c=relaxed/simple;
	bh=n+nZ9BCxcvkMDMHsUavJJTtBrqhvcI6fc4cWqjw7f04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ggyzWgMReyDp0Grtkrdia2MVkQUcvSF8P7+PUKM9ybo33Pl2Bxpzci5UbwHRJI+GVQtAj4UBbNe7ybPbdLhZXnPbjUcZD+mDQVQh5mJSDv2pq65vsxfPhJ35oDLxxoZcaXkalLaBsmq0cdoFqzddYLMQEY0EuYNeZx+S2ff/0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHRIXfko; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHRIXfko"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c58974ed57so28476185a.2;
        Wed, 09 Apr 2025 17:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246765; x=1744851565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+kyPVB1rxXM0m//xddyhd4EsUDRcFjA3X1gP8LtL3Ps=;
        b=cHRIXfko5Hc+5DVev2tClJ/sx8QOXUOGlAnDLgV/4J+5mH4CB2ZalEwbioqqHF7bvM
         LqONxvIkRBHvUpVSh/PK6yLxgqUx39+LV0dPV1LqN4QC6lpBJs+EyrCtk9EWCYuj2b4k
         F9agNdSFmziL+BV69UhO8it9J+P+ub+cI1qENJgRhvHBcdNwpkuOTMNbvlazC0f8msxT
         N01WV44qBF29CGC2RtzhEO45cwDUZPuISpNqzQZc68WiCSVMk6zBSqQOySFEsnc6T2pW
         IFubjvNSyvzVjL+ZHQFtXfWzqg988JANSQOkTIFJM16aQuWyin1LMHfdW+sbSTAQOi3b
         nRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246765; x=1744851565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+kyPVB1rxXM0m//xddyhd4EsUDRcFjA3X1gP8LtL3Ps=;
        b=pjdsxi7IN0yXQ5t8PuWiW/sAb9W43iAbaDIW+xFqFMus4pJ3yuhTFlvBlvWVa0jKKe
         8OQMiu8vFxHDLVf6shvZ6N8oPzZexoc1NFwxEuCF70bEr+hxmOh3aDa8C5vHzj2dIyaG
         Em34RxBx00cbgD/4oTKV9sKSd0pSSF1eUdTr/HHdGw9XyM28ipNYWiVtljcLKyBYqyTR
         7A0CdRUxpKJ+TcSGsaOIulZL4mr9oSjn/JsMEI00HXThJd9mjdWpFu1pVftdZHdvIlpJ
         c2raNE1n60fbPYivSeVYD/YmUS1CGcreWwPMkAmy0snvgkOWKxRJIOpS4oMmxWvPr/0r
         EBFg==
X-Forwarded-Encrypted: i=1; AJvYcCXNFUYKGLHpbRJ6Isr9WelO2aSLFSvThSHU347z5+32OyPAOfyt+hbXmGL7zTMtGqcqSxoKaTF8WnkO@vger.kernel.org, AJvYcCXu5rg/UW2zqfPgDVcbgx61NLpBeYmL7TB0Sf3sBTjCyFYjWEpyJxE4pF1yL1rV3MiXYpsNozk3BpYZdTNS@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj2UyqS4qOI4FrH61Z5EvtNx6+QRDWZn1Nw7ExvgPxvg4VPc1m
	UaLBR7WSRlu/DdHAMDy1QSEPeLVphT8osT2Vqz2Qt51hhtDqvIZV
X-Gm-Gg: ASbGncuNrrtOzpvzzYimokHyKkiMxR5Jh9E0sHn47hQGI3d6+JYLGcekJdyQ8CxHH2P
	8A1Am37ypilU6+lQqI+TqawTuufLq5j32HlzuJ98qSwrS4z6mCw4480grhseETIz05U2+qrmLx0
	h5DjPKTCwoIHryniP6lKDhbMJymlhrLrTnD7pW0uhv3X///vo/1GhkkaoZ7P1RMC34X4hGjZa/o
	t6FVLgDT+G6Xgji2xxExAqPfYG+T+ooMLfCSMsYwlQOS0UTUauKxB/AUe4Fu+D6BVo1ryHBuPqh
	6KsHcEK9VJQ/3J1mbVa0RBNd0qLQIOn120TqoL3TDj8YAnmD+6Fy3VbLYPI/ViPZSliQWg9Wh6w
	jH4hHsh45kf2R6ic=
X-Google-Smtp-Source: AGHT+IE/6x1aCGCmhdtAA2IZ9Tq3qv3Y1gkoo0rM9bXUYtA375cdw94zz6Z3IyZoPnI/FmVsMxW2XA==
X-Received: by 2002:a05:620a:4550:b0:7c7:a543:d878 with SMTP id af79cd13be357-7c7a7654195mr115046085a.12.1744246765254;
        Wed, 09 Apr 2025 17:59:25 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:24 -0700 (PDT)
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
Subject: [PATCH 1/9] arm64: dts: imx8mm-beacon: Fix RTC capacitive load
Date: Wed,  9 Apr 2025 19:58:55 -0500
Message-ID: <20250410005912.118732-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although not noticeable when used every day, the RTC appears to drift
when left to sit over time.  This is due to the capacitive load
default being 7000, when the hardware is really using 12500.
Fixing this setting to fix the drift.

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 62ed64663f49..9ba0cb89fa24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -233,6 +233,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1

