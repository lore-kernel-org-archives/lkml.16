Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B670A29293D;
	Tue, 15 Apr 2025 13:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722016; cv=none; b=QxuWuhJ6nkCbVlbDXxv6e8r4/ymK8em8MBaKgar6yPIrpyM7LPz4cB0ptAbQ0jRixfMGGzPW/KpDYZjfkSbtiury92yr6E+eUr1IDN4aV8+eYpCTgF18iD6fRvbh2pgEC7ItcBZ4w3E8V8bILnmxzuqqjIOJ2hYAHuZNYfInX1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722016; c=relaxed/simple;
	bh=hfINRD4bSH0cLxjdP023k9Al6B/oVFWDGGm32apHwek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cs5rj/HK7v3O4cl8ylpFdwD3Jz0CRowz9wb3CyHTeU9lFWNBiQJVnBDYimdwy5r5l4XummNiyMXAOyxN2qwnGuAhuOggidYggMvITNyPd1nlF9ft6dGrkMgKargfLVb1/vlz22PTSEAtBEwg8BoSkP6saBr6+YucEHeCEjqyl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=N0Udw45u; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oibkwhhz reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="N0Udw45u";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oibkwhhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744722012; x=1776258012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mr8rthGcqLK7Mf5XXYhtFQ4qJ7aDekEwjv3kA/so2hA=;
  b=N0Udw45u0vPH/5nmwsQxE9zpvOno3LQBKPFR0qD3JNjq27KEB66v+7oB
   WQvJSZsvzZVX0hWj1IrSs8CYYMpoCT77uno5xjZ0B1QoGqn2836BATib3
   SHioI/x461uwoUivayrJ3S8/ThssO/M4XjFeNxFNLoxV8DyasTah4GMlh
   hLw8GAkbuYoWPL81ll2li7f98kHcNIX/mR3f1BhKlm3T/f9SPFngnMMXj
   mfzejVGyK6GcLr9uXek+uhWOoHUz86mLtZO3Rplg+9IV3VNr5M+fvYJiV
   voGAVxbGTh1iQXnha7VDgkAr8jfW3eDl/2gW5zq5Tc280n5Tc81ew23Gf
   g==;
X-CSE-ConnectionGUID: +YsFePFsSjiX9HIhy6CQXQ==
X-CSE-MsgGUID: 0OIt+IaESVWx8+v0BSCwzg==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43542776"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 15:00:02 +0200
X-CheckPoint: {67FE5851-4C-903EAEAC-E04C76C8}
X-MAIL-CPID: 3FE6A481E607086DC6325BF8FCEEB780_5
X-Control-Analysis: str=0001.0A006368.67FE585E.0033,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 587F81658C8;
	Tue, 15 Apr 2025 14:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744721997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mr8rthGcqLK7Mf5XXYhtFQ4qJ7aDekEwjv3kA/so2hA=;
	b=oibkwhhzz1if3vEMd7zeGUaN5QlCXvsoH1uj54uu/tJSxBkTW9VhsDyV+5uDtnMRQbUUV4
	dDPWznXeaIvD2PuZROqJf1muxZJmR86ALUkVYJ9tmqZtUstrxZTk/h5sT3Tah/IjvIzKk8
	dUlg9GeopnYhgjggrM5+hyovHq0HHHZeJTaulfesGbhLbp0b154mVwiCJlcD3csBbsKLVG
	a4XIWry5zRacrrMmRVopQ8bwjNwi2qbUs15IQWpOR5jzdZ8V3fFHnixm8Z1dGVJgYWXA22
	pKwx9q+3kDY5VAgNzZiQZiMRfJKlOLZtqTAjYecfTCTuAJkkZPnoA2mDCuF7sw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt-bindings: arm: add MBa91xxCA Mainboard for TQMa93xxCA/LA SOM
Date: Tue, 15 Apr 2025 14:59:44 +0200
Message-ID: <20250415125947.429121-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Add MBa91xxCA starterkit base board for TQMa93xxCA/LA SOM for
parallel display evaluation.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0ce2653066e91..a6fd347de03fe 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1374,12 +1374,16 @@ properties:
           All SOM and CPU variants use the same device tree hence only one
           compatible is needed. Bootloader disables all features not present
           in the assembled SOC.
+          MBa91xxCA mainboard can be used as starterkit for the SOM
+          soldered on an adapter board or for the connector variant
+          to evaluate RGB display support.
           MBa93xxCA mainboard can be used as starterkit for the SOM
           soldered on an adapter board or for the connector variant
           MBa93xxLA mainboard is a single board computer using the solderable
           SOM variant
         items:
           - enum:
+              - tq,imx93-tqma9352-mba91xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa91xxCA
               - tq,imx93-tqma9352-mba93xxca # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM on MBa93xxCA
               - tq,imx93-tqma9352-mba93xxla # TQ-Systems GmbH i.MX93 TQMa93xxLA SOM on MBa93xxLA SBC
           - const: tq,imx93-tqma9352        # TQ-Systems GmbH i.MX93 TQMa93xxCA/LA SOM
-- 
2.43.0

