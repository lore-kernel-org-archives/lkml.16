Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4227C863;
	Tue, 20 May 2025 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747742987; cv=none; b=Pw7OHTPsG9kQI+sR7XxuzcWEEFLG3jMQuPijo2efdwNRHo/cJe1JkjV7Gdq200KEScgsDgpUZm7ImmZfAmojDqhEl8RMEZ+Oz9qvt+KlQIj+ncQdortbJBLU08rI3ujjOc+FI0j01DEuH2pPhQFwN0VOiglZHJz+Q5PsZnBJuZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747742987; c=relaxed/simple;
	bh=9GLuEQ++J6Qc8EWr6+zlrM8e9bZk28Gdib/STpO1trY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0ZbIbaelBMoybJoVbekCkiF5BALml1xrO3gJ6dS3xJOs4cU5miirHBYkGp36W8bH3QZdwZZKEFqoPL/ucA5+WNbffz9KV6bYA2T+ec5kPGYs/j6oKShUOkI6Py0vknMlT9tEU/vCQCubu2OcjU/aNxZp1ZjC6SNVCKkPHvvK2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=DZ1SMbIw; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=PkyWP9o2 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="DZ1SMbIw";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="PkyWP9o2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747742985; x=1779278985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kb8yOWD2SiIrBRXQUwBCkGRdlFJUWL5tP/E1dNrLTJA=;
  b=DZ1SMbIwAGtvndseDe56GkRBxhaON4EbQDtsqCgDnXlRKOAkqL2boiEx
   P8FIPhXr4PQNBYgB7GLpWYkgvY100VDbQ2FBjf0WpYNAus6aqWR1L9C//
   CQq2WG/pI9BXNrmZNZWLkI5uoLhesYfFt8vsUqLSyyLNuXMNc9VPoK1c0
   af4Id0w7kyd2RKstP8s+7I0yYLutdfc7C+J+pv0X2losou1Z+TWynPZTs
   lCa4l1eBefzpxKvybI+z+r5Sj198gr4xnenPoXLg3Hix40FBTi8QBgfMh
   0HlVZIZfkwwmeIzk0nriQyOut2wC3YONxwa1m0zq+pwX0rogqrM8wsc1u
   w==;
X-CSE-ConnectionGUID: U7BqYBSxTNaZOtyCw+nueg==
X-CSE-MsgGUID: rF3hdTvdS8+rZlHUcoWiyA==
X-IronPort-AV: E=Sophos;i="6.15,302,1739833200"; 
   d="scan'208";a="44182565"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 20 May 2025 14:08:33 +0200
X-CheckPoint: {682C70C1-5-BF62DDF1-CB8BF55F}
X-MAIL-CPID: B419E8CFE1EF68CF796833D42FEF4458_1
X-Control-Analysis: str=0001.0A00639F.682C70C8.002F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C489163BBB;
	Tue, 20 May 2025 14:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747742908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kb8yOWD2SiIrBRXQUwBCkGRdlFJUWL5tP/E1dNrLTJA=;
	b=PkyWP9o2yye8o5cWieV9x3S5hzYTFj4HFX6nCyqYJSmwrbwCzgDP0GpBFoz4JtrIkvSUbt
	YE8MguMpFcZcWacZ1ReYxuhFyIl3CZXVUBlUGTs5bXZZjdyp8363Aq++AA3VwDIi6MAj9n
	eT4RAUanWq7W2MTzjF9R+OF+KUYOhL0O9/DLj2DbIqYctS8kG2H6v6B5fkiLEllhBR8s1S
	T/3uufqmJd+irx+aKM7wUUZkW6ra8/SK8mhPQdTvIGBa9crhfQQr/3+ukvvRmzB4ooZ0X4
	EgWFIDm5Xjq6L7bjW2BZuMcCfaAxlt23LuaPXRYnTm0d4spafhU2nr4hViNfgQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: tqma8mpql: Add EASRC support
Date: Tue, 20 May 2025 14:08:19 +0200
Message-ID: <20250520120820.890252-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
References: <20250520120820.890252-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Enable EASRC support in tlv320aic32x4 sound card.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Note that the firmware file /lib/firmware/imx/easrc/easrc-imx8mn.bin
is needed.

Changes in v2:
* New in v2

 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts | 1 +
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi         | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
index 23c612e80dd38..33cd92e63c5d5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
@@ -235,6 +235,7 @@ linux,cma {
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
 		model = "tqm-tlv320aic32";
+		audio-asrc = <&easrc>;
 		audio-cpu = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index 6067ca3be814e..fd70b686e7efc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -30,6 +30,10 @@ &A53_0 {
 	cpu-supply = <&buck2_reg>;
 };
 
+&easrc {
+	status = "okay";
+};
+
 &flexspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_flexspi0>;
-- 
2.43.0

