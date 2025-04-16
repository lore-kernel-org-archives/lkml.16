Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A121DDC08;
	Wed, 16 Apr 2025 01:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765311; cv=none; b=SXdNwCJ/1sP2WANWhxijhhZSdS5fkN/xwP9Ju0no3kbFqeN9ozd1mxLXfdmf1xBh1vRONvHGulDr3/UcrHIEP09XQQN8YMXqxCNA67gufd5IfaT3Vv2y98Z1MZPjPczAs1W76V8t8Z2V/8vv7pR8y3iU2+mRyrgLZo9z8RfAiAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765311; c=relaxed/simple;
	bh=A51fK0qKYzvAQmZ34qB4lNAJwPT7AcHFvksrNIey/A4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NomAP/3tbXdP25q/o8mZAPENlflWBBmQvoAXyZklzJBKqWuXuUlxzZLC+54LkgbdcoyvL+YZeWgIGSvTaf5wUVXzhHLO41hQwLpmaRscYFV3Fv8KrkoSVIguMs3BoM4NRnCnNUFShUQZU5gfLpgSMuDf1s/jm5I2XViPy6XqPZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csVQ8u2h; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csVQ8u2h"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-476ae781d21so61238121cf.3;
        Tue, 15 Apr 2025 18:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765309; x=1745370109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8o3x+d+q5C2//4/0cnQtZkZuYSwuKh+AphADdTpHFDE=;
        b=csVQ8u2hBHSq1ud4NqXAh3S8Qd3469WRz7wog4FCm3jfnbig0tXwhE80SQAOO4bBfq
         m5O6e0M5+9LRNaTvEHEnT7u8WsdT92w+sWnnY6ZNPSegBVTq1ymD4dM/wAb5BJXqpkXb
         2eau3oOqPs3f+etkWQWMDlz0x2cL1/3B98QWgD1En5O3L0jHsssolqW5KmoXoznWBEyh
         OCFPvvuY5yGwuqis1zt9zd9ergWMVPiWMEL6Iw+3/gqjmJShv1oWJCM503lr/7/bbzJ/
         OV/hLbrjbYAyut/t3X33bfs4bueafvSlAGuVu3R76/bAC+IfKYXXb3+uD0Dg2mQ1pRF1
         +oBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765309; x=1745370109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8o3x+d+q5C2//4/0cnQtZkZuYSwuKh+AphADdTpHFDE=;
        b=VaY+qjBMCXrtIgOEQjdWY81fTFozSL408Owo46PoAP8f2X+onKsDJOX1rYPOiMQaeo
         3LL8iq69MlVIeWdosOFvjNehCRrbxBSkn4y+xaz3VjObkm7M3J8f3QMX47YptR2Y2kEk
         On6mklpZCQhRDLHbpfyz0NCxBE/oq8Bt/Hxs59Ou0NScViSjIeKBy1kK00d5BvO43pJX
         auTllp7xk5EpxnfHHqbeT/7iGQdqyxBrBBiAP3WlOUDP7qJDxIY85cLQKnpPZwhd3gbC
         CTQfnESCcr9cZHw4a0CpfqColINbH5rgsqOLwcQNNmwPHLqry06cRO/K3A3IpD+niGFy
         V1hA==
X-Forwarded-Encrypted: i=1; AJvYcCVR7XwIhySbP0jYWw/zfPg2N8lxbabbWmi3iRHi0xYEQ/FEYFylJMdpNnTVutg71faOu73Jqv3SQZj3@vger.kernel.org, AJvYcCWwrfMH2hERoAGrgdhHaTZh7ynaF18r73YhT7/KMo5+0OJSkyCsLky78W/ywRBD16Koe0LSvhHiL3h2K3Zi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy58pepgsKvvjOwcr+p6B87Fgc3CJYMCrNJpCEdKVoc3wrlyv61
	T2z8xTOVz93WOkNUyfHzgO5m14aYBuc9ACIMZle7fSpIo9MDSBcl
X-Gm-Gg: ASbGnctsziPYarJszRBK/mcsiRZVOu5kOrVA8ayg4WavDHHBci9dM1DEVe3ZYpigN/T
	xQN20dTg58iYmAyjJ3NEw8FbW5ygZQUTkeP8RJi9pA6U1OximXaslS+7Ye2RGbwjCHkBeSWw4jo
	5pFf9b8jgL53bT2QFcLye551VQM84p8nkItD0KKse3369yDvgkQXIOP1E+aKvG9IebAaE8ABwe+
	9wD6focPMfJDSMrnjjR2QSiM1rpUMMMTwxbs2+mT4dtsI+M106kp1Hz4okEPEQUEhDEsHf+q3Ke
	EGKmmiSA2hmJS/yhV2+bzo2LCCjhTCpAAsfM3vXiuS5W7CB6jom2jQ1OhG/F6H2Z/xWTiwjaaXV
	w+uVrP+9uNR6TtLE=
X-Google-Smtp-Source: AGHT+IH0AKG+p7mqeho6hFnJiQGk62QSOmDLzjL41pBbauOWKXT1WSK6KQ7uPvUqX7jO/stSSrNqEQ==
X-Received: by 2002:ac8:5f8d:0:b0:476:8c58:4f69 with SMTP id d75a77b69052e-47ad39fe5e3mr24329581cf.1.1744765308786;
        Tue, 15 Apr 2025 18:01:48 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:48 -0700 (PDT)
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
Subject: [PATCH V2 02/10] arm64: dts: imx8mn-beacon: Fix RTC capacitive load
Date: Tue, 15 Apr 2025 20:01:28 -0500
Message-ID: <20250416010141.1785841-2-aford173@gmail.com>
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

Although not noticeable when used every day, the RTC appears to drift when
left to sit over time.  This is due to the capacitive load not being
properly set. Fix RTC drift by correcting the capacitive load setting
from 7000 to 12500, which matches the actual hardware configuration.

Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

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

