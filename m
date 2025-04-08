Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5F2356AF;
	Tue,  8 Apr 2025 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126987; cv=none; b=VBEguY0mlDgdmNeYtRaoSAX7FsnA8WFL6jJzeQDMjOAwAEDuicHbeWldfs+x1JJVLVMVKoc2YIMX1QOiWRboW18++DsD2DaOLCL/PNFuYYF5qNPUm/FLjpKRNTDCnNGRtfofFQLc77giq2xbfgG2Mp+FCUha+9dnRYPdBiEx1ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126987; c=relaxed/simple;
	bh=JEyvW/eqJbmU/OCF5g6macBqJVG6TLDRzvb/ARI/GWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nFux9O1Eu0Am+1q4eTYGkm0WM0I+tbi7FsqquY1dV9gT2JVXQI3Vzaj8iTE+kAaYquWgmOvFiNh7XUqpcdY+B1z0/w4DgYcIxYAt2gHRrkpGjmfyG5lphyQYl1elatzvWLQ7wVlFBtQpjxymT5r3S52Ru9Rpg6n0htIYTZx82Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2OWBDJQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2OWBDJQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edb40f357so31762025e9.0;
        Tue, 08 Apr 2025 08:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126984; x=1744731784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtG6uWcIXl5lH7IBHhdVeY4nZALvB6ooRyYGRnxDiL0=;
        b=P2OWBDJQGEgRszdx8SjdqLaD+1FOPsTYBXnl7dwEiSlB5gNpFmKLtRdFVn0pC0/uJX
         p4CSCG3zoPzMIla4hgO/5RFIRfRGnsUCkBpolwCt75KJzCWDEcHx7gJVYHzdmA9hX3q+
         hyPgOL40cLHcOA0j1gkTCwhlIwfTWM5Ph27JjWENz91i/KE2kzLpC51r+IIfj4A8bjvt
         ZpuxEhPZJtQgMHqn16nYfdgfpmsMHNldZBlXjiHyeanaJchBpwDtWkcTw89CtlnRqc+E
         MIF+6lreNr9M1p3gBNqkqMz4uJoxtL+9uRuxur+zPK8qgRPKiAemlqRun+B0iwQbBmcb
         4yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126984; x=1744731784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtG6uWcIXl5lH7IBHhdVeY4nZALvB6ooRyYGRnxDiL0=;
        b=IXUCMbcDMKv6N1cgQvpfXdIjPV+dYYR/mlKoWHBcwjlAHWczX8+VdcL5RLJuw3uQqj
         VL3uA8A39gSdndynCN+gATv1Vgc39eFBMwH56heKos6xlpFliK88deWldJLUsDSzhnYY
         csTa2Rb1kLE6MfQccdofkyoCqlmoAplHCDR3cn/HVQNyqdiM2+CDAosgZ4Fp9bLPceIg
         nIGbK4cgEWCBA96E4Isrrc4/H/mtdrjEgE0S4YAF8/CcKukJDvi+DhBJMJrU8z9GL1+k
         lMU8AFvTmSnSyIM9j09OpjPCeRdVVboc6PXMBwBAQZOLUPgOZM9lTIQoBdwuKOHxvRrl
         IG8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmkLmnwkNMmbvYUwLiHjc0lMsErrd2JmbyOqekt/camhHeqpLqPiLjn6gm5u1JS8T+j7lQbnZUe6zZdEfs@vger.kernel.org, AJvYcCXwEZr98cX/I5fypDFwqx0zeeBVAdkr65WDrwsEAcWgLvwZoaPLdr1bifsXlizPeAzxuzAzTgP4PVHZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzoHwZL14TRj6ADohv74VB7U1pPorkitTSOjq6Trz9rXN+eavQ5
	vAoHt3tBt3VRfl2r1rPj3aOWOIXQJ2rVPN8HrHWXWn25TqKpOOcF
X-Gm-Gg: ASbGncuoVfTPtQaUmyq2GvQfhczeXi6ZsEetBYESaxPjtD5K12mzIiFDoNfJ5bF7BIP
	utQyoM0DDYP06qyvqylgZ/mc/IEq+UJkKATEoUcCfawO/pCAPIU6mhAMDNWzZ/fZDGJVHI9tHs8
	SWxu73uJIztfzC9HAaV5poof65s/6bZN0XA/mpRxmBgzS06fe9MRzAiL5Vnw0eewOIl8oRqorKG
	n20JJPTRATv7qaQTtSUjzKtrejjSH8zTcVu3OkOm1n+h6NHWEX/7Ncf+L9rXQDZ4Ra2t3GN8JuY
	V2UhUYe1FXHKFub2ivR8a1XZl7AJASWy2mKekjncJhf+OL9VRaSXzx6WDCuSugD5gZGJs/zixGC
	lfCeUjEo=
X-Google-Smtp-Source: AGHT+IH2pIjwLHd99OaOkEDJZzV3BxzBXMBL7iQPz/Uj8BamXLBLhgF6w37q7JaR9mEFlWaWbAKHNw==
X-Received: by 2002:a05:600c:3489:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43ee0617025mr127689295e9.7.1744126983675;
        Tue, 08 Apr 2025 08:43:03 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:43:03 -0700 (PDT)
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
Subject: [PATCH v5 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue,  8 Apr 2025 11:42:36 -0400
Message-Id: <20250408154236.49421-7-laurentiumihalcea111@gmail.com>
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

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ebbc99f9ceba..f0f0ff5edea6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5 IMX8MP_AIPSTZ_HIFI4_T_RW_PL>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

