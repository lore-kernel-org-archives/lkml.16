Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780D413A244;
	Sun,  6 Jul 2025 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751770645; cv=none; b=GPGPOZJOZTV9OKgQHLvyzj9XjrPSMzVMTri/P5csoryIPYfyroz/rqy9AhfI1kQ11iLeLv0ujkxQOG1Aenjv4ETNcUZx+UlcAAdXrSvEM3+5YNisHRp0Sue82eEYdgMgTH2jxbnMLVAA3sfvNTlGdYzUL8QLG7phUXuwsAMrh3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751770645; c=relaxed/simple;
	bh=qYVF5nrefqk8ZKCPwYrgT19os3rsqUvuedsH6yMaRYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tz714Kzj/3FMOez+1Xb+HCr1cRs9zWCGC2/NZv7lECIr5WUud25YTfElsA236FOtpHivZXZLxgUlvcabTZSrUQVTEhVifLvfh+Yyf8b9uj98Va5WjnR65wRwaj3HIYRongFdQ+C70ntI0KrfB5GrSZrfygXpwl0PjjuqblQuTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QozUmmgE; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QozUmmgE"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55516abe02cso2123792e87.0;
        Sat, 05 Jul 2025 19:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751770641; x=1752375441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=QozUmmgE1HXf+u3rrQv87wCP7j6kBgiIC4CmZ1NQtFyS4ZDw1In5WapnaSpKwO1WZv
         tpGD9LtmDYKBGzLZgmKLTDp4nSdOVqKo6/p0WwFQrbbC3jRsCg4WGDHX9NdypgMHvWCe
         iH/LidDw1KowsjH/5fpwJbvDXWy7mirWskkBPOwIyRO4HMRIg1FCVCu+nhmHpWbknch9
         OiF8fKNo/toOmw1sCUwsQxHlhkz6OD0QosvrpYCn9hQ+HSs+v0FitoUpoY0VBR8vKXmT
         ALNZdsOPMsLrAYJWRZZjYd7hYkphC3oSbrapfx2nwsPP9KdEIMWsvMRle9jkqkwoqKUZ
         FSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751770641; x=1752375441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=//d0bJWkNr8qRs213bW7gb4xunennUE1PJsDFQia6Eo=;
        b=RMnOK731AumKrhbgwP0L6zWjwUNgH2KJn65yJuUTEDjTirxLrxKUy2sJX64D+EB+8B
         i12TU1wf2g77ABTTQYgfxGYC1CLS2e8KvPoXvKwjFLbWc7hSy9Ftk7Wmhl7SAaTRstYW
         PYXT7nAXmUUtoAhsJNw6q19jlOLqE/U5w8dprJhU9uRL0zVMFuu0ZA04BA9a4VZYoGiR
         f/n8FmmxgVRMa1NvDh6iiOupRdw01jBB49cS2852PdhVWSOEBnqd79GyEFzXjNuyQAd0
         hh6H9XBCD7c9mNjVlh2yiYjQ3PBnZ/axRMXG4XAAYANlI2N/C7CXEluArgpDTtIbAUZ0
         CaYw==
X-Forwarded-Encrypted: i=1; AJvYcCUuwESjF9iXpPyLQ1p9FGcha+/liB748shayP7JbekLIytdK95dLpo/SoDBndO1e3you9cL4yN8J/IIn2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6OR4ZVVNSy5oy1LQDiojw97d1vnldmfCT8UUIAvMVyNRMdGdk
	oHwhj3MsEVfAMfGxESfjvG+3Gvl5xOy7dzI4qHMc0gSbYoos1jBYvnLA
X-Gm-Gg: ASbGncuX93A3wno4sUZ5gKfPlfcttS4CoFr3znmWesIa90NTXqDHAjabQtJ2ulFLw6h
	0DP7LmiWdpHxz+OM4IJvwX9AQyua8pmRNM+jXm7ldmq0v6r06dfIAhJDtBwrQah/qecqSV4x3Yb
	LEH1I9Adca/2VXRapCeYvilfsl1XY21McAUUOW75tdOhUJuDpSchnsBWFEajUH4yBYeKyctoCtr
	IoW+91tub5UE9Fm4z90YNCmKN3D38mvoga4v4r3AjTjf9I9IslAkpgFKreFQxX04IfJwC34RCBU
	L/MifRGzXI+JDYqXFy3l4kIHTxbAfBpHNRXJVO5nidK7ZAkD0dOzEBfXPDrTwNUMluX0WLc=
X-Google-Smtp-Source: AGHT+IFfsqkWZBN4PIBE9st3rtlbs4llavPau1ElbWPXJmYwNfgPZvdeoU9nsBN2bcLjLflD0uCNpA==
X-Received: by 2002:a05:6512:1586:b0:550:e50a:bf49 with SMTP id 2adb3069b0e04-55643823068mr2804124e87.19.1751770641421;
        Sat, 05 Jul 2025 19:57:21 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7b4fsm788573e87.198.2025.07.05.19.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 19:57:21 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: allwinner: a523: add Mali GPU node
Date: Sun,  6 Jul 2025 10:56:22 +0800
Message-ID: <20250706025625.2707073-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706025625.2707073-1-iuncuim@gmail.com>
References: <20250706025625.2707073-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The Allwinner A523 SoC features the Mali-G57 MC1 GPU, which belongs
to the Mali Valhall (v9) family. There is a power domain specifically
for this GPU that needs to be enabled to utilize it.

To enable in a specific device, we need to enable the gpu node and specify
the “mali-supply” regulator additionally in the device tree.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index dd6fa22f9..d3528d498 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -108,6 +108,21 @@ soc {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		gpu: gpu@1800000 {
+			compatible = "allwinner,sun55i-a523-mali",
+				     "arm,mali-valhall-jm";
+			reg = <0x1800000 0x10000>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&ccu CLK_GPU>, <&ccu CLK_BUS_GPU>;
+			clock-names = "core", "bus";
+			power-domains = <&pck600 PD_GPU>;
+			resets = <&ccu RST_BUS_GPU>;
+			status = "disabled";
+		};
+
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-- 
2.50.0

