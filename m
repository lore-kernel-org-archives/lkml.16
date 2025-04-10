Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD218F2DF;
	Thu, 10 Apr 2025 00:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246775; cv=none; b=CbbaRGhJEDb41xZmoY4Zz5RLQ4E+RVY6cm5lgSoE2XBAHEJmQQHB+dwabmjTtKfuulQ1aGvl8ziC8Q7Tiq4GkKhRaGod/7BNxeuZ1TlYYSd2QgxtYydWb8BCGUE8gIkYHFcd3/G4ik4M0rh8f7JAdIn+C5Ls+8WiYUXLLZm5vak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246775; c=relaxed/simple;
	bh=0zEIYJ6K6OsATit4gFPnVnv48BDsEo0hwTZWKBdqB00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etKUaQjzTMgtvbXsbr3riRlljs2B37+Bhii3ivCJTSp3utUdGQ+13NqIAT+gDEIjmJA1JBMjbRu1spBS8iNT/jjDZzQffPYBvuubynRDJuNgjHnxzeQAUUKiVr+Q9A8IXt6kicrq8ox+NapGuydMjde3I5YCZv7C1xebzzCbX64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgSaIqRB; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgSaIqRB"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5ba363f1aso41917085a.0;
        Wed, 09 Apr 2025 17:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246772; x=1744851572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+DEC/Wm/x+1UpGftu70dJQzMWdvcnYAg9wxuhWZrzI=;
        b=cgSaIqRBbhWh4YcaFCo7QAoo/a8edSMgv+48UCgpEEjvpAq7ewDjA+wM/GgoJ9nhSq
         TquErbfu0BowzAcaJ2PSjT9PVL0bug68JPRp5dl+1xtbkwxgmaXVwfqVQSPaEPEMo7tF
         MLw5tJmeRFuA7MtSI7m3/vz7w0Q57FLk3uU178N/3ZaRVOBZmaUOS2OJn7RSb9YkCCo4
         1eaNK+Han//f9TKTZhURfGWnx7SsM7cfBdNn5lNQAvCj5pfLBTRzmrqGlzKkWHP4MhT+
         3z3GxJAToPz5ty/0w6cRXueJZfO53F9iXv8KYxR6mherNyqiCzdWQ5UYCMWiMAQp3RJz
         rYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246772; x=1744851572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+DEC/Wm/x+1UpGftu70dJQzMWdvcnYAg9wxuhWZrzI=;
        b=F3UnB2gVNoxCpvD4pK7f3tXRN1KTMp9Skz0g344NoQnVwarg7E491TSXq6CktjsgAD
         gRr25boq8VToJWqKNLxkkQrBpp9Yk7ZdyZAdr0Jv8uIV2IatvqfZuedGUqm0+gxXvmln
         /EZoWCePN8DbRAxb6SLSLWNEDo7P1XyTWDXi92wn8JSWYwIyWLr/75+oWlVoX+vsMuTe
         jWgh16EiU3laxA+kqcR4zdjpgdTlq1yRP8EJS1elJ+tBEvKtyeMTsYo08ZYdFi6QwJxz
         BrkGAW1F1DttUG1FBBNVa9e6V6UOWCqUXezWfT2ZbznIDjPZdasZqZtyKMvsRIzuWhS+
         k0bw==
X-Forwarded-Encrypted: i=1; AJvYcCWm70DqDL0wx8lNi7+CZSa6iW319gSN4WPBO997KLmQTQ+Y1oMg5wWNwWuUlNk7pxtf1jKRStJgzgokyq3D@vger.kernel.org, AJvYcCX8vYLVWDPGDDBuMTg2ce3Ytmxkv8iRMEdLfLDXiIdqXN2rJDi9MMjCOTYwv91DBOnjnd38dp6SPdSa@vger.kernel.org
X-Gm-Message-State: AOJu0YydD3S/I9SRMGgFoTrxJY2s8hbX0hU6zsEVojWp1RSj93nVbpzB
	WBTmRXxDGHKbvoV9X9Cym5Lvf9hxdfXILEeKOl4EDpZEEZccG8VOeCdSFg==
X-Gm-Gg: ASbGncsSyvdxaW+i9/qqYkZeKWQf4OMxOEq5gxFWDqaIR2Rr2Lg+vmgNEzdUI25OK8+
	N0ivI1fKQ0zs80G6qQbNQBi3iQ1K/i0SL1/U45fvIDrxoltCgOAtHhwc+Ebb/PW34A80xf8AzSH
	vfu7vC2XS+T8e/yPhKBMJC1E33+uTzVh7Y9IQKhR1PIrPCkCIW0IaRY9thHSW2z85pjWTZgiqhR
	FtGo+XPdYKqyXc2ts9oyRyZYbpJ6pXkTDXxxhW7USNpoM5DCst8IJu3d8RNndtl7Jw2UHKIdCDI
	uEpKlOsR7oG73VkjBA0mW5Tnpd/32fAcStKXjBp4UPVsN8r0BPZhyYJ6oaaM1tSlpys5smcm9CC
	YlXlYYZx1FBxcJvI=
X-Google-Smtp-Source: AGHT+IFs5AeucnU/5qe1FBFgBALYzHV57xEbna05f87jL2wZRYoAR+pVlqKCzbG62FhrCzvkoYc8Xg==
X-Received: by 2002:a05:620a:1915:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7c7a76d154dmr129648385a.53.1744246771975;
        Wed, 09 Apr 2025 17:59:31 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:31 -0700 (PDT)
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
Subject: [PATCH 4/9] arm64: dts: imx8mm-beacon: Fix HDMI sound output
Date: Wed,  9 Apr 2025 19:58:58 -0500
Message-ID: <20250410005912.118732-4-aford173@gmail.com>
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

Fixes: 8ad7d14d99f3 ("arm64: dts: imx8mm-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
index 97ff1ddd6318..734a75198f06 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1

