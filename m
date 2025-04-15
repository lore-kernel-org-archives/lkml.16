Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675A8253B41
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 23:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744760050; cv=none; b=TenX1ZKOFzuX0j1wujI1ukWQzLL14cDjkXZRE3BEYmtSt5CGhiVk9VTX527e3G164TSxIy5ureEibcS6HQ+lt8bfHlJBuxCordcvrZumNLQATsh0Axr47QhQepfyPpkUnyRab4WLrfUoVAH0agCSm4yOY1wjj+PXaxB6QbDWUk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744760050; c=relaxed/simple;
	bh=0fuGOmb+qatmclqZbJkK38ISLNsb9lHUwwxPGIhTLTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lz/fYjdcxh1sOK1LIUNEnJRgLW22BreEd4OXiFAtD2WihOx3m+0zEW9VjBXbxLf8F4twq0GbvG6KRe41gNFDDzKXGVEJqt8H0dYd6tP7xacjAPTNWcG4VVm/APQzTfIxAA+9jozx3P2L0pFqZmeuF8SCtqwVPV9P+sGdvSBqqb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=Aov8f+46; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="Aov8f+46"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso4827155a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744760048; x=1745364848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
        b=Aov8f+46qD/b/ObjTyCBdl1mIZn8QHOgMXG13pfdyc8EhYog3lgYUwtHeH6chlI4QP
         j1IRkBkgv2nNstj3QB8OugsNtIYBmKZnSultsBolnsKLj3GJRkVyrkl63VCuEaeiX225
         J1wWkLh/5X4XWLTcUl+eVhcTu56V67bEg7YgcHr6geqgusi5LhyYpPqO2j7CsRXr7i7I
         jv3o6Z/DhbRlVMRM9hT9xtvemIpIWRXmvb+arr+yXeEC1aQp0WfcibYkld+n3jVZAYgm
         MYokGvJeur+xg2RU1pz99ZQCMr5eWuFyUOZiUe64iRIgtXorvFEyU0rMo9zfTrlrwaPp
         5D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744760048; x=1745364848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Hrq/5jnsaS2UvAtZ8/+V6NwQKUrA7NpnKCyv2FlWdc=;
        b=Lr1VBK2IvdifsBldIKR7AaiCu2fRMZFSkUBOVqrvBT1RdY5S0Q7fBXpJ8RYqO+rdrs
         MQD4Vg9RihxqF0TwDgHENg95fRyGLtLRGqRvHlyd0T4mxhK9oR7Y3I3HS4I3AXRoLVdZ
         gbMB2QbpX5F8Sdzef6CzUq7iiiqeSw8Ro+pK+qqtKYKl+WXx0oryzER+Nw7jHgi1g8RS
         0OdKOYixgb/4CV31J0/ZfEgvMAakAVQaUf5vD7QR3060muxIB1+ILtTItIcqEyIklhQ1
         Y1FexSHZ2EBq5nftUzhh6CR3gVSD1ggfAGNKdg18nB3hdmR8JTsFmOi6lATKuX06Trjb
         7GVA==
X-Forwarded-Encrypted: i=1; AJvYcCULXwhOhGLI4qcw/Lz8t16T8suvtw0WuknuGgz0hEdsbUK3o/qSD60DbGIAbqE1Gi22vEUVWpflEJcPpkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcVe6uVtpJ7wIRaU3vh7C7lNCaBa5lgAbFAHtyxEdUFX4NvpA
	1t32V4f4JpSJX8Hnx7na4VmAUbV7dz6el6iq3Yuf6baBFAxG1q+iYAdxoIiRWWLI0Gv/D88Eeni
	g1zM=
X-Gm-Gg: ASbGncspe/A8ex8Q/Hw+6Amrgs8xK52Emy903PoddaOCcpWnBgqibt2hqjXCjHjjJcd
	rTkxn0XHhU0IuqI5CoZBozNSrGGpTasx7Pn1KL6I4IiSXtmv3gjiAhfoKVvAXwYDpgYtWIs/ZwH
	E+f4OfJtfHHClPUTDCfYaaaC4EhlpLDPyM4wxjhVT3Z+T8X+9xiH7HR+mAeOrTB18AP6V/g34NG
	ssYI+0KwWGU98mXLukiT79alLAiKMsdqEqAQ0Do3GkW3M05kkacLGNX99Si2by0Ks4Up+eMa4/D
	28lIn4DRjMhWd9WRFtV4C09EfK0uiBl3iedSA7kl3OBifwee0IfzIiWNiHVEj+UeAC/Lco60F3H
	KLMCPK2d3hNzGLm3JBywjj7OmNAk=
X-Google-Smtp-Source: AGHT+IEfEDwFMRmNLgi4NTTzWD2Cmv8qP+8plZfNcu4lPBsBXAVvMOeIdGNyZlsubwfe4N/9/Y6P4Q==
X-Received: by 2002:a17:90a:e7c7:b0:305:2d27:7ba0 with SMTP id 98e67ed59e1d1-3085eedb4d9mr1387639a91.6.1744760048494;
        Tue, 15 Apr 2025 16:34:08 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613cbff8sm171782a91.49.2025.04.15.16.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 16:34:08 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH] arm64: dts: nuvoton: Add EDAC controller
Date: Tue, 15 Apr 2025 16:34:03 -0700
Message-ID: <20250415233403.2052913-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have the driver support but need a common node for all the 8xx
platforms that contain this device.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 4da62308b274..ccebcb11c05e 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -56,6 +56,13 @@ clk: rstc: reset-controller@f0801000 {
 			#clock-cells = <1>;
 		};
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm845-memory-controller";
+			reg = <0x0 0xf0824000 0x0 0x2000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
-- 
2.49.0.604.gff1f9ca942-goog

