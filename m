Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8D522155F;
	Tue, 15 Apr 2025 17:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737670; cv=none; b=k1uuWn/PqjLZJE7RiDkKsJTMQBOc/T+bdUheccMCD4CfCwPYyooOO6lkMxLRnJ51LYBFXy9/my5UZH6Kr5cq80BF+6rN/u8GfNXBacBmYloWCqRaQguORUJ3YAS36l66v+oL9xkgqG0fRbc75cQ4xSWw41ryw7knplfWr36gB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737670; c=relaxed/simple;
	bh=i/623J9RhzwazO09b9AuVaXf4VhtohpFAm02gcyGGEk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uqNv4VrLmQyWECQrAzPaBhA47GbN3J/nvWzTWWMe/+cST2s8eMM04tZfVy9YQO7LyntBgnht/+rBVbpq3gkr2FYbtrDwDaaa//AgQ3WzQX9uK3/LS0C+Nft5omE14l5KpH/Z5fvqxGdlFRb6wYZ8cdthbUjTwZ/ZefXD22CE/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcA8+a6w; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcA8+a6w"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so48615155e9.1;
        Tue, 15 Apr 2025 10:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737667; x=1745342467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=CcA8+a6wPVwWkGngHJguQ/ciXEcwMj8IfzQCr75AGtU7Mes+dqQYy3Pv2SrRb0iauE
         D0MDTANI0WnXyuj6iWvn7tKKnz84zsHmxkrrofRH7gTJOMMEeDVTxacc4NYxy8LNpce5
         ML30evTKJKga8tVsajz5xt2R+7p5Ft9wbjnmTavr3ZKZcrgq/gJaVEBDsN6dR6N6zqRJ
         Vu1m6y0z7tjAHJfkvrs8NDcBnMNliZJH51/06Inf0+kFQXzyq0M526pxBYePTKjd40ec
         yGSfu6nZVtC1Y3wFEU+CUY38hoH2f0wlPkL+4TM25bjFs8sHsVn6uzUnTMZHlAOV3Vn6
         MnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737667; x=1745342467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDMY9SZRBf4/sxBsgjkGyJScAm+G1kZtC9xjm4IFOEk=;
        b=v/vPAYl24cxX9D8Wwq1Nlt9/dnDPX2IAhLoSBHMpe0u5LydFuj/fvACo39yN3CdDza
         UYzn4yaYGhyE/J7F+gflhfKLT2WMMqEmx9CZBBxrY54rusX8mPH53n4ctLjcQRA9xJ67
         e4CwyI3O2H1leGY4plkB8uiikEOn+/aCBnm4mHWwLfMnIGK6x2/7LNcBKbXi87s6cQJs
         nFh+WC/fwcEwYI8KTO6YPHEeyzzVJFyDtP5Z/wFZGVq+TDqNtwn9UZZyU1/EKphWUq1/
         EB0xkZyVEs9wi+29aYnAvEAxfOjlsh0uzQxOy7ReXPsGuVQcjD+06aQm3QrQZNkGsxLN
         mC1w==
X-Forwarded-Encrypted: i=1; AJvYcCU+hp2SbelNXl33nbPPd9R+DxDBVk8yISDTlBpATTa8yQUx0aBpbQO5DKlh94uX+y0gBbrviONiRJt4c/aj@vger.kernel.org, AJvYcCVgYBZNYMXlelEWmUp0Bs79MEzb7XkPeY838u8wG7GzwifaqymCi/1A02whX76/R0rAVr9y6vlsLccG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQRbSYflyDYdqSX5j5AdviaaM9iZ2G1KmZbXe6bD2enNUE2YeD
	nonlwZPVi3L/B1Alb6frkJlhUBzjZUKBDCZqYbqulTImHwvrkV5KEziypFPe
X-Gm-Gg: ASbGnctDNhOOnuk8ZBJRh2mL+r+/+KYGroymoYVdAhVspS/nqjAf6wmYyq1ezZj6gNE
	E5+qN3r5a9apniw3jShL210CWuwEIKlmk5NFAOI6ZdzGi083b9i/BorkEjyOChxQ1HMLAmhVp4I
	kqwqNo6SubEBQknjE9wt7fbTsGzlksv4QmpvWdhpaqU4KAQ6nP4T17XAfDiLlWQaKVDYNZXlyFn
	1/oQtVsDKHuufm0fElMctoIX4UjORM4Sw8t3mMQ8NritwgP9eRIHIk653d26IAf0dhsUuI6AKe0
	++kF70DGMgoOQd4LyBjjqxJCajvigvFGIVdRN/7DmCPtzz825Lh0NNfO5j/n9nPXa5cB5fKQ0QY
	rsQw=
X-Google-Smtp-Source: AGHT+IHH3wzGSWrXRiwit47ROGdwVoqHne1P5CZMV6a2MyKyXpYB1Eq3JNyDUMsp35H0L5HNUwnmmA==
X-Received: by 2002:a05:6000:178d:b0:39e:cbca:74cf with SMTP id ffacd0b85a97d-39ee2735d3amr321139f8f.6.1744737667435;
        Tue, 15 Apr 2025 10:21:07 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:07 -0700 (PDT)
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
Subject: [PATCH v6 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Tue, 15 Apr 2025 13:19:17 -0400
Message-Id: <20250415171919.5623-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
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

