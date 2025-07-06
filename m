Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046C3170A11;
	Sun,  6 Jul 2025 02:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751770655; cv=none; b=bQyfLS29OeVRcko8Lo4X6TXXuCJIVBBwbbLopTloUlTxLhMB526+DSMs30Jh9uog3wvu5Bm6dMeY0B2ldVeI28umcVmLJzrVLxvr7oNS3cWeJdhk4Z2yPs/x/E72jQ4aaiQhtIF3+6upgICxriD9Nk8jgiYUMhMcGop+GnlwCDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751770655; c=relaxed/simple;
	bh=IVBiCayxxjuIoAWf7fWUyLznf6nyKVFK0/CzMq6+NGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7lnzUFx6jmtbBDbxGjX6jLSfDIYixAUE7GqR8rlq9rjTV06DWqrVKYBPrOERw0+dPN7spm6brBxyqYCO2j3bHibsbonboZnhYqF27mX66Y0a4DxSAhveoun687NOIkvj+WStyCJYDgFrJS3mOGMDmG4WWRRb0aX+Sbwwpyl78I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxZbJK12; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxZbJK12"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b4876dfecso30668121fa.1;
        Sat, 05 Jul 2025 19:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751770652; x=1752375452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=CxZbJK12U6cjn6pcQCbtPLyMhm66N/sEDQxmD7V54JXycn7pLWrhSRbCQf3dZo644u
         9OD+jVl6iWYMj2Xk0r39+Z0qnerb1W7vOTarVYCEk9ws7ZJOb9lpfPEel1TDT8FOaQEv
         ZQC8EMDzS9Yt0buLUIQTBsFoO8R6Rekp8TXC2af+JYqtDllXrMBChQnleuYfgyPwrqIw
         WjC1+olqhQQDqrjf2ejqVFTgqRKzJoFUttnkb6cYse5h4Zq9IrQn36EsUJbOBi2HdCM9
         znpTlk/PpRDq4spD2qlbNICYaci3CcbK6xO5VRwEm6eINYN5Qz9x1cUAep3ucFC3PxYJ
         0CfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751770652; x=1752375452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85nfx4ldL54wSVT5XtoQ/mvHVV77q6rK3dhp/Wa5E+U=;
        b=nDTgRg8BvNUQWLeou09gdzc/6ZfZ3ZSXu6G/tQDSbl9Etps5yGcP2NTZe9YYOOS0x5
         L2ys7vJ/dk/MfNjy3C42Mn/EXe9mxxII09Xfkh5EORF5W6jGf0d63GR4MPF3pv8FpCU4
         j4H9KQKde37iIqHkrP3dqSheNY4FC3NPbApaK/B38yBwh6XxcrxPHj+OrHL3Y2E2p6dB
         5hLx32ARL8D6QeAUCFlgej/FU2Fv4LDej7aC0qCE2Zx/icccGzLvoDu+0+isidk9wKqh
         dD+q2NlBeQ8kAFctShoCgsri7K6qF8g/WMjNBF0fEUI2Uh1CLxW/X+3qvOdFgOX5E3No
         tSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX00JRhddVehEvq3JtS5+LAPCx4nX4sDKWLoJJY6WoxBIRyPYbnIaFqbDE4pSs795BOG7CAid94sLYyhmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTt16eyWwj5CrtG+tDDgwhL7gi+6fndp4U/KuXC2V/N1Jv8u0c
	IfckP75Hyt6CynXYxDhY/S8csZ/LcqWX/0VJFSotmaKqVHov3IQHlF/e
X-Gm-Gg: ASbGnctNap9k95w/Y7fY/0lrCm207ycZmOlY9UX70pJGb/P9b7NCwPIjgCsdkaDdADk
	oewa/WgkjkvNERMJ7c4O8rFCOxjyoF+B5lSDnG+nERbs3i29uXLMzky9dGgDxMbKploKqgVyQZ5
	QAJYUg91Dam28iUIwJBhU1z7ZSjYFYYgI/1avprpeHVzT9VoQ222gy5etM50FiZqFf7gunQGNYb
	Gu4G4/lilvE92aNgjOPUbkDw6oErEPgUarjbKzP9x5D/1TEqEwuUh2cHC782usySxj5OXvKskvO
	GmgcEKPVhj50WypGtNEJbunXRbqpEWTrSKiNpEbMbBrUN93Z7zzxiPldi7brybAS1FEd0QI=
X-Google-Smtp-Source: AGHT+IGN0Pll4L+siyWkYqepxKdXBDqJA09V3lw+p6WVOCV2OpsJJsEpsce/Z0TPbGFyafElS4Xm8g==
X-Received: by 2002:a05:6512:145b:10b0:553:2bdf:8b87 with SMTP id 2adb3069b0e04-55641a4f68amr1665035e87.10.1751770651927;
        Sat, 05 Jul 2025 19:57:31 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b7b4fsm788573e87.198.2025.07.05.19.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 19:57:31 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: allwinner: a523: enable Mali GPU for all boards
Date: Sun,  6 Jul 2025 10:56:23 +0800
Message-ID: <20250706025625.2707073-3-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250706025625.2707073-1-iuncuim@gmail.com>
References: <20250706025625.2707073-1-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mikhail Kalashnikov <iuncuim@gmail.com>

All devices based on the A523/A527/H728/T527 processors contain a G57 MC1 GPU.

Enable the DT nodes for this GPU and specify a regulator that supplies power
to the SoC's VDD_GPU pins. The other parameters are set in the SoC dtsi,
so are board independent.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 5 +++++
 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 5 +++++
 4 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
index 8bc0f2c72..553ad774e 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
@@ -66,6 +66,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
index 59db10354..a96927fbd 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
@@ -54,6 +54,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_vcc3v3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 142177c1f..b9eeb6753 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -76,6 +76,11 @@ &gmac0 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mdio0 {
 	ext_rgmii_phy: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
index 5f97505ec..d07bb9193 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -95,6 +95,11 @@ &ehci1 {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&reg_dcdc2>;
+	status = "okay";
+};
+
 &mmc0 {
 	vmmc-supply = <&reg_cldo3>;
 	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
-- 
2.50.0

