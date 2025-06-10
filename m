Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8227023FC7D;
	Tue, 10 Jun 2025 16:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571352; cv=none; b=sSQpiUgfHCXkVAjsqTpTi+EbM59T1SZRteIlbfnrW0kXFnNIn7uufhfAScuwtzLuQGeHtsgyz6IjPrwMKMi0BM9DOcJBzQEK18j40iCJZ0Nyn5obsCxCpmEvG7MvVC8AMPwcx9hhARNFjEUEgtR5at1wIX0DJXhL79VvX0e5AM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571352; c=relaxed/simple;
	bh=h8BZXYkNYf3ReqiG0t3tej1HP8e30uMrodT+erXtdEg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ffIRtHnjVM/aATiqc4Cyc+ogP2SHvZ7O+0TBN7ZOf2gG5/gp8ZjgNMJ8gsce/38eaBzNl0WrAZ8M1VKjmMTiOJkrQIQePWdG1ARmDpQN3jb21Aaw5ZLxzQOZrr3OtOq55ZxyJ+UPxCTd0LBc/hPAd+FQLgBQbLSEyGlXXBXfAcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaGKbOjJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaGKbOjJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so46969745e9.3;
        Tue, 10 Jun 2025 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571349; x=1750176149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ApHhApDe322hB30Fse7w9VFo+yIfmGbQ5emSiYeKNY=;
        b=YaGKbOjJeu02SMD1DSwjrWpubhrEMM94USC+ybyaNKrTyczhAeIgHaQPzds4Usisv5
         g1JrIT/lpl5TgOJvj7m7u3BO2zqJv3ZwtLwGUzGUcSLkB2PpnzVuqZfISH7FTEEHUou8
         J1dTN6b2AzsNnINtkoW1Mw+IbanHSpMxb44QOS9dWcNdnBpIEsJlge9T2sBl8RGF8nos
         hIK35M5sJPHEQz06vHWlb3ohMWaJlO9eYI6l7uK6I6i8d0Kjn9NX8iD5lVhYOSTCq6iL
         v+yc3utNu14xKas6ejPe02/2d2K8V3hiOijdHBkkr6TcIh02ptNdqo0rENdX6xfpGm4l
         A8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571349; x=1750176149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ApHhApDe322hB30Fse7w9VFo+yIfmGbQ5emSiYeKNY=;
        b=D51OYi9qDuFchrzFC1NAeNKo7mBtMQ/zUBs9kCEYSCQj/Hg9Xr3UcTd8dBX6R67Qg1
         0G99YLrLVvZgTqHRQ8buPDz7yV0T3XAM/Dq6AtG6jS+8YZVWb/uf8ZfsV/OPKkJ/WlBt
         jWSuDgkXE8QQTIq9/L26ZrRdl7fWbjVeeNugeh5fw/Q35r6URwNlj0Y6AeO6quFxwQ4g
         gMejzU8UNPOr3ErBIwGmSbORDs9iYA4Whfj6tWy1mYgcgPSBGsHcOYbs1vdiLp3Q0u61
         qUICuMDHzYAlgbl83k8DJ6FVy3YQR7rbjlPxgcdY8qR1Vvt4lFyKNTeNo/IJgt4e5pbK
         Q09Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL+5Mrwg02eSPPGRGy9q7TVs/ejNWjQ3+X44u61UBZitsO7MVZOF9s8zsZ82pdWC+sN8yeqIdoLxmvg2H7@vger.kernel.org, AJvYcCXo1XdTqeXBlVBZ/DzV5aMIlkPxIVSS9ITlApiw7ynPVaxV20ljXxD6Sdv6jH7bnOkqh9bjFLMRJWaR@vger.kernel.org
X-Gm-Message-State: AOJu0YzA4mHakviSXPzY+XmQm3yaJhMTaKcAnVML2KoiDRYlIMya22Hf
	BGwMoD4gsw5WT6PjSFGTA+h+kBMiihhDnFI8q1AbxXk4aVOs1UeAk/vB
X-Gm-Gg: ASbGncvJcRqEHxPpa5DPUKcpsIwl70gUiBSFDQemZotSCtmB2uU4/335jgjxiFJm3n0
	jAh9ssB/GuMgiiu8W29rnKT2ET7Bbn2AWk7jAv5ezZLkAAfKJQNIKwoG3QmlYf9mjpxIEYXzE/O
	sWuNZEEj9rdRndIP+gITHh4D0fASo5Ewx3ept4yglZ0RkBnC1JRSYkoUj/+WkWHhf+tLasMroQi
	cgf4+C79bzGkvJmPkDFYhGRZDrG+QLaoD6kjiEMa8Ox3DrZYra02mQIn47mg6JSi8nNnIyGj3Q5
	R+A/WJo4Q9P/TJc4NcOueGH5NW7ZqAdeRNehMx+ZDHGplwyhPpMk4jGic6pTMUc4XIXJ/myP+cu
	SD5+CvlOKW0MNRMtwQCbQrjQ=
X-Google-Smtp-Source: AGHT+IHSoBa8ZcJWksNpcGAtQt6xG8vZ9PxpTvdcpULBq5usdCTTV9sCqHBLSkFiGZ9cN/o6Et+0OQ==
X-Received: by 2002:a05:6000:290d:b0:3a4:f918:9d4e with SMTP id ffacd0b85a97d-3a5319b64b0mr11663701f8f.41.1749571348281;
        Tue, 10 Jun 2025 09:02:28 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:27 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue, 10 Jun 2025 12:01:50 -0400
Message-Id: <20250610160152.1113930-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
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
index 948b88cf5e9d..307e1671eccf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1397,12 +1397,14 @@ eqos: ethernet@30bf0000 {
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

