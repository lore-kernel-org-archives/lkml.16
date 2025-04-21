Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C020E6ED
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223324; cv=none; b=ak9h3beypVm759YUO+7EM5kNHfD/sR2NI6VRiNI3gT+8+bcNvSkW3W7lOX/auLPvDWmS83s0xLN573XNZAMv1IAL387fx8LLkrf+dVd3aRY+02PRsS3eSTrRnfIsHGXqBHvTbFEp2oLdOz5mPcjBcnw3ffJmxSZyXzo3jjrGEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223324; c=relaxed/simple;
	bh=i2du4lVmWLuvWRHG2K/1O3Jp+NBJz3qmMwCQlIhmr/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/YaXVDCd6xWQlJOjMsJlMCgPlJF+fv2RLkH/jFbymkvBZCTiMgz8wTvscozk7lV2fTIhCHv5SnI6E1NHJVoacyKUUz2sBMQZP9De9/Kd39OUzhR853yx3rDKIcc56/Jxu7W1B26kSStnsIhJ/a98T0IWFL6hsazyxIGIKZqcho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hbZbFur3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hbZbFur3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-acb415dd8faso578070566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223321; x=1745828121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/d2kV+gEVUtasqwptmg8OTaBsbS+gUd48Di1IsK5O4=;
        b=hbZbFur3aeumj7IGonDKyMClJR7Ivm+5SczZCcXmzeJd4Pv7ERblxb4lJhZNBbWIvz
         qzbhm06KaTA989ueV26QbMUd2iLXBmiBNE8T2xzBxQ0Muh01RoLXNSOnwzTLQZ408tbj
         SWggTqYz2mXCgFOCzQC9CS0MQDavqzoQj/JJ53KVObAsMUdcUTHnVixaJjwLh+fKvf4n
         iN2h3ml4oeLG/d/GBuj6YEOMPFyP4LvTfIO/+V1E79ti2KubOZSoAGAOreiaQsltI4VM
         E11Uv7pAtdRYCEjkH3DLMMApZ9LCP2gGR2ICrRyTxRehLstQQ9/N3Xi3dh5bg0+SkpuJ
         aMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223321; x=1745828121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/d2kV+gEVUtasqwptmg8OTaBsbS+gUd48Di1IsK5O4=;
        b=UTF/kef1NT4S64pdnjWVDOE/b8h6hh8dQBjBo+Cv4XU9mSHHr2h3eMAyLEj2AsZC3v
         mi2bv79tZ99Pv2rsPbwJfsXWMr1ecGnMQbA1RWiufn20II3sqryHLpllQkTdWpN6Jxwh
         hSPTsT7BWlb421ETpkIPxURePAKYPolON69ZQlb8cfh+bdGIxoSwhcG08dp5ls5200Hv
         tHPTOBSU6kf/RqfzM47+snfbZlG2oLCTouCnNMiqrxGWorBBmFTXOi1kAGXnR7cgi/1t
         lPex2P5rs3L9qzKappuIp5gngONPdfqg8pPBpnJdgmOq5OpU69Blg9z0xW4RrQ0R1lL4
         t6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCxdGuAt/7XJ71CEERhKOdylNfFyyNohAf4JZWWv2t4YS9gd8E+O1OdA44IHn1bSt1PHneXjXHM2mDTrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgU89qWJWl4WJ7Q6ud51Gd6/Cz99ErVZwPdN/b2NlEW3MqLHwJ
	eEEUTxvaRghKpVWNe95n6MMJ/5GZCLHNITeyIhjRaXSekoGj+HrTclHA70YVJ8Q=
X-Gm-Gg: ASbGnctMYbcjE3tjT3iou5XUEEkS2M0tt1lnooCm6QZZSFHHL0U7PBXpAAnw85QwY1a
	DKEyxTyzhEOfXfBqQ/De1twvn3kUUE6F5BtQ1PWjH41a6QHo5UGFzJmlLCYDE5kN70W7UthdBgv
	N2RWeVh3AOojVKwieu1hAr02uosQxX3h/tJw4ldHZ0k6daFKZgwgs6Pm3IyfA/aXI9Dcbz3r0rg
	OaPS86O4Dx4JkaePACTiqsHpJCDaIAihXIh6hA5MUKdnPujF2kUSZM7k1iSXLgtdiJ9KENumOau
	aStD+gZB1qKZBav0F9okI3TgkpB0u1/3X32olZFMm5iMNA==
X-Google-Smtp-Source: AGHT+IH8dCmUUiIYwe6aBK5gZa6nt1qsDCGB6UIqEQKGd3SsYK3y8ADeVEtN0scYBIBP9If0pfXvNw==
X-Received: by 2002:a17:907:7247:b0:acb:1908:6873 with SMTP id a640c23a62f3a-acb74d65b95mr1067470266b.48.1745223320580;
        Mon, 21 Apr 2025 01:15:20 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ec502bcsm482604866b.66.2025.04.21.01.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:20 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:20 +0200
Subject: [PATCH 2/7] arm64: dts: ti: k3-am62: Define possible system states
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-2-6ced30aafddb@baylibre.com>
References: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
In-Reply-To: <20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1207; i=msp@baylibre.com;
 h=from:subject:message-id; bh=i2du4lVmWLuvWRHG2K/1O3Jp+NBJz3qmMwCQlIhmr/o=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf4W3NinxJ3hYPDvnfu9vz8oY3gccaxbM3H+3/N+7s
 i/aIpvlOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAinn6MDFvY/hkm3Cr68rTg
 7qM5hWZxf+aWTr/PKfZr2urecJVru/kYGVbv/qxS4Vk4h38S80nWHbNV52sx252bP2OX37wiiQm
 b33ECAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add the system states that are available on am62 SoCs.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index bfb55ca113239be4367a1cf8edf219187fafa8a0..acc8cbc7e57bc5712ada8b4b225e302ffc368e26 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -46,6 +46,28 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "Partial-IO";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "DeepSleep";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "MCU Only";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "Standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		bootph-all;
 		compatible = "simple-bus";

-- 
2.49.0

