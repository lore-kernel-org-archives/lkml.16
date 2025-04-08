Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFAC23534E;
	Tue,  8 Apr 2025 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126983; cv=none; b=CJtX9vjqs/4mgl6oDnFnwJAeg6mx04ffhfdMtHmmp4RTLlHoE081KKrBAKHhsR6t9Hua/4+xksSL88ntZnl9o5sDyd+flNRH9ebCpBH3fa+/wlA5wKa+d7JdMz7Dui+l3hSHdWzAhztLh/AHuUjKA3nD0LmBLfP+hjMTMB9AOgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126983; c=relaxed/simple;
	bh=i/623J9RhzwazO09b9AuVaXf4VhtohpFAm02gcyGGEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hvSqw8OJOBdNJ58crgU2furexkBahj4Qx8+MGhhV60EdaoANa1tSuQ9WicBdo73LYUPioWWjjqymupX0DRdnUPUtnUGNx4/Fv0325TQQ89BfxCjMLxU2bzihPu/JJEY3tjz+NK/LzCIYUxziNIE24bgysAffLLEgESFxR3mZjlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqsZngOK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqsZngOK"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so27324335e9.0;
        Tue, 08 Apr 2025 08:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126980; x=1744731780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=RqsZngOK5b75GrrrOUoeOFGBEyEUDebqGO/ybOKRabCfggcVK44+jjQY4ZUbMJFGkk
         X65jQvjuTrUt7XBDW6kLjM1ovcMRwHgyXhce3lslVIWi1OVdDsnSi86dG/Sq1C/0zm1l
         X+VReGx1KHB2sV82a2ojpf9DN9YBNxOiviUX+dZFm/Pj7Tbfus8ZcASKg2GmHwTanbau
         QxUXaOxwXLcGsWLAtkpPr1TY6XdeYhj5ytNe3eN8h4GZN6vZw20QPVkvJ+GHDuJvPS14
         0NH1d4ahIROcSzgOYfotb9sNeveAmBgy4qw9sLP40K4VvA13lMWnu/uEXPGy2CKxotKd
         3hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126980; x=1744731780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=E4O/dy1sCapzyoX9qcwmPep4BOiD44tk28ps5mVwARH6CexxB/kbHwcK4x5rdgdSCV
         d3QcBlR29dJao1znSzZj6/rFVPUUgM+m9dY1W19jAGEGKU8mL/4jQICtkviTF5Szolet
         GNl00vHiJHWxKiY5/MsNTg6hTK/kAXcL80nyaZ1/8oLl90QFJ9DoaUf+UB6ALrAFX7m7
         ZgFMlWt49KgQhh9FjH/DNc/jhyMS3PikhIEjacU51WrY62qmYyqVdAeVNUlIMNhoSzx9
         zgsLTsyuUK0pBklfcMyaJv63ZnTwCYyz5kz9JNamTPUFy2HNlNayVnKO+Ag/T9OCnrNb
         JMOw==
X-Forwarded-Encrypted: i=1; AJvYcCUOQGdM+akzoFJ5mGVBZwdgiO0NHfT1uuEWv9pqu8laGyHYA0IhG4mI7Jxmr9PbabAP4eyjOIGPekSzWFt3@vger.kernel.org, AJvYcCWPyjSvPtwiP5ZUSNpXhwvLpdWXs+0eOiMVViOXt9PczMXEeYa+yh90CKytUfd4kTsdOeGtE2W/A1B+@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9E0M35ZGlSuJ/lioaccgPeKmvoc+O+Ww/tciBgLRSVDMk5sdj
	cntn7Stfur73iYN2Dx9HBIyZc1zJHKOJ43HZq93pYD4xiMMzQ6fW
X-Gm-Gg: ASbGncs0sqjDvNO0FBqBU80XmmW30NW5IaAYE9TDFLOGMNnslqr4VgBfF8y0IoAAb14
	XzEqMlpsxFPQTxnKC6MwHGWdx5H8TOQDxcBOwmAX1uPhufcZt5OUYuCFghWCI6MeGX5YIu4sjGL
	5PrL0MGVJ6xKgFokD0EQCFVQn3/FANIxd6hrM+T7cO2oG9M3or2z2xj8PnQnz+RxUa4q6Rv6I2N
	7fgmE0s5MGPqghaOacyr6Sdwf7mnbz3zeHkiGYUGmiG6ymhV8DEH8cOx3y9QbQI4WUQ7ID8j4S+
	kDVo1D1zA/waeAc19+hQGAExMWD3Ny8KOD9/fH8zbcWSfPcuCvRrpsPtEdsAQwOM4GIyATqAXk2
	mzcYUK7w=
X-Google-Smtp-Source: AGHT+IGK0ruPX4WysFV+SZLwQ89r5QOiFeAdeHiZNygg9R+OkQB5zmqWtRPqwT+0SEhCLeJWSD9ebQ==
X-Received: by 2002:a05:600c:8411:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43ecf9fe1f0mr141672885e9.20.1744126979744;
        Tue, 08 Apr 2025 08:42:59 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:59 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue,  8 Apr 2025 11:42:34 -0400
Message-Id: <20250408154236.49421-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..aa7940c65f2d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,12 +1399,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.34.1

