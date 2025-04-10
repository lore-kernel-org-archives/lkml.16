Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A137E13B298;
	Thu, 10 Apr 2025 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246770; cv=none; b=Omh8d7L58CF5UYbJ1eNvHD3EKqy1KaZ2M8maViMIVOVeHuz/E42vVyF2I96sBAUsRb+HwNE3zKyr9Riiyd30kLK4N/tiwO1+oDU2sRgD8WQbVwtGKLpr4hS+D+PjGhNnNpNpqzwnm82GRjMoZIunNYfJTVfIO9BTal3slkMGARc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246770; c=relaxed/simple;
	bh=LIsVjG80noSF0/+UYFzuTPI2eRaKHkJYrTzw0CaDVPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LB8fiOZcmQilLlXLO51OCRTTpfHv2A5z34QeRwKkJTzXpILfSi8sEUD3GUB7PPJLGFkZiUpSNEVmgot4cBBW81qLHcrrJP1dBTTCP0ydmj71jCfZBt6rjWgvW1ZHQBHLGtapCRIEus8IJndE0GETtYRVwyxnjUp4bsTjlzw344U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eF3IkyO0; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eF3IkyO0"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c597760323so28644185a.3;
        Wed, 09 Apr 2025 17:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246767; x=1744851567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeG5k7eeG5nrvh8Eq49sU4B3j2ymx/30X9ZLGBFGRWk=;
        b=eF3IkyO0eh58JtLrErmxSYafrTkJVAIY7o1RhLz6k1eBRmu5dlh/bMWIT25RhEEcHg
         b2//SPdnIPczyKw56h59PUSctdmLOEZ+7g2Ve9KBrGJK0lXFP3DW5sg2m3NIQVFQEBqY
         r0G9PqoCle4bwlRG56p9i4q9qB3cDfmtlHAyn3tdRCGuE6kBeCM02lkBgTuYwGb5sD/O
         bcRYUmB+/NSxEmCfd143ocvkAx6jnALOJ75xiReOFTS0Wb03h9lGzpOwcv6MJdO+uq0h
         ThF2D1Yyzcmv5OSWSJSHVzhEmpb/RpwzaSQ4jzjS+YBjgICZ4EvUKldJ3Lxl1/pJc3Tu
         BTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246767; x=1744851567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeG5k7eeG5nrvh8Eq49sU4B3j2ymx/30X9ZLGBFGRWk=;
        b=AksJRerNNv/vb4RrMdlQoSMx1+I96O7ZnI2nI0uBpizSZUyqtdGwaF8bFqjZEctjBP
         gDEYGfpuppl1i0e2KcmBfOc7hHxDjb4RWthn/KJsW+cyIAYNZIOYsU1m8qPcbEA/++KI
         9+FrTmVv9eWmgRdi1OqEPiOPvb1ed1KdCZsjpeuoj3+iucR/cwfiy566RhMqxiApAY/V
         nddg75wZ4zy+y6sBQV6fOOfs+gJIYogOSuZ/fTfXRDPRriNaenqKrfLirF6NCd6TSFwj
         O0gdUkfSovbR1I2aO3Dc3duDtUJi6yJOUs+D/AwaZnYYcHa5h0eifxgWKm4+is+Tw/Mb
         kVPg==
X-Forwarded-Encrypted: i=1; AJvYcCUad7tnfqUw1oCTqkLLtjm1N//jHV5bXgQVC2rNgZsT2h0HfeRG+nyobNAtmJ8eDjvu7nkmnqiF8Vjy@vger.kernel.org, AJvYcCUbny2a18W40rpKK35V0YXKBwmFWQ4yGLunaDp3EkgUl4PwCy11uNagcwYdxJ+k8XSPIOIv3ATO9CDTez/D@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5PsEIN9p18hOVwVrrbcRbn8vT+AC0fnMI047hxdqHOA/KenUk
	LN4EwJwx7dvY8aINNDxaQF6/lhmwXtRwoZP9+KDZ+yX+gZ8cmCam
X-Gm-Gg: ASbGnctW+gtAuDInD+lJ+qOtzT/LmahKwHiFpOffJBsxFdciego2jilpls4wmeCNbsg
	m19ax9QE8+Eue2Ct/r3+XaYPHGqSvC0GKDjEWKrE72pBvIwdJsiQVAsygm1luvWBi7HOOKoWfhj
	B8UdYevtGgavGXGzCv8BLW7CN4t0/A6BmBTMPkFIt+QOHpmt6v5kobeD3H2cNX3tEwMjtihHXxG
	++CpllA79WjK4YfNTdOJf5PpOgdXJyuK0TEL8kgbMbHbv5O83LngdXSxGuY2NxUX7JZMtbPXLUA
	SJMmVycUCV7mnaNFHXfu+FxWTC596q6gqzOguhq8+Brdvq1P+LcI+WWxhsvI5BsCrTkABLEGnM+
	a4hZwd6EPRxQF6B8=
X-Google-Smtp-Source: AGHT+IHDQDEm510Zep6ehXFGr0QIvBVvOcXxaZ4hhWGvwNKkFEXwQS8kRk2/D5K9n/qyNnT7NjYeFQ==
X-Received: by 2002:a05:620a:468a:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7c7a76bfdebmr138512985a.43.1744246767488;
        Wed, 09 Apr 2025 17:59:27 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:27 -0700 (PDT)
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
Subject: [PATCH 2/9] arm64: dts: imx8mn-beacon: Fix RTC capacitive load
Date: Wed,  9 Apr 2025 19:58:56 -0500
Message-ID: <20250410005912.118732-2-aford173@gmail.com>
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

Although not noticeable when used every day, the RTC appears to drift
when left to sit over time.  This is due to the capacitive load
default being 7000, when the hardware is really using 12500.
Fixing this setting to fix the drift.

Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 2a64115eebf1..bb11590473a4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -242,6 +242,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1

