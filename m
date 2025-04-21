Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81259213E6A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223325; cv=none; b=UaQ0039zUZZPNCcf3BGkxFISnwZvGGIKwXH8Cuac0Q79uuXRW388TdjhFRkt0VZzGtk0iIacfEjrJti/n55vab5hx0SrPaIou9B0YOxipuoVZGYuXUg6qRA8W6tgGwTmRaEZH50cFfj7AHys7hE+cUJSmFJvBlZwc+mBdlWxblc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223325; c=relaxed/simple;
	bh=DDUKqJYdItgCK7if8keg+0cOFuGTse8BArfuVENTgzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWGPEH60tBg3KeGFqn8UAUyIlTpCyuideE8VZ1s8YUgK7tjcL04cnyB4hagCAEeov2h0El6i8R5PwaC7LgT5Vf9x7wK+DTFSnt0iJauRa15IIEQOypSMxev3Gt/cN6YQQXru2PIhZeWl+HDfuG+ltw8/BchCpwpKaRhXLkCSDCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vxEahM+a; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vxEahM+a"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac25d2b2354so549019866b.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223322; x=1745828122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7K/O9EvDZo94mWF4xlSzvWet1rbGz7p+KBumP0GD4DM=;
        b=vxEahM+aGn0ZSdOuWXWh/xQ8K91SSioaLIg6E7wSEloeS3OVW/W8FH/ApOvQdIYSRJ
         dL4KavCmTvmy2CBJ5nG9cjmYf5taB3JipVIMy/Tn3lQ3PhgvQANLM5koRgtSC2TGHOJt
         qkGA0Q3W4i4IlXU3Ad5K8HSxWnrkY5TTKks4B3yOgDnn30UHhkCxrhHGj1uavF3n2U9F
         eFIuhbjP/UVIFayi66xm3LPY+3mgLjjObBdpuaemq9Kj7TRRkgyZlukGHupkFE5va+nK
         zqN7W10sAqb72rm9dupOUwJc2Qww/02AVQk0sBbLIBHTtrGc1p+ISfZlhztJNk2cc0DO
         30CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223322; x=1745828122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7K/O9EvDZo94mWF4xlSzvWet1rbGz7p+KBumP0GD4DM=;
        b=m4eErdzAfteMERh365Rv91SNENqZ4EYYcqJRJRIJxX8WJhC7nHCJOeZkd16ojq5eGd
         fNepwMCPUPQ4gle6SA3mnqvxLh6PKzCJQUnwBuejhcenHgBPfsYakOPTMNjYgc+1GjLK
         9FEMWIB1pG8LbelmVRnEgVjSwB0c1BBKb9gQ1MJdnaSOOa+z8u8tgGA+idXZdetUZ9fv
         Lv7TTmDDIZumEzHkF5B+ehMgqALR2ZV9jdCJH5XPAFujFkR5GuttRjmXYM/RJNARnyLE
         RlFTd3s+JW1bEUB3GUZ4CRanchUyovvJEy3wYmqRY62wHn+CnuQdsQ1J+shxBmOScoTy
         O//A==
X-Forwarded-Encrypted: i=1; AJvYcCWNVb2t7L6Hjaa/topZU+KKTQXbgBsNUIy/DEyAirmppw9AxjHIBqzyf8712xN6VoGnp8W0iyJNgTsl+hg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCGkB0c9W61GuG6xpHAwZxaE4TbF+a2bDW4r/xMUP+Q1c2HMW1
	W0bEkdlsmMBrFUTExHQghgUtjfPsXvzbqDLD5ymQgYWvajOuyK12JgDAaoXiwlU=
X-Gm-Gg: ASbGncukzFwMz4xCXp/SxcWP2LbhQ50f+WOvvAyaWfopyQYsSqz8rmqTBsebrLkBotV
	JRvIE5g1iykLNb3Y7YwTUNfyh6KH8erp4vVVzq7GHOsuS9q579Sqwe1i5AX1Kr8f009gMJNVO0C
	CX4R91CWbcVAN9dXHyrUzdDFgdV+2ZsxwCV+ZzTrhxWbSkElZJL5mgGX0TFcYiB70ixae/QDdPy
	QUgNV183S80DCy6a1wrcU4VeAdePouQt+d3rsXwkPl6DwrQtMz0j3znjH53xlVl8faBswv30y4D
	MIs4tZI4RFb99C/da/eih/lYZd3NGh5kRDY=
X-Google-Smtp-Source: AGHT+IGavSHBUnEKp2SLZSsMc+Z3PxkFoYizZmoJvGkx3hfKMDgRJptjKyk6zn1z6gEYNGmCH9jGKg==
X-Received: by 2002:a17:907:9409:b0:ac4:4d2:3867 with SMTP id a640c23a62f3a-acb74b0b022mr848922466b.23.1745223321733;
        Mon, 21 Apr 2025 01:15:21 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ef45784sm468996766b.129.2025.04.21.01.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:15:21 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:14:21 +0200
Subject: [PATCH 3/7] arm64: dts: ti: k3-am62a: Define possible system
 states
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-dt-partialio-v6-15-v1-3-6ced30aafddb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=msp@baylibre.com;
 h=from:subject:message-id; bh=DDUKqJYdItgCK7if8keg+0cOFuGTse8BArfuVENTgzk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzWf2Wrvy4y+qVzV/X5pdptazMD+byvKPtYSvrF7F9tc
 OJYlv6cjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIknsM/2Mv7iuV5tsus4tx
 W+1D2YwZG3Yqfe/6d4V3TqTHkoI3ThUM/6vnOL4qqr7XGGg+f+WdS08tuCc/3fLtmYuRhbHVm5U
 P/nACAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add the system states that are available on am62a SoCs.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a.dtsi b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
index 4d79b3e9486af18b8813a8980a57937669ff6095..0b58ade9561a3076fc89f3b85dbafa969285162f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a.dtsi
@@ -46,6 +46,33 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "Partial-IO";
+		};
+
+		system_io_ddr: system-io-ddr {
+			compatible = "system-idle-state";
+			idle-state-name = "IO+DDR";
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
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.49.0

