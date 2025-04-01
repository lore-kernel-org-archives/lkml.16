Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36A20D4E2;
	Tue,  1 Apr 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522359; cv=none; b=N6jDMKQ3LLZ534fIBkKdMXzu0QwzyIJ6oycabZsUO719Wtq55O68Eqq6yN7E3Ll31JR8DeDxfjBRVnMDvdkTmLv8ggrW7xmAasLSha4eLE9NqX54tsrTx8F1q4nh11pQexs/pQSglfIvbYnCvsvYDLaPnHqc76jsr7zTJtF02H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522359; c=relaxed/simple;
	bh=J//n3r8L9iNTuOQOL0qo8qCeiMt8RdAvNa9RfQUe4ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k/Rvjxu8atvlvbNpaqNWELN4489xPm3xUQg09cHXslI+H4Dervqc8lWfFkXJzctA80CfLknmroqgMf+RnItkK97nPpH5d3vjwYFmzoaFbE1I3WsIF+3w7fgU2vugsHTCTtpBKGwl0V2z5iOMz2hLIro4SwPz+eRajx5ZXH3XfbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrnfLadC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrnfLadC"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so40207415e9.1;
        Tue, 01 Apr 2025 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522356; x=1744127156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vDwb9HDwdUl0Ebx/4UWYmvDHxD9AeyHufpsAE/MqOc=;
        b=VrnfLadC2wXjUACN9jktnA3S53BZdf0oOhYGDXSOS2Tyxdu4uVIOlOPM2NXQDKJphc
         ty9qYfCedF/3A/q/JdBiDrhqkcZvwnp9z+Ua1z4mS3N+AeutRKwRJsU4n4Jg4nxyHUf0
         v5BNwIzW2HBgwE71gOhdDornpm6pVyTaXmPMA/zQyGb7RDxh381USYwEFjdC9pLKFNX1
         FM8iBDOfNDtaTh6Zixagk0f8FV/dQ/akl+cLHcVP5Z7E+6t7dUjFIqdL+Gu7fZovxd1Z
         gznr/c9hsjtY/c7t2ifhI3A+BBgqfx5RU3ZbOXBkcbp14Ru/uNmqP2keZF9v5w6hG8g2
         ZgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522356; x=1744127156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vDwb9HDwdUl0Ebx/4UWYmvDHxD9AeyHufpsAE/MqOc=;
        b=dMKmaVPbGma/gfF3wiyJb/qQ3/hYQVZR/8KxbRlyqQqZ9PTfVP8cA3jdnWvEQbhtNU
         z8Meh4QeAYKKtxkrS+BQ8KkvN2NTc/fS2fcNCBoV/aWlD6gUg/O+U6ebWCHt4VFG7Chb
         ZBMAx+6RCnbO3CwyeVyPguD0Iil/CGqOsA6HFRcsHiDkJJiKSqaJcHz7wIu54JtNW5pD
         q9Iic5pFfnCJ9h39M68tfcXhXW/K/upPJ+wWd/cnlAICpskhHC2WUgZGJGlqxxLa2Jhe
         r4Wos09vwgxW2LSWemfTOmXPuo/PAJE0qOjCH9gFRhSIEFrfdlRwfmD2IX5sTFs3s0GU
         wSZw==
X-Forwarded-Encrypted: i=1; AJvYcCWhmei745ie/D2JxyayOOy3xr0XWv+jdscuiYh0lwbvBsMnTMfgCNZ8GDF6nhPKFDQoJjWYReNyvmY8J9qH@vger.kernel.org, AJvYcCXqJwPCqpKbFmNGETDzoGe3R/yQL57k6YXk9bWYtdup2LkIUDA/4KZC5u0iLp85vkw1EpoPRatDVneL@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1T5+efzKkhOS2Mwo5S6I6gEHTYYm4th9DAPf9VPA5082QMkjW
	jOU6lUX40+Mv7Ds+oUe16x0pstC3DbSFDHHRQY3Y/usGm4knlyfG
X-Gm-Gg: ASbGncvtL/x83PVcEdjI1liD7myAIcdWB/B6ZDT/z68QUqkmI6nSVwyZ3SPzuvubBQL
	W04liN8cph2OUfvz+bLIj8oDEIhRTU/C5pmnMREebl5ompTOMLKhexD7jeAEbLL1gQBSY8xoAun
	pBpiM0txrIyipJ7BdWOj12RBzDCDJ7HY8ZCZWTeUyZY4e1d417Q5lLJrEvyr15NJz6VwRVMRGtE
	AS75BDO/e4b2NKtvKhUOB4e7HkqwvJu85M7d0/uJESfYq3qZ7iXtyXd6kWhBSZJOrpBpFcGANV/
	KuG1m4yGHcCQpAweXn83AA/oJPpgkH5yqdKNirAJ9vA+oi28ifc5L/HLX9a7pyOBoi6X3vg6cQ0
	pW4MgQ3o=
X-Google-Smtp-Source: AGHT+IGdYh9AkcbLHhxheKqNkh4lODmhkDXHSRQLhJxdjuV8FbGHRILAROQeiewvtT5pJYBzkuZvJw==
X-Received: by 2002:a05:600c:3d8e:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-43db6228293mr144790085e9.10.1743522355870;
        Tue, 01 Apr 2025 08:45:55 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff042bcsm158795735e9.28.2025.04.01.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:45:55 -0700 (PDT)
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
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue,  1 Apr 2025 11:44:02 -0400
Message-Id: <20250401154404.45932-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
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

